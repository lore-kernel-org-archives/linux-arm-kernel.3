Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3367FD68BC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLE+UOTS7yHdog6ETbMGcYAEjTIcnW2Hb1xbsSa24qU=; b=2nntf38xq6lu1s0caoW1ANWJrX
	ZHuy+QDeDnMmvqMFC0knovxLjLmarbxcHqTES2kgSsKuoFeEpIo9hcWhbpcEP2zBOOgKVGzCzq/2I
	4KZ8KnVbfYchGBcsBfrhlow9DGKq6KzFyoxcL8wA8JW+fYkHdKHSaO9k6zJNZ34hwlkyL5iY9axG+
	OrEEhUyML0gYhj1xut+chZhC3rtg4CDxUG14EKhnJyvtJbW/gwKseib7gsWapCgC5E7o/hfT117F/
	Ym8pViMit4tkYygoFTogeOzv8rsa4zi9quDxPkMHsOSBW2fKz4uwo1ulX3IAZQe5X8qUr3CG2A4ZT
	0OpLKxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxyS-000000036x6-10JN;
	Fri, 15 Nov 2024 15:11:04 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxxV-000000036nF-3tAb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 15:10:07 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0B88D2540176;
	Fri, 15 Nov 2024 10:10:02 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 15 Nov 2024 10:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731683401;
	 x=1731769801; bh=nLE+UOTS7yHdog6ETbMGcYAEjTIcnW2Hb1xbsSa24qU=; b=
	nOXSJWzhDQ7uEdSXslDHBBwBRSTNC8fnK/NE/YQCB6PI/LdSdoPJ2JKAQIvUpeVw
	+Q794Wy/0b76KSlKhJNHNQ25mJhL8725nuoWbTKcZ9NMI2TRQaOdF7p8RM58Bad2
	HWluM9ucfcS+fB5MkBIJ51JOOJyNCz6gpla1WLh6uM6aZOuSj8EUd6tTF2QPr/YM
	p7jncsqs3egS4TVeh8djL6TZBF/wor//7nQYrQd4ZHGSsAmxokbA+9QwtjLMHFew
	OgIQetlun9Gc+1dt0cBnUaPaKTbwRiUqUcwcxKcEKa7oQA9KU7vh0dTgmwxMNetQ
	u+FrkHosWsrrGZhk2WMdyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731683401; x=
	1731769801; bh=nLE+UOTS7yHdog6ETbMGcYAEjTIcnW2Hb1xbsSa24qU=; b=d
	eXa/HdnRwNcPVOz9naGBFMhieyx9xKP+9Lb270gD7hW6j+bE7mY/xtgIM8Hv4Rio
	v/0HlWHx6Te0u9/j+jcM3nPsZIMYSmQTkxWaJ5KgYlmFUYe0zDoInZCr3LTtPbQP
	28fTozk4Zv2EsVLtBmhgy0TkCiCnGv0VL6ve38KdZ10VYLeCyVZ/ws6z1dspiwPt
	ipftlke+cQaItb4XA22Z/uIqtc/DTImPhhsF3f54uKMUDqnc5m1ryDiM3L89zseI
	77oACeSe2jaOEFwU7yUfjs/vI+Sj4Al/Ixd8AvZZnhxgMuJVeVp0riNu83zuC2CR
	4SHVJAwdKDfBSQp+WbXuA==
X-ME-Sender: <xms:SWQ3Z7wC3cCbw6nUGAgMVd46TBZ5uAnOYaBtv2ddjcS2KPAwRDVW4A>
    <xme:SWQ3ZzQu1YPT3qeD89nLlInWzRzg6HSfp447g4iPk0vUfodpruAxYqefN2dPww9nA
    1-lKW69DRMLP1dyYes>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvdeggdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpeelheevjeevgffhteeiveffgedtvedvteekleefgeel
    ffeuvefhudetieehgfelveenucffohhmrghinhepsghlrghiiigvrdgtohhmpdhkvghrnh
    gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedugedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdr
    tghomhdprhgtphhtthhopehjrghmvghsrdgtohifghhilhhlsegslhgrihiivgdrtghomh
    dprhgtphhtthhopehmrghtthhhvgifrdhrvggufhgvrghrnhessghlrghiiigvrdgtohhm
    pdhrtghpthhtohepnhgvihhlrdhjohhnvghssegslhgrihiivgdrtghomhdprhgtphhtth
    hopehnihhkohhlrghoshdrphgrshgrlhhouhhkohhssegslhgrihiivgdrtghomhdprhgt
    phhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:SWQ3Z1W8l1AmoJ--C8_Z8WY90ySNt3vYnVjiEucoY3qO6S5pgP253A>
    <xmx:SWQ3Z1j6Dj1RHATybGvOg7F4c4dmq8pULORdF6D3npJ_sZLxehL3wA>
    <xmx:SWQ3Z9Brr8nDHRZLRI4_Ug5OfGNuUoDSsO6cgWWv7rUPLMdPpu57UQ>
    <xmx:SWQ3Z-JjNL-O0kEz6pY9YJ7r-GojJ5UZ5ISMJix1UO9-zW6qgpMJEA>
    <xmx:SWQ3Z1wtsBDS6K2uC0fhZz913LWUaa_TbAZd4LA3dHMmlZTgXu49Y6NN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 46E032220072; Fri, 15 Nov 2024 10:10:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 15 Nov 2024 16:09:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Niko Pasaloukos" <nikolaos.pasaloukos@blaize.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "James Cowgill" <james.cowgill@blaize.com>,
 "Matt Redfearn" <matthew.redfearn@blaize.com>,
 "Neil Jones" <neil.jones@blaize.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Olof Johansson" <olof@lixom.net>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>
Message-Id: <141c7d39-9f0e-4c1c-86c5-149328ab979a@app.fastmail.com>
In-Reply-To: <20241115-blaize-blzp1600_init_board_support-v5-0-c09094e63dc5@blaize.com>
References: <20241115-blaize-blzp1600_init_board_support-v5-0-c09094e63dc5@blaize.com>
Subject: Re: [PATCH v5 0/6] Add support for Blaize BLZP1600 SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_071006_354214_E05AEF31 
X-CRM114-Status: GOOD (  18.18  )
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

On Fri, Nov 15, 2024, at 15:58, Niko Pasaloukos wrote:
> Blaize, Inc. (www.blaize.com) is a SoC designer and manufacturer
> with integrated programmable Graph-Streaming-Processors for AI
> and ML. This series adds support for the Blaize BLZP1600 SoC.
>
> The SoC can run as either a PCIe based accelerator in a host
> system, or as a stand alone SoC running Linux on its integrated
> dual core ARM Cortex A53 cluster.
>
> The SoC includes a suite of peripherals, support for which will
> be added later.
>
> This first series is just the basics to get the upstream
> kernel to boot with a UART console and ARM SCMI based
> clocks and resets.
>

Hi Niko,

This version looks good to me, but it's likely that others
still have review comments. Either way I should let you know
of the next steps for merging the series.

Since the 6.13 development cycle is now over (the
merge window starts once Linus publishes 6.12
this weekend), the earliest release to merge this
into is now 6.14.

Once 6.13-rc1 is out and the patch review is complete,
you can submit the patches for inclusion by sending
to:soc@lists.linux.dev (formerly soc@kernel.org).
This is usually done as a pull request, but separate
patches are fine as well, especially if you don't yet
have a kernel.org account.

After the entry to the MAINTAINERS file is merged,
I suggest you also apply for a kernel.org account,
see [1]. You probably also read the documentation at
[2] about the usual process, let me know if you
have questions about that.

       Arnd

[1] https://korg.docs.kernel.org/accounts.html
[2] https://www.kernel.org/doc/Documentation/process/maintainer-soc.rst

