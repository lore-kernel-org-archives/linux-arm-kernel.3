Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFDCCCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 05:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=; b=AR7n/Pa3/yrNAXGWC1bsRIuA61
	YhAa0VhnlRUuatb3cZlQLs8PQkhO2/J2mK0OoVHD+EWYBeU0lTht/EoMcibE8kloKCGZsa6XJTOHP
	V32BNevFkymTPCX04qCCRnBUAZtYWvFpCD6Nq4IcBY1VzrPTiCSmCzsZ5IYJYePW+AhrS8fBxeV+0
	qB5o9rvV9l769VYdn3/cf45RKxRafPD/6I7cg2Jvifqn3MLi9/Vvgcl+mQCFXDzMBuZAuQeehhSuA
	Sl894YyMs4pmZsprj7aX/I1YFbg9qYJ1QyPDi4F05Vsln4kr1bI5dPydVrrv8UYwCsBCZDyD/iOQ7
	NjaCWJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxDy-00000004SKF-1Hqt;
	Sat, 17 Oct 2026 05:44:54 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxDs-00000004SIm-1Eno
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 05:44:52 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so116907a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 22:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215887; x=1792820687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=;
        b=S8GXOQkoRVa4Vp+MctM3oo+VKKIOl2U+WEq93Xw2yQPz6XRerUSpD5OiKrtkB65pCv
         qMeqOHGMoX6Xsz14e30KNYAsmTMj/LToq58pAd0L1JB2RH1lzRk4EWyOHMzihBxFvzQT
         5EDgwS66mwQxxKACdjwByQRZlznZljGknYZ4WKI+vuX/aDuuRs7mxtO69Re22KRa7DC2
         bMRqq8+fRjETOaB2sKBoOTq6WwBOcy6bQeCsi0G9AO3GEZfTzKwr172JL8rEKELf5Mkr
         wloopGTiIq6jBip3oRhAcG5xS5+NgvN5R1sWLpUPqCJM/XMZQVPSWevPXJVP/pcYpAGn
         yu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215887; x=1792820687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=;
        b=ENlJR62s4ZEtLJM1kI8cyDHtJjHphZnhlGcXosrLXeClsBNzU+QifDByViGyLaRvBr
         DRreOhkzgeObg+i36nXQLn9NL6BZ5T5EycFcCVhlYQeNvgz3aVuXx+d7aC53uPbmE0zO
         z9L3q+0WgW00+6F9jr4gPNHAnFdJVyoFPXZJWmg4UjfOR3rnXvCOPIHxmoQT86TS6udv
         8qAr5Srwlz3bKZAphBBmuNFzAFog75y8mHez6bg2u4RzjNhyGeGSIwBg1RTJsx9hq3D5
         KkgShihBqKj9HGwC7Y94OIGFFALIuxNYh5CDEQyr7M8M1WduKpHlZfGT9NxJxLsJrk1Y
         sQjw==
X-Forwarded-Encrypted: i=1; AKwUvBzySUs5FZqSU3eo0ybI3wzX5DbvZOUPWFFfTuSjxVr7L5ehk5K4qiKoHNja3IrwunZeNMxZ2SOFWk70N4U6JU9g@lists.infradead.org
X-Gm-Message-State: AFq9FYI4jwAqt9WZCzN3RCN16OroOMnCzRK6BXMr3M6u07TX+BBRXs6J
	fPBtWRaN3zv14ZRO+B0sIHMZBv+HEKYLO7vJAsmjqtzbXBFqu9y/abyx
X-Gm-Gg: AYBFou3JvCY0Zjy7iFWBlHkpB+IfGCJIHt2yJ+ShwsH4k70MMqumYTuOCfTHOE/somy
	TJs36Kn0itQGDhMGHule8jkOZ8Qh4xzZR5kyvz8jhAz15toaeYaCSMgYEYkfRDcsIfeBf92AzNy
	qkZ6sdiMKgYBZoNiF3JgwKySp73bdhA3yWbFipHYCoCs+cA25EaTayPbwbAlVIH6EAIJyFLQByR
	c9/4injGu5sJbTGd2ug3FmEnG4o+dfduQYouG5Q/TMYPryuosnjb1w+WkyNrDvc4xJynxy3I6gS
	ZOZTBEvtlxCfr3Thau0z2hv0QXPM+2r+l2bAX4iMa+E2l1maabi39Al5u9t5TdoSpBBstbJe+nc
	4R3jm55cJubm8jL1VrhmKKfSZTTtcNta7JCcILQhbmXKXSqTqorrVsdu2rE0yyHAJvdKN1QDfAC
	vikRfFz5V6cBTYN5loOjiEHTlMmo2H8IZH+tYZtCbPL5irPAPeRsm+KfiJLn2omaXQpQGNOg==
X-Received: by 2002:a05:6a00:3386:b0:89e:fc56:a25e with SMTP id d2e1a72fcca58-8a04cd2efc9mr1245701b3a.41.1792215887340;
        Fri, 16 Oct 2026 22:44:47 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:44:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v12 1/6] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Sat, 17 Oct 2026 13:43:59 +0800
Message-ID: <20261017054406.1828061-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_224448_343007_57F8D371 
X-CRM114-Status: GOOD (  21.79  )
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

On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC side
SGMII), the PCS does not automatically restart auto-negotiation when the
link goes down and comes back up. Without an explicit ANRESTART, the link
stays down forever.

Add BMCR_ANRESTART in two places:
1. In xpcs_config_aneg_c37_sgmii(), when starting AN, set ANRESTART
   alongside ANENABLE to initiate a fresh negotiation.
2. In xpcs_get_state_c37_sgmii(), when link is down and AN completion is
   detected, clear the interrupt and trigger ANRESTART to restart the
   negotiation process. Propagate the return value of the restart so
   errors are not silently ignored.

The restart cannot go through the .pcs_an_restart op: phylink only
calls it for 802.3z interfaces, and SGMII is not one. Changing hardware
state from pcs_get_state() is already done elsewhere in this driver
(xpcs_get_state_c73() calls xpcs_soft_reset() and xpcs_do_config()),
so the same pattern is used here.

The latch is cleared before issuing the restart, not after: clearing it
afterwards would discard a freshly latched ANCMPLT from the new
negotiation. If an MDIO access fails at this point, it indicates an
unrecoverable hardware condition until reset.

Also clear DW_VR_MII_AN_INTR_STS in xpcs_config_aneg_c37_sgmii() before
starting AN, matching what xpcs_config_aneg_c37_1000basex() already does.
On the non-inband path the function now returns the result of that write
instead of the DIG_CTRL1 modify.

Update the comment in xpcs_config_aneg_c37_sgmii() to note that although
the DesignWare databook says AN restart is not needed for MAC side SGMII,
some implementations (e.g. Rockchip RK3568) require it to recover the
link after a disconnect.

This is not a fix for an existing mainline platform: the affected
platform (RK3568 XPCS) is introduced later in the same series.

Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index b415b93d77c15..6466e0ff2a98b 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -761,7 +761,9 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	 *    DW xPCS used with DW EQoS MAC is always MAC side SGMII.
 	 * 4) VR_MII_DIG_CTRL1 Bit(9) [MAC_AUTO_SW] = 1b (Automatic
 	 *    speed/duplex mode change by HW after SGMII AN complete)
-	 * 5) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable SGMII AN)
+	 * 5) VR_MII_AN_INTR_STS = 0x0 (Clear CL37 AN complete status)
+	 * 6) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable SGMII AN)
+	 *    VR_MII_MMD_CTRL Bit(9) [AN_RESTART] = 1b (Restart SGMII AN)
 	 *
 	 * Note that VR_MII_MMD_CTRL is MII_BMCR.
 	 *
@@ -769,7 +771,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	 *	 SR_MII_AN_ADV. MAC side SGMII receives AN Tx Config from
 	 *	 PHY about the link state change after C28 AN is completed
 	 *	 between PHY and Link Partner. There is also no need to
-	 *	 trigger AN restart for MAC-side SGMII.
+	 *	 trigger AN restart for MAC-side SGMII on most devices.
+	 *
+	 * Note: While the DesignWare databook states that AN restart is
+	 *	 not needed for MAC side SGMII, some implementations (e.g.
+	 *	 Rockchip RK3568) exhibit a timing quirk when integrated with
+	 *	 phylink and do not restart AN automatically when the link
+	 *	 comes back up. An explicit AN restart is required on those
+	 *	 parts to recover the link after a disconnect.
 	 */
 	mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
 	if (mdio_ctrl < 0)
@@ -816,9 +825,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	if (ret < 0)
 		return ret;
 
+	/* Clear CL37 AN complete status */
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (ret < 0)
+		return ret;
+
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-				 mdio_ctrl | BMCR_ANENABLE);
+				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);
 
 	return ret;
 }
@@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 		return 0;
 	}
 
-	/* Clear AN complete status or interrupt */
-	if (state->an_complete)
-		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (state->an_complete) {
+		/* Clear AN complete status or interrupt */
+		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+		if (ret < 0)
+			return ret;
+
+		/* Initiate the next round of AN */
+		ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
+				  BMCR_ANRESTART);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.47.3


