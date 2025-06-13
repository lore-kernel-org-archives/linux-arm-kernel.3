Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DA7C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38fc6baiLFupD6hkdl0qPcWi2dveS7upeTlkKkc7Bvo=; b=AlBttEitMBJmItECdk4NZvwDm0
	mm+hxwwrrOvaWlJvel/A00hG8hu2NkLpv72yGhSzN8DboUEtDT3g/PRM1GtFtspb9LM+BkNxUm2FQ
	3MwZ5OGqtMKEZmcM0weKu5G+wKfqYkSN1iDRGgiLHKHoXafsqzSxxwuzxwcarLSB+0meI64nTmSOl
	kSsWuHIgjWVl4Uf00ERzbJp5b4ovrZDD5hV22Hon4KO/oxoY5EIzKI5sL3YHi8IRf07Q2vYgLCBqT
	KL+dDchzZYvqkP4sCsCw8FJusjFJu28kbYH+NhEV+Y18iyMDxA/ipRNtrT0sVyZkfcMqukdmPoW/N
	dj79Cpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBBn-000000000Bk-06XK;
	Fri, 13 Jun 2025 20:39:51 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQB9d-0000000Hav6-0Itt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 20:37:38 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E1AE225400AA;
	Fri, 13 Jun 2025 16:37:33 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 16:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749847053;
	 x=1749933453; bh=38fc6baiLFupD6hkdl0qPcWi2dveS7upeTlkKkc7Bvo=; b=
	1k+WjMuKesWaiMgSIbdi448G+8Ovf+aYM5AwQnmqi8/IJPcgS3SjihcwRDyaxs1g
	6e9ZcfPsjEmkZW009oU34uQ3jrIA1b8SN0AEHIgR8O74WMzX0uUD7cbjo7j+24ck
	x4BDRcF/36Kf5wZOpX77MYGrlM6I/yMm4ougpfJzGzoF+Btcjv+sFrXlPd6ckTK4
	+avG1M9KIrvTpI4G70QjUeFj1AAYh6wBXge43FVbreZJpTQdvBn6THTdDtFLia/9
	u99sYubN6vZdhIgwiy0MqayL7PDtVIX45cvXcCxSSkvie23NTwqdpSg5qg9p8Gfb
	AdVuecc6NIpZu6F3Gd75WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749847053; x=
	1749933453; bh=38fc6baiLFupD6hkdl0qPcWi2dveS7upeTlkKkc7Bvo=; b=T
	QKKtzvkDUoDxI8fsrKTXDxXaPYzpiQDlB9p9ck0rZT3S+vW204lmFBY6N15MCCGW
	1+4TcsaOLf4gxmQQ/w0CViHaelvD8ZpJlQF/mBPwe96kSex7Rgurx0WIcJJmt7fA
	+h/TzsfQEd0Mn+6NrA8OBCelz5MOAgePxRtlYYorgdw3U78eswB9EO36om0sU6Wi
	JG8Vfg54B79x2gA6hV/PBslRKzGenWrern8yEEBB/muvNBn2lnl4xBi6pjLo/xzL
	vJ7cABQZQ5inCLKndOLig5JFtmLjCRNhI9vKRjFT6xd7cK4p+6LIUo7xc2dzoCB9
	Sz5k3mABLZKuRkryp7oFA==
X-ME-Sender: <xms:DIxMaDVl8SkMWwLS5eFCILZ5tju7LoF5262rWxQLWS4kJgAbVU8h2Q>
    <xme:DIxMaLnRh0e-qIdyoZgZ8PCUNsMEadsJgTgDf5K53g1SIn7FUSZmPgGW-Mxq_q489
    SmOEfgAVBBqH4Uq6Rs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegulhgvtghhnhgvrhessggrhihlih
    gsrhgvrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthho
    pegrnhguhidrshhhvghvtghhvghnkhhosehgmhgrihhlrdgtohhmpdhrtghpthhtoheplh
    hinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtohepshgvsggrshhtihgvnhdrsghouhhruggvlhhinhesshgrvhhoihhrfhgrihhr
    vghlihhnuhigrdgtohhmpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DIxMaPbZLDcLwtPKub_5gHdfUoeMa7YCnTlJhjDeyapj3n49qpQQQw>
    <xmx:DIxMaOU9l1HDb2GiSjZBopVK1VwfEaUOFGzedbuaNiCsWv3YjQoPcw>
    <xmx:DIxMaNncYIDE_LUEMtYJouRPNewJ-XhDX2V2MBJqArhNxnuUdaHhAg>
    <xmx:DIxMaLeam_ZVzR3f5HZJgUFAHF2tesxxvgpBncraBPYrClwGVZrc3Q>
    <xmx:DYxMaDKJKkEK6AlbZgzDf6j2kLVUTjMCOLTZqpUo03BPKRKOMOYczYTP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D72DF700062; Fri, 13 Jun 2025 16:37:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T096d278615d9b919
Date: Fri, 13 Jun 2025 22:37:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Lechner" <dlechner@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "Sebastien Bourdelin" <sebastien.bourdelin@savoirfairelinux.com>
Message-Id: <b0859b25-0e95-4966-a433-5757d8bd9e6a@app.fastmail.com>
In-Reply-To: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
Subject: Re: [PATCH v5 0/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_133737_640912_94C024C1 
X-CRM114-Status: GOOD (  13.59  )
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

On Fri, Jun 13, 2025, at 20:55, David Lechner wrote:
> This is what remains from "gpiolib: add gpiod_multi_set_value_cansleep"
> that didn't get applied yet for the bus subsystem. So I have changed
> the subject line accordingly.
>
> Arnd,
>
> There was no maintainer listed in MAINTAINERS for the ts-nbus driver
> and it looks like you have picked up patches for it in the past. Could
> you please pick up these as well?

Sure, no problem, just a few things:

- These are all cleanups that can wait until 6.17, right?
- I see the driver has no in-tree users, and apparently never
  were. There is a imx28-ts4600.dts file that should reference
  it but doesn't. Do we have any indication that the driver works?
  Added Sebastien to Cc as well for clarification.
- it would help me if you can send the patches to soc@kernel.org
  for me to pick up, as that ensures I don't forget them.

     Arnd

