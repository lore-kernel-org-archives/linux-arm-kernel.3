Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3A2CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/2S6tDpoUZ1SIuOdhsW6HAwbv5zQFWfuXkE0KYiPT8I=; b=4zEHkzHcWV91FBvgVdZskvuFwd
	sVgGfeYQBZlSvLyk8lIVFOhH5SjUL5SjP90bfC5F6a07ZFI6nXElDsA18mtJlsnIKl6LIHRALUJ0n
	i2qM9hduXWhBIRt7GjQiv7ZZBxsXHt3UiWOPuy2ocaj3UNKTBgig7nBuMBlfsPKoZQ7x2A9M08csM
	nFR0FQ1wSCh5uhL9mHtqsg+Ut+9SediecyQTosfQNjpUCBdVBalUDf+K/MQUohJ3AZgAXMBSvW5wS
	1PExkaaURP2cZ16cnvDYqekrWnVJjZKdAU9o3NgJ/seBoB4KnB7SJU4Bgv9ras7lMeVxXiLVyvroE
	4PlBYspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz89W-0000000GQOB-3Wnk;
	Thu, 18 Sep 2025 06:29:58 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz89T-0000000GQMU-3D6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1758176918;
	bh=/2S6tDpoUZ1SIuOdhsW6HAwbv5zQFWfuXkE0KYiPT8I=;
	h=From:To:Subject:Date:Message-Id;
	b=tvE7QzllHb28Z1dD6sToqcmx6puNPMjcypFTX8UfjpRQ6++JLSSq6hbDktEMNVyWN
	 cZtygTtSehwoXN5HgMfFNt+NM43Jj/w0OFQ9/c3DklD1BxaxMrG90udcC47uTn8AXR
	 jlSbRnxfSIGjqo9/r4o+z71oG5S2oKr59qYSA9Ds=
X-QQ-mid: zesmtpsz8t1758176916t49f2e520
X-QQ-Originating-IP: kounfVWLm9bYpqAv0zEPs9uq4bYOiCpyxYAp46ogmAE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Sep 2025 14:28:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13016871167258728996
EX-QQ-RecipientCnt: 18
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Peter Robinson <pbrobinson@gmail.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Enable DisplayPort for rk3588-evb2
Date: Thu, 18 Sep 2025 14:28:25 +0800
Message-Id: <20250918062825.194-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OQZoPFOgkfDqrDufRA+V/4VIitZvRaFXrHOKcTaU3cjuuk8k9GMTykhk
	5iRSs8wb++mEKHBHSNB8dMtl5m5jmCAtnRu8WQcAmgK7fq4IgPr3aUReB+HUTX27nkqmAse
	CymBb+UbvtOeawRirIp9w49Xb6Z6KWwwLUPW/RHNP7bTSeXDu7EWtilcc/CgXxWneKZq3c/
	Ntd+WOw+YeRrFTolmIavifE99aHQw7hF+8Hnc/z9blnndnKroTuBJQvsp9XHy83wJlXKA5H
	Paa+UXOuXsUCypkUlcj96ZlewF2+GRk0m90N0F5xaDKoZ0opfOIOFVXmepHMnF0T/5KPb3T
	Mt52SJwouVvFgImUOYrKf7J1ZjsUuV6WsdxJJm3R6i8FFSiGcLso9/TCwyPrqjvScYJRXO7
	enwFdpsXWfl0Fep4Q04QmojaqSbUcNYyly4vvst4o4dtATrYq4mTzZTJyVnE5mQIKE9NWwf
	n46FJuJ5mu46MLAFndguWce9pgFw4I4nFkHFoc9dBGLK+GBnlzpvc57X8PEevOtIC0kX6/l
	k5RzsS/kLDyRFY1yWdVHb1zRSRkrHYbEEE/2BRPi2jvlanAJ8zZ8dUdw83BsUgotwPL5INF
	NwAd3Qa3Xy42WXJ5EuT4W1B4b84Cu14fEtdwy5UQ/XsIOJH7ogyEYipYjAldiEqFLdlkRWU
	zbUikFR1k4qL+TLdZ4j5JqVVrD/lP5ndViEmP9LfZ1SXxnXC4JmWZAVVCvAi2UdxRpz4tUb
	JD6oKEq/Y0pfYtZCLnqSl9XxeLdT1iWdobdqqif1GQZz91h+jDs/YF2+FmzW9bs1uQqv1zi
	h08YxybnmcSyvhHkkNWO063A7j1LOQc5scl7YapTI8ddJQvYcRqbPLbxWFJyjmV9jsREQoR
	QxgH/vXswmRE2fi4AowVQdO4cdOEAkYUO1ghlQ+ozRPT+bg964BM3IXT964ZTQl+X41Y9Oe
	V8YfEwR6v9tfv12OeLJePbJVDnwGcW6kyZBJhkgawqqYwm20Dq6OmlGOXJEyL328q51YgXu
	zcgI1HNw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_232956_206726_E708EC70 
X-CRM114-Status: GOOD (  12.53  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The rk3588 evb2 board has a full size DisplayPort connector, enable
for it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:

- Link to V1: https://lore.kernel.org/all/20250916080802.125-1-kernel@airkyi.com/
- Fix invalid DP connector type
- Add more comment about dclk_vp2 parent clock

 .../boot/dts/rockchip/rk3588-evb2-v10.dts     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
index 91fe810d38d8..60ba6ac55b23 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
@@ -25,6 +25,18 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	dp-con {
+		compatible = "dp-connector";
+		label = "DP OUT";
+		type = "full-size";
+
+		port {
+			dp_con_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+	};
+
 	hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -106,6 +118,24 @@ vcc5v0_usbdcin: regulator-vcc5v0-usbdcin {
 	};
 };
 
+&dp0 {
+	pinctrl-0 = <&dp0m0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&dp_con_in>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	sram-supply = <&vdd_gpu_mem_s0>;
@@ -916,6 +946,17 @@ &usb_host1_xhci {
 };
 
 &vop {
+	/*
+	 * If no dedicated PLL was specified, the GPLL would be automatically
+	 * assigned as the PLL source for dclk_vop2. As the frequency of GPLL
+	 * is 1188 MHz, we can only get typical clock frequencies such as
+	 * 74.25MHz, 148.5MHz, 297MHz, 594MHz.
+	 *
+	 * So here we set the parent clock of VP2 to V0PLL so that we can get
+	 * any frequency.
+	 */
+	assigned-clocks = <&cru DCLK_VOP2_SRC>;
+	assigned-clock-parents = <&cru PLL_V0PLL>;
 	status = "okay";
 };
 
@@ -929,3 +970,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};
-- 
2.49.0


