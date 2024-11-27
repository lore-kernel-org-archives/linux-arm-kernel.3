Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84E7D609D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOjDTz5quesA/57iR2U9/Cgnc4v0qy5hefL79EGSNfA=; b=ReP4ko/GiHOmTIhV1BYzJ9HLMt
	weHh+FkE4nLPWjR/rkR+scHslpPtiBfvLj+AU5V2x8XaLgWJ7DKAbh4Y68MhApSi96qMw1uGQSc3V
	uO1anoOD/VunNIh43GVJKEHPzbLa34anPNZYGt/WkxUAX1/81m6Hs9oNGyEoE7RSvh4hzav1H3h2W
	MtJ3kOlKQGawxpnGUvU0qEQ0AjDWUP5n+R8LDVb9lxVs3rAYLAmBmJ1QfgmR6R6fuILFsKGJv2L8I
	ioXxTVJ0u68zKMzB+GI7fxSAbLdQ7m3ARKEI3Hb+8Euf/eeoA0b8b2b39ztEwDfqUPo/YYJMS/YKv
	2bTW5vuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFyc-0000000Cxzb-3oOJ;
	Wed, 27 Nov 2024 11:12:58 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFnk-0000000Cw2B-1r05
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:01:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so1194090a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705303; x=1733310103; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOjDTz5quesA/57iR2U9/Cgnc4v0qy5hefL79EGSNfA=;
        b=sWRoOyKrFhwvNtaJ9BYR3UmffxfHmB11ZzL7Bsk/jIIz5gIe8lhanrK/Ezpjf9DPg9
         edgXVHzcl/pvujI4nJzszZeRE94pq3nh4P284EOt6NTf/TfuF6J/YRk0xw067XMIQRCd
         Mz78xF0emGSVK3zw8jILAJyAJ0sAw5qYdnaWqtymQH6xPonD25dvE/U6Iyo0a22NuArz
         wVZj0NRTeAmf3n7xo7URhsU39UAV6F0L3GreERHC19dwGjIY2HFHattFeDk6HJMfbqV7
         Zusn9Ye5QaqR7T+EYT9yEJ90+GhIsinTMohVs7QF6aGyuQpjgDOeADrNOn3Eem38UqMs
         3jRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705303; x=1733310103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOjDTz5quesA/57iR2U9/Cgnc4v0qy5hefL79EGSNfA=;
        b=d5NaB2+GijG2iNkLtuHhSwYpkE7WLRt9HOFxqdb9BKkRYfQum6K833YDOkwc2muvul
         Z9UkNt5hbKT/AGHVBmKkWy1sFZvPN9BjtWVhFQhvCgq1qoFx6KXr7N3XxF8SvjkOLcKN
         VadE+cW+JFCyy4vRbH8fwNtUH6QjMbmk9+zUX6ijhHkKNLux1dvfkUaJragZDfP7zS7A
         c6NRiY8vMPfeRRJfgYmhx9pubuThwyjoi/jbRX79keGTInL6yt/f8mJfQNQIb6IuErRH
         VUXDm8lTmqpvfME0PVCAY3e+gLsmSgL/j82QAFRrsTqnMGXRs0m64ZkJ4baD6swlTyG8
         4vMA==
X-Forwarded-Encrypted: i=1; AJvYcCU9mBUHMjxaKMWb3bxYH+rAcyUAHSQcQN3QK/biKEZr+fiuWcXWxG+frhutJTjb4x1eMpKKXtkH8HLuvi2/cgll@lists.infradead.org
X-Gm-Message-State: AOJu0YzygmBf3XVm6Yv/ffOp2XtPCBl2YQ6I2gyjQHuvv8o+KNKhRpXP
	7gqbTzBur6SbU2+nfsdjcRodVUCzSHMnxUtD3xFxbKtu9y8BweUKp3B0dmrkSt8=
X-Gm-Gg: ASbGncv5DSMC6hvi2A//d+s13CZjXecBHppDbrUEgNFDOYyasrhtlYFhqAftvzeO+gE
	qbDK5yayrC1pH4OBcZqofbDqjb0QEecqYP4uiEux36sZAlkPbaz7tXCQdhonGltZ8pNG2j8qG5f
	eNGtHn5BRGQ5rPfz9fylqcibtFgEz737FL5d8hr1Rg/axstW/gnsC+g/zaewD2+TiQ7oWmXUgzk
	pxvPHiMQ/u+4PydRx8juSeWviWYCZnDxFyTjWvHjh1FAajYrIUgf7tLyiArMoXxZa4ZC5/Cp3O6
	X0C8uDCVulrOO/9uMQk6u11Ev7GSBGtcOg==
X-Google-Smtp-Source: AGHT+IHB5KUzcTjH16njBBTQ0xCVSadda6wBBW1QR/hMzlosFVnEKcI8ZmV5cmxHoXIIbnCGjXeWgg==
X-Received: by 2002:a17:906:318b:b0:aa5:1cdf:7bfd with SMTP id a640c23a62f3a-aa57fa99a0fmr256898166b.7.1732705302951;
        Wed, 27 Nov 2024 03:01:42 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:42 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:42 +0000
Subject: [PATCH 4/6] arm64: dts: exynos: gs101: enable
 snps,dis_rxdet_inp3_quirk for DWC3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-4-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_030144_477622_D1554690 
X-CRM114-Status: UNSURE (   9.33  )
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

This is required for the DWC3 core to reliably detect the connected
phy's Vbus state.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 18d4e7852a1a..ab016fe9b99a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1302,6 +1302,7 @@ usbdrd31_dwc3: usb@0 {
 				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
 				phys = <&usbdrd31_phy 0>, <&usbdrd31_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis_rxdet_inp3_quirk;
 				status = "disabled";
 			};
 		};

-- 
2.47.0.338.g60cca15819-goog


