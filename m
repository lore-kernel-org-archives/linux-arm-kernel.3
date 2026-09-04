Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7CAC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 20:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZVdNxRn8VX1xv7coC4B1x70wb/kGKPtSJ0jnUzAdilQ=; b=Rg/rygD2WH+CbbLlHNMaMCGEBU
	bq4rfJ3CsyQLG7oJq9N1iQOVBixQMnE+zUs+c+arLlaxGUJMCOLPgsGTiwMBnLM6DhVl+G8qcmeZw
	sLMF6bcUb4WN2tV16CNi65I9bPs2kKb/4mfl/GQ/OldKbGxNcNzAQ/BgPX1kzN/vH7y6nKgcxsyMj
	k2JkLu14F273KFn0Wnnm8Tk3/bE2PQ9oHKMIeO2FJcdBOFLhTZzwyy4JTszAZhiCEbxjItt1fquv5
	gNSzHwyecronbxYduMINTs/QxNWLw6swvG9uQzjVYtoevcIqTDBXRqCw8XZDyf4439jjhffHxIf9Z
	j203RZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aWD-00000003GFM-2wPc;
	Fri, 04 Sep 2026 20:28:13 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aWA-00000003GDR-3U3G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 20:28:12 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3a1f75277f3so11449631fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 13:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788553686; x=1789158486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVdNxRn8VX1xv7coC4B1x70wb/kGKPtSJ0jnUzAdilQ=;
        b=eYU44mqbopiNJHpVCmHR4/QsNSbzUJi1/PcCnVtl/UAqLQ8LJrMyF0ejiLfa2AvbBP
         UK8i7yIj2ZwsNzH58BX1bSPOJWlO7WO1V48HvtepY+ivlEqSGGULgXSgr1MObIlJXv2D
         i+BMP1y5gtb5WLcz/xr1IFHONixfupHyEPtxJ7reLyyWFdY8jWJmEiA2oxOe/MYX6dIZ
         NSYRUhd2WcXJmM55nR6nZdOLioZYg+ZjRogzzll6xId2J0883x1u18jkhrCrqPYlEZxe
         n+0DHn4QnHhNGx/YSHbUUeoMzRHrKsWHsq+rT59thZEA3jVFzFLTTWtDZM7cBlHS2D9M
         WEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788553686; x=1789158486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVdNxRn8VX1xv7coC4B1x70wb/kGKPtSJ0jnUzAdilQ=;
        b=qaC2xNaKS2MY8e5/NhNOVFQbern+f3QZktkHIFOX503pIYiDEORxkZJl97a0KyQsoG
         I/0kSB2il6mn1sMEmFym2km6PL1xjsnNAd+04KQeJRqI2iwdj/JWCGp/nUWG07b/S1/p
         WiANWDRuuINJPyDv6Mry6g2Bg8epTIMQDtfK6ZVaDuExfukV2N3yisXuk+FSY+HHM1br
         jOBMyrffzhRsi5O0gz2HqCvH4AoTeYgM75oG8gtElHGGv8/RHYvjcjArPOYDNcRaQ2Ih
         UVnvVOvQ193T4K5e1qHptgEhD0nd9k5u0ZspsiS+s+41nAsBtZJLXlQiLYe53Wn7hil8
         ocyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5qxIqCiIh/Yy71ssd/vrcNu+y4pepNELcp6FAyM8R3KOjUZbKNVD+XkZcF/ZUutfLUSC1fvO6xmk3riCoWOT+@lists.infradead.org
X-Gm-Message-State: AFuF++k7Jvxa/fhEUaVgiTKkIHAOde76ODf4a5p7xJsdXBJIaqjP9m9e
	WN5vCPTCNTAFBnsiSUZiJhWJwATo221PGmGb927zzbAsJvP2gwVhxjo=
X-Gm-Gg: AYBFou2ezVRzHbtMJduUog2xDBV8hZQ1Vf0JuPYLfxKZijx3vr2O7fFOFvJMeawcGmt
	K7uhAo+1WOPZFHjpMddXT5nSLgdGBD9yzwgQ+H3VTF8MuYaz0y6sZqYrfZk1UhZ48xisvcDZmcG
	V0Yh6axTfW9yhm4NcP5PNdr1MbuaSPY6paFtFruqTHjkXEm7sB+fTonBF/UoxJw3rqRqK5CDATo
	GUePqJ+je1MaGrfOnqemnsqYETvin+iXs7wFPgK58/KojKSGtD4XaIpEEtB2UzPx8OavYyjY+Om
	PXJcQmjzT++f6iT3s98HkKgfHc+UZvdESZwBIPVqKqNwvRc8V9XrGKF6h3KTY7CEzE4uR5PDvlX
	hV8qrcXByW/XaI24C43L9H6+rz6Mmo/x6WNu1duZDRHYNyrymxorocrxYA7V3fSsFzHr+/Cu1Mt
	4L/Vz+HWiSTI56dTDZ00AQtjmnZnzCLN5r1UB7abu5ws6uGOjUVxzsUQ/vvB2g6rDPoKn5XtaHF
	YA8QJl8yEUi
X-Received: by 2002:a05:651c:a185:b0:3a3:7680:67fa with SMTP id 38308e7fff4ca-3a376806991mr6184891fa.25.1788553685465;
        Fri, 04 Sep 2026 13:28:05 -0700 (PDT)
Received: from i-UX410UAR.lan ([2a02:2168:87cb:3900:a1e5:6a90:4021:407d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a370549917sm9910451fa.11.2026.09.04.13.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 13:28:03 -0700 (PDT)
From: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	SkyLake.Huang@mediatek.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	sean.wang@mediatek.com,
	olteanv@gmail.com,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Subject: [PATCH net v3] net: phy: mediatek-ge: disable EEE on the MT7530 PHY
Date: Fri,  4 Sep 2026 23:28:00 +0300
Message-ID: <20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_132810_901282_37BCBBC8 
X-CRM114-Status: GOOD (  19.93  )
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

The MT7530 internal GE PHY advertises EEE by hardware default, but its
EEE support is defective: with EEE advertised, some link partners fail
to establish a stable link. On a 2-pair (4-wire) cable where both ends
advertise gigabit, 1000BASE-T training cannot succeed, and instead of
falling back to 100 Mbps the port loops, so no link or DHCP lease is
ever obtained. MediaTek confirms the hardware is the root cause (Landen
Chao, 2021): "EEE of the 10-year-old MT7530 internal gephy has many IOT
problems, so it is recommended to disable its EEE."

mtk_gephy_config_init() used to clear the EEE advertisement early, but
commit af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE
advertisement") removed that on the rationale that the DSA subdriver
already performs an early disable. That holds for MT7531, whose
mt7531_setup() clears MDIO_AN_EEE_ADV on each switch PHY, but not for
the MT7530 PHY: neither the MT7621 integrated switch nor the dedicated
MT7530 IC ever had such a loop, so removing it left those boards
without any working early EEE disable and the link flapping came back.

Since the broken hardware is the PHY, fix it in the PHY driver so it
covers all users of this PHY, integrated in a switch or standalone:

  - clear MDIO_AN_EEE_ADV in probe(), before anything can negotiate
    EEE with the link partner;
  - call phy_disable_eee() so phylib does not write the advertisement
    back on later renegotiations and userspace cannot re-enable EEE.

Auto-negotiation then falls back to a stable 100 Mbps link instead of
looping at gigabit. Tested on ASUS RT-AX53U (MT7621): with a 2-pair
cable on the WAN port, a single clean 100 Mbps link comes up and a
DHCP lease is obtained, where the unpatched driver loops.

Fixes: af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE advertisement")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
---
Changes in v3:
- Move the fix from the DSA driver to the MT7530 PHY driver: the
  broken hardware is the PHY, so the workaround belongs there and
  covers all users of the PHY, switch-integrated or standalone
  (Andrew Lunn).
- Clear MDIO_AN_EEE_ADV from probe() rather than config_init() so the
  advertisement is off before anything can negotiate EEE, and call
  phy_disable_eee() so neither phylib nor userspace can re-enable it
  (Andrew Lunn).
- Remove the eee-broken-* device tree properties discussion from the
  commit message; the properties are not needed once the PHY driver
  disables broken EEE itself (Andrew Lunn).

v1: https://lore.kernel.org/netdev/20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com/
v2: https://lore.kernel.org/netdev/20260820202844.1821687-1-vladislav.karmanov.dev@gmail.com/

 drivers/net/phy/mediatek/mtk-ge.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 73d9b72..35600c7 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -62,6 +62,27 @@ static void mtk_gephy_config_init(struct phy_device *phydev)
 		       FIELD_PREP(MTK_MCC_NEARECHO_OFFSET_MASK, 0x3));
 }
 
+static int mt7530_phy_probe(struct phy_device *phydev)
+{
+	int ret;
+
+	/* The MT7530 internal GE PHY has broken EEE: with EEE advertised,
+	 * some link partners fail to establish a stable link (on a 2-pair
+	 * cable, 1000BASE-T training fails and the port loops instead of
+	 * falling back). MediaTek recommends disabling EEE on this PHY.
+	 * Clear the EEE advertisement early and mark EEE disabled, so
+	 * that neither phylib nor userspace can re-enable it.
+	 */
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+	if (ret)
+		return ret;
+
+	phy_disable_eee(phydev);
+
+	return 0;
+}
+
 static int mt7530_phy_config_init(struct phy_device *phydev)
 {
 	mtk_gephy_config_init(phydev);
@@ -100,6 +121,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
 		.name		= "MediaTek MT7530 PHY",
+		.probe		= mt7530_phy_probe,
 		.config_init	= mt7530_phy_config_init,
 		/* Interrupts are handled by the switch, not the PHY
 		 * itself.

-- 
2.43.0

