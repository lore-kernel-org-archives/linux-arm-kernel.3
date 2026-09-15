Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20B3C88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yjmztt9FS1A5qxNaZfWYg6PvzN0Znz9LRYwH9/qf2Qg=; b=FZQQLEVBz9Ky9swFfF67YOlMLr
	HCo8feS11Lg1gRd8V1rUp2K0AwoDAyEY3Ix+15oLOf5Haa+RsYMT0vEEIcw6eL2+M7a8v5GPfzIJa
	oNQnlSKDPsRuwpICN7tFxRjKwPSB9zqNpAQQllW+48nqCbie7L1ScwFVJnLc8uHQNwcq1B66+T2Qt
	qcs761Z3/msNRDRL3EgAaF7aJReVybdPcksAG4f5wiNHpiZBrP6xBtVhoyOkRuipHNdk6efbpSXMR
	vDwv3Ar5I36aXoQ3wfGWY51Xp3q93kln4mrKeNy7ZkfpyEDTw5a+txoNKC5WD3tEUqS3ZoU1okXY2
	MFGLjY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRm-00000006YHw-3gpd;
	Tue, 15 Sep 2026 12:39:38 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRR-00000006Xbr-1srm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:39:21 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-3859292bb51so247645a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475956; x=1790080756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yjmztt9FS1A5qxNaZfWYg6PvzN0Znz9LRYwH9/qf2Qg=;
        b=kFFOELM0IIPP2w8nU98hUf7NC64kCzK7hgLrXnHJL10AbwtN2/2vLzizLTIzI87lgh
         Z9EXHtBb3gi9uqVaFoYGPcqbaZmo8gsJlxFbz+l9og1Pk3qL24FvCrgPrD2bqt2D2sea
         GhO9pHNht+Mlmqe1Rx5qmzqSUBfSSSmijnv/aB39yUq4j8L0kY2Os3lREiUQs4BdEO8m
         n+NIhqlwGSDsej1KbZ/A4b5KJM3HCUdN6H6kLLhIrPAtEMy9VgmnSoJvhWjrBGDxz/Dw
         knIjL6bDE/lkWU8rUIrs3L1n3ImyGDCbZwszkXmv7+tV7UJ/UhhqhjT2J98uobYg1rIt
         I/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475956; x=1790080756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yjmztt9FS1A5qxNaZfWYg6PvzN0Znz9LRYwH9/qf2Qg=;
        b=ZvTT5AuyhEUMY3hy0f32dsDK78E5oa+d4HsEqA9sx9x6v3cwA1m8X9ieUXfd4x12Lf
         HVcRvqMtBIxSYUpXHyo+Uy0BJINrVRQT2JIsjp1+fVP/mQ4Cm+RekxTX/EZQ/K9zynUJ
         SdMa6ylmBv3jRTUmJB3+rt6NCpPjUZwHSJiwViDUfCf38a+G+2AUZesUuo14U3ocuNbs
         W4AIdyhmGphx3xKQ20uUTden1FTCFCLI6P6tPj1WrnjMtDg25ORHRzXyr8QvO4dK9I6f
         YUOkZO+56hENkJhe7L3d4XLQbEJBRjq02zySpWNsjEz/D/LW/UCHoOnJ/ds8Th8DM3MB
         CGzg==
X-Forwarded-Encrypted: i=1; AKwUvByEeTrDj8F5QkyAeehSeFvwQtjsnVW0FauSjBC20p0tMgBhrsnnvXXUNyoWRsMB/wXNCGVJgqDq+/jFhLGRsKpS@lists.infradead.org
X-Gm-Message-State: AFuF++lHKjgAglDEr5XCVCUfzdkWzO/bVl88Cx94TWhI+C7p9k86iJD2
	u3pjuqTTv7s1LUpdeGpVZ1droa2LyNfYEq8qntwiG+TsfmbFN6MDWTVK
X-Gm-Gg: AYBFou2ULkeV1k2FJrYdNQgxxFEM3l8mEhNPy2SoKZsBgFF8K9ax/NIuGu2G8vMVNbR
	Rruyapn2dK8tjjTjzcuIhcO8sl0TtGy/gJCsnw+56DMvujuu6DrI2GJXcvT14qbWoG7pH8BoOxK
	Gy3kpyHb+csT/qdR1VzLCLxpSbhLwh0P4yKIWMV+A5Jj2rmYs6F1VddT2ncigQUEdtAnLV6KUXu
	9JZlGiTzdXbQzy77SRcwlqgwSV2uDPECP98pRnkFU3UeMDmiXFqs4ts1ZnKscBQDgMTuE4hE2c9
	PadnrxYBOycvRo2ATwPOHl6IBQh7VCqggPrubiJeMRq992y4YGdKzts2M8KoFc2/HRlfd9cO3yd
	Yil1dSEfkGDWWvfvSIPK78FqVH4hZJCaInz+8D/PzGft6sJ1Cr+UEVniGvW2Z4lxjWo+HVqNx2p
	xLTKLi3ShXLqAfcJs8Tdd9v+fYW4OWYaAaO2B0yGojGS0cRoTYPVHxcOXMT6oSwQOgA5iRiA==
X-Received: by 2002:a17:90b:498e:b0:39d:feca:f48d with SMTP id 98e67ed59e1d1-39dfecaf6bfmr3959422a91.3.1789475956259;
        Tue, 15 Sep 2026 05:39:16 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:39:15 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v6 06/11] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Tue, 15 Sep 2026 20:37:55 +0800
Message-ID: <20260915123802.1561724-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053917_603253_EC3FECF9 
X-CRM114-Status: GOOD (  21.05  )
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
index 0337e2bcc0125..8c3875b6985b9 100644
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


