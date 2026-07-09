Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E485DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdS0/mYcTCv+FHgPnjzJXOwsSnSmEpIkp7L8nznw1D0=; b=sbbsqnD/R8w9JrxYluB3Oio6z0
	/gHTeFqDzdtN4AjQQHFtf6xibvjtF8UqaDjVG/7QSpoVF1VvHzveU98OxKE4gGVF7pU0SSChu6ND8
	JyDPq0GYpYx7G9NWKiIpx9FuLIlCUEbk3UiMNEeVa89ZMskT7yq3+p57EuqJgBxCb3zaEDx8cuEhG
	QwQI+jLQA5KKvd2fzQnjrifCDyW4EWGxdt0X1s9WuYrQ2900vtEnB6dvSmIrJyk3kveTe/H5ECTcL
	LuWiOYUVpigqqMcc31zK92TUwiBMKZexlLftpgoGxYCAUwQClaEdYVzZRttxWPXh5opexObLwSM56
	Knl5kt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu3B-00000003OiV-2PIa;
	Thu, 09 Jul 2026 19:04:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu32-00000003OUU-2PXE;
	Thu, 09 Jul 2026 19:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=2gLkRV9WDvS2Po8dt61VmCkxYhpPnN12xRBLJSp5sbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BLycbxVXyFs3Sb7fMLBSqIAxBPZq5ac+AoSBsAzQSEmS4Wi0YdEp8tBWev6yPqLJ+
	 UnbW/3kv/GFdUCt12WT9/g7TYIrrw0p/sOWnMcYOo39cQY6CpVSonPOvP1AW2PtvBD
	 xDipF7Qo3pwASvi2lRFlGfdKFb3e05k2cudm0KbLGFmXW4Gv3umw1kKvIX0mV2EzZK
	 MinSqUGWoqnb3LXN4SRgTVrD4Mux9S1Ig2dRZbycM9Az5P5LQYD8noAt2NR6DDW04I
	 680cJa+mZAmecVO3EWqHQimgWSO6MVULfFl2TkVocRica6OD03Wxep8eV2mN/2jryw
	 JTS1TnD0Lp3NQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64A0C17E0D56;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C4E81480069; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:46 +0200
Subject: [PATCH v11 23/36] phy: rockchip: usbdp: Clear USB status on PHY
 exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-23-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EX0DUba+Mp4Ixii4ty7KQaRBOEX/SuIs
 90YFcVLcSvOZ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaEKQP/2/45hwEeiIdWrFzTNqVCC7s0hVW6P9Q7hL5u5oVTXFVhex0RY4k9yplKZbqiV8Jajs
 P+FQKeDdRgkJ5pq4PJF6luMjGt4lHndNxL8IyLsfPM4Z0TdESw6XWXylfIqreLruiQntfVIiSzj
 /v+8lqwL5x2gP9SrAo4J3lGDvKpxnvmiEoMIPz5d4D+TiPU4YWkz14dHXTEobMCb/Vw0o+tMS48
 nTHXvpjGktiDyaoRRE9EaWb+CgWGPL4eNeHabhBBJX2Se/mCn3y/IfSQYfsWAaUSBlfuVg/a4Wr
 eDagAuvcrNy7QiGjGVQKcJ1/7nnNfxuhU+CToNWUntpHkN21+miR0NV8qLHUxsXHsXDPXv62k42
 ZUiGDXBwSgo9+CyQpqeMjHJpmO9esSvIRucbJxZyUMb4164mSzHv8FekyUpKMZZ874Eu+s/Hsz9
 uNdcQdZLxLuOLXwKPoXqdZiH/WtBI1QLlS1YKgKIe40YD7UxpM9JdanqyUpNuCDToG2nu1+kkYC
 P6Tkw63SQeYUu6wJY+JJxzXihnvYdEv9tpgk8TxMKXdhs5HbexffinDwkUSJET8YKTqGKqU1YIe
 Dn6zAVkGOu6UoN19/oPKTitTCd/yZr8FSAg8dcj4BYiWJVk06PQ2Vk01kUE+gkr/9lxMOEUnhpd
 XGJTAE1m0Ly/bysry4awz9Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120436_770691_55EF99AD 
X-CRM114-Status: GOOD (  12.66  )
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


