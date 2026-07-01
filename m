Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDC7C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUzrbf2ZOlgMSXasgiA813uVorowz+/R7EYhJ3WPjBo=; b=hOg2Qmi43bpr1B3Q4cywUSzKvl
	j/08+S7jgLoxSEYVdQngNBRrkbwsszhR6Zm4AQVrHLvhPCOtQEs352S2i+pSF4zM2zT+lPUcZE4oF
	1VnURAu64bIco62wbjHvAGKEZesTC1aCVwLepGHAatfUMimik7jIrF4ssi6hCENIxHW4IWTRGCmuG
	O7q+M2Hu21rYvLDMSWwIl3fYebwl94iPlym31/2LR6mrA8AT5dpbW0M+eyeLsTsNaGFTtRcgAnUDE
	cXwhnj8TX0aQMLJeODF4pdId9o/bc24AlI3LBjF5+9J+xKMSeJiC8ZO5VbJBTvvr5xiQluOiF77Pb
	E2sHuxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TI-000000039tr-0vPi;
	Wed, 01 Jul 2026 23:36:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TA-000000039k2-35Wc;
	Wed, 01 Jul 2026 23:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nbzfpwUwSWDyqH9ZRNZ9BF2aeAIFQ+h8OT1Kgm9U2zM+SmyvcOULcmGcOiLk/qQAO
	 TlKtwAluDmd38f/hCkXVlmhuff3L9V9BEUkdqFNnylpcqFC8Do0TbVlyGVgHVkTP3R
	 hfKFHLBxWO3LlTf/M28ZV+1btLf1IBXmAGu/03TTYxMxq/2DvCE/EhLa08N0tjOZhC
	 QXAhQX/Q3wquwqzOdAeP0RTehnG+cDQ9690PuQ+xexu4FB7SPRLuiWs22USFeT3LY+
	 ENu1Dawrd4H+ASE66rQDvnBwBoMshKRUpKQrlDrho8nwFGaBvck8LUGHFOaV/HwOmS
	 JtSrdW/+4G1Kg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 013BA17E0F44;
	Thu,  2 Jul 2026 01:35:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AEFC4480029; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:40 +0200
Subject: [PATCH v9 02/38] phy: rockchip: usbdp: Update mode_change after
 error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-2-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFMq3VxFSuS4Ma1Lt152t5BdszIUcdWc+
 ZVpFAlNXfsLxIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qaDikP/3Hp0K7+8dnll+T8WVi8FuI7a6kMEpsc+LUXnFnafyiWNdrq1E0jdkJ7rZeAJb2LI1/
 3m4BFSQiHoCJeiZbtnK1Jensg4iOO/SgEikMnGWK5jq7wKX2BkNpZ9F/VLjCDGHfBM6sTyjq3dg
 d1DCtQDa5kdDe+W9uCLz1pYwnVs1Z63BSJds+c1dPkFUtS8xphSnQmf1OFiOloIv520dq+Bp0BW
 o0l6eV4qm14UIA81QGtjvF5CK9cI7qKDPP5LxYu2JhLg8E4kaIaY5KEYsmGfkdFH1e0UmEGnigs
 xrGC5T4QDcUQ7VVeeesXoOOtrNy3TpFUJ6LoBkG1ZCTZxGGmhPBUbl8SC8N/amORr0g7PuPBAya
 KKWdnaUdmQSdNbzPhcCo6yhJHIyWxWQhd1gURJdXHXZuXly6PRlr61hrU8Fq3cSobv3juKGFxRo
 WCTPtqBQ7AUd7E3ovD4xmAx44QSY4rpwIBrlOePUOQ84nizlyv48UpYO0CRuTGo55BAkB5DdUnN
 TJ+aMbl71BDoSvL9Owo2qNT9jpe1HpVYievYCvy7i7bWYh+AXflxPoLIN/vERCAs6Tkt56i7sWv
 Qg6Ru/k+hZK/CPQu466cSuDxvGWr091tGm3vv2MjCX3QINsEXNhcVtd1SA3LABsPyGKS20u2ZKq
 79Bzp69NQ8n3JlYMZ6zwoQA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163552_927802_782B2E81 
X-CRM114-Status: GOOD (  13.44  )
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

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Note, that no errors have been seen on real hardware and failures would
most likely be fatal and require at least a full reboot as the function
already asserts the PHY reset lines. So this is more of a theoretical
issue.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..a5ffdf7a6e76 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
+	} else if (udphy->mode_change) {
 		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
@@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


