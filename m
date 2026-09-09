Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482CEC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9cVzalYWb/deBRS9aiFq2Ry2KJzg6JfvgxLZIC4kcY=; b=HJSvF7u+atahOW0n28jQqrDj4t
	gzfyRRdCjuEih0lfPSF8YOt8i4oIxjfC4aFeN38QgRLQdgZrqjYIlNNJkTfUcvDZwmgmYPRR74CEJ
	xfzGj0P1DZH1EegmCnMQrcYWEWPad9uf8wE4B4I5QwNyKsWSaSvj69OlvCOSNUO+AghviXqdRFRuG
	ovX9vA2Boa6mguHILfUAyW+n0N0LwSKr99pyzxb0V9ckBJrYkk6XVhJkZltTGA+BiMTlns4XwIcV+
	KOi4N7ecw4dz5BZ7dSrI/bjcoCiS7pMJDGu0AsbOdwUNUlSR2C7QHQNZmZvErpXS9WwPvlEg7plA5
	SOIIDegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWS-0000000BPf4-2Ab0;
	Wed, 09 Sep 2026 10:27:20 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWM-0000000BPbY-36B4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:27:16 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 627417A007C;
	Wed,  9 Sep 2026 06:27:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 09 Sep 2026 06:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949631;
	 x=1789036031; bh=v9cVzalYWb/deBRS9aiFq2Ry2KJzg6JfvgxLZIC4kcY=; b=
	HPN89TjbHYLR9mVsbZ4S5QSrWrTMcxPz7uSF8DB4NObTcw4sG3N3/dpFP+QCF6os
	o5GE0h48rhHXTNB+YhBbm/CsHzpDB3ymE61HtY7ZTLFNitwgP+AjDmj49G25lXIo
	EmSYnmggbZT7zzVSh2ZpTCgH0Mv9A52mYqWUU7ViXXKW+iDg2WL+fk2f3Jxr7bpX
	0SIOgzaLzilrd5sPZohe9GvFcsBBLeqEnEFN7RMn1OavX1J4FhsVqsVi80FwUBVK
	A4xGj47W14T9QmJa6mPBEvgAflDZ7mr2s6EXn824GEhMtmhsZVZTqNTOm9pRU5A3
	qlwdY51a4Dj5N0Nh/EETmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949631; x=
	1789036031; bh=v9cVzalYWb/deBRS9aiFq2Ry2KJzg6JfvgxLZIC4kcY=; b=N
	2dNE00cPGMykazK+KM8tF5i4gILFEViNPLAb6aZBEFqWbaHB29Nzohm+MHmeGceZ
	6ECAqAyWcUBOdPysMgCutvbv9U95rOlm3YMgnJbwdWt2YTDgrTQSZlfIsLIclkb5
	Xu9Mn1ohCGzN8unyzVLMbbovK/oiln3DwwFqb2Yg+JWGK/VLhRxKTdCndEeijNfs
	qZ3q+72bdmGKhtJ+uSkRhFgQv3mugi2s7ino4tLnR2DLnfun1yi/tbAyOmLArXz/
	XTlfgOR5rlaOThLuontC1J1ckUhPoNOkuiiZhBycbrvLxqIIm1Pw75IVSeazqTM/
	PhVJAUGHk+Ii8hy7Z33og==
X-ME-Sender: <xms:fzShaqzEfo36I7AOV3vbGra-WDLe3oLQLJN6RqrWOeEWlKVH-zgmpg>
    <xme:fzShaudVrlyBfNHLEWI1fIa5YF8s1lXX2IpaDJOSiQFBdX7GqZV8FvXcjip2_Jk3k
    A-FqP4Gsi30KTDht67BLvyBaRWCYuyoz8ZtZecvDYgav9YmvpkROvt8tQ>
X-ME-Received: <xmr:fzShan7f1iNZ2JDwuNOyt03saKygk9siYC_L0gW_vAtU6orK0bV4-eJe9r0TP7zhNysU6Lfw8Gt4nlu15tnpiCJYr-EAbKW29zAL9w>
X-ME-Proxy-Cause: dmFkZTFx5WkaY4CDAlu0ZuU0hrQzpafzkGsOaaQGEhoUmSRPpPX76dVLRDYSy3Ff36O28i
    2b99czRBR+aM2sP9W0jn3TnWedWS1aurEII+sX65de2uh7zYXOOp/7zyDNqGFAsFsn5G92
    BaS0m5e4Kv8PJlU26VdOhZ/DVyTkQd6kagOvbn+jkexDsbD8nNJOHEvi4uQdLIXSeayDWh
    nMJWoPiW/JuVJBDcDNmg7gGLig4IK9iLSNltxhecCMWDtrvVn5YADCi0ePKsJDVJujcxSN
    ZZDmN0eLKwvqavAQsRwATwIBAsHaWpd4LLVFp74ef13oKcetFr2d4tMXguUSWmQiXc9eB3
    IMU6xytROrg0UKsapgkgOhOKyaHbCMGEt0V32f9wBbseAMQs6qzIpviZLCFZr+lRXJcV26
    jX9dMpon8D62vgeVZeDkio1rCke4kzEPP/XsSfJkIrUtJEgdTX4b+vKWdVkMaTwdyXFHjE
    fDXG+OdhJeu8R36waON+zyNWtDNqqyz6NfrCgBXRm+7e4trbKWqqQlSip1HqtmWWUVts2Y
    WxSNQt8Utr3OMoqLvAij3vF+uCX0HEYeduqseWOtBPwdnpZW/HZ3DcKWy+MgrFUa2ou/0j
    d/W99UhFPQAj5zUSZ9Dt0hWKbeWEk7+9xSK/iaFU9PXsUIvY8KvqGISMKRYQ
X-ME-Proxy: <xmx:fzSharLi6P3JekzXGm1PQgO1MivDOaWVQvnPWO65ckMN4RgAApmbZg>
    <xmx:fzShany1OqewVZWwdLoYPAavjlpBGLMsdnmSgInBIBNv68bmXyFPBA>
    <xmx:fzSharKAQcBMWvgKM6vDoT3sLej8Mht5SJBFfMZ7xnSxZyX1n7azBA>
    <xmx:fzShauXSZoU0bTHlhC3yKioYMl2Yld_GPTGKZU-uNzrKJJu7kJNFfw>
    <xmx:fzShagQ6sr5A4766ftIA2KdNGVN64SKITsr2DBozVCfcCAT_1lXA8EUO>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:10 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:26:57 +0200
Subject: [PATCH 01/13] arm64: dts: apple: t603x: Fix all blank line
 dt-style-check issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-1-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10244; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=o8HxpYTWYHHj1oP2x+jFHXd9bfJrq6lJRPSdeAjeGp8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJhXr3Lf9vfb96NZ7LRt5k+4KNtq8vLD32wf26rk6p
 Uv5XJekdJSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZjI+w0MfyWfhGuXrpqV/X3h
 Teviba2fmA7ZrTvBxXnzi5zfmis1MoaMDFdd1ybXXXe2EeYxY+FcrbGlbwKP/50VP68lzvf/cNG
 5lgkA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_032714_876135_37BE0F14 
X-CRM114-Status: GOOD (  11.84  )
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

Fixes dt-style-check 'blank-lines' and 'required-blank-lines' issues
reported in strict mode.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6030-pmgr.dtsi      |  1 -
 arch/arm64/boot/dts/apple/t6030.dtsi           | 18 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031-base.dtsi      | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t6031-die0.dtsi      | 10 ++++++++++
 arch/arm64/boot/dts/apple/t6031-pmgr.dtsi      |  6 ++++++
 arch/arm64/boot/dts/apple/t6032-j575d.dts      |  3 ++-
 arch/arm64/boot/dts/apple/t6032.dtsi           | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi |  4 +++-
 8 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6030-pmgr.dtsi b/arch/arm64/boot/dts/apple/t6030-pmgr.dtsi
index 932388ea13c9..b890d622566e 100644
--- a/arch/arm64/boot/dts/apple/t6030-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030-pmgr.dtsi
@@ -1434,4 +1434,3 @@ ps_atc3_usb: power-controller@f0 {
 		power-domains = <&ps_atc3_usb_aon>, <&ps_atc3_common>;
 	};
 };
-
diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index 5ff12edfc553..0bfa8db59db4 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -24,18 +24,23 @@ cluster0 {
 				core0 {
 					cpu = <&cpu_e00>;
 				};
+
 				core1 {
 					cpu = <&cpu_e01>;
 				};
+
 				core2 {
 					cpu = <&cpu_e02>;
 				};
+
 				core3 {
 					cpu = <&cpu_e03>;
 				};
+
 				core4 {
 					cpu = <&cpu_e04>;
 				};
+
 				core5 {
 					cpu = <&cpu_e05>;
 				};
@@ -45,18 +50,23 @@ cluster1 {
 				core0 {
 					cpu = <&cpu_p00>;
 				};
+
 				core1 {
 					cpu = <&cpu_p01>;
 				};
+
 				core2 {
 					cpu = <&cpu_p02>;
 				};
+
 				core3 {
 					cpu = <&cpu_p03>;
 				};
+
 				core4 {
 					cpu = <&cpu_p04>;
 				};
+
 				core5 {
 					cpu = <&cpu_p05>;
 				};
@@ -254,6 +264,7 @@ i2c1: i2c@289014000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c1>;
+
 			status = "disabled";
 		};
 
@@ -268,6 +279,7 @@ i2c2: i2c@289018000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c2>;
+
 			status = "disabled";
 		};
 
@@ -282,6 +294,7 @@ i2c3: i2c@28901c000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c3>;
+
 			status = "disabled";
 		};
 
@@ -296,6 +309,7 @@ i2c4: i2c@289020000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c4>;
+
 			status = "disabled";
 		};
 
@@ -310,6 +324,7 @@ i2c6: i2c@289028000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c6>;
+
 			status = "disabled";
 		};
 
@@ -324,6 +339,7 @@ i2c8: i2c@289030000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c8>;
+
 			status = "disabled";
 		};
 
@@ -333,6 +349,7 @@ fpwm0: pwm@289040000 {
 			power-domains = <&ps_fpwm0>;
 			clocks = <&clkref>;
 			#pwm-cells = <2>;
+
 			status = "disabled";
 		};
 
@@ -349,6 +366,7 @@ serial0: serial@289200000 {
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
 			power-domains = <&ps_uart0>;
+
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/apple/t6031-base.dtsi b/arch/arm64/boot/dts/apple/t6031-base.dtsi
index 74e1fa51242d..6df3be68d740 100644
--- a/arch/arm64/boot/dts/apple/t6031-base.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-base.dtsi
@@ -20,12 +20,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpu_e00>;
 				};
+
 				core1 {
 					cpu = <&cpu_e01>;
 				};
+
 				core2 {
 					cpu = <&cpu_e02>;
 				};
+
 				core3 {
 					cpu = <&cpu_e03>;
 				};
@@ -35,18 +38,23 @@ cluster1 {
 				core0 {
 					cpu = <&cpu_p00>;
 				};
+
 				core1 {
 					cpu = <&cpu_p01>;
 				};
+
 				core2 {
 					cpu = <&cpu_p02>;
 				};
+
 				core3 {
 					cpu = <&cpu_p03>;
 				};
+
 				core4 {
 					cpu = <&cpu_p04>;
 				};
+
 				core5 {
 					cpu = <&cpu_p05>;
 				};
@@ -56,18 +64,23 @@ cluster2 {
 				core0 {
 					cpu = <&cpu_p10>;
 				};
+
 				core1 {
 					cpu = <&cpu_p11>;
 				};
+
 				core2 {
 					cpu = <&cpu_p12>;
 				};
+
 				core3 {
 					cpu = <&cpu_p13>;
 				};
+
 				core4 {
 					cpu = <&cpu_p14>;
 				};
+
 				core5 {
 					cpu = <&cpu_p15>;
 				};
diff --git a/arch/arm64/boot/dts/apple/t6031-die0.dtsi b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
index cffab6b51d12..932c97579f99 100644
--- a/arch/arm64/boot/dts/apple/t6031-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
@@ -71,6 +71,7 @@ i2c1: i2c@391014000 {
 		power-domains = <&ps_i2c1>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -85,6 +86,7 @@ i2c2: i2c@391018000 {
 		power-domains = <&ps_i2c2>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -99,6 +101,7 @@ i2c3: i2c@39101c000 {
 		power-domains = <&ps_i2c3>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -113,6 +116,7 @@ i2c4: i2c@391020000 {
 		power-domains = <&ps_i2c4>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -127,6 +131,7 @@ i2c5: i2c@391024000 {
 		power-domains = <&ps_i2c5>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -141,6 +146,7 @@ i2c6: i2c@391028000 {
 		power-domains = <&ps_i2c6>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -155,6 +161,7 @@ i2c7: i2c@39102c000 {
 		power-domains = <&ps_i2c7>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -169,6 +176,7 @@ i2c8: i2c@391030000 {
 		power-domains = <&ps_i2c8>;
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
+
 		status = "disabled";
 	};
 
@@ -178,6 +186,7 @@ fpwm0: pwm@391040000 {
 		power-domains = <&ps_fpwm0>;
 		clocks = <&clkref>;
 		#pwm-cells = <2>;
+
 		status = "disabled";
 	};
 
@@ -194,6 +203,7 @@ serial0: serial@391200000 {
 		clocks = <&clkref>, <&clkref>;
 		clock-names = "uart", "clk_uart_baud0";
 		power-domains = <&ps_uart0>;
+
 		status = "disabled";
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t6031-pmgr.dtsi b/arch/arm64/boot/dts/apple/t6031-pmgr.dtsi
index f80ee5f7ebcf..721ab2e9fd4b 100644
--- a/arch/arm64/boot/dts/apple/t6031-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-pmgr.dtsi
@@ -1383,6 +1383,7 @@ DIE_NODE(ps_afi_d2d_0): power-controller@2d0 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afi_d2d_0);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
@@ -1393,6 +1394,7 @@ DIE_NODE(ps_afi_d2d_1): power-controller@2e0 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afi_d2d_1);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
@@ -1403,6 +1405,7 @@ DIE_NODE(ps_afc_d2d_0): power-controller@2f0 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afc_d2d_0);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
@@ -1413,6 +1416,7 @@ DIE_NODE(ps_afc_d2d_1): power-controller@300 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afc_d2d_1);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
@@ -1423,6 +1427,7 @@ DIE_NODE(ps_afr_d2d_0): power-controller@310 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afr_d2d_0);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
@@ -1433,6 +1438,7 @@ DIE_NODE(ps_afr_d2d_1): power-controller@320 {
 		#reset-cells = <0>;
 		label = DIE_LABEL(afr_d2d_1);
 		apple,always-on;
+
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/apple/t6032-j575d.dts b/arch/arm64/boot/dts/apple/t6032-j575d.dts
index 56edfb1139fb..71f4a00e1b1c 100644
--- a/arch/arm64/boot/dts/apple/t6032-j575d.dts
+++ b/arch/arm64/boot/dts/apple/t6032-j575d.dts
@@ -30,8 +30,9 @@ framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
-			status = "disabled";
 			power-domains = <&ps_dispext0_cpu>;
+
+			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index 0a966370cc82..aa48f2483fbb 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -33,12 +33,15 @@ cluster3 {
 				core0 {
 					cpu = <&cpu_e10>;
 				};
+
 				core1 {
 					cpu = <&cpu_e11>;
 				};
+
 				core2 {
 					cpu = <&cpu_e12>;
 				};
+
 				core3 {
 					cpu = <&cpu_e13>;
 				};
@@ -48,18 +51,23 @@ cluster4 {
 				core0 {
 					cpu = <&cpu_p20>;
 				};
+
 				core1 {
 					cpu = <&cpu_p21>;
 				};
+
 				core2 {
 					cpu = <&cpu_p22>;
 				};
+
 				core3 {
 					cpu = <&cpu_p23>;
 				};
+
 				core4 {
 					cpu = <&cpu_p24>;
 				};
+
 				core5 {
 					cpu = <&cpu_p25>;
 				};
@@ -69,18 +77,23 @@ cluster5 {
 				core0 {
 					cpu = <&cpu_p30>;
 				};
+
 				core1 {
 					cpu = <&cpu_p31>;
 				};
+
 				core2 {
 					cpu = <&cpu_p32>;
 				};
+
 				core3 {
 					cpu = <&cpu_p33>;
 				};
+
 				core4 {
 					cpu = <&cpu_p34>;
 				};
+
 				core5 {
 					cpu = <&cpu_p35>;
 				};
diff --git a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
index 517b84c183ca..3ac8a2f0723b 100644
--- a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
+++ b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
@@ -35,8 +35,9 @@ framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
-			status = "disabled";
 			power-domains = <&ps_disp_fe>;
+
+			status = "disabled";
 		};
 	};
 
@@ -47,6 +48,7 @@ memory@10000000000 {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm0 0 40000>;
 			function = LED_FUNCTION_KBD_BACKLIGHT;

-- 
2.55.0


