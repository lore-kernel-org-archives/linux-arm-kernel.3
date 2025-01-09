Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9015BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BZQasPUeDbR2IG7t6kKDByOfuHn4gvLOdtGRj3N9p9U=; b=ivGFeIz5UCaOvpUNWJeyAs5u0D
	7xpGn3bvnvdP3SrT2VOKbg91SCDTK8hfIkA6KtE1K+AX2yP0LBwgycfPa/dA8ulUqEKjvWSi5lO6g
	Y8Nqc/gHJMF6dZ07xy3IVegCbaDe6uCvKgB8qV/qiP8MpT/bVoCWwnAy+uYF2bJDEe4rmmQfRz/Yf
	mQxRfPjc7DoCe1oxoVdKKtrRYJF0Wn1QT80RFyMrUl/vMI0j5xakgcNslBP9gyKvUnpJA4jNQLnKF
	diUZtz7XFbQwWeqJkOQasy1su9SToc0m/wp4T3Wlwnp7L7rAfgWgCeZ/TYOgvvpNe0kqX5VYZBP5J
	6133qbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoTf-0000000BGb2-294Y;
	Thu, 09 Jan 2025 09:05:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoSQ-0000000BGIV-2TjN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:04:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436341f575fso7163795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 01:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736413440; x=1737018240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZQasPUeDbR2IG7t6kKDByOfuHn4gvLOdtGRj3N9p9U=;
        b=icbaxqQRlmYZ67lJxzinkVt+1IBLFbXsj/2giEFt2QeGcGoMHAXHzV5RlX3GbEu6K6
         9n8sWujGPvdVTXHmqfT5akyOdrziTXQ56cyqe4mHXUBlCQ+2s17/tevWJJNWFmnx/ZGK
         yHGnOxZhJ84DoSct4Vssr/CuOxd5cW9aVR00EM7qKZpIydyyUcWogKQ2Omo6S8k1xufA
         6GT1WYTt+BQZ0rsag3X4cfgXKH7YrMs9ieRIaYB3oajYOAFTTtKOGAplRQUkId0sDycI
         /MO11X7XnM61JNjyql/9CnBv13ud6W/zpyy7eEQmLJc4uSQkri8R1l8rtLaKxFKeoZZQ
         1KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413440; x=1737018240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZQasPUeDbR2IG7t6kKDByOfuHn4gvLOdtGRj3N9p9U=;
        b=P/k/0yOwoEZwEiAwj+pXDFJ4AelaCn0/kvVv7PdKDW1gNeq1qIcrm78WlbS5vjlllt
         8PaOrmWGVw2Oyz3rnTlhG32+J/uBg8neG69OTzC3AChtoZvFwF3cJdt+Cs78LD1p7CZB
         Ndxd7c9NAg22D0EivoGS0Mcod0D0Ov/ADdTlzIl3seNvpjQGSSz0OoM0DvDKAjDw0Ntc
         /DnYJEzqifGGZKCvwOu3caEkj+SinBE1MPiOK6eor3//OZLHKCVKEEE8Ry3hmYOgEsJ5
         qIANDQQxqbbK8mByr1P8Emf1KepJZx2qCxWbu0xXGln6GgV/OpFV44IFHk5qnBSgCaVx
         mMqw==
X-Forwarded-Encrypted: i=1; AJvYcCXhKooqg0kzB+pqE/qxJm/nccmh9dLSVvLpU4eA71G4ssMtWvKRZiOALWD25et0SCySIF43FE/OZGsbYniaYi70@lists.infradead.org
X-Gm-Message-State: AOJu0YwvWcRBW628t5OyVBZqpPGjs6/2VpQrf58s/3B0iwaR8wIwdbMp
	q2ngxbp/moDkb8bBFi3M2uiMIo14k9Ah+Ic1A8oCx2mw2phYaDfN
X-Gm-Gg: ASbGncvKX2nrTokzeqPpfDOAWkvFikf3u4XlQM4CRfnsboJ2CeEaX9ikVe8o9lzEnim
	QUzR3eLSTCDKV0zP1pFQgEFutR2GfdnpILMOzPjlnSdXf/LkgxVfnzLw+6QzdztC4PmgohspXrQ
	f3CuRbeKXpBGC96mu6ymObyjisxsUkoArygr9rauIooWp4DzXvXujjORnQgM4cy6xbZt2gn6fzM
	5o0PAK1+13A2NjzpD7VzKXOl+AT12lMz5VkE7+Og9lkihaNWpDK8+6pQp61gwIljbwqqTpkVcDf
	DQPZeBCGuA8eoKvcz+Q=
X-Google-Smtp-Source: AGHT+IF7Rv4i/SXGgR2c1TDytyprerm4RmK0kPLJ+znHdFHpPXl789K/F5KOK9ww7JHsBwXR2SLMFg==
X-Received: by 2002:a05:6000:2a9:b0:386:43c9:3ac2 with SMTP id ffacd0b85a97d-38a87305310mr5058563f8f.15.1736413439567;
        Thu, 09 Jan 2025 01:03:59 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm1196692f8f.80.2025.01.09.01.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:03:59 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] soc: samsung: usi: implement support for USIv1
Date: Thu,  9 Jan 2025 11:03:21 +0200
Message-ID: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_010402_641314_E32ECD76 
X-CRM114-Status: GOOD (  21.97  )
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

Hey folks,

This patch series adds support for USIv1 in the existing exynos-usi driver,
as well as dedicated sysreg compatibles for exynos8895.

The USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895).
It provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
SPI, UART, UART_HSI2C1). It's a bit different from USIv2 as it doesn't
have any known MMIO register map and the serial protocols that it
implements share the same register base, hence why the way of modelling it
in device trees will be with ranges, like so:

usi1: usi@10460000 {
  compatible = "samsung,exynos8895-usi";
  ranges = <0x0 0x10460000 0x11000>;
  clocks = <1>, <2>;
  clock-names = "pclk", "ipclk";
  #address-cells = <1>;
  #size-cells = <1>;
  samsung,sysreg = <&syscon_peric0 0x1004>;
  status = "disabled";

  hsi2c_5: i2c@0 {
    compatible = "samsung,exynos8895-hsi2c";
    reg = <0x0 0x1000>;
    ...
  };
};

This patchset also assumes that [1] and [2] have been merged before it.
This has to be applied before the device tree changes [3].

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/
[2]: https://lore.kernel.org/all/20250103082549.19419-1-krzysztof.kozlowski@linaro.org/
[3]: https://lore.kernel.org/all/20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com/

Changes in v5:
  - add r-b tag from Krzysztof
  - make the usiv1 code a bit more symmetric
  - split the action reset into a different commmit

Changes in v4:
  - merge the first and second patch and don't break compilation
  - add exynos8895 compatible in the binding's oneOf:
  - keep exynos850's compatible in the first allOf: if
  - add exynos_usi_remove callback and error path at the end of probe,
    making sure to also have a removal routine for usiv2 and not just v1

Changes in v3:
  - drop the sysreg patch as it was applied
  - add a patch at the beginning of the series for renaming all USI_V2
    constants to USI_MODE_ and a patch at the end to rename them in dt
  - redo the usi binding support for 8895 to hopefully match all
    feedback from Krzysztof
  - change the description of the usiv1 and 8895 binding patch in order
    to account for the constants changes
  - change the subject and description of the usiv1 driver support patch
    because we're adding support for exynos8895 in the first place
  - make exynos_usi_modes a two dimensional array while also accounting
    for the merged usi mode constants

Changes in v2:
  - add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  - restrict the possible ids of samsung,mode with an allOf:if:then
  - set the properties samsung,clkreq-on and reg to false for non-usiv2
  - only make use of exynos_usi_modes
  - make sure pclk and ipclk are enabled

Ivaylo Ivanov (4):
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: add a routine for unconfiguring the ip
  soc: samsung: usi: implement support for USIv1 and exynos8895
  arm64: dts: exynos: update all samsung,mode constants

 .../bindings/soc/samsung/exynos-usi.yaml      | 99 ++++++++++++-------
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +--
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 ++++-----
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
 .../boot/dts/exynos/google/gs101-oriole.dts   |  4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
 drivers/soc/samsung/exynos-usi.c              | 92 ++++++++++++++---
 include/dt-bindings/soc/samsung,exynos-usi.h  | 17 +++-
 8 files changed, 193 insertions(+), 85 deletions(-)

-- 
2.43.0


