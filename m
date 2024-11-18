Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024D6D49205
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yr1292EdCuKFfiA+4ZvZQTerR4Z3UgKV6lwrmxEoxeo=; b=vgb+YpuI38ntdnkqeT7+1SmPzF
	QdSDUWBxP7aSm+ZiTG6MwJ8zvK7QOAgmXZTmOo0DdpdHURKrIVHrNozt2hyIPeErNwnwjrJUN1yHn
	qkNyXfag5//CMxp0g8Tymuk8nwzMSJ6BgIcFf8m93gXNyqMbhe33hDN+wvSAoD1TQYOx6yfF2p6yt
	PWFfAxKTs+9f/SMWiZgFOOE4H5xETRYMKv1qaRx3dbaa7cnXrBPnlm0awWrJmv50epnPHVKkgKAJd
	xxzrzZK60yL07AHPGyyKM2MmuSpNw/rAWSszp5Ngz/THwP3ESOekxh9nrK6C05h0iezYCfIabmd7h
	//YF5C7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz7Q-000000096m2-0mZf;
	Mon, 18 Nov 2024 10:36:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz5a-000000096L2-0sSb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 10:34:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-431616c23b5so22453655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 02:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731926076; x=1732530876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yr1292EdCuKFfiA+4ZvZQTerR4Z3UgKV6lwrmxEoxeo=;
        b=eo7P3VPtXRfAi6gunmYKe3OrdsQ9rzdAQM2ZwLccEaosHOGXnL0fmc25OPPe5GjB11
         Lw0mudZLwss1s3SZuP66+Unrgg0bicIMVVrOAtvnr90bE6Urex+HoXPf+vAC72LwAfdU
         SUPhXcGoIp3s3plsa8RxUnvx/+ZpMj0vC+MxIT0gQNr5sqrUDPnPrLZI7hIvnmAarM8+
         hk+W0Db9KTPz0I1+tzlysWDWTuvdBS0d2VXs/ZZwIzvdNdewI7bfcS2E4P28xKjSQGUa
         2bndh1ighvKqbHUBgP3EGQBQsM/rW8DWn6QNO4M45R/f4ujI6y2xwuKzbG8T69CHPUaV
         5KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731926076; x=1732530876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yr1292EdCuKFfiA+4ZvZQTerR4Z3UgKV6lwrmxEoxeo=;
        b=CUGLYS96ReAecEOKT17icTEB6jbHMA4SGNThpDRXF6Ghx8Ai/Yl8djkFr5GjBNMZN/
         g20EzXSgfUvIqhIAgh32aKkMoy4FIXBDCQ2uYYbGsF7p4sXhdZglDWyIm6BszMq6Bmlq
         wHl/gtXFA3rhH4w2WIQ/MIWDzRuqJ/GBxylV1FXqeFFXmIQ21FBipQBBGnT0WcCAzZJl
         6kLAplAACcxZAqYs51k3eWsfZeZIYdKgg4QZ5+oSvXlffONn/UcheZBV4LGwGkPBGZTP
         FYGk6k2Rwpbv7vRGrK7FvR3kqVYbqwwALBO30fBXN19MDRbQOTQyOM6mrSFePMjCISqy
         JNwg==
X-Forwarded-Encrypted: i=1; AJvYcCUI97i2LDRp+VSsUxYf6bd/XGCa1euyJYT4OPaopmzlYztfASDz27drcWmCpg8E79f1/VTw1zBj8Vd0WIviX+Gj@lists.infradead.org
X-Gm-Message-State: AOJu0YwLiAue1n5TMMQKAgRGIgm6XuGyh0aQyqvu26flRD6HT42+ej6y
	btBk7fneQHYrGIvyBIeJPA2l2j8jTj6LPQB2Ht9yN18PEyFgrm/JOW0XzvfMJHE=
X-Google-Smtp-Source: AGHT+IEpR027bQwqgL+gWsLc+SHyyXqlwdyiwrb5NhXy2pdUH//X/toKtnp1aDwfHxO74fzhk6rBZg==
X-Received: by 2002:a05:600c:1d1d:b0:431:3b80:6ca7 with SMTP id 5b1f17b1804b1-432d9767819mr147645655e9.13.1731926076147;
        Mon, 18 Nov 2024 02:34:36 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:5b7a:75b3:1e72:6e3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38245e95925sm3162979f8f.111.2024.11.18.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:34:35 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 18 Nov 2024 11:34:29 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
In-Reply-To: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_023438_251722_95C71E19 
X-CRM114-Status: GOOD (  12.10  )
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

The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
multiport controller on eUSB6. All other ports (including USB super-speed
pins) are unused.

Set it up in the device tree together with the NXP PTN3222 repeater.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 39f9d9cdc10d..44942931c18f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -735,6 +735,26 @@ keyboard@3a {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	eusb6_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb6_reset_n>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c8 {
 	clock-frequency = <400000>;
 
@@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	eusb6_reset_n: eusb6-reset-n-state {
+		pins = "gpio184";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	hall_int_n_default: hall-int-n-state {
 		pins = "gpio92";
 		function = "gpio";
@@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
 &usb_1_ss2_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss2_ss_in>;
 };
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_dwc3 {
+	/* Limit to USB 2.0 and single port */
+	maximum-speed = "high-speed";
+	phys = <&usb_mp_hsphy1>;
+	phy-names = "usb2-1";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb6_repeater>;
+
+	status = "okay";
+};

-- 
2.44.2


