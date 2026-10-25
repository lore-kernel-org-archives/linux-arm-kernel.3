Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486EC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JVFjbsok;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n/kLLYr8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZBJQD9CEX8BSoBmqxIKznqV9jSK1F+2qL8QO29Cd7to=; b=JVFjbsokTvOKM1
	fXwrXQCX4I707UgSoqE0qKllmrZ2gqBSwDUUw2GtcmmW19YakYoRIo4Lnj/7GRSmVmYk/3yasThYY
	KW+nVMCzhr7VkgxqDcqTjgIZ1HIGNQaq9kzWPtcvZ1nkltyHea7McwTVdaAFvZOxkA8ZeeXXBun5j
	bu5hpRmH9IENBcTjBnIxfP671NIzfkOM83xzkkhfAqlOOnESC0i+bf4Xpq1Wt5mzAYQsTGxaf4IOM
	HCQcxBmYbaj18KCBZLuiy6xuPHJJ9AV8etlmXqHjmo/jvoLeBL8EwY/iosgEBX3HbaS11HFV62g7P
	hW7IdDNp4xjHSTJyh20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt1P-00000000qv0-0RHQ;
	Sun, 25 Oct 2026 07:52:03 +0000
Received: from out-63.mta0.migadu.com ([2001:41d0:1004:224b::3f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt1H-00000000qsA-2JEm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 07:51:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4/HL2d4Nrhce67FzGis9vXGrK25cQYCUC9c0XAxPHEk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792914713; v=1; x=1793519513;
 b=n/kLLYr8dscJbvlScpg92+xPBfNLNwxn35iqvYOUP/RSRSYfC1M+Aa649LCqbY1/ND4BdHbM
 wrhM3EvT/dAMsjaHqhxhD7ii2xHbi5fib28O2wpkQUvNFuBJPeJWFoVpMjMsI89WzpH9WKOpafZ
 r3Tdzh08BXpsgpTcaStnMY+c=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0235f86465034b12;
	Sun, 25 Oct 2026 07:51:53 +0000
X-Mizu-Trace-ID: 0235f86465034b12
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] KVM: arm64: Add ACCDATA_EL1 to the sysreg array
Date: Sun, 25 Oct 2026 07:51:35 +0000
Message-ID: <20261025075138.2919734-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025075138.2919734-1-fuad.tabba@linux.dev>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_005155_730687_4D83913E 
X-CRM114-Status: GOOD (  14.09  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Marc Zyngier <maz@kernel.org>

Make ACCDATA_EL1 a first-class citizen, and add it to the sysreg
array. Visibility is conditioned on the feature being enabled.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20240815125959.2097734-4-maz@kernel.org
[Fuad: rebased]
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/sys_regs.c         | 12 +++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7a..5b1cd1f502b7d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -498,6 +498,9 @@ enum vcpu_sysreg {
 	GCR_EL1,	/* Tag Control Register */
 	TFSRE0_EL1,	/* Tag Fault Status Register (EL0) */
 
+	/* Random stuff */
+	ACCDATA_EL1,	/* Accelerator Data */
+
 	POR_EL0,	/* Permission Overlay Register 0 (EL0) */
 
 	/* FP/SIMD/SVE */
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 44aae52c473d7..40f8be41da3a4 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2914,6 +2914,15 @@ static unsigned int sve_el2_visibility(const struct kvm_vcpu *vcpu,
 	return __el2_visibility(vcpu, rd, sve_visibility);
 }
 
+static unsigned int accdata_visibility(const struct kvm_vcpu *vcpu,
+				       const struct sys_reg_desc *rd)
+{
+	if (kvm_has_feat(vcpu->kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
 static unsigned int vncr_el2_visibility(const struct kvm_vcpu *vcpu,
 					const struct sys_reg_desc *rd)
 {
@@ -3601,7 +3610,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CONTEXTIDR_EL1), access_vm_reg, reset_val, CONTEXTIDR_EL1, 0 },
 	{ SYS_DESC(SYS_TPIDR_EL1), NULL, reset_unknown, TPIDR_EL1 },
 
-	{ SYS_DESC(SYS_ACCDATA_EL1), undef_access },
+	{ SYS_DESC(SYS_ACCDATA_EL1), undef_access, reset_val, ACCDATA_EL1, 0,
+	  .visibility = accdata_visibility},
 
 	{ SYS_DESC(SYS_SCXTNUM_EL1), undef_access },
 
-- 
2.47.3


