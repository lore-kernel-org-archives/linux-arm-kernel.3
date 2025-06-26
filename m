Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6F7C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBJ7OED84IgzfwVu3bE+rwCJsn8ySsLoxBG0PUK666c=; b=W1EvM5rS9e7DxIu7iQD5ljCgNU
	Xnr8P1v7AWwJYTkNq6ewcwnhkClBtjG9RWQpVTni0X9Wj+yRfbyxYCDg4QJvbgGKCjHJ95a6lMzoO
	2MHMVgmMao+es5VJFoPNQPpzaA7yW/WxLxSe4i0/TCpoMYSsUNWOYbSIBjHnjdHLX6wmg6p7ZkOGz
	fLC7dpcM50Bif4I9qUqL1QHgLLv1viBo8DdZihIEWcvMJ7Ag205QGCz19z9PP6dEktbdK6OoIAkYZ
	zUr6KzHQft7UqaqZWAX8g38Ch2hRoe7RHCL57g5MS+z0yaPjVFkIQw59Ut9wbALe9RkJaQIR8trzU
	JPqMcK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnPI-0000000Bt7l-0LiM;
	Thu, 26 Jun 2025 14:16:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnDv-0000000Br2f-2exs;
	Thu, 26 Jun 2025 14:05:08 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae0c571f137so241781466b.0;
        Thu, 26 Jun 2025 07:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946706; x=1751551506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBJ7OED84IgzfwVu3bE+rwCJsn8ySsLoxBG0PUK666c=;
        b=hzw4hvnxP5SvmT9ed3vEg7+H7ADzjf1VIfthAccfAFxha0LYPmUAr0hhOuAieDM3GG
         tDtrK3H5pnP45lSLEUpt2Uv867L7ukSnfhzAjSuwQYgl+djjY1onfPUWs6ZM8BvXb8cm
         lswWbeFofd1ynLy62idTgxw6iHys+Dt7apFi+K80wVng1L7AMKuFnMFY1aJFIaUy6nID
         OFjTXoOAT6UpLyd/G6Ivmy1gFTYurJNtLqU6dh8layPBPg0jYFwAy2yiRZ1m4u/GERrQ
         sCKrd+akH12jn398zZZD/FzJys1Ghtn7nb9SsPLT+ZioO13we+nh1PfJmW6VuxdYXUT8
         slCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946706; x=1751551506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBJ7OED84IgzfwVu3bE+rwCJsn8ySsLoxBG0PUK666c=;
        b=eAERUEUdpiU1R6x+n40nI2SMTGTkw7To2mybS6p6E/AXyOpSlk2MS6mKzZC3TNJXMR
         nB1/PnJyXmvsPXFmKidvGBzPqfw9A/XEdKk9EYkXI99Ti3+oN7qbVfkN2a1iS8KtP2xu
         vfIPZoYtqmSecnNun80IgcxWEkOv3MOpxN0PBBcHPhS402HLLe45Fn1W6qWvrXLCPGQU
         C0sljUhNI6ywpYdRDdpnCrMrhlrWxZ6v7NHL4nC9zyq8ICARFQn/wUqdRvIyDIExi+6B
         a9Rjr3nDBGX58BwXqQ4rldIon0vEOkQ4oIVHl1Y+/uyVIGCLJEz2unEehemzis3kQyU4
         Aw5g==
X-Forwarded-Encrypted: i=1; AJvYcCWmjP0G0GNfEiNgCRWXM26Etk98hNXCCfbeAV7EgbV33AQBtqZZlUWvNoncPuUv7wJv3y5MfGWG1mhpSBSVfjjn@lists.infradead.org
X-Gm-Message-State: AOJu0YzD/xy2KyAj3T/xdQg/YOAlbWV3oXdrTFD0ZHqjioZyPe0wcBzU
	VFr/f/DcHVBhu6YgkZJ8WP5tUMc71VCFBbr5HExFW1TQ6hG+4eMbU7r0Yb3zrsPkjGYUcQ==
X-Gm-Gg: ASbGncuvrXlu20LeLcLk7pFNkSldrMzwnnTyq0F/cMefPIxIIdIATl5Pr/mwhRH7Pre
	L/QEADRXn2bmCTcwCt/w9Z2WO83u0e5rIb1g+ysMd9tGsHgNM5vQqvINuJbmP2kL1FI8KuFe2fv
	h9zYgonH7UX1xZcswhoW9gT2leUddYkyaEa8U5MVOx+n/QEvMo+pI9fLpYGH1j3FHcE/+s2FvvE
	NMQE7S5B6b+90WoFPwamjLMuznsdRCsNQ8xqO2kpgrlLHcvwOmB1AthmXog7WNnz9uA7uXnP4sV
	SO7e3Rxrass0DpYNAOrm2GaHfJ00tatV6fYWuroUBsL3aQWz4RuM278Cuhk8ZYrhzPQyfdLBDVU
	Ls/5PzsuAf/mbOVSJv+4I8w==
X-Google-Smtp-Source: AGHT+IFd80UBJ9vtN/l6OUaJDHUD3BJNY6g8XS2+oodfwuAVCEg0kkWD1KQ9A4HIdysep3bsRoIuoA==
X-Received: by 2002:a17:907:724f:b0:ae0:b7c8:d735 with SMTP id a640c23a62f3a-ae0d0d15a2dmr422647466b.42.1750946703732;
        Thu, 26 Jun 2025 07:05:03 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:05:03 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 5/5] arm64: dts: rockchip: add Khadas MCU and fan control nodes
Date: Thu, 26 Jun 2025 17:04:32 +0300
Message-ID: <27d9dccb3eb8723a524950f9dc6e78b7f99d46c5.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746518265.git.efectn@protonmail.com>
References: <cover.1746518265.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_070507_673582_85BAB0D3 
X-CRM114-Status: UNSURE (   9.90  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add Khadas MCU fan control to Khadas Edge 2 with 4 fan control levels.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 .../dts/rockchip/rk3588s-khadas-edge2.dts     | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 2c22abaf4..60766c896 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -271,12 +271,71 @@ hym8563: rtc@51 {
 		clock-output-names = "hym8563";
 		wakeup-source;
 	};
+
+	khadas_mcu: system-controller@18 {
+		compatible = "khadas,mcu";
+		reg = <0x18>;
+		cooling-levels = <0 50 72 100>;
+		#cooling-cells = <2>;
+	};
 };
 
 &i2s5_8ch {
 	status = "okay";
 };
 
+&package_thermal {
+	polling-delay = <2000>;
+
+	trips {
+		package_fan0: package-fan0 {
+			temperature = <50000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			temperature = <60000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+
+		package_fan2: package-fan2 {
+			temperature = <65000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+
+		package_fan3: package-fan3 {
+			temperature = <75000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&package_fan0>;
+			cooling-device = <&khadas_mcu THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_fan1>;
+			cooling-device = <&khadas_mcu 1 2>;
+		};
+
+		map2 {
+			trip = <&package_fan2>;
+			cooling-device = <&khadas_mcu 2 3>;
+		};
+
+		map3 {
+			trip = <&package_fan3>;
+			cooling-device = <&khadas_mcu 3 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
-- 
2.49.0


