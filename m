Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B512CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hnz1bmTaV/5rTkG6fQYUXPwPMQpIN6l4+8uksyKRibc=; b=AaEj4+4WyAbbhJYofpcdW7ASjA
	AMm6r7j+yMhzam7FNNL/H8DwvBn2UTomDj+AvUA1LaeCnC0UuAwOdXMzNbRqbB8518UcmnxOrhm3L
	g6RLnbvFBO3mTowco4f8lsrdNaogjuGQnOxZhVmjIpse52QizXBi1ng4K6dgOMyKdVXUrGKA5TMas
	kmbVs4qJmrGUvRuvE6DvuO/9xrIfV0BHV69W0vt3DtuxhwgOfdZnh6GBzCNsIe6Ak1eg4O1f/lzPu
	bFQ2odE442GYvHLRZmW2s5AwfANLs3B1k6mgECd8pYOWNiOeDiZDcprS0jnac7mUoQpeVql9VBW+4
	L9TMpN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQkb-000000077wB-2Pip;
	Tue, 16 Sep 2025 08:09:21 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQkZ-000000077tH-1BCD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 08:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1758010090;
	bh=hnz1bmTaV/5rTkG6fQYUXPwPMQpIN6l4+8uksyKRibc=;
	h=From:To:Subject:Date:Message-Id;
	b=JmjHk4jdQo1fNhgNLWvfwG5gOwj2euEeJg/AYsZtDUU69qqrHtcBraI3iyeQDxeAL
	 BYd4+qLSvn/yvroZqTHXR+rp2DRYbgYQJymahKk8b0UpcASjL1n0HWdXj1K7NCOv4i
	 YtDmDYVFdosbwEJjhWuzBr0QRfWO9N7Wh7xR0hZI=
X-QQ-mid: zesmtpsz3t1758010087t3fbefdff
X-QQ-Originating-IP: /Rz0qBK4PaPleHiuURFFZblXxEBkxSyRKTOxW50+KgI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 16 Sep 2025 16:08:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1933021998724514567
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
Subject: [PATCH] arm64: dts: rockchip: Enable DisplayPort for rk3588-evb2
Date: Tue, 16 Sep 2025 16:08:02 +0800
Message-Id: <20250916080802.125-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OOc4s7IlQD+vKe3M7fd0nFAE7eomhxlGXjXCwVOBvUDGbakoErcVtc2N
	WjkpwsyFzjj1hbEANcKm5k9iv4Zlnf1P8CPMD3CWsyoizQ5wcTzOPBp/tn1/xg6d0iQBc/o
	R4DXvLptEHchxIPyjAikwVtFe+0g1PQhYTKbTEaokfGaNKaBTQW6SIcqnBDewknS/L3XKDZ
	KsL/7mblALAEQJ17PsCWxQ8yjZpssu1jlj/wPo8T8kk38dP4G8oRuP4NxXxA+n+A+/caOQs
	8oPmAPXElW1EKo6GqL8sDX1P7/TGyRMK8h/B2DW3kdSAAnZkWi2TRtlqZhIuYgcWZK5Z2dU
	6pxsKI05lPXt4K2e8odLvYQNfsDOq/G9E8V198pQevmqceJ/SkZW3IA1Pjlgcv/4IiKnExN
	8N2RWFeTJUBIzAWH/U561xnxdpbHmP0sxqkpv2j7rVrnZ69UaV0vnfxCQ8tJm8WtfM/0AsX
	0r8xaD2zzuZTDoR5B6pCsQiKGFVquhXq0NSyHT3eHuoK0xeZHQvGFMCgigNeOSsfzVW7xJq
	M68DR9uMilGAD3P76FvpEjaLV126WIAtdi8LeVKKzpB9HqqS87Aw1g0DoKjKDg8m6lZtzKn
	RlDgH1bZpVeolmSEvSPOJ9vEq4u35uiaqA6khIoBmgoH/EZrDJcYpLSEU+cZT6nv70bcUO7
	DfQ9BmsV4SmOthbR4deotBSrRfa+muDHG+MOwit7SpWVYCFc4sLiq7zACkaLZ+eV4OkB2S+
	S7JbFQSC1iZTOt7kOwLw9dnsy86uOs/oDmialwgNOa6lVnL/L8Kxhjy689/kRm+6UcDaDWR
	K4BBX6FZnmcdqyh4Bn/B66gXY+zJOG26gdjDk7FImsBpidEFNgzpvC0eZ2rQPaz8hSJPgny
	0hEdua6slEcz2TY9AE38F2E3dYHiFCtKfEIWq2CdIgtQco/J+CE+BOQRzjj8CeyJouBVHM5
	9aeNrovd66MjuiCHJsasBK6AfqnKoZc3cNArgLHQMcIEgrr5PU+OFrH+WN0762nLHRXc=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_010920_155720_355B184A 
X-CRM114-Status: GOOD (  10.60  )
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
 .../boot/dts/rockchip/rk3588-evb2-v10.dts     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
index 91fe810d38d8..0e5af61f66fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
@@ -25,6 +25,18 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	dp-con {
+		compatible = "dp-connector";
+		label = "DP OUT";
+		type = "full size";
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
@@ -916,6 +946,8 @@ &usb_host1_xhci {
 };
 
 &vop {
+	assigned-clocks = <&cru DCLK_VOP2_SRC>;
+	assigned-clock-parents = <&cru PLL_V0PLL>;
 	status = "okay";
 };
 
@@ -929,3 +961,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
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


