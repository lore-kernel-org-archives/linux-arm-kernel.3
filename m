Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F7BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F/mHAbC8hGHbBSwhAq1pRep/z7r7zHvPcOOX2+I5dO8=; b=bZFjUfDYp6hMMCxZNyEhk9NThu
	DfM5bjFSJsgd9XDR6LwC0HuInsGzYSdLOgaUFi10NHihoXaxUK1Gj2ojqo3L7k25a02JICnq4UR+w
	hGd7Y5BxuIPjVBiRv6aOb9TDAZdBKWLbhBUMWpa+8NB33LkARoL7QYKeOAb2TQADivQpjKSTM9Pu1
	zhr9DfG9LZmomUOhDUV8mkV45LGd6mr2sAOJ3UZsXpO4w0V9+sSR5dQyz2yZsClVtqmViZcY90gkY
	guvj75VOnnWzfOGVMfgRVr2w15qDM4GgzeV0abYBzRtwLD1h8CImHq/Z2Torxojmhk8eM3x0LqFbN
	xWWm/LVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdP9-00000004srI-2Gfy;
	Tue, 15 Jul 2025 11:00:59 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdMi-00000004sYa-1XWP;
	Tue, 15 Jul 2025 10:58:29 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-adfb562266cso919295766b.0;
        Tue, 15 Jul 2025 03:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752577107; x=1753181907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/mHAbC8hGHbBSwhAq1pRep/z7r7zHvPcOOX2+I5dO8=;
        b=Xct+Yut/zS/lY5KhI8oFRJ1XZjDIigLBHwxmcoSKXVcoRwSTfVi7L41ZK89z9O9/pC
         FD+y0TowVjuQLarE++j7UkP7WPUQATVvUYew2Lun98GjhD5NaJCMDdGIuhMPiQdxajJ+
         ozQYlD6Bx3CaVqxTwN5VNz/PZpjzdnc/bWkJfLBaSVbVhijB+QbiANgxxfhmCWoIbjFF
         AssMSdiPpRtu/z/25xzIl3qbSlHUWP1q/xV2gxpIqjFLactdv6LL43Y1OsNa6rJV2tKb
         4BjaZ4jB9dhOSZzTqsYEgVgWljrlqGiUFumJp0wSaoHPif5jZBmSMIRT02GrOY9wCzQ2
         zm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577107; x=1753181907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/mHAbC8hGHbBSwhAq1pRep/z7r7zHvPcOOX2+I5dO8=;
        b=OTx6CVl49V+hCTJnuPyubyPHYeCW9yOq51oz8+YbyHnqtxgL5GopWbsRiPLonGj+BK
         bTOER519ALPh5hOQWNi7HWMgEE83seFggb/PF7L0YEGj81l6AT4GAaWHwwu/Lk/0/1Gy
         IyBUoktbIDEB3TIq8S+RBKEmRvBv9WlF756hZjqAAk9QwpsV9cpUruvUMGy4hmg4GOaL
         Uo5KyVlKAMgKIGPP0Qrqa17s+DkUJsFVEryhzNt7HZjX6IdFhZmpA1fmGzWCpyZdJb0o
         QTRGHy+TqLPavA+VfAHomy3XlsCIPwmgfuA9VDDbyAVSwacRMrJpNR3CdEUVOJ0d+G6s
         z6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVMs5+cgMF/Mpv22moauSkzFuxx9yxxPDguk0HztrFuCn2mdlsd1FhUTaNAQ38a7/MooyUAe3TzrUWw@lists.infradead.org, AJvYcCVQjUiEkGaTps4pgsUwGqbFKj1hBSLs6Ve0toX8zIBT6o+F0iBHQO8rJqD7VUBtsEHQYpCtMggM2Gl2xN6zOMtX@lists.infradead.org, AJvYcCWjApwKJWGnNYcAufwIohFEyD8uZDf0M0cIsYlDIsH4PHjwpDA1PUovsKM0vWvTOhYCjEVuLdjjpbaW9q2b24k=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUfUJYQzWZHQ68nWGW0jcuP/lXjHtT1i/4OHaL8ixiwF9RYT6i
	EVFAY5nD1JwpMRS9WgGhHKj9agNpvnVDxR2HvkkErNV7kPi4zjF4Vxx+
X-Gm-Gg: ASbGncuJaRqmzFuRbKFCssR+MMHm/HNd89nPntLwrGgxOcsUcP/mMEXZyTSxNom4syf
	CxjLbX5ZuGtHahIc9hgD4oBAic8DMjBAz2nJK++Q3l3+vJHSzfsfX1kmeme0VpSIY9Vqrjptruk
	ZVD8LxzUCIu/y1tiCM2+WDVOT/to9apAWax4qM4Mp232xeKYR5IZmlXgYuKUerpzr8Oi8RoMwbf
	UabiVne34wdf4cn7Wm0rvMoJa4823y+jrWepVxbTyvHxiY2WEeo0vjvhzTr8N+SSvP0E+pkT5qJ
	6zwikpCJHzUj/8XEvJnz38UsqoOAtxu2htB01eEgb16sv4Wj5f0WirDQn0TbcIPMNn4ro9nyjgr
	6ZDYGZER2sFxUnq0Iov5kil5LlELcZuwGwMlaJzR4sTvNXQMr
X-Google-Smtp-Source: AGHT+IFcV1NRroRK8E4ACX4/AYoU3UTXo1RHhhcZbGaL38WjPIbgiRuFhrQraM9n3g9N8ETFy0dwvQ==
X-Received: by 2002:a17:907:d88:b0:ade:6e3:7c4 with SMTP id a640c23a62f3a-ae9b9519e89mr215840066b.23.1752577106085;
        Tue, 15 Jul 2025 03:58:26 -0700 (PDT)
Received: from A13PC04R.einet.ad.eivd.ch ([185.144.39.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm980771966b.158.2025.07.15.03.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 03:58:25 -0700 (PDT)
From: Rick Wertenbroek <rick.wertenbroek@gmail.com>
To: 
Cc: rick.wertenbroek@heig-vd.ch,
	dlemoal@kernel.org,
	alberto.dassatti@heig-vd.ch,
	Rick Wertenbroek <rick.wertenbroek@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: rockchip-snps-pcie3: add support for rockchip,phy-ref-use-pad
Date: Tue, 15 Jul 2025 12:58:20 +0200
Message-Id: <20250715105820.4037272-1-rick.wertenbroek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_035828_400813_1B1F720B 
X-CRM114-Status: GOOD (  20.43  )
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


