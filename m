Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3A0CDE010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgKlTRWioy8kXgksSYTtP9/6nxuXPAzFM1tEK50x9tY=; b=nTPPoagFU9YgiFxiXiF9tMs+PO
	yLXd7L8BeDTyAUOcr5ivBpxisMzu8+lsgV9LPoas21nr84JHkisK0dkq3dtNl+nJpxdVdQezRE7ZW
	JXo81DA6B0n6LKe1AhVv3W3gCxMUTKfDUQSpdID5bEFx1ob8gbvmdsOXyKwgWv7ZngcRgWxqDdEdE
	j0rfChwitdDDgSAvznJjYvBgV2qWWGaN2uaZcPyP/iEk84o6gxuv73eKNagKmfLPapqfl6QTS/vha
	XA6sPqWOO3o7GTK+/taPNbiAkFfEc78zWE3cPKKP4wO+9s3er9bvkBzJXzjWdIS3Gx7BdI5yVNqkD
	qNlPfdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco4T-00000009b1D-0EBP;
	Thu, 25 Jun 2026 17:41:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3I-00000009ZWH-3TEO;
	Thu, 25 Jun 2026 17:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=ruBtnU9fcvlmOi8TCq7YktiPK39rJta6lg+2Ib1r5XI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OoWDn4iG3Sx2AU8o9AaGU09Zv8b9YVfSMvKCWSua8F43AujK5MjrzwjMKgdA013ke
	 bJkwWp5qqf5PjC4Clu66ARK8CDTz3bk8gbf4q6LOAnrVDlHjIoT7tRcx9rDf7WDFXX
	 9NIaoZU6B3N5yuIc3VXMgZVSkhXo6dlvjKcdxDOkrpiq7sdccQTJtLHZD11zevh90q
	 Yup7Ai67KHTR/x7a1r3/cmv1AThjMLXCx0n5rIcV29qvoJ0HgF/CbuXRsHL8NQXs5Q
	 ofvwhYwe03bigAT2OygKr88+mAkpUciY5l/0vJ98KpNRMQJk3T06gNEGBUYtWVQ92+
	 gBuC5P3ZhZd5w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C080B17E14FA;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 09772480047; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:38 +0200
Subject: [PATCH v7 11/27] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-11-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UNwYK90fD5pSR2p65Y2qi/qMgPthsyXmZolR14Z7C9o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9t9WUlQpiYWI8TZjyKzAuTvwcMUf4y1t
 H5QAl/Rr00z54kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaq9oP/RRBzLX7vpNiXw+y42oMMChx1XwuYRmjuGANi9Dv/sqKLkaWUITPGD86lmlp6MFp5m3
 MLwGehw7Qwy5vawNOAn3VmIZewXEiLH6n82uRs/3HhMt6SmKkpDWzEOp/MO7A4R4849uTj+2iLl
 g0tpf9m2FbZr4Qe7yZrUxM+xxZ/YIMR9fZR/LsBltzX1H1PFlLTDFxS2pyeC8jlICa6ex7wvzbu
 8XSp8akq5pGxvudCgUkH8wX1KLYsC5I2yw/5MOiabt8/KVDbf9hiCyUXJHlgrw29ckAQMn/kOJH
 GXbT3ZuVZRriLc1P59jWcUej4yHJh/3NEC5TzisURZEk1/AyNp9P1uVPY0K8GvUk5jQxtaKv38U
 Gli/UWEcxXL9P6GtR6gGo4Dv4uwHE0h3UR1LClGCx2NXKxughEFcWccWKUY+1pIs1QLx1sV3GEn
 VjpzTbaKnPYiYlPepKAj2GQH/ST0bZAAMBKz63HH4njZexRheRqkofMF/XZiz2kwUt3/xQsVuMU
 8jitcOa1V6FeOOok57JSKa0c0qRjhSyHFfFgjvKu8ZQXkqclFSpFdODYwNLP02hm7opMP/R2xvR
 zKet3Q/mJif/hXUGOdBTmYIAHwLpZdG9ZzzBFWjrpNv6Z9nAAXHH2kQRyzaW2Ct89T55iBi9yS3
 EG7l5oqBW6qlZ+qgu5WE0Cg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103949_116682_53ADC869 
X-CRM114-Status: GOOD (  11.03  )
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

From: William Wu <william.wu@rock-chips.com>

According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
the device under test(DUT) must not respond if LFPS below the
minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
platforms, because the default LFPS detect threshold is set to
65mV.

The USBDP PHY LFPS detect threshold voltage could be set to
30mV ~ 140mV, and since there could be 10-20% PVT variation,
we set LFPS detect threshold voltage to 110mV.

[1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf

Signed-off-by: William Wu <william.wu@rock-chips.com>
[Taken over from rockchip's kernel tree; the registers are not described
in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 93df673e181b..1067ddf2d742 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -413,7 +413,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x0024, 0x6e}
+	{0x20d4, 0x08}, {0x0024, 0x6e},
+	{0x09c0, 0x0a}, {0x19c0, 0x0a}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0


