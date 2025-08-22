Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCBECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaguppChqqh0T3xpb1iPjntc9UQEFriFZKmZ9cwC9rw=; b=wKVQR+XXwMfIXv2Dd8Ud8mgoPw
	X3ukrq0of0Woen+YyX67BGuEPSnaj8yRHdh6KZhjnHyrHZvRAdljRnl8k7fhvDRaqs953Qvq6ljYK
	SR+bbYuuKUHcvgZjmYvfsCHqgr677bSWGNVZUHxJjzlNS0YqaL4XEqTht3fW2/rGGp458O4CiN3U2
	5XkTT4dczx3/WNz1ZZboA22tEYIcmNc+YFrTKPG3pHFWNpIt1KOm98RFL1HsK2y19VuY2Om+roi2+
	ZQpakafkPUxEgAYWCGdfTSwj6Xm+1kgb6V5stvuQYLBFP4srTLNHKNLaxW0VXke6rhkJR02XLtaG7
	ILCzoXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTW-00000004Kpq-1G3E;
	Sat, 23 Aug 2025 08:19:46 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXzr-00000003Pvc-3B8T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 20:04:25 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A9F2514000AE;
	Fri, 22 Aug 2025 16:04:19 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 22 Aug 2025 16:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755893059;
	 x=1755979459; bh=SaguppChqqh0T3xpb1iPjntc9UQEFriFZKmZ9cwC9rw=; b=
	g1HofqZ1FDkxUX1EN10UhfQGTZutikf2NWBS6Fue54TEvPvQ6nzLwnCc2IRCVzH0
	8t2nKxn8StykNSAkWVdV9eHkM+tHyzzKheVf2a5KIP+tecZfbMZ+v3nstCZ0J5pn
	tsl4myo3vg/lVTcIsJaCMagtILlEXIAdOjtwbIKmmvC4yFe6sKBg7MkKmLdde0Sz
	Yeh/L8gio2HD3li8KzCN+/53zV4/+CcXt3FKpqTTZyUzyAzWDVFXCz2G9lRlzDe7
	k2cAFx5o7vQkc/9MCmK2m3iIbLuc8tMSooAd0S2rAqFKSm7bCQZOjt03xcMwh5Pl
	DEOz6Kcco5JaJymytwLATg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755893059; x=
	1755979459; bh=SaguppChqqh0T3xpb1iPjntc9UQEFriFZKmZ9cwC9rw=; b=j
	Ibf9X5lh8TR650uFXOODimISurb4xpv088prDwV9ZAS9oGbougdOHqkX5bYoznxk
	qXaOJRWxsI65pLnE0+O5wuFXlQK+8e47SePDLXcJFVy+UCtijV4B4OBdEkFGltK/
	IbNdxDPh/DmXaSSAyc4pAm+ZvojjErnSAtJUGLYBboCG7v1BMvPLJb7sWxyPbBBo
	czjr3abbJxYMSIFjnpZhH8NE1kyAlwoepjeZY1gP8YE3TZ/WqPLEp2aC+VIZHjxE
	SAi49yWhj7UeIfpCLJWXceBx8PG1RhsVdW4jcvlF0JZsf2ZrDx2IFWX07h0rrofv
	xgS1c5c7opPvmJXLyHfOw==
X-ME-Sender: <xms:Qs2oaBBCQ5nGFOoSjO12zz5OYcJaDdGHkSOCvO_JpaqkKggUGZuOlw>
    <xme:Qs2oaPics73hU5YQZEMZ7MrhMPoyzd77FuWf3sgHyZVN8KDX8SWWLSBjeIGhrDaQL
    5_cxYdJtUYqALLhc5o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieegieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpth
    htohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdp
    rhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopegrrhgusgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:Qs2oaPPD2S6KJfQtNZgDcowAtXw04HSqI8xCnJFShDtl17oTGvZJRg>
    <xmx:Qs2oaEbOYcCUOVWh2VjTu6m10E1cYvef1KVSLGEWxc8HOHjizcINqw>
    <xmx:Qs2oaFw26veJtsO_bqhobENtqgct64Mx-DPN1pMM9436UwSzIT2a7g>
    <xmx:Qs2oaLPuT13pzeb7gpX_2aJSeob9VEvZK3hVJtia2LFFG__TRjSAvA>
    <xmx:Q82oaKKCM-_-8_w54zVC7rl7DcirIJmCco6POS4dq2-9zUlwnpyYopT0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D430A700069; Fri, 22 Aug 2025 16:04:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AlhDZOV2HdTF
Date: Fri, 22 Aug 2025 22:03:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>, linux-kernel@vger.kernel.org
Cc: "Kees Cook" <kees@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 llvm@lists.linux.dev, patches@lists.linux.dev,
 "Russell King" <linux@armlinux.org.uk>, "Ard Biesheuvel" <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <6b2c0063-1523-4644-a32c-6aa918ad9dd8@app.fastmail.com>
In-Reply-To: <35178205-7cff-4b4b-abdd-b4cfb9e69dc2@app.fastmail.com>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
 <20250821-bump-min-llvm-ver-15-v2-3-635f3294e5f0@kernel.org>
 <35178205-7cff-4b4b-abdd-b4cfb9e69dc2@app.fastmail.com>
Subject: Re: [PATCH v2 03/12] ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_130424_126557_89AF1231 
X-CRM114-Status: GOOD (  12.19  )
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

On Fri, Aug 22, 2025, at 09:05, Arnd Bergmann wrote:
> On Thu, Aug 21, 2025, at 23:15, Nathan Chancellor wrote:
>
> Would it be possible to either change the macro or to move
> the overflow_stack_ptr closer in order to completely eliminate
> the CONFIG_ARM_HAS_GROUP_RELOCS symbol and have VMAP_STACK
> enabled for all CONFIG_MMU builds?
>
> Are there any other build testing issues with ARM_HAS_GROUP_RELOCS
> besides the one I saw here?

With some more randconfig testing, I did come across a few
configurations that each fail with hundreds of errors like

arm-linux-gnueabi-ld: drivers/crypto/hifn_795x.o(.text+0x99c): overflow whilst splitting 0x10a61854 for group relocation R_ARM_LDR_PC_G2

so I guess we'll have to stick with the current dependency,
at least for ARMv6 and below.

    Arnd

