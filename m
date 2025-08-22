Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCD1CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/I/B1Xgl4R7nkzvCP7ov1Z9+wk36ipL18Hy/fu/bOM=; b=PAAkiQYSDd2jIzr+8Ei9nUrcqC
	8bvvgR8oY2PsSqDo9U//AYp6qoYIhYzml/yd0BVlpW7yrPtehr/IjQPq+GZgs7k3/e2aY8+8nqA5c
	nTH5Ujq6Uj6mXuKa9FGzcs2qpDq+wVD3/JRIHP00MXASNY4w088VpKzDnQra7Mic6ydiW0ejov8yH
	lHp/sLdDF2AHjIrlh0b0RIT6lyJR2sXY0KDSVp/xzZL1vzjyDDDKCK1ajCp283Cd4NB9RgRUQo5b1
	v/sl4s1BL4Lna1mHmxbQ4lxLf/dzarjR6JuMhY5M3Wl94lU6Bks31GvnGhHxU1bapCHqQiR8ogxIE
	oNghzH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphmC-00000003zYT-42Bs;
	Sat, 23 Aug 2025 06:30:56 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRrn-00000002dP3-0K0F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-afcb78d1695so27832166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869497; x=1756474297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/I/B1Xgl4R7nkzvCP7ov1Z9+wk36ipL18Hy/fu/bOM=;
        b=eT0Sbgtw2+QP8HbaWJewszfQ32BeF/0ySfy0p+0/xvP+CHzNE6UmAHADtPlgdVCMB3
         dZDuaZtBkGen3CQaAql/EiVBFNGP3GerYz/Ukq/VbKpcRuhi/ZviX9Xgv+e2xSQWb2XD
         9dsD1ZpGbTZrIZa2mjSLD1DHoKCntop5issvZlpZOZeTGQcwC9AJlLdH+yojMnSjGPvb
         JJTQN0CnsoRDRb0ctk8BP8dJDmoMwYC9VPcf3rMa8kNe4I+fLobxKvjZ5CR7n1QuwS0E
         xj154eOejxutal19X+p5H9EvFDaohZEtNjU6kgNdlaS7m+JMQiRDt5TnJ8stbi72G8uo
         yGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869497; x=1756474297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/I/B1Xgl4R7nkzvCP7ov1Z9+wk36ipL18Hy/fu/bOM=;
        b=Uepz9/ooBitWHDgE7LdOVWMOzLLSJgiUeRsf2WfhHbgPvumo3Mwsner/Pj8hYsZVL5
         SXA3nKrJE4e8h4gY4/NmZYvBsW+dXlLS0bJSghxnOTcP3OKUkPwyQ6OPb6Rgy9Q7idxE
         HKZPQVLmj9YmiFNz5Z26yp4iFhngQMvtdc19/OWa+bEMT7SzIA64KotBeZwMnpD0gNEh
         bXMLuwzdsFnstlGbZX/EbX5IVPZQOf6U7Wb5xxrzBYsq6E00QUA/64icQxwEGRhC/omL
         mCE9mI+TGI6zuyC6UAkK6k0VoNchS+/eV1HiC/VEXFdkE6oD5fhaQx/46UFB83tFyGOf
         XnOg==
X-Gm-Message-State: AOJu0Yyt3/rOdjo9n9tKCOPI+SwrMAr+LdtQpgPCb/FKT8CbPOKYSqwL
	Zv9qIzsNilwVUPUEE6UlZ5LwlMg80d6Rf5SU9uFFtcED7vkjtTZhckDOs0r5l+n3Y1Y=
X-Gm-Gg: ASbGnct8kBYQoTdpHLJqii0/osYl0rqInhqNKLuzfaoI0EZmhPvuvmxHVUZMlNVJGe9
	s/WLxiYSbWUJ26zVUhgLong0GxxapIhODuE14THI+0AQz2APyRzUNAuQLW+jC8RzgS0tpRXo+bw
	NxqUkCDDsufOdXJgL4NReH3GU6OJXgk4rT0L5+Ct8gX3zkKeilmMas7/sbg7m0u6WkIoafCNjwM
	6GSHuArmtwh8TrN2uaYIX36tBahKwGwKbRa0ab9NXA8RKJP+W12Gqtm2YKNOJHD06ZEWqPxBsRz
	Hi9rmvaLt5ug/9TG0/dxQDSwHgmfWsu3cvVJSdDil6P1edVMXE5I5AgR9yiMPez1lWA5nQHmzJA
	xP+DwJ6nGw4gGJpufPaHcGVgRx5SIlS66XZ5Qj+8=
X-Google-Smtp-Source: AGHT+IEyDwCsxl5L5Q6zhJRuvce0siTKlXqOHugCi96LaphpN2o879tF+yGlsn9uhsI+1vutjC60fg==
X-Received: by 2002:a17:906:c10e:b0:af9:5903:3696 with SMTP id a640c23a62f3a-afe28ec8575mr159462866b.2.1755869497446;
        Fri, 22 Aug 2025 06:31:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:19 +0200
Subject: [PATCH 10/10] arm64: dts: imx8: Use GIC_SPI for interrupt-map for
 readability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-10-f1b479da9340@linaro.org>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3812;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZgO6eUDKdzkFk380nvHSCOPF+LK4HXHq8MSxWowHtBQ=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEo8ebRuqypCpa68Mh2v7d5MUvPuEcsRySCX
 9cVV2D5SWeJAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxKAAKCRDBN2bmhouD
 12G3D/j2os04TAukiAzO4cVt0bZ4ODbfZ8ElQZZugArIYddeU7K0aLR9h7anhmfB246YsCfa3/C
 5/XJ+YY/5EqzjywJxDY+IH1cSgK4UBy86W/JdbBkCLBkBxlu9qJp/LT8itKBaX6u1BwubCI0No1
 tJXCN/v+RPVZCs00QXh9ej1sXS/U9bbR70h8TETqgmc1mZXdVGxXBRml0MJ5BfUnreCl+i1+uK6
 Cp3MtFnsapo66aWskhohC+jcv//WLG/6LHJ2PKUzzrRI9YYG+09NPABlEwXy4PnoHMUjxXNm1Yx
 F8vCgZOmZ0dPAbxz2vZa7ibb9vV4JZz6RYC8OvZU5p9ZUTC07odvybnVT15f7m3kOMUIX6lE64b
 P5XCDPwwi40TIlKH/OKgAJmY/1gk9BU9BwD/8W2oSbaQseb/yPhhaRrJyKVoS5OeNduIsUjRkX/
 oBaY0EREk9kNocGp7kQ0V62RzkaD3dmSUFZFjxpWh//WAdH4XCOvjNxOF6BdwKfW79i6nKULuXs
 2plT0/ALA4dCbqEpE+9KQYQXPFRBAfp62NOFq2+vdDr/8qKyowWrbc/INq82kPAt4SCsNVVKPb0
 E+36ERJGOKX3vyRKxiLDo2EIh4EypzaCmh6079MF0qHBrG0+5gfPi2B3fxPoKL30U8I/MB0IlMH
 1XEuQclU7/FOi
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063139_120275_681657A8 
X-CRM114-Status: GOOD (  11.30  )
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

Decoding interrupt-map is tricky, because it consists of five
components.  Use known GIC_SPI define in final interrupt specifier
component makes easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi    |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  | 16 ++++++++--------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
index 9b8b1380c4c2bb25f691d72a0217915cf3824889..469de8b536b5866ea83cc0542941039996ae5f23 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
@@ -68,10 +68,10 @@ pcieb: pcie@5f010000 {
 		clock-names = "dbi", "mstr", "slv";
 		bus-range = <0x00 0xff>;
 		device_type = "pci";
-		interrupt-map = <0 0 0 1 &gic 0 105 4>,
-				<0 0 0 2 &gic 0 106 4>,
-				<0 0 0 3 &gic 0 107 4>,
-				<0 0 0 4 &gic 0 108 4>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &gic GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &gic GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		num-lanes = <1>;
 		num-viewport = <4>;
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
index bbc6abb0fdf25b650dacb8dfcbbbe5dac9ed5cce..ec466e4d7df5467803243404795a9a6a1da890b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
@@ -42,10 +42,10 @@ pcie0: pcie@5f010000 {
 		#interrupt-cells = <1>;
 		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "msi";
-		interrupt-map = <0 0 0 1 &gic 0 47 4>,
-				<0 0 0 2 &gic 0 48 4>,
-				<0 0 0 3 &gic 0 49 4>,
-				<0 0 0 4 &gic 0 50 4>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &gic GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &gic GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &gic GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-map-mask = <0 0 0 0x7>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index 50c0f6b0f0bdc2bd6fd3a19e08d1b7a723353783..bd6e0aa27efe90d3489c16c705d508028b268ee7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -30,10 +30,10 @@ pcie0: pciea: pcie@5f000000 {
 		clock-names = "dbi", "mstr", "slv";
 		bus-range = <0x00 0xff>;
 		device_type = "pci";
-		interrupt-map = <0 0 0 1 &gic 0 73 4>,
-				<0 0 0 2 &gic 0 74 4>,
-				<0 0 0 3 &gic 0 75 4>,
-				<0 0 0 4 &gic 0 76 4>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &gic GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &gic GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &gic GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		num-lanes = <1>;
 		num-viewport = <4>;
@@ -80,10 +80,10 @@ pcie1: pcieb: pcie@5f010000 {
 		clock-names = "dbi", "mstr", "slv";
 		bus-range = <0x00 0xff>;
 		device_type = "pci";
-		interrupt-map = <0 0 0 1 &gic 0 105 4>,
-				<0 0 0 2 &gic 0 106 4>,
-				<0 0 0 3 &gic 0 107 4>,
-				<0 0 0 4 &gic 0 108 4>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &gic GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &gic GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		num-lanes = <1>;
 		num-viewport = <4>;

-- 
2.48.1


