Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C032C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NSuSoLSh+LHiSs84RzlVPklfrqct9bYGikZDMbgQUs=; b=G629tX/6kB/EZVmHN0/g0cq69H
	TY8J5qzbYnetdc3KRcGJjp1zGiJ+g2sIQ4gXRlT/Q+62trJQgj1uCNigw4Rb3WXykrvbmUs1qZJaK
	WhXJrqjHkVB4Kzd3Cg7A2shXMJTU/RENzJbIla/IzQIxdZuj9QS3mmyAfdSQT3tH9J9ixDU3txLeI
	27FvFopD805nl8dbBJ3HPLgMLfjv589BZAGkZVVxJqZ22Qn598c8zDvnjJvZJBQXznnZFFkE3el+Z
	Ub8Xa3lmf7n+lUQYZzfGAeEPobayOLq6yynqC/5hlk5kl2iNdH/i67JwaAdl+9kbQ0hyFk/OA7rd3
	6e/KwX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7fu-00000001Pp8-0kwV;
	Thu, 22 May 2025 15:17:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Hq-00000001KTR-3gCl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so85556565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925565; x=1748530365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NSuSoLSh+LHiSs84RzlVPklfrqct9bYGikZDMbgQUs=;
        b=eO2Zaarqh1PP+dqDf64qZpW90cagJE/um7123ctc4hbn0kYkGG/X2hHim0DvEnfimS
         OzwypywzVHEq3JvXViA2Hmz3A5bQ13Y/4MYObNOr7TpB0avCv8CKC0jCyH738g19Wsg5
         8seQLG2MwkKMOONE+Lvryuxt2rGBIs+4auqbOL3tBgN5tpt84jGhvrwbT0GTCeQ3HnWT
         BOsuwEIz/hXzuZZF96Bi2kCgnQj9t3+i5gStzuet2N2aMgoWVXj/v89o1Eq7OZ0toZXX
         N5EPvomLJbQTWvL9MgL7Z//9yRcfoM8wWzYoSw8dDAq/j3SWVzD2QmGH9IQDY8FiQJ2h
         XUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925565; x=1748530365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NSuSoLSh+LHiSs84RzlVPklfrqct9bYGikZDMbgQUs=;
        b=RLYHUzQQcAyGt4A9G375wfuDluikTi4tkkhFuDYX4iJok8+DpHYjDw1+H/CzFwS8/5
         f5VZvh6WlxXBZDXP48PbY4/RLzC/wmqpDnH5MGva9UUUzZLU/EeN3wiWPs+82p+MxroT
         SS3b1yxWCypBqnSqeTkaepPBmk2SlE+vCJV3/ADxHOQ4+YD0wHnkyesx+GV+FU1Vukxx
         J35ZlfWBCZcJzzTAf1SGnEP+AINR/8BWicuEK61+HTaqE3hVV529SFWmbuDtUUuJiENk
         kOSOHZQORrOsVfMP7+8SSwKNZp1O3Bgk1FXDQqFzoG9gI+c4cByrISOY3sX0N41fCIsx
         MKQg==
X-Forwarded-Encrypted: i=1; AJvYcCUHXnCCS0+dBolcFqFk2AG/GVJFceB9NrtaTyH2S8oZiLeBpaIaLqh+ykX6DJCD1IB0g7ikfY6mV6lEqYumoSol@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk9C5le4xhb4owTm0KNECRq9ybWOfY1KhOZP+xXfnolsWxg8XO
	dnbKogD34p5PUlDap2vfjudzRQQmmh6rvqjLC16xMGtn18HTfNBC8vtI47cjAWQ6FCM=
X-Gm-Gg: ASbGnctamfD/rzGve+LWTlM2tfClQHH1NeTO3RKYc14QCqbNI9z+wHRln5Me08KHhPP
	YTq8YpDZj4VAG9H/lFQY4yZY77K7P08aAQSLZOPxo17SM7OAQzqkWyXwtrSYHcba4qJ5dCSJknf
	k8dNXe2/5h5ZCpmAvIJmoNCrjP8OvV/2vQclzoV+V1uTHDJdHRFn6u6T78hcykJUMQWNZQk+7GR
	u1W8gykMoEF6i/wNr0vmCb0x6opr6588QWjRn3rBbc1o6Y9Wvf1ZElvOcJrWi7booJSRLDWLyK/
	3oDqRL0mhRWWQiMS0wxdAPtGZyGoJ9NJcG6E74Yt7r3PBVKmHfJRrjQNgQgT
X-Google-Smtp-Source: AGHT+IG7lHM8gO7TjtKSOgQg+mAp19Lx1pEqwgmpnkH4a719vOS4PONUqtAkN0R9pGn1dejyXRQUIQ==
X-Received: by 2002:a05:600c:870e:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-44b0c60f240mr12764035e9.17.1747925565562;
        Thu, 22 May 2025 07:52:45 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:45 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:33 +0100
Subject: [PATCH v2 04/14] spi: spi-fsl-dspi: Re-use one volatile regmap for
 both device types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-4-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075246_922151_19E69E2E 
X-CRM114-Status: GOOD (  11.30  )
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

max_register overrides anything in the volatile ranges, so we can get
away with sharing the same one for both types. In a later commit we'll
add more devices so this avoids adding even more duplication. Also
replace the max_register magic numbers with their register definitions
so it's clearer what's going on.

No functional changes.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 863781ba6c16..09b2b25ed274 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1209,6 +1209,7 @@ static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
 	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
 };
 
 static const struct regmap_access_table dspi_volatile_table = {
@@ -1220,31 +1221,19 @@ static const struct regmap_config dspi_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= 0x88,
+	.max_register	= SPI_RXFR3,
 	.volatile_table	= &dspi_volatile_table,
 	.rd_table	= &dspi_access_table,
 	.wr_table	= &dspi_access_table,
 };
 
-static const struct regmap_range dspi_xspi_volatile_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_TCR),
-	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
-	regmap_reg_range(SPI_SREX, SPI_SREX),
-};
-
-static const struct regmap_access_table dspi_xspi_volatile_table = {
-	.yes_ranges	= dspi_xspi_volatile_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
-};
-
 static const struct regmap_config dspi_xspi_regmap_config[] = {
 	{
 		.reg_bits	= 32,
 		.val_bits	= 32,
 		.reg_stride	= 4,
-		.max_register	= 0x13c,
-		.volatile_table	= &dspi_xspi_volatile_table,
+		.max_register	= SPI_SREX,
+		.volatile_table	= &dspi_volatile_table,
 		.rd_table	= &dspi_access_table,
 		.wr_table	= &dspi_access_table,
 	},

-- 
2.34.1


