Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F566CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJVi14E8XRnSSxAt3OwyC3hAxV0rJS0jDjEfs2Iwd5c=; b=UidJLPD+vMngiCm5o4V3fSoRMm
	gDZ6upDgVZdNjWnI0EoIbLuLDCYqXf84l/RshRicFNSai8C+RP11iq3TyO1hcFpuTZ7CI4IXSuBpf
	F7lL10EjnTdWx0ynSadY1Y37tQUKLFfnnpg2ImltQP0xtKenBr+BmDPG777NBscji7TOi4FGxObQd
	ZyQ0+3mkLtyp2xBe/GYVvnznFbiuYxaklUYZFY7d+KIQAKg3upHeQSiSpho9bdQG5AAfCiZGCv4+v
	LPqKcLmhoSpd24pS9pMvTBYhu9/KYrVhQeeWI3eHSYHvMiXD5SBSodZi3IpuYC51lQvbk7tJ2Yjhc
	r43LXlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7863-00000007vyW-1YRm;
	Fri, 10 Oct 2025 08:03:27 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v785z-00000007vuB-2vJl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 08:03:24 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 10 Oct
 2025 16:03:16 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Oct 2025 16:03:16 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 2/3] watchdog: aspeed: Support variable number of reset mask registers
Date: Fri, 10 Oct 2025 16:03:14 +0800
Message-ID: <20251010080315.816628-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
References: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_010323_734256_62B60CE3 
X-CRM114-Status: GOOD (  14.23  )
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

Starting from the AST2600 platform, the SoC design has become more
complex, with an increased number of reset mask registers.
To support this, introduce a new field 'num_reset_masks' in the
'aspeed_wdt_config' structure to specify the number of reset mask
registers per platform. This change removes the need for hardcoded
platform-specific logic and improves scalability for future SoCs.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 837e15701c0e..d23e565f30a8 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -35,6 +35,7 @@ struct aspeed_wdt_config {
 	u32 irq_shift;
 	u32 irq_mask;
 	struct aspeed_wdt_scu scu;
+	u32 num_reset_masks;
 };
 
 struct aspeed_wdt {
@@ -66,6 +67,7 @@ static const struct aspeed_wdt_config ast2500_config = {
 		.wdt_reset_mask = 0x1,
 		.wdt_reset_mask_shift = 2,
 	},
+	.num_reset_masks = 1,
 };
 
 static const struct aspeed_wdt_config ast2600_config = {
@@ -78,6 +80,7 @@ static const struct aspeed_wdt_config ast2600_config = {
 		.wdt_reset_mask = 0xf,
 		.wdt_reset_mask_shift = 16,
 	},
+	.num_reset_masks = 2,
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
@@ -479,11 +482,11 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
-	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
-		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
+	if (!of_device_is_compatible(np, "aspeed,ast2400-wdt")) {
 		u32 reset_mask[2];
-		size_t nrstmask = of_device_is_compatible(np, "aspeed,ast2600-wdt") ? 2 : 1;
+		size_t nrstmask = wdt->cfg->num_reset_masks;
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
+		int i;
 
 		reg &= wdt->cfg->ext_pulse_width_mask;
 		if (of_property_read_bool(np, "aspeed,ext-active-high"))
@@ -503,9 +506,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 
 		ret = of_property_read_u32_array(np, "aspeed,reset-mask", reset_mask, nrstmask);
 		if (!ret) {
-			writel(reset_mask[0], wdt->base + WDT_RESET_MASK1);
-			if (nrstmask > 1)
-				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
+			for (i = 0; i < nrstmask; i++)
+				writel(reset_mask[i], wdt->base + WDT_RESET_MASK1 + i * 4);
 		}
 	}
 
-- 
2.34.1


