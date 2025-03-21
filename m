Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00F5C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlrvUHjPtm7RRko7Fp3K7MJsnfsffCKW3XDJhv9Uud4=; b=Uvhnzi7rP1WZAccctyRGqwEriu
	bs++9HJTsdEQmIgoNeLJgRbiUjjr0tFDMHswGCU2ctzwpnYgBA4e8Q1sMmdWSiGy4zATCacjHiHQO
	PgIBQE8q7isetxcIJuI4pYJ/m990mo47GyVRF5CUk4CqlKDaAASAv1CSUaU6fMswVhcoOxfchqs++
	OgRjdgu+gPsk3gviGBKPhtEmTHRRMvaTy3ZmPL4p4e2wnnEjO2Nr51B6L4Zyp+0Mmqfrz2Cpm8er7
	yTAkAnClvfejFRtK//S6WihARYHudtWeVnvGkAplMPC9IP026tMpEzBgL/WIPjFIFP+jcunnLy4d5
	6fcLKP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXxh-0000000EGVN-1meM;
	Fri, 21 Mar 2025 08:42:41 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXvz-0000000EGPG-2xYK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 08:40:57 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 6FE2D13833D1;
	Fri, 21 Mar 2025 04:40:52 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 21 Mar 2025 04:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742546452;
	 x=1742632852; bh=FlrvUHjPtm7RRko7Fp3K7MJsnfsffCKW3XDJhv9Uud4=; b=
	Bv2WSF4BcRAEoe+VP+ODENa9rgu8xV6VBw+Mn/meVPMge7R2Mq53x0MXP+qlMUn7
	xzt65UxdHvUs+tuBURMPqMIsN6sl9W/Iblv23Tu3+nmfPj7Tuxr46dj8cpQqkbLB
	9IK0fZwozhfu1jH30s0xRTLP93DhtyICGSE3mYe9ZY46O1b4uNvQ6z8LiYGBQb3R
	Yxe2xKsGqjZtZgQ9gYHrLMtCAEtB6oUlzma9jf5Gvmw7oprgjJZz95MYw3t3AMr5
	cBr+VjsZLolB8QNr7Oe+pf/az4wENvH0l4+2N4OZrr7YccyKLO42khaBnNNoMcsl
	HXS2FgCtEi1AUxvCu4V/Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742546452; x=
	1742632852; bh=FlrvUHjPtm7RRko7Fp3K7MJsnfsffCKW3XDJhv9Uud4=; b=j
	cSWqswsE2ah0NiIYFfh7dV9GXvK+kdq3kKps26v4YTSDfeQmiOWmp5d7fzFHXnEX
	X1gVbDRaDNVo2E+84Sv3vZBo0LSJdmIiDwuLsvS204qe0PJwufyfdI4AyCn16fX/
	eV3+XdkZpnQE5od3rM26pfajAL46NdHtGP9XJ/Nm3+X00lUmYlZ67XC1fTXFUttL
	yA2Zrwuh8UKPUXBHTjkjt95ugsoiXIO1uDV/if3x3MMGAVo5OJpJabPUsendBnS9
	eofn0o1sadKIfj+aF5965Sofx3hZpiWu16A8ZVRM+TtysiVk9sKtbw323GoJ15s1
	y41dGyzF5u5qpaJqrpchQ==
X-ME-Sender: <xms:EybdZ0L4wDtPXjwO3NRkkd0NZxcVLY2amSNt4hRZlXtgbIohK_4cpA>
    <xme:EybdZ0IcAzGmC799sMLS6D-Qwbs1qeTyDVYcJ5yD0TI-l465y2ajiiX-dBzSWVjkC
    V2c3KQACe3lH0MFKvc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefgleekvdffffehffeileeghffgkeetieev
    vedtfedvheekkedvudehjeejkeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptd
    durdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopegr
    rhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrggsvghlsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlih
    hsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepghhlrghusghithiisehphhihshhi
    khdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtoheplhhinhhugidqshhhsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:EybdZ0us7unIApHnViXZWiQ_VqSMooYFil83Z3X8Il7zYzkR0ApZAA>
    <xmx:EybdZxYqci1K_3IercNBHfTee8gfouPTI45SFo9Sq1Bfi0cBn_aCtg>
    <xmx:EybdZ7Zz9weaM4uLwRxLu6dh92V3lHyJ8CE_u7a3pfcqnrZZwY84gA>
    <xmx:EybdZ9BkALepjoM-AlEL7abthhdbsGcgMV8eCE28CEefa_Au789KjQ>
    <xmx:FCbdZwPyRJdgaOdfMvKed9rWhVB3_I9eTmbiz98ZX6bpYYpzTLZIl1EW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B24F42220072; Fri, 21 Mar 2025 04:40:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tcf25c5c4b21ac15d
Date: Fri, 21 Mar 2025 09:40:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm <arm@kernel.org>, linux-sh@vger.kernel.org,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>
Message-Id: <927105f8-4aa8-4579-ac2e-bce4bce12b1e@app.fastmail.com>
In-Reply-To: <202503211029.DnQpqsJs-lkp@intel.com>
References: <202503211029.DnQpqsJs-lkp@intel.com>
Subject: Re: [soc:soc/drivers 20/24] ERROR: modpost: "__ffsdi2"
 [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_014056_367018_D10A73C6 
X-CRM114-Status: GOOD (  14.16  )
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
> Hi Marek,
>
> First bad commit (maybe != root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git 
> soc/drivers
> head:   ba8755ab541fc629948233125db870d4dbf00a75
> commit: ee7f8ed72990f28657b5bf598e695fcf4633f4ed [20/24] platform: 
> cznic: turris-omnia-mcu: Refactor requesting MCU interrupt
> config: sh-allmodconfig 
> (https://download.01.org/0day-ci/archive/20250321/202503211029.DnQpqsJs-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20250321/202503211029.DnQpqsJs-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202503211029.DnQpqsJs-lkp@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
> ERROR: modpost: "devm_of_clk_add_hw_provider" 
> [drivers/media/i2c/tc358746.ko] undefined!
> ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] 
> undefined!
> ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] 
> undefined!
>>> ERROR: modpost: "__ffsdi2" [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!

This comes from __bf_shf(spec) in omnia_mcu_request_irq().

As far as I can tell, this is not your problem but in the
SH architecture missing one of the libgcc functions that are
called by gcc.

Since this is only for compile-testing sh allmodconfig, and
that is already broken because of other bugs, I'm not going
to care either.

Adding the linux-sh list to Cc, it would be nice to get a clean
build again. All four problems should be trivial to address,
and some of these have been broken for many years.

      Arnd

