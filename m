Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B70EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbLmaDuCgmb9+mzuFXAXCcqkFZWVa2rrLJKmTWnJNrs=; b=xGCpv+hGNBwYIkQm8K3ZPAgFCT
	z8Z35EYkxQ6Q8y7uxmpo8FwGNh1nvz76dXH5LjUuEJR/tDvqTPKgFXTLxWdwLbFlOYp+SlPMAJBMt
	FtD6U5DEBtPwpBZL6CZ8opbelNtey2q273zUKX0x/eX6HuuvkaRU7QRpCHgpKlr2xQt3SfYdQcj3Z
	YcWprdV0hMgDH76TTlu5+OTEzGOLz15UjsPRpxmGChk8Ev6lvqrW9XXOiZN5j12xeN99mdiPy4Cdh
	e1AdNJbjoJEM0zGmWZD0l2N13vHy/KgiMKZXl44lw8BWxnpbXQNYN33OqIL7FrdwONRduJENz04LR
	04sdU5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIs0-00000002EFA-2aAD;
	Mon, 14 Jul 2025 13:05:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGb-000000029jV-1wMX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 107004684E;
	Mon, 14 Jul 2025 12:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A49C4CEF6;
	Mon, 14 Jul 2025 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752496005;
	bh=wtfqoXcRMslLsoh24WJYRV7azLDNEc1yXs96hSCaaMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aKTTrUJjleWuCKQxhY82WEA2H3wk5XYt0Tn5lCHiNnl6tNaqGsbKYgthYg73lnn4c
	 JjJ5EiNpgpAg7fgQpaIUsxVdhyU/4ldbaPdPPcaLor54c30YWPwAHivlZlskopTBJn
	 TcfNE7IwSrBTT9Ag52uX953KiRKekS3eaGnGQN7FoCsc4yJs/lxQPBU4eTa9041k69
	 /T9Yir8HncyhvmX/ZSEo9jPqrMDyKB6VNnV+qVIN8AqRnuXNsi0oiNGYghdA+Xwxds
	 Bfj7Y2F6ryqEr1lkrdoDjwrUF+R+WZ+rrPOX+T/0mx/VeqWHegQ8pMy0pwMsa1IYO9
	 LPVg5TB0WJ1WA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubIGZ-00FW7V-6A;
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
Subject: [PATCH 08/11] KVM: arm64: Advertise FGT2 registers to userspace
Date: Mon, 14 Jul 2025 13:26:31 +0100
Message-Id: <20250714122634.3334816-9-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250714_052645_519752_936F9ACB 
X-CRM114-Status: GOOD (  11.28  )
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

While a guest is able to use the FEAT_FGT2 registers, we're missing
them being exposed to userspace. Add them to the (very long) list.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index b441049368c7e..554c7145ec1cd 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2592,6 +2592,16 @@ static unsigned int tcr2_el2_visibility(const struct kvm_vcpu *vcpu,
 	return __el2_visibility(vcpu, rd, tcr2_visibility);
 }
 
+static unsigned int fgt2_visibility(const struct kvm_vcpu *vcpu,
+				    const struct sys_reg_desc *rd)
+{
+	if (el2_visibility(vcpu, rd) == 0 &&
+	    kvm_has_feat(vcpu->kvm, ID_AA64MMFR0_EL1, FGT, FGT2))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
 static unsigned int fgt_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *rd)
 {
@@ -3341,9 +3351,14 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 			 vncr_el2_visibility),
 
 	{ SYS_DESC(SYS_DACR32_EL2), undef_access, reset_unknown, DACR32_EL2 },
+	EL2_REG_VNCR_FILT(HDFGRTR2_EL2, fgt2_visibility),
+	EL2_REG_VNCR_FILT(HDFGWTR2_EL2, fgt2_visibility),
+	EL2_REG_VNCR_FILT(HFGRTR2_EL2, fgt2_visibility),
+	EL2_REG_VNCR_FILT(HFGWTR2_EL2, fgt2_visibility),
 	EL2_REG_VNCR_FILT(HDFGRTR_EL2, fgt_visibility),
 	EL2_REG_VNCR_FILT(HDFGWTR_EL2, fgt_visibility),
 	EL2_REG_VNCR_FILT(HAFGRTR_EL2, fgt_visibility),
+	EL2_REG_VNCR_FILT(HFGITR2_EL2, fgt2_visibility),
 	EL2_REG_REDIR(SPSR_EL2, reset_val, 0),
 	EL2_REG_REDIR(ELR_EL2, reset_val, 0),
 	{ SYS_DESC(SYS_SP_EL1), access_sp_el1},
-- 
2.39.2


