Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5049DC44509
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIiPbnmfZ0AYHS3zNAkwf/hqGaZCCXq2NAXtjICsVII=; b=pwu+d2oqRv8ao3yr+/zZVDfXpg
	GrneJJpiTJtkip1JR554WuGkudFm8beoHZSPphNr4eCbmbT26+b0EbBO7bGTHIbIUqJjhPE8h4qxs
	1NH1hA3PUCo7MemKwJWBXnKo/y50w8TDlaEVLxZtWn6nJkn8RQEAq6cVFobYDCXPZHNeO0rDUuYCE
	Ci0mPXTgrgtDpPvdBygo3PqNp9kzDlp0qL9uYPP0VaV5f/ZoT9hK5kf0o9yORpTA6Gucg/DYrY8MQ
	Iy8xMvGdFYAH7jxdY/iJQZKyRzxNiXRTHFFE5VzcTwBBBb/vRqIUlztS0uAGa44/dp01eGF0sQCvh
	f4CkC+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Tm-00000003BFm-1kHy;
	Wed, 01 Jul 2026 23:36:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TK-000000039vT-2bKn;
	Wed, 01 Jul 2026 23:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=E3PH5dcID2nJKs/noMUpOfcvSjayh2aTBogbpSH7EdQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V2AjyEZVDnJ6h3Zvk3vHGoUyNfrlmRc1MXasRG6Cs9Ntl8QWDx+pR/j32kP8KxHLW
	 hSlQngtj3D5B89HX3QsH2ijih8CfY2FeU4oT1czb6qZonFS+Hps3R540o9XZnJxYjE
	 1SNetTnDkiuxCd1QNmugORMY83pC6EkWvKY4OqpHz8Iyn4xjw4knVmb4TEULhfT0Yt
	 H4qAzLphgIPykrBDuh2wMwFzxW5IjGg/qKoXdbpMjULDsvm+W+z/a2NjhPEATv0u4c
	 +pzT6LSxVQ+RNv/G1FgNYN3E57sbYQwOty5Wc8Fj2vpjZkJpuVmkydID/iIj+30O1S
	 UZ/62Ym2t2Cpw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DABA917E35DB;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D01CC48006A; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:02 +0200
Subject: [PATCH v9 24/38] phy: rockchip: usbdp: Clear USB status on PHY
 exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-24-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=E3PH5dcID2nJKs/noMUpOfcvSjayh2aTBogbpSH7EdQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFSZIwQ43TvL9dF8Txf69gahcpyg9sB6Y
 X2mrUXuV7Jr7YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qa4VAP/jCC02OyX+P8a2s+rWg32sVH2MuJZVRNL+4sMRhoYBCwtR2StQQjPQzAWD0cCVUbVAf
 02OuVf4TUk5CTQDY2OCktbHd87GpxvPQ1o9wNtcxy/nEpg8j5qqv29q55168WYr9pECF+XMM1i0
 2wI9K0fPoQQ5ymnmzuwBCqV6PSOJ3yrEqHuSBxTHgYYmZ5ZFEwHtJhtFXUey7KimOvuBXfMfIsL
 jmIEn9r84xPCb7b7gYKx7uSSlJbhPxJ/7bjfH4j0OvQAafVgdrDRkyNqQ1aaphePPnAoHmGACgj
 ba952xNcGDqdyPddPIOIf9VrcbBu9ugFaPysgyLdVt0oPlOXvrmnGBkbd8vWqX+4oR6a6rMMSk1
 y28XSaT2c8NDxf2ggOMR2jXnmDCEpCyQPDL8kksK3r8BAmfcqeO8YuYoY7+5n5ogU7D5PgbenIz
 GexrRSm0r9X5IpZpEtEkHqkofJQbrlNorBHZDH3i5ZqiT5ycqyZwCXPlJVMAEbQWNq7aJag4WqS
 SLZjZWZL/LTsIReqtund48cQ2fgIEYMC+0oMCHVJ9UoifKQh/yasmeoEeGwcqub7XHnOQfgGzbM
 WGmba+yqYd25Gr+vcUj0/L6sX0nBxj/ptFMh9HnfVu0e+HYR8hHGBkGh2ztauXDvE5xkE22fp8L
 FEg59G0POV/H2gSZVopIxNw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163602_942535_A715788D 
X-CRM114-Status: GOOD (  13.12  )
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
index bf6e7edbe631..1a983c1cef4b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1309,8 +1309,10 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
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


