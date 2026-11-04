Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB46606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dlQIaRra;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oJhcIaBk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SeMeuT/h6863CtRsmF+5VPe+S9J14Zl3iI04dPXlvQE=; b=dlQIaRraiQc4cS
	aEBQDuTnxvkoIP6gN/TLSHtZ473oy8BB/tI4UIhByyUSr9ogtemjGPkpC/kkcl0iUJokf2KbEdcUQ
	mthZVUX2dTathk74BaB47cX5G+B5fhC/C10J7YNo9tY4X5/Aq+BTcL6y9Z2z5yaKeHccyGZI+jDh6
	ZY9Og0rTusezJtLxaGpExNacvs/LdWnfh9hRBGazscp6nJSgfoC7Iu+G354yyZs7pYmWMkOpK4JVm
	o76hp2zgh/VWf4KmVwVjVVhx9LMs3uen93c+4qEzB8THjFayKMviwp3099b2SESvmlBVksYuNO31J
	LamLZR1f7TH4tzZWk9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOk5a-00000007Dfa-1lQM;
	Wed, 04 Nov 2026 23:08:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOk5Q-00000007DUs-1fNb;
	Wed, 04 Nov 2026 23:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793833685;
	bh=rX9nu49yVHon/eoArd9zChZ1LRjZoDqVhWArx28DxU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oJhcIaBkcH+r0p8sAeDaziN2EQV/IFXW0JY83ec8IXbVKaJPImGMYY6KHZrJyoo8z
	 Tw63jYNyVT0sMYXprt3k7j2eDMr/JVntBQtck0lzwwy/h068khx6W1er02nj+yhvNJ
	 E2xIT00xwx7tEo43kYsdyPrgaucPawviW3Ar1jz3teNAaeYsGVJNmzAW9TrX7+flVn
	 AcaENKhrekC5O6gGadumv7hpJ7TwYwrmUidDDT07+HWzgrlLZrF/veXDzdxYqs+fbs
	 U6SFRYfHeMNSrMcEmV0oCcyF3cnMiNiKYbyRoWpQwvIV0Uy0WSush+HWCbPLljJnIh
	 GQaMHdNxGCoAQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 97E6617E0D43;
	Thu, 05 Nov 2026 00:08:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5BD92480030; Thu, 05 Nov 2026 00:08:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:07:59 +0100
Subject: [PATCH v3 3/4] phy: rockchip: inno-usb2: move suspend handling
 into new function
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-3-b20608c08b94@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2717;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rX9nu49yVHon/eoArd9zChZ1LRjZoDqVhWArx28DxU4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrutXgLb9DhtD6zxpWrnTdXUCySn85eBGll
 yUpbCI9C/WcdIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq67rVAAoJENju1/PI
 O/qaducP/1HoudOHIpkYPZuBpSk+JB3yjf2J/78yalMteoo6DXmXIcU9dLX+Rp6VVatu18uOlCn
 hY9BDwcBVTi4X1g6I78ZP7sw427gIoc/w/91We3afdZL4sg/SQzQHO9S4DBMCzniy4f3cTk/tRK
 1iceILrYk2WjRnUncIydPSUxmbfqpMGQS+ZPX7aDIiM/ikIG+HGZB52azAEDpbY2NrUnOxhBcR+
 sZtFyfnUN3x6C+5OCdZvkZR1YJGyyqLaO/+gJh8mPR4m+mtCVfyyMPtrfUVBBAgm79Cu9d+qU1K
 o1dI/FkLaoWkDRkU0AMUbPrnfV9FEEtaaY8kDZK9ZqGY5m9xlJrrOZiPfIFZ2OyIBxGrZ4Bn1Er
 hO81XdGGrM98bB9G3W8Nryp+2l+64CaSpJLD9Vkw2hJNAytMMPm8ekM4Hp6ORqFc3UXrHMWfqX2
 cEOvBLtdLIfxvFgtFPXET19zLlnm3yMoePdQA7SosIWlGv1Sz3IwiJbe2nHAppbGyZTGTQVDJGJ
 0w3z9jhFJKoq67VG9D39av/uoVGJJsGoZger7yiRnu+sNBG7iL5HpenG4gBsAZ46QyarKxfBPKb
 yBCgolS6Zulsbsv32QUPaM65j9zyLYDCMZpECMwWBw5WSajMFTGh2vjvruhMX+PRVHdBd+3w4dJ
 5DxP4roLm6U/C7Ee7UpwzZA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_150808_644898_AF3A6023 
X-CRM114-Status: GOOD (  15.09  )
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

Move handling of the PHY suspend handling into its own dedicated
function. No functional changes intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 48 +++++++++++++++++----------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 51afbcc40c4e..2919c2e11968 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -332,6 +332,35 @@ rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
 	}
 }
 
+static int rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
+					struct rockchip_usb2phy_port *rport,
+					bool do_suspend)
+{
+	int ret;
+
+	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, do_suspend);
+	if (ret)
+		return ret;
+
+	if (!do_suspend) {
+		/*
+		 * For rk3588, it needs to reset phy when exit from suspend
+		 * mode with common_on_n 1'b1(aka REFCLK_LOGIC, Bias, and PLL
+		 * blocks are powered down) for lower power consumption. If you
+		 * don't want to reset phy, please keep the common_on_n 1'b0 to
+		 * set these blocks remain powered.
+		 */
+		ret = rockchip_usb2phy_reset(rphy);
+		if (ret)
+			return ret;
+
+		/* waiting for the utmi_clk to become stable */
+		usleep_range(1500, 2000);
+	}
+
+	return 0;
+}
+
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
 	const struct usb2phy_reg *clkout_ctl;
@@ -603,27 +632,12 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, false);
+	ret = rockchip_usb2phy_set_suspend(rphy, rport, false);
 	if (ret) {
 		clk_disable_unprepare(rphy->clk480m);
 		return ret;
 	}
 
-	/*
-	 * For rk3588, it needs to reset phy when exit from
-	 * suspend mode with common_on_n 1'b1(aka REFCLK_LOGIC,
-	 * Bias, and PLL blocks are powered down) for lower
-	 * power consumption. If you don't want to reset phy,
-	 * please keep the common_on_n 1'b0 to set these blocks
-	 * remain powered.
-	 */
-	ret = rockchip_usb2phy_reset(rphy);
-	if (ret)
-		return ret;
-
-	/* waiting for the utmi_clk to become stable */
-	usleep_range(1500, 2000);
-
 	rport->suspended = false;
 	return 0;
 }
@@ -639,7 +653,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
+	ret = rockchip_usb2phy_set_suspend(rphy, rport, true);
 	if (ret)
 		return ret;
 

-- 
2.53.0


