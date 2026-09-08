Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63303C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rZY078INwnXidXnS1tAhSBI29huMveMJ63auEB3fPKc=; b=gCrS4c76SsdG4ZzT+R+eu8O3yu
	P6C7ZVez1h6W0i69i8Ll0i0ef+9QPCNe8mVZRoAW6P2A2SJdlC3KPDoDqMpHAUD9PFa/csbYx9fuJ
	0LSBzI2zd2HERZr9YAvS5KNV61SS2YfUEY0cVOTKA3S3By38UfU3FTE9zVdM+8bsK6B7IJMCtHkoL
	L83DPLHwV3oU/TMTfrJXKYYsxKvAPVuhseDMIUFC2I8aS4WRTcT9duXgpF73uCeLIWoM8bJ6nSuoE
	SA4cXcKNXOlo8uZojPcIG1NsdxaaC4BbLueEqn2DmCAIxh7Y+NuopcfgKmpHxQSCkpugNgbeoLPmS
	yyEbF1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xBc-00000009LDn-0fN3;
	Tue, 08 Sep 2026 14:52:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xBZ-00000009LBT-474I
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 14:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rZY078INwnXidXnS1tAhSBI29huMveMJ63auEB3fPKc=; b=AuN+TivO+GXybWPnCXfebw4pUR
	fUYQY7iJMRviS4VF7/axzFtksrirbW+X1w7VwXUh3QYT/E5hF+Yci9MbQro9GEmyCvIFYDuQ6X0n7
	krThbuOkSkvZcjI6N7ReNTs5qnyew5dsAw4MojxybAxwNlGznDHpDcQQw0NNUmh+Ps9r7jEJH+i+c
	3sqmOAi8XHeMH48jdmnUnQTY/mqzKoLeLPqaufjWWWc0XnbOe9TWx7N4AQj3ozj2WDnXhINqv1I9D
	HBec6w6ZoVitTHx1JV4v+ihZRo4PK7qAwXMCanl2dgPvu6+MYs2b+ODDvmNhEIRf95Nlzd2+oLqle
	xTH0wInw==;
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xBW-0000000HZ7B-3iwc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:52:32 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5b4af4be667so4659169e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788879148; x=1789483948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZY078INwnXidXnS1tAhSBI29huMveMJ63auEB3fPKc=;
        b=PqNiZzh/P7O1/D9bM/54Ijz8tGrjr+/FL46KqiQ8ekGD8lDGO0XjMGI8iVViJWYGRq
         M36GmoH44N+7iBPY6yUADf1um3u23ral4rgmv6I/ld+KtZPs2/ZVno/gWfEmEX1QIz2j
         J4gzwxmKw1d8Rd/CrPp1qdtTJ7lNE1/nczZyUyL+KPpnVIh0Zdbz4Y3CQr+YWC9ldN+R
         Yg8+k03bg8XCQqoanf4sDtn68cgYSeQ2WHTpvyEvetqxlVlOLA31xl5Uj1ibuFtwTe6s
         ww9ep0ZdnWNtNEENfytebJnbWBxy4iY94nfd7FOnUi1YhAfhVmKd1gY4drne6Pl0ZOQP
         U+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879148; x=1789483948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZY078INwnXidXnS1tAhSBI29huMveMJ63auEB3fPKc=;
        b=I56EoDi7CrI5kMsBol715Ve+LO1o80AkMbChPun1N1p/SKKI1r2W1D1HHlrKvTeFYs
         ukKGfgALGXybOejI4uNUNB/cwXWZf8Wlt2SU/hQe4kjGyJMWfWo+EW11orv+GHfZGJ3r
         fRMAMBcpl2GN9iHaKS32ngyEI/SJbsurDzaUZZxXe30r+3mFrwwBRYHW912UcZjA6sZq
         I+aMtFLEL7pZ3lrRWT6dnRUYwde8i/iO1X9wcEWpn/zeyAMXmZmxga+GMRoULcgvaXuk
         bO5qKhm4ibAzWK/T3PlsD0Wjj4jMdr8bGGaqQoBWUsIS8hrNUSqWmVFUAcxQl3OM7oAs
         pkHA==
X-Forwarded-Encrypted: i=1; AKwUvBzzoJJI6oyVBdVuOeB4JpBBp2iZY3x8HVJb4eFHM8joHZ+aRYOdEgrgZGmBPJmzzKccx4ibTXBXYJggCr+ETG63@lists.infradead.org
X-Gm-Message-State: AFuF++lYof5tnW4Hu8A3qt2Gsjcwbqii56eem1DxIhJNeByhzKdUAPeC
	tQDKdel63DgWWe9mDtE4mCSy8sRapUBK/hwgp7LX341nLQ7iNDBN4sU=
X-Gm-Gg: AYBFou3WJc+tvJ4eDQIxrJ2zYdaeAAqDog/9cUVlr/lTA50KaD48YLQicouSEIR4bRX
	aa0sEyOwdgkOCcXsPKPGcWapre4m0d4ZVY2ytAHlcgW3JtuzbE3ihFROBZX2AUUaFiGiS1iVhbB
	Fnyz8Q5bFPlsh1Ui8s79VEHSL12GP0uSv6SqnSGOWja8YfGxpHa0QdfjSZSJje5rOO475KpgzuX
	5S27bcyyoB0GfqLGngvU2+tKpr8bQutdgUVXSueBvqB8BYlty58x/WEax7BNlkAxDRW345bMP5o
	Q6WSdwEBlkUCvriFmGRO1hMEaOuEFkMYDjYmO8eUg0ICe8gXJev3rrhl9OXQDu8eAPPPMYCXdVW
	5xUn+3SouDFLPOFCTiLSsK82aQ11aO4P7/OtqXbA37A+e+DESLC3eAAV1NdvHhwjrfsqyvYFKc9
	gWFwGWzrbQxNjHjsRBRRAkeQWvXTHWq9X62JFAvJJZXphR0h88AXdrxxtKfpFj+BHuCe/MxvUJy
	nrr+TWNUHGFNn1GXSV/ryipZYaq5db8vqcCXD3TV6xowv3TpfY=
X-Received: by 2002:a05:6512:130b:b0:5b6:183c:5c90 with SMTP id 2adb3069b0e04-5b6183c5d6amr4728496e87.46.1788879146726;
        Tue, 08 Sep 2026 07:52:26 -0700 (PDT)
Received: from i-UX410UAR.lan (broadband-95-84-141-211.ip.moscow.rt.ru. [95.84.141.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ecf24sm3215891e87.16.2026.09.08.07.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:52:24 -0700 (PDT)
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
	arinc.unal@arinc9.com,
	sean.wang@mediatek.com,
	olteanv@gmail.com,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Subject: [PATCH net v4] net: phy: mediatek-ge: disable EEE on the MT7530 PHY
Date: Tue,  8 Sep 2026 17:52:13 +0300
Message-ID: <20260908145213.3976508-1-vladislav.karmanov.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_155231_068256_EA8AABF3 
X-CRM114-Status: GOOD (  21.58  )
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

  - clear MDIO_AN_EEE_ADV in probe(), as early as possible, before
    anything can negotiate EEE with the link partner;
  - clear it again in config_init() and call phy_disable_eee() there.
    config_init() is what phy_init_hw() replays after a PHY reset, when
    the register is back at its EEE-advertising hardware default, and
    it runs after of_set_phy_eee_broken() in phy_probe(), so the
    eee_disabled_modes mask survives and neither phylib nor userspace
    can re-enable EEE. dp83867 disables broken EEE from config_init()
    the same way.

Auto-negotiation then falls back to a stable 100 Mbps link instead of
looping at gigabit. Tested on ASUS RT-AX53U (MT7621): with a 2-pair
cable on the WAN port, a single clean 100 Mbps link comes up and a
DHCP lease is obtained, where the unpatched driver loops.

Fixes: af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE advertisement")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
---
Changes in v4 (addressing the sashiko review of v3):

- phy_disable_eee() called from probe() was undone later in the same
  phy_probe() flow for PHYs with an of_node: of_set_phy_eee_broken()
  zeroes eee_disabled_modes after ->probe has already run, leaving
  userspace able to re-enable EEE through ethtool.
- The probe()-time MDIO_AN_EEE_ADV clear was not replayed by
  phy_init_hw() after a PHY reset, leaving the register at its
  EEE-advertising hardware default.
- Keep the probe()-time advertisement clear -- it also feeds an empty
  advertisement back into genphy_c45_read_eee_adv() during phy_probe()
  -- and move the durable disable to config_init(), which runs after
  of_set_phy_eee_broken() and is the callback phy_init_hw() replays
  after resets. This is the placement dp83867 uses for the same kind
  of quirk.
- The Reviewed-by/Acked-by given for v3 are not carried over: the
  placement is what changed, so they need a fresh look.

v3: https://lore.kernel.org/netdev/20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com/
v2: https://lore.kernel.org/netdev/20260820202844.1821687-1-vladislav.karmanov.dev@gmail.com/
v1: https://lore.kernel.org/netdev/20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com/

 drivers/net/phy/mediatek/mtk-ge.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 73d9b72..96d8ac5 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -62,10 +62,38 @@ static void mtk_gephy_config_init(struct phy_device *phydev)
 		       FIELD_PREP(MTK_MCC_NEARECHO_OFFSET_MASK, 0x3));
 }
 
+static int mt7530_phy_probe(struct phy_device *phydev)
+{
+	/* The MT7530 internal GE PHY has broken EEE: with EEE advertised,
+	 * some link partners fail to establish a stable link (on a 2-pair
+	 * cable, 1000BASE-T training fails and the port loops instead of
+	 * falling back). MediaTek recommends disabling EEE on this PHY.
+	 * Clear the advertisement as early as possible, before anything
+	 * can negotiate EEE with the link partner.
+	 */
+	return phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+}
+
 static int mt7530_phy_config_init(struct phy_device *phydev)
 {
+	int ret;
+
 	mtk_gephy_config_init(phydev);
 
+	/* The probe() clear alone is not durable: phy_init_hw() replays only
+	 * ->config_init after a PHY reset, with the register back at its
+	 * EEE-advertising hardware default, and phy_probe() zeroes
+	 * eee_disabled_modes (of_set_phy_eee_broken()) after ->probe already
+	 * ran. Clear the advertisement again and mark EEE disabled, so that
+	 * neither phylib nor userspace can re-enable it; dp83867 disables
+	 * broken EEE from config_init() the same way.
+	 */
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+	if (ret)
+		return ret;
+
+	phy_disable_eee(phydev);
+
 	/* Increase post_update_timer */
 	phy_write_paged(phydev, MTK_PHY_PAGE_EXTENDED_3,
 			MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG11, 0x4b);
@@ -100,6 +128,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
 		.name		= "MediaTek MT7530 PHY",
+		.probe		= mt7530_phy_probe,
 		.config_init	= mt7530_phy_config_init,
 		/* Interrupts are handled by the switch, not the PHY
 		 * itself.
-- 
2.43.0

