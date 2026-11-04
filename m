Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nMxd3Opw;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bTJNqt9t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qfjNaaONMVdslcm9K32Igu96RORAIzBg3CTRJPaZu6Q=; b=nMxd3Opwjs2U5v
	qlKo6S51r1OuFznj4SPXEVOHE1qN9wqYsbQgwJc/YcjAanzTpFQF0RWbfMY1MNcxeigi2xaH034LU
	kOl25XsJGEfk5AOqh2HZYHqZ8VNsi2UC6H61cyg5f8isYPeMsRKntDNfGDupm0R9SdzZlHAM3mxSK
	1C4nqUKt2DMbg+vGdIdEtaqWQTaCms1zjHZ3qjt28uxfRO0G5FbJbKQuYW3fV8bxc8k6/Adb+WTqO
	mWlhKfcqwLth5kYCLJQTgkIKNAzJUO4D4e8LhYxuw0Q4TumOsXurroJC2kkqkN6I75mRWUUJ+fBp6
	O7HjEn2PKMVFEHlRP0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOk5U-00000007DYT-0tj1;
	Wed, 04 Nov 2026 23:08:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOk5Q-00000007DUz-1aEw;
	Wed, 04 Nov 2026 23:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793833685;
	bh=R9T9QAKc4ksxWAIHU2ATuxJGU0UUeyNedli7ypE2MQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bTJNqt9tY03wVaOf38Irh1yAUaaiwQFApSFEeYAHVqUPh7yR81chcV6eJ5zuZoVec
	 +he4RCon76sLEzqJgtZy1GukF4mPO+OZlwwZVrr0WwtlJtPbVqxYaqrTqIpsALEvx/
	 5FbA3nzOwYeQ9YifNXHFUtEMtcr3SDhY81qgfHih4cBqwlxDe0qH/UqjcO3lh1cUQ9
	 jjWQs/kMM189FvtqaAzPH8P/wSlky9OiadjM6I/lcgEIoDkGQqbatpKx9RYd+y5uFj
	 GojecWaDJjF/7RU/7V6ws85wIES+5sjNa3gOFq3wkb9XYaS/cllJWhj7J5O7W8U7Am
	 pw7nJGwpCS5bQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 990C017E0D48;
	Thu, 05 Nov 2026 00:08:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5D842480031; Thu, 05 Nov 2026 00:08:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:08:00 +0100
Subject: [PATCH v3 4/4] phy: rockchip: inno-usb2: move suspend handling
 into clock prepare/unprepare for RK3588/RK3576
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-4-b20608c08b94@collabora.com>
References: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
In-Reply-To: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4038;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=R9T9QAKc4ksxWAIHU2ATuxJGU0UUeyNedli7ypE2MQw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrutXnwMDLPqdfC42KSNtrX7rkfA+9EdtVb
 gJ/BRuek1n6X4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq67rVAAoJENju1/PI
 O/qaTogP/3iAA020/fwpypxE1nMZRyCbVGOI/+NxLJplRMniJ1fX9ypQU+nDvpd7CfeX6v9VO49
 q8LsjUasqTd8ogNhBI3oJuLPrqS0KlhOMKL/zNIGbvLP9O9AF92EYiShLZWy61xmZAdXH9J85NX
 hn9X0sbhXXKX+3eB6yET1dVP31BC9wE1rxok/CAPORhybRuVN96EG5pNfa4I4cdk7Thbjx7L5tI
 cw/7U6kuoS9xuGE1HVpjVg6Mhlmo9izz9ZSu5wBFdebA0jaY+DpWYqQocmazy57W2czi8UWvNXr
 JXRO4SF8DaI0H0WNWrjv024BQewSX5K0h9TXuqYebeO5zGcJjqVL36WxiglbBH3+11IgMVMeR6u
 kdDdDBS5lxgzu5TiR5IU7zlHCpwYKciFoUhxQa1iFLTrxgEfPoykjKG90teT/3e+NNazriQtSMr
 AzVH+wam4aV9Az+41nRQE59O6+JmGjRVVdBWIvj1NtVujEgwDGYMJAznUS78YfLIPN5233GKXlX
 tPhngMUn3DHT+WfX3YONN6/05zg/AdrJglbyjMSaDiJB4rcHX0aP9gz5u8GP+4omQYjcU2E7y39
 o+TepsXPNI0eJQRZzgrf9keH0z8ice99xqKVSFFVfI4ZtM3NUpOmpkHVOljGxgs9C+3PWiborHO
 rDtjwtHg9umGdvGuAR6MwBw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_150808_602148_F432AF0E 
X-CRM114-Status: GOOD (  18.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On RK3588 the 480MHz PHY clock must be running to access registers on
the OHCI and EHCI controllers. This requires that the clock output bit
is configured correctly (already happening) and that the PHY PLL itself
is running. The PHY PLL is only running when the PHY is not suspended.
This is currently handled independently of the clock and thus the clock
might be enabled with the PHY being suspended resulting in a
non-functional clock despite the clock being marked as prepared and
enabled according to the common clock framework.

This is especially a problem with OHCI system resume on RK3588, which
does:

ohci_platform_resume
    -> ohci_platform_resume_common
        -> deassert resets
        -> ohci_platform_power_on -> enable clocks
        -> ohci_resume
            -> ohci_readl(ohci, &ohci->regs->control); // SError !
            -> ...
        -> ...
    -> root hub resume (this resumes the PHY)

Fix this by fully powering the PHY from the clock prepare function.

This does not work on older platforms, which have multiple ports and
only one 480MHz clock as we do not know which port should be resumed.
But as far as I can tell these platforms do not have the clock
dependency from their USB controllers and thus are not affected.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 38 ++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 2919c2e11968..b2633b83f7ab 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -363,10 +363,15 @@ static int rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
 
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
+	struct rockchip_usb2phy *rphy =
+		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
 	int ret;
 
+	if (rphy->phy_cfg->num_ports == 1 && !rphy->ports[0].port_cfg)
+		return -EAGAIN;
+
 	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
 	/* turn on 480m clk output if it is off */
@@ -379,16 +384,31 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 		usleep_range(1200, 1300);
 	}
 
+	if (rphy->phy_cfg->num_ports == 1) {
+		ret = rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], false);
+		if (ret)
+			goto disable_clkout;
+	}
+
 	return 0;
+
+disable_clkout:
+	property_enable(base, clkout_ctl, false);
+	return ret;
 }
 
 static void rockchip_usb2phy_clk480m_unprepare(struct clk_hw *hw)
 {
+	struct rockchip_usb2phy *rphy =
+		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
 
 	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
+	if (rphy->phy_cfg->num_ports == 1)
+		rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], true);
+
 	/* turn off 480m clk output */
 	property_enable(base, clkout_ctl, false);
 }
@@ -632,10 +652,12 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = rockchip_usb2phy_set_suspend(rphy, rport, false);
-	if (ret) {
-		clk_disable_unprepare(rphy->clk480m);
-		return ret;
+	if (rphy->phy_cfg->num_ports > 1) {
+		ret = rockchip_usb2phy_set_suspend(rphy, rport, false);
+		if (ret) {
+			clk_disable_unprepare(rphy->clk480m);
+			return ret;
+		}
 	}
 
 	rport->suspended = false;
@@ -653,9 +675,11 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	ret = rockchip_usb2phy_set_suspend(rphy, rport, true);
-	if (ret)
-		return ret;
+	if (rphy->phy_cfg->num_ports > 1) {
+		ret = rockchip_usb2phy_set_suspend(rphy, rport, true);
+		if (ret)
+			return ret;
+	}
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);

-- 
2.53.0


