Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E39C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 05:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ysgHzHUJXzI0JJ26R9GmqoNNUsJzhyB8GzW0gLV0Nww=; b=zn2nhffd11p9Hs4PssgqDTRPdm
	d7f9YwXipE8Sw1j5wBcajGmqijV7Gzk9GlGyeJ49GvOBTTrIyRKVQk31TD/W9Gm6vcMBDCUkjguN/
	gnvn4PQg3OJRFA4iPzYDtDVqlVBCfsewAhL9q2z5TDaYp5VVZDJo0miXmWzd7fgF0j0dZ4yrJ8EqT
	lXmZDPIaqzGziqh5GUjJZWPdXbHlPaJAkSqf3bnEh2PynkrC0Al64mCi96vXa1iSN3U6+6YEyTkTP
	/t7gKGhAyEqj2ZEzS32c78iUS7jLdilJdRlRM4+9RN/P3G1KfqPXm+vAAkldY3t5xq99UTjJBGZp2
	EF1YHJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFo2t-00000002XSP-2wL1;
	Fri, 16 May 2025 05:55:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFo0l-00000002XJH-2tGg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 05:53:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so12071175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 22:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747374813; x=1747979613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ysgHzHUJXzI0JJ26R9GmqoNNUsJzhyB8GzW0gLV0Nww=;
        b=D03VihVdrEuZoz0MrEA3ovwEQ/hxgICizPuZspq1ErQil8GezDE1CPmhd0b+25tXpj
         1UT3B1lEKTyEbKX2VirOcfvR6+Vq/vLkNvtQ+R+0JlbA3KKeVt59MbDnnQsZNpKfyCqz
         zsXLVHVUtzC9Qvv5+eZjIv+e0StX2QCraE9VmRHssInPaZ/4h9+DDfP6YMfL6ML+tXe6
         70XvpVOQw2/TIQTKgO75xJNC34/PN0B+FPj6rMYmPDs3MVYjLxPS3UHyfcgmyijT8sYB
         eA99xP9x8vN8ZZI/K93Vii6SMNsJ8HMgJGXEfxa/Q/qaIUKNi4dpdwlAbKwk4SIBznX0
         oYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747374813; x=1747979613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysgHzHUJXzI0JJ26R9GmqoNNUsJzhyB8GzW0gLV0Nww=;
        b=HCTAEbaRYt1gtMFhXrHlRS0d0mquTUeYJESfw9lEbnJb8W2CPEB3zllguKd0CI79tz
         9zw4DWnloZPU393pj9zckbfFWLZ9IjgAghv4FAZzHJKAGh4MRv1Kk4+VxGh4TbTqIgqW
         HVR8+oG5pS0VQGIt6Wcj6ow5TIrk0gJ2eJutn80MaO9RJ8mQiQ2D/0WDVOifNpunzPXt
         /muaA9Q/sFL31WiyEBBfDm5fR8QgZTU6sJiRiwgE7duD2EXUM8mkxp3JMbrOg1L2C8zu
         OyMZCsWGaGeWqFTT2AulCXVgaY/morvSVJpJwBn/zlENdKY2l+5tI9hpT/HugHFarPfB
         xVXg==
X-Gm-Message-State: AOJu0YxTzb3AwazaJGQxbym9DHn2HFxtGvUouIEG9Kk/VFkLMEok3Zk0
	0VO/xL65G3O6SThf2/DJcY/9eJ6t4/I1PVkSJlkplWVFM6mhj+OIb6UBNccebNib6BmcP0RcgCh
	zprsX
X-Gm-Gg: ASbGncsLDwCjHK2vVrwPHLdsCDQcW+CYnjDBvnJFr31TW7cbh5RRjSU+9x8qtwt19vD
	PDEgoatBgCvdHXJ2ippzqY5MCcQ1xL/PC5WroF9WcxMu5PWLjCL1RqMm/CMIJcTtc7QzkGZxBC4
	Vf3Pkkmgxf4Lezzt77DxuvQe2UZEfXjcQa7Ll0QMBHDVf+CRnGtoNjSKPk0IVq2QIub1cHg6fi1
	tgbZ0Gf1Skv/blWxca8sGSUUl0Nuew2iEF73jh7uXz04w7pSd3CYSFak0N4d0rdOATqe9KlLdmJ
	N27c6CzzFrXA1xM9UUgJ88hhBKZWqsI306sxbeFGAV/yk6SmnBB1Wyd6saTi3UkPP+6ECg==
X-Google-Smtp-Source: AGHT+IE06yhwIrfWMR3nQ7nz3IOMaiLivNnlRQajJq9CYMFATW7m0104XfpAAx5jbw6vts7hRg7ArA==
X-Received: by 2002:a05:600c:1d28:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-442fefee236mr8833645e9.14.1747374812978;
        Thu, 15 May 2025 22:53:32 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4fdcccsm21672275e9.6.2025.05.15.22.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 22:53:32 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 DT updates for v6.16
Date: Fri, 16 May 2025 08:53:30 +0300
Message-ID: <20250516055330.10852-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_225335_882920_40DB2C2F 
X-CRM114-Status: UNSURE (   9.59  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.16

for you to fetch changes up to 36e9e1ab594519972b0b468aec9b8e9591ddd0ac:

  ARM: dts: microchip: sama7g54_curiosity: Add fixed-partitions for spi-nor flash (2025-05-16 08:31:29 +0300)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.16

This update includes:
- more controllers enabled for SAMA7D65 SoC (Ethernet, Flexcoms,
  SRAM, DRAM, RTC, RTT, GBPR)
- cleanups and fixes for Calao boards

----------------------------------------------------------------
Mihai Sain (1):
      ARM: dts: microchip: sama7g54_curiosity: Add fixed-partitions for spi-nor flash

Ryan Wanner (8):
      ARM: dts: microchip: sama7d65: Add gmac interfaces for sama7d65 SoC
      ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC
      ARM: dts: microchip: sama7d65: Enable GMAC interface
      ARM: dts: microchip: sama7d65: Add MCP16502 to sama7d65 curiosity
      ARM: dts: microchip: sama7d65_curiosity: add EEPROM
      ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
      ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65 SoC
      ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board

Wolfram Sang (7):
      ARM: dts: at91: usb_a9g20: add SPI EEPROM
      ARM: dts: at91: usb_a9263: fix GPIO for Dataflash chip select
      ARM: dts: at91: calao_usb: simplify memory node
      ARM: dts: at91: usb_a9260: use 'stdout-path'
      ARM: dts: at91: calao_usb: simplify chosen node
      ARM: dts: at91: usb_a9g20: move wrong RTC node
      ARM: dts: at91: at91sam9263: fix NAND chip selects

 .../boot/dts/microchip/at91-sama7d65_curiosity.dts | 209 +++++++++++++
 .../boot/dts/microchip/at91-sama7g54_curiosity.dts |  32 ++
 arch/arm/boot/dts/microchip/at91sam9263ek.dts      |   2 +-
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 346 +++++++++++++++++++++
 arch/arm/boot/dts/microchip/tny_a9263.dts          |   2 +-
 arch/arm/boot/dts/microchip/usb_a9260.dts          |   8 -
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi  |   9 +
 arch/arm/boot/dts/microchip/usb_a9263.dts          |   4 +-
 arch/arm/boot/dts/microchip/usb_a9g20.dts          |  17 +-
 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi  |  27 --
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts      |  10 +-
 11 files changed, 625 insertions(+), 41 deletions(-)
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi

