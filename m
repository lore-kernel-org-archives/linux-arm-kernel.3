Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59919C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ur6qA6hAP712lEuWCnSpdVtJp7T98n6tWpR4IdaSLTQ=; b=Nd+lqDZyY7pvJMWh5kEH5dYT9c
	hIspXSa3rJXCH5xVOAJppRw61j15OIVnQ8puiTSQfCBOhj2Mun8MN0QP9OoOGFuvxLC7JToCNC47R
	+39/9gAfdqN2nB0Xp/R7XEZR3zNv1wZ7ilZm1WeHj83P9IXpF0hkGda9uV3gCtigpsUVmz1tRJ3bf
	6JlufpSzZIM77jHjFMhHVpV2UxCBCdsxq9Asa0VKaqNqIUWZbjgRpjmSTAHFceODsC/xFsrmIvCHj
	SZgDnGpZRIUrIlWeKE7O0Cc8eLDOX68QfhsmkPJYjDPF97cYnVgT5tJIHCFEQ0K9tvdwUIoJD5ELL
	Hmbj8YoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEN5-00000005JYI-3fVl;
	Fri, 10 Jul 2026 16:46:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMn-00000005J6y-3I3g;
	Fri, 10 Jul 2026 16:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GnnrQmNNtpLfPDSbDLFp86lmomePlzslk24rh1EhfKH3HXh+zGyLqC/sL0uCpUrg6
	 qwr6gU4sEG/GMcC6uNvkwNsc7NdcrhdSDEvYofw/aGCR4fh5l062mmnFWceJ7pxepU
	 es0p9wd9v98/KqffXfA3sCJJQE6fv90AY+pBvH9maVjn5mmY6yHkVD/fKs5ybG4etK
	 BzdU1yJcD9n4743zhgw41XKa3t1CkB1rC2QMSITRHIzhN558Mx7vkeooEH1yGAxMK+
	 MczedeXnKZ5dxwhKREMUMomw2HastSAagtBWahIb3IW6I6a2pRYgjl3uWb9UMkS+Ro
	 nlRvnFBPKaD6g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BE0F17E0EE1;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E103E480030; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:42 +0200
Subject: [PATCH v12 04/36] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-4-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdj3skmdAY9hE0EmEFn+NxysIoCgoP338
 VpOktKxZXbqjYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaokgP/juanZbEDJC2iZ4nbjI3JQgW1oeWtsvCgVVYI4cYtBnMDk7E6F6dN/MFIa/g54Qfh4P
 1AYhw39hCP2B6Y4BGj4HCPz3d3fCofjH9FQAo9CEik9owywuXZCKh3G9+83/c4D73TVuqaFhWqo
 rdZdSkr9a2wFSMT7+fzx+iuoz2MXpkLI6BVkKGNGRZj/rmynTU5flBs8ibPeIUje5zsvVTQ3ADQ
 va/KYY7SLAUlFlfWukN952cYl8CNok0nSPxRuqX2HgRV8B6P6+MubEno2NMl1Z8+dtAHBEWWGFl
 3ly0fYHJlhSptGiaOH2hHlp3r5VWUxkMui9HLpQ6L7DrdY8/ET75WFhiQMeW97FpX0nbF+owfh1
 Vw3y2rOcUYpuYaLcPLbCtZ4FhR9eKw5KlIa+m5MgfbLiAAGD38BbTD1Yi90EzPNJoSnJTDy4XvN
 qaU7XqHqcFXtSArxbYxQpcnMyuZOAPT6jOZ/mK+5SWmXNMIlRXe3iAXO55YwL9I4buRLgQkYdk/
 LDhFPgEmyVysL4YwdlkX1lmGakSSRmdoTtSM3uGnMHlSs6EO3td0YcxYSK4Zf+p3euspFUdtd+L
 bZFlm8f8wHh3FTHLOcNN3x/nNdFUG8CwzdDFntJUhDqfj7fZtwWyQUKpRp9n2PQ221cxaXhj23G
 3o30UzzA27KWieQc34ZculQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094621_972218_AA6CA882 
X-CRM114-Status: GOOD (  17.07  )
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

If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with
-ENODEV, permanently failing the driver probe instead of allowing it to
defer. Avoid masking the error code to fix the issue.

This effectively drops returning -ENODEV in case no clocks are being
described in DT. This special case will now be handled by the follow-up
check searching for "refclk" and exit with -EINVAL.

None of this will be hit in practice, since the driver is only used by
RK3588 and RK3576 - on these platforms the DT is validated to contain
the clocks and the clock driver is force probed early. Thus there is
no need to backport this.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 12dfdd470a78..2845a012eafc 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -427,8 +427,8 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 	int i;
 
 	udphy->num_clks = devm_clk_bulk_get_all(dev, &udphy->clks);
-	if (udphy->num_clks < 1)
-		return -ENODEV;
+	if (udphy->num_clks < 0)
+		return udphy->num_clks;
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {

-- 
2.53.0


