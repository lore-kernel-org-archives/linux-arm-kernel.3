Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C85D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3uq0SZEPhziDDc61M9zIiUZK8zeUmB0j8mVWX9Yf3sI=; b=m0VLZjx83qGJdSyFf9Zt1icTUJ
	Ch/3xq/YwCeWUS5qO40rjIrU4UYqZxiavm97RedgtkKv/Khbzrf1l003h53w1S5SL+/N3bHXzXskU
	qhawv0lpmXeQsy7uX6FR0+ToVj4Rt9kR3BTHNYoLUuLvmOaJCTHLZccv7iDWEAasL1qtDDTbS3xTZ
	ls44fTLGgjb1QsDQc3VKR8LANExGplD62Gq4bNcyouME8IjtJ0mhKooBTWGs2Nv5UzFTtEh51j35w
	Dpnz8GJJ0xMm1Dr+8Et0ggMfZX2X4avuj+nwN2ujPnXGGMj7ZVpiOVabIPg6BQ/M3DkjtNBKtOhHZ
	ZbfNGwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1bZ-00000000e2q-2v27;
	Fri, 28 Nov 2025 16:45:57 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1bX-00000000e16-0DRC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 16:45:56 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id BC2C5EC04DB;
	Fri, 28 Nov 2025 11:45:51 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 28 Nov 2025 11:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1764348351; x=1764434751; bh=3u
	q0SZEPhziDDc61M9zIiUZK8zeUmB0j8mVWX9Yf3sI=; b=el6qpgaou0Wo7IiJUl
	FmoTXHnAlqhSFW06w82HUIXlfOKNE6gR/oyElFm28Qh6hQYQm1A713mZZ1wW1Bjz
	xQy5JqBKZrGMn4UVRs9aRbPDXt02sc/SOSEgDhqrCB0E9LX7PbRQeTb3+XWhvali
	IkIiuSam1ZVtY3HKMXcNtqWUqsAQg2eyxkCmvFJ4HrDNzXSSOYBsfbsIYIY7wFMS
	bYkp7fl4/TFqqCqReJPoeWYhWt5ApLURFzoJLZeRJGVFZFa8zImZKd0dggD0sKiz
	LpRdKV/BaWOzwhye4rNRglPIGVbTbCoUvkSn2ghalycBi8vEs++6G/syrHnprMeM
	BEQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1764348351; x=1764434751; bh=3uq0SZEPhziDDc61M9zIiUZK8zeU
	mB0j8mVWX9Yf3sI=; b=Ka6bXhrdqo4gT9EBOXYojK2xxJPbbETmub3+qrwuoTdT
	zCsyra+Xber8pmjmzgGg98DajOl5vCdxgj1yB6FS1+bav7N2d1YA5LnVl/936yh+
	VxgPh22kGVHLFSsR9gh0EcLsHo/IMwRNTuX3VFM2P9AYQ5NFhcf/bSp1Zp1OTxNp
	U5KYe0JdbN1AUsWw6QVAPofJVT4Xt26lLqw8ViqNNbWY2PAWhhYiKXruHNSWcCiL
	+lQ3FLYpIfEAh5Sz1eFzG0nQKkwdODE61scGNEgbI0r3CB9sSZWJphebPhpKIGgG
	UBs7TYLMpTKQxNofVXTtdG3V5ipgeN4SOgt3s688XQ==
X-ME-Sender: <xms:v9EpacFz0RbhfuENU1DdhmpIrOscDbeHDz9Wg-VXA1lO3s0mrtP3cA>
    <xme:v9EpaQKDqNSCFpR1wfeMedp0wBdu8nRJSpxEnn9rkbzOMTxxZxULEOSvO1RSXXuyT
    dJyjEZkqL-gGkra7ybTWwMmoDkCkXg6kkyaF5IyZyTn3piVgdeIdX2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvhedtfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epudelieegkeevueegtedtjedttdelgeehhfdvhfeuheethfduleffuddvueelveetnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslh
    hinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:v9EpadyCi0_SBnz5QO4DK4pRy86yC9_k8Lh7p0431P610eiPt_L94A>
    <xmx:v9EpaUJG9bs_SKVZbjWDI3RDqe41OMMYKiQAGXyIvNcaQHFmUgRGQA>
    <xmx:v9EpafrIeAjOvsHU0ba1d7-PdeKWawY-xBKLSGCQ0rmdB-_YBXCKMA>
    <xmx:v9EpabJYF7gBt2yUv0j-uRY-Z0HaTihHU4dbK1UwVlHmm7bOsVsG-Q>
    <xmx:v9EpaWY_KzS8EeJncFCfIDeO-6kclFwxtrrGwrMeBuV98F3sI-9DZvF2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 41B61C40054; Fri, 28 Nov 2025 11:45:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 17:45:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <be1c0b1e-4e4c-420c-ba0c-f19ddf30e657@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.18, part 4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_084555_404825_4C514DB4 
X-CRM114-Status: UNSURE (   8.11  )
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

The following changes since commit 2eba5e05d9bcf4cdea995ed51b0f07ba0275794a:

  Merge tag 'loongarch-fixes-6.18-2' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson (2025-11-21 11:16:14 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.18-4

for you to fetch changes up to 3ecfcf34f0992d11e5eb2458a2108b3320c61ba4:

  Merge tag 'sunxi-fixes-for-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/fixes (2025-11-28 17:37:13 +0100)

----------------------------------------------------------------
soc: fixes for 6.18, part 4

A few last minute fixes came in this week:

 - interrupt and gpio numbers in foud separate i.MX8 specific
   devicetree files were wrong.

 - The vector length property in the C906 CPU description
   used the wrong unit.

 - Two bugs with uninitialized stack variables in the tee
   subsystem.

 - Alexander Stein now maintains additional devicetree files.

----------------------------------------------------------------
Alexander Stein (1):
      MAINTAINERS: Add entry for TQ-Systems AM335 device trees

Ally Heev (1):
      tee: qcomtee: fix uninitialized pointers with free attribute

Amirreza Zarrabi (1):
      tee: qcomtee: initialize result before use in release worker

Arnd Bergmann (4):
      Merge tag 'imx-fixes-6.18-2' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'qcomtee-fixes2-for-6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'omap-for-v6.19/maintainers-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into arm/fixes
      Merge tag 'sunxi-fixes-for-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/fixes

Frank Li (2):
      arm64: dts: imx8dxl: Correct pcie-ep interrupt number
      arm64: dts: imx8dxl-ss-conn: swap interrupts number of eqos

Maarten Zanders (1):
      ARM: dts: nxp: imx6ul: correct SAI3 interrupt line

Sergey Matyukevich (1):
      riscv: dts: allwinner: d1: fix vlenb property

Xu Yang (1):
      arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity

 MAINTAINERS                                        | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              | 2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 4 ++--
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      | 2 +-
 drivers/tee/qcomtee/call.c                         | 2 +-
 drivers/tee/qcomtee/core.c                         | 2 +-
 8 files changed, 15 insertions(+), 8 deletions(-)

