Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F33CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NLesgstB5gI6rcvkHIFMofsHFcc9F6itDz0/iaXQyDQ=; b=ZwxRNKrBjICKvjshnsXuWqtjID
	uh61F/M3K7Y1SuGRrsZ2E6oJmxdvClV67Eu2nMycDvN2zE7CCqYGp6xeqdQYntL8sE5EbDvmygzxc
	Lqr7cCOLuYUegM6cAXTf6im7kOiAWzav8f44JSH7fJtfSZf+IzRsi1F3rpK3uGa/XPF2MGJDfb193
	Phd6ugeDTbFXJOvbAgwsCxNRAqoe6Kxjx6WIsZfAXaR3C4TbPgB1LTGDJpuABm78cd6o9UW8f6lTr
	jV7GhGO1V9YNJl20vOILrD++cBqBRQVsO7KV/XLYUFew1hsJJTdmIWHVXYRsC+x6C/9To3smpaZ1z
	NYsTLM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEm7-000000079kq-3hzo;
	Wed, 10 Jun 2026 08:59:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEm5-000000079kB-2rbT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:59:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so72138465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781081940; x=1781686740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLesgstB5gI6rcvkHIFMofsHFcc9F6itDz0/iaXQyDQ=;
        b=cIYs9Vt0D0zLf2hnAXSnQxarVevyI4EBt3ur4m5SvPfn5S3p3KnL4H5oBTMQIiGiMv
         8kNB20Qe3A3hO9jNzy3iqZ0f1dAZMn9eEv5mSJm+86BnNBgD8DDbDhm6LpGuy6ds8Vbm
         ZOBFJZ3Zl4ynfLYaMn6Quxt97qKOj/TnUbiG+fMQspD1c2bqbHjL+OMLJSMAa2sUAEau
         4n7xJ4evNn7cMQGaG2AXo9BV6Vrv/qUGL+oQfBjHYOFQ1UDHo3CUso0CisfHCDvmWOZM
         kGr/r2E97Mjd1lvmj7RZG1yal9Ng1TC7g+ZjIMrAqZyA2cmu0B+tWRiRMsiZuXgs2Gow
         fbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081940; x=1781686740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLesgstB5gI6rcvkHIFMofsHFcc9F6itDz0/iaXQyDQ=;
        b=S4EuntQ/WqnbEdgNjc0gSERGpwD6qbXV1chTT2xU1cAU00Ic5JsrzMjeh0zoeFgWnR
         cgc0PR5NTZU2UIjn2oNSCMdXIBTShdUenX98FXu/yCGWpQzLwMUU/dych1sd4Itw4X+n
         8rQ6V7nBNFzDkMZEEN2okrH0/wHQ0U8JZCnHsPRjt2c5oOwQrrSluKU/3RbHct/T0jKT
         OXzPYYvOOdOCyr0ChM0KKZHFBh2n2B6ig2emaQotGOWg6zetK3yNuCHJKTnN896Y73f+
         wJbBopnJQ29ISkjtEUEASncSc2S6R34rnO/eGGKGE/qYcuwHEOZjCdXXWXxLruY2EQtn
         VdsA==
X-Forwarded-Encrypted: i=1; AFNElJ9VRw9MDzdvkag2YJoqBRpyocZiO9j7iA2DgdA5j8p8AUvTXF4Jp2aAGaCTdYI9WM3QbiZttb9HXRPBR7CP1Pwi@lists.infradead.org
X-Gm-Message-State: AOJu0YxZO4ziJpjZZI6/VFXU16JooSKcymm3qNSAC1TABYgSBYDNIBfy
	JYXKhBheqFpLVZ8GUKAeJRMzvo+CTvkTfuOBhyPFROQJUaHxeZP/Hz+mfS9KgRQY
X-Gm-Gg: Acq92OGEmXfCMItPuCE8y2hPYuLMcdEjdvbNWClLdnm113K22qL6pT2LsHqTLql+GDu
	tNOZTany4OQSwEFdjXEJMssMizVXcRgv/GUlPRY8LJEprQyf8NRvWPrJRD7egGJyCQydx569RO3
	gm1NDlSvoYhPuALMsvf2SqBOCC9ohwOHh8XaeRpzEJdWUVqH8OumjPvH4rEwDbYF9eek5ZFfRtT
	DPyM9uDskrUejNxB8Q++C8ty0qwX+2DfH/NsEuYb0PVr4ABh1Kk/68k1aC5J+P+tba26sjsrNzQ
	1DKz0LliVqkCahW9UHIzZLKQT0KQXdSkbl8Q41svP3OdQdh01z4PaNZCw7JnNsi5bp0s16RO0l1
	hLlcDeL3W7iNU/GU2xjD1ZDThzmoX1LdeziNphj22VKmIxkUTZMHYNAxYI3qw6ZDc7d/aZteVmw
	G99+W220wJV1yln3dUQz6bWrwmpQOdYMzhh7Vj0rSOK9QmP82ITxCKHnLQPJtjy1uyUVobwsWnL
	Eu3vjcev+nFFDGObqVnkeS+DEQ9GPK4j/Vtm5D2QJ3v+Crj
X-Received: by 2002:a05:600c:4e09:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-490c25acd18mr424540885e9.14.1781081939502;
        Wed, 10 Jun 2026 01:58:59 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm564088465e9.7.2026.06.10.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:58:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX8M-MINI and Sonata board
Date: Wed, 10 Jun 2026 10:58:52 +0200
Message-ID: <cover.1781024557.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015901_735749_876CCBB7 
X-CRM114-Status: GOOD (  12.90  )
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

This patch series adds support for the Variscite DART-MX8M-MINI
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
  arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 517 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 559 ++++++++++++++++++
 4 files changed, 1083 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi


base-commit: 23a7098c710673ce8f245af317903ae46325a694
-- 
2.47.3


