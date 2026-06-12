Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D138CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4LrfwLqf6d7+dK8mrOixl8LhqMeAIVQDgtiWFxZqQg=; b=RJRXPxJSMQegar8hfREuBwmuB5
	3+wMB5WqJEzS27KdnIv3AhPestKrD80hZmx3l6mYhVPN+Xrvr8gfE7pJq398oet1m/RsS/lLyHpJx
	Sqt/5zdI0h+akjj8BfHRm58ejKbKtt6VMxqzP6A4ClWFJZtEkN5KrinzjfeHJToXFsuSZej0R8Fnh
	JjRkL9Uw2RtFageGVJOJgOwD/ZFyXyFDpFoD5I0lGDk4vaBYmSUjoZBPjYe68yow1l5aHwLK/AsXL
	CDTmSTSBrrbrMYSjBPKzE+tEmxfAsrTdfQwecpF3i8dLhZWofS9qg9h+QMGI4Pc8fZVx7tTnrB3Rn
	rbtkty1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4e5-0000000BEY0-2AeK;
	Fri, 12 Jun 2026 16:22:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dt-0000000BE51-2eHj;
	Fri, 12 Jun 2026 16:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=YM8vhaVqe6VkIRnSmmclQMgLxDRedtbKmvS/ah+S/TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I9F7WffznuEW931ghv/SXP7ewXiC2swVf64zpbG4uPCzf8C2iXSnJXwUCjamIOhih
	 1SQydnwo1vlrWqadYXUu/i3NZXq+dpiKraaydUouiPEj3Kj4s1uwxpBuaPhufjmBHA
	 P09zapiPYqMGD1UCOMvXOC+Dxw7XScxazI3Qhy5J0VUQ+rLPyoehqJH8UeRI6wRjPA
	 G6GKuwFDI4cWbCbM6A8XEtRdNyjo54c6a9O1nsYtaHDjyrVwo334jfAvXW5ScXB5V4
	 gH8LSyfy3hgQQg2+mIzQae1HClAsHVOqh8n4rWsw3VyZe6IqCvIlkbMgh3cO96cxN3
	 SNK87qHmFY4nA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9D1F17E14FB;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D957548004E; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:52 +0200
Subject: [PATCH v5 14/18] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-14-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=YM8vhaVqe6VkIRnSmmclQMgLxDRedtbKmvS/ah+S/TU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEo7Ra4KF/dow0Pb3iWgyuH7adBgpGWt
 bsOqntQGuV9FokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qasDkP/10XqYzkoOmM24a+Lo9njSyyFFlWEOPbGCZvIQ+kccv0e1DHmYmPUSpxKJL5W+1GBbO
 q7+eJF7V3dY9Nl9W1ERiHKE8gSvnrih04h2sBCec5CvF5Xm+Z//Kz5Tr4scb2t21XDnns8JqpOf
 Ebtr8uo3fbYart9CInQoSQetdvR+vanUoGmRIW2fOh1l6rpu8eFrvelMwuadz//5b0COQmeSaFv
 wpTcmkkP/YrxMN8gIC+PwATc/jgMmYJVgzlqnZPlY70YDrLN/19qojYdcUPq4REW8vchJ8uDQTJ
 d7oot8EMbf/zDQQ8bKPuy/+sxDpcz6mZTp2OLiLaz18K0Iz0Uz4lPdAfeao7qDEI4MH0B9gZlXk
 LaULx3HumSnuMs4HUuDtI48b5upQFJFL8tmZtvp6se/5DRQu+tvbtrgmyvOHvhUu+ByNRMf9swO
 upGqHcEggbobz0rUvrotl9sNFjIhcvBNd7cFsNeJ6VCFH7FsZvVOOEayiE+VwnaVhB7wyQUTuOb
 t3RTEhzyMyUWtBFQwqlAa/XNRxUP7T9XytUUWBXzXKvCqv0rC0XMxeTB2bRd7vB8Vd2izbmXY9e
 7vx4Jx+TWG4lR2oWqjYKeIgfPbDpdGqBSDuN2ezAkNLsuSCnfpNI8H3+E3mPu9nN3Pb2ngHeukt
 m+b9dXsiHiBFSHujtA+QxmA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092201_852372_46EE67A1 
X-CRM114-Status: GOOD (  10.26  )
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
index a3b4e2e0f578..89a08267611c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -622,6 +622,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -633,7 +634,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
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


