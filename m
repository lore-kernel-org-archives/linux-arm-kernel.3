Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5905C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8kHsaoCbnmz2MgVuxSTzK+1NmqxlS+HUS7BsLkQjvdo=; b=jklqnfBLFQK1ReDerAUOzKwdA1
	/VLSYY90MC3tco713jyDxF+3spA51vWzL7qeqSvEGXqXSRZBC/1bMnRqPb9HQY9OgHtDoi1wgz9HF
	uplKymRgeWoJq7UPp8WcnX9wcO7SPOkHPdlcz0mdPoPhZpfT/Ea3uDw1rl4zqTEvl/PiNNlsX+xo+
	hn9lwpcx1LiyDb4bsPRZbsZG8M7vxgIqpuI/8dqY0oy+f9FgB7SbOcYYYuirRn+d8HCjygJL9WeOD
	NhhqAcCZq8D9NCY/2Uy/enpeZb0xwLKyrYSgGVaeQRM0wYG62+0qfKbsbSCTPRzfM5QCPRHkOeZsa
	+nqlaQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Ot-0000000EUP0-1Kl1;
	Wed, 14 May 2025 08:23:39 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7AP-0000000ERW2-39UK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:08:43 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 5588113801E0;
	Wed, 14 May 2025 04:08:38 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 14 May 2025 04:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1747210118; x=1747296518; bh=8k
	HsaoCbnmz2MgVuxSTzK+1NmqxlS+HUS7BsLkQjvdo=; b=j8lRNJgDrN6R1Q14nZ
	EVc593KlChl0krY9iCnvyayMu8QEFJyBiKo4h4DEGdOQHCs7I7W6fRMUHYaAnPtw
	6TJALqVmKaNgsx8UXbOWvYlwgLfX179vpGHp+Wu6SthRruaFoE7oiqtv4PuGm2sc
	D05w96tfxjL6c4XcDjbXXiiSJbfuYNjsORI6OKEd94Ahdy/ArvW5l+4eHBJudV7X
	nX01GlOoQpvfK82Zw///vhIFV9jIp4V9MvVaF1xx4CmLOkpPiBe7MK3FfpcXVPzX
	+OS30VRa+9sLwe/Oou4A7RhF7L3VNvbE1WbAofHi5gGCu+2n2fxuoUNJdeqsSLUQ
	5m8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1747210118; x=1747296518; bh=8kHsaoCbnmz2MgVuxSTzK+1Nmqxl
	S+HUS7BsLkQjvdo=; b=a7lnlvvBAMzsWQ/9vZx+QqCKA150lWqlZOWwwQ2gfauz
	RJMDo67lksD4cuEgAE/os45cUDk4gmwIPihQzBu2ZDYgbJ8Ptmsbk598ucc1T5I1
	kzkmEXeQvZo8g1YwwJMmfLOIthfmqF6pNv5lde8n42UBeprmJ5vCnvhQVCFxEzdL
	x0kr4tYTZ4pET0vlRVnTTCG1lEhVPEg25jXUgmoUin7UC0p4iohN/KLmcR/zygW6
	XL42cpCw1JVQVtkkV2XuAjDUr2842ybrSM/mXZp3yn7xuD055/GvBR5pUsCAc2br
	xVuwhnecVHViPq/XtbXKWWS/+YJa1IkxX/gbqEYY2g==
X-ME-Sender: <xms:hU8kaNtOZaBO3FOFNuYklBiVq28n3MTZUiaLV-m9OkB4vKxjV3W9jA>
    <xme:hU8kaGdx1TMerLYngZFPBNdsYDk8gohM_5T90xnS4OIJdZTJ5cu87t2UdDB4ndFuB
    ZiU7kejN72rNhFjh9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeigeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepjefhgfeugfdvvdegffeifefgleefkeehjeefteei
    ieelvdelgeelkefhtdehtdehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhith
    hhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:hk8kaAwrGKqL2Q85bsl2nnDya_gNM7BUYD6iFTzSMPb-ImFqWsbQ_Q>
    <xmx:hk8kaEOI6n7Hx_5g0gsa21Bo5rycuyTb7z6gzsVtcSVJy31QV1UjIA>
    <xmx:hk8kaN_6T7RfTlhJb45vbVBsEcZiCxoIEXtQMZG9neCZeVZxPkRpQA>
    <xmx:hk8kaEXH7MnZEMY4hdO1bsM28qq6nOZdX38u_U5hMBXXFz5PfZtDlA>
    <xmx:hk8kaMelvn8oBydj7daLjhraacgjohhERTLNI79EPyS2ZvlcqZQnRvxb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E42701C20068; Wed, 14 May 2025 04:08:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 14 May 2025 10:07:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <660e30e8-7ae7-4a55-a136-9b0aa4e5ad0b@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.15, part 2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_010842_285217_FEEC1E14 
X-CRM114-Status: GOOD (  13.18  )
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

The following changes since commit 2ef5c66cba6171feab05e62e1b22df970b238=
544:

  arm64: dts: st: Use 128kB size for aliased GIC400 register access on s=
tm32mp23 SoCs (2025-04-29 18:16:28 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-f=
ixes-6.15-2

for you to fetch changes up to 15eaaa71e8ef142b122942b35653d513cfb90050:

  Merge tag 'imx-fixes-6.15-2' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/shawnguo/linux into arm/fixes (2025-05-10 11:10:38 +0200)

----------------------------------------------------------------
soc: fixes for 6.15, part 2

These all address issues in devicetree files:

- The Rockchip rk3588j are now limited the same way as the vendor
  kernel, to allow room for the industrial-grade temperature
  ranges.

- Seven more Rockchip fixes address minor issues with
  specific boards

- Invalid clk controller references in multiple amlogic
  chips, plus one accidentally disabled audio on clock

- Two devicetree fixes for i.MX8MP boards, both for incorrect
  regulator settings

- A power domain change for apple laptop touchbar, fixing
  suspend/resume problems

- An incorrect DMA controller setting for sophgo cv18xx
  chips

----------------------------------------------------------------
Ahmad Fatoum (1):
      arm64: dts: imx8mp: use 800MHz NoC OPP for nominal drive mode

Arnd Bergmann (5):
      Merge tag 'v6.15-rockchip-dtsfixes1' of https://git.kernel.org/pub=
/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes
      Merge tag 'amlogic-fixes-for-v6.15' of https://git.kernel.org/pub/=
scm/linux/kernel/git/amlogic/linux into arm/fixes
      Merge tag 'riscv-sophgo-dt-fixes-for-v6.15-rc1' of https://github.=
com/sophgo/linux into arm/fixes
      Merge tag 'asahi-soc-fixes-6.15' of https://github.com/AsahiLinux/=
linux into arm/fixes
      Merge tag 'imx-fixes-6.15-2' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/shawnguo/linux into arm/fixes

Asahi Lina (1):
      mailmap: Update email for Asahi Lina

Christian Hewitt (1):
      arm64: dts: amlogic: dreambox: fix missing clkc_audio node

Dragan Simic (1):
      arm64: dts: rockchip: Remove overdrive-mode OPPs from RK3588J SoC =
dtsi

Himanshu Bhavani (1):
      arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card time=
out

Janne Grunau (1):
      arm64: dts: apple: touchbar: Mark ps_dispdfr_be as always-on

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Align wifi node name with bindings in CB2

Martin Blumenstingl (4):
      ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM c=
lock
      ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM =
clock
      arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clo=
ck
      arm64: dts: amlogic: g12: fix reference to unknown/untested PWM cl=
ock

Nicolas Frattaroli (1):
      arm64: dts: rockchip: fix Sige5 RTC interrupt pin

Rob Herring (Arm) (3):
      arm64: dts: rockchip: Use "regulator-fixed" for btreg on px30-engi=
cam for vcc3v3-btreg
      arm64: dts: rockchip: Fix mmc-pwrseq clock name on rock-pi-4
      arm64: dts: amazon: Fix simple-bus node name schema warnings

Sam Edwards (1):
      arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down

Tom Vincent (1):
      arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyel=
ec-cm3588

Uwe Kleine-K=C3=B6nig (1):
      arm64: dts: rockchip: Add pinmuxing for eMMC on QNAP TS433

Wolfram Sang (1):
      MAINTAINERS: delete email for Shiraz Hashim

Ze Huang (1):
      riscv: dts: sophgo: fix DMA data-width configuration for CV18xx

 .mailmap                                           |  1 +
 MAINTAINERS                                        |  1 -
 arch/arm/boot/dts/amlogic/meson8.dtsi              |  6 +--
 arch/arm/boot/dts/amlogic/meson8b.dtsi             |  6 +--
 arch/arm64/boot/dts/amazon/alpine-v2.dtsi          |  2 +-
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi          |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  6 +--
 .../boot/dts/amlogic/meson-g12b-dreambox.dtsi      |  4 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  6 +--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  6 +--
 arch/arm64/boot/dts/apple/t8103-j293.dts           | 10 ++++
 arch/arm64/boot/dts/apple/t8112-j493.dts           | 10 ++++
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  |  2 +
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi  | 12 ++++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  6 +++
 .../boot/dts/rockchip/px30-engicam-common.dtsi     |  3 +-
 .../boot/dts/rockchip/px30-engicam-ctouch2.dtsi    |  2 +-
 .../rockchip/px30-engicam-px30-core-edimm2.2.dts   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  2 +-
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |  2 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  2 +-
 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   |  4 ++
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  2 +
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi          | 53 +++++++--------=
-------
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi             |  2 +-
 26 files changed, 93 insertions(+), 63 deletions(-)

