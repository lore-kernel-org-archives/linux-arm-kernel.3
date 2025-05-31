Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD52C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oMwDLq+Cc90r6I5PN83nBy5IIQ6yNR0ch7EQ/+SVKM=; b=MF0EtFd/88TgogZxDcJVZdbPjl
	rcuohcflWxCraeB+6IzSHe099Ts+VxzdV9yN6UR2NXM3DnxuEsVu0DY5MAIP4BdveNsy2ZcIuq8PP
	/WpM32oqMwWuaqW6gF9uT94JbwpErjWROLPs6j8D2OaFIHgbXpS9tFIp1hrele4QCKOS7GRXiO/bg
	Bx8ZEKMziUL+Ko2ZRqGseSDU30q9O1oJ+EVwk2YyNR/iKCy0sUXbzQWGZfYLYbSIbKmkBQfGZtniI
	ihu7iWZW6rnXVYuEqLy1xaaxBj+unwdQD6q76WMWxb2QqKtqY7Ejqra2lDPMHaTnF+b+JLXBlvmrs
	SSO6Nt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLIAv-00000003YsC-13uB;
	Sat, 31 May 2025 09:06:45 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLI7U-00000003Yd1-0VQo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 09:03:13 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C5ED11140133;
	Sat, 31 May 2025 05:03:10 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 05:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748682190;
	 x=1748768590; bh=0oMwDLq+Cc90r6I5PN83nBy5IIQ6yNR0ch7EQ/+SVKM=; b=
	JBhdNhgf8/rqlznPjQmw1B1AtFplc1x60MmWpuDszV3M6wWQlL9EKDiTANNFxDlh
	ZSwEQv5LyKrElXYUyhUGJIeXCpYNFYoqsq1T67heTiKt4W3Gq0F2Gr9vrx0TLuNT
	WwNonM+wBLa2MqIdT/++T2MzBNuCApxtFg1EDFuyl3BVkYPMiNIrEIbncqhnUeZv
	idZv5JlJy5Y5COLh9Rjyg5gn9T8TEpgBq0nov1yv9FZ7fiJuuZZCRCOnFD2ofUGF
	LbJKcRF6lfUtRh3lSzgbm71R5HHSYEF2gtwLc9stL2ZqCQ84rmo9/nTUEHowhpsE
	ur4fnS0g2TeNL9MBZxaI2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748682190; x=
	1748768590; bh=0oMwDLq+Cc90r6I5PN83nBy5IIQ6yNR0ch7EQ/+SVKM=; b=j
	8f7sEAeFQsY2sOwAyhU3Qazqt2jRYYZxkpqt7XXiX+hggthnAWZI0RTWHCjPaa75
	XdvwnuDT9mI0VNQrXt1z6+1me9DBRQGXZD5v/XJiazlnv/l02NiFMdRAjvf1b8iu
	qGl2AGAtiR3UiRewCha8m0JGn5gkEW/kistOA76VFlOC86aP5lAmc1yf0KwDJA/y
	nUYUmT6Lazf/hOSLGDBKSiIPD0ue5lJQKl3742RhcLl9NMIByQVO8b2aZDRZh6k7
	M1iAj6CEQg2hZYxEZGlyHIOvRu2/dzPByVf68fVZ98t5Ir2Oivn9fIouePKXNYwu
	50RUP1aGun/fHY0Rok+1g==
X-ME-Sender: <xms:zsU6aANjTEAlnGiHWtWCffrNu8VWlhCKVGjtCGIP4yGsnEJduXgNmQ>
    <xme:zsU6aG_2NCq5nvOkkDIDe-p8yai_bZjqVVMx05KZ5IXz2CSgrXN2hUXtu7WiSSo63
    f6qp19o0laggI2dAps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudegleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeefffelleduheeh
    leejtdfhheegtdffhedtffeileehkeetffevtdegheduhfeiudenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprh
    gtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgu
    sheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zsU6aHT_qPXIUat_cLmSbpwaeb0D0wbCwQ7nxDwVbhofMGZnpRnOng>
    <xmx:zsU6aItoSsqYYiK6UlEw6MrfpMLePlQxgoR7MyKdg-6ws_8LKb4wDg>
    <xmx:zsU6aIcpAyJwZrruElvN7x1ZmovPlSnCwb5Ljb1OfoHRcF-0LJFWoA>
    <xmx:zsU6aM2UAi4m79AYAseT8yT1kLjhRgyqMsQlDbLD5ypYNHupsHyBJg>
    <xmx:zsU6aNWpeym9QRoqb47kTH_xF-0NpyUDVBkvmFDaFalDZWN9uYSFE9Mk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 71D26700060; Sat, 31 May 2025 05:03:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T97262eb0f1793ba4
Date: Sat, 31 May 2025 11:02:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <0744995a-856f-431f-b694-6919ca161c65@app.fastmail.com>
In-Reply-To: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
Subject: [GIT PULL 2/5] ARM: soc updates for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_020312_234670_B98373D5 
X-CRM114-Status: GOOD (  11.04  )
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

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.16

for you to fetch changes up to 16066e29d3f5a45cd1ced62dacfce45c9560be1d:

  Merge tag 'arm-soc/for-6.16/maintainers' of https://github.com/Broadcom/stblinux into soc/arm (2025-05-22 13:06:28 +0200)

----------------------------------------------------------------
ARM: soc updates for 6.16

The main update in size is the removal of the TI DaVinci DA830 SoC
support. DA830 is similar to DA850, which remain supported, but
only the reference board was ever supported, and we removed that
one 3 years ago as it had never been converted to devicetree.

There are some other cleanups for OMAP4 and a few boards using
old GPIO interfaces.

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: davinci: da850-evm: Increase fifo threshold

Andreas Kemnade (2):
      ARM: omap2plus_defconfig: enable I2C devices of GTA04
      ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4

Andy Shevchenko (1):
      ARM: s3c: stop including gpio.h

Arnd Bergmann (4):
      Merge tag 'arm-gpio-set-conversion-for-v6.16-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into soc/arm
      Merge tag 'omap-for-v6.16/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm
      Merge tag 'davinci-updates-for-v6.16-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into soc/arm
      Merge tag 'arm-soc/for-6.16/maintainers' of https://github.com/Broadcom/stblinux into soc/arm

Bartosz Golaszewski (5):
      ARM: orion/gpio: use new line value setter callbacks
      ARM: sa1100/gpio: use new line value setter callbacks
      ARM: scoop/gpio: use new line value setter callbacks
      ARM: s3c/gpio: use new line value setter callbacks
      ARM: davinci: remove support for da830

Krzysztof Kozlowski (1):
      ARM: broadcom: MAINTAINERS: Cover bcm2712 files

Parvathi Pudi (1):
      bus: ti-sysc: PRUSS OCP configuration

Sukrut Bellary (1):
      ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY

 MAINTAINERS                                 |   1 +
 arch/arm/boot/dts/ti/davinci/da850-evm.dts  |   2 +-
 arch/arm/common/sa1111.c                    |   6 +-
 arch/arm/common/scoop.c                     |   7 +-
 arch/arm/configs/davinci_all_defconfig      |   1 -
 arch/arm/configs/multi_v5_defconfig         |   1 -
 arch/arm/configs/omap2plus_defconfig        |   8 +
 arch/arm/mach-davinci/Kconfig               |   7 -
 arch/arm/mach-davinci/Makefile              |   1 -
 arch/arm/mach-davinci/cputype.h             |   1 -
 arch/arm/mach-davinci/da830.c               | 506 ----------------------------
 arch/arm/mach-davinci/da850.c               |   1 -
 arch/arm/mach-davinci/da8xx.h               |   2 -
 arch/arm/mach-davinci/devices-da8xx.c       |   1 -
 arch/arm/mach-davinci/irqs.h                |  27 --
 arch/arm/mach-davinci/mux.h                 | 404 ----------------------
 arch/arm/mach-davinci/psc.h                 |   3 -
 arch/arm/mach-omap2/clockdomain.h           |   1 +
 arch/arm/mach-omap2/clockdomains33xx_data.c |   2 +-
 arch/arm/mach-omap2/cm33xx.c                |  14 +-
 arch/arm/mach-omap2/pmic-cpcap.c            |   6 +-
 arch/arm/mach-s3c/gpio-samsung.c            |  10 +-
 arch/arm/plat-orion/gpio.c                  |   6 +-
 drivers/bus/ti-sysc.c                       |  19 +-
 24 files changed, 67 insertions(+), 970 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/da830.c

