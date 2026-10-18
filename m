Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A13CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 06:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAzlFpqY4S6yZH2P6UFaqiaYlK+IGKYJ1tKXbKgsXps=; b=ScJuuUU6d0Ii4d3pnH23Z0LXHT
	67rY0jpO3IyBWQuDYxoLiOCGhFf0Bt1YX4KAOcFh2mSXH5aAyxSFzsZNR3ijJrYL+ApmNxrbeE+6h
	MBM5ihp0/EPQlb98CM+URLwWYTDKJuerdBWPzJfS8obDGqOBujkF97SqRkfnMRcpJS8zBcxy3GopL
	T/5CnFIlYPA1JLmds5+09gbG528CebnSIGv2YiZB8oCTu1/D0DwtQNwFWI6Hx2nGyMysKBv834nbw
	RbQYD93WNOnqGiigw9pUY2nVYhdxNM+7M+lGUMHlmlwM3JyZJf16AONNBz6f6NG8XaFnPTWgorfBV
	SnH9zwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKVE-00000005d14-3tTT;
	Sun, 18 Oct 2026 06:36:16 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKV9-00000005cyM-0kf8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 06:36:12 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so404599a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 23:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792305370; x=1792910170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAzlFpqY4S6yZH2P6UFaqiaYlK+IGKYJ1tKXbKgsXps=;
        b=GfCOlujKFnPGre/UM4gG9etn4i9MxwfdghC96qk9uG+3528H5pBfgTm+K0tXZk4EEm
         e9Y4/kA7q5GIbe1Ux0xQEYTSvxluIjtJoH5AVHoMQj+3Yj44HtN8BGxBQgoa6zcQN1X3
         XgS4wvlbz3+BiEqb/05h5qaAuV7k7cOdQEYeh7YG3Lp0uQdzdsrx35tL8Zxxp3LSffDf
         2yucwGyndV7G2EhvLaw4FuH+v6MCdXe7VHmfJ2DgxEJv8T3Q7F9OVMwRcxq2JK7epXtN
         BjIupnkujvGwyP32b/bHIQev8j3Y2nDE279ECP9KFixElYOf37bTA/gcJvptCihmTYsB
         BJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792305370; x=1792910170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAzlFpqY4S6yZH2P6UFaqiaYlK+IGKYJ1tKXbKgsXps=;
        b=woQmAiivKl6fUGKDZIAT0TR99ikiuMKTkwFDVVKTgwdZ0AboV6+DjuP+t1r2ISK/EQ
         hRTF/DnMrbE6m1EhmzR33nf5FjhZF6u4Sx+Ep43GN63XvHkn0rQ2bz9+8Q2BiO9VAfQW
         Pm8bMtZ/E1GmKGrLs6MRZ6T8Wf13C9sGOqeTK6l60PlQrfEysRQG7N7PFu2TCyGPXY+0
         e6xXb8HvvYIiG9kJbz+pZmbgWtwPNwNGq6uEjNC7qHLRLmy/Xi5Z+qNftpCgSiK226E+
         Piz8HYUlmwh0qSyBNByZtth519r55ryMFduGPxRqZi92Mqmend6KADHbNrcprftwTm5/
         Aq+A==
X-Forwarded-Encrypted: i=1; AKwUvBzHbU92seChqiGXzfh+htmAJoPvC9cveBxB5uIU2N+kqatRhYXCb9c/Tep1fL02pL+Lxqfr/7mZg43s301zEe1v@lists.infradead.org
X-Gm-Message-State: AFq9FYKz2rg1LpWBZp7NmzB9NszpwyoxC51GhZwvyCz43ZMgPHwJSI5/
	FahhjzPtpzetlh/UHHxHYvwc+CBTsc74A4ElBuS97J6T6fpFbjo605gJpKeSfapo
X-Gm-Gg: AYBFou2phGlE7DVpfYsNC2tCCTzWQcjWhg+28mHZ/EiY63sJqpTkPV4aoVSWD63H/Rk
	5XlBU+/RjXJa24ZAyw2gzOmPGU/egLEZ+xcA7WV4IOVUVGD3/gmPDig5QtkRw+Fpf6+Q+OAy5yo
	qFUu5TJiFX9L41+jMkteOFvwWgnqqBuX+eFwRyTeymzuUIzD388vEoKO3Ok2WLDfsDOCOCpkEuG
	jSU327rhZbRn8esX09RY5lLg6IE4m4j5hRjupT5JRxIYcsFqp3MkAct238czczyFWIN1mOYjlpE
	h3uzYVFpUBZ3G57c7EmNmUGZVskHv23qtstvHId3F/mZA/J4lkUq5/pZWTjzxrZyrEY9+echzUX
	9pHVhOpiSV+Eqqy6MjhNYoKzA9VIWRj3nzKgh/aEpYcg0HsKiwNl7/BAMeI0Msca30YqrFcxUql
	jZ1uI0kUHsAaKC8oNySisepQcZqr2+0ysoCqJBEIqFj9jswAE/MUs9GYKhi4I6482xDHn3K6chK
	zQCAdcjAKFyhBoSHQ==
X-Received: by 2002:a05:6a00:2e1c:b0:899:55e9:880b with SMTP id d2e1a72fcca58-8a04be570ffmr3463065b3a.14.1792305370295;
        Sat, 17 Oct 2026 23:36:10 -0700 (PDT)
Received: from [127.0.1.1] (2403-580b-35b2-8--43b.ip6.aussiebb.net. [2403:580b:35b2:8::43b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57653ea9sm2718874b3a.32.2026.10.17.23.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:36:09 -0700 (PDT)
From: Kel Modderman <kelvmod@gmail.com>
Date: Sun, 18 Oct 2026 16:35:31 +1000
Subject: [PATCH 2/2] arm64: dts: rockchip: Add headphone amplifier to
 Orange Pi 5 Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-opi5pro-amp-v1-2-05c84e91bf6d@gmail.com>
References: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
In-Reply-To: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Dennis Gilmore <dennis@ausil.us>, Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kel Modderman <kelvmod@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_233611_349645_B6B1E6C6 
X-CRM114-Status: GOOD (  11.38  )
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

The Orange Pi 5 Pro routes the ES8388 LOUT1/ROUT1 to the headphone jack
through an amplifier enabled by GPIO4_B5. Without it the jack is silent
apart from faint leakage on signal peaks.

Describe the amplifier as a simple-audio-amplifier aux device and route
the headphone path through it.

Fixes: f47af8ebbe53 ("arm64: dts: rockchip: Add Orange Pi 5 Pro board support")
Signed-off-by: Kel Modderman <kelvmod@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts    | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
index 783675337a..f5e43dfe1e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
@@ -18,13 +18,16 @@ analog-sound {
 		compatible = "simple-audio-card";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
+		simple-audio-card,aux-devs = <&headphone_amp>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,name = "rockchip,es8388";
 		simple-audio-card,routing =
-			"Headphones", "LOUT1",
-			"Headphones", "ROUT1",
+			"Headphones", "Headphones Amp OUTL",
+			"Headphones", "Headphones Amp OUTR",
+			"Headphones Amp INL", "LOUT1",
+			"Headphones Amp INR", "ROUT1",
 			"LINPUT1", "Microphone Jack",
 			"RINPUT1", "Microphone Jack",
 			"LINPUT2", "Onboard Microphone",
@@ -44,6 +47,14 @@ simple-audio-card,codec {
 		};
 	};
 
+	headphone_amp: headphone-amp {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&headphone_amp_en>;
+		sound-name-prefix = "Headphones Amp";
+	};
+
 	pwm-leds {
 		compatible = "pwm-leds";
 
@@ -233,6 +244,12 @@ pcie2_2_rst: pcie2-2-rst {
 		};
 	};
 
+	sound {
+		headphone_amp_en: headphone-amp-en {
+			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		vcc5v0_otg_en: vcc5v0-otg-en {
 			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;

-- 
2.55.0


