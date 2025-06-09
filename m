Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B373C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/c0A8HadyMKOyTj7Io1NwRpL41atMkCeOPeKm+Wmshw=; b=3pod/qgaF2Ds3Nr53ZmsIvJodW
	8KVETHLPgtcH9tdICm+ePh863Nb0FKapJ6pFYQRJCqo9jvLTMhDrFpqwjqQpgbsJ6GTIEa9jF7n5D
	afdVndkkI5azp45/nyw/3H5ctvX1k1pts1EqkH4bYx7KVJS4DGDF+B56K5mXx2jIFFcLDdKZfVde3
	beCXgsSbpTECBbToj48prQJRA9ghzPIi6yQ6P32EVkLOkMnSt49fYXVHK2l1dXALFIwpXaPsA0aMZ
	LGdBaOhHMGriPFTVHuHnkZXWOd+HN7ezBCN1VrQf2st7HoaIaC81vXaX2QFel9kCl3ggJuTmuOWF/
	ACF5sb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfgD-00000004izY-1Gyh;
	Mon, 09 Jun 2025 16:49:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOewA-00000004bHO-0UAM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:01:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F9D31515;
	Mon,  9 Jun 2025 09:01:06 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0549C3F673;
	Mon,  9 Jun 2025 09:01:23 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Jun 2025 17:00:40 +0100
Subject: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
In-Reply-To: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749484873; l=1497;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=yVcviqXGLX8XXxiv2l48G8MI9BCvDehEgF2Iupn+Bew=;
 b=7Mj8BicH2mQES5cPM2ECdFxjX0lrMREtg/dUsRZya//fEOsKpYpcuN7O6bIzUWiJMlGOJrlDq
 iGSJgtqOVSGBHU+lCN58Zk0WRydUQVIUczQ0nLZS4B02IrrjWMYZRlh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_090126_200577_3B07CB5D 
X-CRM114-Status: GOOD (  12.55  )
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

The programming clock is enabled by AMBA bus driver before a dynamic
probe.  As a result, a CoreSight driver may redundantly enable the same
clock.

To avoid this, add a check for device type and skip enabling the
programming clock for AMBA devices.  The returned NULL pointer will be
tolerated by the drivers.

Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 include/linux/coresight.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index dd2b4cc7a2b70cf060a3207548fe80e3824c489f..9afa1f76c78a3347e54d94fe9a9ebed72e3fff8e 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -480,15 +480,18 @@ static inline bool is_coresight_device(void __iomem *base)
  * Returns:
  *
  * clk   - Clock is found and enabled
+ * NULL  - Clock is not needed as it is managed by the AMBA bus driver
  * ERROR - Clock is found but failed to enable
  */
 static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
 {
-	struct clk *pclk;
+	struct clk *pclk = NULL;
 
-	pclk = devm_clk_get_enabled(dev, "apb_pclk");
-	if (IS_ERR(pclk))
-		pclk = devm_clk_get_enabled(dev, "apb");
+	if (!dev_is_amba(dev)) {
+		pclk = devm_clk_get_enabled(dev, "apb_pclk");
+		if (IS_ERR(pclk))
+			pclk = devm_clk_get_enabled(dev, "apb");
+	}
 
 	return pclk;
 }

-- 
2.34.1


