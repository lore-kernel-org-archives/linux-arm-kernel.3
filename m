Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1210C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB1AgcSaGm6xIGd1SzCXsKr01w/8YieE6ZKIcR7OfBs=; b=ZiS+Nd+T/wstk4bRHe+4/s/biX
	vGV4VY5k/YA/3nl518q1RlVB0EgbtCjzgt7dCL9P21wk7Sakb7/LYVFnwdB53WuyBA21tPO5Eh4wt
	kF0ovWiwE1eRck2bQMY6rSdMRpDqtXqxpUfd3qZ7w+RoI0jfTx56T3tJsxKi01oYzWqRufrAuBwyK
	ZMMc8FKF+4h6FZxpMp0XEWVAxt2JpIjWZ6OQGWf8SZKDG1kfUpKaF+1eidylzXWAMx8y4TFLs/HjT
	Tzm69dewMk3k/v5/Qo+zpp4eXiZpZ4ShVPie/04m8FvXCG3OhkKYm3AI5Swfxzkff9TQA7zBSyUwy
	I4PawJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENb-00000005KMc-1Atr;
	Fri, 10 Jul 2026 16:47:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMs-00000005J9j-1VJm;
	Fri, 10 Jul 2026 16:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XFO8By1DJ/gAVp+WFYrD6tBjg3DLbe0FQoFrl+v/HkTV8kSEHcFSXDpSYrJ03hwOj
	 rl9UN8b/9HO1MJ1afBbopyjV5GjWX0UDshAfQX13RyPtseOIY2szsS26wltb7E9U+9
	 2ZYNDCJMW0HUNN8D3D8FSGWZFNg80VNxFUhgpItaxEwuwPZI21UrIy/wbj2ctsoiGs
	 sNkfrmkK93uEfxwu6eIG/KF1gsE/I4sa0mzsZbo/g2xm2Yc4YCkRC1+/VtkN7N0+0/
	 0TIAGpzQiZufTK8oIuI29yYRT4FjMpKBjnt/ZJPUEEjmy5VzN7nfuAts+wpWmEjtxb
	 8r4CTjqp94wjA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B9D217E0FD0;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EDA5748004C; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:50 +0200
Subject: [PATCH v12 12/36] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-12-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdj72DDjkI9/sX7ecpjWBaZ0uU6L11Adj
 JQbaNK+mlmu54kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaESkQAIu0jxdbXqe+fqC+khEjIl6hvyv6VQwFYdaXEdNsfvDfm7FfPyCchwQSwhSXJlT/8tJ
 Y/BY9dJPLvsR3fxhTmFk54Ux1nJL7GAX4v2seAFW76k0Lj+x8aVrmZJA4U21e+WEuJ4sDG7v9mO
 E5cftShB/uw33/pTzJcskHFjfxI96EWMdCloEBbS5nYzIZUbf5ERnMGnvydSyPXC/LwY0/JGWo9
 LCne3Wsyb08LBDbCTOwB49UmLw1g9hjdRknPHynmDjbcc9QHlTX/NUIDvATjuYvB8GisALP49XL
 FPWDio3g7VerJyDDOGtd4PvR0PLsdfLApHqlb3fQhgKaMkSRyttNCSv8d/5QbxwxQ0VTQKrNjF3
 VtpAcVcesTRZ/kVomqXvg3brQfKKpr7YleJbqKEN/M/ESzbTOj6lBEvNe/TZkCpfydc8jS/Kt0u
 V+XDUP6egbnYmwj/K23LpPhvXYWm5G6lZ598AvpFzGVKDtJBGWHz5qiesevVZifjqV4ZpgNMpEn
 YeF1PR7m4O8uAT3bCm5Y2BnesXd+BGr9YgHHoit1zxgqjAxAtIvU2w1Z/ioOO1dMgrNUaGfS4zl
 AqbruJg+tZn9jnE0Z72LDSNT3J0dEaS/ogMBQ8fps7GOUu7IyFqVQ0duuu0PK7G6b5FMiHZZs71
 iMUSQM2GUxxvlMt9L82gxJw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094626_580782_7F3035DC 
X-CRM114-Status: GOOD (  12.35  )
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


