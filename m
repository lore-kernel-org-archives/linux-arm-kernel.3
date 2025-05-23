Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506C3C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HDbzj63Ra4P92drvhzSTjtemS0TGIrM+fvyypL+AHQ=; b=mrgiVfMtNvgICoW/c/Aq18uFGk
	BuzYzQhtbT7Ykq/Bsk0SPWyn+sO0BUn/ZTwjEJZmzKr/qlMzgywdLu+PoZi1CvOQrlZP8ER2DxEKr
	IVlWspE8TPcU6E7bJai3ckAFvczow8On+ZwIjDxavCXf4Ln/itGL88TwvJGyq97QgXCCTm9mw/3SC
	YNiA9C+jyxu1K4gn0Ke41FdML7YHzJ8AIZUsYepaa8sIRJCwtPtuhGSLdfiiYVnGIuBgOwhq3fdiy
	8YFtsCtjlc4ZPDM2UOgyXT/eHjjMit5eGx1cVFXZHSc/Jbl3lmp3fH6ttr0cerLRJkiODSXbnNkJK
	WDGwXy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITb9-000000045bJ-34ob;
	Fri, 23 May 2025 14:42:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRsc-00000003rL9-1AiK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 12:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A4F5A4F7B6;
	Fri, 23 May 2025 12:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD65CC4CEEF;
	Fri, 23 May 2025 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748004724;
	bh=ZiOqMUDN7gDQRGBJ9S3lJOWMapimTDHrW/d3CnLHWlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lsSLSlFLtz1bVXQrwgmsk9wT0AYbuFskA5/c641ikfUX8mH6jnA+qoiMqRCSBUAQw
	 VpIFfRT5Smf43CMEnTeL7A2fTuKUBp6Po1gyzsDilJFM7qMNUuUHGK4H+bsfe1ESA5
	 VrrDtxWzH4wRyQyY5yrcfvs2QabdE2uiOR6cPXwc49RW1+OiE9cxGNTxskph/haAB6
	 vXVmHiwOIIvl1m0VMJEBgRbfT8yncoPkU72vJrA6h+y6/Bx2qELs3aw0qurmxe/tQ1
	 Vk2wTY+/6twfexoTujc2ffQBEJ93YjGfLZsWpBLx0KuzYgDKXvNxUYZKCp0LYihOuF
	 xiMfQYkVQbnKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA374C54ED0;
	Fri, 23 May 2025 12:52:04 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Fri, 23 May 2025 14:51:44 +0200
Subject: [PATCH v4 1/5] power: supply: max1720x correct capacity
 computation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250523-b4-gs101_max77759_fg-v4-1-b49904e35a34@uclouvain.be>
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
In-Reply-To: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748004727; l=2215;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=eC7BjQT0ON0eLj1BHeNmcDKE6aFWeTYyXf1R0uFKWNU=;
 b=u72BzfqomX49C/S2gr/GbMspbY67y8FvftX3344pxMav8E91Kbxtx06+Ycy1Ar4vUSw7B6fAR
 7cyUOcdgcxPBN8eRzTOtB2LREJJjjfJzpnAvYamLmywQoKw6Qc8LebC
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_055206_463445_CC1B274F 
X-CRM114-Status: GOOD (  11.81  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

From the datasheet of the MAX17201/17205, the LSB should be
"5.0μVh/RSENSE". The current computation sets it at 0.5mAh=5.0μVh/10mOhm
which does not take into account the value of rsense which can be
different from 10mOhm.

Change the computation to fit the specs.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 drivers/power/supply/max1720x_battery.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/max1720x_battery.c b/drivers/power/supply/max1720x_battery.c
index ea3912fd1de8bfd0d029c16f276316d06e1b105c..68b5314ecf3a234f906ec8fe400e586855b69cd9 100644
--- a/drivers/power/supply/max1720x_battery.c
+++ b/drivers/power/supply/max1720x_battery.c
@@ -288,9 +288,10 @@ static int max172xx_voltage_to_ps(unsigned int reg)
 	return reg * 1250;	/* in uV */
 }
 
-static int max172xx_capacity_to_ps(unsigned int reg)
+static int max172xx_capacity_to_ps(unsigned int reg,
+				   struct max1720x_device_info *info)
 {
-	return reg * 500;	/* in uAh */
+	return reg * (500000 / info->rsense);	/* in uAh */
 }
 
 /*
@@ -394,11 +395,11 @@ static int max1720x_battery_get_property(struct power_supply *psy,
 		break;
 	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
 		ret = regmap_read(info->regmap, MAX172XX_DESIGN_CAP, &reg_val);
-		val->intval = max172xx_capacity_to_ps(reg_val);
+		val->intval = max172xx_capacity_to_ps(reg_val, info);
 		break;
 	case POWER_SUPPLY_PROP_CHARGE_AVG:
 		ret = regmap_read(info->regmap, MAX172XX_REPCAP, &reg_val);
-		val->intval = max172xx_capacity_to_ps(reg_val);
+		val->intval = max172xx_capacity_to_ps(reg_val, info);
 		break;
 	case POWER_SUPPLY_PROP_TIME_TO_EMPTY_AVG:
 		ret = regmap_read(info->regmap, MAX172XX_TTE, &reg_val);
@@ -422,7 +423,7 @@ static int max1720x_battery_get_property(struct power_supply *psy,
 		break;
 	case POWER_SUPPLY_PROP_CHARGE_FULL:
 		ret = regmap_read(info->regmap, MAX172XX_FULL_CAP, &reg_val);
-		val->intval = max172xx_capacity_to_ps(reg_val);
+		val->intval = max172xx_capacity_to_ps(reg_val, info);
 		break;
 	case POWER_SUPPLY_PROP_MODEL_NAME:
 		ret = regmap_read(info->regmap, MAX172XX_DEV_NAME, &reg_val);

-- 
2.49.0



