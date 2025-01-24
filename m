Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD22C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuv154PFa+Or4Xs/jn6LudX1tt8F7elcDG9gWdvfHYw=; b=cxvmAr6RW7GasHcXDAviQO3Q1G
	sQ7c32koFtrCungfTVBcDVX2UFTw4dGY5bSGcHlnc39ISQONC97YKuWHX/mCHGV7xjvLbf3IdN70L
	9jKq2lNLBBdoXOxBIpH38g5RASyYtP9+4sCf4doiqE6mvVGx5y8zPq85Ue08BYWWbv3e1dF2682yy
	C22MlvyXF1CCIck7eQcF37/0bQpkbSUpGlooARg6eMB2tYJ7RBROUuwrkSoOMYdAED2/JdttgqXAt
	T+Pi9aPRXs7cmbihc1TR8CTsEL1KFnrCsfXk3UcGdOiujhW7hMXhOgguUGMU1BpTPjfBXZhMJveKv
	IOqLYxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLFn-0000000Euni-2OX5;
	Fri, 24 Jan 2025 15:05:51 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLE1-0000000EuOa-1rpr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:04:02 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C73DA114019F;
	Fri, 24 Jan 2025 10:04:00 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 24 Jan 2025 10:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737731040;
	 x=1737817440; bh=cuv154PFa+Or4Xs/jn6LudX1tt8F7elcDG9gWdvfHYw=; b=
	lBbw9g5weWLsSg8HC8x2+yGg/Kud3X+F9AwakZ1eB897uUlJSD0heLLTLZA9WuNv
	KLro/hD48DPLKWafr2rZCMjfyrAFYo21pHRAttqeH6f5yIHHiS3Y1ZjB1aNKXtIN
	DVCD/tDLSc+bJAweEjRIGlcTDFSQLUSAIMg2l4SMr5OSzfgbbLVdZcLDJ+NBP/GB
	mjmpMeJ7lQ5rp/H31EO2tVuktFZ1wdqO54paDX8Pkvj4wVnGeXw+LvfXPhEs+c0L
	D7dTzi/Do1IEBNKkYsMjuzshM1nSwuFd5VGbbiVy67YeRgxqtqhMO+2NbuGhbccr
	vgWpASxyoqrG0urqpGUw/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737731040; x=
	1737817440; bh=cuv154PFa+Or4Xs/jn6LudX1tt8F7elcDG9gWdvfHYw=; b=H
	sVnubIzChW+3LwFxrF/AvLx1662Blj9/ibPKeFUj0bEjmgW1d7qAV1cNQpCoe/gu
	Rx3So8zwEWkDouu+hVI+nVpCOF4nSA0XpB2Ynv/g6EZBT5CYf0/VzbpbVKiOhsNr
	chDpV/4toXUn5RYEtfNXBZ0LbS0ylUXjNSsslPuLmP0fPY2BSpRtPXyl/w/escy6
	qMn7bRrZfUR06fGTBIXxUqvL3atogyVgN/Bq4wvtBTiXDkIGEM6zSBI7G3AqhiFL
	tfoHi0zMfJIv8gNayMDXmI9xvEaUt3FXKpvh+F8UbyJcu9RF76siq4iJuZP7lHS5
	KNVTGuVw7epnXi5Jf97Nw==
X-ME-Sender: <xms:4KuTZwpLZJV28rfDVcsm5cLZ3whf184qfHeBfjaPoQ6BK2XkeoYZug>
    <xme:4KuTZ2oLTdj7PPaBgRsxKWf-WMB-pFsBAPy-uomiBA1Ff2Gp-1zigSewHch3dNGWl
    CIMCFK0Tusa82UKs3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedggeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefffelleduheehleejtdfhheegtdffhedtffei
    leehkeetffevtdegheduhfeiudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgih
    hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhn
    uggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4KuTZ1NwJ7qAxtEd8eh3csQVaGFjcio_cpn0ajRcrzNcfwAtcvz4jQ>
    <xmx:4KuTZ37RHH0mLvPWNc0Q9Kp44zeGXNUigGjGlrAu62iD2pfuLn0Osg>
    <xmx:4KuTZ_4q6Mmt6i16I3vMXpzseGKCP_rcpoIv2UfTz874eDuyqQUGpQ>
    <xmx:4KuTZ3geifU-M1uIcFtOq5Nb3BqihJ80tG0RZ8vMiLp_a1gkBRBdsg>
    <xmx:4KuTZxnbmaXdon_bizfuJ67ImTZguuTLylS9JC3dUwza4TDY5kDZuJGl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7401C2220075; Fri, 24 Jan 2025 10:04:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 16:03:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <f3a7e280-9d47-45f2-aef4-394b378ba99d@app.fastmail.com>
In-Reply-To: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
Subject: [GIT PULL 2/5] soc: new SoC support for 6.14
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_070401_563512_376F5706 
X-CRM114-Status: GOOD (  13.76  )
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

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-new-6.14

for you to fetch changes up to 0bcf3ac14626f1c174c262834656603769579497:

  Merge tag 'spacemit-dt-for-6.14-1' of https://github.com/spacemit-com/linux into soc/newsoc (2025-01-23 17:36:29 +0100)

----------------------------------------------------------------
soc: new SoC support for 6.14

Two new SoC families are added here, with devicetree files and
a little bit of infrastructure to allow booting:

 - Blaize BLZP1600 is an AI chip using custom GSP (Graph Streaming
   Processor) cores for computation, and two small Cortex-A53 cores
   that run the operating system.

 - SpacemiT K1 is a 64-bit RISC-V chip, using eight custom RVA22
   compatible CPU cores with vector support.
   Also marketed at AI applications, it has a much slower NPU compared
   to BLZP1600, but in turn focuses on the CPU performance

----------------------------------------------------------------
Arnd Bergmann (1):
      Merge tag 'spacemit-dt-for-6.14-1' of https://github.com/spacemit-com/linux into soc/newsoc

Nikolaos Pasaloukos (6):
      dt-bindings: Add Blaize vendor prefix
      dt-bindings: arm: blaize: Add Blaize BLZP1600 SoC
      arm64: Add Blaize BLZP1600 SoC family
      arm64: dts: Add initial support for Blaize BLZP1600 CB2
      arm64: defconfig: Enable Blaize BLZP1600 platform
      MAINTAINER: Add entry for Blaize SoC

Yangyu Chen (8):
      dt-bindings: riscv: Add SpacemiT X60 compatibles
      dt-bindings: riscv: add SpacemiT K1 bindings
      dt-bindings: timer: Add SpacemiT K1 CLINT
      dt-bindings: interrupt-controller: Add SpacemiT K1 PLIC
      riscv: add SpacemiT SoC family Kconfig support
      riscv: dts: add initial SpacemiT K1 SoC device tree
      riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree
      riscv: defconfig: enable SpacemiT SoC

Yixun Lan (4):
      MAINTAINERS: setup support for SpacemiT SoC tree
      dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3
      riscv: dts: spacemit: move aliases to board dts

 Documentation/devicetree/bindings/arm/blaize.yaml  |  40 ++
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |  28 ++
 Documentation/devicetree/bindings/serial/8250.yaml |   4 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  18 +
 arch/arm64/Kconfig.platforms                       |   5 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/blaize/Makefile                |   2 +
 arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts |  83 ++++
 .../arm64/boot/dts/blaize/blaize-blzp1600-som.dtsi |  23 ++
 arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi    | 205 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 arch/riscv/Kconfig.socs                            |   5 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  26 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 452 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 22 files changed, 921 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/blaize.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/spacemit.yaml
 create mode 100644 arch/arm64/boot/dts/blaize/Makefile
 create mode 100644 arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts
 create mode 100644 arch/arm64/boot/dts/blaize/blaize-blzp1600-som.dtsi
 create mode 100644 arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/Makefile
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1.dtsi

