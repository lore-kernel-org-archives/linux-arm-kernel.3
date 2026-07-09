Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35588C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E032RotW48bLOT7HbIiTMj3xBsVd9nD7/X6QVeRlSzk=; b=PdZxj0WBuOvfAN+ZXCr7hydYoH
	57mtmuqWZTO3OqoD0ks20hdA/3pMLH71ducf/oiZZ1gkuRVMPHiX/iXtr9SEhV/We3n0P1ZzQbsfU
	JsgSmPfO8dtKtPQWwMMWpdwUmIfac9DwTd0CfXnhpLkJwqY2o3MvvqcOgg8Rb3qRxzvYiIK4FaTuK
	m6lu8gNhJjd/e5L/pitPqK2yYqz/cahDaJoZ8tAhZFPQPjZksgvyieuTPpkBrlRnSJG4WgLmc0QGo
	QXoqWcXMhIsEt9A+zEaexkVpwliLaYnH5sGZNS8kCq0g0lWjMzQ+BqPnBunwW+IT+VsTNNo282vW+
	07b5ABjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1f-00000003Me8-43zW;
	Thu, 09 Jul 2026 19:03:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1C-00000003LQC-4BOU;
	Thu, 09 Jul 2026 19:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=DD06F9UGdc4fStpWJrHPhAmDgKde7njpjXBETGCLvWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OZv28SFQI9fBi9X+WQsEm9lTUgIhQopQ1ymc7k7saZcK5xKGAj35YyUY6bZ1PtX8Q
	 N5YmOvqCj6vR/+VBPEw1AP+DLvNa/EswJ/d+2szC9zPWOVerGvVZTXZR4lKKVFHzyx
	 qiRcT4S9fJMYD9xRBcB0CY1/dfBlOkQyBtIgeqO7AxXIxaW5iR0QS6y0imx8MWNHZ3
	 Suv1kC6fu/K8DhFVG5HtSgByTqcMeISX0q4v+8/2CD/OB0/Lf4dfLT+2F78fsIs95Z
	 PSZ2yAezhL/fIQZJxXHBcoqF1EY7khjraPmmUP44CXN+5lXpLCfAgkQX6x04JDKcZ5
	 xhLQaN1l9xWkg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EB3617E35C0;
	Thu, 09 Jul 2026 21:02:31 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D12CA480075; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:54 +0200
Subject: [PATCH v11 31/36] phy: rockchip: usbdp: Add phy reset notification
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-31-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DD06F9UGdc4fStpWJrHPhAmDgKde7njpjXBETGCLvWw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EW2J7KWyamrkzt1XCjQ3zS0W2FgT8fZe
 maAfNSN0hh5JokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qa6+cP/3I3TAY9YRxx1dlT5hgKicUY3ZayBxzWJs8P6y6MWrd0HN/PoFEPE+nD1fJRahDzav0
 sgdLlIZOGXjgnQpoKAhiRBrO4XaqH7LSiPrx/Rbs/cCV3/1QnB/xPt8Hos04kJAG5V82jI/YxUF
 U9pDphPQRuFgNSRfnAjjQikUzjpeoVccve9wfowsqrNgwN2kfSkJGKl/Tumzzu1byMO+baNNLek
 ibSXJ8R1lgC9OJEvmh2AV9/jkTDqkJ5gXKz4WFIZ1jWhNtt1od8maRnnmCS4TMmG/tXxoeKqpP4
 je9azWy7m3F1/fDW56FXMM7BR+fbDP5fosPFTvJv0REZ+LE9c9ect8EVoLUtSKoNS41H5/34zJV
 fiMO2l4mFP13iHBlqfu25YAlMxbF5E+SYSDBlEzqjbKofQJaRc7y4uS9qzjirUWVi1P/G/7Yjrn
 KKRM9nk/LUKZmNPqcQQj5WvauXPWO5QD07nV9QsrOG7Nqzo6kPBa8Bg/EGY5auE0uZTCJ729Puy
 3F+RT1qRvQ6SYsVPjl0/88RIoCjX7dsQE/Jg9vjxwAk4STKvRkU4AFXFjIErZoI9oO2j+kRQEP2
 VjSKcgNeIsWK/ephyu/7Zdf57pXbk9zL4yiDxwJ9occzL/C/gvXvYA88yw9Xc44OWON7Wr6UEMN
 CbvqeQ5qaQ3SR0AtSFOw0vw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120243_379112_71899B2A 
X-CRM114-Status: GOOD (  13.46  )
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

To resolve issues with running into permanent "cmn ana lcpll lock
timeout" errors after a few device replugs, add support for reset
notifications, which will be handled by the DWC3 driver to gracefully
handle the PHY being disabled. This avoids corrupting the controller's
internal state and the PIPE interface between the USB3 controller and
the PHY, thus fixing the issue.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 694688ed387f..5d151fff9eeb 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1005,6 +1005,11 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
@@ -1012,13 +1017,22 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	} else if (udphy->phy_needs_reinit) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
+
 		udphy->phy_needs_reinit = false;
 	}
 

-- 
2.53.0


