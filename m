Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ED0C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U6hKrX+f54qW1llsOGRsC3hsxY9DfQDweyuPaxBt6U0=; b=TWz+EuOP78xIYNGi6B37Vy3RuA
	pfyuPOsRGIUYQlM3AKEhcJTREgi3CJcyZrQv7cXwuv+gWA0XIVOMz7V74XwkKFbk1hzRTznyHQiE2
	HSqWN9zWQs2tUD4XV7cbPXURj9ZVNpVr/q8AVrnl3B+JdwgmihTGHPLzeNlNDNeQ6saTSoSx1GoaI
	oSISaQsxXIJozUw8qVlrKdyje8u1Iag6mknVGnRi5GaE4zQpg1OFCe0EJtoBT8osyjwmOgNgXe65W
	wtSwM3h0UlHAnGYg/AFRuz5RS9kPiJY5icheLY3IyES1pWci5SdFsmfwylhLd7lTGfpUJC8FtJ0IN
	oIJQ6mTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfpG-00000001yCf-1TDI;
	Fri, 17 Jul 2026 10:29:50 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfpD-00000001y9M-00D5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:29:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47640541585so3822349f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784284185; x=1784888985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6hKrX+f54qW1llsOGRsC3hsxY9DfQDweyuPaxBt6U0=;
        b=e4ZiYaF01wURQEryUT/ig53UV/j5Pb4Du4+9vjnKMUwDEuACI+nfB/ZBfVz5pXz+xN
         UWlrGDVca+Fer2oV+Jok0Cwf+qQXP63XcOYh5Q2Y033Ve6OqDKOqQsxIa5Xcnie0Ay08
         J7tiF2ZbjtBq2RthlhnGtwR2Nzp8yHXVNJXgKG5sV+wmJYRNMMy2DAlsrwFHh2JutPP0
         r5DIgSucPOuBi+zb/u90vYjRz508jan4CLtQMKgdMmy22uKI/usfd5kGKW+N9JtJYnE2
         DxN1WEmdS2tC/zN+T8csmT9r3yxAp6pWLFcVGI5RbzXwmvN8PoTVBdsAumf6BhAo20sO
         1LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284185; x=1784888985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6hKrX+f54qW1llsOGRsC3hsxY9DfQDweyuPaxBt6U0=;
        b=c5HbVWTAhDCzegT33vhl4AB3X10bH5hnh5H1yb6Z1rivQDlMm97YKfoGAm2BtwjiLz
         +5AGha6OWSnUa2Q6kzN0V9kBo27yPLx9a5SlPvAui+ROwzHKfIYoqgxkPYxRjn0kDFD8
         rxTsQN/wD9IbW6UTOpOcyhBAIQTuk9g+OzyycZjn4a956b4c0a1gt9lDLBIkTudmrziX
         dNS3LoV1JkXgykyV6sblQEnFL6gju670e9zqunfQBtRHoKdzz7XO4OiCKSgAejVU6nhe
         8eY5tDSMzeMWNT/cdHOwT07cj+89DHLTv8BuNMkyYiOQaJwYhxs77qzQUBzZn3GEJej0
         j0aA==
X-Forwarded-Encrypted: i=1; AHgh+RqYqvTGcYyqiW+IxZesPcXPiYg+jaBD10GLjZtDfbb5UrUO/VJOXRvQtUkb0C48tTo+4flc/lUSqPSg9lgldK6h@lists.infradead.org
X-Gm-Message-State: AOJu0YzDy6MZ6Uh0JToAztkmeIuZV9fYONTD8tQ5HHB7cbsGkQITUIW7
	NEN0tq1YnPRvSRLT7cP76Y1e3YoI+KBRd2cANSG/Rh5zHDcsoNDJk0FE
X-Gm-Gg: AfdE7cl/COcT+K+zCeYpzLMGnra9sTUUE92TT0TEXAWunQFaxclhicNRQJOjjc3Flwb
	XW+KKTJgQzlTqpjajMyEDKL8pIo0NLXR2ITCtR9HLVVCGgLaN1zu+BgJi/Cqqy16o8saYhN7qCw
	HPdJKVHHgHV6OHpbIeDRZxWmuykbJAASQpcblzZ8WXfbuSN4lESpy8OqI3yiNr/2WYp9C7st8t8
	QvlsNF5VNCa1A6XCJV6VIAAWA821Jf2IG3MjitFj+LPY0DpGwTYxcECmrniXvywm0qUC03++JoH
	EcpMk7m1f7cM3mJZBb7Sn1+d3YvZvrjoVo7GE+eY+q2ZGUaQa9Zh2f5JvgDmomxXJWL2wbT+kSp
	XQ2WtnzGEgZmd//dQ5NNObV/JhQUK+cmgzy99P+gnS8HYH2Slo/XPe+PNfOmpSpTtVazdsHdqwu
	Fm2oxTCg+01m4W/TqUtaIOK28fL31YjUSIq3Dj9xyrWUGURynfFURckCoN2XBAUZp8tfplEAGnT
	MyJQRoolknFiQU=
X-Received: by 2002:a05:600c:46d0:b0:495:3e81:770f with SMTP id 5b1f17b1804b1-4954a3f398amr21164725e9.15.1784284184783;
        Fri, 17 Jul 2026 03:29:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm39931735e9.6.2026.07.17.03.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:29:44 -0700 (PDT)
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
Subject: [PATCH v6 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Fri, 17 Jul 2026 12:29:36 +0200
Message-ID: <cover.1784284092.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_032947_071729_E7774C6C 
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

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v5->v6:
 - Fix regulator typo

v4->v5:
 - Fix sai7 clock
 - Fix codec regulator voltage

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


base-commit: d089adef10f380cbdf65cbb87a59a9aab86cb0d2
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


