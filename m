Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B820C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdFnhhzQEC3jcbLOShIpWKd9ImN69zhVCCxS6xvU9/c=; b=gj8ypYb/4GiW2QLTu0TMvyDhdi
	DSd5L2qQ+0dMDcGj4SK8+e98jjvmmPh1ICeOXOV87KTrJ+SI5s2o+Jgb5nZpZbicGCJJizJoECF98
	gGnKytAa4EWbrcCoH1NkOQkBhsoRRkzQhRrJUmxZTSE3yRv0hB5HnjbLUFe5swKd2fqx1JVcuHcVP
	psfg+SUqUC9Qh+esiCa5UCPSSlJSbjruajlqpvag6LLkgq1iBzsxWEbOUC852h/79HoOvYOvEx9Lc
	yU8IArZrbwOo1fmmkSM0JTKWcOLgujAcd5ZnVcdotahHzN+B3+QFeyFd+1nk3+fV8xVo78v3n/HY0
	z4UvK3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8LG-0000000Cmwi-0Bvv;
	Fri, 28 Feb 2025 21:56:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Dm-0000000Cln8-3r60;
	Fri, 28 Feb 2025 21:48:40 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e4c0c12bccso4576480a12.1;
        Fri, 28 Feb 2025 13:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779317; x=1741384117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BdFnhhzQEC3jcbLOShIpWKd9ImN69zhVCCxS6xvU9/c=;
        b=m8byDSV8Q4dRVgvP79zOViwPCsuYRwzLsIgJXkduRNnLFMk5lXbv5Z2+n4/ixpuHMn
         TVNBYJJ+XtNpnvLkRnuhcUyvLE841tKquo/sx2ppJwMs6TN84LXNuJMOQ4floH5asaEm
         wsHh2QtFKwyyMfAELJHeWWoW3mGw85wZnXSgNWTRZOM7HhXIwDUtSm27meR2DV21hzi1
         gEXEFo04Jef2acCgDwn43xO19EKo+krdriE0HMDhcyBlRcf8T1vOLTVg31eUOeAh/FXx
         B2y+Xl6ZBP2HLPWJWT+xx+WgDgL6BVIw/Oj6c48r5TbC4vffndbKg4AQS/d2BQ9VuSlK
         zstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779317; x=1741384117;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdFnhhzQEC3jcbLOShIpWKd9ImN69zhVCCxS6xvU9/c=;
        b=uNoWgHu7ED+cmd4xgJRygIbVRWai1tq6ASFu19+k6z0CZwpckp10mKH2rqwdOPucb2
         B+HWS9jMB7k0Slyc/FQjhYzap04Lv5cO9qekk1fX3gY8iHH/70JeHKaQFOpcXmCxZayM
         zpxSWwf3asxrHqZr5+TkA5ul/+NM0HZeGIbGoIfA+O0ZQOWfSwKhBDzwBeZn5u+fK82G
         QzQyw7MQk4lrdJ/JPk0rB2VHvET0LnpSpyPSSz1O+Sfj0q9QU1Zn4S2n1EHfy9TB4tU9
         ILvsddr/HgJfPAMD37aj/9DuY8AuhrcXeJRZ+oESLd2R8tF9MAqdwwTok4qeCbajd9QM
         QSmw==
X-Forwarded-Encrypted: i=1; AJvYcCUgwEmCpK1WcUd2H3TC13Gf68YdVy7XLr56XUj0q1A2Y7871ZozibI207h0o2qpxSYT/8Lwez6Arb3Rn2jHM9cZ@lists.infradead.org, AJvYcCX+WQOmIB4IDecckCWmr3kR1XNpBHc927QV5w/SKKIsrFfG2pkh0eNAi7LFi87xAW8rbP/t8qmAlEt/3HO65OE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRg7usLsAyuB8QdQSuNNROn4X4hLhgr9eXNtVwXT2WwYvWzajO
	wVe9CYo9rQ0dxTHmgy1me8Hnxn2Uz/IXhcI1Caow+BmnBvyZRELz
X-Gm-Gg: ASbGncsDP/dPAzNI9PWul09JnQJg10T2KmK359U7AEfDHBeQQit7WxLXsJyTeMwmkcg
	QMocjo8xK5K1eOsDE0w4sl586q55K7/JfB10G+blD5GVOjTc9HNPtQ1n+Xore7eJmP2oiH54u1V
	w3A3C03AghF6ym9d1+SmWSPuE3nkLyiPIqiW6Zpp6axI6BgyAesyS/J8SmsOcrvGrufnLoGjz//
	+eh2v4qA1FVLJ25MUHALU8FJ4gHi2jfPtrAIg6hykoYprC8heOROVqrS9NQyVNt86FFW4wj8GJb
	nf5Un1U6WUhDTFhcTolv1pCxEGREdm5j82KcHxsnm7wr07ReBOIGHCU/BPZchlsrJkGLd25l7dX
	/9bA9IuCSApS/UI8uXCcjHpBBppSiJX2aBuPb4y3/GKnHi+LslId15wcWbbtPWE7K46VOMmvtiC
	rNydmSmJ0iHSvR7TK7rA==
X-Google-Smtp-Source: AGHT+IGuc7T5ZPUaJlrjeMMzg7I4sdxgXUWWoxuE3TuzE3PG9L1NUSegwaSuEsT0oIrc2J6ogPxZTA==
X-Received: by 2002:a17:906:c108:b0:abb:eec3:394b with SMTP id a640c23a62f3a-abf26822d5fmr478801666b.46.1740779317355;
        Fri, 28 Feb 2025 13:48:37 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf4b7385ebsm42461666b.106.2025.02.28.13.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:48:36 -0800 (PST)
Message-ID: <0edd6489-ecf8-451b-b175-6d6bbc6b9a1f@gmail.com>
Date: Fri, 28 Feb 2025 22:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 5/8] net: phy: mediatek: use new
 phy_package_shared getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
References: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_134838_982721_673DB422 
X-CRM114-Status: GOOD (  12.22  )
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
 drivers/net/phy/mediatek/mtk-ge-soc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 9de6fbb45..175cf5239 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -8,6 +8,7 @@
 #include <linux/phy.h>
 #include <linux/regmap.h>
 
+#include "../phylib.h"
 #include "mtk.h"
 
 #define MTK_GPHY_ID_MT7981			0x03a29461
@@ -1278,7 +1279,7 @@ static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 
 static bool mt7988_phy_led_get_polarity(struct phy_device *phydev, int led_num)
 {
-	struct mtk_socphy_shared *priv = phydev->shared->priv;
+	struct mtk_socphy_shared *priv = phy_package_get_priv(phydev);
 	u32 polarities;
 
 	if (led_num == 0)
@@ -1317,7 +1318,7 @@ static int mt7988_phy_fix_leds_polarities(struct phy_device *phydev)
 static int mt7988_phy_probe_shared(struct phy_device *phydev)
 {
 	struct device_node *np = dev_of_node(&phydev->mdio.bus->dev);
-	struct mtk_socphy_shared *shared = phydev->shared->priv;
+	struct mtk_socphy_shared *shared = phy_package_get_priv(phydev);
 	struct regmap *regmap;
 	u32 reg;
 	int ret;
@@ -1368,7 +1369,7 @@ static int mt7988_phy_probe(struct phy_device *phydev)
 			return err;
 	}
 
-	shared = phydev->shared->priv;
+	shared = phy_package_get_priv(phydev);
 	priv = &shared->priv[phydev->mdio.addr];
 
 	phydev->priv = priv;
-- 
2.48.1



