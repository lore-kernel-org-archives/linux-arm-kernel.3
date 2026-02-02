Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCC7E7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqcQ2HE4Yja0MoeR2EIJ+EHy1YWvLEMXvKo7Xjw1zOs=; b=4eZ+JqKWMKpQ39jP6pwPjGkZE5
	sCXzEGFupnQfHZc6Tg2IbjdeSvRWWKee4qoyWkhosA0Xxd0/wjQDPX/m5STlNkIJtW4mn7/AD+lTH
	bu5RjuV4LiixTvO4MrbcOCktfNi/K0A4yXsl3/z8Kkxs/UxRzprZHIrsiY/5v6w2rbZWCMQFnjjCZ
	BWklpYd1ZuA+f91St48O2WoDyG9Iwk9grOjaUy6ckiUcgV/k8YIAQsbB4J5mzpDBffd1ziJZH3sfR
	bK96NZzkRL6hkUL4z4kqwWRejNmZIw94AoOvSjAwXUAL8jwPHyUNIkhFrhOjbI0pWRgcPpQVsKI5L
	1/zCTU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytq-00000005R8V-3zxJ;
	Mon, 02 Feb 2026 18:43:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytj-00000005QzH-2hxd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ECEA444C3;
	Mon,  2 Feb 2026 18:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7666FC116C6;
	Mon,  2 Feb 2026 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057822;
	bh=CZHG7pAQsKiF+5kKucrA/3/G3NtJVZITV6rYwtH+oZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pPxKjrdu2ox21SY9CAAwjOQ+/KNdTk/7XUUgSqUhOFvviWSXGrSNnlyVcT/Tzm6ZH
	 Hu0dX8p8ZaFgyqqgLDslUwlxxTKKiyTaLctPNyn2w9slKU5WU+hCHpf/wScP9l6YAL
	 0Gm+ytUf8nlV12incPrt1Vy+TTJLeL0VBXboUI8qffp80kREqZzP8TVd6y8xgzJocH
	 G1VkCGRMzVzZypvKUeJ28VNVPWyS6/cG5SyLkJf7ru83R6WVjv0W1BgdXSaPNsCL3/
	 n6j4T26i04PQzQIKl+YKYMmdhoArbBakCP/GoDfc0rCFRCkLHrx6MXrGmU98ZQ6Y9Q
	 cYUOd2/WPU62w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmytg-00000007sAy-2LC7;
	Mon, 02 Feb 2026 18:43:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 08/20] KVM: arm64: Correctly handle SCTLR_EL1 RES1 bits for unsupported features
Date: Mon,  2 Feb 2026 18:43:17 +0000
Message-ID: <20260202184329.2724080-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104343_744880_4A177938 
X-CRM114-Status: GOOD (  11.19  )
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

A bunch of SCTLR_EL1 bits must be set to RES1 when the controlling
feature is not present. Add the AS_RES1 qualifier where needed.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index bc8e6460c3fb1..2ca85c986ff14 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1085,27 +1085,28 @@ static const DECLARE_FEAT_MAP(tcr2_el2_desc, TCR2_EL2,
 			      tcr2_el2_feat_map, FEAT_TCR2);
 
 static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
-	NEEDS_FEAT(SCTLR_EL1_CP15BEN	|
-		   SCTLR_EL1_ITD	|
-		   SCTLR_EL1_SED,
-		   FEAT_AA32EL0),
+	NEEDS_FEAT(SCTLR_EL1_CP15BEN, FEAT_AA32EL0),
+	NEEDS_FEAT_FLAG(SCTLR_EL1_ITD	|
+			SCTLR_EL1_SED,
+			AS_RES1, FEAT_AA32EL0),
 	NEEDS_FEAT(SCTLR_EL1_BT0	|
 		   SCTLR_EL1_BT1,
 		   FEAT_BTI),
 	NEEDS_FEAT(SCTLR_EL1_CMOW, FEAT_CMOW),
-	NEEDS_FEAT(SCTLR_EL1_TSCXT, feat_csv2_2_csv2_1p2),
-	NEEDS_FEAT(SCTLR_EL1_EIS	|
-		   SCTLR_EL1_EOS,
-		   FEAT_ExS),
+	NEEDS_FEAT_FLAG(SCTLR_EL1_TSCXT,
+			AS_RES1, feat_csv2_2_csv2_1p2),
+	NEEDS_FEAT_FLAG(SCTLR_EL1_EIS	|
+			SCTLR_EL1_EOS,
+			AS_RES1, FEAT_ExS),
 	NEEDS_FEAT(SCTLR_EL1_EnFPM, FEAT_FPMR),
 	NEEDS_FEAT(SCTLR_EL1_IESB, FEAT_IESB),
 	NEEDS_FEAT(SCTLR_EL1_EnALS, FEAT_LS64),
 	NEEDS_FEAT(SCTLR_EL1_EnAS0, FEAT_LS64_ACCDATA),
 	NEEDS_FEAT(SCTLR_EL1_EnASR, FEAT_LS64_V),
 	NEEDS_FEAT(SCTLR_EL1_nAA, FEAT_LSE2),
-	NEEDS_FEAT(SCTLR_EL1_LSMAOE	|
-		   SCTLR_EL1_nTLSMD,
-		   FEAT_LSMAOC),
+	NEEDS_FEAT_FLAG(SCTLR_EL1_LSMAOE	|
+			SCTLR_EL1_nTLSMD,
+			AS_RES1, FEAT_LSMAOC),
 	NEEDS_FEAT(SCTLR_EL1_EE, FEAT_MixedEnd),
 	NEEDS_FEAT(SCTLR_EL1_E0E, feat_mixedendel0),
 	NEEDS_FEAT(SCTLR_EL1_MSCEn, FEAT_MOPS),
@@ -1121,7 +1122,8 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
 	NEEDS_FEAT(SCTLR_EL1_NMI	|
 		   SCTLR_EL1_SPINTMASK,
 		   FEAT_NMI),
-	NEEDS_FEAT(SCTLR_EL1_SPAN, FEAT_PAN),
+	NEEDS_FEAT_FLAG(SCTLR_EL1_SPAN,
+			AS_RES1, FEAT_PAN),
 	NEEDS_FEAT(SCTLR_EL1_EPAN, FEAT_PAN3),
 	NEEDS_FEAT(SCTLR_EL1_EnDA	|
 		   SCTLR_EL1_EnDB	|
-- 
2.47.3


