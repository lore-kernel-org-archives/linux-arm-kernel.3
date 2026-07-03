Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061B6C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 23:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA5kA4CdoMl2SJbD9iXVp+7SOpMjukYyA2mwZK9I+7M=; b=bC06hoSRJpQzz3mpEzDD/0hkja
	3dWKnWef4PnqKR99t1SHVecU0XEgKZUzaUMvx0K4Cq34xM1h2SqjlGly7Y7BqIvKu+rIBqIVUSdcl
	7knl9scuePBIiYsbLJPfsImqKUvrWfbb3no+ZI60kzWXct/n6VSJmgcIUH2e8OfMA63eDeyDlojHW
	UogzT9Ppqo3+MSbjBI8u+YzKUM1bfTreAf33PrasouJr1O1XS4ZqVIDTLhTxUSFtj+Zp0MX043Xoo
	DYxHcUMrVvFLx+LHJYGe/+892CNaDaq8C5JiNqHAgzqVMXUgeNQ1AWP3+E6mm1gOw79Bo7Fl6c4Yf
	x8NFzwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfnSJ-000000080m7-2tjN;
	Fri, 03 Jul 2026 23:37:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfnSC-000000080YS-26pT;
	Fri, 03 Jul 2026 23:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783121858;
	bh=7Gn2bgHmTSxV6xutTkSH7htCrYJzZ15Cj8a02NsjqyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UMNywBLEH2b/T2h0/kNjRDlGzvVk0hMR+e17u6kIumvFKJYJTTU6DMJ2hF+iF8ahA
	 KeLyNfoZZYfHnb2dndXK7qzS2zpfzK/2UzqDOYcWA0dWGiHeoyNK3jBIPUyHAak1UE
	 RyTejXZFhJYVrrqw0n51xKb44+Sc6wMk5LTcfCsFOVSOw4tYxTTyrgpnfRqS3TrXyb
	 sswKBdEm+2JcqwkLFvVkW1iK+AdxMFrZgj7OubAG6978iYSi2DouHg0d+rKYLHEPig
	 6C/GuUh9AvzdEgiHmxPYRpyhpZyZw43W/fOa1mZXAtSWL5ObkpebZnSYf+FJqMu5/i
	 BgVAVFQ9NPQ4g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6FAC17E1123;
	Sat,  4 Jul 2026 01:37:38 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A241348006E; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:43 +0200
Subject: [PATCH v10 27/36] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-27-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=7Gn2bgHmTSxV6xutTkSH7htCrYJzZ15Cj8a02NsjqyY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8yYfEsLuHJoSQU04i2o6pBjl9RXODfwi
 7pW3gw48krf5YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qa/hgP/0bV3ZUD6BVzqzXTJVmv6N0jZN7mmDrM6ckWnMh707AUbx/enck5gBZUxW1XW/sMemJ
 D3Jov6Y8iOluG1Xni5gUlDIGNYTM2w73SbtxVON4Yn74tFFHzWmIcwXziOVemSHh1rs2forJhrL
 4sMPfQWYhQrO99ik36cqUic0DSRtQ3eRCHpssSS3iSr/tzPCgIDSWrZ1FDriFvJ7TOG3sBecgiA
 8xhoY4FHfxb2gaYOwkiTacB03pFdtbiz2zoBuaDsq7KlhoT7NoHytCuS7+rMPRpfEpyDT4iwfAo
 RqeT+jAjWgvvzfw/mc8JCggSRZ7c4UXL7tlOXjYRu9rfVjZvBgMeSFJmzRo7NeeqOew5cq6aUOv
 27Zbv9HgGdpp/1isOIqunKNawKL+VDeXhTS5MjH3+yq78DDL86mWeRkueOqJiDQujJmLtnI0+Ul
 5uWxBpSWg2Puca5nuzJNi/uaxpj27hQ32sRfMl3SihBJ43hWF6vyr39w+VHWrmUkMmGLP9nPqFE
 aKYOumeG75KUuNOgtRzLQqyXL2HgmSMHANZtewP/qahyxXcY5sU50Jtju6KouI3pagb6vmfUerq
 8apYVPjusI+X6XfMc5nCCVzbULC85YIZCYfdjJvgQxL1l+n6EJit7NN0A7Fa294+fTkmMWc05wf
 bLsQ1MubSG/FTa3zBaJAxFA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_163752_703157_E6581CA6 
X-CRM114-Status: GOOD (  11.62  )
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


