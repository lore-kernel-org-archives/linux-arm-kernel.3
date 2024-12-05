Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2FEE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+88K50aTDgOA/7wFH5ZjGz8l4UiR5hwqKGUx+3zRuuk=; b=SKFx41x4wJTT+K3UllPtBo6NTT
	GK8KD+bsR2fHIxQnAbEjUqB65uSXJB/ryMT8dNFepszCIZ674nGYvOKh1kBBVqRSbW3Qa06mgZxwI
	DfLRL27ukX9C4bJuj6tOzIO7Z47Ek9LBrIrXqWL+tR+zb93TZ8jXqe7ZDPxoBTemII8xYe2JfnQzY
	m1OwWI0xp1XxMZkbyZGMot+sPDziRANL66VaNjFGd1D6dD1Gb+ZtxPoZIxmdE+ubZLYsB9JcDgy9T
	npi2FAwkaNxPuFaVDGlSd/rthvruOywhXCi2omrCB0v8gcJ3ZbKC2HUh1J0KgwaBHHRA1OFu9gH9q
	iTQk2uzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCFJ-0000000GEMo-3Caw;
	Thu, 05 Dec 2024 13:50:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCDJ-0000000GDvz-49tV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:48:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82FE9169E;
	Thu,  5 Dec 2024 05:48:45 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 44CF03F71E;
	Thu,  5 Dec 2024 05:48:16 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com
Cc: joro@8bytes.org,
	jean-philippe@linaro.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	ryan.roberts@arm.com,
	broonie@kernel.org
Subject: [PATCH 2/2] arm64: cpufeature: Add GCS to cpucap_is_possible()
Date: Thu,  5 Dec 2024 13:48:10 +0000
Message-Id: <416c7369fcdce4ebb2a8f12daae234507be27e38.1733406275.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
References: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_054818_067463_1836866C 
X-CRM114-Status: GOOD (  10.22  )
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

Since system_supports_gcs() ends up referring to cpucap_is_possible(),
teach the latter about GCS for consistency with similar features.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/include/asm/cpucaps.h    | 2 ++
 arch/arm64/include/asm/cpufeature.h | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 201a46efd918..cbbf70e0f204 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -44,6 +44,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_TLB_RANGE);
 	case ARM64_HAS_S1POE:
 		return IS_ENABLED(CONFIG_ARM64_POE);
+	case ARM64_HAS_GCS:
+		return IS_ENABLED(CONFIG_ARM64_GCS);
 	case ARM64_UNMAP_KERNEL_AT_EL0:
 		return IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0);
 	case ARM64_WORKAROUND_843419:
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index b64e49bd9d10..8b4e5a3cd24c 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -847,8 +847,7 @@ static inline bool system_supports_poe(void)
 
 static inline bool system_supports_gcs(void)
 {
-	return IS_ENABLED(CONFIG_ARM64_GCS) &&
-		alternative_has_cap_unlikely(ARM64_HAS_GCS);
+	return alternative_has_cap_unlikely(ARM64_HAS_GCS);
 }
 
 static inline bool system_supports_haft(void)
-- 
2.39.2.101.g768bb238c484.dirty


