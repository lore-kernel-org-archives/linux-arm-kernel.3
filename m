Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2912CC44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA5kA4CdoMl2SJbD9iXVp+7SOpMjukYyA2mwZK9I+7M=; b=1UlKiycekk6AFTFH0pwAyvM06A
	gbckS/+jWcLlhSnhMNe+gmPVrahLzpCCsML4gJ36sepstFMLeixO0d/jGo4aoKgjnQz1vLHb7lV0L
	tWV6Ifd565tPxwA6T9shEqN96C87MLxHuRqkBWej54AT/k21qP2OBMDwM8Nb3jZjdYIdiKsvrTYkj
	neGBv8c+SLIAxXzczgNdXd+3tczwuuzC7xOyTbK3AY3ddCOwi1rneZ/gax5Tt1mHW3oICu+PE4Mrh
	37KLiFHaJWzFqW74ku4Eodpy5322Q5mxyUqefJi+QcYk/cIAO2RxLNUWCYw3WspnpCMLVfFVnNfvj
	/4EDk5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu3C-00000003Ol1-3Qwl;
	Thu, 09 Jul 2026 19:04:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu35-00000003OXK-427H;
	Thu, 09 Jul 2026 19:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=7Gn2bgHmTSxV6xutTkSH7htCrYJzZ15Cj8a02NsjqyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EDWuukOOrOGBfJ8OGqRQQXZkYUtCSvolYPxDaTWrM3nfTjPH7rpDzxF5xyxsT5Qwz
	 W61Iofr6sKbGiCK6+eTOJOMtdA4tMVa0zXbNru2rfOu1T/opuMTgQIxJe3VsRIchn4
	 vCWqRIj7xHwQM/TnKZxO/HenHvpAOLnErV/pgk6jKJjpXYaaBDCEzWk2yxhJO38shg
	 /ofoaqn2L1M7mtJglSNSelZAkxlMZguIoodJ3El49pBqhn7yQO7W6eYw3wp/8rRAuO
	 oOsTonsfIKyXpMJE2szVy+X28G+X/NoRfFcxw+Xg/kDZX6ECL13rwUHQxC1AUaGl9p
	 pJkilXszVvYdQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B173017E0EFE;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CB1F748006E; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:50 +0200
Subject: [PATCH v11 27/36] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-27-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=7Gn2bgHmTSxV6xutTkSH7htCrYJzZ15Cj8a02NsjqyY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EUAH4gGxpalHZhZLnUOiVLc6NvF0Y2Wr
 M0Mzq8ATsRnZIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaPsUQAJtkZbnPQCn8wCIVPttwZZidJxl+BTnLHtLLTZrLx21B4UmbQmpm61gn9pa57u5leTO
 pm7doKVeLeyyr3blKSHdpe1Jc5kmohIEIwGD3AJujcAHcCd21uQd+LV2MKl2W3F9E1t1a6pIl6j
 hZB3HYKxvkGY46cvZMTglvwUJtlDxklyNLfV6xSBXaId5xXLPiLT888VFcz97rGHamnbXv1iqWB
 B6E2o77n6PJlwArVI/gsJjlEbQvD4ATOcW8KdNYnvw6PT0ph5GbDyLnnzJxlOMPi2wqC6SKHRq3
 L13GigF4G2ZI1NfooGB5wUZKVPJhPlHZkMM331omQdR7OdJajyQAxX0IZj40fVFvnV/SoRwUQi1
 kkt7tVrvo/hGcU2L/MSnqlQBNr2wUullwCpnYbVKmVMICB8OggI5eOe0zCwqb25SV5wlsXbhiEq
 B7cfLofc8ZN2fsWKUikDkrNEMFvfHlHbazTknhRuezFXpUY06FzMs2iNLDXd8UkTGCDDwq17vTa
 WXZMfoOa+wYaXPyUNSVu0KMDdhW1AW3dgf/KAUvD0gjZCAb/UqdJHwpyysSgxe9krODdu2aSfRS
 IlS5Ud1rzdpZ4EOvQIbDt6VWkxcWxjUjYgoYWjqJYz7aPaPhOGqIm1HfTJ4jwIoSKjTh8G0MxcN
 LkqjqUYxkGMtxxr9sJT8f+Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120440_223867_4DAB8202 
X-CRM114-Status: GOOD (  11.77  )
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

Handle rk_udphy_reset_deassert returning errors to avoid theoretical
(Rockchip reset controller driver does not return errors) SError.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626211151.2332F1F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9e77513643a3..c645fea67c4d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -803,8 +803,12 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	/* Step 1: power on pma and deassert apb rstn */
 	rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.low_pwrn, true);
 
-	rk_udphy_reset_deassert(udphy, "pma_apb");
-	rk_udphy_reset_deassert(udphy, "pcs_apb");
+	ret = rk_udphy_reset_deassert(udphy, "pma_apb");
+	if (ret)
+		goto assert_resets;
+	ret = rk_udphy_reset_deassert(udphy, "pcs_apb");
+	if (ret)
+		goto assert_resets;
 
 	/* Step 2: set init sequence and phy refclk */
 	ret = regmap_multi_reg_write(udphy->pma_regmap, rk_udphy_init_sequence,
@@ -830,8 +834,11 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->mode & UDPHY_MODE_USB)
-		rk_udphy_reset_deassert(udphy, "init");
+	if (udphy->mode & UDPHY_MODE_USB) {
+		ret = rk_udphy_reset_deassert(udphy, "init");
+		if (ret)
+			goto assert_resets;
+	}
 
 	if (udphy->mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
@@ -843,8 +850,14 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 
 	/*  Step 5: deassert cmn/lane rstn */
 	if (udphy->mode & UDPHY_MODE_USB) {
-		rk_udphy_reset_deassert(udphy, "cmn");
-		rk_udphy_reset_deassert(udphy, "lane");
+		ret = rk_udphy_reset_deassert(udphy, "cmn");
+		if (ret)
+			goto assert_resets;
+
+		ret = rk_udphy_reset_deassert(udphy, "lane");
+		if (ret)
+			goto assert_resets;
+
 	}
 
 	/*  Step 6: wait for lock done of pll */

-- 
2.53.0


