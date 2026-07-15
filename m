Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD84CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U6Z8UNdPRwdYEDpBm/8Wj8CPVrJHM5gjfHQvZCFzLD8=; b=yRXekXsmz8q9QgNQmQFEIRfsxj
	zpQFTMFhTzrX9XixJIOqoqxac6szd1eEUo/mrru2yieCktIbm+gmMlr8x3lHOChsim3iECfnuhgMv
	v+8jXOQGSyEqkYB/k3CfspZ08stv1kZ1EPPMU+z1M9QCG1ke83PXnH9sIpnJsfOcA4nDzVbkzbClX
	bwOkdMiBiI7HBe/2u8IqoRUg2hUTQvCVHN+tt2SBaO1wQUB7PPidZnP1CvCXrDqTsCx8Xw3Sv2YYC
	lAziiKihhUysjoiQlImUw6gTeEL6rkbGeYE/rEuMecVYArHvAlIjGUg+xfZCgOxuNDNY16GFd/eCC
	YoAnaaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxTQ-0000000EXE0-1kNQ;
	Wed, 15 Jul 2026 11:08:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxTO-0000000EXD3-1mM9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:08:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so10910315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113696; x=1784718496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6Z8UNdPRwdYEDpBm/8Wj8CPVrJHM5gjfHQvZCFzLD8=;
        b=sj204JA19LrswVQvdEw1HpPx2gmFLgGZ4OWgkqbAalRLJ7/uVHcBdK6GiF8ZJptqFQ
         m3HkOAdhjvTIujOY7PaxTWWMbP1ElLhbqvY/wC4q/JeRPv4T8M9p7w/llY3tVRhcwGXN
         Ct25hCriq0fg3wtE6egj8ur/ncTERsy/Bc41d40dIycpFvMtX/3cg7MWOX/9U35gu3Zt
         avxzXQhFVkZrM0At3EmfExr3dWhecs6pKa8PcrU1zl712ii5iOmdyj4P6DumWgGG0hcC
         uNl8ibFwYunI+n7KykiLQs9XDLMPX7jEbK+T/ggM4bq1BRlZ5dEAJvchM7QSOem9wwhk
         Fm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113696; x=1784718496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6Z8UNdPRwdYEDpBm/8Wj8CPVrJHM5gjfHQvZCFzLD8=;
        b=iAA3kQ5QvuEwynv59F72MoD5WB11vfHoLactZHmKPC4uQ1modn7QgvTkchzcs30u/2
         MSndTPi6ay4RD/jiKSOriLybska+ThlEYKd5FTcUSZ999w587sq7WDOe9N+iy5eUxSR1
         OzTypzFQFEbWo1Mwc1W7Uma7khaAxp3pGUXOesyqVQ2eFesWZAMHwuX+GI8dfae5IAgY
         fo+j32LNXpiB4q6loXZ5tvfpRq6lztYfP+iTpGFgIJuz2fir+duL+NofHu+IQJCMk15L
         SUkJjDtLPSBlLldfjA+g5YqE7Ky+DYo/k/a7QKQW6wV60Te1o0/orvTFzYBu22e83bhH
         Lnxw==
X-Forwarded-Encrypted: i=1; AHgh+RoLT2KtM+7lwVy2DvjcZrKzNy6v9fQhMlZMw6PbEbao1jzqjotQB7nah2nLOSli9wsrud8jMHrcCkdk4TUGBPr0@lists.infradead.org
X-Gm-Message-State: AOJu0YxUkYz0+NZHQWQLrNC6ezxGhMS8QhyjZUJTvO9oF7Xuq1w2J5rk
	bUHp0hQpSX/gpe/JFCexw9IIOZVuMjLfVM+mY6R3Zj6skwmTGjoXmKgI
X-Gm-Gg: AfdE7clVvkCoBYgJ5ImkAua7ci7/lNWyfC06E7zFnRfRRP1hQk+fsTSxuPDLA/gXjpJ
	5fytGqKQ6pEw9E8gxe7cwdHZTkk8KeJTtSx5kpYmu15Je7qhM3ELs8Hc4KPi3N4sd9pz16z38xI
	FY6i2deA0cw/bZDHqtXRUSEkAPmMtZbNKZyze/k5Zhyrw3+YijJRTAHIIOMOf9Dh+iAMouhMx4+
	ebw5wxpylzW8MrMk9dtEij4gG/5Grj0ggj+RFqXVi+n8F4kbYed7nKpqqRuMOREo0twCJhsMKew
	SmGTcibBCG0Xtn1W0KgnVIbq2jflceOiu705dBFgOSnVITZeTXTaPZEdnpbQpmPbWEPHtPpLG24
	HFk5HZ2zMu1FQX3fKluZHk+TU0wELWyj0azjzKEJsbTXzj2sJ85/G0YrK67/4K+pfqG38o0CW0L
	fuX/hBGojunPiaFzTrZxnpvER68TmmBXYogK87poAz9N2md790VApBlLeO1Q==
X-Received: by 2002:a05:600c:6989:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493f881de65mr167311485e9.22.1784113696023;
        Wed, 15 Jul 2026 04:08:16 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm151389875e9.14.2026.07.15.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:08:15 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Wed, 15 Jul 2026 13:08:09 +0200
Message-ID: <cover.1784113547.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_040818_478679_8184A6A4 
X-CRM114-Status: GOOD (  13.70  )
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
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 530 ++++++++++++++++++
 4 files changed, 1027 insertions(+)
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


