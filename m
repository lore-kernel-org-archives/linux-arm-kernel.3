Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05247C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saEWLw1YjNu92bMixNrX9V8RDDwIDaJAUOKHl0fh94w=; b=WEn17Rz/yKtvM2ct6NEZAswGjG
	O8CNKy1oDAqKrlUN0kYyVvezTcbcIUtmYn1YbU9Etj2coZb8pkPvQt/bq15GyAy4VOoBsajyfbHyI
	OCoSvEVRnAbs/ua2ihmytLM2Q0451I3665/rZbI2VbMbEonV1qjiQXboMxMFfPAamLlLC9MEKdzXG
	iAMBY33yu+UxSzrpbd+8+qLOR0fb+Jnqxq1FOhFzDt/DHEecK+1X3Wga86sxFko5CwgLLI1OvbnIY
	0MqvRV+1wpb96pVnEx5+a6+6x42zyENDBEMdOcFyLP4popNWaYd0SevAEu75+zyBIvNEotmTm82+h
	/ac71/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucQ3-00000001YUX-2CMo;
	Thu, 13 Aug 2026 20:52:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPD-00000001XIH-0YSg;
	Thu, 13 Aug 2026 20:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=DRXGZ9p7V1/mxjzbN8TrhXQcxeu/SF2V+MgG6q/rcw4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nv4x1Cpvz1JnVCQQn7THa67sUsto/PeLMeRJsJMScgQLhHCx5qWCQ626SzJwT+ipa
	 oDEAO2AGVEqNwO0qLAmG35mm2nAIpOPtFEkBiXGJ4NRkEUH+kmuthVS2V9GTWJGib2
	 ogC5Hmz/xwm+FGUeQDAgtWIaRMq9JKXm41frLe7mXycgom5+rqSWDj+yceZuA/lbN6
	 EDD45HwCfJQR1o2RcyIhixORexYCiFBMrLWszjuXozAhHHNkT3RXX2SHd2o5tM4WE3
	 IyFYWCiyVa8fxSqbRM7E2bJVWxmXusPpGfw56eTQR1lOv8v9+JM64u5diNTIKdyilA
	 e1LWHBPK5zZFA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96CD717E1412;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B1812480065; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:02 +0200
Subject: [PATCH v14 19/38] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-19-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DRXGZ9p7V1/mxjzbN8TrhXQcxeu/SF2V+MgG6q/rcw4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQT5DejwXvNJchdzLQ3Mt6HljWSUwqQU
 CutrxoaF1atb4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaptkQAKL4RVLm+JOiRRYPfvlsojLvVjCjKZ92tkzFvrMhc/Dv2rodKUiN2eDA3ynL4V2ywY2
 fI2vE4NM41TiFBKCHoRfWyZDSpyBJuMaj6QkqHJG0QK2YEkuUtR5vLy6JHtxVg2JKWq3WAFoke2
 WDtodDjxj0HDvBlBdrFdbVu7FXMYFVypoDiPO4AdHMRjhVyy6sk3obpNE3M9TPlF5MXSlDgn7+u
 DUeGG0SDaojXCjgU3RW+rUr+TyN4IhK1kU3nsEufu7fRprDq7x79VCTVy/SpizczHOQBSh6m4kh
 yO+1yvHj2OyUzfUmDT4UxrH6SdayYQNmyr1pYmTWoEPDl9Kme53HFWXYOldaJHtK3/vqa51vbU6
 iAEkaQJXomOQqRyuXn3mu8eKSOC4g3tJHYbOfk6KHwHjOpIi4V9Kg63k5ONlO+b3B8sOdVKyiem
 aE645AlUDgAoUGJi0+pny7BNSrqgVi4er/3hUJSj3WDG+7WEoGcO8RYkhhuBFQGP1Vgb0p8iUCU
 48nVNYu93yN2/tnw4i/aonfeJwjXqeEPbumPKNvOYBgeoqKXA/7m5ZVdtVgmbWaTZ3a0Gn6j0r8
 5+0VdvsQ0a706rBwSZTvbcNdOaiB63KInVXVFHpVmcC2rETooOJr628BdjElUQHX8uDssSQOr2D
 XWcMfXsvcQyc7CqtMu9E0Zg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135203_370629_9DF48EA9 
X-CRM114-Status: GOOD (  10.36  )
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

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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


