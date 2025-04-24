Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9108C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlI4MSNJQrAzEP1cSUjdjx1DigpO/B9fZ6xgtIKJgwY=; b=hTOVb9s5BnQJn0MkERVQKE5Ac0
	9lXnbtd9Vgc7iMjzJmKPxF1s+JdWTbayloN6rflkubUbjlL0wjm70VMaCA47qqytb0VU2kvOzpqFA
	F7ocNLYUtbbbcAj/sZGPxJ7f1nPuns2tqphECxWJW70eNyNN9SOTuxrJSOXaeoB5QcTcCrRe98w7+
	n4vPkuATJJej+yu6EpWIWrizdRTWimj2r62CENmmCZdmyLkl/6P8AyWoFh23IIfDyUuHxydHvAWjj
	dl1Z6Gh6Q/HGBFCGv2AXHA2Aek8BW1nxJWbqK6q2y1xnnECcV1v3PK7CAvfhC1irpHBVkHgl6CTlr
	k4b+apTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t6I-0000000DXyS-2De2;
	Thu, 24 Apr 2025 09:42:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sFg-0000000DOtB-1Jbe
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XlI4MSNJQrAzEP1cSUjdjx1DigpO/B9fZ6xgtIKJgwY=; b=EdmUzrovz6l7uZeTRNNoyFt5hB
	DdcW9JnWn1rM1vGRcUWLHVrC3MllENKziYD5sGvwGPbH4r11OwiUfZEvQFoMQAf3dtDhIjV7p+W6V
	eY7Ob3KHZwFIlB0ASQEWYdpqL9x7w+Vl6pFjJMOikJvtHxQ1WoqSD5sGQp+76qgPkBEnjmqkfmlV8
	HfvwasPlRv7dcIPPF54tGqNN4G5yCqWNrqcCvnZFQaI6gOGh+EGstonwKpvi6iayTJfsMKwQku2vP
	aHiQ4PKztDwJY2QSo7+OM6kXqjZJkXWoEkCKVx8jaJMUPxIdID7qD/CzQK0LNqMtO4zOGne47v/xi
	1MRNpAQQ==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sFd-0000000Bdth-1BMB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:48:11 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e616736458so80436a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484487; x=1746089287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlI4MSNJQrAzEP1cSUjdjx1DigpO/B9fZ6xgtIKJgwY=;
        b=QOIqkQCcE2J7klgDXX3dkPikyDixdoMM7Br6noE777B7wsuUBqMe0Isr0BJHEzZEu/
         +BGsA03hAmM1oqnfAkSq6rk03IlVFxjfPgDyDIGrcrlpPSG6Tv7D/PmndsTjqQCQDEf8
         NozcE0JBYBqHmPRPMX6pZ8DwyybIXrWYjHEQzRXKcj7fTiREMGnsFbS8ph9knXmT6WFu
         lav/lZEF0rT3yzdd+a41h6jWNsDxsZ3EdLIBjGy1ZyvC+T61VmP3tk+CuzOUsyXL90Sd
         ezxeIkUerpQW7TGEMGFtGWbbkp00IDepHtdt4Daw1h9Mebjq5w+v0FipLbFK8wlYESLh
         LtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484487; x=1746089287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlI4MSNJQrAzEP1cSUjdjx1DigpO/B9fZ6xgtIKJgwY=;
        b=PAS3VMw/C4l/Zu85cZ+bcFzVcn00qIFOFyL7DI4MMZMavbHaWM4hCysiWN58bpTeol
         /QMkHwgyMmQL0vDyBesQz4JUM/BmBUdJ0goETLUPzRPtTSBgemb/c8XOkytN58Iyw5Pi
         xvOjQe/MoWsXm4ZCwrgbqPGxMFm7COTNJpLC2dr9nP/rg7m8sHBxG39hUDC+Vc0BUg2X
         iy0/ekCzVyFhvH5Q+6B4G3MCMsLCvOmN4lzRidmT6kIM02gKbbqfs1/W/bQvet/HBHQ4
         wQ07VmGtS5+84HaaaNfrWv5Hl66dVCVcc1gNiPxCxn2WWKlJ/VVFg+tbdJbMbfPoJi/f
         Jw1A==
X-Forwarded-Encrypted: i=1; AJvYcCV+AFWikOB6y45KRS1s6ncEwAE9UyjT3+zN7mmO3r4gn4HW5aTmL/X/k0jmoyLbtydUMj5qPjYOMi/XrwyKgviF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt7cDfH1eWQjdl45vKo+yKiLh/W6FhAqZLN3T+qzVFak6BWclr
	3qqM4Crhbg6oqw7pDE/k/q3YmwOTbd+CO2VdgdBYt/bsvwj5wUUNcCM/sSoYzsY=
X-Gm-Gg: ASbGncvudgwQGEX75IHwsJLdsGytBwfaaPd2qrBJchwytCH3hzWLs4Wp/nkzI1LNRal
	rUqBRnqBRtpvu+6u6JgxLFds28/lLGPeOFKuUMVkks495M96y7TU2WGLTjhph9i0+YrTgsYJtwW
	W4+1BD1O4AH71BJ6QskBYYldetc8ipE9Yh6RfvzXKhCklQNN7JcfDiNUdKsa3SfnN1RgwxQK1A4
	9uBf0dREvUIsevgL6sMAbKDcfWRPPBuPlbea8pozAbj6rLeu7NSoO1C9FzKdECwUbbqGHMLNXvb
	KoeTpdULue6J+WLkhBak7ENrSDFf8cwsEVRSoVFJavD54XCctA==
X-Google-Smtp-Source: AGHT+IG88LOYVsDqLk364RnZfDnVj+T3Ptml8aT8MgM2ZSYv7HiItMyaObLOH5qjcMxgbUE4cd3WrQ==
X-Received: by 2002:a05:6402:1d48:b0:5f6:d491:20ca with SMTP id 4fb4d7f45d1cf-5f6ddcf7f3bmr612417a12.2.1745484487068;
        Thu, 24 Apr 2025 01:48:07 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6f45fd3c1sm118998a12.3.2025.04.24.01.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:48:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@dh-electronics.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: nxp: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:48:00 +0200
Message-ID: <20250424084800.105300-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
References: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094809_427256_C5C72D78 
X-CRM114-Status: GOOD (  11.28  )
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

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  imx7d-remarkable2.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
index fbe260c9872e..cad985e341a1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
@@ -384,7 +384,7 @@ &usdhc2 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
index eec526a96311..ff9d50942884 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
@@ -374,7 +374,7 @@ &usdhc2 {
 	cap-power-off-card;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi
index 2c52e67e5c14..a6903ef2b093 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi
@@ -299,7 +299,7 @@ &ssp1 {
 	keep-power-in-suspend;
 	status = "okay";
 
-	wlan@1 {
+	wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
-- 
2.45.2


