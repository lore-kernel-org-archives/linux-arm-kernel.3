Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381B7CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lz6W98GzI/frUrKHDzE5ELN6joCDuBvAObhPSXpDpZc=; b=BAf7Rk/rCtxO22VpiF+yCZkyx/
	3yoyD21rbIW8GdTpts2cPfWPJ17jp11a50SoXAeHHCRiJ7Qn13vJKN4/STx+3OPUZlsT3aul3ts+m
	61pG5EXBFjFq5kE+Q9CISEKIu24Y/Y4somFYzmYv/sQf4E76uoE3lvL6YM/dfwjh1xWcihds3ZPCe
	lhqLgazVXGXJz/0gWQSE20/GICvUaSx8Q4L1s1wYhvofdxRiGN1Ba5VSqakYaq8S15GXYNuelbZs0
	Yfsn/1jhJirQLPtxuahkhFOP1Z4US8nd9KPU8akS8fUqkPXUqtNzvWJvNgISUYw6srR0IFzRMQF5f
	2ykrrXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAEC-0000000Daza-3tGW;
	Wed, 13 Aug 2025 12:05:12 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Dj-0000000DSHP-2idB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:00:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-af8fd1b80e5so1148951766b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082838; x=1755687638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lz6W98GzI/frUrKHDzE5ELN6joCDuBvAObhPSXpDpZc=;
        b=ivOH8QIGk8QxOZdEL+houv1iIbC4tifX+B+JYSq0w9c4a9j8lt7yKubpKQHIscyDn7
         6sNCbtfgZ4tf2v9md8bPq1meG3vYryjM4lkH1e9X1Mv+HSBWmOsu6JOSAPqFhPj0HUrH
         cFl7oFubNTzzbrI/KLxlBXGUWDlThjqIwGXr7fHUx3wwzwNkpunZ44I7U2zl/yezkViN
         KSvNPw/Re43/PcjjmpK0Fb7+Ea5sZn/QutATuUOaVoD00T31wOSh9mdy+68grV4qkoGs
         Fria68UAhE1nIhpsxz15UTO3ugdX69u27N3BOWwq59pJP/cafFh/s1iESagj6vSe2sES
         FPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082838; x=1755687638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lz6W98GzI/frUrKHDzE5ELN6joCDuBvAObhPSXpDpZc=;
        b=xISCu2nBq4f/mzWccVrBbsJxT4qPH/c/z3PZJtAc6uv3SyEfpqVVQKfv2o756rL3YH
         FRdl5nczFJZoR37X4BT86F1Jh2FcUgzY3hWDivakwFNBOR9VKT9hMS8+ohjfO033Nm2H
         ei0GAVO0K1cI3VI8/XIpd1fxivnHZ64AhHDWoiycJpyEn03NDKWWTEG7tEBbA4glUn3I
         AspWxfj5U9vES59XxwvSfCVpJztTINokjSo8dVvV+oKN3SlILDbJp/YHZnLEnGDhq+ni
         iQihOI6faEG3XDQWsn43BmXlPUYOZkKBpTWFwriyrG9Jyb4zdkANwYfWc/UiEOWuwh4t
         O4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV/0HR94FOYLyy2tqoQEZvoZ2dbIUIYJGGuknX8RvL1/m/EIHaCrRyQ/ePZExnC7akeOmDtjIvVC7zzM1xaJtZm@lists.infradead.org
X-Gm-Message-State: AOJu0YzaQJfWI+0np3GxIlX3svGJHISqVxEth1c9aoRdM52J27Y0SjMq
	qyAeMdcdDVTNuIZ1fJyLjwWx/z0hVh/I0IQuNd+i+1QBrxHBQ3+9q2e4
X-Gm-Gg: ASbGncuAClmzoP4+JeCwF+RrHVyg6OEdraCFGz+3srF3wBtXiIKWdejGojP96wcJutS
	Ip7Bwxj0AsCOJQxNl1aoL6Wr2Kfh14qUP0adFswzUgZspogzoyjGMc+SQP+QaJDGR91e666Ulki
	Zn0sJG87RvHxS4oj1vNdGNiCEx1vFwrvlbAWnZNk7N1KwW6crzlDgNjWMRIbjHj2dcN/JinieGN
	Hs0rmDXI0cdSZjxGQtFFEtBsb2/5pPK5+NQYmxdxFPffwHM26lJIxl/knvv5b8XQRhrULFrQkwL
	dK5KholKes3lH1Hd2QNpKR6iMLhn7aEme3DPPFRRgUm2xfrkTTaaNkX9VoSZNQN/xGUJEsJ8WGR
	aZwbjsAvYG8Yw8Ebw1iVp7GphkqEHmZKoNJxXwORSwyXbzQDbReu+hb0rnC5TvRhxUZo+/eAarl
	YKkouI
X-Google-Smtp-Source: AGHT+IH0aqDtVR0VevZ8f2uJ+2//Q9uHHryebJnEAf3vQOeF9yW2TPtt5LjJNUehypu46peYZ5JGzw==
X-Received: by 2002:a17:907:968a:b0:afc:a330:e423 with SMTP id a640c23a62f3a-afca4e434e2mr261368366b.42.1755082837769;
        Wed, 13 Aug 2025 04:00:37 -0700 (PDT)
Received: from tablet.my.domain (ip-31-0-121-4.multi.internet.cyfrowypolsat.pl. [31.0.121.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2377046966b.59.2025.08.13.04.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:00:37 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 13 Aug 2025 13:00:15 +0200
Subject: [PATCH v6 9/9] ARM: dts: bcm11351: Add corresponding bus clocks
 for peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-kona-bus-clock-v6-9-f5a63d4920a4@gmail.com>
References: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
In-Reply-To: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=zuGgg+KtKbX59cmwAVv8C3u2io11Muh9kIrEOlRf3fc=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBonHA+zA3eXsWGpqI/E+S4hxfwR/JJD0yngPm32
 mRlhtef826JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaJxwPgAKCRCzu/ihE6BR
 aIj5D/0cV/FmJu4x3Wi5+fJqoEK/plwBYfi2jRNtUW6oUV6vvYcUkIpOt7FqTvUfOoDEmADjsJo
 hrjjaKSa8GpqgtabK6sVleXRHbOUuiO/k3j0cZH8qO4HL6sH5f2OgisGwzDT5oO+SAhL2UqVhen
 j1z9bwwBgN7y5/xDRmC6ktPuQQX3YBeQ3ipbGhpvCdyc2XCVXKohiIYZKiy7CtKy5wlykh1nmLF
 2w11m7ZbM8HhYXpWTHsBjBKtbfOcRJsroyB4gjhSz4UNBpP7fitkAkwZgVQ5qDjlClhpO9hIXdb
 d2jlGTo2AaJm9Q0DzboPvxpYMsD84YkjaT/zs3cRsXLAilYRE7Z4NxRUylxjNMdLWzx90Bfba10
 hN/BGCuNLwv4l7/AY8FQYuf/1pUbbpuoTQfCI13qr7aLRsA341nMl9iAlaf5c4kfhzKUbJBMZwi
 SUoLZ82ZkN3ggO1qNjVgHuvKnNbTE+4/YNvbOOjMjrXjdBykAb2CR/Jwt+me4kPjVEZTu8+Tljp
 4HgtcmXqjJK9dTx4+7ai5UTs67adDZxeV8CwgOvVAIEnYyclGXWdGhI9P9jnmesLUPidEDwOkMu
 ELA8OZcbKhGtFS7+v9eBL0qrs3h7Wz7b9TfudcNMR1TiBEtnfKwfHzHvQheMGWEgeaSx+XUzbpQ
 pfitsuvC2sGhu9w==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040039_691649_D5FE9A3D 
X-CRM114-Status: GOOD (  12.56  )
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

Following changes in the clock driver, add matching bus clocks for
existing peripheral clocks. Replace the usb_otg_ahb fixed clock with
the real bus clock.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Add this patch (BCM281xx bus clocks)
---
 arch/arm/boot/dts/broadcom/bcm11351.dtsi | 33 ++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm11351.dtsi b/arch/arm/boot/dts/broadcom/bcm11351.dtsi
index 53857e572080d752732c512ed27f942756d59c46..fac5cf5a46bd9a4b7e09a2e65c3e807d1b4ef960 100644
--- a/arch/arm/boot/dts/broadcom/bcm11351.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm11351.dtsi
@@ -233,7 +233,9 @@ aon_ccu: aon_ccu@35002000 {
 			#clock-cells = <1>;
 			clock-output-names = "hub_timer",
 					     "pmu_bsc",
-					     "pmu_bsc_var";
+					     "pmu_bsc_var",
+					     "hub_timer_apb",
+					     "pmu_bsc_apb";
 		};
 
 		master_ccu: master_ccu@3f001000 {
@@ -246,7 +248,14 @@ master_ccu: master_ccu@3f001000 {
 					     "sdio4",
 					     "usb_ic",
 					     "hsic2_48m",
-					     "hsic2_12m";
+					     "hsic2_12m",
+					     "sdio1_ahb",
+					     "sdio2_ahb",
+					     "sdio3_ahb",
+					     "sdio4_ahb",
+					     "usb_ic_ahb",
+					     "hsic2_ahb",
+					     "usb_otg_ahb";
 		};
 
 		slave_ccu: slave_ccu@3e011000 {
@@ -262,7 +271,17 @@ slave_ccu: slave_ccu@3e011000 {
 					     "bsc1",
 					     "bsc2",
 					     "bsc3",
-					     "pwm";
+					     "pwm",
+					     "uartb_apb",
+					     "uartb2_apb",
+					     "uartb3_apb",
+					     "uartb4_apb",
+					     "ssp0_apb",
+					     "ssp2_apb",
+					     "bsc1_apb",
+					     "bsc2_apb",
+					     "bsc3_apb",
+					     "pwm_apb";
 		};
 
 		ref_1m_clk: ref_1m {
@@ -325,12 +344,6 @@ var_52m_clk: var_52m {
 			clock-frequency = <52000000>;
 		};
 
-		usb_otg_ahb_clk: usb_otg_ahb {
-			compatible = "fixed-clock";
-			clock-frequency = <52000000>;
-			#clock-cells = <0>;
-		};
-
 		ref_96m_clk: ref_96m {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
@@ -396,7 +409,7 @@ usbotg: usb@3f120000 {
 		compatible = "snps,dwc2";
 		reg = <0x3f120000 0x10000>;
 		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&usb_otg_ahb_clk>;
+		clocks = <&master_ccu BCM281XX_MASTER_CCU_USB_OTG_AHB>;
 		clock-names = "otg";
 		phys = <&usbphy>;
 		phy-names = "usb2-phy";

-- 
2.50.1


