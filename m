Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48DEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JoWubUhSydBTzOYHJhhAjBoFYVBqYbpc3fDg9gsugJU=; b=MEbicikZxyrhyGeXXJ5q+nDMRn
	wNhJ9ybxlkZqYxOk2BN+ickKE7Z6KpfLFhwJfddqFe++IqpXNGfgsie4l+aVCCrTlVjLdpBzxYwpo
	ejB+nefEAqZgjXj9UClowY53YltrFMko5HVK7HxEbyHJMAAAZEKsBBTDOQS9NugK9M+n3U0z3Cdh6
	i+eLlzMUqMCA2JsL6L8k04ZUsQUPYZEhwZiZpIWtFZ5lAaBbGEzH2c/A/ouo1zb0NxUsHJbg5dt2b
	ByooUVFPGWfHTJYq5VLK3ViZSaotVvNaWtFB2kF2/+x/oo3jKRxKTl+SwLjfogcJ13bpHmffOH7/X
	Yz4SJ78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjNr-0000000DBUd-0pNS;
	Tue, 14 Jul 2026 20:05:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjNo-0000000DBUJ-3xpU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:05:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-475417f010dso2221385f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 13:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784059535; x=1784664335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JoWubUhSydBTzOYHJhhAjBoFYVBqYbpc3fDg9gsugJU=;
        b=X5mxVMv3wGLQ2rlZbspu/Inq9ECRZlaaG7UWBhu5/F9NXHgwVbQtbcFtnpKnyXn4Y/
         tmL3qxEZ40pVp7mjT+mZ+HP7PNndsiAvP7Z1L+8uNw6zLqPlNEwXz5+/e9IzGulH36m/
         j4la6IBKRrPB7bWA61Dd+geKLgejrNNiA7O3h+LWOb+hWWtp+UaxdH5LowXFubmBJfbO
         QEbS1xsVZUSba52ScQbJpuba6RgaWjbnzIEifpr1wncCgWAHcJpeG5QQZjC8DWYm05+8
         7ONPaqtlWesbFbJhVL60fp9wAEUGAmhMlzkZ43Uv2/DmPxxXaHJtqFzwSsMD0TssvYpk
         CPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059535; x=1784664335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoWubUhSydBTzOYHJhhAjBoFYVBqYbpc3fDg9gsugJU=;
        b=sR/TKLdMeVw3tmQD6FFetNHWJPGZHcR/yDW3sN6WE0d1l3CAON2DpRtkdUS4zqbWrG
         l4o1EdawPa40FUeHuN8A2Kmk47HI7eH4UO/CNYKP4Xm2mtxcNpBYWa5I7sGH9KmtJ5yr
         eg80GF1QHlFRYJE8xsE8I2WLUlrHUVbmSOrH9B9dcCyvxggX4/jrVGpbR0YnaIlmEmB3
         iej+RfTtGOg13LCl5kSUuT6z5E8mxgOVfvRcHQF+pr4vI327of+vvjyKZ0xUzpaEV5cX
         Tit9VPrkJQZRBk/i4UOP6a1UCkQSsqMzgQWRuKnuETyJVPhQ8sZLmdGw+oEyOx1d/Vnb
         2cRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdjGPVhOhLEla6wkqIi7yooE+TSEckuUitJSYke9i4RWsHRKiYPllYRWydnnG6QMebdFXpuXD0n5uQteZXOONg@lists.infradead.org
X-Gm-Message-State: AOJu0YzvA/xuRadVkPPj8dwOWNPWmAQ2SCmLJa76PTa0P1CqwCpNDXve
	0fzZv84Pg5BbuZti9np68S2In7b+yx/oD7ccWZQG3hhSc8PSpY3LlX8q
X-Gm-Gg: AfdE7cnBDmUVw7Bvtjb/NDCFzl9+DA5T0pS0TkURAMm4TH6tfCPVyRAMX7BxE0RrsHK
	OVSJ00EdvUGJJBnJyWxvqpIC9txIJab6PXLvGey+qDITUQVqF0DeZhKFVPP7byncTYL2Ed2VHy4
	O67wI+EIhG11jzXQBaViBnFp6P3Q0/fcZ0mn+5ku46N42xN7tXzHoUNlmsqLrKniToW02HW4vY8
	FqzeF4JyXiIfbxNj+V9SYHf/0u0Hnca22BOWunTsBNgC6QVAfikb9TNx4IsCIix/bcV5cm56PM2
	7H42jQgXhzgj/Gk7teWQlddBELa/RkM4L/rCG5t1s2iUGbUKhpcqiO9QpLtf+JMuNti6loWM3QJ
	JlmAD87oAa+SaCaJAHRQdrGHEXTbbBDJBcFkKJAjW3vQsi4pJafI9k0B4HkbV5ywPb/AYDb6UUl
	etcqrlQlaTgMS9WDAokpg2yQuZOMLoW/p3sDc//G56LOUeaM16KXfNck6M
X-Received: by 2002:a05:6000:2008:b0:478:9d9a:d515 with SMTP id ffacd0b85a97d-47f2dcf7f47mr15914629f8f.44.1784059534751;
        Tue, 14 Jul 2026 13:05:34 -0700 (PDT)
Received: from GLaDOS.station ([93.66.5.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm11669797f8f.22.2026.07.14.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:05:30 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Tue, 14 Jul 2026 22:05:18 +0200
Message-ID: <cover.1784059139.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_130537_002781_BADEACC6 
X-CRM114-Status: GOOD (  13.34  )
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
 .../dts/freescale/imx8qm-var-som-symphony.dts | 488 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 529 ++++++++++++++++++
 4 files changed, 1024 insertions(+)
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


