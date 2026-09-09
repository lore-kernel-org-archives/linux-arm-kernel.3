Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827BEC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDCh3/bMgci4uGVV65c5lJe37gL3Ra631LoM+SOniZI=; b=jTQV68AxUzb5p9n4iDY41ktcK+
	nzbPVFHo/k08ovX+WX+mrA4T7KPc6v7c9gWvZ38gWUNrOtSYBkE1rwMwXv+wrNLR7sksWDf+jtIw4
	kuxHyAeHdpgjp5j6Kd9h0SgtfHYrnWRTNEBJ6taB8jRMg9ex9q7eJceIbomFq53FronWYZi14k4TN
	gfQS1Ph4okTlH4MXsFhdT5tRAJ33zJYl0vuw86ThoUT4jVZ29wvn2sLCxe0SJzJxtbBGwEj0ON8PK
	r+E6sWWwgWnIBzutZDBPtg8OHfzWH4JXdJ3FItB70oXwBWZ6yseXUcKVDRs/lEqRRiLBYnEKCj3PV
	N1YUbO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EbI-0000000BHsc-3eTO;
	Wed, 09 Sep 2026 09:28:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EbD-0000000BHoT-3UX7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 09:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LDCh3/bMgci4uGVV65c5lJe37gL3Ra631LoM+SOniZI=; b=McJMUrjxjE2gJSTdNrVHir6v6+
	GPTQWRBeKhwP86XZJ9d3g2ud45DNFX3OD+WaQ0JuQWnA/oDYB+V6N00ZGAyMy78zbPXYbCQJFFb8T
	S/Dewu2fRvNyxE+ib0B1rRdrC7s9IRH2HSNitPe1v3qEjDR0pw+DhWEcgV9jmnRGywdzk1IwMFdbX
	ygDtRxWHL3uyysLdrQajLm6I+7HVZnGMaA1vrVSRMTLl0G+5SAQQOtq0klB6r1ybN3LVqwpwu6aGi
	2+xGN3dezUO6eSuMSQTiOivYOnSZ0bWUE4Kg1FdEvIB1inOXDhzUetfXaU+bjSvb1PXKybfZ1slYH
	mFIaUgPA==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4EbB-00000000zlx-0O8e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:28:10 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-86309e1a213so1428712b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946086; x=1789550886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDCh3/bMgci4uGVV65c5lJe37gL3Ra631LoM+SOniZI=;
        b=DJdhhE48i4J6uHyZlh4aefXJaEbrGxIjBYmwQ/ZoHV4Ep+u0vKaKh+7a2UUm/sWRUW
         MYjZtxeNatONMCOT6CwOEldndK4yYVc5lk/z+H+xnB4PKLml3uXpJSBoA9tQL3bRHS1X
         FO2zrTu4LtCjij8Ta8jD1/yT3/FFcOtav3wSy/5X3kaNaDqerLbMyMdWC6wTy+gnr5Ct
         /0DHnCpGBXceM6+E76gKFdgbA+R96BH+8zr4AzQfj88XqJ9dI3Klh2yf7Ihksh+RG4yn
         qkPkkIxYP39x/4nrIimEnZOcjO4huWnNR9lXV1JgklOsKju5rs7V27i+bhj3dgX4MQeg
         te+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946086; x=1789550886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDCh3/bMgci4uGVV65c5lJe37gL3Ra631LoM+SOniZI=;
        b=b6gcu4DpViToLClrlTmw3ms/E2xgAJRHP6hy21BcpCSEK/Hg0xyoZLZwei4BFQVihq
         0sqao51vAcf0qIj7WTXfd+Qgg/n3WylO6g3CeEZXFIPjArRzGDNBznGMmXnd3y5PHmG/
         TIgsXQHOeEY2Yt8Ur7Yv0fLedPcF+voGCPUtoNj3PSOLmFKJjfz34aKxR7GgsZtf48Gr
         jSPNQH2/abTRf05VbWhUomwq2O8Axhck1ahkyKK14TJJ6GcxAc4EEs3UzYcC6XbCAK4D
         4GyVT81M6j7jkOHVnhKRyoOqOJA7uRQKbuGVXIbk+Lan+wKwpCUN1zhPNU4DTbJlUpgT
         m5XA==
X-Forwarded-Encrypted: i=1; AKwUvBxO2WQT0Lk5NY6iQjRlU4eBh46qyUE9D2wUewVNlnz0oqNje20qu5cJr30gmLargarW/4G9rogUL+SpuPkJ3ei3@lists.infradead.org
X-Gm-Message-State: AFuF++l7qdaSs7ZXcsLWZQKipi1atRfSSjpkgedbo8+O7ugrbfgUvG6Y
	jXfbZ/IgsVFuyjbn1k5oSPHc5dedHJo/9KsX1oZUyCsxBJSgqdTp2DJi
X-Gm-Gg: AYBFou3SNNCfL7BU5T61TXKFrquNxa1JCYWIu5ZcS6MK7vXw1L3oCv88KabSyC9ysxG
	2W5NA0oUXaXHJCqtRMmQzAEQEBhaaMtYnxDZTGgN654OKoSbD/257QIgMFVAekqQyLpMtO5Av3B
	OeyTwWCR1iKVApLujqQGglhHh5oJrRR/fZvFcCgZ7tzTqgEku7J5XUTAn44r4TGu5K8PpEUYO8x
	/bCbAgL5t63wpi8fnOhosC6a5Xg1KkxWaEtbNbRMzt/OqImVjNMRNxLwQLNcpO3/vgzHOQzYsEd
	/udUuUlq/ymx65tr9q5cfTq+0aKdQPtqtXrym1mR+oiQHwF/JM/JEFx7ro7K0uXu1UNPexNc+Qn
	rWWl4fcET1khJZb5v741L6Z4U0fENbfjMN5eWRwetes3QwBe3Fx6/UWny8AUA/47esfgg9I6XDC
	YmBDvutjAr4K8xOiLXbifWxz33bbiX+SdC1paCezHuoL6wNPOA8NrJd28YlMmRkNy3O+RJLHILX
	DQwAGr4/l+5
X-Received: by 2002:a05:6a00:4388:b0:857:7317:cff2 with SMTP id d2e1a72fcca58-8616a266f1bmr50402873b3a.19.1788946086204;
        Wed, 09 Sep 2026 02:28:06 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:05 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] mfd: rk8xx: release the power hold GPIOs before powering off
Date: Wed,  9 Sep 2026 17:27:27 +0800
Message-ID: <20260909092728.1859-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_102809_284616_9D7E0918 
X-CRM114-Status: GOOD (  18.15  )
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

rk808_power_off() writes the PMIC's shutdown bit directly. On boards with
"power hold" lines driven by the SoC, a shutdown performed this way does
not stick: the rails drop and immediately come back up, so the board
restarts instead of staying off. U-Boot reports the result as a power-on
reset.

Take those lines as an optional GPIO array, hold them asserted while the
system runs and release them - waiting power-hold-delay-ms - before
writing the shutdown bit. Device trees without the property retain the
existing behaviour.

Releasing every described line matters: on a Firefly-RK3399 the board
stays off when both lines described for it are released, whereas releasing
GPIO1_D0 while GPIO1_B5 is left asserted makes it come back up.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 29 +++++++++++++++++++++++++++++
 include/linux/mfd/rk808.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6ab..fd1efbb 100644
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
@@ -874,6 +894,15 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 
 	if (device_property_read_bool(dev, "system-power-controller") ||
 	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+		rk808->power_hold_gpios = devm_gpiod_get_array_optional(dev,
+							"power-hold", GPIOD_OUT_HIGH);
+		if (IS_ERR(rk808->power_hold_gpios))
+			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
+					     "failed to get power hold GPIOs\n");
+
+		device_property_read_u32(dev, "power-hold-delay-ms",
+					 &rk808->power_hold_delay_ms);
+
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


