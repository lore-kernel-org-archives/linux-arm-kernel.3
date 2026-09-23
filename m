Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10F6C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 04:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FSBnzQPFA3sp+acWAbZYd7ni8m80ai0yOy1PIw/qr5E=; b=BFw/D+FrO2vgA1sBjMG6YwNWJY
	pLPzeJw+92R813D+lFZUNSTwgNIm4oMEsg9V6OoVC87MoURvmu1TQp0swemaZOdXSY/YU8YbJtjAW
	Zl5cYReG44FwJpJeT6tTSBlIzEW4G9eswCxa6rqdp5CbWWwtl7JfuicVEVkknSHGqgAmh6/ktMU1A
	wgOceGLuTvsWrY7zMv++y2Hp8M5yHNsf2pcE+rkKLaW9KizLD4X1SUqvNyMErMMDnJV8f3rCQrLPQ
	Z/2zan5kPJDMyQXnNUYly/VY1xrTQrrJxy8UYdVpKL9J+gJ0H2azyKOuQ5B2dGmkyqtRLekf8afQ1
	hq36hwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ESP-000000076Oi-2Dzn;
	Wed, 23 Sep 2026 04:19:45 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ESN-000000076OM-1tN0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 04:19:44 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso405596a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 21:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790137182; x=1790741982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSBnzQPFA3sp+acWAbZYd7ni8m80ai0yOy1PIw/qr5E=;
        b=o6vnLB0uXKO9zb8MRHaglMC3aUXAav7qAlqYqXtcWuFYttNWBOVM2b9Q9wqZ7B3SpR
         auejnXBlr3mY+2jbzC/fK6JKOgPo0NWrZmGSwg45p6ZhYMsXBSDvEU96JtXDWrn9edAs
         g4C6EwH8N2dW4wcloWOH1ce2jv+7w/yHeDaNpRh7EVksbz4WTQzGkv1lBSqsJ26MV2d5
         lMQkflQf5wCYnLV474BntcJI6NeHzFlEnA8ZPF8+8a2Dq17eK6dlKHl76EDDKnTTd8XT
         zXAnyXGSr4cff4L4c3iXPw9MmUqZsB/5RS96RAfiMNbZfgALYiFVge00/b8R5rFDmuos
         4ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137182; x=1790741982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSBnzQPFA3sp+acWAbZYd7ni8m80ai0yOy1PIw/qr5E=;
        b=bltZW0oLDvtBbNE0yQAuSjKY2OSmXqXkEIMYNl7G5zODmlNTkCUDnQcPMa5c/jKhiO
         CG3z/KkdSXV1NkosF4ybIY9b/4zvghGWQT2GRvZuul3wCJC1R51yHzW1n/5w/fGfoPV8
         FvF2pHtqYCBHD46HXgddslL87L+bFOon7izVY9pUPonIim4MVmSUWJGr9CpOcIdbxnOM
         cnyNlDXFumwRns5HE9NVIaHm46jb0UhSrm3b4vVr+gYoDJF2fNjdheoByBUaDQEst4yS
         CaTG/Ewx3YbSFyL6M6Zorlf0R30AL8j3+AUxqbGf9NCKiLquLViZyHlA1n6aLeEV09wC
         3Deg==
X-Gm-Message-State: AFuF++kDiNI8mVHcNhSxfXzu/gHVHlG+Jq4I0C/NyGUcNDSCvG5MbIRM
	fDOF/Km35cQlWomjQOBgvlreT0/0TsvWaspuW+a5sfhX/hTiTMDeMITgl94e5A==
X-Gm-Gg: AYBFou1o337moQWE2lCT8T6NjfC6hTU42UirjWel9kxSabhCbGFfvIV5f7TlOR9J70Q
	S0oD0FknYCuIWc+AfBU1/f+LsvpnOqCnBgroU9I3Ry2XDxiV2m6mHrFjt8vgy32M5CNeFua4tJC
	udw5rbWitFopbok2sztipwFdDvTXFj+bYfti4WCdYUxfRIQDDHbDFpAZbLlW62EpQI2BQoszXvK
	ORVJmTZ1wO+DE3bNYWAcyDauvOoNXqJiZy4aXoDotyArRcUwHWFDT4PfSGAdVRYJTzLBW7hRALm
	JzGfJOEAvJohFhmjvW08R0F/dOPxHmrf+7GJ+cMloICdrUnhQwq12xzK+8ZNrW/WZPWVmifBEII
	2H3BMkr3v9PP09gfDgtgTr7cjaghEHI+FD7u1JcKBuD4+arA3X0r2zV0zKqaOpg5w6BTj2HjYkQ
	JINwd7oua3gRqKyCUHF8GUNJ6fjcS/nwVpopECefYFUjWyzNW7ItvySTCz2RJ1fl6wxQcQubzqS
	DqmBmnLlXNpzERmVaMSij9M/9u9oFIJU/HzzB3kbj19sLul8u0k2tXfwcUoB1tg/QwlVsY=
X-Received: by 2002:a17:90b:3843:b0:3a0:50bf:d497 with SMTP id 98e67ed59e1d1-3a07e4a2525mr1289494a91.3.1790137181650;
        Tue, 22 Sep 2026 21:19:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae723sm2510243a91.5.2026.09.22.21.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:19:41 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH 0/2] spi: ma35d1: Add Nuvoton MA35D1 SPI controller support
Date: Wed, 23 Sep 2026 12:19:24 +0800
Message-Id: <20260923041926.425551-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_211943_511641_114D62EE 
X-CRM114-Status: GOOD (  12.95  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds Devicetree binding and driver support for the SPI
controller found in the Nuvoton MA35D1 SoC.

The driver implements SPI host mode using polling-based PIO transfers.
It supports SPI modes 0 through 3, LSB-first operation, and word sizes
from 8 to 32 bits.

The controller provides two native chip-select outputs. GPIO chip
selects are also supported through the SPI core GPIO descriptor
infrastructure.

The driver programs the clock divider according to the hardware
requirement that only odd CLKDIV register values are valid, and rounds
the divisor so that the generated SPI clock does not exceed the
requested transfer frequency.

DMA, target mode, half-duplex, 3-wire operation, FIFO threshold
interrupt transfers, and the I2S function sharing the same hardware
block are not included in this initial version.

Patch 1 adds the Devicetree binding.
Patch 2 adds the MA35D1 SPI controller driver.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton MA35D1 SPI
    controller
  spi: ma35d1: Add Nuvoton MA35D1 SPI controller support

 .../bindings/spi/nuvoton,ma35d1-spi.yaml      |  70 ++
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1.c                      | 701 ++++++++++++++++++
 4 files changed, 783 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml
 create mode 100644 drivers/spi/spi-ma35d1.c

-- 
2.25.1


