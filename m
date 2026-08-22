Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC08C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 04:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X7uhZqj8EhSGPrmJQzoEFJmHOmX4H/O39nsiw9Yu8Bo=; b=LuIU6w3uYIfS27sCi3+uVAedxD
	wAOHX+oAgtqinZdziC8seKuoCRwYU1GNOe1bD5C27SvQDpB9VMVryAflDv10x6443N9JYtkeB7I3E
	hRGjsp2lB0ieDa9JFyQJYHoGpFnfnTJT/iUvCu3B0yKENFFDobF0Uvp/UkyWRAdkUanOAQfLXzHtU
	8dQXUnVhYeR2bYYPfqCb51ve7rnMwP6m2TCLBMgi3yc02c+iQiIGCzqiCait4M+C1LmCzuAzzwFPF
	K5hCou1zhoI+P9JBja0cg5EETwmmvYGtiunJIVmnxH/zbTqzE8rqSUucMMILB59h0cQf3PdUujFC+
	trlBgN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxdmp-0000000EHzb-18kZ;
	Sat, 22 Aug 2026 04:56:55 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxdmm-0000000EHz9-3QcZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 04:56:53 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5bf959b820cso1442042e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 21:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787374611; x=1787979411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7uhZqj8EhSGPrmJQzoEFJmHOmX4H/O39nsiw9Yu8Bo=;
        b=H3G5tiiuLj2hhoHfW6MzsHOt9F61Ql69U4Gs19YxEHKeXv2RKrlW34Sm1msMqwFZHR
         FBkMMX1pb87tq67no7VIS7V3j0qrfiImFPVLa2ldpbdk0d3UYQuU4OBdDpwa3rnnuCLu
         N3XSlw+fGCwmdXt3lqbfhLSyxZ1mfJDw+Jr8menQnhVvrewU0ITq4WYxV+dDnliAqkve
         UrmS/9G4dqEgVZyoBnRohUX/bgR8eLAIqwCR3fWSLuZcMcSg6cPWGL9AANtZryfE24jK
         mBW/svKxl9XaQ5+gt/kly1DcyElzKbX3gQojApAAGmEBwS7pPSNDQ3EHvAT5GCk35l0K
         I5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787374611; x=1787979411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7uhZqj8EhSGPrmJQzoEFJmHOmX4H/O39nsiw9Yu8Bo=;
        b=ZQ9ICDgUldikIGHylFOF+x9ZFt5wiaC5pOk2eP9Gl3PLptwTzLlP0TwHCrPbO31D81
         frZCALK0nUUf4LhyLcw+R54zeLh8wziL7pzO7fTpAWGs+oSCiXhNguTYl6Pfkfg9rZbZ
         ygFt7FDHlYbE5CcpNJydMIp4U3Y+4RZZZopNeSY93/H6MmBlhcKezmOxmefe5STE9QAI
         Zdi+WInyL79zZN0TU2tqqwDbUAHEDP9K1buJ28Xt+rpauir6qXebAGrd6aIANo59tBp0
         TacRPVi00EuXXKOaYGjG3v/aHAmXTGarDzKFSfFl2nEJ5SkEYhzAIutX26Y+Vdh3pcp2
         AObQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFkutF4JcjBtjg/AeJ3yPoex0Oo6c+ICj98e7PGxBb7BrFV3u9EpBLBm7CpXtJjA1lYMI7zWu1dlu7e+mwTRGl@lists.infradead.org
X-Gm-Message-State: AFuF++lXM8+/ZCwha6wOiCNj1clncGuvt91Hq5D10PeJ19miELRDpQaJ
	2fpQ1JLx5x5FjT+3Uvz16WVWEqY/E/E3s6UMQweqaogOZRlIHy+R0QTZ
X-Gm-Gg: AR+sD10nGo33ugZKIuod14Wk4gBFyqJ5QBnkbnPp3XtsQ5IFLsudmR6CnRGbQGh/vLk
	TnGE9FO8vGffuhfqG0zmUOX7goS4M3vYBwLxg8phuJkSnQZGI3JrwsDXKAI7VMhEiqEwHscgJ2h
	FCZ7h0g8T9EvJl0uw7AAd9CEymPcaYqB09WeqbfMvjpVY93o139y1I3yLjD7QbeYT0SM3g1kCdJ
	QjWYym60w/1guu4cuwAb8NUYF+U2t6Q3Bqoy30bcUmOPj1c9wMxzxX/F/4/O99IU7E3Y2k9XPYk
	aDHrfe6wtD0s0jUQCM08Pl1gxZWBhb3mFlrxy8WhSJIwbXAnWgHRppmRdHpWhmluLiUruRaDJo5
	v/VDRL3izvI6H03fHv9TmtvrqGS/DsCmh3NReSlGUWk7Ju65iGDWgt1NWNY7Pjowts/8HMPLqrl
	P+Ex5T5+Fo799QV/dsP+W+Hauq+qwDLeruGjShs69TpFaohO9gMoY36r7lpKhs0cPX3txVtZYJ4
	4T/QQKFgcGqBqXmWgj+Ya2gIDMNXHZobetB1+mvp4oB5ajlVpxrwG3376jR1YcxiQTaLT0o0Cf7
	1l/CW5clQOINXM24ir3BpT4BR8wfgyLZ1SKgug==
X-Received: by 2002:a05:6122:311f:b0:5bd:8c84:59aa with SMTP id 71dfb90a1353d-5c5ff847130mr4814260e0c.8.1787374610916;
        Fri, 21 Aug 2026 21:56:50 -0700 (PDT)
Received: from localhost.localdomain ([2803:9810:4a6f:808:807d:a3e1:35a2:f6f6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e2619f16sm10674273e0c.5.2026.08.21.21.56.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 21:56:49 -0700 (PDT)
From: Pedro Santos <hartmnn.p@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Pedro Santos <hartmnn.p@gmail.com>
Subject: [PATCH net] net: stmmac: dwmac-sun8i: reset the EMAC when opening, not when probing
Date: Sat, 22 Aug 2026 01:56:41 -0300
Message-ID: <20260822045641.19282-1-hartmnn.p@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_215652_897172_94A0807A 
X-CRM114-Status: GOOD (  25.52  )
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

sun8i_dwmac_reset() asserts EMAC_BASIC_CTL1.SOFT_RST and polls for the
hardware to clear it. That bit only clears once the MAC has a running
receive clock, which on external-PHY boards is driven by the PHY.

Bringing the interface down powers the PHY down: phy_detach() calls
phy_suspend(), which for a PHY without wake-on-LAN ends in BMCR_PDOWN.
Boards that wire no reset line to their PHY, and share its supply with
other always-on consumers, have nothing that undoes that. On the Orange
Pi Zero 3 the Motorcomm YT8531 reset is, in the words of the board's
upstream author, "hardwired via a simple RC circuit, so there is no
GPIO", and phy-supply points at a regulator-always-on rail shared with
four GPIO banks and the SD card.

So after a warm reboot the PHY comes back still powered down. Probe
asserts SOFT_RST, no receive clock arrives, and the reset never
completes. Read off an affected board at boot, before anything touched
the PHY: BMCR 0x1800 (PDOWN set) and EMAC_BASIC_CTL1 0x08000001, still
set after polling for ten seconds -- so raising the 100 ms timeout does
not help. Probe fails with -ETIMEDOUT and the interface never appears.

That the interface teardown is what does it can be shown directly. A
reboot via sysrq-b, which skips both the ifdown and device_shutdown(),
comes up with PDOWN clear and resets fine; taking the interface down
first and then using sysrq-b -- so the driver's own shutdown path still
never runs -- reproduces the failure.

The driver already has the right place for the reset.
sun8i_dwmac_dma_reset() is registered as stmmac_dma_ops->reset and is
documented as "reset the EMAC", but only zeroes a few registers. stmmac
calls it from stmmac_init_dma_engine(), under stmmac_hw_setup(), whose
only two callers are __stmmac_open() and stmmac_resume() -- both of which
run after stmmac_init_phy() has attached and resumed the PHY. Doing the
soft reset there means the receive clock is running by construction, for
every PHY, whether or not a PHY driver is bound, without the MAC driver
reaching into phylib.

sun8i is the only stmmac variant that soft-resets at probe rather than in
the reset hook; this brings it into line with the others.

sun8i_dwmac_reset() stays for the mdio-mux switch callback, which needs a
reset after changing the syscon and cannot use the hook.

Tested on an Orange Pi Zero 3 (H618, YT8531, rgmii-rxid). Five warm
reboots: no EMAC reset timeout, interface up at 1Gbps each time. One cold
boot with power physically cycled, to cover the path this moves for
boards that never hit the bug: same result. 20000 and 5000 1472-byte
frames respectively, no loss, every MAC error counter at zero.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: Pedro Santos <hartmnn.p@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 49 ++++++++++++-------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb..748ebab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -272,8 +272,34 @@ static const struct emac_variant emac_variant_h6 = {
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
+static int sun8i_dwmac_soft_reset(void __iomem *ioaddr)
+{
+	u32 v;
+
+	v = readl(ioaddr + EMAC_BASIC_CTL1);
+	writel(v | 0x01, ioaddr + EMAC_BASIC_CTL1);
+
+	/* The timeout was previously set to 10ms, but some board (OrangePI0)
+	 * need more if no cable plugged. 100ms seems OK
+	 */
+	return readl_poll_timeout(ioaddr + EMAC_BASIC_CTL1, v,
+				  !(v & 0x01), 100, 100000);
+}
+
 static int sun8i_dwmac_dma_reset(void __iomem *ioaddr)
 {
+	int err;
+
+	/* The MAC soft reset only completes once the PHY is driving the RX
+	 * clock. Doing it here rather than at probe means phylib has already
+	 * attached and resumed the PHY, so the clock is running by
+	 * construction -- including after a warm reboot that left the PHY
+	 * powered down.
+	 */
+	err = sun8i_dwmac_soft_reset(ioaddr);
+	if (err)
+		return err;
+
 	writel(0, ioaddr + EMAC_RX_CTL1);
 	writel(0, ioaddr + EMAC_TX_CTL1);
 	writel(0, ioaddr + EMAC_RX_FRM_FLT);
@@ -740,23 +766,12 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 
 static int sun8i_dwmac_reset(struct stmmac_priv *priv)
 {
-	u32 v;
-	int err;
-
-	v = readl(priv->ioaddr + EMAC_BASIC_CTL1);
-	writel(v | 0x01, priv->ioaddr + EMAC_BASIC_CTL1);
+	int err = sun8i_dwmac_soft_reset(priv->ioaddr);
 
-	/* The timeout was previously set to 10ms, but some board (OrangePI0)
-	 * need more if no cable plugged. 100ms seems OK
-	 */
-	err = readl_poll_timeout(priv->ioaddr + EMAC_BASIC_CTL1, v,
-				 !(v & 0x01), 100, 100000);
-
-	if (err) {
+	if (err)
 		dev_err(priv->device, "EMAC reset timeout\n");
-		return err;
-	}
-	return 0;
+
+	return err;
 }
 
 /* Search in mdio-mux node for internal PHY node and get its clk/reset */
@@ -1217,10 +1232,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to register mux\n");
 			goto dwmac_mux;
 		}
-	} else {
-		ret = sun8i_dwmac_reset(priv);
-		if (ret)
-			goto dwmac_remove;
 	}
 
 	pm_runtime_put(&pdev->dev);
-- 
2.50.1 (Apple Git-155)


