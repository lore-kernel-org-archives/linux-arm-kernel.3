Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A0D609506D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4iPNjUFE;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhuLH0xv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rqlh0OoXKTFT1PQI1HOdwpJMhVGTQQ3D/fRH6n1TqSU=; b=4iPNjUFEmv4gRYNiuHSrmjZOWh
	nElBp8vFrcvxYovccf9Vh3UO7a09KpsJQpio4+WEj9NbT3cavw9PZ3n6+dVHID+Gs7KQmAvUTrtjK
	sCAlqNaDcPP6kq99R0uuXx8vOmnP+3ZFOqLDazRAkFzduBLzlMGEu0suxyp/Gq2LfT27LdPKF2V5S
	UEM6ZaCLauotYMK6tY7TI/uqsho3Wv6TqCZFETZ2ese23ZmKJAWj1JiVz8ltjfv8buFUhAu5K+JO4
	OasmYG9rWhi8TTnFT3baK3LX+Eb6rvHEf2r6lEatNcidXy2kSv3jmfDqxkFplBogDeFV2cUIfvMkI
	uKO0bDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOi5M-00000006y1k-4Bfp;
	Wed, 04 Nov 2026 20:59:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOi5L-00000006y13-2LWN;
	Wed, 04 Nov 2026 20:59:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 100714487A;
	Wed,  4 Nov 2026 20:59:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793825995;
	b=0mqKVmS5kKNELhS/t33vndolRW7jsYUZO5oBZGUqh+kHDKWfncQS4ubvFF0nwQKMT6JE
	 AxU69P+9CDubGEC8vI2LLEI4CMIf9khm4FQviMezP94fRM9WJd3YCTjA6dB+1Gm2JT/Y7
	 aojOgnIsMJLqPy7Sp1Fd9cbdVW2gH1VptmNYI67Px86kcqNALxugL+CNkZCz8Z2tN7qm/
	 fLIhBt21SS1NOTFsRr8zQNYHMBTsqb8ZNc0lBzZ7drTJ7eilP9+ZIOn2qprBzEKz8ZDLh
	 WzyMCfThYV4/AUid+IYGbi5wsoBdZbuksnlTvz87ji6k/Oytmd8IGnxRgNXT2yRAriw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825995;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rqlh0OoXKTFT1PQI1HOdwpJMhVGTQQ3D/fRH6n1TqSU=;
	b=pxqkQ+K9Nh6EGwkCX6aLderOM8Vwzb5X+k68p/+4h+4Y+EJw6E7e6oCTaNaiz5b+DhEd
	 G8/WhRmuLZ34gVDpB+JZ2wbC2rTXYzukCl8yQjGIcjxc5uIEIJyrptgiv4meWaPD9jUPC
	 hm0RViP0gDKt0IMoaYPEnDdgwqMLU98TL6vu1yXy4dGO7OMf9t8kVD+yPVhM0UUNnyR9M
	 OLnqn7BdPFVesGk3U6SYj4VuLg+JLhufO3Glhk4UHtluUXAZtiTShj+Cl6s6QexERCFkv
	 w5H4ml/d6TTjwnBZXHFP9JIe/92xF3ORT5w9+CDfcqbQzbkHPh9SIA4jbPuKJwtFS+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B2DE1F00A18;
	Wed,  4 Nov 2026 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793825994;
	bh=rqlh0OoXKTFT1PQI1HOdwpJMhVGTQQ3D/fRH6n1TqSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mhuLH0xvhUBrMfdOe2ntVk9IvPZbsg/RhQ+IIXPGTveZ+n7p8IUskN2OldQ3Hvm8d
	 t1Ml83R6j7kgAL+RwrR0LR/soAv4YljX9cM9V6b7oKLqADBPxxbwLxUKb9qJnLDIQT
	 25tPQ85+Nq9ZOXElaMDY9UpbFDO3kBxCipOQSDB5TcYRhBk+fmZ2XANRAeMVZAu0ZT
	 Tk7987jwKTlCKaak0/I8hiRQXujXV2V3GXPdEdd71zrAL+NauTAwyvE27slLdq1eVS
	 HJjJeIgtlC7Z27FyIYCoQ9wlB5CP8XUKaBmv1x7RSf+WAOnaoxw1udAOcBUAyJAj9J
	 6rPRtJW6VyDzg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EBEBD46FAC;
	Wed,  4 Nov 2026 20:59:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 21:59:23 +0100
Subject: [PATCH v2 3/3] arm64: dts: rockchip: add support for NanoPi M6V2
 board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-nanopi-m6v2-v2-3-dfcd8714f48a@gmail.com>
References: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
In-Reply-To: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793825992; l=3730;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=HHQTMsbiHoDvV4k5fOgzM7R6OF8pxLzbRe7t3xi4I0Q=;
 b=pLoioa4DXzOYLFPjeycLv5Si+yS1Jb3O+ClLo26AW0tG4GB0AluSmJgjF0544wpfj4ardxT8A
 GpaGGu0SohEAjGdqxVsOU0rXxfkeSoRkUgo6zQJ/vkRcC67hx4jeaAO
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The NanoPi M6V2 board is an updated version of the original M6 board
with the following changes.
* New audio CODEC (Everest ES8389)
* New Ethernet PHY (MotorComm YT8531C)
* 1 extra user button
* Misc connector changes on the board

The codec_es_3v3 regulator enable pin is hardwired to the 5V input rail.

See link below for detailed information:
https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6V2

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  1 +
 .../boot/dts/rockchip/rk3588s-nanopi-m6v2.dts      | 94 ++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 57a1f41986377..3df63c35b4bf0 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -240,6 +240,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-indiedroid-nova.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-khadas-edge2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-lubancat-4.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-m6v1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-m6v2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts
new file mode 100644
index 0000000000000..b343c1e08c263
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-nanopi-m6.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi M6V2";
+	compatible = "friendlyarm,nanopi-m6v2", "rockchip,rk3588s";
+
+	analog-sound {
+		compatible = "audio-graph-card";
+		label = "rk3588s-es8389";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_det>;
+		hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+
+		dais = <&i2s0_8ch_p0>;
+		routing =
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"INPUT1", "Microphone Jack",
+			"INPUT2", "Microphone Jack";
+		widgets =
+			"Headphone", "Headphones",
+			"Microphone", "Microphone Jack";
+	};
+
+	codec_es_3v3: regulator-codec-es-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "codec_es_3v3";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&user_btn>;
+
+		user-button {
+			label = "User";
+			linux,code = <BTN_1>;
+			gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
+			debounce-interval = <50>;
+		};
+	};
+};
+
+&i2c7 {
+	audio-codec@10 {
+		compatible = "everest,es8389";
+		reg = <0x10>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		vddd-supply = <&vcc_1v8_s3>;
+		vdda-supply = <&codec_es_3v3>;
+		#sound-dai-cells = <0>;
+
+		port {
+			es8389_p0: endpoint {
+				remote-endpoint = <&i2s0_8ch_p0_0>;
+			};
+		};
+	};
+};
+
+&i2s0_8ch {
+	i2s0_8ch_p0: port {
+		i2s0_8ch_p0_0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&es8389_p0>;
+		};
+	};
+};
+
+&pinctrl {
+	buttons {
+		user_btn: user-btn {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&rgmii_phy1 { /* MotorComm YT8531C */
+	compatible = "ethernet-phy-id4f51.e91b";
+};

-- 
2.56.0



