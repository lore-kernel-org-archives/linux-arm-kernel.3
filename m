Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DC0C5DF6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BGJKOQ8a6yGihwZtDQr45A177INDRaug9laVhxeBe4=; b=C4zi6/8OM7i3K5qdurlH9ep2qO
	+MYLTpMx3T2U9i5W02xLUMzbtdgvl5JnAgFieHySVckuml0vx89CZgzUkdDwgnX5riGt5zckgpx4g
	lgVbOLiASzGWMrElCreX0+UsSoDgMubbo/ZkknHzDHsvaRAb0gl8lbRBoih+iX00rkUDOZFqE6005
	PDZUgTeAIMSroWyk72zhy4BRhhDyOcKwGKkhLwyS0/Y1znq43AkwAigIYgSTLUo/GpteBk3xJyBUX
	LYe0u2/tojxgTz9eNjv+iHopfUYygS7Ee7XD9cD+JQjsta9kC9COjy1Jnm/DCDHICEso8DVsG7wvK
	8JBZznaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPm-00000001Y2A-2Jpl;
	Thu, 13 Aug 2026 20:52:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPA-00000001XEg-1re1;
	Thu, 13 Aug 2026 20:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=g26nTS99Bkf3/4W1dEJ9FwBrT4+6hNmRHmeJqiVG5jo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OnxbQzinnIZ4b90h8lwC4yAW6wY3cDHT4I+BhMLssRErDJA9gZtmynnTygKvE3zOk
	 70sjKZxq9JP007+3tp+DXvM84VIMza2+kbeh95IiW6y1gSi3b5xI/RBZpfvhPyVECD
	 5zh78r2vMF1d+NhMzTU95JRfRgpNvvkLoafgeaqOOLaG8xSVkejjK9sQg2GXRCGx4t
	 vJK1/lIfN/P28DVITz6PW69r6RwyHYCJ/TPFH+n3O2bH5c0a9gz79kyoDcd/oFyzkq
	 bJuLyK8GQuRau0MwrvX6hYNhKGivYaYVOaYFcIhfI1iBFCj5el+vznQO+FyyB1lWDL
	 2eLqIuroYoJmA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 516FB17E12A2;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A69D248004C; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:55 +0200
Subject: [PATCH v14 12/38] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-12-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=g26nTS99Bkf3/4W1dEJ9FwBrT4+6hNmRHmeJqiVG5jo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmTsTucDFzDd7xJbSTHjI7szmPb8ccS3e
 2EHRy6YNp1v3IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qanqIP/3nCMl8Bh4mJJj8aSmlpW5IS2QxXJR4IVsDSjJ9CcOckPqJj8lh8kbGU3jhs1cSfZEi
 6Qd1CF0X0Gh71qknQ085KE9+KI2j9RCL8nG++7/uGlPRL6xfne01Pl5f3QWruLdRYu17QLyJZ3A
 9oHuFRneAmzbSvtItpCL9G7ijpTgUQ7T7I1suqzhq4d1FVxuTKMpK+FL0CaBe7Ql/nmVK8gduOF
 uO7irMuIYSUA9SZGLjZl303d94TyI9sEPm3Uh0JBTmfA1/fXmmC51viOBJv6TqWCg1kLIrmMCz1
 s+kJu404K0Hkxg1nPC7U8NkFNgBOzMH45sjAch+PyBKf3ELGbb1/8EK2PCm3gsdU+orIOXlp1wL
 Hl9K1KtNwc75PMfF5IrdzrI6MLMeKQH1bKANdJ3rDJn28mRAgC2MCg1r5fOrplvrqRiqxCxEHCr
 nYE7PBPD87DS0xpbWndJKZ0NAznjG/kbLOG81Thp8DDPhhdIpg1TOhsr9jBFEOHL/punTCqRFBV
 I9w6qYYekyr3S2tBm4uCiMCzmzuvAIm2qTAgWendBLIOtQ3nROIkuQ/ts8iyVy4PeQd+rUSm/AJ
 5Tw0izcBfE60HnSH7+hc3RlH1cREgMD9tMthaCw/jAA8AQYgoXFz0t0YNZbXIb47jDOBzplY8cR
 IFEzbTQ6xPEEBPXfjZ5QlYg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135200_704336_03418E77 
X-CRM114-Status: GOOD (  11.93  )
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

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c4d62b234ea8..b172ce6a722e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1099,6 +1099,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0


