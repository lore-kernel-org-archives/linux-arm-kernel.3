Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301AFEB106E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bt5hLU/nI/HzEOnEhRr95IV7d49z4MCJHd7um+8yN6g=; b=Bx8n3cmxH2StV3B2Oc8tc38BTu
	qQhqB1jyOoXQFAHYCpl3yXaM008AEawv+7WgURmU9m/BpmO+zZauKgHSr2548R+8LVFhLI2HjuoLp
	j03/XnglEipxE7Veb3KDs+Vj78I4ylwePZC1PXxrl+rbUiINzkCfTjH31iZOTqIi6hF1MDl5BCyk+
	zPzUODbGS1bowyQNW97cNZS64/4zb91GckERU52Nssj2jYkOzYO2MZyHTP8Glot4cVHw5eiO8N47G
	55X5zFKBRIRNCwKqZNVGUx7n/vqVnutvdfHWO3IvegRbXkNCEOndLsJAC2NDu+eneWsihKUYm0c5m
	ep92oV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzysg-00000009mvl-1Zyz;
	Tue, 10 Mar 2026 15:20:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzysc-00000009mtG-3kqH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:20:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so32901235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773156014; x=1773760814; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt5hLU/nI/HzEOnEhRr95IV7d49z4MCJHd7um+8yN6g=;
        b=b1QnAembtHifRifmwboyKlKoqegO3ouJY9DN2gkBOWn660Yo/mtNVkGrrMxNjfaHmI
         02yGsGuMoI5T0d6DpitQw+vdIijXG/iyZ5fcn+f4KjyMLhbKTpbsC7ARdyhdzI5FugZ1
         C9yW0h3cjLwuu+uCR288xIhKBoV+cbZIjEXgbBp1ukqo2odOPeabWt2hxH1Z88IG3mQ7
         6hHqZ+uQQVZ/q/6UE+q/DeW2ovitSaKu+zUdOvUFxQjgB90TVjT5qYGqF1tWsRJUr5Pj
         KB433NoU81NM1BLJh+vTcSar2NlYnwcnHmD0MJJZY/Z/jkFcqDteB99B21Se/FLtznAF
         0Y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156014; x=1773760814;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bt5hLU/nI/HzEOnEhRr95IV7d49z4MCJHd7um+8yN6g=;
        b=leqfetQ9Nl3KuEom9TEZvihnFlOU3LXGgRjvfwfM7BFYlbtFAYChKpozBaUElkk2rF
         clWB4SLLkJ4O+1Rvb90n0GVIX8hk4M/Q8qibbpJ4C+U7O5dEcf35SNHEmlPQp7M+A6zY
         +2pBBAGlswqy5oseYpwc6aZrjvIUFr7CqL/wgc8UZOJiZpt7gwEF9k6U9nlUWmkHH1Bx
         fHNPiSIjqGm+uc5YILr049C7sX9Po/KbHq3dhLf7vYzBE6FHBvWvMRqJtDMwxXhOYoP4
         FHA4jSd7skyf/HnZRNsX8lGsKFhq4Zbf7EHXBomxW5y22R7roYsiSsNoUdi6g4sEY9LP
         XftQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0xOtZQ1Kc2+tTre9KOGLWALDNVE6BZHMw8ci/etfqLovO72in1975ROMRLp1Dd61TVE3+wNIjRdg8MLbaSnhg@lists.infradead.org
X-Gm-Message-State: AOJu0YwEJfz4DwVhZD+REk7BqB1pqmQcJ3yua28H5mOu7y1Tpd2rx1sj
	n9XxqIISPU/E4D/J7E/GkAz1saYxp+PHnOLCCab7MWfdb7AkTDnVFK0V
X-Gm-Gg: ATEYQzyrArY+tmZkXyjDEY98JWJYKd4B0th3lk3DbWfoabPBidGL6/P0VZJgV4qCGy3
	M6An4aCr+1pO9lSzYImxBkQvpgXUYtfRPCVYsVZyJc2oBVSp5P86+vnbJTJiKQBykZUBLaxP71T
	8b+sAqiRdxpcqI9QteeUZ3PzQQlC9XqpcjS0fFyI1x6plkCxSp0cUExbdWmGl1tvTMGGPQXM1uW
	Oir9pwqDywUrWj3+eRDwV9+n0cgrXqSitCMd+aD/SdsAgZo31fO8uFAWvU1+KRpCOnk/XcEGx4d
	fjf4N3vYwAwjp1+bOV2+kiRucDBL9FrhwvXWXQ0c6L47GgJ3+yoa5Umha5Mh71ykpMfLPh72Nhn
	8D2nsu6FAxGuCDGmVVd5ro8pMiz3d4XLHEqH/pqykyErhghsCC9p5JMOk930vpJcjRBzYBlV/RH
	CyCCmIQZJS+TT4k/ulYyr9+SWv/z4j0qPzF7rJ58c=
X-Received: by 2002:a05:600c:1d04:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-48526984073mr264295295e9.31.1773156014424;
        Tue, 10 Mar 2026 08:20:14 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:3201:3d10:6ff9:342f:d717:ee6d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853927825csm66137175e9.9.2026.03.10.08.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:20:13 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 10 Mar 2026 16:20:13 +0100
Subject: [PATCH] arm64: dts: mediatek: mt8390-tungsten-smarc: add HDMI
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-mtkhdmi-v1-1-841e834c8abc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKw2sGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MD3dyS7IyU3Ezd5NRk45SUJCMTiyQDJaDqgqLUtMwKsEnRsbW1ACN
 LVsJZAAAA
X-Change-ID: 20260310-mtkhdmi-cec3ddb248b0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773156013; l=3443;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=C8J5Ohkbi26wTNa7lGQKZ8K2vWOttsiVn2qPlKqCB0g=;
 b=uOkV/mzuDsU2lf2WEF+Qa9VcgGytdgO2J12PEOKmzyOdBJ5xOx+yRjEXzwmA/cmbzMyQ+tgGk
 6roB2Txi1iuDNuvTVCZ3RaJ55vUCzvxRDWbbDZBeh0AANuf0CcruxsP
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_082018_979992_B58FB7A3 
X-CRM114-Status: GOOD (  12.33  )
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

Add HDMI display out support to both Tungsten510 & Tungsten700
platforms. HDMI audio is not covered by this patch, audio (HDMI & I2S)
will be added as a follow-up patch.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index 40b381d4cc35..85c1ff6a3588 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -46,6 +46,20 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+		ddc-i2c-bus = <&hdmi_ddc>;
+		hdmi-pwr-supply = <&hdmi_phy>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi0_out>;
+			};
+		};
+	};
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -283,6 +297,18 @@ &dither0_out {
 	remote-endpoint = <&dsi0_in>;
 };
 
+&dpi1 {
+	status = "okay";
+};
+
+&dpi1_in {
+	remote-endpoint = <&merge5_out>;
+};
+
+&dpi1_out {
+	remote-endpoint = <&hdmi0_in>;
+};
+
 &eth {
 	phy-mode ="rgmii-id";
 	phy-handle = <&ethernet_phy0>;
@@ -304,6 +330,35 @@ ethernet_phy0: ethernet-phy@7 {
 	};
 };
 
+&ethdr0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			ethdr0_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&vdosys1_ep_ext>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			ethdr0_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&merge5_in>;
+			};
+		};
+	};
+};
+
 &gamma0_out {
 	remote-endpoint = <&postmask0_in>;
 };
@@ -313,6 +368,26 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins>;
+	status = "okay";
+};
+
+&hdmi0_in {
+	remote-endpoint = <&dpi1_out>;
+};
+
+&hdmi0_out {
+	remote-endpoint = <&hdmi_connector_in>;
+};
+
+&hdmi_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_vreg_pins>;
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
@@ -531,6 +606,35 @@ touchscren@5d {
 	};
 };
 
+&merge5 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			merge5_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&ethdr0_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			merge5_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dpi1_in>;
+			};
+		};
+	};
+};
+
 &mfg0 {
 	domain-supply = <&mt6359_vproc2_buck_reg>;
 };
@@ -977,6 +1081,18 @@ vdosys0_ep_main: endpoint@0 {
 	};
 };
 
+&vdosys1 {
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdosys1_ep_ext: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&ethdr0_in>;
+		};
+	};
+};
+
 &watchdog {
 	pinctrl-names = "default";
 	pinctrl-0 = <&watchdog_pins>;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260310-mtkhdmi-cec3ddb248b0

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


