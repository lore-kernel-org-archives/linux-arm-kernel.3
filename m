Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB41C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeO/OLLMzzUuod5GlfLCJVFHRZ2c4eKuMHej0sKxqfs=; b=Z9BqWaUx7n17q4vKPWn5tEn03f
	IC2eLBIaBBrSalYY0HquGd1AM+7rPZTpHUPIfN5VeMeaycUdnaNRhnsKhrqgkQlKmMMph2YcKxeVb
	pCKN690JQkrraWldt6uuQy2TOEMfOrPbImszE8GX8CRUonkiyrEkAqMM1kON2ACZRE1Rl4mafjwGv
	7HgCNkPqNc9x0N7Bo8gglQ3QGRs8X1Pby788fwu0erVQsFSeNk16Iw0t2xb5mq9AuJGtt/yVidZId
	rZNPPL1dtx3wROQdxiQtjDxmBsQOBWrH1AZnU/hoMmCPXmQQ0EuwccI0AjdfHfuFjYpVSfRmhaIWR
	d759SRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucV1-00000001b7R-3e5J;
	Thu, 13 Aug 2026 20:58:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucUo-00000001axf-3vMf;
	Thu, 13 Aug 2026 20:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654668;
	bh=GHi/0FLE10kzyAmrm07WFRDt6rwX8EVRnOD0MyaLeJY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f7SGli9wg8ZxFYynXep8y2sCZm17P46mGiXOgCK7otAHi1xB4cDNSj9ezTfl4N0CQ
	 6OBKpueX4MRwTC7ucJwKhxMR2I6wgB+WUp0yHsVgZMGmaSQ9ugWXZjqrULdsBKxkSa
	 03u4Mgb1bUPQ5vbPg6Wv9pwbz640YhwGEUnS5y5PEegS4IFqxfNjiGYgcHxsLqYqRB
	 9zu1QbP1VLI5Gboik2VEA4qvtYyMx907h79aEFUEindv8ymVq55hbeQx4goRNY3Ekc
	 mER6G8JLSkyHRrio8iahXTozDONaBMQ2jrXhlBNGz8ipujZ+LVTv4xbJ+CAH4OFPwJ
	 NGfMLGP44NBFQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93EC017E0F83;
	Thu, 13 Aug 2026 22:57:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CE40148007C; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:20 +0200
Subject: [PATCH v14 37/38] phy: rockchip: usbdp: Re-init PHY on mux change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-37-b5ad9c68fa11@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GHi/0FLE10kzyAmrm07WFRDt6rwX8EVRnOD0MyaLeJY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmUTSX0JDAOgsQKAZtnwnYa5DdOH9Zh+9
 sLairNH6I5T94kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qaW4YP/1JZq4gwKo3oHTtABtWAa3Si6DOlj1fAcak7W1/qzZw/Y7fGkAgbVFhaRedokSjjVWu
 wa3IvTcM2hxoKCJqJQzHEEHKMIuSAX6MzYJKcBkfuNNBOhXr0VzTOpXcBeGiAPiUAGn/zaxkNxr
 M1nMeFMXGW3blwjj04lXhpEWY2T5Q9GvqT/Y7hTvyqdODz9892v+y36iWISLdo+vDp7sR5lodLj
 F5BV752jyBcbC2ti0ekpBKRhgtr+iQyeCNX97TeYL6Fm+ARhW0NPtP/VemAAyXvOA1Z2M4WD+tY
 2jiYP/VgTurE85DOOI0E6AFL3VbZuk5zejJcHro3Rvl21nnhfe1wR3HpoXaPRE2BqFLdq5QJgW9
 Bj4DhjucKudph0qyAVR65yYmGgyHx5LkMt690T011/tIrgVbH736zOF0Ie6WzuWMcv7gGkQkCmr
 c2hIfE7HY9kbqyd4LAoTcUtC7fwmU0QQsxaXs2HpakYXEdCoDblj35tDyT8cTaRi1HY1ZFF0Axc
 Nz42Eqvg007rY0C+iz5zOTmRnmJaecyqQhIAMZ5qpWZNvYnu+JSzaEvght6OOb4PbnYTysRAn77
 SKOWk0DcQ1WXyGvLGPzF/vYnclWifha7XvFtXzixkMAFabl+9+lcGSR6Kc6Jxae/otYJLVOqPa/
 JZLU/C4Mo9IMv+uaMPpQuOw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135751_135925_BAC3C2B6 
X-CRM114-Status: GOOD (  12.52  )
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

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e597cdfe8d79..87d6df682176 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1392,7 +1392,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0


