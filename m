Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E40C44502
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 23:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdS0/mYcTCv+FHgPnjzJXOwsSnSmEpIkp7L8nznw1D0=; b=EdVK0/YPT3XzvOYYKdCWEngcUj
	wwqrc+Jk6DrMInSwuOPAVZLKBX8XaypFq0U1CdfmnoWYVNuYOHdYUS+F8LVtzYOf8/qvunY9S0+dm
	/246/KmHOzlY5N41hGq47RsUD4Y4cBMstSYVlohs5mX/Tb07xbqmhkT6VGVi6avqwKWbupFZ24iV4
	A0mpdk8pjfvnrZ5r1bWFr1AXuBrGf7eZV3f8SJ9VhfF509+rMVBSO56GKkwxwC/11RUIBWDOvmj6u
	8yHE0j6VkULipjElY8IMGVCWxIGv7esZMi7AbP5raiReJCn/hLrgNz3v46m0oMtgOTswKNavsT7Yu
	EdBfr+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfnS8-000000080Wv-2aG5;
	Fri, 03 Jul 2026 23:37:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfnS1-000000080V9-2ZNy;
	Fri, 03 Jul 2026 23:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783121858;
	bh=2gLkRV9WDvS2Po8dt61VmCkxYhpPnN12xRBLJSp5sbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i6T2RFNYDfgHQXt2rg9m/DNtkTPeEZWUCaRffPAeQCBqBGrbaP5+9p7NKubj71C5/
	 1Y78+n2MqL4NGz/koYVOAGBIN594pfmOxjXGGz+ec7l03TrN+MfvwkTML4fwUVGJnc
	 R36y1w41FNTTreamk3NoQxsB0+4PPncdrmBzdYsDz2qYuINhCQFBGK6fSx1LKV2AbN
	 NDDDs1hxC3z0KCe7J9CUIJgO+IPt24UiLExEq6rOxAmxSHawWHRz1KPAQYBAMnbQwW
	 awwFkJ8bDw6jxG+J0M/SZIx7SC/2IYl8EyOPjslojyY4oJorTrkuyj4kizWI9453sN
	 e/AEH9+P/rQog==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49AA917E0432;
	Sat,  4 Jul 2026 01:37:38 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9C16B480069; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:39 +0200
Subject: [PATCH v10 23/36] phy: rockchip: usbdp: Clear USB status on PHY
 exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-23-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8uzTCGcfx7aBy8RjaFXMPT5UX5ii/a3Q
 XZWVRclXPP1/4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qab54QAJNr02XF0CZrF/nSEqglqCd8fiZAS3513nYQffMUiAjhqmjjzdpypOS+kuKdRJkqc7j
 HJkbngomlGuiACLCOrBx+fz4sRMOyZJUvcWTX/1ThFtNjoS2VoXFo7qH9/kJ5LYIR4r0DoN0BB9
 Q0M1gLWce/1sZihkKrQcqQ1UTdnWEthHeEc0cZX791hSAH6xvyzO1wr5R5TzBEGc1hc2w19xUus
 g66gKMHQ4D2a2AIBFxl9g6iHpIkqmqoUh3xlJMTjcoxM+uVqzhofxiGp5t5uMx+ZQ+JzLlJFtLp
 HZXa3R16qW3pvkHTY75wxpejD8lVcqZWB5FDcTy/BwnK3km/1LJllyQM61we7yt/lPGgWSh6TaJ
 8B3fiI/Bkx1FxiflEN21AS0YPq3TiNO8en27jgHyW3JCVuLf9dRMc/Ush3X+UmpHH+GJWdeDJMP
 pm8/igl3Bm5uDv/WVHTK1HWl1YONdJ7kApOmOIWEK3NiKcKe5kcr3ljqj99Eo4XiT9IM9QzMoAV
 jkltOKbGgMGV4VYT3KchG98Usju0muYqo8/Ii7ZT2M8PzHwnw1BWZmt3+K7LKtwCF+6FdQHtFlk
 Uvg8I2K16u5UJ7LdirSFBzrBuZbWxEuQjM38mDw6phKDUavfcTGYUXvS203pVsU1jaOy9JWtW19
 QyX8As7/RmYB9qLRLh+swGA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_163741_808972_9BB31BB5 
X-CRM114-Status: GOOD (  12.24  )
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


