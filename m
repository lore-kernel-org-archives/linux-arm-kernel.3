Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEB7C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Wz4g+7ot6HdvLOjTX7EiZxAEslXo8qlb18PeyocVGY=; b=mm9mWVkgYHxAGTAVBpV7LNdH8o
	UZnqkArwh7dYrLSps36sQaCwN6coZ87gdobwxsWBArmoUpIKErHcjvAQQ7y/ji4NvfFBs14zB13f+
	W0l4S1lqlvK2X3W/V20k/TMxI9f6BtsrrFespxunC50uDFOcpq8KVBXE8JbDzkMSWpDdmFXgKvosC
	88uIDoLjbEFnkdRPMUv7XmdeFoafEO799GShqMVkbNGm/bMtQdeze1usE7QcNMxZ/GapO9YxO7o4m
	0lIUwlz8i1kWKWKb1KqKPsg2yXJNe72wFLCFXPBwhBbNdJ4jEroGPv67f3Jjmt9YzNJTd1G/JD8l9
	agMNFA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzduM-00000004T1D-0Q3J;
	Thu, 27 Aug 2026 17:28:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzduK-00000004T04-01Np
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:28:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-482dbc9a00bso880674f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851734; x=1788456534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Wz4g+7ot6HdvLOjTX7EiZxAEslXo8qlb18PeyocVGY=;
        b=VKECDy52iasvhQEgy8sW27QTk7Z1C2z2sUVjl1I7W3eGK5lJY9iT+ul2iWnvVxUMm8
         WqwFyZnTJz9l9O7DkOPBC4qXANOOmtnqpaxNO6NUB05bG+xgdsWh6Y/wjvIRBLZtkLxB
         zFWg0cnRRXwPBZpjLwMAKndViUNT8lcIcm+AeM+ttPmwikSIPhzjKocO6/bNV4kSwj0r
         dMoSoOHdTvlY0D/LKan1n3ZHeupgjc2FUbnClQfyF8j9rBCKioklX/bCwAskHyfcROKg
         WxAfxS3Y/K1fWBSciyY4DwLPzHtkzRIOY1YO4IOwEpBBSD/VcirdO3AWp2IAZDqmbIT8
         kf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851734; x=1788456534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Wz4g+7ot6HdvLOjTX7EiZxAEslXo8qlb18PeyocVGY=;
        b=k0Zmpqw+bEP4KPTXp+3sLRUuFjS3vEbt3eoMLt6hIeAGeqKqBdiCokrFQCOeuxgGCa
         4dClTBVmQSdvPOgxbWGN/zLem7gNhDyT21la4B+lacSGNSxUAOVKKySAaf2kejdXUnhm
         0QB9RBChCqh7Bh4Qav78x8GM78rcJ1tlkpZ+88OmF5DkDgQ5XtT0EYaVa9c+QJ7NgsYJ
         P1hG1RU1DhxKxMcQ6M/715ix9fR5dPpcgB+CqJXLZ8woNSThUszbQOzlxCJMRoiepsDx
         xfc8h+0t8SQQfKgYwjwrbmtO5FFOfY8LrJ6EFoZmqTFVXEjrSOnLMJ3haJGaJXGK+JJY
         BKpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgCHmm1NHJ5l6LH0D9rd+FOrNCAQPc8Ut9Y+8rmgfelJbbr8bSTbPkFSG50hp7JEgnEN339gvtXnkNeItNKqXd@lists.infradead.org
X-Gm-Message-State: AFuF++n4kpSpAQ2XkcDP86+ol2NCZKTBiOKUm6kdALSotG2mbhtXmjfi
	m+w+VtpRkTctmQQBBMKPnp00LrxSPzGkVk+rVpUj+H1d472E9U6ZUzQd
X-Gm-Gg: AR+sD10viECnvKtYjl29wZ2BuZiEO6esf9Rr2fGNkV6A9bJhZvAdSuIy3Q+9fKvCymg
	L5lKZUATX9Cr4P2af2BN1XUeU3qK/hhjrNUeA3Xh2K3t5RzhOgnrU8qfJPCi7ZpzUhcuaoaKnwL
	KmFaNm1/Cd4ovsnWrzChSKudv9Lxb9sgVhHS3HyjW2SzlJvxfT1tQKaRVuYSBbCfIHCErpa3PGl
	OJchBw3PzH3bxudER3/HIEEBrz10pK04HIb1ISdZaowl2m4k6JweXxyJQBS9dBk9LKyjXkd/lLf
	9BN1l3Pgvlzn6U1pj4vV7X3fAU/epZ+6L9lmx1QYK75UN0nfqV9if5rUvdvs7HQ1wUOAbCQS45K
	PGNONyD0h0Mhx6xLZ+BO0T/E48SFsL0hq97yd+xl9ftIuBmu3XyVshsT/8wCUFh1MdaUYDw/Qgp
	zKZSE96sLFOAB5yTKPbUbMoLjB2paPYC2hOKtM5uVi5+26HDU/K2q91Zp66IfTFkgArZGG+k1W9
	V6QsnP9NxjJdZnDQb979bzvZT/Gmx5kfsDuObvvt5XVhfR983S4pHRKGGzTDOHrLQ==
X-Received: by 2002:a05:600c:1e24:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49b91a6d41emr11236165e9.7.1787851733390;
        Thu, 27 Aug 2026 10:28:53 -0700 (PDT)
Received: from GLaDOS.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm2174405e9.0.2026.08.27.10.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:28:52 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v6 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Thu, 27 Aug 2026 19:28:45 +0200
Message-ID: <cover.1787851637.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_102856_070955_956F2DB2 
X-CRM114-Status: GOOD (  13.32  )
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

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

v5->v6:
 - Removed unused 100mhz and 200mhz pinctrl

v4->v5:
 - Removed wrong gpio-hog

v3->v4:
 - Fixed non-generic names and wrong separators
 - Fixed ads7846_ts pendown gpio

v2->v3:
 - Removed wrong header in dtsi
 - Fixed pinctrl name
 - Fixed sai clocks

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio property
 - Added disable-over-current property in usb nodes
 - Fixed model names

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  90 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 358 ++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 635 ++++++++++++++++++
 14 files changed, 1446 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3


