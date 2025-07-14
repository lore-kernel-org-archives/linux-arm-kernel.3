Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87094C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwWJSNu2bReLdl1G6tBDCFvheQrcMqe+oxzO+DQGNrE=; b=NC6ZlZfubSgFCr6kLnk2hbrf69
	5vQD87PxmSVzdSjOsZ4FG0KwUZ8clNeGaFH0kE9MqTkWL+JpCVEPx0z/hRADq4m0YxDA7BJ7WZfQ8
	pTIqmDggfwnmcUFApaZWxLB7HHz8wCCLfo2z19V0ItZNaUs94GlEllXl5eQucCD632GgIreTiBwym
	msJhg3DqN9rogcqQ2GAr36ttY79Yers6b1RT3J2exrG1WrJ9QUJPl0HfZdO4invX1lEm6jj0iYhhI
	YE65EeiC1CKuP+3h/aLgZRPnCjVxn5gRG7u4gfkYPOoEroR4dgT4+Hl3IkjZDsU8BU96VmcjHCTZW
	NZi2dRXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubInA-00000002Dh9-41Cn;
	Mon, 14 Jul 2025 13:00:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGb-000000029jW-2kno
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA598A57057;
	Mon, 14 Jul 2025 12:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76A0C4CEED;
	Mon, 14 Jul 2025 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752496004;
	bh=6cRlVYQO5KDpFDlBQDyUNZ44UIGHzPzKFtGAKSIg/Xc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b60C/Shss+qli+dHD9XaaGygPPKv5b+Rq2wuCuSlFlljNlEHz/vE2rqJRY+p62ofY
	 4jCOSP/+w66+4XX8r5C8zOEVhGD53wcho/e3iIywX7XYnTPOopDNHwyHx0EWOXYChF
	 SA0r/4k+MEWIlApVXB+V/JKHqDV5DjNrmCc7DmltfdxejR4GnGrVt1YqbgsyRVj8ib
	 s4NkdIF8JEJfQ5RAvojxa0j98djC4WL9twk17kEyjJQLTJnXprx5BJoqxnZTWnOj5U
	 a0DNXEG4VNty9NuDlcdaa/OxLVR8pDNX5RhIxnpH8UREWyiKGpdIShHVB/9d7KCO/5
	 YoZXXnjftj8ZA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubIGY-00FW7V-VQ;
	Mon, 14 Jul 2025 13:26:43 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 07/11] KVM: arm64: Condition FGT registers on feature availability
Date: Mon, 14 Jul 2025 13:26:30 +0100
Message-Id: <20250714122634.3334816-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250714122634.3334816-1-maz@kernel.org>
References: <20250714122634.3334816-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_052645_875239_E6102FD7 
X-CRM114-Status: GOOD (  12.49  )
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

We shouldn't expose the FEAT_FGT registers unconditionally. Make
them dependent on FEAT_FGT being actually advertised to the guest.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6763910fdf1f3..b441049368c7e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2592,6 +2592,16 @@ static unsigned int tcr2_el2_visibility(const struct kvm_vcpu *vcpu,
 	return __el2_visibility(vcpu, rd, tcr2_visibility);
 }
 
+static unsigned int fgt_visibility(const struct kvm_vcpu *vcpu,
+				   const struct sys_reg_desc *rd)
+{
+	if (el2_visibility(vcpu, rd) == 0 &&
+	    kvm_has_feat(vcpu->kvm, ID_AA64MMFR0_EL1, FGT, IMP))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
 static unsigned int s1pie_visibility(const struct kvm_vcpu *vcpu,
 				     const struct sys_reg_desc *rd)
 {
@@ -3310,8 +3320,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(MDCR_EL2, access_mdcr, reset_mdcr, 0),
 	EL2_REG(CPTR_EL2, access_rw, reset_val, CPTR_NVHE_EL2_RES1),
 	EL2_REG_VNCR(HSTR_EL2, reset_val, 0),
-	EL2_REG_VNCR(HFGRTR_EL2, reset_val, 0),
-	EL2_REG_VNCR(HFGWTR_EL2, reset_val, 0),
+	EL2_REG_VNCR_FILT(HFGRTR_EL2, fgt_visibility),
+	EL2_REG_VNCR_FILT(HFGWTR_EL2, fgt_visibility),
 	EL2_REG_VNCR(HFGITR_EL2, reset_val, 0),
 	EL2_REG_VNCR(HACR_EL2, reset_val, 0),
 
@@ -3331,9 +3341,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 			 vncr_el2_visibility),
 
 	{ SYS_DESC(SYS_DACR32_EL2), undef_access, reset_unknown, DACR32_EL2 },
-	EL2_REG_VNCR(HDFGRTR_EL2, reset_val, 0),
-	EL2_REG_VNCR(HDFGWTR_EL2, reset_val, 0),
-	EL2_REG_VNCR(HAFGRTR_EL2, reset_val, 0),
+	EL2_REG_VNCR_FILT(HDFGRTR_EL2, fgt_visibility),
+	EL2_REG_VNCR_FILT(HDFGWTR_EL2, fgt_visibility),
+	EL2_REG_VNCR_FILT(HAFGRTR_EL2, fgt_visibility),
 	EL2_REG_REDIR(SPSR_EL2, reset_val, 0),
 	EL2_REG_REDIR(ELR_EL2, reset_val, 0),
 	{ SYS_DESC(SYS_SP_EL1), access_sp_el1},
-- 
2.39.2


