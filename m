Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224C5D0C84C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvYOPiTVFZ9FWIQ2SvlyO9MXmJgyIQ0Uo/FX54HgBVQ=; b=OVNZsf6nVv3Cu7txhazXBBH8xM
	l8l/NIT0XJjst36kr5CfYYLY5XnxrUXelO8YwfvklhKXvj0u3cAncWlJPjUEZe8SDVeJQmaMvIsLV
	ikoG5XVKEulYfejCvY75vuq0zGn9/qs2gOP8V27NwKCwRNnnM3i8HZaj7GlR2FqiQGJXhy9ZNKhns
	d3bariAaRLDKTTSLdxWMsO61vboF4GhpQVtl91PAC13zKp/lpMIJPP4RCwOEl+puglHyYz6jXqgtO
	b0UI4BkA03XmImQnief31cOlcroQVUfTjqmJqwHr0KoiQ2iYGXHt59VwJDk3smls72WkO2Oe7bApH
	tIMHjRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbp4-00000006vDU-0TQK;
	Tue, 13 Jan 2026 10:40:29 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfboy-00000006v9k-0Xrh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:40:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso33875685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768300818; x=1768905618; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvYOPiTVFZ9FWIQ2SvlyO9MXmJgyIQ0Uo/FX54HgBVQ=;
        b=LsH1umw86fDJXt5tn0TcK/zz32xjcoTJkuBHrCAmwPWGbj8qWiUG8stBX7VJSC98U4
         7KJqO4V8XvkRQhmMD+xg/q+AdGBVB4v8F+nm8miOnWkJxqWJ8Yyy249jVv3YpLWXr4Mg
         phuXrMlAA9hqOpo6smp8MFsLMtcOH64WxAJ2JDdBWLq5tTzIhleGKTsuQWPO6ESy4rmh
         YjZrmGWC7Kj4ihj/KgaCHIUdVQasawrqAfX4vkrCTB/YB5rcsLCFsfpbvYxqeM8unMMS
         S07SySBxWOMpD/0bAztX0vKnaLjPML09U73Lnj1uYUXqebJqY7geQDizC9nXpnOjDmjZ
         YQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300818; x=1768905618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZvYOPiTVFZ9FWIQ2SvlyO9MXmJgyIQ0Uo/FX54HgBVQ=;
        b=oL4WFh464nfTzSg/dRa7y9ESzDn9SXp+kRI6kG1pl1P+m/frX2fbVc6TA0lE6/NjYb
         Z0tlSouIb270clKdNNrI9R5QL5tU0cfzYeaQZO01kg6ivZsOw1/8qxWEKvEo2nPsnN8g
         E1c0qSlvzgBJRXmEYptezgdJTeSa9/Gu1HT+pVy36pS+3FZ1YdX4abFQqqUXJSjglLJP
         3dvftw57U0gcgzJ6c4hfM9xkc4/AKvv8VsLCA1JgRFC9x660PFRFvmkQmG4ISsulb1ls
         DxPbZeHd2Hf9fhjwEgDKsuBroGQdXtl/4pZb6aHHdbBTA+uncyRSSleAK4EZDBdloNOA
         +t5w==
X-Forwarded-Encrypted: i=1; AJvYcCU8TPVo5V6/l28IRYBWN+uGVIjmOtIr/LEpbkehPXe/Yb/6hBnsCVb07ogLJjB7yzjcKhjNH+wyilpAbHZl/Ome@lists.infradead.org
X-Gm-Message-State: AOJu0YwpY/MouMlDxL1FS+V/W318LGRXk/+zXtOkSJzrrOORaFAivEaP
	4rzFE9VoF4/FNRdXG0smjyTeqDXo1Iv2xJOG8mOmVZ6G1hVrZww87J1etGcQvqjNdiQ=
X-Gm-Gg: AY/fxX4k36yQcSiJlvyBr8rDFM1/mQTOxSz7jxxA5GfTMlenicJn/U8vr+19roe3Xiy
	LuXvmNBjuSx0NeVA/AvgUbM4QTRkyooA/DjFHrlUf8NA3ia8Ql2Pq2ruKfTHmZuMx5wKujTXDrk
	zRcaWwJu1zVFkiD8hJDbk+RtvYGSAlI2n3DbL1Nr1rAyOuiTvF70xeVotNo5Eb94zq09Av1D8vo
	M4O3q8g0zSp//oy32xk10hqsp6wxQCj1WlX6ElnPagPutZI4D/Bs5aRalUPqwUOTTeHY0fKebzP
	p7t9wwFOMTv+yaLFsSBRe8qaH0GNYks/Fu9MUI4boHzIvbZn4RZg4J1BT0dsvXAcjR7DPC2qBuP
	7f7irkxECDDi/jOCyZzord3gAaq9vyznHkEHrYYl4HSDah5FWyFaHnmPu6/d5QRgKuxhxsq6pu1
	ZwW2gcFh+O
X-Google-Smtp-Source: AGHT+IGZ924VMg8uzSKwtfC9eu/S1JNn2hTcKF+qOW7nyEJ8PQuEIhaeFmemRi1BpJtXoN76awRbSA==
X-Received: by 2002:a05:600c:5391:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-47ed7c074e7mr29680885e9.7.1768300818103;
        Tue, 13 Jan 2026 02:40:18 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:982f:38af:1a7a:b10])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ed9fe8fe0sm12812505e9.3.2026.01.13.02.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:40:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 13 Jan 2026 11:39:53 +0100
Subject: [PATCH 2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-amlogic-s4-mmc-fixup-v1-2-1ab1fca0fb2f@baylibre.com>
References: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
In-Reply-To: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/WSQhdX7Z6q4cMkuvRYEqv/WFADsj/ztmZbunsns8fk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZiEKF5+fmSyP5MAGqjOLa+6cYIni9bUXe58wV
 cAYYHOQXIOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWYhCgAKCRDm/A8cN/La
 heI0D/9eEGRdXTHSdbcXVpKpHEFvYAzB8irOfQktIa6G7YFerAvLYaC6/VWwcFMRKUbh7QkofYg
 Vk559egLAaqUMZM7nbfrFHtiTRSxT0Yl3xpdU8u1zrELJ4OoKqfoKdKK7IK+iwCwZERrs+9W0fR
 eCZx8ot70COsfJpQHjG1y+OuTYB7gDhHhecT9knFW1cLBrllCpKA3iznCtoMGRbBvtWgGbPT8pQ
 rMVq71l8ehX/GgMQpmh3vnCn2I7S5GtU3dXYVXQTi4mliNDteJF2fmg7ZAB56MJNv+zx2+kY1ZQ
 rg7M8Z1j3oyV4avAPcA2I3zNIvRIM0ZrO0olh8w9IZ5ygifsDuMgaMRVjopQsvAN4h7C2r8P0JR
 36BjZw+H9hVW1Ms8LQv0WKVqzYSKyado2tDeYS3892CbtOGTQPEh+NXHmO/tR9hn77vNYyjZwBE
 BtZkqAV1zW8t9QyopKpvcFr1bQsiPIi6p+1wVEdI9HUKjO8F/TSNlbH3BykdARqcBous8tNCScy
 uUQvH9EjtO5GggN9IscxJpayHXfxW7dN/Tpg3TK3aKxcq9/6ObGz4b5Ug2jm1IKKb3IVA5QetV1
 jiXu/8ONjnTjhSs1LlNzZVSd7jkt7MUyfFJLEzhnwKTbNyuknKDXzOO5UpeUJNNMbPclC3ewyw6
 H/nuOgchU+xM7Yg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_024022_473083_28194E2D 
X-CRM114-Status: GOOD (  11.76  )
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
xtal while it is actually connected to the MMC clock, mostly in an attempt
to provide 24MHz to the device on this input.

Fix this and assign the clock to 24MHz to actually provide the required
rate.

Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 62538fd9db6b1ffb33a88e12628aadefbaa453ec..6324d1eb5994009df5b09923cce373a87229f4b8 100644
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


