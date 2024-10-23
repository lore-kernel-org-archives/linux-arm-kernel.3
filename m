Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41357CF539E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/802VUMDJX9s9fuVQNPk4PMMPrE7aflNSTl0aaHDzE=; b=RRgW9BsOr6lUFK+XfZOalpS781
	R29KtRmyCiN1UZCVG1d7dDDJn12EKAJ4RREjrrjjs0+MQQNfeEq4lgiuuUFzOcvMBLXvYXjgs9k24
	bXOlTDFRyI0eVsdEN3kJDCeUjHUdSp4UTIPBqfl997+nVSNp3EGjgirWdX72fzs2OJpUhMfDtwHCA
	+OErCjOSF/AJtuw6jUVApAR8kxwJU4T2xIzNUfNQcVi89HYpGn50/qAqqDhIZ7NsqdbnyyOb8Qr97
	h3KvQPJe+Q12Mse0HUGJRcNVgr5yvT6fMpL/fwyN2Nw5/XNuZQjr5RvXgterV7ejLPVLWBAYVZO3w
	k0pbSdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3d5N-0000000EufM-48Zg;
	Wed, 23 Oct 2024 15:15:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckH-0000000EpKm-14TI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7E7EA45011;
	Wed, 23 Oct 2024 14:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EB4C4CEE8;
	Wed, 23 Oct 2024 14:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695233;
	bh=g7DUZCp9FUPLiWQYAaREnyMU/Dq1MVZ6wECKH3FQhRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N6yEPskE9dwxxlfWgBKHI5pX/jGjm+OfbGojfVuqn5u1XWkGwxwBeuQFXM6liRBfH
	 1vSCjXoCvbSupPps3Orns8iHVKPExURxc3YZ9TIe0idMg+1r2eski9WsJdYBDZMf9t
	 wRZ2scPxF+J6rCCQZpj1UH+1jeDgakIM4yHXhQqZXwH4lkURVDChwcqMm+CzMOPbq5
	 oH5a57KngipTL1zT+Wcef7zHqzC8vq4SUa4AMv3iUYkmRC1/toD9alSXUdmxLrj9Jz
	 4kbRxtK1npqdzTf8rwlyWm04bi3KuVsYedZuOroEAY+K62C/geI6gTGNWdbrE1h7/E
	 sB02DIFiNSzgw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckB-0068vz-VB;
	Wed, 23 Oct 2024 15:53:52 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 12/37] KVM: arm64: Sanitise TCR2_EL2
Date: Wed, 23 Oct 2024 15:53:20 +0100
Message-Id: <20241023145345.1613824-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075357_558447_085256F1 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

TCR2_EL2 is a bag of control bits, all of which are only valid if
certain features are present, and RES0 otherwise.

Describe these constraints and register them with the masking
infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index b20b3bfb9caec..b4b3ec88399b3 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1179,6 +1179,28 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 		res0 |= ~(res0 | res1);
 	set_sysreg_masks(kvm, HAFGRTR_EL2, res0, res1);
 
+	/* TCR2_EL2 */
+	res0 = TCR2_EL2_RES0;
+	res1 = TCR2_EL2_RES1;
+	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, D128, IMP))
+		res0 |= (TCR2_EL2_DisCH0 | TCR2_EL2_DisCH1 | TCR2_EL2_D128);
+	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, MEC, IMP))
+		res0 |= TCR2_EL2_AMEC1 | TCR2_EL2_AMEC0;
+	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, HAFDBS, HAFT))
+		res0 |= TCR2_EL2_HAFT;
+	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, THE, IMP))
+		res0 |= TCR2_EL2_PTTWI | TCR2_EL2_PnCH;
+	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, AIE, IMP))
+		res0 |= TCR2_EL2_AIE;
+	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
+		res0 |= TCR2_EL2_POE | TCR2_EL2_E0POE;
+	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1PIE, IMP))
+		res0 |= TCR2_EL2_PIE;
+	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, VH, IMP))
+		res0 |= (TCR2_EL2_E0POE | TCR2_EL2_D128 |
+			 TCR2_EL2_AMEC1 | TCR2_EL2_DisCH0 | TCR2_EL2_DisCH1);
+	set_sysreg_masks(kvm, TCR2_EL2, res0, res1);
+
 	/* SCTLR_EL1 */
 	res0 = SCTLR_EL1_RES0;
 	res1 = SCTLR_EL1_RES1;
-- 
2.39.2


