Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA889D31A2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbpaa7L+YJuoLVfHbsYDx/DJv0PXVpPmjwlFSpBUWBI=; b=EHjIL91KPDV1hv8x5fGvsSHov5
	FXCnVNl1WX9hvZYPn4yZzAN5nWOlr9wPKooCn6N5FlMfBizhS05224l02/a9USyNjd2QgNfr2s0oR
	mAefa/AOucvkZm4h1ilgKzPFGRYN6c+/qUcvQhBp1lbf4poRPpCP8n/Vy+gKLhJzIIilAwq3yTr5s
	q9ZEdmQ/oEdAY29ZlBcZCRFikfpKeYUrdDMrrnXZ4NgoYKMzE+MjSd7OYASADEdTBteUBpHU+j/DF
	4YPQhiBiClRfu2/FKG1f3ZAhw1uIAbX4d54WHB8Nlsn7oBfhcZlOnG+drHaKwOU8M/LsoDQC6dVxa
	mglXQQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwh0-00000008QcW-2cHb;
	Wed, 14 Jan 2026 08:57:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwgx-00000008QZN-2MRQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:57:28 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso38450025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768381046; x=1768985846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbpaa7L+YJuoLVfHbsYDx/DJv0PXVpPmjwlFSpBUWBI=;
        b=uvQ53ewXftY7fi222SIGBndUvcROi23Z/AX/hO1kW/WsQQ82J9Uc5Hu/mQM3qOKgry
         b4yO7DYs9mlsa4YzujLqSOU4txaDCrJmuk9F3WyQC5ME2eAbpKxA99C7vQwANeQDsZqO
         sRCALNAyJrVCISN/Wx97Ea/tMN586hxCLc4Q50EnBihSVF5q1wpbBiTDJjR4SoUg8Mb6
         2ptj+VTLFZ6B4yLuAWE/9nVOFGMCb5mfIHJJG8y6X1u/pkWRdugEk/irLjxbXTFV/zl/
         70S/J4l2gPcawZjE5F0Vt5J3YPV4gQryvwD071qGETBu3vbYn+x7mH9ZVsEHEtAwnVWp
         /CeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381046; x=1768985846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mbpaa7L+YJuoLVfHbsYDx/DJv0PXVpPmjwlFSpBUWBI=;
        b=epGAwNQXV4gvUsb028/C0LvvwJlSeKZamAt6PFv9XD1Bxlu3DBRXOlEAX/jxma57Kx
         6OI+8/3QGIkNtIuYlcraIpWWzOFrrgPkXVLWzF3b+saZEHbisD0B55Pm78m/e3mZuXWY
         5tECS0WY1WQb2DM8A9lv3+lUuVNdeWJNP35m3zDTEyzptACPa46vHtZZDm3tn5SHd0QY
         2BzR5Qz+J4ropXrgW7GexE5FSWUSn2KdWHCTd1OS0UPvGvaFfuFI5EnTLcP0ZwXhTnFO
         A3fIEobGtYs6PzVl0n3W7AOEr0Z86qGs7vzS1A3FnMZqWx7Fm1tTPSb3e4E6gGorYECI
         ULMw==
X-Forwarded-Encrypted: i=1; AJvYcCU/g2s+K5mAWdysW48MnofdlMKwSMcl43jcZZA57K6TTjJZG2mnOqVvz+T4sSh4YlfO6KY5u+lPryJlD6OC928j@lists.infradead.org
X-Gm-Message-State: AOJu0YxpipWbxy7q+Rcu2gXayEkInHKQR8KXt2J2Osu7FWTN7gBCcBVp
	VwSYbJkh8YYofjQeS4J7X1zEaeABUCyp5Yqu7VTWKHV14XHtdsYmlJ26J5IPnhZpRu8=
X-Gm-Gg: AY/fxX54JjnrFBUJxs1kDj8qJQ4WKNpEJ/mDmYF6WU1jTMEn7We5s9bE0Bt8NVs752V
	nyGhSWsl0ll3lSDj8YkP8F4u2XpD9W63OXgZz8kNttPzeDzjaMjJjevNlLpE/iAkAG+cdIwNLEK
	LDpUmyJIOP6kEoC1V+KHg4yDKv41EzRqWUMX0PwasSAadNqHATZ4tc4A3RzvVXrmxSdy8Q582pD
	7fw+3uamVomLpi9ofAl8cIsIXZX40eSVt4+iSLHHe4PPUShWCV2iEzLKEbW2RJ7j00lpqJbPuMN
	rHRc4LuWRZseNc0Y07h10wJC0Wvj/GiQTM8qUlDzpNtYyqM2+AlK+OEMkTgjRiAtkEqyLLGLcxo
	iRgLgwkjDf6Oqs0SCSilpgUTKVdu/dVqr6MWCcvhIeQfe7tqqXbhzEf576Wdr/Q9g39XxVH15z9
	kt72EJ+NfB2Q==
X-Received: by 2002:a05:6000:220e:b0:432:84f9:95f4 with SMTP id ffacd0b85a97d-4342d5ff890mr1552392f8f.31.1768381045966;
        Wed, 14 Jan 2026 00:57:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:db84:c9f1:21bc:dca1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0dacc5sm48674680f8f.5.2026.01.14.00.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:57:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 09:56:54 +0100
Subject: [PATCH v2 2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-s4-mmc-fixup-v2-2-7e9ab5f12286@baylibre.com>
References: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=r6xTJIIhs4KBJzOofj3YmS5sCR9M9eszyosDM0nO4jw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ1prUpxsKi9it/0m/bgAZT2A9oFBRfTID+V7Y
 cqqmzLwYT+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdaawAKCRDm/A8cN/La
 hdljEACH5P/J/ngeUurRcWIgGvlXQgv9J6Z77okYA6+NAN7TREISt7XGVzQHQUysSUKZaetZBBq
 pz0op8r7Ia8KK4DwPhjc1BW/5e3mw4yciOAsZBwK93wMomVOa2ZjnlLjzd9LgU6NUEW9vC5QqsW
 Qw+rM5L0Z8yRL8lOJjAqncw9Od2gR+h7OhdmN6azZNPK97qfOs/V24h4E27tqxPT/i8tuLLQZ8I
 ex7l4CQCfjVby6Ml4qnbRpeSnMLwrghHQ2ovLlX+FsjoDJ7VPtPL6tlQNTY4T5ZPREhvj4D/BrQ
 anoN+mMqhpYOUVoEQS+wJ19eyfnQT0aHoBNTv2tUi55G4NlbZ8XFjJvzDBUEM9FmhQkqiQuzsk+
 414yn2suP/Uu9BuvWU0BtU8xS8hvBxr93mCuSy59opxHI1xBkUHaH5u/MpAumHEb0IxbXhXz4EV
 c0hBwNl7/E+1e1m+LjwHnXiFpDEnBBNnqy7uW9F6paAK0M3/Vi7MEZDHk9qzHWvdy1cQTLjbPhC
 Yw7vV/ydHLmQ2KMz2+xdLOnuNm9Bzw8sCTVOwIniNc/ecySJ5TkgzlJia3m22t5x/Sq3FH8hmbG
 WhGTxxAtzQpxBTaKnnXiCvNhWlUWRZ5mmS/cCDmj4GOfyCeIqyYqSFhzhgEvsAjRiwEg9csI4Ug
 rMMABOA876AxKOw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_005727_643309_37671276 
X-CRM114-Status: GOOD (  11.26  )
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

MMC A and C are mis-represented as having their "clkin0" input connected to
xtal while it is actually connected to the MMC clock, probably in an
attempt to provide 24MHz to the device on this input.

Fix this and assign the clock to 24MHz to actually provide the required
rate.

Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Tested-by: Nick Xie <nick@khadas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 62538fd9db6b..6324d1eb5994 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -819,13 +819,17 @@ sdio: mmc@fe088000 {
 			reg = <0x0 0xfe088000 0x0 0x800>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkc_periphs CLKID_SDEMMC_A>,
-				 <&xtal>,
+				 <&clkc_periphs CLKID_SD_EMMC_A>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_A>;
 			cap-sdio-irq;
 			keep-power-in-suspend;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A>;
+			assigned-clock-parents = <0>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		sd: mmc@fe08a000 {
@@ -849,13 +853,17 @@ emmc: mmc@fe08c000 {
 			reg = <0x0 0xfe08c000 0x0 0x800>;
 			interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkc_periphs CLKID_NAND>,
-				 <&xtal>,
+				 <&clkc_periphs CLKID_SD_EMMC_C>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_NAND_EMMC>;
 			no-sdio;
 			no-sd;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
+			assigned-clock-parents = <0>;
+			assigned-clock-rates = <24000000>;
 		};
 	};
 };

-- 
2.47.3


