Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6766C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYikmDMba8G2LzQ01Ao1OTZqbg3k3ecnWxhXvCaq+PU=; b=eDM3K/yKeR1pPpkYrmr2y+GL59
	5UVBv0QA3zsv7jVMSO4yroUm4Y5VlZ1F2vwpf+uMEaVZGgl63crzF06XnYAlFV7MPkDAji+CmPR+w
	EJ9ag7mPGGj8pKUjz2EzQw8SfNfYqGDeingfQtaQ9P2D1xsyS2UbQl1jql682udg9J2S7qFcs1Qm2
	Jzr9OrOUxfy7SW+BE53ankIwDiLE/6gBDP37+KWdBg+cFNZytrTwgJPpnBAHs1c3cEnMoDQhhSEhb
	/3yfiXtLU3STPf38LZThqC7/JBbwndZFJx5ulC1zpz7XvUVKIVwGzJoM3M/+JDkqYdFAhOT+gztW2
	2ruQK7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1R-00000003M2i-3bPn;
	Thu, 09 Jul 2026 19:02:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu19-00000003LKU-1CfS;
	Thu, 09 Jul 2026 19:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Lf+vynILoSgT+CKF1zdt+cdccJZLQ3ENXN2uxQk/PZ34eAII20YEl6Qw0ICYARdD3
	 /iKeYjzFE+KDtDG9wiFDrrQuokA/4/9DhBI/LmSKRyDh95XbAr9N0SdH9Y8E07vTyl
	 +GULW29m3MAy2u9jSnQTQ1qJO1kagQfQ/HZqE0z0p2OvAR6HKAJXPhYlUzRi/razzi
	 Gr9/wz/l618gRXcgiuRZPlrtVW7Gieycc9Qq/ciUZB66neAzWsXEZ8bJEK8Aclp9j7
	 DLP2f7wNRHMSjjgS0IY2i91KMDwF/GuGOp+1B6ePpcZkaH8YJsIzkndVV79HDILJ63
	 dxDzWfNMBHrGQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D9E117E0FC9;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B537E48004E; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:36 +0200
Subject: [PATCH v11 13/36] phy: rockchip: usbdp: Rename DP lane functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-13-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
 b=owJ4nAFsApP9kA0DAAoB2O7X88g7+poByyZiAGpP8ETPHyamm9I0jIuRjRPuyRvuv4UGsa0Y+
 EBAUIOQM9z4aYkCMgQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qa3TkP9RHWUeUN4I+lDzwnyYa9fOLuCUWviA2sP7hnvdFQ9LWf2yg2uufOPBVOZs6TSZxO8Fg
 d/ieJHbiEIlbBigbFz6S3jLAr7ClPvPHefnxJkCJy3v0kSHMEr30C2/yrpwAh2gEjsiq/OOdedG
 /MFQZpRkN9o2DFYoBTjpOuNKiWX7ZfHlSF9g0Vs/Sk3FVOqvtBG6rG2+rCoNl2QDHOH/qkf7wy6
 BCNTTwwR0vbU6QVOGL7WQVZ85g/TgOVfRXHGXniUzjxBZ0B2sVvNiV3o4E9Z8eFBde0azrDBmKN
 8ZgMhW9ApHAPiU6ApI26zN5Jap524R3Brx5/VQwbwJoNZhfPjf34HtsZYvbSXCiQk4s5+9mgQXt
 WpM1r5Hmh4tnUrTh3yL0Rd0MEFgWe2vXGk8PRN0MlU7eB89oYMje50Q1aualG2dcJxKj9r569iN
 iFaP6IVQUl6dVChMudE98e6/zTsB9TR6HUzFSDJiWrV00wMoa5iV5jVCA/k4meMT3llPpIkCUgp
 V8gntSc7x93uDxneTFrwaBSgiiihGqmEsHJIFSOa6ADKKx3I4VR9QFs0scABO8kLlSzl2Wgd8Vr
 bxGBJyagYImIn3ukWUolqTGg4r5L1YbPiIeO2GeeSpIICK1IUasl0e9wQf51GUk/LvIY2EMvyd8
 wbrqpfgu+a0P6yoAYUCsO
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120239_508269_01596B59 
X-CRM114-Status: GOOD (  11.49  )
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

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b172ce6a722e..7fb864a1486c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -545,7 +545,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -574,7 +574,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1049,9 +1049,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1069,7 +1069,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0


