Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4A4C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IO9Rd2HFTD+1YUfAySkfEq/dcEm2RB+c5PiJqcKqYFw=; b=n8WcQIWY753CVQ5r3lFFStTBQs
	4ZFc/sZiR5Ba04hj4diQ+t/W3cnJHsW2ccZZzOoqgVBJT+knuMsZLuGqg5AMhmSyssY9NJQ0NsfjH
	bJYLkPNsU1iKGqwBT7NEA6coW24N+iUpC5GFE2yS8eMBlayhwMZb99CEVI3knOXee8gtpT+kVvSsh
	dx+ZidkIgSe5j5GIUkbgZQihWVV2jzZICSOULvOzfExuZ7vIwBrbWxNEM4jZ6lw4/T+X8U1ps0R3B
	3MWHbELY9Lyjen7YkNcYFmIspCH+yos+tUIXmJWUOUIH0Jp86E2R0QKyt7fxP/Iu4Aa3hcwVD0dfb
	IZwneqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2pV-0000000GG47-3VEz;
	Fri, 13 Jun 2025 11:44:17 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2nE-0000000GFI1-1TW3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 11:41:57 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6fad79433bbso22444926d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814915; x=1750419715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IO9Rd2HFTD+1YUfAySkfEq/dcEm2RB+c5PiJqcKqYFw=;
        b=STT5+AKQr8rZx6aZqa3avZTr3RVnmg+IWQSodRJ2T/OdikGvFQHwQZ8DxCT3O8FanD
         rikRXxPZTS5o7AWG+JCTj4Cl3ZEvoEEDHFDvES8oWG7Dl/iAQcXZSbJIU5FI95W7yOF0
         VXNduQfrmPxW04DX8R8YJ5VjRKzic3louTsSfBKTtusSVCJl0hTvKzJuElG9DT00V16+
         8dG9xGBvHGHW7uyJCpLImf3cOYBy6xyXetjukCfyHXN4BaEMzvCGoVQt6t1hE0hjj7hG
         /iUaT8SXk/VGbun5A99a3BnRM4EwPox4N2jpWfwIyV8w0vWBqhxmWsburQlfZfgoDYiC
         kxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814915; x=1750419715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IO9Rd2HFTD+1YUfAySkfEq/dcEm2RB+c5PiJqcKqYFw=;
        b=FV2fWoBw+CumxRk107KvqBjWChqQ6iI5Kaqdifv4i4FXPw2HxCZhREEXWIb95qtwKH
         3yU+4wx23jiQDOhFF+62GorK8of7fCBRVDbdCY0ff2CCoaGdAIjoABT7JVuDua0NVVku
         YkmTVrltQ7F906YmQFNpYpBtX0WrBIYDL3Fixzyfjp8vayZfr7C9gpm1Z7P6Xl9Z34x+
         FTdpriUqneCZ+1Wr52OObX52ZWQ02BPimlVLt/3cet6g2nkTTbUwX1VcL5A0PGUcjG4x
         UqIoh7FYs/4E68bvpwL6TGwJN/G3bvAkpwanux20FgjTFwit0WQWJACAuKv8IUFuGS9G
         kLwA==
X-Forwarded-Encrypted: i=1; AJvYcCWIxXe0voQR5+fe13XFWG19utBFPwSXA8h43ss/cc+VeqzNVLF95jKs/xMenYRlLsDkH0yTnsVPfM21nQG7wNLN@lists.infradead.org
X-Gm-Message-State: AOJu0YwGAHpEgnJZk7TTTmobQRP5Eizj2B/6KIyEw3YXZzNj0E7G9n9l
	toNXBGIuq/MmazwA6L4Ph5YUvgan4sONE75Dc8GtVl91svHAZTOL3iuFnOpGkenFwxI=
X-Gm-Gg: ASbGncuWcs3rsdh6TcQGTUlSS7d3l5Ce3VwmuwuDvZKAnXd1y6hsl9lP8q4GbfiFaSp
	36HyCrn5P/aEc1k6ImtiXzRPt30R8dJTMg3mHaLhc8NNyPzaqUo9nWJXkHBasvlrLnjfBq5FQdT
	NsG9wKe4BcINfL4Wv7cwZS7j3VP9YSB7QVMnmTCi1iiLNPaOupgA+qf1OjXRz6K8hXudyoxldGb
	P4MIz9wSuHM3/m04C8GM+H0DqL7o30j8YAK9Ai0qfTXsQVNoWezFbVltEIKLiEIwWglQ35v6Pi5
	hIkU9hUAGzpwP5MIWYCZvl4L1FmN826+DBxJviTJyUM3c4/s0tFBCXrz2YqHd6aZOUqcmlw4hv5
	C1nDKJH/pcsaFw1qXtE3nydd58vEiUDLB
X-Google-Smtp-Source: AGHT+IEc5wMP8ofTZTO6iGwnPV4OsQNdZGNQL5zwacGNvbNKtJCkrAxEGOyHCjmYXgP1YxiBm+lShw==
X-Received: by 2002:a05:6214:2344:b0:6f5:106a:270e with SMTP id 6a1803df08f44-6fb3e60bc99mr35271836d6.44.1749814914668;
        Fri, 13 Jun 2025 04:41:54 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:41:54 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 0/6] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Fri, 13 Jun 2025 13:39:35 +0200
Message-ID: <20250613114148.1943267-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_044156_397770_D4A0C09E 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

This patch series adds basic support for Microchip LAN969x SoC.

It introduces the SoC ARCH symbol itself and allows basic peripheral
drivers that are currently marked only for AT91 to be also selected for
LAN969x.

DTS and further driver will be added in follow-up series.

Robert Marko (6):
  arm64: lan969x: Add support for Microchip LAN969x SoC
  spi: atmel: make it selectable for ARCH_LAN969X
  i2c: at91: make it selectable for ARCH_LAN969X
  dma: xdmac: make it selectable for ARCH_LAN969X
  char: hw_random: atmel: make it selectable for ARCH_LAN969X
  crypto: atmel-aes: make it selectable for ARCH_LAN969X

 arch/arm64/Kconfig.platforms   | 14 ++++++++++++++
 drivers/char/hw_random/Kconfig |  2 +-
 drivers/crypto/Kconfig         |  2 +-
 drivers/dma/Kconfig            |  2 +-
 drivers/i2c/busses/Kconfig     |  2 +-
 drivers/spi/Kconfig            |  2 +-
 6 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.49.0


