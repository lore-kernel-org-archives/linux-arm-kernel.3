Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DC1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdS0/mYcTCv+FHgPnjzJXOwsSnSmEpIkp7L8nznw1D0=; b=Os666YzqLqSvFxh98maoS7joHC
	L7GXbr535v01OJVVSLQq8SDd104BqTXdu+gnaGzgyGBQdaOqty1yiHWpJZBMkGKvyKlGK/gcgauba
	IKUtetRxjx9EK5L5TR9hDf0vNNWVCMxdI6aY4CHPFi38Stj6EuGUYEwK3kFaKS05EpU6lpQLjHQWv
	yx0YFmbbvh/xUvKLw9H41b4LxzB28MDs3ocZr4RskOpGCPNPjAHVydHHzcwgxjrEW7xXTQiYrt1yE
	La4Bsge8Hrp94rEcpmCVz6o4PGDm6r9+VSX3aLpBRTEt9we3Aer6XHpC9UXRwBIz8uzEh9HMPY1O5
	BBbqsw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENp-00000005KqK-2VEH;
	Fri, 10 Jul 2026 16:47:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMw-00000005JGB-2nyB;
	Fri, 10 Jul 2026 16:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=2gLkRV9WDvS2Po8dt61VmCkxYhpPnN12xRBLJSp5sbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KbX23xCqk9IZWmkgzpqdhY7nlDg/WC+S/ncSxSZgSHMJ4OIyezWPqhWzuXP6aJLPz
	 s58/4vnCMjWaXXMssDNzmwVrNUSudwDSY93cU+D3J8tWApy9PKWju/KISsUYeV1Zdj
	 0rPQfuwJTsR0hjnv19aGYNQjoAMNMETKrNcPhUoXn7bMTeaH90+939kwASPY0KIY41
	 d1xH58exq02o5A5tfRLqqh7dPNuQ54SG4qICOWGeVu6FzasdnJ6wiC1H5r+2frdwIQ
	 SP9Q6I+B/3aznbn/szWtOVUwWcVnnW2e/yhYgdJzDYX0PtTfA/zgA4nCCLTUrVZMUk
	 FxmsHkO6ABArw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B2B017E1066;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0A3A4480069; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:01 +0200
Subject: [PATCH v12 23/36] phy: rockchip: usbdp: Clear USB status on PHY
 exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-23-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=2gLkRV9WDvS2Po8dt61VmCkxYhpPnN12xRBLJSp5sbU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdl/6QOwty84wstrmcD/c8k+KmVlkxsw9
 Wadc0m3+uRAsYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qaFm0P/imYG+JPo5C9PiNekq1YpO111qtuk60JOpoJcXeYA8ZsQKWCWa5yqsA+cJ0H7I98ULs
 dn+yhtufyQ1CWfBkxRUi+JZVQ337gAuSzlo7eooExY/j164m2nXOBeJDFaHVn7PfUd5QjJ+BVIF
 SR82/AMooT+lMgOFUeFlshf+BHlkGiuh8GjniTV19wWzfjSA9r6v879D7iUhxAQrTageFFb3yml
 Fwq7QBkCi+pUSRyhPfRuBzfKFCHXorzOjDe+jg8//nYls32QF+sLrPs+7zYhg79HORkVcWuH+3l
 RX02S4RrNhZWfys/2IemWE8o3SFdcXbUOROj9L7BGCAsssOVErTUZsd/PPZp4fPh5598ccb4qCb
 xb5xeLu1iPVkUeNBxkyiiDtSoC2a882q2QxcjVNuH+TIlE/pbNModiY4usQ3ZvQq7kTUq/84oU9
 +o3Npyjnb6DBmlDgGmxMOp7/leXXmdadyHnkKf6PsxI4dWo8yfIT81cRNSaY3s/PRyO3dPGZA4K
 fMAqCSW/CV4knR/iqLdhD2ZmxmBGNnbfpiKBEXfVescoeFUM/CWMyn39ZvV92zCkc39654MMsYV
 h4p3DvRcbW9Khei1i4u0H1pcPW7kjcD+5ExYEAQ8q51yjpi2BMu8Li/uqrwVIkjzW5bjG7J0BYq
 fksy3bZ0d7S4V6Bl0w/kyyg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094630_894411_0094D852 
X-CRM114-Status: GOOD (  12.79  )
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

Ensure the USB status flag is cleared when the USB3 PHY is
exited while the system is in DP-only mode. This can happen
if the USB3 controller device is unbound while a DP-only
adapter is plugged into the USB-C port.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260625-rockchip-usbdp-cleanup-v7-24-38eb3cf654fd%40collabora.com
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8c165bcab796..a742bde7155b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1273,8 +1273,10 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 	guard(mutex)(&udphy->mutex);
 
 	/* DP only or high-speed */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
+	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
+		udphy->status &= ~UDPHY_MODE_USB;
 		return 0;
+	}
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
 

-- 
2.53.0


