Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17950C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X0kiGyCc19auOwBum2qDP1udARgoeuAtiwGA+19Ip6k=; b=4SHyh2OuJQF4mpQL9j2iFCSlbg
	OXhpSRKkkJvD1isR44o6ifpaS5M3a0ucsIS408AFdlgyYxajpYWW9B7d3fSVXQQ/P0ydUwX3Pcxhz
	4aqpEV9SWL28+LobU8icwI6kpIGgnyx3/Gl76lEy20fa+FswuP9rotuBVPlzWwCHQes/PBNarRB0U
	8V1piGwZRMXHwincNVJHbSs+YKzcnCwjQgVyXyCabJ525LqwSloJ1Taui9l8Ci8rLDqvLFVkL6bvN
	LhNVNMfx2XgxmDHhHdUm2oGDwbPgsI4Dto4WN+VtFx/HalDmp6HEJNVptYViSLCpWnLKry50pZemm
	0pG9Lezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5O0o-00000000ul8-2Xc5;
	Sat, 12 Sep 2026 13:43:22 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5O0l-00000000ukH-3ViZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 13:43:21 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469d249c4so911993b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 06:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789220599; x=1789825399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0kiGyCc19auOwBum2qDP1udARgoeuAtiwGA+19Ip6k=;
        b=mAWEBfI6bjsYFZUWkx6aNdXBLv8DBqXnL1Z+vG8hG1wwMWMG4b0H9fE78YfXBGOpq9
         wtISY2bRhofOCSYFszNze5RmnDzHwnnk3mEq4ZM4ew2DUtD2r0paSUgqgp6TFluxTcVX
         SpfUAyhqq+h3bZQZjQhnI4aW2bWUgpnK8aozrfSI1vrb1yXQOkRsN+SJlP1pKi8A9BNE
         31Nlr4/GewJLF3JaDm5g4M4WdtwQgtffrwoq0xtHDqGd6wcmigW5SxcXDfb2l4WMgxKA
         IcDoJFYgB1JMfWgCq12zp5woMnAzFMudqoJnMWtvOYPzQGVbOr01vyQ6f+AY5Z3Qb8a7
         aViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789220599; x=1789825399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0kiGyCc19auOwBum2qDP1udARgoeuAtiwGA+19Ip6k=;
        b=cYv2q7ZWabJ1pFcidsRnUtZHzV56Mq0fppjMaRtjGIJbwR5GayaILPoxmGAz85tYDx
         narGPvYBgmCCB7N21SOZ15XzJjIdqR84VSD4BwDDRsuG3lU82magYjW12NZXX3TlkskG
         eBn4Hiz9XsHfEKrn4e+TBxXLZYaAEekMzOrm6YZQRNm3t1tVkNHzw0h+QGuW4qw8HSQo
         Tuoak+HMccNv9Qo2hdebAXkKujx71UGWZ3P9i4Aj7htC9hZ79VneXlAmbIgzr4Tfmf0R
         lZIUPZHI8qpm5YV814fAuXxmJD+DWl9k6kA8yEFqZFyD1W1N+j0wSESueguRhklwOc/T
         G3bw==
X-Forwarded-Encrypted: i=1; AKwUvByn6dx5CIX9fH+Ddwqx/A+yJoGlzMEO06H9f/d0arRtB3xYMOC06UqNiT2JiSAegelDHusGLJU8kdi7JMHqPsJA@lists.infradead.org
X-Gm-Message-State: AFuF++lWojJNX83a3M/sgF9pDvSgC9uUjvGuXnFasTzLL4htgAF+VB31
	NWsz5bGJFfoJ9ZxZBUFDMhcExAxWX5GBIDOwbhlg32p6LT1TIfO/yuGX
X-Gm-Gg: AYBFou0ryeG2vVJX2pweAjW4hwaCtI/lKjZiu6f5V8Ipy0rb/d+X4V/8u1sitH1TqGk
	ybY6ZEbhoFAPPbhHsvoizy+0ZnOcVp700IbMyAk+TVu5wRWS3eKtnvHQ0X8Fc6gKvI8DSEZflkJ
	KoaN/ygBub7/3Y6ppz7ErCxBl6fd9fJOi+bFdW4CLNOu2ucLRAGRQVpWZkNg4xYR5MZtSTCrNfe
	PV1FMgQODvHjjcfW6q8Ctzn7PVLqMMwD1Z5j6oj10ZDTq/QGHxMIC5b3JWPvvRLfviduoAZ21vH
	HfdE++BE8HigIE2EqAycle1Hyznc25Vtfv4dfynLkfjrzjIGWfEvNoE261qV/a2D46HVApdgoTP
	8+OOIjukIpYewnjY/ZccO0maYJI1NxA12EadL1/Nt16fucH0JG/fA83oKzxCbAmIX/rvvK2sPyF
	awIPtibzAVh7F4RWDIzhwLz0mYUTbJ9kRdlexigZFNmEtSLjrCkoZCyh1ZgaNfLXqh/myClPF24
	JUyHaFRisg=
X-Received: by 2002:a05:6a21:6f88:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3daed3197ddmr18121705637.13.1789220598571;
        Sat, 12 Sep 2026 06:43:18 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([157.51.208.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f06423sm16362396eec.20.2026.09.12.06.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:43:18 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net] net: phy: mediatek: do not report link and per-speed LED rules together
Date: Sat, 12 Sep 2026 17:43:06 +0400
Message-Id: <20260912134306.3544329-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_064319_885453_DE6FAE03 
X-CRM114-Status: GOOD (  15.51  )
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

mtk_phy_led_hw_ctrl_get() reports TRIGGER_NETDEV_LINK whenever any of the
speed bits in on_set is on, and in addition reports every individual
TRIGGER_NETDEV_LINK_* bit that is set. The netdev trigger refuses that
combination: netdev_led_attr_store() rejects TRIGGER_NETDEV_LINK together
with any per-speed rule, and it validates the whole resulting mode rather
than just the bit being written. Once the hardware has any link bit
programmed, every write to the trigger attributes of that LED therefore
fails with -EINVAL and the LED can no longer be configured.

The rules are also fed back into the hardware: the trigger stores what is
read back, and a later write of device_name programs it again, expanding
TRIGGER_NETDEV_LINK to every speed in on_set. An LED configured for a
single speed is thereby silently widened to "on at any link speed".

Both are easy to see on the EcoNet EN7528, whose four PHYs share one LED
block. The first LED programs the block correctly, the second reads those
rules back and rewrites them widened, and the remaining two then read the
widened value, so an LED configured for "link_10 link_100" ends up lit on a
1000 Mbps link.

on_set holds every speed the LED can indicate and is exactly what
mtk_phy_led_hw_ctrl_set() programs for TRIGGER_NETDEV_LINK, so report the
speed independent rule only when all of them are on, and the individual
speeds otherwise. The mapping is then the inverse of the one used when
programming the LED and round trips without changing the register.

Fixes: c66937b0f8db ("net: phy: mediatek-ge-soc: support PHY LEDs")
Cc: stable@vger.kernel.org
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 27 ++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index dfd0f4e439a2..608072fbfde9 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -156,20 +156,27 @@ int mtk_phy_led_hw_ctrl_get(struct phy_device *phydev, u8 index,
 	if (!rules)
 		return 0;
 
-	if (on & on_set)
+	/* TRIGGER_NETDEV_LINK must not be reported together with any of the
+	 * per-speed rules, the netdev trigger rejects that combination.
+	 * on_set holds every speed this LED can indicate and is what
+	 * mtk_phy_led_hw_ctrl_set() programs for TRIGGER_NETDEV_LINK, so
+	 * report the speed independent rule only when they are all on.
+	 */
+	if ((on & on_set) == on_set) {
 		*rules |= BIT(TRIGGER_NETDEV_LINK);
+	} else {
+		if (on & MTK_PHY_LED_ON_LINK10)
+			*rules |= BIT(TRIGGER_NETDEV_LINK_10);
 
-	if (on & MTK_PHY_LED_ON_LINK10)
-		*rules |= BIT(TRIGGER_NETDEV_LINK_10);
+		if (on & MTK_PHY_LED_ON_LINK100)
+			*rules |= BIT(TRIGGER_NETDEV_LINK_100);
 
-	if (on & MTK_PHY_LED_ON_LINK100)
-		*rules |= BIT(TRIGGER_NETDEV_LINK_100);
+		if (on & MTK_PHY_LED_ON_LINK1000)
+			*rules |= BIT(TRIGGER_NETDEV_LINK_1000);
 
-	if (on & MTK_PHY_LED_ON_LINK1000)
-		*rules |= BIT(TRIGGER_NETDEV_LINK_1000);
-
-	if (on & MTK_PHY_LED_ON_LINK2500)
-		*rules |= BIT(TRIGGER_NETDEV_LINK_2500);
+		if (on & MTK_PHY_LED_ON_LINK2500)
+			*rules |= BIT(TRIGGER_NETDEV_LINK_2500);
+	}
 
 	if (on & MTK_PHY_LED_ON_FDX)
 		*rules |= BIT(TRIGGER_NETDEV_FULL_DUPLEX);

base-commit: 78445023439506ebd83b86d40b1e428a3b309d4a
-- 
2.34.1


