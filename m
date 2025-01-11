Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E430EE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 14:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=34gZ/s4AlB0jjAGQJU2nx7MhNV2S2LDWkK2MogxSqa8=; b=OhLEjXFpfeCCYQNf6BSCMAMR0V
	vx9To76saNBzVU67PGbdSqfZ9xbxQ2Eh8AsZHFmA5a1baQCyv5StCRAEZMGmRqxqo77wzd46PUwnu
	wT1XLJivHfFfY/n3zhl4gsRhX9/Bd+XoQkrsFPEVyAy0Gi8kKRkl7Csc348DQv1mUJJg4XBd/51Y+
	Dyb5uGEVGuv0SswUV7xV0EckCAYQdccs+rP8Ic05AwjidXZ8fxl8EYWkM0w4qVFaUFb/YSjNrte4p
	hZbnCMfkUYpmT9AuyrqDBPicP184z0QpND4NlCukzFw87JooX+eywZrnqGfBHjM8ltiUEaj3E4QW2
	aLc53Axg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWci1-00000000vuy-0BF2;
	Sat, 11 Jan 2025 14:43:29 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWcgm-00000000voi-1scE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 14:42:14 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 162F213801F4;
	Sat, 11 Jan 2025 09:42:09 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sat, 11 Jan 2025 09:42:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1736606529; x=1736692929; bh=34
	gZ/s4AlB0jjAGQJU2nx7MhNV2S2LDWkK2MogxSqa8=; b=VOUmwLc1zSez4ILBEV
	/suI2girg/GtTLwG3LlWjlLShP0TbjmMYzgSp9QNpQ7fDsk6Dk2iossnvCZuCvHK
	fNpV5ItxTdB0x0iA78e4Peo0QQ0gyHMeXajFdhhLZvHTjn/Futrag4R8WVEfhz7P
	d40iHkxqP1wx3ZQax6LWXbXfYBoUR6xY/5ryAdhvjhPDOez/pqQrZlFbeXEl9PiX
	9tI5ZbajZdQuWdgM/Rdt8ZytfwiJ+YBv9D7eNYTeiz75QJsWu0jCkq4d/Jwq3TNy
	VvMt84X6rlGlfxOsH4hbSWsmNZQ4Y+BYx1QGIijxXEB1LRAtQrBXTt6sIeNqgNGH
	Zb9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736606529; x=1736692929; bh=34gZ/s4AlB0jjAGQJU2nx7MhNV2S
	2LDWkK2MogxSqa8=; b=Um6TsWYcceSSWEIX3BxmiBpGKA4DuaS1yug2o5A9XIQM
	jGu6rBA6oP8tBwKwZLAqyS4VTttcOQiY8asrFiLM2/ZiiSVyT6WEfsSAgY0i//QA
	bCE+yHjcboVs+/kjc0BMHi75U46Z38W/P99FOOZ4J/kA9nJcPBbLL837W6AxotvY
	gINP0ivmG2YXrFHata0AglyobZWpkxxVYTPErg10uQlBz4PoVMmvXLbkyuupptqA
	OeOja8ueh9aXroH9o23SobKNEEGq7KnxUoZ68IV2KAzAHUiyexPXmFq1SUN85oeO
	xE16AqyCKCS/62CS0+6oSqZcz0B806Gevl6s+U63Fg==
X-ME-Sender: <xms:QIOCZ8j7DyesgFqjTn-51a155ATvTL_y0K04BYZfNiFHhz_fkJvA_g>
    <xme:QIOCZ1AAWtLpZNI-cnARrE3CWbPBGtZqhRDc8TvdT4_cGQacCFmEraq_LiedbRIbK
    5SmJDq8H4fXhgSYleg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehtddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddtnecu
    hfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvg
    eqnecuggftrfgrthhtvghrnhepudelieegkeevueegtedtjedttdelgeehhfdvhfeuheet
    hfduleffuddvueelveetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgu
    sgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihn
    ghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlihhnuh
    igqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhk
    vghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsoh
    gtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohephhgvihhkohesshhnthgv
    tghhrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:QIOCZ0Faug3HNBt4tVjFCuslNJChNJ2sItXUYIKZqJlRWwLK_PpK_w>
    <xmx:QIOCZ9Q_PhxKVjmRNK61fNG7viEV01xxtkYJpWFzcBNTrkzD-2b3FA>
    <xmx:QIOCZ5xpjd_lZR5vZd_QrdQ3G-hH7nhXo_0jDYjXsv6W4wv4DrO0nw>
    <xmx:QIOCZ767zmDgEjbMqYPK_e3Ze-Mj6ok1lG8UKaGy6dVwI4aE4S8Qtw>
    <xmx:QYOCZwnjE82zaeU9NUsc0XaLMH1efZ5ihiynqOdntcmizQboaGeHYnru>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 72A1E2220072; Sat, 11 Jan 2025 09:42:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 15:41:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, "Shawn Guo" <shawnguo@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Message-Id: <ffc40760-bb53-4e6f-8e0b-efa1fbb171e0@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.13, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_064213_207546_7F3BB7D1 
X-CRM114-Status: GOOD (  10.15  )
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

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-3

for you to fetch changes up to 5391c5d8e60610bf914f767a6a749004e2d223f0:

  Merge tag 'v6.13-rockchip-dtsfixes1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes (2025-01-10 18:20:59 +0100)

----------------------------------------------------------------
soc: fixes for 6.13, part 3

Over the Christmas break, a couple of devicetree fixes came in
for Rockchips, Qualcomm and NXP/i.MX. These add some missing
board specific properties, address build time warnings,

The USB/TOG supoprt on X1 Elite regressed, so two earlier DT
changes get reverted for now.

Aside from the devicetree fixes, there is One build fix for the
stm32 firewall driver, and a defconfig change to enable SPDIF
support for i.MX.

----------------------------------------------------------------
Anton Kirilov (1):
      arm64: dts: rockchip: Fix the SD card detection on NanoPi R6C/R6S

Arnd Bergmann (3):
      Merge tag 'qcom-arm64-fixes-for-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'imx-fixes-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'v6.13-rockchip-dtsfixes1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes

Chukun Pan (1):
      arm64: dts: rockchip: add reset-names for combphy on rk3568

FUKAUMI Naoki (1):
      arm64: dts: rockchip: rename rfkill label for Radxa ROCK 5B

Frank Li (1):
      arm64: dts: imx8-ss-audio: add fallback compatible string fsl,imx6ull-esai for esai

Jesse Taube (1):
      ARM: dts: imxrt1050: Fix clocks for mmc

Jie Gan (1):
      arm64: dts: qcom: sa8775p: fix the secure device bootup issue

Johan Hovold (3):
      Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
      Revert "arm64: dts: qcom: x1e80100-crd: enable otg on usb ports"
      Revert "arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers"

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sa8775p: Fix the size of 'addr_space' regions

Peter Geis (1):
      arm64: dts: rockchip: add hevc power domain clock to rk3328

Qiang Yu (1):
      arm64: dts: qcom: x1e80100: Fix up BAR space size for PCIe6a

Stefan Eichenberger (1):
      ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF

Wei Fang (1):
      arm64: dts: imx95: correct the address length of netcmix_blk_ctrl

guanjing (1):
      firewall: remove misplaced semicolon from stm32_firewall_get_firewall

 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi                   |  2 +-
 arch/arm/configs/imx_v6_v7_defconfig                       |  1 +
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi           |  2 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi         |  2 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi                   |  2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi                      |  5 +++--
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts |  8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                     |  8 +-------
 arch/arm64/boot/dts/rockchip/rk3328.dtsi                   |  1 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi                   |  1 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi              |  2 ++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts            |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi        |  1 +
 include/linux/bus/stm32_firewall_device.h                  |  2 +-
 15 files changed, 36 insertions(+), 15 deletions(-)

