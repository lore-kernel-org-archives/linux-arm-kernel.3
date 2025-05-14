Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCEAC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTTL9dQEScHE4pj+G94YjoxirJBT5idVWapzbvs8BzI=; b=bCSO3uKOc/lf2PLAzKzOow5YTi
	KL3KQWKI8eABe9jofCqGpEZE8y/rULN+fjAlPmMWuAW49si4zaSl1srHaK2NCO1getkdwp2b8rMk6
	9fIg0jml/oPpJxMY+1+ZszVjz8xqVDLtUk0/PCOwbd/+tSt8+JPwi3X+7zAV65IG2slk3YI2AtSUi
	HyHsqsaaz8xYAkpTbob+Xhl2toIF/9DcpXpXIo3wHDomX8SpfdEGogHJr9YT6dLAzBR7KQfelOHOS
	ZfkLO4NgNcwdFAwKFvTPOEzWbDrCANM02doLBUDsJUVpIt1jskASLID212Y4VWro+hrF/7lzBNoMr
	zFh9J3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBPm-0000000F763-18KL;
	Wed, 14 May 2025 12:40:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9S9-0000000Enpl-1bS0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 10:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 669DF5C664D;
	Wed, 14 May 2025 10:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A04C4CEE9;
	Wed, 14 May 2025 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747218908;
	bh=ydvZE2fcKiHSXxy2PEWqOT/2J5DSfX2LWTaD8LM7MhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JtzEH0np12lNKx3ap5NwvUBksnYfYriQ4eBqES19F26xHcOUUnyXH7UvuioS2Azxz
	 XQPa3085T8H4UARolu9fDyZcy4NrP2017E0qwYZ82MfckuuqersBKkcM2MHItU47ga
	 URdfAXWzv94iqJqIf8Ywj3LawAYfNg7R4YT6QJ2EsQHZyT8qYW+I2fbM8rt52Vjeab
	 iuNjdziwTcBDLIgoR9QcxOzrSp6wca5mwhr8BkbTlkmDEIjHZBibXxzJf6pSbitm0m
	 QNF9ExUUnf67uC3i034bMxeiCe9XKn9qLGWmCZtmIg2llRGruWQ9KeT5fkc+rn1i5s
	 n6zHr9kcpw6Cw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uF9S6-00Eos3-NZ;
	Wed, 14 May 2025 11:35:06 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH v4 12/17] KVM: arm64: nv: Program host's VNCR_EL2 to the fixmap address
Date: Wed, 14 May 2025 11:34:55 +0100
Message-Id: <20250514103501.2225951-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250514103501.2225951-1-maz@kernel.org>
References: <20250514103501.2225951-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_033509_511367_546EF3CF 
X-CRM114-Status: GOOD (  15.97  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Since we now have a way to map the guest's VNCR_EL2 on the host,
we can point the host's VNCR_EL2 to it and go full circle!

Note that we unconditionally assign the fixmap to VNCR_EL2,
irrespective of the guest's version being mapped or not. We want
to take a fault on first access, so the fixmap either contains
something guranteed to be either invalid or a guest mapping.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 220dee8a45e0d..5eaff1ae32b29 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -48,6 +48,7 @@ DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
 
 static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 {
+	u64 guest_hcr = __vcpu_sys_reg(vcpu, HCR_EL2);
 	u64 hcr = vcpu->arch.hcr_el2;
 
 	if (!vcpu_has_nv(vcpu))
@@ -70,9 +71,23 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 		write_sysreg_s(vcpu->arch.ctxt.vncr_array, SYS_VNCR_EL2);
 	} else {
 		host_data_clear_flag(VCPU_IN_HYP_CONTEXT);
+
+		if (guest_hcr & HCR_NV) {
+			u64 va = __fix_to_virt(vncr_fixmap(smp_processor_id()));
+
+			/* Inherit the low bits from the actual register */
+			va |= __vcpu_sys_reg(vcpu, VNCR_EL2) & GENMASK(PAGE_SHIFT - 1, 0);
+			write_sysreg_s(va, SYS_VNCR_EL2);
+
+			/* Force NV2 in case the guest is forgetful... */
+			guest_hcr |= HCR_NV2;
+		}
 	}
 
-	return hcr | (__vcpu_sys_reg(vcpu, HCR_EL2) & ~NV_HCR_GUEST_EXCLUDE);
+	BUG_ON(host_data_test_flag(VCPU_IN_HYP_CONTEXT) &&
+	       host_data_test_flag(L1_VNCR_MAPPED));
+
+	return hcr | (guest_hcr & ~NV_HCR_GUEST_EXCLUDE);
 }
 
 static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
-- 
2.39.2


