Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907B8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 10:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ye4rhWi9SDp5LACCi5yZ5nCHf4hS/USMtbfmr6BzvY=; b=rX2joLIG2YebzSoWvlGAUQ+bH0
	AOTzF36UPs3DCFGzN3YZpYSepgdorVShie5GqCiy2jR78sSjnQE0uJGhn8MQbnQwqIGE2Q4VV2rHR
	896ed7lRc+8V3zjllVN88VcAfbspgTc4UIf7fSlcTEmjepqJ1Xb3Dsp0vKs4+UhBuoOF8f46rAV0R
	kBBWW+sXHbGWnWHiAvMd4zdPl10fKRBQv4DdmloOG1yLoQE4M6nBZ0aDBx0+AM2mevinc3Qsn1HJN
	2kzZjGrj997+6T1FA5QvtRz+c/ObLtP2RRpqkbQ5sbhDk1fxHfaKPYdmqMWqbcHRKmqDmQMHltxjB
	nlVjNkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcNk-0000000BN1C-0rjd;
	Sat, 26 Jul 2025 10:44:00 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcDN-0000000BMEG-1mYq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 10:33:18 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C898714000E7;
	Sat, 26 Jul 2025 06:33:16 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 26 Jul 2025 06:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753525996;
	 x=1753612396; bh=3ye4rhWi9SDp5LACCi5yZ5nCHf4hS/USMtbfmr6BzvY=; b=
	ThgahSXlXfl6nLkMNRsuay5cUww9XWim3fTErQUH6PKk7UoQe5QZU9DTyt29FfDv
	PuFvuhHAK9KseplQcgr0A2loE+4oM9SjOEp/pBw2ldXMrvONMmOnxSKqvGIm/Qnz
	culuLFWI1hmre1pqpiIuMjvAjgyaXV2HlYPsyFclGlBoKoeO+LYdXJ1y2x3PfHgw
	fbzZG2pbGJ+1MyTYL4r4mVI28fUHpf6p8/akKgvaZr8w9+39Yp/JTkFQc8EzWJR7
	qm09eHPJcWD6fZ2EJVfEkkZKJFC7xQYYvJbmbxcQJQrM0cbxZucm3EPtQdnrrp/X
	u7KWero3899oC5t98BM9Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753525996; x=
	1753612396; bh=3ye4rhWi9SDp5LACCi5yZ5nCHf4hS/USMtbfmr6BzvY=; b=L
	sQVwtIonMNYcdLFvCwr1fYH3YGAj5/k0QuSnhhkSQgoA8h0vUDcIpCycHMEO9zYf
	IEMvvaQcmQqTigNgbe8t5+nhDXeff/DqT5mbPsTXih+hINDtTYBin2lMqCarsjFL
	/oBMloal3fjKTwssz84vnByNh4Szp/2X/0TbNGOSFKzht7KnXvl/sqoX/6ix786w
	x7z19TEJI4zMaWFm7jukmULOLlGpkHshzXhA3suA60PmXIhmMSFsX6YS6rYtcWan
	aJa+mAt5GAO7nbNJ2g1XI6aZ94/QzrnF2ov0kwGo7ZX1clYKJ5BacyOPWlbq8B7E
	O9RYQmXGW39gaH42a4mLA==
X-ME-Sender: <xms:7K6EaFNIFpdYRUq5xhQKZJySo4LgV1jjpblRWbiF9SGnc2zzqAKyCw>
    <xme:7K6EaH958Uc94JGdOD72cY2j-F4a1LscjVOa461UR4V4iyy8EG1eEkpPU4OcWhvPn
    QxPr8YuSnF_LznSTXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekiedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughsse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7K6EaBMIrd5rrV66Eol5q5-BAJgguMzXC61RxlhTm26FFKurwmDWKQ>
    <xmx:7K6EaPcUhNOcX032Bfn7u-nQl6tqKdp-Ht_qcHwfWheG70SFR5D1eg>
    <xmx:7K6EaGsBaMWx5cz4OonWJfw-6UWhqGHqgX_EfwnCRVghOC87Hxc9jA>
    <xmx:7K6EaIl5SMw7SMbPuoSe6CV8pPjRrhvdMut0poFlN9UbEHXtMp04nA>
    <xmx:7K6EaPtS-vbmOOplDENhREDm728fzRMXQ7RwdrArqXQ0nrWA24IultX9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 97C25700065; Sat, 26 Jul 2025 06:33:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Td03a27401e83a0cb
Date: Sat, 26 Jul 2025 12:32:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Message-Id: <fa83a407-a48b-4a91-8b06-6c9b6074f735@app.fastmail.com>
In-Reply-To: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com>
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com>
Subject: [GIT PULL 5/5] soc: arm code changes for 6.17
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_033317_535705_45DA7146 
X-CRM114-Status: GOOD (  11.34  )
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

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.17

for you to fetch changes up to 8c1f5a11dad0a9043c17c4c0240f394e481baca6:

  Merge tag 'v6.17-rockchip-arm32-1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/arm (2025-07-23 07:51:03 +0200)

----------------------------------------------------------------
soc: arm code changes for 6.17

Another small set of code changes for the 32-bit Arm platforms, and a
trivial update to the Kconfig entry for the arm64 TI K3 chip.

Andrew Davis cleans up the system reset handling, which touches a couple
of platforms.

The mediatek platform needs some code changes to support multiprocessing
in the newly added support for the old mt6572 chip.

----------------------------------------------------------------
Aaron Kling (1):
      ARM: tegra: Use I/O memcpy to write to IRAM

Alexander Kochetkov (1):
      ARM: rockchip: fix kernel hang during smp initialization

Andrew Davis (1):
      ARM: Switch to new sys-off handler API

Arnd Bergmann (5):
      Merge tag 'mtk-arm32-for-v6.17' of https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into soc/arm
      Merge tag 'tegra-for-6.17-arm-core' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/arm
      Merge tag 'ti-k3-config-for-v6.17' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/arm
      Merge tag 'mvebu-arm-6.17-1' of https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into soc/arm
      Merge tag 'v6.17-rockchip-arm32-1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/arm

Bartosz Golaszewski (1):
      ARM: sa110/gpio: convert set_multiple() to returning an integer

Guillaume La Roque (1):
      arm64: Kconfig.platforms: remove useless select for ARCH_K3

Kuninori Morimoto (1):
      arm: orion: use string choices helper

Max Shevchenko (2):
      ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
      ARM: mediatek: add MT6572 smp bring up code

 arch/arm/common/sa1111.c          |  8 +++++---
 arch/arm/mach-highbank/highbank.c |  2 +-
 arch/arm/mach-mediatek/Kconfig    |  4 ++++
 arch/arm/mach-mediatek/mediatek.c |  1 +
 arch/arm/mach-mediatek/platsmp.c  |  7 +++++++
 arch/arm/mach-pxa/spitz.c         |  2 +-
 arch/arm/mach-rockchip/platsmp.c  | 15 +++++++++------
 arch/arm/mach-sa1100/generic.c    |  2 +-
 arch/arm/mach-tegra/reset.c       |  2 +-
 arch/arm/mach-vt8500/vt8500.c     |  2 +-
 arch/arm/plat-orion/gpio.c        |  6 +++---
 arch/arm/xen/enlighten.c          |  2 +-
 arch/arm64/Kconfig.platforms      |  4 ----
 13 files changed, 35 insertions(+), 22 deletions(-)

