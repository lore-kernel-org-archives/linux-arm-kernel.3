Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE89CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eD92CoOxCTGTel9Vu4SNdHli58oWXtZLP8S3T4zRJ2k=; b=QM7P98FSnxB6VUO5nkZtdeTIMZ
	EhXZcf3ucAP0cERAqDVsyPGdNuJgtNCeAEKxT53Ds1hdnUAZ9H503lH7B9FnAU3XX1LEJsND4+mFB
	A2/MrdQCKjLq95Dpkh8+zZc47fJebjMS4DzINuRxSrJ6GDJS8tgL3eJB/ehRxHE8NyZlZDi9TzQGC
	v3jXE5/1CWsKYYNY+fSKVf/2rcH+ZfcZc0DGWt1xLCrQhHIPw8y1B/k1kHZ0Ti9ApS1kS60d+leQ2
	HJpEDe92QcSAHSIrS8OpBCgUg4zIiXbOvfk4K3TGz5KhQnMc6k0chcenLNzfkARWvbdj+ssC4zVtz
	ndStzugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL9-00000000J3r-0njs;
	Thu, 18 Sep 2025 15:14:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL7-00000000J2M-2dRZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C28CD6021B;
	Thu, 18 Sep 2025 15:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7B0C4CEE7;
	Thu, 18 Sep 2025 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208468;
	bh=6jGnFcZBrQ+wDYBngB6mrU39fbKG6WI/sLlnxGwzCdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fPXm5j2mdkJ9OBKIqOQX73W2itriaGnc+7a151MPHxMhu11/rBBu6y96jmXrZBtJb
	 nZp3rxMLPMAngWwfW5rSCfa8963//EbhRuh2qvlWcQDl/pUrhL4JenYNZMPmwI2DkT
	 DzAScmcnLjgms9i+GIf8w3SMUoqIYcgONRDUhYqP4LMDBjy9xDonEr+ip7BACngzwE
	 pfFq5SkSsXAGSPw8tf5tHNCW7Ek/i+fgRdthFc/JhII1oA/vhN3OlrElLjoiwvFPVl
	 Wg2BhqwCdtVs73YzHyxFACEevBu9N8e4MRJaQxRgqkJKsoK8PmarmiVpakHgx7wOxA
	 N2zXTi8CkCqLg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzGL4-00000007TmF-1fwx;
	Thu, 18 Sep 2025 15:14:26 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH v2 01/10] KVM: arm64: Remove duplicate FEAT_{SYSREG128,MTE2} descriptions
Date: Thu, 18 Sep 2025 16:13:53 +0100
Message-Id: <20250918151402.1665315-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250918151402.1665315-1-maz@kernel.org>
References: <20250918151402.1665315-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, yangjinqian1@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Turns out I'm rather bad at noticing that the description of features
has already been added. Remove superflusous definitions for SYSREG128
and MTE2.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index da66c4a147752..d85dd05c00b0e 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -131,7 +131,6 @@ struct reg_bits_to_feat_map {
 #define FEAT_SPMU		ID_AA64DFR1_EL1, SPMU, IMP
 #define FEAT_SPE_nVM		ID_AA64DFR2_EL1, SPE_nVM, IMP
 #define FEAT_STEP2		ID_AA64DFR2_EL1, STEP, IMP
-#define FEAT_SYSREG128		ID_AA64ISAR2_EL1, SYSREG_128, IMP
 #define FEAT_CPA2		ID_AA64ISAR3_EL1, CPA, CPA2
 #define FEAT_ASID2		ID_AA64MMFR4_EL1, ASID2, IMP
 #define FEAT_MEC		ID_AA64MMFR3_EL1, MEC, IMP
@@ -143,7 +142,6 @@ struct reg_bits_to_feat_map {
 #define FEAT_LSMAOC		ID_AA64MMFR2_EL1, LSM, IMP
 #define FEAT_MixedEnd		ID_AA64MMFR0_EL1, BIGEND, IMP
 #define FEAT_MixedEndEL0	ID_AA64MMFR0_EL1, BIGENDEL0, IMP
-#define FEAT_MTE2		ID_AA64PFR1_EL1, MTE, MTE2
 #define FEAT_MTE_ASYNC		ID_AA64PFR1_EL1, MTE_frac, ASYNC
 #define FEAT_MTE_STORE_ONLY	ID_AA64PFR2_EL1, MTESTOREONLY, IMP
 #define FEAT_PAN		ID_AA64MMFR1_EL1, PAN, IMP
-- 
2.39.2


