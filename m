Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F866D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N/ol6w5U/I3G5mumyd4ObEEvPxJoNR/D0sNXHyEsWpQ=; b=SBiCCCQUDH1FSS0HtOwnAJKRXA
	qE7jQtcJIPMR/tO19dTX22AeC8lTJ3cyqAjn1XwaBHLrJALJ2fyybjTl1+jmuWXKD3kA7kR4d4e0M
	37cVNhsGx3sAvxmIJeq51Ewlf7DNK9C/w+afqWqVREScUU5gDq+Hr/aJ5qRV53bzxanAN8boDEwOe
	WPJxtq2E+eR4DIjkOjsb/tYyIZHPPO3ay/bQeS2otZXnuBg28yt5cAy4/n1spOoHaSdHSLwXvr6df
	kCV7dn8IUf7y60DZmpCjob7nOVKVY9PWDMmALAlhdmYVCh2OcdnfBPCBMJhgB8vNsiUiyJZ9e5OXD
	W/tJyeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L46-0000000A50n-3htw;
	Mon, 28 Oct 2024 08:25:31 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L2S-0000000A4fU-2LRL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 08:23:50 +0000
Received: from localhost.localdomain (89-186-114-4.pool.digikabel.hu [89.186.114.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BC5DA89072;
	Mon, 28 Oct 2024 09:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730103822;
	bh=N/ol6w5U/I3G5mumyd4ObEEvPxJoNR/D0sNXHyEsWpQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QYmutohYKTpVo1JAIkpzTf+8DQAxG7ddtJ920JYMXW0bumFsCnBkzF3IF4i/mWXNU
	 D3sgM88cFhyWWsuuDN736mVptDHYrYUx8oQZDA5mEE6q7t50Wim85e5BcCalzY/qsV
	 tOwlaT7FUHjM1pE5QAbUk+Zi4Geqzt755TugNq6dlyZQvizboyf7HwplQcxjESXnRi
	 D7BJJREuw1TEzEJDFSExN2DegJID6gQyyQROW6Q3J0KlK96YWKXYsxcqjf86VGkCeh
	 wZgfL1VfJmAPwG0GhFw4AlF18eGryYINyJ2pq+MwU9Wsw2hC1DfJD8RpJxvn6AN6X6
	 mmoqZ8OBrrZRA==
From: Heiko Schocher <hs@denx.de>
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/2] arm64: dts: imx8mp: add support for the ABB SoM and carrier
Date: Mon, 28 Oct 2024 09:23:30 +0100
Message-Id: <20241028082332.21672-1-hs@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_012348_928355_96C3ACBF 
X-CRM114-Status: GOOD (  13.57  )
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

The board uses a ABB specific SoM from ADLink, based on NXP
i.MX8MP SoC. The SoM is used on 3 different carrier boards,
with small differences, which are all catched up in
devicetree overlays. The kernel image, the basic dtb
and all dtbos are collected in a fitimage. As bootloader
is used U-Boot which detects in his SPL stage the carrier
board by probing some i2c devices. When the correct
carrier is probed, the SPL applies all needed dtbos to
the dtb with which U-Boot gets loaded. Same principle
later before linux image boot, U-Boot applies the dtbos
needed for the carrier board before booting Linux.

So intentionally, there are no full dtb images for all
carrier combinations, only dtbos which applied as needed
on boottime.

Patches to U-Boot mailinglist not posted yet, as U-Boot
uses the same dtb as linux, so hope to get the linux
files first in, and use them when posting U-Boot board
support.

series is based on:
819837584309 - (tag: v6.12-rc5, origin/master, origin/HEAD) Linux 6.12-rc5



Heiko Schocher (2):
  dt-bindings: arm: fsl: Add ABB SoM and carrier
  arm64: dts: imx8mp: add aristainetos3 board support

 .../devicetree/bindings/arm/fsl.yaml          |    2 +
 arch/arm64/boot/dts/freescale/Makefile        |    5 +
 .../imx8mp-aristainetos3-adpismarc.dtsi       |   64 +
 .../imx8mp-aristainetos3-adpismarc.dtso       |   14 +
 .../imx8mp-aristainetos3-helios-lvds.dtsi     |   89 ++
 .../imx8mp-aristainetos3-helios-lvds.dtso     |   13 +
 .../imx8mp-aristainetos3-helios.dtsi          |  103 ++
 .../imx8mp-aristainetos3-helios.dtso          |   13 +
 .../imx8mp-aristainetos3-proton2s.dtsi        |  176 +++
 .../imx8mp-aristainetos3-proton2s.dtso        |   13 +
 .../imx8mp-aristainetos3a-som-v1.dts          |   18 +
 .../imx8mp-aristainetos3a-som-v1.dtsi         | 1210 +++++++++++++++++
 12 files changed, 1720 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi

-- 
2.20.1


