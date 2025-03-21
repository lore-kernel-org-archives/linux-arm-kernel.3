Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACE0C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 08:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aayfzE7jgJlc50bcARK1+tQmGPggXiqzYcB0Ie7pLE=; b=wkWsdw4Ws7+qO7odF1WNiOTW4A
	ZOnHUAXR/sh6gE1jFhehU9gdb3zKejN5yg9NaQLFn1ktOBpPkrqYW5lp/MZs0yCjCd0D7MKLaxG18
	CuHGfY+pBB3RT0xpAuz3UPiTcBUeuv0zDTSe8o913v9GgX0uPXe1irEKAvUXu0YTPz+OIyp23l23c
	pDMzZG5QjD+jR3TVbu+X2lM1Dlq8dy9DprcXAFXqCYBE3NByh/RupiHajn/23jO3wDUMu52Tyy4nt
	6tqUM7WLlcr3HC2R/oF9Ngh0fnX95uWyGNz2Xc31wUPkwi+I7Zh0HCs+HC67ZX2qoXZen5n3MYVJx
	WKiKMkkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvY9l-0000000EIRF-00Sr;
	Fri, 21 Mar 2025 08:55:09 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvY84-0000000EIE7-2Bp9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 08:53:25 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2609B114013F;
	Fri, 21 Mar 2025 04:53:23 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 21 Mar 2025 04:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742547203;
	 x=1742633603; bh=+aayfzE7jgJlc50bcARK1+tQmGPggXiqzYcB0Ie7pLE=; b=
	iBq2ERFK4oLW/f/OZuSBg4fs5BrZAXfLimVU4wv4uRwZa41AQspkXOfTVTz9zJqb
	cwUlpfhTonWpHTK+orK05gVkcX0xDictVg5W1apIghevrOr2lt1xS3ZoNhEOvsSC
	q3aaUmyXPUNmNcL6bgMpEoj7QQV5d0GmHFAkNK3M/TRXnvpc0uPy6EpyTFy4Jvls
	6T3QWkiCQCwaxScGfOq9ZFHvJLyvGzlIwUzpVy7LGreYpQMtTJDXpbRFY1sW8Z3m
	DWtYLqC6F9DseK4qT64k1HFHErssawJb4xLeg/gCyqqEmMEOB40yU+whOsmA1dja
	eI0ZK2InftNm9PFt5Jr5cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742547203; x=
	1742633603; bh=+aayfzE7jgJlc50bcARK1+tQmGPggXiqzYcB0Ie7pLE=; b=3
	VL44u0xa/wlJpz0PO7/pndRGKPUuIn6xnUVtUEnmQgizCNLZmyOX5U5kvFEyg2VQ
	LJBTH2lmqHdvFIwAX6swoVzzwFbOQ6IhlXAqxkAFWiAsn5ZHjIjvRcBGN8CiB5pT
	k6GRr61abQx8YxE+TD/GEAdYWxCbrtl15VulItIDEUgdxfgn/kr3q65VBqf3lstf
	T3qUygwZtd4/ZYYlDHmEgllaNmapy9kWvD1FId8BWhA496KBR/nuIUXcYbPY4YAW
	Q9UTHSHm3GMpEQP6KZITq4l8SJADVG1LohoCusN+ni+s4VhEs8BFdwg3kEf4epoG
	EPH5ff9BNyTJsnV7bo5yw==
X-ME-Sender: <xms:AindZ1fxbCSaPNodVLmM0WUdyJN6U7PS_im8aCCha8l1_DdfTxCPsg>
    <xme:AindZzMIYZmlGshRfqW31ptbxwqceNCIBQCRpFCv8cb8dYXYQE2cniV26q2f7UErS
    SS_oTeHUlF1hHi-mBE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtieeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefogg
    ffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhg
    mhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeefhf
    ehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomh
    dprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrggsvghl
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehllhhvmheslhhi
    shhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlse
    hlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:AindZ-inEjxWvS3EfnJoR6OgW9sR8ESayHBZl6l3Hyhrzj8OauVF_g>
    <xmx:AindZ-9Zj5UC7QmN1XEh3_ydNJM_1SFxHsFZxGXei01cuLD26cOv0A>
    <xmx:AindZxvJbd9yVrfP6EMq9GUdOMphfApmalv5k9sT5Y1K1AzDDy0wcg>
    <xmx:AindZ9F-NxTRRMBl54RMbDbyuLcevtCGeymO1LwrpcAI9uBoCmYJ4A>
    <xmx:AyndZ_XXYQcK97jQmBg4zTjuE1eqdvWcnqcN-RrSOKAkWO8BUtkEXK1a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8DB2E2220072; Fri, 21 Mar 2025 04:53:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T1182011179345e0e
Date: Fri, 21 Mar 2025 09:53:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm <arm@kernel.org>
Message-Id: <e4c87dd0-1648-4453-9a0a-f38f0045cac9@app.fastmail.com>
In-Reply-To: <202503211042.Uf5Ln7hI-lkp@intel.com>
References: <202503211042.Uf5Ln7hI-lkp@intel.com>
Subject: Re: [soc:soc/drivers 22/24] drivers/platform/cznic/turris-signing-key.c:25:55:
 warning: omitting the parameter name in a function definition is a C2x
 extension
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_015324_625451_E4FC127D 
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

On Fri, Mar 21, 2025, at 03:41, kernel test robot wrote:

> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202503211042.Uf5Ln7hI-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/platform/cznic/turris-signing-key.c:25:55: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
>       25 | static int turris_signing_key_instantiate(struct key *, 
> struct key_preparsed_payload *)
>          |                                                       ^
>    drivers/platform/cznic/turris-signing-key.c:25:87: warning: omitting 
> the parameter name in a function definition is a C2x extension 
> [-Wc2x-extensions]
>       25 | static int turris_signing_key_instantiate(struct key *, 
> struct key_preparsed_payload *)
>          |                                                              
>                          ^
>    2 warnings generated.

I've added a fix for this to the tree now. I was surprised that clang
warns about it but gcc does not, and apparently this was changed with
gcc-12 no longer warning about it.

     Arnd

