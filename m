Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F261A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DlR3Ie7U;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=FQlDX1vY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=69kA2IJeObGIRoAWKGB76zZH1kEcPO2wWCoJYenFup4=; b=DlR3Ie7U6189zgfu0mm9XGKEi6
	wK5rxoo4losdT/3ycH+lMlySMgM1WtSupCTbrw9axproqzcJdfQrcv8lQy5BQUGhuqSSVcmbXcwe2
	UKHTlSr92rGBWxHRgHqCiPXQm79CGKQYV0JPvmRlJW4ZBztl0MOcxwLFV33H4EDwvcmTqYTAVIhcw
	FXhiE0QF4+kZ5KNvV95+XE+p/PHqkoRTOz10tUtYb4Su4IkLXlxxZ65cblB1viNIt36sMeR1ZZDHc
	4+sDtXtqbVnhtFrhbWPG+m387+x601C/q75nSPFwYhDHWdU6E+rxNYSLDOwVI+euRXQieyQIlYM/T
	Gp4DIO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgXY-0000000AwxG-3mvj;
	Fri, 30 Oct 2026 06:56:40 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgXV-0000000Awr6-0V8S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:56:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=69kA2IJeObGIRoAWKGB76zZH1kEcPO2wWCoJYenFup4=;
	b=FQlDX1vY45Y8rFJ055G0X5CO2TNl8+lGTkd2oPy6DOARyYG0O8WkES0Sd4rrNMxHH+tB5bDvU
	/3hLoPGm0DP+zmbUTHn4CDC/poxmkij1YRiBE9w3v63V+vaaU3yCFzUkZURDA4dIpgVKo+sk4dC
	JCvE6tuansYJGM6nJAB2XPw=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jGBhX2x83z1cypC;
	Fri, 30 Oct 2026 14:56:12 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id 5776D4055B;
	Fri, 30 Oct 2026 14:56:20 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 14:56:19 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-doc@vger.kernel.org>
CC: <maz@kernel.org>, <oupton@kernel.org>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <zhengtian10@huawei.com>, <linuxarm@huawei.com>,
	<kristina.martsenko@arm.com>, <pbonzini@redhat.com>, <fuad.tabba@linux.dev>,
	<joey.gouly@arm.com>, <seiden@linux.ibm.com>, <prime.zeng@hisilicon.com>
Subject: [RFC 4/6] KVM: arm64: Emulate TLBIDIDR_EL1 with virtual domain counts
Date: Fri, 30 Oct 2026 14:56:15 +0800
Message-ID: <20261030065617.4090073-5-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261030065617.4090073-1-yangjinqian1@huawei.com>
References: <20261030065617.4090073-1-yangjinqian1@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk300013.china.huawei.com (7.202.194.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_235637_464636_10D3429B 
X-CRM114-Status: GOOD (  11.69  )
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Guest-visible TLBIDIDR_EL1 must carry the virtual domain counts
rather than the physical ones. Compute a synthesized tlbididr_val at
init time that remaps the NVIS and NVOS field values into the NIS
and NOS bit positions. Add an access handler that returns this
synthesized value on read and silently drops writes. If vTLBID is
not enabled for the VM, the handler injects an UNDEFINED exception
into the guest.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/kvm/arm.c      |  7 +++++++
 arch/arm64/kvm/sys_regs.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4dfea015eaaa..ddf7c25f9ed9 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -230,6 +230,13 @@ static int kvm_arm_init_tlbidomain(struct kvm *kvm)
 	vdomain->nvis = min_t(u8, FIELD_GET(TLBIDIDR_EL1_NVIS_MASK, tlbididr),
 			      KVM_VTLBID_MAX_NVIS);
 	vdomain->num_domains = -1;
+	/*
+	 * Guest-visible TLBIDIDR: the NIS/NOS fields carry the virtual
+	 * domain counts (NVIS/NVOS), since the guest uses vDomains.
+	 */
+	vdomain->tlbididr_val = FIELD_PREP(TLBIDIDR_EL1_NIS_MASK, vdomain->nvis) |
+				FIELD_PREP(TLBIDIDR_EL1_NOS_MASK,
+					   FIELD_GET(TLBIDIDR_EL1_NVOS_MASK, tlbididr));
 	/*
 	 * The four VTLBIDn registers hold at most 4 * 64 / pdomain_bits
 	 * vDomain fields. Disable vTLBID altogether when NIS is outside
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6a025e1f3161..cf9804e54ff1 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -615,6 +615,34 @@ static bool access_vm_reg(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+#ifdef CONFIG_KVM_ARM_VTLBID
+static bool access_tlbididr(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	struct tlbidomain *vdomain = &vcpu->kvm->arch.tlbidomain;
+
+	if (p->is_write)
+		return ignore_write(vcpu, p);
+
+	if (!vdomain->guest_tlbid_enabled) {
+		kvm_inject_undefined(vcpu);
+		return false;
+	}
+
+	p->regval = vdomain->tlbididr_val;
+	return true;
+}
+#else
+static bool access_tlbididr(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	kvm_inject_undefined(vcpu);
+	return false;
+}
+#endif
+
 static bool access_actlr(struct kvm_vcpu *vcpu,
 			 struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
@@ -3562,6 +3590,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_LORN_EL1), trap_loregion },
 	{ SYS_DESC(SYS_LORC_EL1), trap_loregion },
 	{ SYS_DESC(SYS_MPAMIDR_EL1), undef_access },
+	{ SYS_DESC(SYS_TLBIDIDR_EL1), access_tlbididr },
 	{ SYS_DESC(SYS_LORID_EL1), trap_loregion },
 
 	{ SYS_DESC(SYS_MPAM1_EL1), undef_access },
-- 
2.33.0


