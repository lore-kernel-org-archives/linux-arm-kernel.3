Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4169CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=np0EqvXKQC3ivza9rB5B8qWxhl6lnhh9XqwsMNV6EV4=; b=NLQHVGD7J8DNBTRrSHlDMjmzAc
	y1GvMkycPuGDhkKewB/ddn1PVde9l7JW+40V3pu/aNoLNeU2JqC8zbCoRSmmI9sMOKPKKTHQN8Unk
	COK8YrXZJ4I+rPFF9QQ5pacBQa09KL12zKg3NdFmP1EnMcXXftsMOgglJ/aJtGxjEISPYgpN69j2h
	u/+B2hbigJGIHPzHTVE7P6K9LC4MgYIb1ZTSGtjl1sw77cwRAzK9waR06/u7Gs2h/+Gd0OPp2AXUE
	Igzs6oaDa/2rLcNuDJtWQ6ZNSEYUR2UWrrh/+Jo68RyAGJ7Bzkm/yo0GFrbXTKm7Ib5EpIcqzIbD6
	UogL39Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcZV-00000003EZH-3iVk;
	Fri, 19 Sep 2025 14:58:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcZS-00000003EXS-0rX7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:58:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A3FC169C;
	Fri, 19 Sep 2025 07:58:37 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 860F93F673;
	Fri, 19 Sep 2025 07:58:44 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: cpufeature: add Neoverse-V3AE to BBML2 allow list
Date: Fri, 19 Sep 2025 15:58:30 +0100
Message-ID: <20250919145832.4035534-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919145832.4035534-1-ryan.roberts@arm.com>
References: <20250919145832.4035534-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_075846_285407_F0A43303 
X-CRM114-Status: GOOD (  11.11  )
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

Neoverse-V3AE advertises support for BBML2 and is known to not raise
conflict aborts. So add it to the BBML2_NOABORT allow list.

However, just like Neoverse-V3, Neoverse-V3AE r0p0 and r0p1 suffer from
erratum #3053180, for which the workaround is to always observe
break-before-make requirements for affected revisions. Therefore only
add to the allow list from r0p2 onwards.

For more details see Software Developer Errata Notice (SDEN) document:
    Neoverse V3AE (MP172) SDEN v9.0, erratum 3053180
    https://developer.arm.com/documentation/SDEN-2615521/9-0/

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index ef269a5a37e1..61180b211293 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2235,6 +2235,7 @@ static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int sco
 	static const struct midr_range supports_bbml2_noabort_list[] = {
 		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
 		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
+		MIDR_REV_RANGE(MIDR_NEOVERSE_V3AE, 0, 2, 0xf),
 		{}
 	};
 
-- 
2.43.0


