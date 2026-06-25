Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E350CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29Acj2+KLj9bGeX2TWXgrOZqOKeYOdbp9AujaGRbdxI=; b=JkWHdDibGb6zJdMJ8Gk0KFcWB2
	ONs7OiwqWlwxaiY28vkhqMyd8CObMUH5hZ3uvMKQjAGzzPRC8pO403i5RUj51AklpCfSf122OOqTJ
	RqJHAaYNeLy6StRhqR/U42c919CZxGR1v4L8jHTFW6gVXYXLJ1YhFAzpv+eQsohcJQ+FAiamoV9E3
	PkLz1XB9+DSBEgX9fL8kdFgruwNh/pk6FcFSLu/M2kUBkk6NgswgNU+I1CwJkVps/jmxYPmdMUI9H
	OEJw8MWL1fD6cCqRSWn0YGjhmIHsZgbuVt2hbsp2lDwN/baNkJyrzifXwv/jGZJEdn9qyev4FSHWH
	pEibNm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco4Y-00000009bAZ-0JEI;
	Thu, 25 Jun 2026 17:41:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3L-00000009ZZT-1mSm;
	Thu, 25 Jun 2026 17:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=D8W7Aj5mp7BhG4KqQQHogMa/3oAHcKKllT3RyusEwlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YKaVUWCxtXuOskHPq9H/j5lNIgr79L5EGI9dFkt60oTeeExl4hrvdjwqpQuGPb0Zd
	 e2EWoyhKLVQFLyCJl/7qRQPS9CU2NoshcRgAbDtKhJeodPTMtCnY1fofKapOJ2GbgQ
	 zGEzVnfZtbVnqOvF6bSi/ayKQxT8hL+Qgb8fa+/+QcW2xyMSUtKh2WZvPaWQ0Ltrh7
	 hwd6KUPu7q3n3p68TcYzX07grkuHF7KSm40sSv8lA6ay+2bM71sNv9pDn/OfD49Kv0
	 NStjAJDbbO3R1BUmNMChP0PJQNbrxqVS/qeag+Ys7CL/t/p8JixsZd47awWTw0f+k9
	 y0AX0eBieK6Ig==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DFC417E1576;
	Thu, 25 Jun 2026 19:39:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 15078480064; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:46 +0200
Subject: [PATCH v7 19/27] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-19-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=D8W7Aj5mp7BhG4KqQQHogMa/3oAHcKKllT3RyusEwlI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9s2/XywSIndN5aB9JAv3dfipBW8IhQZj
 y4TzxCVsbypzIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaGVsQAJHgc3BC5WqOt5V2OJM7WO7th+UtnzmimmzQxb+kTNIW3OXOZxAMU1lh7aMHD1AUo1s
 /LV8JdoyWdTUkoq5UZDtI/raLEPUncPBlZCPHjIysRUOz9w9EOTzIHrb7q7sKokkbzwhDu/J1/X
 RW7Jsjg4nd6xi2WS2MoGs/5Bucv29PQinE990aCemGiVC1y1R/Kg5BdijGngZPbBNamivG/v5Aa
 MdNGGSEcth30J5H5baoqlrlKeKspYpa7W9g/NOaoxqk9IUvJRGBqyjXdPz9Xdd6Sa288PnybS4L
 ntbeqIu6oSPm/i4sMkJTqkE8IMk1xSth5Ai9EEr5iop7KqEygM8u6Rdh3vDQCco8cAvxFl0jU1/
 voQivP3Z7fwoNnmzwhNb8ZHL0SImEcE5jLViaylg5wElBuWhNdxfeR2GPDlDzSNVShr3KegDMPR
 kn7nYg9DMJlwIXPhtMrmcrU1u8PZVA4qgwf0sahKqdxWB3nvbl4qB/LwPaVmOrq5yQj6tlTqEM+
 0QrZCu5SGU6fG0quUmQkzT5qiLCB/sv04BBy4XwTlCVZ8YCyEoIUs4Ozi/wEDpnK2WpMtyz5L6d
 gF/PygIbRqxb2Ip2lsdxziM6mvBF81Sv7q89pgLEEnM0tt3/kfAzAu2xATvzmQQMAywKp/2PFf+
 k32lvnl53gLP7PrguQpspdg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103951_663777_6953B74C 
X-CRM114-Status: GOOD (  14.90  )
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

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8b5b188fd121..b08f0c142b0d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -583,7 +583,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -981,15 +981,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


