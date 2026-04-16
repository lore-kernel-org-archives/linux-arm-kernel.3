Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCB7F8DFD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 22:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/i2aHjzZFDd342Qm1G5j14XG41aWchiGGVrFJ3pBHE=; b=ptYBEdx7CGwIWccJMp3OPRi86v
	mDAeMzAXNKVZXb0+w2blvmfQnSJ2RfmkzjXworimmhhqvAvbA0YeXf89QyNfb5LM3qvhlLGpYcGya
	3oMLXQv/iGjsTU+eNk5bT48I98PCIU2dLF5XeazJYpKL2JF5ORRsLxfAvUmg8yKeucTwrKF1S5BfO
	Hrv5y73GddPqj0JZwDHxsVYxWotL09PXAMHH4of6Ut5H6hOeoN9ClNWHq3LReARpBdRSfCI5j8W9L
	0K+5i4c/eqVQ9MisNrbzaXnFgS6Tta1sTaGpH9anbXsphOn2eFvPanlEE1EHQELeCwsF7xSVNOrHq
	dG/wllvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDVG3-000000038xq-1HOQ;
	Thu, 16 Apr 2026 22:32:23 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDVG0-000000038xR-3fMe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 22:32:22 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id ECB4A1D00280;
	Thu, 16 Apr 2026 18:32:19 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 16 Apr 2026 18:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776378739;
	 x=1776465139; bh=G/i2aHjzZFDd342Qm1G5j14XG41aWchiGGVrFJ3pBHE=; b=
	h6mZ3vXb3PL+3jLe5yH6i0N2ltlmwnZ/JJwl4PxkFMuT+pV1ma8Vv3ltdK4TKPi1
	TXUeTfRq10irJfiv8YdCUskmZmHxRZAaHkvPB1UfBkdnkJPhwQcImLQ0zSZHgzTl
	WlzTbGhWO3t5lpiW/BY8ds02AZ+y8WU2p4jTKOq4vpsfqMarzyUm37BECHqpEXaW
	q+FYI1Vk2eI/Jc4NcokXnD+CbYzPJAf7Q4EXgQi7CUvy+MSVfv8BlheGWIfkAYmQ
	J3SJKQ7TOQzuB3aPmst8PE0ZyNYP3s52A6tEubXnsiKrF7ctvJ6DLD3dOZjgP/dd
	VICRM5sJzpXpp1ouHw+r0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776378739; x=
	1776465139; bh=G/i2aHjzZFDd342Qm1G5j14XG41aWchiGGVrFJ3pBHE=; b=Y
	GY7WoHjo/KZwogjsY1W37lpwL/X7897Ms0cWKolxf2xWzzLefOMJF2fRWpcANYNr
	FE7lUsIN0gxAtHDONieSxL6n/Ul/4s+bB34Ns5W40phrCu6wgkoRs5OpSKDNZSRB
	gIINJvIg+dbssoDtgp8SlWh6ti3yWu2HdQpnoxYxHYeYhdCewcii29WcLzvqLv1t
	oEHgm8b/DUpIuz1W3dM7QaMBz+n5ZZlC+U2Zs17dpnmWlpxWtIPV4zqvBHPBu/s7
	PAjgAkbvrn947ZZWRBApADXceuuRzb7SFGqTmG30QDFjjdlnr0y/9yB/qRnNIahT
	N++hjV+KtDiUoN1cbm0wA==
X-ME-Sender: <xms:c2PhaUbM1d5hNDreLmRaIKQurBc1jQb9NgAfOQpvbF_PdPBnPgU-3g>
    <xme:c2PhaaOxpdb_zJb-8viGIQAPQiFAE-nudZqdN1HKi2MNNWEF6wHo2aVt7CmzqBn9A
    lFccVG9Fca769hxezQ6n0X9JcR47W7V07STa4tsyX4eda39xkL-Qv8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegkedvudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:c2PhaeGBx1VOVI7RLIHLH-y2zKS-a4yt8Jv7bPMkJ-jsEUHr2xCbeA>
    <xmx:c2PhaWNZO7lUhpDPphF7-tsfuRRCeJg6VjAcdPYdC_jHcAo8Jrlkrg>
    <xmx:c2PhaQeU6hQzLW4i3tsvsxwy7aoINNMs0oFh1SyCcPgw2p2dCf6E9A>
    <xmx:c2PhaTt79LYNbOkh-0xVzvrJCI8BfpRsxJ-5nnZO8eA3rrPfvShNTw>
    <xmx:c2PhadeKA5Z21QOiyrE7v0GrbheutTrHCqjgkPqaJxGb-CANPuUzqB0R>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 86450700065; Thu, 16 Apr 2026 18:32:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 17 Apr 2026 00:31:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <2af6e914-7d5f-4976-8b18-0a98ad3a427c@app.fastmail.com>
In-Reply-To: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
Subject: [GIT PULL 4/4] soc: ARM code changes for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_153220_963300_DD328466 
X-CRM114-Status: UNSURE (   8.10  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.1

for you to fetch changes up to 3ef628c3f37f1dcef0da51e73ad6e458ec74bddb:

  Merge tag 'microchip-soc-7.1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/arm (2026-04-04 17:34:56 +0200)

----------------------------------------------------------------
soc: ARM code changes for 7.1

These are again very minimal updates:

 - A workaround for firmware on Google Nexus 10
 - A fix for early debugging on OMAP1
 - A rework for Microchip SoC configuration
 - Cleanups on OMAP2 an R-Car-Gen2

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: OMAP1: Fix DEBUG_LL and earlyprintk on OMAP16XX

Alexandre Marquet (1):
      ARM: samsung: exynos5250: Allow CPU1 to boot

Arnd Bergmann (3):
      Merge tag 'samsung-soc-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/arm
      Merge tag 'renesas-arm-soc-for-v7.1-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/arm
      Merge tag 'omap-for-v7.1/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm

Bartosz Golaszewski (1):
      arm64: Kconfig: provide a top-level switch for Microchip platforms

Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Use of_phandle_args_equal() helper

Julian Braha (1):
      ARM: omap2: dead code cleanup in kconfig for ARCH_OMAP4

Krzysztof Kozlowski (1):
      Merge tag 'microchip-soc-7.1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/arm

Randy Dunlap (1):
      ARM: omap: fix all kernel-doc warnings

Thorsten Blum (1):
      ARM: omap2: Replace scnprintf with strscpy in omap3_cpuinfo

 arch/arm/mach-exynos/firmware.c                    |  4 ++--
 arch/arm/mach-omap1/clock_data.c                   |  4 ++--
 arch/arm/mach-omap2/Kconfig                        |  1 -
 arch/arm/mach-omap2/id.c                           |  3 ++-
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 16 ++++------------
 arch/arm64/Kconfig.platforms                       | 10 ++++------
 arch/arm64/configs/defconfig                       |  1 +
 include/linux/platform_data/voltage-omap.h         |  4 ++--
 8 files changed, 17 insertions(+), 26 deletions(-)

