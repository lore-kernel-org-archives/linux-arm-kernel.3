Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43907E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 21:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuEfX3Ewgynh74qzGhwC9wGI75Nk7P15rmSnoDhYmYY=; b=YjAjWyKwKUKoE42DIbS4peY9es
	hyOLPLi2x5MRlOSX5hicTtlkNzutd0FiFOu/dV7hXNlrH4KcIbJQ+08K4yqTnUs8iaH+Ns7MyNNcN
	rGoyHsTl8R7r8/in8kX/ds9cLetpmPGFKpeD73U4dcCpEKVp52xV+cyc7Hv5wFxyQSuLuG0g3/2K8
	uG+AKF68iFlTB+XX9FWT/bI+QCLMc/N1ubl4cFahMytOgELqUpYkNgMlNaVSZT8UJY0k6CkFywpO4
	gEHbXFAtevW+wwZXkvLadkGOW9VyGZVaucxzEqudFQMkxzIm/LWG3pU05P5rJlxA6Ylpl3uOerTSh
	FvI0Jytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHsP-00000000yM7-0krj;
	Fri, 27 Dec 2024 21:28:09 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHq3-00000000xs0-0djD;
	Fri, 27 Dec 2024 21:25:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so13479041a12.2;
        Fri, 27 Dec 2024 13:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735334740; x=1735939540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuEfX3Ewgynh74qzGhwC9wGI75Nk7P15rmSnoDhYmYY=;
        b=QEjvQ8GsAf6i9XCY2LZzhZSNrKw/SKM0pirwX01yxgrr6frt//c+//RWLtOLKExYed
         U4Pu2OkmxOzi54uX5LjNlto//tSjtZzFKrTiBBfEs9yx2JeAsWLHn7+nnHP9q+GS4Qpa
         L7hLIjQV/Bw1B1XuL0XcyUniSsPrHLzVLpOYAtpY8WYdoqec6T0D1UQSpXzyMWXYzase
         lKNAne5sgSYVMPsplsocjQNS3hICfCuPyUO6ILgy7m90p31WFdeFr28PdI1F0+wDi4z5
         /XudzTu6lXkFAA31JyQF849hp04QYvTtjhdiWuzBKjCVNuKNDgqaBDXWVCtxVnyPIHOo
         DAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735334740; x=1735939540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuEfX3Ewgynh74qzGhwC9wGI75Nk7P15rmSnoDhYmYY=;
        b=ppraZMXm+9jyz5+rAi0FetUAP5t8ngQ33RiV4N4ZimRp8BWCQuLIWkpNs4v5f1CWQ+
         lUQXYQG4CcqJjkVceZwYpRRX5gcOQBPpKrugIU4+UE4OY5Wknrm3g1OIJsJtZ18HrLz2
         wKZoqjn51RwrgVCxu8VtH3xROW5Vze7fbA6bh1D0HWCKbwxZL8lklRGMTkKc4ixe9obb
         71x7PtODtVZo2CMLEzUafRnJii1Ml5Z39RrpbGzpy1qADvqKktC3PfweRXenRcyUfOFH
         GhDWYH0JWzZOpI79p6MvhWdEHlcudrAMkF2/M2VZfl5fAc6YUFGAKOL93wXGpExfRlPZ
         NZOg==
X-Gm-Message-State: AOJu0Yw6KZmMjN7G6SoIjfQq0bDwueF+0URkj42vo6y9QwjHymuYl5DM
	demfdclHUymRElAgsuGPs9ii/o+ifMlJURpLSrpvhXUSaZK4Kzi5k3SHsA==
X-Gm-Gg: ASbGncu4h8IxLIEGaxGIf27ij96siIovtOWmXFnJaowr7CUb2hSTqpEjBMIpY0cduUK
	/H1GE0Cpr9jfv5lLXg7+XkxsGDFRl6KtaEDf+5wqhLThNPKc51l3XZwI0uGHOuhXhg6/wRHRx34
	2DBtogGTvuHm/rCuxf6rwYsTqHZ1B8KpFr2qrywrV3ZrwZbf09QydIhydRANbtpvyIa837kmzUb
	rNvrSW/aFLV8+StdV5uatsK1HcSuZDY92Iaf8dhmvzPx8ydIGAvJAG9k5X3Ea3T1wsz6+TCA7M+
	XZnazwt0tbfFCGwyghi432KuuqgF5sxS0hUlI5/FV+EMPmhsQmwlyPrRzBXZZD2sz2ztHuJgytZ
	KSLMn6exvNY8mV7Z7G6D7d5OZPg==
X-Google-Smtp-Source: AGHT+IGIRdqN3NMSeNKnzm+t5nflmyeCDYFa8M6A9qcMMvGFit5klKIhBrwkQezskzj/4W8YueNKig==
X-Received: by 2002:a05:6402:5109:b0:5d3:e766:6140 with SMTP id 4fb4d7f45d1cf-5d81de22cb7mr23864338a12.24.1735334740432;
        Fri, 27 Dec 2024 13:25:40 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b2be-ba00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b2be:ba00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbc5sm11627950a12.60.2024.12.27.13.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 13:25:38 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/5] ARM: dts: amlogic: meson8: switch to the new PWM controller binding
Date: Fri, 27 Dec 2024 22:25:10 +0100
Message-ID: <20241227212514.1376682-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_132543_194041_FB859E6D 
X-CRM114-Status: GOOD (  11.27  )
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

Use the new PWM controller binding which now relies on passing all
clock inputs available on the SoC (instead of passing the "wanted"
clock input for a given board).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 9ff142d9fe3f..847f7b1f1e96 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -449,7 +449,11 @@ analog_top: analog-top@81a8 {
 	};
 
 	pwm_ef: pwm@86c0 {
-		compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+		compatible = "amlogic,meson8-pwm-v2";
+		clocks = <&xtal>,
+			 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+			 <&clkc CLKID_FCLK_DIV4>,
+			 <&clkc CLKID_FCLK_DIV3>;
 		reg = <0x86c0 0x10>;
 		#pwm-cells = <3>;
 		status = "disabled";
@@ -699,11 +703,19 @@ timer@600 {
 };
 
 &pwm_ab {
-	compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+	compatible = "amlogic,meson8-pwm-v2";
+	clocks = <&xtal>,
+		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &pwm_cd {
-	compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+	compatible = "amlogic,meson8-pwm-v2";
+	clocks = <&xtal>,
+		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &rtc {
-- 
2.47.1


