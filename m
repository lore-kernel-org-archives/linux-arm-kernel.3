Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C33CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 22:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e80+6vo9buWuYqu+Lf/tDAVDE3/qCFzJ8xmUUjjUM7w=; b=Na+R9ZNIM5IwCL7ioc641gV1So
	SZEVaSKdnAWTN/K/sFZehcTUw9EButRLsa0Q7vV8CUQfv/0uOMPaR5gX5wPDhGueWbBPF0lpw/u8M
	pTUI50M5StSbbUA7lXxp3GcnK5cTnoU+RE5Zlr48Am1BcuxYU6l4haZPT56QkOIvyGp3AQc5ZiFJX
	8HVsDHxLeB/7JtGecGwE1F4VFCV3dU1WoEcjF0wwJMVixS53A/VACU2csUE9jSiaK3LSldBba6OFV
	3uO2ihei1HuukKhb0Bfg9heYlIRG1b5jIxsMVumOLVRn2TX2aCffScpaxpP+/jvNTLiORAjSuXckj
	Bp1aRvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v45Jr-00000009BO4-2g7G;
	Wed, 01 Oct 2025 22:29:07 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v45Jp-00000009BNX-3vC8;
	Wed, 01 Oct 2025 22:29:07 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F0C521400227;
	Wed,  1 Oct 2025 18:29:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 01 Oct 2025 18:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759357744;
	 x=1759444144; bh=e80+6vo9buWuYqu+Lf/tDAVDE3/qCFzJ8xmUUjjUM7w=; b=
	MBB4CuZkuOmZWEShgelqtgsyJkDXYkMndglMB9gqZJ5Yq/inUoS2LAjpV8EWN687
	WRL7FkvlPLmdMJGc68mNeI5+xv7CQE2+z9vIDSfSlA0uh3/pS0JlogOV6FnficDs
	giZlACQEd7KE+qQMzkjBjZ3/6/9Zv6We0emrzE5nznwjfv5ii/zVobMxI7Tc+VJn
	kbLq0/U35dRYrW8dELQn5gtKUN125Y1yFQPn6MbstP2LhuhDFwwc/n1rSIteH4Fh
	8ANxWL2eLD6hhp/DQWWHSNdj8xJRmpScJteTwajNDz1EhUExPi384ZY0BXcI/YqR
	kCQA/kql1NEA9a+ZaZhj+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759357744; x=
	1759444144; bh=e80+6vo9buWuYqu+Lf/tDAVDE3/qCFzJ8xmUUjjUM7w=; b=B
	OrdYiMJw03ebe78oZYysH1NOqGKncnjFJCD9LK/bSIvDDJOYaHq2iLIxc3KwJodY
	umafGAu34sqe5bNSaydJxZHIdzYGl5bejyeluI8oN61mOAJXG+B0Z1OonmyHScY7
	6zlz5MM0J/96tCXIuH9gsDLKwlTbgHnlKLeFTvW8SZmk8JtCT+QSI4AejEwWA3tI
	pA5Tl7wFXY1GLRRGJv1H14JBYXk/iEgR9TmJzIGzqiOZGGpMB+XEBJkeXLMB0ERq
	lcC1PQMJvYtUU1VEVzfh8R3mOATJ4tgQA+R8XgNoqHsIq6NP62hQDFPhOmiJDAeE
	tWiXSc/E4FysnBljuE46w==
X-ME-Sender: <xms:MKvdaBT4cnljR2nmaF5eSB-50ZmfZ61uVTrmiBG1-12ld3xXmfOdxg>
    <xme:MKvdaFls1OZRgXhzaWuRwaZUvo3pX4CaTLPI76LO3E9QtGt7DfJrhgxv6EXF3QUcS
    VNBdPKb7zjXZNh2u8dS-2QrTQKT6XHpRJi5l6PHE5JPtAD1-x4--HE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekgeefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughsse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:MKvdaE_lIHtHMRznkTd9TW4evKIOAca-wLgTUQFZRJCBeWKslHpChA>
    <xmx:MKvdaGAMyMUjWIV7Qvt_hlkbpjHR_PFKD14_1BvDv1hKLcrlMtxmVA>
    <xmx:MKvdaBRUQQAv7WfMUg3QR8z91qjM8yYjiA-Ird6Zg5n3AHopekcnFw>
    <xmx:MKvdaFvj-jYJvL1_dw1NCxBdp-sE0HRqsJvXmXHQ6RCRGPbbk_J31g>
    <xmx:MKvdaNpshx1fGS5yHYusXRv8na6nM27uf2EvoDNRY9oOvdBJmdUaNuST>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B32CA700065; Wed,  1 Oct 2025 18:29:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AjqV-Bcf-9VR
Date: Thu, 02 Oct 2025 00:28:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, soc@lists.linux.dev
Message-Id: <cf067bf7-5990-43b4-b96c-0700b3d59293@app.fastmail.com>
In-Reply-To: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com>
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com>
Subject: [GIT PULL 5/5] ARM: soc updates for 6.18
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_152906_048312_F6586F00 
X-CRM114-Status: GOOD (  10.13  )
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

The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.18

for you to fetch changes up to 65d2419f931c08ead6722fbb9d4bd8cecb25a7e3:

  ARM: versatile: clock: convert from round_rate() to determine_rate() (2025-10-01 23:49:09 +0200)

----------------------------------------------------------------
ARM: soc updates for 6.18

The at91 power management code and the TI AM33 platform each get
a few updates for robustness, the other changes are just minor
cleanups.

----------------------------------------------------------------
Alexander Sverdlin (1):
      ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1 pins state on reset)

Andrew Davis (1):
      ARM: mach-hpe: Rework support and directory structure

Arnd Bergmann (4):
      Merge tag 'renesas-arm-soc-for-v6.18-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/arm
      Merge tag 'at91-soc-6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/arm
      Merge tag 'omap-for-v6.18/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm
      Merge tag 'v6.18-rockchip-arm32-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/arm

Brian Masney (3):
      ARM: OMAP1: clock: convert from round_rate() to determine_rate()
      ARM: OMAP2+: clock: convert from round_rate() to determine_rate()
      ARM: versatile: clock: convert from round_rate() to determine_rate()

Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Use SZ_256K definition

Kuninori Morimoto (1):
      arm: omap2: use string choices helper

Miaoqian Lin (1):
      ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init

Mikko Rapeli (1):
      ARM: rockchip: remove REGULATOR conditional to PM

Nicolas Ferre (3):
      ARM: at91: pm: fix .uhp_udp_mask specification for current SoCs
      ARM: at91: pm: fix MCKx restore routine
      ARM: at91: pm: save and restore ACR during PLL disable/enable

Ryan Wanner (1):
      ARM: at91: pm: Remove 2.5V regulator

Yang Xiuwei (1):
      ARM: OMAP2+: use IS_ERR_OR_NULL() helper

 MAINTAINERS                                  |  1 -
 arch/arm/Kconfig                             |  2 --
 arch/arm/Kconfig.platforms                   | 25 +++++++++++++++++
 arch/arm/Makefile                            |  1 -
 arch/arm/mach-at91/pm.c                      |  2 +-
 arch/arm/mach-at91/pm_suspend.S              | 41 ++++++----------------------
 arch/arm/mach-hpe/Kconfig                    | 23 ----------------
 arch/arm/mach-hpe/Makefile                   |  1 -
 arch/arm/mach-hpe/gxp.c                      | 15 ----------
 arch/arm/mach-omap1/clock.c                  | 19 +++++++++----
 arch/arm/mach-omap2/am33xx-restart.c         | 36 ++++++++++++++++++++++++
 arch/arm/mach-omap2/board-n8x0.c             |  2 +-
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 12 ++++----
 arch/arm/mach-omap2/pm33xx-core.c            |  6 +++-
 arch/arm/mach-omap2/powerdomain.c            |  2 +-
 arch/arm/mach-omap2/voltage.c                | 12 ++++----
 arch/arm/mach-omap2/vp.c                     |  4 +--
 arch/arm/mach-rockchip/Kconfig               |  2 +-
 arch/arm/mach-shmobile/pm-rcar-gen2.c        |  2 +-
 arch/arm/mach-versatile/spc.c                |  9 +++---
 include/soc/at91/sama7-sfrbu.h               |  7 -----
 21 files changed, 113 insertions(+), 111 deletions(-)
 delete mode 100644 arch/arm/mach-hpe/Kconfig
 delete mode 100644 arch/arm/mach-hpe/Makefile
 delete mode 100644 arch/arm/mach-hpe/gxp.c

