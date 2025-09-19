Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A31CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGBIXWoQfciFg5TTWblokxBsiewcOE1bszsE8YzDKWM=; b=RclXIN5xeT3xhCyydy1IaHmBXz
	Y0PUvS88+AhAs1ndtcAL6tvnx4fhCJbR4cszvr55K4V3o5FF94WSudLERSjAc+tcZRCAwzgEle1mk
	mlJslbZCcB3G+UparNi5bYldrJim29Ol/TBAZ2QFtCVSjOTkhTrSHcCE9iWQHcqBUMwb32cXwYTRE
	ZEynXosGfX/bJqx63AKymMBGZCfgBvvdsLDb/UezmjTz0SGAEorlEyuVujlJFyGnOfCkGLdBFSTj3
	uwprt951Jut/pgeuJyZrfpd+MdkLUC5iyzSbHqFimnhd0Lfsxj/wXeVl4ELy/1gdM1vxvjV7KV3jJ
	RmuBKYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzc0q-00000003713-1PYG;
	Fri, 19 Sep 2025 14:23:00 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzc0n-000000036yL-0ryR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:22:58 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3BC477A0068;
	Fri, 19 Sep 2025 10:22:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 19 Sep 2025 10:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758291773;
	 x=1758378173; bh=DGBIXWoQfciFg5TTWblokxBsiewcOE1bszsE8YzDKWM=; b=
	3P7vtOxXTlRKZGWlZLsRFVQlQg4bj5SvQvb5v1zmryo4PCz5xUCZ/fSZUuL33qsW
	2XFxpoh130HNWVqUH00GYFR2OLcWx0fbXjhyeBAR8yseNvBXLhN/0OOMJL6U3cy9
	NOxQGScNJsPb3WM84wfJPFb4rdhDXJNr0eUbkkBFZAqgCNYQVkp1Eolbo7eGfx6T
	UIhoCwGZmmCD2l9Vdt05U1amomaUxFZDiopcE8Uiha2UPEfSrnPL/cBLPrd/w2SK
	AOAYXKR8GES89WQNC+kxfLcj7gP5oZndIPzi3FtUM0Qapm2gqlAC8zK00Iux7Czt
	u3Hzk4X0b7bccGPCfsVDGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758291773; x=
	1758378173; bh=DGBIXWoQfciFg5TTWblokxBsiewcOE1bszsE8YzDKWM=; b=N
	wEFh+Ehq8I5Ne8BUFO132THoMndwZ6szg6zS6b+qZvszYrP+sSryFfqlrr++t+re
	52mUZjJS/MqYpcQK4IrqneI3Q+QV87n44m8BdrbXyltTFUsKqWVoFc7LxhztSzR1
	/CyOnK6h4cAgGvOrrvZPqQ+kytQaKCIBFxaNl1m4svOmCOmwcwS8Yq4fdKJu928x
	+iYoSc2Dwk0r2zFgWPLHA2uWyYEEbO2I/L1Q2EIYz5f60VEk6QPi921HwITH7WAh
	xpt1386OGSe7LQJ7/CDBPPYMPl7W+ZdVVK91Q5wl7+/wWjKCPzRy6B5d7I5vClBH
	kLIZeQgRg6fEx8N/FKj5Q==
X-ME-Sender: <xms:O2fNaHPZsDEluqQ3K1xXVYzEPxMOHfVlGvrDBsZCIGFfPOnh7MIMIw>
    <xme:O2fNaB8EpINHV6429QucyQqOJUWdlBgZRzftFfr0w1fqno7OIhXeVkca9g9sUwCxx
    WJ4lzYGsR2mwvafSTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegleeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeftddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghn
    uggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgih
    hordhprghrrggtuhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgv
    nhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:O2fNaLcxJAwbyL7fF-hDxzqk5CnB_5srfmblzDObKefDa2_Yw3Nu9Q>
    <xmx:O2fNaI_XmRHiAy2z_8UrPdVkq5oq8nmdQ4T2W7CdP781TiN2_pBACw>
    <xmx:O2fNaJixEsf2I4UZLqtJvoBDqXbeFMrBT42lISbnoEN9uVt68m1a8w>
    <xmx:O2fNaE_oeBhVK0r7xewR08-ipIjEJmwOjKy_oXBB5MOm1ZA557kJ_A>
    <xmx:PWfNaL2dV5R9mOO8RHYelr4frobgiBB2zH1lISJhguP3OD7Lp1pVdNvG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 04B80700098; Fri, 19 Sep 2025 10:22:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AneuvEk2E7Kg
Date: Fri, 19 Sep 2025 16:22:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Andreas Larsson" <andreas@gaisler.com>
Message-Id: <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com>
In-Reply-To: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_072257_721463_D6039CCF 
X-CRM114-Status: GOOD (  14.14  )
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

On Fri, Sep 19, 2025, at 09:17, Geert Uytterhoeven wrote:
> On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
>> > On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
>
>> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>>   get kernel updates, and the only one I can think of with
>>   DDR3 support, but seems to be limited to 256MB total memory.
>
> Are they limited to DDR3?
>
> IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
> new variants of old SoCs, to accommodate the changing DDR landscape
> and market.  So perhaps they also accept larger RAM sizes?

Yes, that was me. The previous SAM9x60 was released in 2020
and I think that one was an upgrade to a smaller process node,
raising the clock frequency to 600MHz and adding more modern
peripherals, but I see now that this used the same SDRAM/LPDDR/DDR2
memory controller as previous chips, with a limit of 128MB
total DRAM.

SAM9X7 in 2023 added DDR3 mode with up to 256MB according to
the datasheet, no idea why they chose not to support more,
since a 32-bit wide DDR3 bus should allow up to 1GB with two
256Mbit x16 chips that are widely available, or even more using
expensive 512Mbit x16 or 1Gbit x8 chips.

       Arnd

