Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D7EC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XDI1H+rJa85Vk3CfNIzhP22h3WLuIx8UkR6DrHKijs4=; b=ECW1Mu5UZhjlUFUjJoj8gGSszZ
	u+c2YvQkWFVdFSJsntLBhKv/X2X0XElnane7yu2PObUBTMDb7xoP3snIzfPOxyXK/5iXIrT3oyqn/
	N56HBbFEI6wGNMeaMJ5UsaEZ4B/lNloJFi0d5v4WPo/iUYX1mN0ZHxU7N/azUjw0gEjkgBsNfGDH/
	J9Nk06eIXQWus0dA30FWDn2DbnxqrAH6qr204U7uFn9G1UtOu2MXfV3a1m2BE2J+WJTgRwm7V2cVM
	2IDwGAaZ+6+IzVQcgmmfAXs2YbQlejFXuL0hlEtwOOGCdqxAndgFLJpKg7bKpd6LHAkW95/0m7gYT
	9KMy0JzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnqi-00000004jIa-0bjn;
	Wed, 05 Feb 2025 22:26:24 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnpK-00000004ixt-35VI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:24:59 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso193974137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 14:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794297; x=1739399097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XDI1H+rJa85Vk3CfNIzhP22h3WLuIx8UkR6DrHKijs4=;
        b=DwgaaKlwt1sPdiPFEtzWAj084ng5nPHsZPqam9KhzP7L4Eff7vCDpBrsqc7QA0kNPr
         ZLrhjsGZN4VN1dM/R2Z9m1l1jRBtEEprJChDLONbqW1HnRq76gdLifdQ+ssxbsvNNMQS
         0RrNTUiEM/HrNHjenO6UMukmaR+Kv8lHtZud8WUzZolvJlj4181uDZX3+dKAWAXqFtd+
         /ARJ2wLMYyKscTAULHSp0E5kMaAMt6xtoQVM9Uyj7VLYYEUJjB4XQty9AAMycnCkI5Dh
         2fZxUZPHmbrtEWLDQZ6nu0fOwfSpQIe6zn2Bg2t1804bX0On1PXrcttu2QiSTXitC50u
         e6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794297; x=1739399097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDI1H+rJa85Vk3CfNIzhP22h3WLuIx8UkR6DrHKijs4=;
        b=MtIR4eUqpi+lR+Zh2I8YPbXQu+mXMmjDvHcx7yxNemAbSaFFdzwAaNxeRYgcJX8kJU
         s3n6rhB6cUFboZGxNV3MCEydVOE0caktN4g3cPpggHw3pkHBEyGtPh/1oDqSyNyA0ATE
         IMnzgDKPFSe2kiYqKUZmaI+zcbLxG1uwC/NYlqxgGi/p5DsDJUNaJ7ZgRz1HeZf1HuZa
         8RfiBuw3kTq3aVTshQeCfuf8NUen25HFHGDcBqe+jbLEnMjz2ERX4Ej6CituMTTMP29H
         iKhW4oeKmXGfO+GdFf66lNImkluUIht4I7M48gq+ZyLATD3RF015hbMAAIXu2vEHPCip
         5zdw==
X-Forwarded-Encrypted: i=1; AJvYcCWAv4Pi0T0cT8z9ybImXEpXK5yIepQ9zezkEKhfvP+pl+AblfohRcdS35oqkZswdW54wt7JOJqMV3AWp4PWP5n/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm3UMMD7qdiHEgEiKC4WvWFp/60iZ41wgW5JbdErnIDXHRxg3o
	n6YtSBT2jhyvms/3Gv73Jeov3En3oSrupIHefXl/+Zc+MeY340Fa
X-Gm-Gg: ASbGncsutDl3T0KYRFag9/ajPL4tQrGsPbfuYVfJ0/Z5o9uSlTtG1uiU40cQ61hG23A
	edrD85yHfS2iIukQsO8tfMvEoeQeWaczWpJ6NXtZwnO2l1/yNwYA+iO7BDjzuSkkOD1IjonWDBr
	tsVMRDb5/TDXnF8bfk9yFFNj9EYuIBOChVQ8Xqe5uYT+GRQHTGe98wVbCeg2TIN5CnRfgxVSaO3
	P4rW92S94DNXCj3wyAtoMedt7CdnFpb47/rYuhDoY8Fu6ji3MCz/kwAoUv9zPA86MgjtgDsxOcQ
	IKWPoaXu6BrNu424ucA+41kxh7qpsM7QPUwr1Fp9GduvVium3GWwGC7xvcEkYjmarh1pb6Q1cjl
	xFg==
X-Google-Smtp-Source: AGHT+IGVuqnzO9h7xuXld4Fi/N6TlX/gjITeZ3zFxASd8IeSGU1kC9RCh1Ppy/3bLsG7OipCqGb60g==
X-Received: by 2002:a05:6102:1622:b0:4b9:bd43:97a0 with SMTP id ada2fe7eead31-4ba4b57d58dmr3762624137.24.1738794296858;
        Wed, 05 Feb 2025 14:24:56 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:24:56 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 0/9] Add PERIC0/1 support for Exynos 990
Date: Wed,  5 Feb 2025 22:22:14 +0000
Message-Id: <20250205222223.613-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_142458_777926_B24AEA90 
X-CRM114-Status: GOOD (  13.72  )
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

This patch series introduces support for
the PERIC0 and PERIC1 blocks in the Exynos 990 SoC.
It includes devicetree bindings, clock definitions,
and driver support for the following components:

- Universal Serial Interface (USI):
  - Adds samsung,exynos990-usi compatible
    for defining USI nodes in PERIC0/1.
  - Supports UART, SPI, and I2C modes.
  - Defines all 18 USI nodes in the Exynos 990 device tree.

- SPI (Serial Peripheral Interface):
  - Adds `samsung,exynos990-spi` compatible.
  - Implements SPI port configuration data.
  - Some controllers (SPI 8, 9, and 10) use a 256 bytes FIFO depth 
    instead of the usual 64 bytes.

- HSI2C (High-Speed I2C):
  - Adds `samsung,exynos990-hsi2c` compatible for Exynos 990.  

- Clock Management Unit (CMU) for PERIC0/1:
  - Adds clock definitions for USI and I2C peripherals.  
  - CMU_PERIC0/1 clocks are not marked as critical.  

This has been tested on the Samsung Galaxy S20 FE (r8s),
where USI and SPI interfaces are confirmed to be functional.

Denzeel Oliva (9):
  dt-bindings: clock: samsung,exynos990-clock: add PERIC0 / 1 clock
    management unit
  dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
  dt-bindings: serial: samsung: add Exynos990 compatible
  dt-bindings: samsung: usi: add exynos990-usi compatible
  spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
  dt-bindings: soc: samsung: exynos-sysreg: add compatibles peric0/1
    sysreg for Exynos990
  clk: samsung: exynos990: add support for CMU_PERIC0/1
  spi: s3c64xx: add support exynos990-spi to new port config data
  arm64: dts: exynos990: define all PERIC USI nodes

 .../clock/samsung,exynos990-clock.yaml        |   24 +
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |    1 +
 .../bindings/serial/samsung_uart.yaml         |    6 +
 .../bindings/soc/samsung/exynos-usi.yaml      |    1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    2 +
 .../devicetree/bindings/spi/samsung,spi.yaml  |    1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi     | 1711 +++++++++++++++++
 drivers/clk/samsung/clk-exynos990.c           | 1079 +++++++++++
 drivers/spi/spi-s3c64xx.c                     |   16 +
 include/dt-bindings/clock/samsung,exynos990.h |  178 +-
 10 files changed, 3018 insertions(+), 1 deletion(-)

-- 
2.47.1


