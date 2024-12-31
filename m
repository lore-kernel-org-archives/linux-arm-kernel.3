Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C01E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 19:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlDWSD9D4eFOrxR5d5GrT8K9grdu0sXiJhpdsmzP/Bs=; b=qvuaq06mrBnUkea/Lk7I8rEVCB
	h35oz6pqsg+RJiCcNx7E7UdW8hpHM5IdF+0JcwAQZklEXqexZaZD2/kA6B1ay9ZrfWB+bqh/AHlJp
	AlVA4aQPKU+xvDs/LHcW4NpyTgrlaKh4QOXL8WUtIXz2/wewb/T+VDRc5kYmCSqHevMzIAU6gND3F
	qi+Jm0uJ3EOZUWwaNyXFUKKDKxELHTzEGn35dFs1qYL4/OyOz26odRfarrVcxaewHNOo0TaLkvxzw
	Vt/2V24VijWgxTFo/I6TpNHZlQ1q/COkS2v/g8yWUjf/DIpiolMpyBQycemQ5NAeQOEwd2rkNXUQn
	JtjE/tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSho5-00000007eHZ-0xsb;
	Tue, 31 Dec 2024 19:21:33 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tShkU-00000007dkZ-3tjV;
	Tue, 31 Dec 2024 19:17:52 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso19892810a12.0;
        Tue, 31 Dec 2024 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735672669; x=1736277469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlDWSD9D4eFOrxR5d5GrT8K9grdu0sXiJhpdsmzP/Bs=;
        b=QLoaJQrBhbk9jh+cDbvZN41spwnTBfQ62yodEvfOlooNfnKGChqMdAoiNQebuWKHTI
         iHMIx8EHEG/AryR90Jm2bGk9NHegt/JPdaXIC6GnT9B9JCiVD5lP9Fee0WOhAXch2tW7
         ubxKTzjYtMPIjqRWOEr4dBATwUXwPHrkWjzvMwe5fV7c3+nLOrqsSJRPoKgF0GyjPS2F
         haUdTDfbcf69UP3bclZ1LEr2+BQNnEpI8qzgtNIwSlaD38I/DPz9OJjL1zjj5BB5KsBN
         LIHf+shqtekxnBWnfwaR9LbWVuBiX3ROhuma9AoDuaiXMmHDCVwZ6bl5zLiKXjl3oMsr
         V0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735672669; x=1736277469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlDWSD9D4eFOrxR5d5GrT8K9grdu0sXiJhpdsmzP/Bs=;
        b=LtMp9KyYBjPyZnt4EqlvHnYWEmA8iIcDwTUQ8JGYfC5R8/KnayxNYfHXzl/xE4sztn
         Mj1eTXKwXOkG3fkoN5KTabe680TZ7vr+d1KA/1nVzNU+jo6oNRq5IxVbNBnWyKp64jT5
         +m+gs0BHKOeQZ0fX0y1DLPhbiPWB4mr8R1mXPstaIGt3ibiQYC+ZHgdyv/HAgi0Tdzy6
         SlpogTI5GpqZ3F6/7VyyWje0DTndvTlBgYEYdybgVGUFIhp0ZEROPkhYT6x/j/W0yREN
         ov0r7AqTReqnIflyaosJL8Nj3ZeYW/pNjD5EXof9aAybyx9RxQrTHxvPb96OhZm9Jo9K
         XTIw==
X-Forwarded-Encrypted: i=1; AJvYcCU6+DSrpzFIdqD4HXmw4blONkcCQtzcB3SljMyETh++pEMEUkD6BUaU4nkZRuoLeXzz/qg8z3XE6zs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+NJL5okgFZj5EaJVmS5jzHyHcyJpF1TObN699W+HrvXheunIg
	obzmuqPlaZth1hhKTgsfnDFj5vpg+Dp1twt7DZYug9KovgfSGe3Qz8zb7Q==
X-Gm-Gg: ASbGnct1MkSVNN66PMfBFH/+HpMRrrmigMdNlCuKeFWREHJH2VSlCvG7HOOgzDwtV0Z
	gpfCO1l4Z0pMrbeFrbcx8Ts24ZTakTnbSDVWrDukCCY7QWMVhAIqHIHiH1DjoXvKRBnBKR2JRzk
	F/A3aH37N3+EAErEmEdbOz0kNMoOukFNdkzhg+621XChlE/Dv5l+MbU4ljza4sxnKnPoLYyfG8X
	FZzJaKUzVUUthcYapkVdMrEtmSsKWYU5sUtu6Pz8dfX5q2KC211v4VNWZrotulVXxF0poKeL4ZT
	mqSckvW5pbs8dAu/y4KwlnKgAyptN04tEiTxXx9J7P0vv6LejkVFpGqiutDKZZLtK0eYlFV/AZk
	UJ7SToYrxP74VIiQi+oCohOhy
X-Google-Smtp-Source: AGHT+IF9acAp+7NdPV6IzvYhctAufWO/ZujC2AIYiI0xxmTKMU+ZtZZw5R0wjHlrzSPEmkjGfjvvJA==
X-Received: by 2002:a05:6402:1eca:b0:5d6:37ec:60cf with SMTP id 4fb4d7f45d1cf-5d81de48c1cmr44247236a12.27.1735672668726;
        Tue, 31 Dec 2024 11:17:48 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b300-ce00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b300:ce00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a3d2sm16311780a12.16.2024.12.31.11.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:17:48 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] phy: amlogic: meson8b-usb2: Use the regmap_{clear,set}_bits helpers
Date: Tue, 31 Dec 2024 20:17:18 +0100
Message-ID: <20241231191718.2764065-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231191718.2764065-1-martin.blumenstingl@googlemail.com>
References: <20241231191718.2764065-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_111750_976733_7569BE15 
X-CRM114-Status: GOOD (  11.62  )
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

These require less code, reduce the chance of typos and overall make the
intent clearer. No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 28 ++++++++++----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index d9c761b7c15c..a553231a9f7c 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -165,8 +165,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 		return ret;
 	}
 
-	regmap_update_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL,
-			   REG_CONFIG_CLK_32k_ALTSEL);
+	regmap_set_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL);
 
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_REF_CLK_SEL_MASK,
 			   FIELD_PREP(REG_CTRL_REF_CLK_SEL_MASK, 0x2));
@@ -175,23 +174,20 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 			   FIELD_PREP(REG_CTRL_FSEL_MASK, 0x5));
 
 	/* reset the PHY */
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-			   REG_CTRL_POWER_ON_RESET);
+	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
 	udelay(RESET_COMPLETE_TIME);
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET, 0);
+	regmap_clear_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
 	udelay(RESET_COMPLETE_TIME);
 
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT,
-			   REG_CTRL_SOF_TOGGLE_OUT);
+	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT);
 
 	if (priv->dr_mode == USB_DR_MODE_HOST) {
-		regmap_update_bits(priv->regmap, REG_DBG_UART,
-				   REG_DBG_UART_SET_IDDQ, 0);
+		regmap_clear_bits(priv->regmap, REG_DBG_UART,
+				  REG_DBG_UART_SET_IDDQ);
 
 		if (priv->match->host_enable_aca) {
-			regmap_update_bits(priv->regmap, REG_ADP_BC,
-					   REG_ADP_BC_ACA_ENABLE,
-					   REG_ADP_BC_ACA_ENABLE);
+			regmap_set_bits(priv->regmap, REG_ADP_BC,
+					REG_ADP_BC_ACA_ENABLE);
 
 			udelay(ACA_ENABLE_COMPLETE_TIME);
 
@@ -214,17 +210,15 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
 
 	if (priv->dr_mode == USB_DR_MODE_HOST)
-		regmap_update_bits(priv->regmap, REG_DBG_UART,
-				   REG_DBG_UART_SET_IDDQ,
-				   REG_DBG_UART_SET_IDDQ);
+		regmap_set_bits(priv->regmap, REG_DBG_UART,
+				REG_DBG_UART_SET_IDDQ);
 
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
 	reset_control_rearm(priv->reset);
 
 	/* power off the PHY by putting it into reset mode */
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-			   REG_CTRL_POWER_ON_RESET);
+	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
 
 	return 0;
 }
-- 
2.47.1


