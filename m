Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E29C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqD40Mflj7fQsGkUGnxLMPBkxms+e93ruSqzK3UudbE=; b=40dTZBkLkpXxDxrQk6Na4UzNGu
	gfMYdPRzseEbYai63H0lk/Zuj0YviHKI3gdEVurKw+vgjmG1nNVV1f8Ewhc9j+4iuMJhR4ESpuShf
	v+Q6r0jZvfkIMQZ3+P5/Y9+4VO8ugjPxHfinYPR11NmAPJsvFbuZSb0//0ak0iewtTeBhBaop0lt+
	uXAZS2X6O0Wmoqa6kh0NMHkJqA26biJh3Q9RMI4LaBwm3bCd4gn2VpmelHGTBOy/VYQwyCbUCO0Yi
	WBEY9MUcTSrgq87rUkfXbdpsawent/GZVgAwrdnTytzkrhcjFNGAr90Ry68gk+Kd8oF8qZfNEtf30
	M09eLXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSgf-00000003cUI-0ZOQ;
	Thu, 31 Jul 2025 12:47:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSKK-00000003ZKM-1udp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 12:24:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3B7B2BC3;
	Thu, 31 Jul 2025 05:23:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F80A3F673;
	Thu, 31 Jul 2025 05:24:02 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 31 Jul 2025 13:23:42 +0100
Subject: [PATCH v6 06/10] coresight: Avoid enable programming clock
 duplicately
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-arm_cs_fix_clock_v4-v6-6-1dfe10bb3f6f@arm.com>
References: <20250731-arm_cs_fix_clock_v4-v6-0-1dfe10bb3f6f@arm.com>
In-Reply-To: <20250731-arm_cs_fix_clock_v4-v6-0-1dfe10bb3f6f@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753964630; l=1892;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=38H7dCopCsqbVOeBAjaWZpO84P++J5KiCuiuzTpRiGw=;
 b=bMKPPEEZO1nT1ovOhcXzLBiq11G1K/Uwm0SL3OHms6TIHAB9LL89HzjKq/87zz9d3KashoTlR
 obKtz820yq1B76yPLtrftKqimn52RikaTcjvmjCm+1ZHot6KQL3j0AO
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_052404_543764_D8A289EF 
X-CRM114-Status: GOOD (  13.66  )
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
probe. As a result, a CoreSight driver may redundantly enable the same
clock.

To avoid this, add a check for device type and skip enabling the
programming clock for AMBA devices. The returned NULL pointer will be
tolerated by the drivers.

Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 include/linux/coresight.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 1e652e157841955864a4bce00b2285efcad327aa..bb49080ec8f96bb23cab2efa23eb026646a3c4f4 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -481,20 +481,23 @@ static inline bool is_coresight_device(void __iomem *base)
  * Returns:
  *
  * clk   - Clock is found and enabled
- * NULL  - Clock is controlled by firmware (ACPI device only)
+ * NULL  - Clock is controlled by firmware (ACPI device only) or when managed
+ *	   by the AMBA bus driver instead
  * ERROR - Clock is found but failed to enable
  */
 static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
 {
-	struct clk *pclk;
+	struct clk *pclk = NULL;
 
 	/* Firmware controls clocks for an ACPI device. */
 	if (has_acpi_companion(dev))
 		return NULL;
 
-	pclk = devm_clk_get_optional_enabled(dev, "apb_pclk");
-	if (!pclk)
-		pclk = devm_clk_get_optional_enabled(dev, "apb");
+	if (!dev_is_amba(dev)) {
+		pclk = devm_clk_get_optional_enabled(dev, "apb_pclk");
+		if (!pclk)
+			pclk = devm_clk_get_optional_enabled(dev, "apb");
+	}
 
 	return pclk;
 }

-- 
2.34.1


