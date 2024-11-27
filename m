Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE094D609A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 07:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dkBCpxMRicHp1J617Swu7hSxvIKAmw8XcVl1p1pm44=; b=2nGIYXrvpLa0+RkmSO+y0IF6BC
	0Fv0y+yhKL+ZgkhYXBRPbzJfYa63vBvTjlOY7DHtKm2zYkISsgY5EjFDotQF/zwlBwffBowRplA7V
	JziXxPGtNEMmkQQdorL5Y3LhAJwgADrHw5NY7cHm0GyZ/qH2o1KIZhfJK1L4/XofNXbunVZS8PPti
	MvTZLFaES5diLoKalotkBiQIJ6KZ6wH41aBqX3qYAmEGII1Mo6Ap4oRoVKhyGKKn79zXwU8F5DLMf
	RloNDmBMbFOoQnqUfW1sqrA00bwVnlcY8IO3zaisxzyU+822A2DawWvbRFWe/MHG2eVdOrohVtYKH
	PIAoulWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGC2j-0000000CNYx-4A7T;
	Wed, 27 Nov 2024 07:00:57 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGC1k-0000000CNOM-3jEh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 06:59:58 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 512481380650;
	Wed, 27 Nov 2024 01:59:53 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 27 Nov 2024 01:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732690793;
	 x=1732777193; bh=/dkBCpxMRicHp1J617Swu7hSxvIKAmw8XcVl1p1pm44=; b=
	d/hfn2e5ZupZSdn1UrqO2idtH2PvbQUI7UnPIMKh1lZ5j5yogQqJFwop+fUzKpQy
	wKe5pZRC4XggX3cP5FXEfn3NKz4LDX8y+cSrbhFQnn/OdM3ag99ElCsVhCj/yzj3
	790hzaOPccly0LNLbnVqKfPMYxDE3yk4FoTWTo19V3HTKI32NOVgywgTRj5qCEXf
	kiLkL9nodUGIaZf2mUEldkboWw8DSGcCSGzdy3jS/ayd7RT/pEw14EIjrPJyL+8g
	Fm0XTZSou/m8L2xh479eEHPbVY+3n9amTTz3BubZWK2ffgt63ee6cu+2NROLOpGP
	cBpVW/YKUFSd3SOUp4Ykmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732690793; x=
	1732777193; bh=/dkBCpxMRicHp1J617Swu7hSxvIKAmw8XcVl1p1pm44=; b=R
	eCEv65HiKSbRUH2Gq+RXQk3OQ9AZmGvod33rSVf32iW5mxpOUeD0MzdfjH1k8Fwn
	B/n4UiLFKQY0TlkkEHvWwL3bVBLBSh5UBcLZ1BooOLo9WvGqtnMJk7HlVB+THrMv
	bWIxPHpSVd+TW8RZRgSPlX1jqmN0UvjMADFHbRwRwZGYP2PPxoYo9MpgPvN4jCgr
	VpDeq31fNj7facdQz59sxfoSPXQnNU7jcqdkXd2n7cOjGoiyjrVQe/Zovq+tvXJ0
	CrGi9II9JSMcBibPqVuV5uie864W7YIwqHC2UyszPlLrJEC/2kzNdka66U67YhdX
	S/rFVG1Pv1AeemQ9Bw07w==
X-ME-Sender: <xms:Z8NGZ7QWSo7NkfLg453N6RCWFUlNwr29YwmZv6msgocnON0yBAOFzA>
    <xme:Z8NGZ8x-13OC7iihOFyEL6UQfED8wD7vrTsNDKKQVSw-BXLbu9vvz0s90drbvXU-j
    MytlzKVfaKCV2RemXM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeekgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugi
    drohhrghdruhhkpdhrtghpthhtohepfhgvshhtvghvrghmseguvghngidruggvpdhrtghp
    thhtohepvghssggvnhesghgvrghnihigrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrg
    hmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheprghishhhvghnghdrughonhhgsehngihprdgtohhm
X-ME-Proxy: <xmx:Z8NGZw2dHLJAxepzVxODX8m9zY6TyhfRtQTMMbbu5HhEmW6aw1vNfw>
    <xmx:Z8NGZ7D4J9479QHFI34qDA-u0LdKouX6WB5tWv-yk4WgnYmHx5d8iw>
    <xmx:Z8NGZ0jH9p4lThNE_vOrJZBUsqNPp4-xPDamuorS4BmZ8DX20XXzaA>
    <xmx:Z8NGZ_olZA0aEAVQDFY5ycZbzBPMvVnCLgi6MLqdUnVH773p7H1XLg>
    <xmx:acNGZwzZj3z7XfDRA5Y0tSmcPd1vo3TyT8meEfRYIU2wP7ldEXvgXsbV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8E4122220071; Wed, 27 Nov 2024 01:59:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 07:59:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fabio Estevam" <festevam@gmail.com>, "Guenter Roeck" <linux@roeck-us.net>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "Esben Haabendal" <esben@geanix.com>, "Russell King" <linux@armlinux.org.uk>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Dong Aisheng" <aisheng.dong@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Fabio Estevam" <festevam@denx.de>
Message-Id: <4af23996-a618-4816-8375-d00748be0700@app.fastmail.com>
In-Reply-To: <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
 <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
 <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_225957_581368_70F0DB96 
X-CRM114-Status: GOOD (  15.04  )
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

On Wed, Nov 27, 2024, at 01:12, Fabio Estevam wrote:
> However, after thinking more about it, I wonder if the patch in
> Subject is worth it.
>
> It can help reduce the kernel size for LS1021A that does not need
> pinctrl, but on the other
> hand, it will cause pain to lots of people who have i.MX products
> running custom defconfigs.

How about moving CONFIG_SOC_LS1021A out of arch/arm/mach-imx/Kconfig
entirely? As far as I can tell, the only file that is even
compiled in there is arch/arm/mach-imx/mach-ls1021a.c, and that
one is not actually required.

I think we can just have an ARCH_LAYERSCAPE entry in
arch/arm/Kconfig.platforms instead, or maybe keep it in
mach-imx/Kconfig but drop the CONFIG_IMX dependency.

The only thing that imx and layerscape seem to share is
the platsmp.c file, which has code for both, but nothing
in there seems shared. Maybe layerscape can just use
enable-method="psci" anyway, if that is implemented by
the firmware?

       Arnd

