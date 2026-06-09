Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18704CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=73q9o/RbMs9HsVClZc0TR5gGHz7oJNAXFjfet/bYLwE=; b=wqnBgpvXHe8aeFTLP67Wph96C8
	dnhXjdPXnjDI7tr3iMfMBnPKchhMy+qVZMJrGqDIOHaFJpEUTfWSJLR2Q+F7H/n3Bmk6Yza8b4BDt
	f4bSKfQqUNGF+kkcXP3a3YMcD0flPDtrkeLZ4FZ+69JODXgTgbVz150cqdC8SO+EN+srcs6lKQh/v
	3zRij//AlglKJihINutdtJy8fgpl6lnHJk61Ls6kTAfX3z8PrGAXEicv1kdsC49zdiQhKztdYrWm2
	oqcEXlZGcxndNTlnt+/LRRm7sAngCdqBuZzgm1bfo6Ipl+cVcbuvoCz3FfQODMwFormqm8zpoox2n
	EGtaj60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt7J-00000005Fqy-1I7v;
	Tue, 09 Jun 2026 09:51:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt7H-00000005Fpz-2fL9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:51:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so35524995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998685; x=1781603485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=73q9o/RbMs9HsVClZc0TR5gGHz7oJNAXFjfet/bYLwE=;
        b=WEr5Q3gYcroDwzDbm2aPQxwIroXsULQp7ntEp0Z4xlEz6dVib3fmJ7PyqW0K9yMQRY
         3Pw4eK7+9zgGi1Ze5tAwRSA2JnZYtMwMNLCR4Z74/ZHeYM+I8GYO4UGWzPTLS2AwJuAg
         qjM8RUiFp/lvbRRl8dy8CnJT1kUOeJ1FQA9LE7plLCPvmk5Usq93ZxozrYw6RdeA/8+2
         8F6JCPIh+Nt8GVzWlDLdaZnrxBR3X7928NmGehGVeziGoyDpS1NmzTm1uOfrWNrpCKG4
         u1zfpDdMlHQWSWG5KAXNpgJ5pZ6FjQh+Yowdd3tqnwJW83gCwFGrrMvErdIwO/dRdNQ/
         tGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998685; x=1781603485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73q9o/RbMs9HsVClZc0TR5gGHz7oJNAXFjfet/bYLwE=;
        b=VFyRjez8B6Gi6Ms9exDcIYuvRfutaxJAtMyksGJ+f3UCytTvbcyLgpNrI5THP5rEP/
         Xwf/lNybCrh3+on1buMq6qglPMOfGQRM3tZFaF/M8laSabkZcszaCWNppRjPEK6nCUDN
         uVqU5NgunIwerDXujnWqngsxR1VpSStOEkY1C2O9eLmH7xboTT/ACq13vXiLSVeejAQE
         8FHAGNtX/ZB+jrDwZIDcHJfVrP107ZLwi8AI8FwljScgGl6khi7F1FLN4cYvIH66VShB
         A3+0WrptEmOZ46PzDWSDUx6t9Rg7IOiQjL9a7rsuHnD3zr2tfMwTB7rPq4EpobbJoYux
         pPlw==
X-Forwarded-Encrypted: i=1; AFNElJ+GSuNmXhs2RJLumjYPGm0USkKecQSjuHIsNDnIjkmmFw3AKM4t7/nYcRckqPW9cUhG3Br1u3gf3xfigyfR6Oc4@lists.infradead.org
X-Gm-Message-State: AOJu0YxpzwK4kVZdJUwwadUTQSmLme4axr/apT1kszSdMmh7TDdWye/P
	m6deaigXqpWp70xiJC9xWZjw5Z4UTXdkdrpvxsIMyy4udiyPiLsiv7iZ
X-Gm-Gg: Acq92OEkoxb+4j8Wrjy8PzpyvMhDfn8eFQgKV+FucQKTCZBxvn85U30Oq7od7CHj1Wq
	XcO18hmqgwzFcWaK+FxMj/RCzS0da3Qd5biC8AYqg/riuBt+J22o+5WMHg3KpN37ZxHJY9oY4bk
	ZNQYljDtXVIS1wtt+4a9PwEAGOfylpChxjxTEMTuG6mRefSn6LR5KZMzotykdGA4rElo0r8SrsW
	K2bAgpB7nC0H7mFubdkQlC6/3vzivkg5Wb89aCdKxGHnkRWMOV/D2BtWwM6J0BNsaXWMDskJILG
	sWZdczxxbIMhe35tsFRpo9EI9bOHZaU3f01m3qFZcbcd35ePTDqdyvpSOcnxOmaDlh5VjW/sB0k
	PBgOEnXRRdA0m9pumSq6Y9+H2QDOBOBXBOoBOuEjoFIKg83vSk+LbywhC1PPRN8HOXsvhZ+KxY9
	YVBpjFp8XlsuMly8dP1hM+AmWgimEzjnvfp0cup+Dg0DPUrWCF7eg0FyYI09/PNQQocDw3W+VhW
	tlHNWs/TcXYT2WVeMzrUoGstfsgDb7wY0R936PzaGd1U1+g0Hzqmz+llQ==
X-Received: by 2002:a05:600c:34c3:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-490c2599e11mr350748455e9.7.1780998685051;
        Tue, 09 Jun 2026 02:51:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm471043955e9.15.2026.06.09.02.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:51:24 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v5 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Tue,  9 Jun 2026 11:51:17 +0200
Message-ID: <cover.1780998600.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_025127_690162_B7BBA451 
X-CRM114-Status: GOOD (  12.97  )
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

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v4->v5:
 - Fix nodes order

v3->v4:
 - Add snvs nodes

v2->v3:
 - Fixed wrong som eth phy address

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 731 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1214 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3


