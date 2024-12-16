Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AF8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mncYdzsRGea1LeZVXIMipQ4Yl5I8AiDuzr1+oaEnslg=; b=X1mEraBdtvRcz7n9pmS5394Qk8
	JhsUJnLm6Zn5s35cUOWPgZPzf/ahqIqBohVUuEEp6nRNafjw5NqhSc3t844QS2Szv4x5BYC0A4kPi
	be51RMF0cbouU4AvxaFbKdNLgjPn5NoreeIjaj5Fz45y0UzAgGgqk1xtAozivCMPb3nfZNaVQlQCy
	BgAZFhAH5KlC9sbnZaU1bPzbexQoiUQKdqeE/Zr5MIvBV2SQdc+0T+TdUvEMpvf+mTW1SaGJ29Yi6
	s4PtN7CLp5iZc+itTFoMXoZb6nmDWAwwI1/4mrIM5aZWOf9zp8QMEz2e06RhxZTyr965kzxk7Eu59
	tJe7pIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDrk-0000000AZ46-0mjO;
	Mon, 16 Dec 2024 16:22:40 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDqc-0000000AYpT-2sBD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:21:32 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2AC7625400E6;
	Mon, 16 Dec 2024 11:21:27 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 16 Dec 2024 11:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1734366087; x=1734452487; bh=mn
	cYdzsRGea1LeZVXIMipQ4Yl5I8AiDuzr1+oaEnslg=; b=EJbOwAvxvnIY7ADPPy
	BEUTLrRE7pytTbTNDCqsgsm2TR909JnmeF9zO+Y0sumydcZhMTt5dEBAujqlCbRT
	cqvyYP/iUxc5jrxBpQQaPvgKh+vr3xFVy1iwpx3+ql22VntrbEr17bIAy9bE/C0k
	ev/58Dkh6WljuNe35j+BDW/bXoKmbzY0AqS/OBfqfeWhx8loqozo/610X+JQHJ4g
	cJMK8pewDIHeCleTul8qOaOy1QsGUk/NBa1i3x1S0RGHWL7DFzeYPDeYrT8AVlbo
	JFqDaxlvHfoG83cxGc2E01FGejUX//N4GtE3gNPIkAUmiQ90g0/NyoKGk+ODUwKq
	f5xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1734366087; x=1734452487; bh=mncYdzsRGea1LeZVXIMipQ4Yl5I8
	AiDuzr1+oaEnslg=; b=1YWwjYpiwYY0RRaD3fkVCaMmuN59U6+DQqHQwbXAd0SI
	XKHejiIqr4saa9qbkhO6Ugr0An1Pw3zfOX0cR1RFj1CyD524bWIRM3/EfuYLM/Bt
	VUyV6ObL7ny2estNJZBPKqGh04Hcw4Y9V7FVCgcgLk3uwooWMZP1zMePlbmZdIz/
	6XNIFftEsI25r27FiYMauQ1+Dk0ftgROfqwZVsiS6sTbbuP80bw0dUKKL/mvpM4q
	HQUV5TXzkJjOB+hsm9PM44kn8pyHHPv1PIHY/I8hZUJb69m3C8KQrT/f4oDpTEo+
	fU0Iqp5ZoKKGjSwp8mJagYvzfti1NiJEsaOMezhd2g==
X-ME-Sender: <xms:hlNgZyd-ZPoeCZBGRTweh1H_Z-HSy5YyT5s-sK6x5bp-OdTG3u0N4w>
    <xme:hlNgZ8PcCkwaQ5ygTyxEBWuNp3zsi2yD1Y_38lL7ir7zYnaCZhHraZ9XQYC4zhYo_
    e_w4u_uBNf1J80iBDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleefgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkufgtgfesthejredtredttdenucfh
    rhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqe
    enucggtffrrghtthgvrhhnpeduleeigeekveeugeettdejtddtleeghefhvdfhueehtefh
    udelffduvdeuleevteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggs
    rdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epshhuuggvvghprdhhohhllhgrsegrrhhmrdgtohhmpdhrtghpthhtohepthhorhhvrghl
    ughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:hlNgZziJG7jrodz90G2Xdz4Sn7n2Ymdmp-w_AG_VzFnH6lF2K84rig>
    <xmx:hlNgZ_8ohXVT_c89oc8KR3eyfsDwCKLD_wIn3JozK_ZrtcxW-GZL1Q>
    <xmx:hlNgZ-tS39XSlZN6mZnBkfmfm8QCTKx-a6UO13h9cYTNJhvYIO0Lzg>
    <xmx:hlNgZ2EMIHBL9dAXvgzgY6VOxAmVMagXnQBMPRR-9ju0MYG7DgdCgg>
    <xmx:h1NgZyI9f0o8LSy0V1MI8dJ96cfP0R7HejNzNn4w9Ce1UcK8YGLybPbF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9C4EF2220072; Mon, 16 Dec 2024 11:21:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 17:21:06 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Sudeep Holla" <sudeep.holla@arm.com>
Message-Id: <cccdf954-3374-414c-81fb-658df16325fc@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.13
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_082131_421740_F2363377 
X-CRM114-Status: UNSURE (   7.42  )
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

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13

for you to fetch changes up to f578281000c50cae991c40e1f68b2fc0b1b9e60e:

  Merge tag 'ffa-fix-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes (2024-12-13 14:26:32 +0100)

----------------------------------------------------------------
soc: fixes for 6.13

There are three small fixes for the soc tree:

 - A devicetee fix for the Arm Juno reference machine, so allow more
   interesting PCI configurations

 - A build fix for SCMI firmware on the NXP i.MX platform

 - A fix for a race condition in Arm FF-A firmware

----------------------------------------------------------------
Aneesh Kumar K.V (Arm) (1):
      arm64: dts: fvp: Update PCIe bus-range property

Arnd Bergmann (4):
      firmware: arm_scmi: Fix i.MX build dependency
      Merge tag 'juno-fix-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'scmi-fix-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'ffa-fix-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes

Levi Yun (1):
      firmware: arm_ffa: Fix the race around setting ffa_dev->properties

 arch/arm64/boot/dts/arm/fvp-base-revc.dts     |  2 +-
 drivers/firmware/arm_ffa/bus.c                | 15 +++++++++++----
 drivers/firmware/arm_ffa/driver.c             |  7 +------
 drivers/firmware/arm_scmi/vendors/imx/Kconfig |  1 +
 drivers/firmware/imx/Kconfig                  |  1 -
 include/linux/arm_ffa.h                       | 13 ++++++++-----
 sound/soc/fsl/Kconfig                         |  2 +-
 7 files changed, 23 insertions(+), 18 deletions(-)

