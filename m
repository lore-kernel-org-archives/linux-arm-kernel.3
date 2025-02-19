Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75C8C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbZmcot8Eg1esviTkY9r0HKtYQa8aOZEhqkLR6boS78=; b=gQHef7WE+jj+zgcC9UU/DgAsKZ
	AX0N8sxB9KLGJdqjLPSoLojv/fn4S/tBHWY3QXw2Zx8uaW3yyjTQ9UgmOCrvpwLfEBR3j0UlMc0v1
	sRvnfkNh5UZH2PkpSI52t4JjoyF842gsdSF6zMohGo0e6we1nQu2Y3l9/bgtoO8QKbuBw+R8AxnXp
	WhS+d6IH0OqzPqebQxM2ztRZKmSHxXgR06RY7Yit1JdXu6rGBCIpu25fJq9lxhjLb4pMYIa5rlTOO
	43+QwoTyrHjXJe5lIRwMh3VTdbh7ggx7SNZ1jKoqbxGOipqGr/JCqK+QOvdkHoFZA27tZiDUUWJGY
	qaBVyp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrQp-0000000F8nZ-1cSF;
	Wed, 19 Feb 2025 21:16:35 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrGm-0000000F4w7-0aS4;
	Wed, 19 Feb 2025 21:06:13 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abb8045c3f3so34450866b.2;
        Wed, 19 Feb 2025 13:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739999171; x=1740603971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VbZmcot8Eg1esviTkY9r0HKtYQa8aOZEhqkLR6boS78=;
        b=QhJ3jIMOh/Z3M76rHOqepw1HMpCVHAenskTPKAA0mftcT/SvMKuuRc/I6ZUOl8/eRk
         7mssGU8BD4s+CUS61IsbN2xETYG0Q0lIdgJunp3152/pp2zpppo8BVx/SVlwXFSwb6Wp
         sDEu/UiF4d7/YAwDUWMSQNttwzcew3sQw0zma82yqB81LbX4S0vyeUfE+LethRk8VL4Q
         E/72Y11VGnCD6kTviot/THtODz6v56NdhawA4HwIEPkbgCmlgv8tuwXUA/hfrkw1wDDz
         JG3lB+fFISy/332jX9omq05933qcNKsggjGoX2pMG3PrsXHQRaFqFqnnHsUALO3Hov6S
         a+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999171; x=1740603971;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbZmcot8Eg1esviTkY9r0HKtYQa8aOZEhqkLR6boS78=;
        b=DuSrqf/x4UOqLpDp/3AFqtLjJIf9ZyREmdxDRiIxm2VNFHe2cWvHZfs7Ud3FTxQ1EJ
         1LiwN5DeSuzJR+3/4LuwyI8d/M/EiclW1/wpYiw7NuM00aydX81gMzW1j0AN1B8lWy+E
         VJNE885kJgnRcA8j5EPIkAGJja/Ixf7DMxJ7IFITv5z4rUYeSfdyKMOAOyH/CL1En9wm
         7Qi5Bfd7LULBu2YG9zto5D38MPCxlgW2tgprMVTUdG+yl865mm3k9gvqi7ksxScV+pho
         a6rqfCDsfW3z1KsEbWu6LOoNTGS4g0kvcVOSCw6Fia9l+ksoV/cEOhHYry5YFGXOXLln
         Fbqg==
X-Forwarded-Encrypted: i=1; AJvYcCUP9kVC5lo0UvBPwCVyvS2F9pSXhopF9pwMa+kMxJBzx3uwGmYsynposWAyEtjDeWarIF/3rQjTy4qrVtsHMYS+@lists.infradead.org, AJvYcCUuwSHylQPUG26QkjZBf2t+DmVy3UgxZbzlBX7OjUfd254otKOWAC+nUs08PDQlhkgnd7Y1JjEw4BVFtMWA430=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsVh82M1mj++5TJ/WHTkNIBJX6Yh3NViYkifpmh1E6SvenbxZA
	/8YezuBWIP52bXH9yGMnmpPQsAvS0S9Jo8W247xwGc1JkLcCJ3LL
X-Gm-Gg: ASbGncszU/jDuvrQxFuKh3qPDRu6J/BsiigU1CNqArFaU+gXfjN+fqD1nNEh6X/dvHV
	hicmopoFix+4dovL36N6Zdth/FF8sQu3sm+a0gVb1Zqh80RMJZfonu3fIumxMZGKGpYEwtxfPg4
	BZB+AX0QRiJrk6TMFJx26uL6XgqSGIKUPay7ctL9vfcjrd9YSg0GECUW+33vZGgzulN+VRWrrmU
	YOy4DfAMJua9gpwDC9fonFApqwjigHZp71lrJ/eFf4uvb8sBvLtjiApEGx8fEszYLPthyYud68K
	du29dKMgodzcGwmNbcWF/uthzbieHhLevTXz7jVAlSBaIfBVFQ4+U6k2UbNBawrnJrMFYuDvQ+N
	yL8O9DNouvIdZ3L7MoUGY62CJr2k84eeljxuPL/vieja4PmLPRG4tAYUdlGk72r/BTWelx9P+Me
	kp6bvy1Mo=
X-Google-Smtp-Source: AGHT+IHjndRED0hE6QMhUpOfvHONTajTDrwGIQ97O3LRboYxeIOv3iux1jtAZ5e2Nn+9QtnWU2VtqQ==
X-Received: by 2002:a17:907:60d6:b0:ab7:f0fa:1340 with SMTP id a640c23a62f3a-abbcd0b2d3dmr580914866b.50.1739999170486;
        Wed, 19 Feb 2025 13:06:10 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abb989d89edsm681114166b.81.2025.02.19.13.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:06:09 -0800 (PST)
Message-ID: <bbf97a74-c601-4eff-a302-15f5d525f85e@gmail.com>
Date: Wed, 19 Feb 2025 22:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 6/8] net: phy: mtk-ge-soc: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_130612_184152_C39D367B 
X-CRM114-Status: GOOD (  13.76  )
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

Use the new getters for members of struct phy_package_shared.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index bdf99b327..c3ed97937 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1190,9 +1190,11 @@ static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 
 static bool mt7988_phy_led_get_polarity(struct phy_device *phydev, int led_num)
 {
-	struct mtk_socphy_shared *priv = phydev->shared->priv;
+	struct mtk_socphy_shared *priv;
 	u32 polarities;
 
+	priv = phy_package_shared_get_priv(phydev);
+
 	if (led_num == 0)
 		polarities = ~(priv->boottrap);
 	else
@@ -1229,11 +1231,13 @@ static int mt7988_phy_fix_leds_polarities(struct phy_device *phydev)
 static int mt7988_phy_probe_shared(struct phy_device *phydev)
 {
 	struct device_node *np = dev_of_node(&phydev->mdio.bus->dev);
-	struct mtk_socphy_shared *shared = phydev->shared->priv;
+	struct mtk_socphy_shared *shared;
 	struct regmap *regmap;
 	u32 reg;
 	int ret;
 
+	shared = phy_package_shared_get_priv(phydev);
+
 	/* The LED0 of the 4 PHYs in MT7988 are wired to SoC pins LED_A, LED_B,
 	 * LED_C and LED_D respectively. At the same time those pins are used to
 	 * bootstrap configuration of the reference clock source (LED_A),
@@ -1280,7 +1284,7 @@ static int mt7988_phy_probe(struct phy_device *phydev)
 			return err;
 	}
 
-	shared = phydev->shared->priv;
+	shared = phy_package_shared_get_priv(phydev);
 	priv = &shared->priv[phydev->mdio.addr];
 
 	phydev->priv = priv;
-- 
2.48.1



