Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CEFC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTGehQbUedEzKLkhhaH1lsUDkNzzFr5cL05MJAHVVcA=; b=q5wfNa0clGON7Ln0Tl2nzAVChE
	ShIURII5LgxusycZdIEpXXxuGV43rF6GrgxoZbUaIjcKKw0fwSwq00DEXG8VbZCQ6ZqQ/t4miqtdK
	DFhm9xf6Gnz7QHhANZeo2SGoWxdKI+J1fS0hzaTHElpTipRfxu1C4c8m14TwevTJdUvG59WRKqIPX
	UHmHNSnlLJ94J7ZCJbgyuZpSBCev+64GNHJ6ZBYLGcw8eIrCvIzJZ9ZR2dfy6fpJT0VEeFGDT7Vim
	JllJMOM5cd9vHr/7+hpelef8ZImTOtfsnYwuPlf8x8Bvz5xw/pgXt+wmO67UOMQvvZIwNqAqsgWhH
	HNTFOYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uCv-0000000GFCq-0WDQ;
	Sat, 19 Sep 2026 12:30:17 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uCa-0000000GF05-2pe9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:29:57 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d747ed6d6eso16509805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789820996; x=1790425796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTGehQbUedEzKLkhhaH1lsUDkNzzFr5cL05MJAHVVcA=;
        b=QRUdy359l7V3pPj3KEqbntK3ScXWvg3YbEJ2wYKRCLswd1fxbYboO+UffbpPQSMWkl
         TrCwE23+8dwzE8qmdTByKsyZlyxxKrB9ijc07Q4BhqATpmFOj3HbxOzQaIj0LHFegmog
         ZLZ7gd+EPHkkSTVv956/2aSPLc4OqXbRTTkQI17X/hbKvNatuLiq35JdFvxNDzfusiH/
         QpCOC8L0nUqazCxpxSG0FjUjPPSH009DTSeP2Ao6X/mohzurkpQ1yGChw48kReTlI/nH
         UWpBmItIrXLIi+lcOsNgh0wKSs//EWDg7Hss7HMORzcADdtBM4xu9rgBrbOwBr4gH91R
         Qy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789820996; x=1790425796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTGehQbUedEzKLkhhaH1lsUDkNzzFr5cL05MJAHVVcA=;
        b=Et1FTD0KyGzKRjH+l2LoxSaFbUhEVLw27E6NbGWfyi1CTLFhyAhio/kdeglg70kg0o
         iS0vV+sUDgs7nICs5/hiLe3ff02WURW0Ej+/2106CUgekK6Xx9WZoe+BKQ2joXzVJJEU
         ORngc8N9dgwDysj8knYFOffB/AjDhiZqT/19fUZ8sZY1AWyJMyY7q7mLaqxZextZPx1z
         x9L/mUAa4MtZWIM3jt6SpDjbjLUDtkfqTjNX7kFC3Rp5Umfot0h7fYso0mGSiNAEBU1A
         H1xow92os6vAnjmEqpg7Ix04aPQZlhcyM1JfL1NW6IdIZAResVrhTZAZhe28I+XOxk4j
         fx8w==
X-Forwarded-Encrypted: i=1; AKwUvByLZGKuyFRuxGWc3oFf5DXHhBKgQHL4Fts4Z6Ks0zHxLrP9xDcInAXmm0Q724IWBiZ3v/QHB1OtiTNy6DuoE+Zc@lists.infradead.org
X-Gm-Message-State: AFuF++mGW98RfyGDQGY4EkG97XAuX6wuTnJu6eJOAyRur5AQmtMHuU2/
	Py7z6dGEgJm5zFI11Jj6Hp2oSlAdt4MN8uz6tBOomqS3/ZT5wOt7Ob1/
X-Gm-Gg: AYBFou2xDxwbbHGHPn3OU1iK+RQX2MtZGC3Y7Vc32e0suQgjZP//CzLc1jCyFF63kix
	HY0NnSIfFQl/juroOnaoxz/v1JhlPjnS+Qj7e1ECbO251GMmKPPFO/rUFemJJRphBQ8V3EYUfec
	RaXto1KihJo/Za9UZSu1u82fAKF2z4XVlu1bHuxm/Rvaf+grkZZCJDKv1jsS03rv+TNOb6seOQ/
	X3Y2DgPDANX4UKU1VLw3ZCOilXpEOiHjsrX7jp2ngRaG5WQ2jZyw1JQrVUHCyAckFyfnubEexfL
	rtOsfPGnV5lfQti9BSqiPKc07nxfMBfbyEnWggBug3QRyL5ZBgp1gZErE7u2jxtZC1ruTyjoVGc
	sX8rbJHbcvoCn/8+TugD7WL+NbL79IU7fklN69gki7Y6j34wHNh+KcxVXRFSsQUHu+F2/ne0n4P
	5odICvdLuM3hblbRDj02RroHriTia/ng1cpG2u147zfO/VKaIgZVuexVno55lF5sTaoHtlipSpN
	PS3Egcuc/8=
X-Received: by 2002:a17:902:d4c4:b0:2d8:d4dd:24c0 with SMTP id d9443c01a7336-2ddb1b97ee1mr97401945ad.21.1789820995660;
        Sat, 19 Sep 2026 05:29:55 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:29:55 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v2 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Sat, 19 Sep 2026 20:29:29 +0800
Message-ID: <20260919122930.1418-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_052956_717237_B6378B17 
X-CRM114-Status: GOOD (  23.11  )
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

rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
lines driven by the SoC gate the PMIC's power-off path, a shutdown
performed this way does not stick: the rails drop and immediately come
back up, so the board restarts instead of staying off. U-Boot reports the
result as a power-on reset.

Take those lines as an optional GPIO array, hold them asserted while the
system runs and release them - waiting power-hold-delay-ms - before
writing the shutdown bit. Device trees without the property retain the
existing behaviour.

The array is claimed before any child device is registered, so that a
-EPROBE_DEFER from the GPIO provider does not tear down the regulators,
RTC and clocks that devm_mfd_add_devices() has already registered.

Releasing every described line matters: on a Firefly-RK3399 the board
stays off when both lines described for it are released, whereas releasing
GPIO1_D0 while GPIO1_B5 is left asserted makes it come back up.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 47 +++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/rk808.h |  4 ++++
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6ab..0898db0 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -11,6 +11,8 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/rk808.h>
 #include <linux/mfd/core.h>
@@ -703,6 +705,24 @@ static int rk808_power_off(struct sys_off_data *data)
 	default:
 		return NOTIFY_DONE;
 	}
+
+	/*
+	 * Some boards route "power hold" lines from the SoC into the board's
+	 * power circuitry. They have to be held asserted while the system is
+	 * running and released before the PMIC shutdown request is written:
+	 * with any of them left asserted, the rails drop and then come back
+	 * up. Releasing them here rather than from a separate handler keeps
+	 * the ordering against the I2C write explicit.
+	 */
+	if (rk808->power_hold_gpios) {
+		unsigned int i;
+
+		for (i = 0; i < rk808->power_hold_gpios->ndescs; i++)
+			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[i], 0);
+
+		msleep(rk808->power_hold_delay_ms);
+	}
+
 	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
 	if (ret)
 		dev_err(rk808->dev, "Failed to shutdown device!\n");
@@ -766,6 +786,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	struct rk808 *rk808;
 	const struct rk808_reg_data *pre_init_reg;
 	const struct mfd_cell *cells;
+	bool system_power_controller;
 	int dual_support = 0;
 	int nr_pre_init_regs;
 	u32 rst_fun = 0;
@@ -851,6 +872,29 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (!irq)
 		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
 
+	system_power_controller =
+		device_property_read_bool(dev, "system-power-controller") ||
+		device_property_read_bool(dev, "rockchip,system-power-controller");
+
+	/*
+	 * Claim the optional power hold GPIOs before any child device is
+	 * registered. A -EPROBE_DEFER from the GPIO provider at this point
+	 * costs nothing, whereas deferring after devm_mfd_add_devices()
+	 * would tear the freshly registered children down again on every
+	 * retry.
+	 */
+	if (system_power_controller) {
+		rk808->power_hold_gpios =
+			devm_gpiod_get_array_optional(dev, "power-hold",
+						      GPIOD_OUT_HIGH);
+		if (IS_ERR(rk808->power_hold_gpios))
+			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
+					     "Failed to get power hold GPIOs\n");
+
+		device_property_read_u32(dev, "power-hold-delay-ms",
+					 &rk808->power_hold_delay_ms);
+	}
+
 	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
 				       IRQF_ONESHOT | dual_support, -1,
 				       rk808->regmap_irq_chip, &rk808->irq_data);
@@ -872,8 +916,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add MFD devices\n");
 
-	if (device_property_read_bool(dev, "system-power-controller") ||
-	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+	if (system_power_controller) {
 		ret = devm_register_sys_off_handler(dev,
 				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904..eda111e 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1459,6 +1459,8 @@ enum {
 	RK818_ID = 0x8180,
 };
 
+struct gpio_descs;
+
 struct rk808 {
 	struct device			*dev;
 	struct regmap_irq_chip_data	*irq_data;
@@ -1466,6 +1468,8 @@ struct rk808 {
 	long				variant;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct gpio_descs		*power_hold_gpios;
+	u32				power_hold_delay_ms;
 };
 
 void rk8xx_shutdown(struct device *dev);
-- 
2.55.0.windows.3


