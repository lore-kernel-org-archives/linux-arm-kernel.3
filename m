Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F098FC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmTubCxhSp75GwebI3stidGSSHfrcux6sjD1ZZ4e/6A=; b=lehjR96LL+5V5Fb6grFTJ2F/XM
	x3+XPbOxg7nC2R9y3v4z6AMNi9/f0jRUe69slVDgK3uHh1/JQ8dw2R9Yu/tG5G7dGWf0TB6TDcVKV
	yQj9k9rwJQbS5nBoY3ojDSNWkpVlch0Dzb7XBZD2Y8XBkZZU2b0segPGd0VJaMm00575i+o7m+C9Y
	6z9KGMcJ/LTTNis/3N43x/dlSGNVlOJXcu/5DVIGdIhYGQI/CCjM4snVWFkf86NaUlkHEL/ecTVWf
	bx9kybV8ynrUfqUk79qHgOYGVHsLZIOrfc0MOSKnEfpp9AGuIwIQCtUJHW6oktciSKXUEjEGGYaPv
	TtZLTzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjims-0000000D4WQ-3n5S;
	Tue, 14 Jul 2026 19:27:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilt-0000000D2wA-2Tjj;
	Tue, 14 Jul 2026 19:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S8i0y6Bk2mz+gVTHiMTvthsVouojTBj1OxXbERRrMlNUXOJnIGFrS6NrjRaerbg6v
	 ldqMfXYn/Kyxy37KbcJ6oriwV+3CWwZvCkFA1UoTGT/eCWDfnjwsUtAA32jMncA4kI
	 1felqhIlJ6VvLPwoK6kXY8APNN2d+F7IFF97AJx4ul+PG1HHKLV5GGQzsZ4pRS38Hi
	 BB+WQOq1imj5yckWz8RNEpVtVUY2KM+mZSpmsL1THpQB6Z3SZQW9urm1NPF+j/XCQ1
	 OW3dl7FRR5/EfI1PrDC2a9UwTDvVETS3YyAe8Bp4ohcv+AZBpBUQUw3AMRg1uA0lb4
	 B/MFzSoI23n6w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D629817E1078;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EA865480065; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:20 +0200
Subject: [PATCH v13 19/35] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-19-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVD8oSGY06cvRrv0o+nrV7brRhxANuGPQ
 FS3rUA29mKG6IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaYOsP/0RYxf7jHIqQljkVWxzrVIXEbTX+J5PEYj50+l3SUN1Xwue6pcsKgAmPECd7hbxdBuM
 JYniWbFHY/Tj/wxkyjmJKGx/g2gjW8PrJbrn4iUGy2vH2RvpkLwYVdUZ/OkZhHnWLVEU3Fcnhy9
 SOFps+IsB9JH1oIJ3RTHbnv9Ru+SMGgheDcUV8eMqhH6SpfAQn2U7Gv5P5R4TyMD1GyWB2WdYBf
 luAWX5IvwyN04AQMrdFScFKkmhR8Qpi5O9ytt0RirggY3oV38GctJuBOD+tDwxPPi4oj26PGz4Q
 tJFS79DxA/5i2hGOV6TAqX7ghmSjBdTaWTikIFD1jt42l7dOPM8jvSZdnaOVdToAqGvvn5pTbMs
 yuNrQbgAa2SNvg2c1NnlPFOtScRYuTVpf79qU7Bac8KEDi5gjxm3rhqqIt611ZFh8waHmmWL9Y4
 0+6m/UDJE1cWXICzSwCqSmYBXqHcAcLIEdku+fpfNhTSf/JYg4p4oap9c0Et95YVsSGttgBmplX
 g+2eAcvnOUpjRvLdMa1slGOAW6z07b8rZBXrXbTlWCiFWlJVRJ4ZjEm9y0UN7PVRVUzih4sBv60
 2EAbg8/lvjwR5QKm6c5K8Qm5XD4jLIfx1E38ejkJuWVTg+6SLb0NB8zcax86YCmqvndXPXX6W6H
 WOnxIYuayS1gAV17kKQcm4Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122626_714908_A78A0B8A 
X-CRM114-Status: GOOD (  10.45  )
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

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e44d19c9d119..4b454798c4ed 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -620,6 +620,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -631,7 +632,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0


