Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFD7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5Mn/v7RZ7UFx8WGpT30YpU6PJiEWQ1DE0lZ8cE+J4c=; b=pF8/cKddlIX0ydfg1nGFzNQIEK
	pNOv+pS8k4ViCr43Vz2YKc+UZr+DNdimH80lgjhYQqjwRLm/+iLZFTxOHbHwjgvEw1canyYCtRQwJ
	PViAmgzuSwZ9bNDtW5FaC9mlM2EK7swkCjOtim2fSUcPf7/XG14wsvQaWrPUm6BRioNj7xDlo6+Kp
	X74eNpuuQe293zIcr+tn21kdHQJrvvVgdwoCx4HpIG3VlnMPY/aiRA5RkYjTeMOe4gk6vuW4vdkqV
	P8clhuJqWyB0VDF77zyKcyWdYdcPHq0j7rX97EHE+B0YL9ceYZJ/5iorwBz4X0brkMvAn0s4f+W7p
	xINnQGEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9M2-0000000CFkn-1w9r;
	Thu, 19 Jun 2025 07:06:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8wG-0000000CB2J-0s7U;
	Thu, 19 Jun 2025 06:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F5Mn/v7RZ7UFx8WGpT30YpU6PJiEWQ1DE0lZ8cE+J4c=; b=U71b1AZ44I+AaNgbz4Xd5fKome
	V6TxaUp6w0vLF5BFNIMajkZq6RMGyxQIV/Q43VicSQ3BzCc73RtOFp/hCLh40TIy6oMOUCRH3jHwL
	5MND053Aav4Yq/QzAEaGZkOUFy92vJ1zs/6V+2EhWqrz+VLNM9IVFHb94KscOy37yTvXwZHGVJo7+
	aThBSZx/im4IhhiqRmN+OrzeteeTPSskykWEr3XITRFu6VAhGpVTYZLT3YaCI6PjbhQ11Lb0SZL8r
	9KXE8WcF+dKduRDGx66+rQUVP22OKmWPqylALKOOpzkneKuQHpu7aP6n4ywQ2a6w8cgCsYOsg9mYa
	EgW17rCQ==;
Received: from m16.mail.163.com ([220.197.31.3])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8wA-00000004Mev-0CL2;
	Thu, 19 Jun 2025 06:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=F5
	Mn/v7RZ7UFx8WGpT30YpU6PJiEWQ1DE0lZ8cE+J4c=; b=UcmY+dGzb5iSBaPC5h
	061MXFPks/x1BibP70watoVK2Jjs/YdbeW/HfJwOGXRm2z6NI1SBdwbZXbOpTHgG
	eMHe3lCuidSXqKNJsUEGUq3WQIERWNW0MHR4rSlokd2znpLv8XvO+NkaJcFc6zWu
	v+YkNcLme2WQmsEEN3viy8BiY=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD312OGsFNoUtqyAQ--.3973S9;
	Thu, 19 Jun 2025 14:39:16 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4 7/9] arm64: dts: rockchip: Add DP1 for rk3588
Date: Thu, 19 Jun 2025 14:38:53 +0800
Message-ID: <20250619063900.700491-8-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619063900.700491-1-andyshrk@163.com>
References: <20250619063900.700491-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD312OGsFNoUtqyAQ--.3973S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWDCry7tFWfJw17JFWDJwb_yoW8Xw4fpw
	nrurZ3GrW8uF1aqwnxt34kXrZ8A3Z5CFZrKr1xK3W8Kr1Sqr92k34akrZ3C34UXr17XwsF
	kFs3tryUKF4qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwvtZUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAdxXmhTsFgHqwAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_073953_611061_51F86765 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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

From: Andy Yan <andy.yan@rock-chips.com>

The DP1 is compliant with the DisplayPort Specification
Version 1.4, and share the USBDP combo PHY1 with USB 3.1
HOST1 controller.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 90414486e466f..691fe941d53a1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -210,6 +210,36 @@ i2s10_8ch: i2s@fde00000 {
 		status = "disabled";
 	};
 
+	dp1: dp@fde60000 {
+		compatible = "rockchip,rk3588-dp";
+		reg = <0x0 0xfde60000 0x0 0x4000>;
+		interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru PCLK_DP1>, <&cru CLK_AUX16M_1>,
+			 <&cru CLK_DP1>, <&cru MCLK_I2S8_8CH_TX>,
+			 <&cru MCLK_SPDIF5_DP1>;
+		clock-names = "apb", "aux", "hdcp", "i2s", "spdif";
+		assigned-clocks = <&cru CLK_AUX16M_1>;
+		assigned-clock-rates = <16000000>;
+		resets = <&cru SRST_DP1>;
+		phys = <&usbdp_phy1 PHY_TYPE_DP>;
+		power-domains = <&power RK3588_PD_VO0>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp1_in: port@0 {
+				reg = <0>;
+			};
+
+			dp1_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	hdmi1: hdmi@fdea0000 {
 		compatible = "rockchip,rk3588-dw-hdmi-qp";
 		reg = <0x0 0xfdea0000 0x0 0x20000>;
-- 
2.43.0


