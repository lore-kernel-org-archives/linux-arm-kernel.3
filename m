Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D47C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VEeX4pHU5dbnP7BXmwT5H8fSOKMWm7ham8iEEngBq2c=; b=J1WxJiLdZ24oQG
	Wivc3maJsZDCWfqNBwyIYg0GThv6eLomnPh+ClgTGrjRRH0/Z8Q+t956TblUj3HiZz6xw5phxAEmv
	N7h1arSu6QKtiMcM4nqEhJpk/E9GGXo94w/Xzoc9k6OJfeY+SfOagj23Ad4FwkAPbo9/Sz0TB54f4
	BmjcmIheq4ae2FP2N6cyaAPPqouNFcU/MNs8Cf04ZBWVMp+Gwm0ZN1p79ZCbeKkZD6uaStb2laLQX
	Wv91CD4ohajvVevAUS995WATDifPq8RbwqwrY+Xe7X/QxCuSTNaWJQ1reiLoxfPYr12qHoEqlGZDL
	VpL84Y+MrwmL6/Yr+S+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Xs-00000001O43-3hRw;
	Thu, 22 May 2025 15:09:20 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Hk-00000001KQJ-3XVc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:42 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so67874415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925559; x=1748530359; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VEeX4pHU5dbnP7BXmwT5H8fSOKMWm7ham8iEEngBq2c=;
        b=yO1XZgAcl0fuj3ZsRtTGFMpiGFv9ecU4lXskFjEnSg8bDzvXmYJP0qVf+JIVMSMDG0
         E+tgOa6POyO+sbnJjJ8XBA/tsuYKprX1A9TQlOAscq2Wy1NjwolW0R/LOg8+9hmEC0PO
         Qdrma8+IOSD+CyDe/cJ2e15Ee5P04Fy3+VoQ0le9I0uhKWEQrnJIUhH+XeHTq76xVXvc
         ZjT1+7negAsAcqw6w9stKWCDQthSnIqeITVb9Uk3Let/UNNw1aLAqtzqoqsS6Ta5Qd7O
         u5gq6XTN8fJzevgQJPCA6SgPsCePpNuEUak5DwuPvBnDbxpPGoLtshNyt1XH4HB02/uM
         Dpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925559; x=1748530359;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEeX4pHU5dbnP7BXmwT5H8fSOKMWm7ham8iEEngBq2c=;
        b=e0GkhXLCSe55AKW/mtTd+4odzJFYxKEenxg6Sv9pgDsmhiKOKZ/paNoAvPiQq4OAj4
         TZOb3qWV3pmEscKbD8sXdCcKwPOQQQIWoSdKLgz1Oyb4AeBn3N+CJaVtAlg3Ki7LxTZZ
         M7dsvhCiy4YVc6ukM1hYCv7pEu38v+husGzvaGfQxZPCYgJcD9SnKK70Tjj80ekAlFiK
         PqoiAQjavPizmqAmJxvsxFYnPxl35eUWX9tuzpeMHV7odsuBTLIYI408eQWfVVvZjIIt
         jIp0NDuMLvhWNXE4Geltyr7/pmq6kJePfpl/u7MLBOjTWxXd6dRNkE67GhrySGP9Bhuv
         Njlg==
X-Forwarded-Encrypted: i=1; AJvYcCVtGGAr/fDZbWLyv88jcgM40TasNJ1jORhwX9lXHGrKdTuUiiJoXuBD6E6HTx3UgW1f/87m9SgiohupPsXot+Fp@lists.infradead.org
X-Gm-Message-State: AOJu0YzPkjPLMUqGWIZUkgeLwOQTHDh5jNyH/z6ni0jEibLw8Xxie9af
	L383Vi3TtLelAxJc8cr1Xc5we4eLwnM/JuGPlvjKoVS/maHyXgT9Sr8dh3Ec2zLxifU=
X-Gm-Gg: ASbGncvKdxs4egtFwpltvHOXvQR1suVavr/9LO0IeefZZ1mcLUb9PosZTTly/IvqGpF
	w9/RNTFLvY+WgUewsLTz2UL63kJe/W0vMMIZCZZ5UzOIODTutVSKzDfDKV3H9h8ERAOJr0vlsNS
	BrbU915tT80dsEgVP5aBk1cwgzyx8eYHebk2XR5zX7PEONWMypS39MhtjWCJ0np9MgzqCVBihYa
	G9osmCloJOMKwdtrR7DnbfcoO1CUzEw6hIFZ99iZrdBW+FbHc3Jktv6Tu6ZVyXY1nDVn/7fhpBr
	6Rw0v75cFmXtHJG7DMolzfpR1BE18x2xujUQMWj31diwMloR7Ny+SNbQeUmP
X-Google-Smtp-Source: AGHT+IGuO6Y6d+kCxwoNrEY38IpkexCj4wL5pVJUa3/XxA+mRVZ8kHkKd9XIST6kB9JCbxHGl+gsxw==
X-Received: by 2002:a05:600c:3114:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-442fd64e335mr299932885e9.17.1747925558639;
        Thu, 22 May 2025 07:52:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 00/14] spi: spi-fsl-dspi: DSPI support for NXP S32G
 platforms
Date: Thu, 22 May 2025 15:51:29 +0100
Message-Id: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPE5L2gC/13MQQ6CMBCF4auQWTumnaYLXHkPw6LCFMZo27SEY
 Ah3t+LO5f+S921QOAsXuDQbZF6kSAw16NRAP7kwMspQG0iRVYYsPtyLC4Y1YUmCvfOaSbUtGQ3
 1kzJ7WQ/v1tWepMwxvw9+0d/1J1nV/kmLRoWG7r4fyLPT+vqU4HI8xzxCt+/7B7lZF6qrAAAA
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Xulin Sun <xulin.sun@windriver.com>, James Clark <james.clark@linaro.org>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Marius Trifu <marius.trifu@nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Andra-Teodora Ilie <andra.ilie@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, Dan Nica <dan.nica@nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075240_903653_5DC366EB 
X-CRM114-Status: GOOD (  13.10  )
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

DT and driver changes for DSPI on S32G platforms. First 3 commits are
fixes for various edge cases which also apply to other platforms.
Remaining commits add new S32G registers and device settings, some S32G
specific fixes and then finally add the DT compatibles and binding docs.

Tested in both host and target mode on S32G-VNP-RDB3 by transferring to
an external device over spi1 using spidev_test.c

---
Changes in v2:
- Add trailing commas to lists
- Line length fixes
- DT coding style changes
- Remove fake "rohm,dh2228fv" device for testing
- Improve some commit messages
- Put all fixes commits first and add fixes: tags
- Link to v1: https://lore.kernel.org/r/20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org

---
Andra-Teodora Ilie (1):
      spi: spi-fsl-dspi: Enable modified transfer protocol on S32G

Bogdan-Gabriel Roman (1):
      spi: spi-fsl-dspi: Halt the module after a new message transfer

Ciprian Marian Costea (2):
      dt-bindings: spi: dspi: Add S32G support
      spi: spi-fsl-dspi: Enable support for S32G platforms

James Clark (2):
      spi: spi-fsl-dspi: Re-use one volatile regmap for both device types
      spi: spi-fsl-dspi: Define regmaps per device

Larisa Grigore (7):
      spi: spi-fsl-dspi: restrict register range for regmap access
      spi: spi-fsl-dspi: Reset SR flags before sending a new message
      spi: spi-fsl-dspi: Add config and regmaps for S32G platforms
      spi: spi-fsl-dspi: Avoid setup_accel logic for DMA transfers
      spi: spi-fsl-dspi: Use DMA for S32G controller in target mode
      spi: spi-fsl-dspi: Reinitialize DSPI regs after resuming for S32G
      arm64: dts: Add DSPI entries for S32G platforms

Marius Trifu (1):
      spi: spi-fsl-dspi: Use spi_alloc_target for target

 .../devicetree/bindings/spi/fsl,dspi.yaml          |  18 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  78 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |  78 +++++
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |  83 +++++
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |  83 +++++
 drivers/spi/Kconfig                                |   4 +-
 drivers/spi/spi-fsl-dspi.c                         | 362 +++++++++++++++------
 7 files changed, 600 insertions(+), 106 deletions(-)
---
base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
change-id: 20250325-james-nxp-spi-caf1e2099231

Best regards,
-- 
James Clark <james.clark@linaro.org>


