Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55F4C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hg1pERrwbPy/SWQMoQGhZulhGqcvEhabZt1U9P1gmQ=; b=Ca2l8s2ewJsI1cbegp6fKPaVfy
	EusjpXTCdLK6unYXnbTHburI6NszUIqVXfQ2cQQMKHA2qviJBcl48pa6IjminLVtvY8llb4VUyCvY
	bESwywWsDHd3NJz7fm70iPoT/f7ED0WczImL3kPYPYrqk7U8kw3RvRza7usyUm6HApEzVosqvhNkN
	X+7o47Z4PflmLYY41afattI0hDjCATOxK1mtQf2cQcDk/SBk+cx3waFWeU0QkDXD/K08tSfAx8udV
	IGx69ay9T2RUyWQyiYk4UJLzLRk2j8ctrL6CZviPfnwKpWYYY/zfGFcEBd4A4IQLiK3n2B8PvIrxv
	b6z+lvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucQH-00000001Z0Y-1Dat;
	Thu, 13 Aug 2026 20:53:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPE-00000001XJu-3oJl;
	Thu, 13 Aug 2026 20:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=yXBkbxrGjRaKQZqQruGoQNBHJBhYvmNSucn7ll0TqgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UUgjDkhTitMtd2MzaiwWG1JzvLFnJyvyUHFOOppjPCJyC+QOEisYofEV6jHghga8H
	 Owy9syV9vcIhwCYB0ILb9iRz2AYjoeKMQ64K781W2GCxFitR56tlk6scefxQY3sd6Y
	 6/aO5htbyifBj132F889PcYZ3ZNWSNi+YPf2d9+IXSMrSJK9uOQVTi2yVRb9nPteH4
	 vhqV90mC7vn0Rr5nRhNTVwdJFxUPh28/g3WEGC4hW5JOpa9RDOxUXUgT6kgxR6XzRc
	 Ol4vmG6p1TVEPNknac2amz6yynrl2zAFAWmFxPjrWdChYS1dl9YNFf4aWY7K2lv70P
	 KebcIHANSKbtA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF4CA17E1526;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BCB4048006D; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:09 +0200
Subject: [PATCH v14 26/38] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-26-b5ad9c68fa11@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2434;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yXBkbxrGjRaKQZqQruGoQNBHJBhYvmNSucn7ll0TqgI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmVigp9FKjjH0C7SzsZJYYu52lMDw6LEC
 28h3rI8a3f21okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qaizkP/0ncNQ1h8fNgRgaujWQtBmoH3y5y/0Vb3JzqZ9Qi3Agg5FU+mWXhpJjg3cqwxw/uY6f
 ynfCPVCb9NIrkdCeozM2N+KVAGAK+lSKC324cZvsI5+zIHc2HFtQSoJwJdLA2u37sqLFWmVP2zg
 XIA1b76Us4mf9prDRz5k0B7T2WZWBO2GbIToGMU9tO/TEVrYT10LL8qmbGsmvoaWMDkVdQ0g/cy
 xFcTkWrAhQ6y8RHNE9g9Xn2CXYoR6GjwX1c53XF2bHyZxYFPl4Z1xZ351+0+sqyAoMiEDpzAi+l
 J9bIafMJOzb6spqBZ0qB14pHjM7VHcTLvZC5q3kEkF7gvOzkZzxnbDkHJ1C3nqm6XN1tOpD/cdO
 eFlZuNuWHi9EIJu+5ajPuKQpp5SCqR7TOfIwCKNXizWSm49i/D3rkVhm0Qec6VIYkNxz+zGpH1L
 H3CYogzTJ7xyfspKVUh3RvF6lhtIN1AjdfIPh/KX/W3RuQ2wRHCTgm6eQbF7w/Gh97yFx14Pyav
 /Rvz26h4CHoJ2sSDu992gIJNYDMmi/DapYJ66X1lZcLTPN7PAaV6YJyqZYDCsSjZJaubG3SmEiA
 7fC+hOMF7n30j2H0jPllKiZzmVmN/VuXTIjTl7iZMsv833mxe5MLYP3IwxpKYCGltxJZehW8wZe
 BnThf6TS5cun/IEFEeKc0PQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135205_151607_198A9D78 
X-CRM114-Status: GOOD (  11.56  )
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c7f09040185b..701c92ed6e2d 100644
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


