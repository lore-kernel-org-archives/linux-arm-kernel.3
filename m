Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01FBD38FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbaEokaRCynXGgwZAsN2Ldlp+XK1esNZb8TISMcIDhU=; b=rsL2/VJehBYl+T7kQuJ787pTm4
	ciG+Ncw2CkxgvrYqgNqiqufa7rf05rrAPnGI6+S1GH0/KNL8n0NzI5omGR8ZY8pi7n2beRYBjp1yQ
	pV7FwGeQMjbMRzFVQ0OUAobRhCPcLPT2aoeV0o+DINxyottGBcr9N2UVj0O9bN4epj6DMkbTt8V5F
	JOiPcovZGaDm+XbG8bgDg84aRRTG76itabPIvGTHPsksw3o/09WreeA2Aj6P1lopg0KvQWz4dQXGj
	gHWC/7OvaxLCAua1o4Te5ABvG96pr18R7VL1/EdPT9eE0ohmu5GBHj2IOsFEeWAQevKInyyZhPMsI
	alK6pu8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N8-0000000A3Tp-1bak;
	Wed, 14 Jan 2026 17:09:30 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Mz-0000000A3LL-3FgC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso527725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 09:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410560; x=1769015360; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbaEokaRCynXGgwZAsN2Ldlp+XK1esNZb8TISMcIDhU=;
        b=McLA/JaVy/1zGrmnYA2CG4exu3EUApvpWHq19TkifJNeocf2tBwhqJZk9wXBLW1VoF
         TKvXc7yUavk/FqwmaONZ3zbZZOAArXWRNqfZXlEkYoZrirm2tm6p8QP4KkKz4YciSAed
         hL50zLlDArzkAUhIXQKWZSzZxK+5ekvjIHUKs+snjueSF96+SxQ8pcQOh5g/l5XJi5Bv
         v0xriZ+W5BuQr58pU75CvqPsn4dmo74J5l8RPDnG+xvWsIT27VKoTcf25aIqJe5U9MTi
         DotRWHVyqR76kObckDOlWBpm3rubzwQMKDN5W5yUomCrG2yx5PpUQ8MPbI4MNMUabzbZ
         APwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410560; x=1769015360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fbaEokaRCynXGgwZAsN2Ldlp+XK1esNZb8TISMcIDhU=;
        b=nUWosLae7JjJO6+5vncYGSRE5KUI+d74b6lAse+tVJioGbDYteYCCCsGY+Wmd3ala/
         LoeaZSP9WhYVe6O5PCc74IxVcWAAZfK9JahOigJyC7HcPYZfyZQGFOl21vg/C+IgrPcE
         UyVVpNOot+6eqGhfXP4ujq4MrWlTPY6Qqv5xedAeuQWP1EL25bhMgS7xaXhGn0cE7O2J
         uUtItSes9vaNipbRno1pfrir+7Xz59PC+DPOEvYmZT6M0lAAKTiFb8e7Y5UeBb2U6ZPM
         9YUP/CMG6iYtO8JOf2U1ADjBcYAjW9Bw5345A3B23+UoVJZHkKumhC1IUo3uVhj8xAG4
         LxeQ==
X-Gm-Message-State: AOJu0YwjTYyl9HorMCewzfzAwMssdEWXs+vtql2wgVufyle306mt79Ju
	0WVu79mbDHSCU0Kd0mjDMm8Y78vOvfe0EA0ut1WobmcppQEYOOUo0bySDmTlVU2FRqg=
X-Gm-Gg: AY/fxX5Mzfj+0pmXfsNM6SbGK0G1XOuRgtVlecI/R2WAe4151hdDrHBS14zn/+Ql+Fl
	JbzKjmjzAFjZx9gadVuMH7k5Ljuc4vMYjv5dH+EZQxU73OuTgURktwM29V8krx6HcNwDftEhHQa
	79IBnLJ8SVQIg+oUqyIqBMY8jKBm4kt4v37tIpYc8gb1HEdpYbE+6knD+U3T90pX5TxOBGmFtXO
	wAPCb/ucjoVMvjlUYO2EoGOQw77qdZA/xSuBqIJhvrboAPP1ke45ujpqjOP0k/jMrJfQ/mFSKiC
	awYFTjfrQkHyf8WCFDZhkZNhEC7p4wfgac6zyDUp9GPlclwBTYykMUyhKumzBalDfC3KY0U1Chv
	ph1P3yMO7I8uohOkOO9ij4pFJpx2nJh9M04KtqobPx007JbfG8iyTte+wfI+DHTYXukiPbkJ8hi
	VkrH9CuAOU22j84y0c6gTa
X-Received: by 2002:a05:600c:8719:b0:47d:2093:649f with SMTP id 5b1f17b1804b1-47ee32e5de9mr44996145e9.8.1768410559834;
        Wed, 14 Jan 2026 09:09:19 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47f4b2755absm1854285e9.15.2026.01.14.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:19 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 18:08:48 +0100
Subject: [PATCH 1/6] arm64: dts: amlogic: c3: assign the MMC signal clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-1-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ko+xWiQ4lTs8l11VaKdcA5Y4Q0/MGgAgE7QxZSa5HcY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ822mIZD4uDh1QWbhb+XeSD+xaDGJuZWIH+76
 y3q1/f0cBeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNtgAKCRDm/A8cN/La
 hTphD/0WD0aIlphz1SaGDEqBNVzGb7WDx4RCAqfyl0NLtxx5eRsEblOhMwPJ8dR82sld65wu4oj
 Wj8WuDXKOfJGZLBAyPLzKTMdWFlqbchT6vrBJmcm1qBOEudHmUUJ56YvMRwV9LZKPbmFGZBWSxL
 XZXK/VKQvBvcEqP3X7C2rOR/hjfF8XqvrzFWMK9NbOko6hMjjKLp1mneoYPcvvR9o2iTgYk7rnd
 CNC5MsAIbIBKWImB1/9Edtw+0rGiju+vDRC0romGpiqht8QeCxgyFkDMVUtUse5OgaC7z9HIl1X
 CNgEE9AQ+KAw2DqQDXwEslUTiVT2tzYFYHJ2v8nB4sFBw6jSKR1Ndq/gSWzwBUKbPw7kZyoRDgc
 GLW+niSGqZlf+PanfKUqt9a84X3j6Ud39iseKNte4gf+Z465wU+fJhyVcj/04ZnB9992uZGuxOf
 YC4PBuI4JVJaiL2noPl10YhfUuL7l3OeF8Irr2I7Y1q4BxKQ6166s3GYvMxd5WGmjoQzihP/zcD
 2qPyxdpYUr46opbtTgo0+6n0sG8wfhjIHkWNFVFDd7NeIJGj+ScVXsa515zep2NLHmrQWYNqAQW
 xFeDf8ljoK4lVw+cdKTaKrteyh96v9k3UqiB9o+DtDLIGPIMVLyWK8Hiop+yd/2Jzn+UVtRKoMj
 ZEJYOG8gbv8ebpQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090921_870411_940C1FE3 
X-CRM114-Status: GOOD (  10.01  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

Assign the clocks to make sure they are properly configured

Fixes: 520b792e8317 ("arm64: dts: amlogic: add some device nodes for C3")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index 11e5323f95b7..4e6757a57fb9 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -969,6 +969,10 @@ sdio: mmc@88000 {
 				no-sd;
 				resets = <&reset RESET_SD_EMMC_A>;
 				status = "disabled";
+
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A>;
+				assigned-clock-rates = <24000000>;
+
 			};
 
 			sd: mmc@8a000 {
@@ -984,6 +988,9 @@ sd: mmc@8a000 {
 				no-sdio;
 				resets = <&reset RESET_SD_EMMC_B>;
 				status = "disabled";
+
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B>;
+				assigned-clock-rates = <24000000>;
 			};
 
 			nand: nand-controller@8d000 {

-- 
2.47.3


