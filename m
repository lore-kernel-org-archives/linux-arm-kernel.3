Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5656C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W28MgOlBEIrBDEwzq9cApro4f/MG3ayuQJC7ubK1/ik=; b=M5dDzukzGzCMSX6Xmnql6LMmkZ
	+8eMMbuo+gtDOAPUyLf2CDc0yxGUYRUjG2iSZ9wCZh8zcyER+tr+0jPoxL5DYqZYsNBmD23MVlt6N
	glFgEjBVvpa8//lx9/14EQIaoI+Fu/zQWPz7ITDF+6O9OrrujtC9ZNnniuXpmVqMXYlIVDKLwOsbQ
	VFmA0izuGZOntmC0wmMoR0bHzuQwPgsfY9Quj9pUwHT+8PuNpkUkpAI3QIyYKKZGoCQjz10nIlnjm
	ScWjyiLawryrhM1SnM9j+/+bKrBR/XHfQyNBSBtJ8dvEg9LGqyGdwxbKjTTvRBM65OZvfE927FIpI
	6bMvzOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2f8-0000000FUFg-3k6L;
	Wed, 15 Jul 2026 16:40:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2f5-0000000FUEj-3m0K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:40:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493b27c7451so10672185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 09:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784133642; x=1784738442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W28MgOlBEIrBDEwzq9cApro4f/MG3ayuQJC7ubK1/ik=;
        b=L2LhGi0jpphBLOFkhzBN7LhdT/SBtDlXVlPJjAS7JUfVOv/izf004JvwYTFTXEnt5X
         C18OrMgmMObqmsFB9Ts9er0+rylOZ4nb67PwXnGgGlnjMwuuw48j17Wh2GBURqKxpJ90
         cjb6soaYTTMbzqjVk2Pz+jbpCPU/9mqGegGeSYVLsDUlU7o7QM/tX+R1ns78nq8KkUbG
         UXCKphVx/epR3CONfCxCv1Dwo7l7TzPrEr+wn+iFe4NQTApp8pshcOp3ZWdQZXCVNaMY
         kAuixIUYhdsn3mHPBa+l70fGFkpJmaJyF8MBAWq0X2Kva1XKjwFhPZpvVv9H3Mk7ZCGz
         a9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784133642; x=1784738442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W28MgOlBEIrBDEwzq9cApro4f/MG3ayuQJC7ubK1/ik=;
        b=r+sXocKlOEU9I8IkE0nmH5eaMFMF412nBqDAc8K1NK6gYQ0upwZFddNJSVo9+3iMIs
         cCSUuvbrJY0hBjH3zmP+2gLygElMxUqIAeNolvqE4pNDNQOVAmlbErP4Sx5b78RTxZFh
         +VojobSClkakkK2bGTH/HdnqDlMxruQsE1XhA6cDBttYC0bRn+oIYbKneRZCQkfRnege
         dS0wpY/mxvzc3eCSdqfgslAPTCrobjNpaZXktf2Gi4xml7qe4hG2MbENfBrO93xbHsqm
         +B386ZpeMS8H3ePiggHfrwtTTtELRhHr9KqGMUq29S4p3qcBKDy2HVq/tPlEBesZuJ7T
         r1gQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzcpOa9fNNsEDvb0NuPv0JguSOGwFyqji9NF3oXmaYvJY5oM/Ts/bTZPVPPEOtkKZ+2HiDLybJEtDJXhOCOB9f@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0LN9JYQkyW5Xv3VrBQJ+sU0H/zR78BQRvGYhKMrwVDIykY7bB
	YhHcbL+HoQ9XLp/5dcYPguzidXc5kd8vGci2Vil/zTvcRRd1ooJl1y7Z
X-Gm-Gg: AfdE7cnH8kiaOvMrwYLWFppHuinTCfJzVjb90BeutcNtrOQkav4K2PpkZd8YrIkAVOq
	BQJfGS6MBIJD5b8sqUlyrX2vSBSAXEEZNBPGT/1dN51QBI7/nuTEIBMnxeyC3zEkdZzgMOd07eF
	rWbhIm0HCykGBsxLo1ppiTCW0UcKDPuoHSD2IoZgP1vRY+s+dTDCalTTyQdT2C+0jlx4RXOJ/x/
	PVrqvQvyksPTRpyjsOi9s5kdgklqEOI/LaEa9A5yVS2lXKUzBWFzOfB4JYwVp1wXEKskYpDOPJz
	kf1uAC2vF95rm61+cKCPKv1Ld2s67UX9AtP1NmmEctnQ8bmYdAAF4npX4pmsXz20XGvPtkS6nJX
	csVToywIN7n5EgMD1gJxCYJl4oUqOaS6FYig1AJyc+4c1rZ+feLBPJOkz5uItXuYcFHFzmlHAQP
	JdReSKUY1r74pruzxT3/Qg7WJ1RiAzYdfDU14+X56JaFEZIndDY/SiYG38UQ==
X-Received: by 2002:a05:600c:6285:b0:495:3f64:26bf with SMTP id 5b1f17b1804b1-49540cdf249mr1832915e9.4.1784133641846;
        Wed, 15 Jul 2026 09:40:41 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464bbb0esm17836432f8f.28.2026.07.15.09.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:40:41 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v4 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Wed, 15 Jul 2026 18:40:34 +0200
Message-ID: <cover.1784133402.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_094043_978008_A305B26D 
X-CRM114-Status: GOOD (  13.73  )
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

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v3->v4:
 - Fix sai peripherals clocks
 - Add comment to clarify 1GB variant

v2->v3:
 - Fix led typo
 - Moved reset-gpios in pciea_port0
 - Removed wrong captouch pinctrl gpio

v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl
 - Fix ptn5150 interrupt
 - Fix ecspi1 cs gpio

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 490 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 531 ++++++++++++++++++
 4 files changed, 1028 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: c758aa296e6effc94c30449cc7e4773f0ae02914
prerequisite-patch-id: 31784fa7a3ee5c178b2f1ffa97c1dd7c1d3d898a
prerequisite-patch-id: 5810f43cde9c24ee318d680c1852b3ded18f3aa0
prerequisite-patch-id: 012c9c8ba4e290532a1b7f8642274b7c5f252e03
prerequisite-patch-id: a57d576be42d5061bba453f0d5960132be55a1ff
prerequisite-patch-id: e34a75fb6f7e01455dd5ca734dacad66b12de06c
prerequisite-patch-id: cc7abadd0354d14bad0cac1fbacda14ab9d4e02b
prerequisite-patch-id: c0276686c0247cb2385c56b96cbfd6de5128415c
prerequisite-patch-id: 100c47538870af63194b407fae06183fee85fc09
prerequisite-patch-id: 3a3b3e40f5fba785857091dda909d22bfc5e2d0e
-- 
2.47.3


