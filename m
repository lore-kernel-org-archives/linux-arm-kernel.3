Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D67C54F2E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 13:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KU5b0C5IBMALgRXRMDkd/wslgmOMlnTPEARvynr96Po=; b=OTGs45ifR8Wqw9lpH30DSl3N4V
	Q1PYzgJWbpRT5oTv2TefOM4uZyOB8hBJoKkFYQtDX7V0wG3taRyPr7/MYQgxjyNjPVR2tRAP850FH
	0U75moG85Bs9WIfTZc+Hq5IBgllB0Umdmuj63zMgkzKfVpBYGLugwpCIvFDF1qO01mP+ybxLgw9ld
	4ggW/TQ79bei3vABJvZUYrny7FJ8SISJmpiQlnlX3bKbDVoN6eyTcXwxd7YpSExUHZzc7w9rOaSAg
	PxXmTIUHRfn37ZQU+GHqHnwZbuHCX5JR36HNM5Jztv8JK8yU9Ztr4UjHRLROxrdGItRgDJio7Qffe
	0Lhvq4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISc3-00000003z5l-2hyr;
	Fri, 23 May 2025 13:39:03 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISUi-00000003xiD-2i7l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:31:30 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 62D6F138011E;
	Fri, 23 May 2025 09:31:25 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 23 May 2025 09:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1748007085; x=1748093485; bh=KU
	5b0C5IBMALgRXRMDkd/wslgmOMlnTPEARvynr96Po=; b=xatwRtGRZBM9O+Y8N8
	Lw9IwwlKk8b3km7GogUxi6tSffyD9oa6d+omzaLvLKd/spStaU7oERIKeoOVsh9J
	GSoeeW6AO9SQQ4fGclXIzde86IJknc61NAGH7IiTtZzw25pEkgA9RBRZeafe1BLt
	hWY9mm1a/yB3tjr8GQCRyAURLjNCXNJt0e2se5vCfWG+ZepxZ8HOsCTRgu39AYCy
	NY+xoJ9X7h21wwUqG72wrdHXK2W/Q/rluJ5rLB2rwQs5yv64ZtN8FlIfdCqiez7+
	pOJcDh+t6Echlir9h3Lm/hBAZwsyhxTEq7uYlh+7W3o1iIuVG0Pa3gKrY07oBR16
	6XoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1748007085; x=1748093485; bh=KU5b0C5IBMALgRXRMDkd/wslgmOM
	lnTPEARvynr96Po=; b=CnPGWYENOcYcVcJNc8P+TW4yEXryyZOU7AHUWWl83Vqa
	eC6bTdF9+lIUdGvh2rfelPo4WSa6DPVtL3GtoEBcfnOgZaCaVtV+oCCck+CF3Jh3
	iODlX7bhUF8s+jSBQUHwxakUehunJUl4NsY+rxR2exXzsaRJGE8yDvXfxYYH/7vY
	CfyPtlOJ/FTuZsd2dGdC/tYIAkDN1LwJ0OP5Qpd8J8dpYDMYFzZZKWwg/J6U3Nby
	cVGp5hdQEEitoSS1NupVuz4Tz4ZXdgIsF08L4uno6MnAN0WK5sOE1jhV9BfN3jqf
	0Ceks12xvh59P+g9yn14GzQkyGrP9qxBEwqi5B6Nig==
X-ME-Sender: <xms:rXgwaEm2-k9BaSIfXS2lBbpW6jlScIC9XXyl03wuNs7pmFVL0I_kMg>
    <xme:rXgwaD1Px-6j_DOyCEqgSDLYusLSoGNVxnu7hbVpwqzZnDYVMesCJsAfCZuMtuYk6
    vbeqASnUZcdmvDZR4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekleekucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkffu
    tgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorg
    hrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhepudelieegkeevueegtedt
    jedttdelgeehhfdvhfeuheethfduleffuddvueelveetnecuffhomhgrihhnpehkvghrnh
    gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggr
    thhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlih
    hsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rXgwaCrjqaWgV3MuBFWHYPZeDNuSLDdSNqVwS8cRNFy7Nn8u9IaRZg>
    <xmx:rXgwaAnhCEesldGpxZ49V9b5c1wUYdPBn8RHkBnavH8Y5GVCa4VBZw>
    <xmx:rXgwaC2rhbcfe0RdYIZVYhcCAZzpGbhzqfvzUyGRaMeA9ss9A9-zvQ>
    <xmx:rXgwaHvsFpBZX2poYYmiU9IfcrvcJFf-yFQ4DMQBTtUb9gsGOgln_Q>
    <xmx:rXgwaLPNCVxQOutr0YMZvj-24PRWueJHZTSUiQSQaW6sHxsT6TPCQffQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1EE161060060; Fri, 23 May 2025 09:31:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 23 May 2025 15:31:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <de1a7a9e-7823-4f98-bf9e-99d8722c28b8@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.13, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_063129_022205_0309396A 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 15eaaa71e8ef142b122942b35653d513cfb90050:

  Merge tag 'imx-fixes-6.15-2' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes (2025-05-10 11:10:38 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15-3

for you to fetch changes up to 070d04f002ddc308b053df4723e83cf43719fda0:

  Merge tag 'mvebu-fixes-6.15-1' of https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into arm/fixes (2025-05-21 23:26:54 +0200)

----------------------------------------------------------------
soc: fixes for 6.13, part 3

A few last minute fixes:

 - two driver fixes for samsung/google platforms, both addressing
   mistakes in changes from the 6.15 merge window

 - a revert for an allwinner devicetree change that caused problems

 - a fix for an older regression with the LEDs on Marvell Armada 3720

 - a defconfig change to enable chacha20 again after a crypto
   subsystem change in 6.15 inadventently turned it off

----------------------------------------------------------------
Arnd Bergmann (3):
      Merge tag 'samsung-fixes-6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/fixes
      Merge tag 'sunxi-fixes-for-6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/fixes
      Merge tag 'mvebu-fixes-6.15-1' of https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into arm/fixes

Fabio Estevam (1):
      arm64: defconfig: Ensure CRYPTO_CHACHA20_NEON is selected

Gabor Juhos (1):
      arm64: dts: marvell: uDPU: define pinctrl state for alarm LEDs

Ivaylo Ivanov (1):
      soc: samsung: usi: prevent wrong bits inversion during unconfiguring

Jernej Skrabec (1):
      Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection"

Tudor Ambarus (1):
      firmware: exynos-acpm: check saved RX before bailing out on empty RX queue

 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   | 38 +++++++++----------
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    | 14 +++----
 .../boot/dts/allwinner/sun50i-h6-orangepi.dtsi     | 22 +++++------
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi  |  8 +++-
 arch/arm64/configs/defconfig                       |  2 +-
 drivers/firmware/samsung/exynos-acpm.c             | 44 +++++++++++++++-------
 drivers/soc/samsung/exynos-usi.c                   |  2 +-
 7 files changed, 75 insertions(+), 55 deletions(-)

