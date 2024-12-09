Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A60DE77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 20:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9ookae6CWwkYnTUQjafw60sQp6RGdJZafwRL5XMQxg=; b=CUTX8gvSut00U5nFnF3VxXwj+F
	xolvAdqRp3BcdKiZwP3uQMR9VG1RZCgXabxpAR/8fX3indrvfjawuQCWU/l79O1XWbi+R6Yw3v4xj
	sIt0xF1T8cq9kxk47rXtrjxyEKw6GMcLEbEbkXcPe2z5LkN0adoXKhHnYmGFhQdQvDjNQxj6BP0oL
	GYcp1rmvqrYv8eZ5N5VOni08jMCZlWfe7/aeo5CgdKJRXa4dcmqK7fvCfLYNumj0c/n0ZogYgZnTz
	PtwxgckFpa9t8ysm1DZ2z9zIBNX2AiEpeXK9sDbDqtTkY7p6pmFOaUxsktJfelfQ8UohzSO4zT/44
	9M0/8UAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKk0L-000000098AL-1MXU;
	Mon, 09 Dec 2024 20:05:17 +0000
Received: from a7-48.smtp-out.eu-west-1.amazonses.com ([54.240.7.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjxu-000000097d9-1j4Y;
	Mon, 09 Dec 2024 20:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1733774562;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QBzH9CuLKr7HcYXPsbeS4iEFc6a5mvd6bQSm9OBbi/E=;
	b=p5uV6pGpNd5WZHPVH5Yfcs2bTW41LkFV5Ennqr/PNFmV1avh/rCUmvxqIPKcI8mv
	DK25HWRPhgkxRpNV5SwkFxOc81yaU0JXAhc1mvd34Gx9babTEkj6cgtB/8gn9NlkZ72
	OY9jK+OQGYVGIqkL8um2dXfNIC7OZW+GcF9OFTp6GkJsOt7jo9fmyRuzoN6oxeGuD6Q
	+KilPOQxa4tf2ILjL+y7s7NNCC+Svtps/XGMEjVny1Zcp7MU7sGinCAySJ3qSlrRTSC
	iPGC0m4CrxQ1FwuV09qBUnqXRUYrUMwygAbOrJJek81VT98S/Y5PdRayNF1+mjqz/ZP
	zTq0d0c6nA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1733774562;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=QBzH9CuLKr7HcYXPsbeS4iEFc6a5mvd6bQSm9OBbi/E=;
	b=PeX2v8XpmVHLI3ynVwPuoXkAWzIiNOhOAsi+34lD9xCwjmCTV9yXZrhoMAXKP7oZ
	7DoHaka1O5fil31viEtzV/WZHM4Dj5pdSXt7wQ0JVhONO8upcFZX59KIr+2tT5Lrqwk
	Mu3nvCc06HLnDXvddzvOTQwo4/4Z/YwWiOrR7ubI=
From: Shreeya Patel <shreeya.patel@collabora.com>
To: heiko@sntech.de, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, jose.abreu@synopsys.com, 
	nelson.costa@synopsys.com, shawn.wen@rock-chips.com, 
	nicolas.dufresne@collabora.com, hverkuil@xs4all.nl, 
	hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, shreeya.patel@collabora.com, 
	dmitry.osipenko@collabora.com
Subject: [PATCH v5 3/4] arm64: dts: rockchip: Add device tree support for HDMI RX Controller
Date: Mon, 9 Dec 2024 20:02:42 +0000
Message-ID: <01020193ad045582-afdad76d-ab76-4e3e-bf93-6951ed6219a8-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241209200120.3228643-1-shreeya.patel@collabora.com>
References: <20241209200120.3228643-1-shreeya.patel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.12.09-54.240.7.48
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_120246_586263_2B9A5D3D 
X-CRM114-Status: GOOD (  12.29  )
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

Add device tree support for Synopsys DesignWare HDMI RX
Controller.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---

Changes in v5 :-
- Add alignment property to ensure hdmi-receiver-cma
  starts at a 64KB-aligned address
- Correct one of the interrupt IRQ number

Changes in v4 :-
- Remove DTS changes added to this patch
- Remove the HDMI RX pin nodes as it's already present
  in the rk3588-base-pinctrl.dtsi

Changes in v3 :-
- Rename cma node and phandle names
- Elaborate the comment to explain 160MiB calculation
- Move &hdmi_receiver_cma to the rock5b dts file

Changes in v2 :-
- Fix some of the checkpatch errors and warnings
- Rename resets, vo1-grf and HPD
- Move hdmirx_cma node to the rk3588.dtsi file

 .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 14 +++++
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 57 +++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
index 7f874c77410c..2d4b9986a177 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
@@ -594,6 +594,20 @@ hdmim0_tx1_hpd: hdmim0-tx1-hpd {
 				/* hdmim0_tx1_hpd */
 				<1 RK_PA6 5 &pcfg_pull_none>;
 		};
+
+		/omit-if-no-ref/
+		hdmim1_rx: hdmim1-rx {
+			rockchip,pins =
+				/* hdmim1_rx_cec */
+				<3 RK_PD1 5 &pcfg_pull_none>,
+				/* hdmim1_rx_scl */
+				<3 RK_PD2 5 &pcfg_pull_none_smt>,
+				/* hdmim1_rx_sda */
+				<3 RK_PD3 5 &pcfg_pull_none_smt>,
+				/* hdmim1_rx_hpdin */
+				<3 RK_PD4 5 &pcfg_pull_none>;
+		};
+
 		/omit-if-no-ref/
 		hdmim1_rx_cec: hdmim1-rx-cec {
 			rockchip,pins =
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index ead151941e84..bde1efdf1824 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -7,6 +7,30 @@
 #include "rk3588-extra-pinctrl.dtsi"
 
 / {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * The 4k HDMI capture controller works only with 32bit
+		 * phys addresses and doesn't support IOMMU. HDMI RX CMA
+		 * must be reserved below 4GB.
+		 * The size of 160MB was determined as follows:
+		 * (3840 * 2160 pixels) * (4 bytes/pixel) * (2 frames/buffer) / 10^6 = 66MB
+		 * To ensure sufficient support for practical use-cases,
+		 * we doubled the 66MB value.
+		 */
+		hdmi_receiver_cma: hdmi-receiver-cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x0 0xffffffff>;
+			size = <0x0 (160 * 0x100000)>; /* 160MiB */
+			alignment = <0x0 0x40000>; /* 64K */
+			no-map;
+			status = "disabled";
+		};
+	};
+
 	usb_host1_xhci: usb@fc400000 {
 		compatible = "rockchip,rk3588-dwc3", "snps,dwc3";
 		reg = <0x0 0xfc400000 0x0 0x400000>;
@@ -135,6 +159,39 @@ i2s10_8ch: i2s@fde00000 {
 		status = "disabled";
 	};
 
+	hdmi_receiver: hdmi_receiver@fdee0000 {
+		compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
+		reg = <0x0 0xfdee0000 0x0 0x6000>;
+		power-domains = <&power RK3588_PD_VO1>;
+		rockchip,grf = <&sys_grf>;
+		rockchip,vo1-grf = <&vo1_grf>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "cec", "hdmi", "dma";
+		clocks = <&cru ACLK_HDMIRX>,
+			 <&cru CLK_HDMIRX_AUD>,
+			 <&cru CLK_CR_PARA>,
+			 <&cru PCLK_HDMIRX>,
+			 <&cru CLK_HDMIRX_REF>,
+			 <&cru PCLK_S_HDMIRX>,
+			 <&cru HCLK_VO1>;
+		clock-names = "aclk",
+			      "audio",
+			      "cr_para",
+			      "pclk",
+			      "ref",
+			      "hclk_s_hdmirx",
+			      "hclk_vo1";
+		resets = <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
+			 <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
+		reset-names = "axi", "apb", "ref", "biu";
+		memory-region = <&hdmi_receiver_cma>;
+		pinctrl-0 = <&hdmim1_rx>;
+		pinctrl-names = "default";
+		status = "disabled";
+	};
+
 	pcie3x4: pcie@fe150000 {
 		compatible = "rockchip,rk3588-pcie", "rockchip,rk3568-pcie";
 		#address-cells = <3>;
-- 
2.39.2


