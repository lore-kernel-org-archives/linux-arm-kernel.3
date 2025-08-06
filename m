Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6B9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/mHAbC8hGHbBSwhAq1pRep/z7r7zHvPcOOX2+I5dO8=; b=XXSqE+4A9C0xo2pKAVS+v1Hju1
	DuqrSw0yv+buO/sCBOziHDYlBVMGApQ2Ctf6g+AbXub4UCvylC7mCC30/Ow6NMr2gFlL2hD8i11Ua
	QwMBbeITFVICYjO6ShtX6Zg5BDfRpIx4GIbW7RxSBWu1JrZUd6UOzVfZx+SWRXc3ktsWr8J8yKATo
	ocKoY45hQxJeAuMbVjP73MLfkYw3OPcQxV4MMGAExI8lTr3mf29V2XXFNsMIrSM+82EjIrzDo5WFf
	R0LL/rdqFMzvooDB0/qXvzWVzTvt1BhS2pxR85P1iceaDQH9OHs4did+gObu+QEnxWZ1aW0r9kMsg
	5nO39Xog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeTB-0000000FKgL-00db;
	Wed, 06 Aug 2025 13:46:17 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeLi-0000000FJeW-2IjX;
	Wed, 06 Aug 2025 13:38:36 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6156463fae9so1696796a12.0;
        Wed, 06 Aug 2025 06:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754487513; x=1755092313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/mHAbC8hGHbBSwhAq1pRep/z7r7zHvPcOOX2+I5dO8=;
        b=YdDH88+ABIJoX7aZ1H+ASXdCBQsrRvPyjwezfZmwwCwJe4aaWCnlC3odZU0FgB2AqV
         YJFXlb7VaYUucJz1QNTWr3KDy97VRP0V7zIQEM3Ad9zWS8GILgPjYJB7fAtgfIXdcUtH
         FUjNJFbmYVoXCLO701vDYR1aemt0PsSHPZ2ntkNYVQfJ0TIoubNm0oH3G66H5CeSCWcP
         4ExcDNE+IayVUBLZo7tHw9IrINbOl1ZiCIi876+KSAO98K3Fz52+bGmG8X/wy7SjahDG
         YG+DFAbInYWaUml/O5HBUY+Pdu4RIBRjalhla/R+RQhcBFGIjr/FP8EtQMzCFzGXXQbf
         /ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754487513; x=1755092313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/mHAbC8hGHbBSwhAq1pRep/z7r7zHvPcOOX2+I5dO8=;
        b=NP9xpbesXfhQXyB8yqg5aldeOhCFnFapO+3AC368I2uI7xfJUDA4NvPt5Mq9shW60e
         RHJIHEOP5sHqg2LpiGfW5hr7xyqTyf0QzqhKcynn/KdBcvXBpEckws8BS+Sx47IQVXfZ
         /pzDNVZUGspdiOkjx00YRxpaXIaLAp4PSQxWQ/bguv4USai965cXSz7brhFVHs/Ao5cD
         09ceLSOgjAgU1Tuu5iFiv3o2H9RO9AouAs6/AXkBCN+U8b/G1dbbL9yvwNZtXmdxWYtu
         vZl/2SL/tOO7HsyYUMYdBNArPg4vcQkvSpuTrds+GU7v2U5/2+UefnSy5MtLRNuXF06C
         csAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhPlLDnQ7ewScYiekdhJfVVN/5g7nq2FAjFE+jh8CGGeAHGTo4CcLCrj1LU33wmL05ex72Hu7Z8r6rgNm0xIk=@lists.infradead.org, AJvYcCWexsYau7tFwqZ4QpcU2asMybsNCpnciimhANQJzdAQka9gJUXh3xc+1mkmXqtSKgLtWAK6130OpEoQGaARVUQJ@lists.infradead.org, AJvYcCXgyqfphmV/sWSjg5trQ/RDzJl5VI/UFp1oQ1hijUT4JyFgvQEVKOlXAuYnDphERs5SGl1inZ0Pn5At@lists.infradead.org
X-Gm-Message-State: AOJu0YyJhbQVpFoj89FwteF/ugorJlqTdhRAc7W2H1QDaex1sbnNB8Pm
	QWtug9cd9DaWSndQB95PXtnd/Grcy7RCrIca3ls2oxvDH0p0qJQZiZrZqfiPEQ37
X-Gm-Gg: ASbGncvqIUdP9BjvZ5lGDRAc0oNKW/ce1v9pDwacYUHeM90ChY+K8C6ASS6vAef9AMf
	BErsFp0Nn0/eTTUyFF6jpP8XMSYhlaBEHlazyFFLwc2FdekDCq78bbwwGb9NGU3lZtNOI8CKcKi
	tJP6wtWc4PLVcgwrgDcL2wl3IwHhorfGgYakCQf5GTvU0yftiuRpZuqdgDBUFk091gI9I4HCdjs
	M2TH3M+h0eqx/ihBsw7egutSSAfc/kCotX5cr7corF8kZilxyvXrZUAyEdDkan6U32z/Z/5AeEl
	bSg6RV0sUbgSUUSeUlnO+cM7Uve9mbDwvRuSCtjQBjyLCAwXhXU3DGHO0RW/G3DO6R8hD4hUKmg
	Voih7QY2bRBZvKq97dWUvfyaHPa3pKBLTuSK6sVul6dM4rkRC
X-Google-Smtp-Source: AGHT+IGEIzwVD1kQWngECBW/TE86WqdjSZGBNfA0QX7gMqVVKSneWxDBN1wo61EMHfeOMI2G9SeP6A==
X-Received: by 2002:a17:906:7316:b0:af9:8739:10ca with SMTP id a640c23a62f3a-af99099f240mr290124866b.28.1754487512787;
        Wed, 06 Aug 2025 06:38:32 -0700 (PDT)
Received: from A13PC04R.einet.ad.eivd.ch ([185.144.39.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c10asm1113170666b.116.2025.08.06.06.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 06:38:32 -0700 (PDT)
From: Rick Wertenbroek <rick.wertenbroek@gmail.com>
To: 
Cc: rick.wertenbroek@heig-vd.ch,
	dlemoal@kernel.org,
	alberto.dassatti@heig-vd.ch,
	Rick Wertenbroek <rick.wertenbroek@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] phy: rockchip-snps-pcie3: add support for rockchip,phy-ref-use-pad
Date: Wed,  6 Aug 2025 15:38:22 +0200
Message-Id: <20250806133824.525871-3-rick.wertenbroek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806133824.525871-1-rick.wertenbroek@gmail.com>
References: <20250806133824.525871-1-rick.wertenbroek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_063834_582237_36C57949 
X-CRM114-Status: GOOD (  21.10  )
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

>From the RK3588 Technical Reference Manual, Part1,
section 6.19 PCIe3PHY_GRF Register Description: "ref_use_pad"

"Select reference clock connected to ref_pad_clk_p/ref_pad_clk_m.
Selects the external ref_pad_clk_p and ref_pad_clk_m inputs as the
reference clock source when asserted. When de-asserted, ref_alt_clk_p
and ref_alt_clk_m are the sources of the reference clock."

The hardware reset value for this field is 0x1 (enabled).
Note that this register field is only available on RK3588, not on RK3568.

Add support for the device tree property rockchip,phy-ref-use-pad,
such that the PCIe PHY can be used on boards where there is no PCIe
reference clock generated or connected to the external pad, by setting
this property to 0 so that the internal clock is used.

DT bindings for internal clocks are CLK_PHY0_REF_ALT_P/M and
CLK_PHY1_REF_ALT_P/M and clock rate should be set to 100MHz in
the RK3588 cru clock controller (PLL_PPLL).

Example DT overlay where PHY0 uses internal clock (the first clock of
the cru (PLL_PPLL) must be set to 100MHz, other values are copied from
rk3588-base.dtsi) and PHY1 uses the external pad (the default):

---
&cru {
        assigned-clock-rates =
                <100000000>, <786432000>,
                <850000000>, <1188000000>,
                <702000000>,
                <400000000>, <500000000>,
                <800000000>, <100000000>,
                <400000000>, <100000000>,
                <200000000>, <500000000>,
                <375000000>, <150000000>,
                <200000000>;
};

&pcie30phy {
        rockchip,rx-common-refclk-mode = <0 0 1 1>;
        rockchip,phy-ref-use-pad = <0 1>;
        clocks = <&cru PCLK_PCIE_COMBO_PIPE_PHY>, <&cru CLK_PHY0_REF_ALT_P>,
                         <&cru CLK_PHY0_REF_ALT_M>, <&cru CLK_PHY1_REF_ALT_P>,
                         <&cru CLK_PHY1_REF_ALT_M>;
        clock-names = "pclk", "phy0_ref_alt_p",
                              "phy0_ref_alt_m", "phy1_ref_alt_p",
                              "phy1_ref_alt_m";
};
---

Signed-off-by: Rick Wertenbroek <rick.wertenbroek@gmail.com>
---
 .../phy/rockchip/phy-rockchip-snps-pcie3.c    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
index 4e8ffd173096..0859c7960167 100644
--- a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
+++ b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
@@ -33,6 +33,8 @@
 /* Register for RK3588 */
 #define PHP_GRF_PCIESEL_CON			0x100
 #define RK3588_PCIE3PHY_GRF_CMN_CON0		0x0
+#define RK3588_PCIE3PHY_GRF_PHY0_CONTROL6	0x118
+#define RK3588_PCIE3PHY_GRF_PHY1_CONTROL6	0x218
 #define RK3588_PCIE3PHY_GRF_PHY0_STATUS1	0x904
 #define RK3588_PCIE3PHY_GRF_PHY1_STATUS1	0xa04
 #define RK3588_PCIE3PHY_GRF_PHY0_LN0_CON1	0x1004
@@ -44,6 +46,8 @@
 #define RK3588_BIFURCATION_LANE_0_1		BIT(0)
 #define RK3588_BIFURCATION_LANE_2_3		BIT(1)
 #define RK3588_LANE_AGGREGATION		BIT(2)
+#define RK3588_PHY_REF_USE_PAD_EN		((BIT(2) << 16 | BIT(2)))
+#define RK3588_PHY_REF_USE_PAD_DIS		((BIT(2) << 16))
 #define RK3588_RX_CMN_REFCLK_MODE_EN		((BIT(7) << 16) |  BIT(7))
 #define RK3588_RX_CMN_REFCLK_MODE_DIS		(BIT(7) << 16)
 #define RK3588_PCIE1LN_SEL_EN			(GENMASK(1, 0) << 16)
@@ -67,6 +71,7 @@ struct rockchip_p3phy_priv {
 	int num_lanes;
 	u32 lanes[4];
 	u32 rx_cmn_refclk_mode[4];
+	u32 phy_ref_use_pad[2];
 };
 
 struct rockchip_p3phy_ops {
@@ -157,6 +162,14 @@ static int rockchip_p3phy_rk3588_init(struct rockchip_p3phy_priv *priv)
 		     priv->rx_cmn_refclk_mode[3] ? RK3588_RX_CMN_REFCLK_MODE_EN :
 		     RK3588_RX_CMN_REFCLK_MODE_DIS);
 
+	/* Select PHY reference clock, external pad or internal clock */
+	regmap_write(priv->phy_grf, RK3588_PCIE3PHY_GRF_PHY0_CONTROL6,
+		     priv->phy_ref_use_pad[0] ? RK3588_PHY_REF_USE_PAD_EN :
+		     RK3588_PHY_REF_USE_PAD_DIS);
+	regmap_write(priv->phy_grf, RK3588_PCIE3PHY_GRF_PHY1_CONTROL6,
+		     priv->phy_ref_use_pad[1] ? RK3588_PHY_REF_USE_PAD_EN :
+		     RK3588_PHY_REF_USE_PAD_DIS);
+
 	/* Deassert PCIe PMA output clamp mode */
 	regmap_write(priv->phy_grf, RK3588_PCIE3PHY_GRF_CMN_CON0, BIT(8) | BIT(24));
 
@@ -312,6 +325,25 @@ static int rockchip_p3phy_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = of_property_read_variable_u32_array(dev->of_node,
+						  "rockchip,phy-ref-use-pad",
+						  priv->phy_ref_use_pad, 1,
+						  ARRAY_SIZE(priv->phy_ref_use_pad));
+
+	/*
+	 * if no rockhip,phy-use-internal-clk, assume PHY uses pad for the
+	 * reference clock in order to be DT backwards compatible. (Since HW
+	 * reset val is enabled.)
+	 */
+	if (ret == -EINVAL) {
+		for (int i = 0; i < ARRAY_SIZE(priv->phy_ref_use_pad); i++)
+			priv->phy_ref_use_pad[i] = 1;
+	} else if (ret < 0) {
+		dev_err(dev, "failed to read rockchip,phy-ref-use-pad property %d\n",
+			ret);
+		return ret;
+	}
+
 	priv->phy = devm_phy_create(dev, NULL, &rockchip_p3phy_ops);
 	if (IS_ERR(priv->phy)) {
 		dev_err(dev, "failed to create combphy\n");
-- 
2.25.1


