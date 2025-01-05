Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CC6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qIdqPqr8ut58WJhh8jC+m8wlfdOxzjL71ub5pO+L6Qg=; b=gmL31TQEqoUY00CnHUxnFILF8Q
	uFqObR+jsGfD4qpVgz3JkawAu+GNJOzV6ZgjWjGITSRNBx4kphZEJePIRPHfv6MubGrCmT3kZ5qmj
	2X03VGJlSlN0sDC3aCqWYUt1aDLY9csBPtQr/PGYqtJ/7CjtO5K3ry83tCwJ0DMAXA1a4a2VjVwU2
	GTAdz8xl1Xn+dPvYj/ixmEpCTb1cmEnbDLLBZOXIS5Y2bRU3F031d/SCM04Uyn0kux8zBnUFVLaa+
	4bP2oxMFqei4GlcawMY9QXKwsbOFzp7yc6X6rQ9rYBTs8q4atxtPOo26WvnvxZmtttkveeI0fiS9r
	tq9mMrJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUT7g-0000000H2X5-2b6x;
	Sun, 05 Jan 2025 16:05:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUT6V-0000000H2GR-0tvG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:03:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso85013565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093029; x=1736697829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qIdqPqr8ut58WJhh8jC+m8wlfdOxzjL71ub5pO+L6Qg=;
        b=I/0ThgIfYHpi2K6wE+jRqZvSvWfybV1LVkgc5U6hVHxQ6tOc2jikBrrAethAo7KQhG
         foEh59JEJq9jN6PAIv7iFZGzlDbvyF7hXZx3/lAnZ0QgKFwuFDqvZYIIlWif5khzeWR1
         hdBdudkywCVXFN6MN4MQAAiW8naVXzsYnjAEpfqTqeVS8712TCeIrkr9nCu5RczWY0VL
         2Xm4Gxq+7GWW+npdQ2VIB37xlJj6LqhaplN9SJz+cZ+h1o3xkqQvwMARe0MmNI70QjAA
         LvpvGDmoTow0YX+2BVMOwDrkAvZWAoYvV6mC3e0BYLTM932m1pSKCy6f2D7xVZZ5QMEF
         ir/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093029; x=1736697829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIdqPqr8ut58WJhh8jC+m8wlfdOxzjL71ub5pO+L6Qg=;
        b=CKqa5SO3LJ2IMOIcoPHN5/U+DalrV81Jn1NrjBO3sXB1c286r02N6lYQf7BjyVLItJ
         VcEE7dYN7V5zrdfUvJFROh6fPOzzbCvH9LeVA9OOCapWjsJT2igrQSxJ9fcXVH1azi/b
         7nGAD6Vkvk2I/w/9oZJc8Abq90/kLlVPMcXXGP4Dwzh/R4G+TRP00oCYxsp8gX/DQMRX
         p6MQ22IFsM1INf9xb8c8Ue59ExtmgVRzMwjr21NRkSGQxhm3C3u9SIY3m+JPToacoCmY
         +ZU4OQ8R++PDlWriCiqoFx7kBFx9vvj4u7h2GxRlFzeu47saO8tz/1haC8+o+VdpP9Rf
         NWlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1DqnLxPXEHiqfU9OPhuXMeWcYKU6/9Rn4QzEOObGkr/DnYqqEN8QB4KX1SZASMIV7XxIcyLKvGglX9P4CJGBL@lists.infradead.org
X-Gm-Message-State: AOJu0YwdYlUCW+7I683pNm3GBJw1b5zqXSGpNDeKgHCmETSDGmlwlpJY
	DEDvRuFDLt3UmaLVXcvpFJMfbB3UbpijY44i1+THGPymJtWQSb1m
X-Gm-Gg: ASbGncvTI+s/s356Fn5XfH4ZYy6Bz5srA2i1uGORfg0S0Uz9l+rR+Y3WR4Ij1tbHP94
	NhYgDc6utYZPEs4eBr/G57q18sIHvxGUsUM4oqVVnYgqPyluXv1twrhhDP61XIiiDYiOzM0TuFs
	KvdcV1JyFzCM62ERP6To8/Ce33CrfSNNs3Y8gAipP9Ep5HTvRPzRDutF3sL624D12vpFe8LSsSR
	kwERdkNi+qJ/UqSbrY+LJVto8dOj1BHy61coZ76RwWZTr5zrGhTUdEeZlpn3Gc48Jp5oe4=
X-Google-Smtp-Source: AGHT+IFzX5gYFguVH0FccGIXUzFUCgTN+rqYpMq99wBW/xyi6mHs2FyajvkMivnBzCBB4XcwrGukgg==
X-Received: by 2002:a05:600c:5d2:b0:436:747d:55c9 with SMTP id 5b1f17b1804b1-436747d5775mr394893415e9.5.1736093029286;
        Sun, 05 Jan 2025 08:03:49 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm46031925f8f.44.2025.01.05.08.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:03:48 -0800 (PST)
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
Subject: [PATCH v3 0/4] soc: samsung: usi: implement support for USIv1
Date: Sun,  5 Jan 2025 18:03:42 +0200
Message-ID: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_080351_270344_56C5608F 
X-CRM114-Status: GOOD (  18.42  )
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

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/
[2]: https://lore.kernel.org/all/20250103082549.19419-1-krzysztof.kozlowski@linaro.org/

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
  dt-bindings: soc: samsung: usi: replace USI_V2 in constants with
    USI_MODE
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: implement support for USIv1 and exynos8895
  arm64: dts: exynos: update all samsung,mode constants

 .../bindings/soc/samsung/exynos-usi.yaml      | 101 ++++++++++++------
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |  14 +--
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  48 ++++-----
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   2 +-
 .../boot/dts/exynos/google/gs101-oriole.dts   |   4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |   2 +-
 drivers/soc/samsung/exynos-usi.c              |  65 ++++++++---
 include/dt-bindings/soc/samsung,exynos-usi.h  |  11 +-
 8 files changed, 163 insertions(+), 84 deletions(-)

-- 
2.43.0


