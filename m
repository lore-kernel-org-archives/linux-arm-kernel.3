Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301A6D35144
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 06:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxkp1ZlgbWnhqpwUcYGXNeQglKO+uFOaAFqFyvLy394=; b=Sb0ib8X2zmPJvLXjyLPPe5oQAj
	btQubSDG7xcpriCIy1Xovr07YB4EmsADkzQ4cbhJeM9FISzBod/OKfOI2IY/d9IN49iRm1Qn9y9tY
	qk6vIF0VZM0SIJYH09KP8mqSwTUiOhVOzAg3q5B0jVy+ajrGQ34efS5EdrEY0C/gJuhsOR5zXdGcY
	fuLTMNk5il53Tl282dae4nxh55apeLuQdEdiav6EVCvCLReqEv6suHlB+hVqXtbythnKtayywV4Zn
	Nw5FhwbH1HNF45l2dzWmL/dBuSpbskb2lRokKw5z93oOWQtzGPFcYO6cGFcuKQOPVrRF6qbwVExOe
	OIDbtkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pWO-0000000E8qZ-2gPx;
	Wed, 01 Apr 2026 06:57:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pWL-0000000E8qE-42n8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 06:57:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29C48404D1
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Apr 2026 06:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3520C19423;
	Wed,  1 Apr 2026 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775026665;
	bh=RNdUik6TjbyGhb6unGHczt6oHQzdTiA5XXduOoNpS6M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=t5dMmES7g+Yo0xGsg9xg6PzGk1qKTSHD8FKn6ImpnF6Q28onXkAMa8kCpTQlzkYxk
	 EwZkuJ9lbrGSlU60/hui1S6oFD0ROoL24YTYSSBBfWGN5qyLADizbeMi3SaT4HAX3e
	 3sF6gYo0ThApX/eyzcrZdOSdTocBRkCMmewIiW/ZCkbTjDolTf+25o1xE7U1SBGfL7
	 hkclV2i2djRnIC4HYMYY77Ic/ngCbdkE6eeSPwTjEVdn4yk6Lj6q+0d3TsxvHdcFKj
	 MB5BKReQ1Drao8RB/BGeQEQK+sWag+tlBim86xoflkRrdficFYkvTBga2qbC/zlBff
	 S2IVLG7ETvVKw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BC705F40080;
	Wed,  1 Apr 2026 02:57:43 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 01 Apr 2026 02:57:43 -0400
X-ME-Sender: <xms:58HMaaX3BvCkhu4E7btKqvpqeBRBTkkEK6BbQt2vDrKF9Sno8JvReQ>
    <xme:58HMaRaDILMdGvCpw_h7-AfE8w1n7QftxparP40_-n-3knykbk1Mmag-HDwuEPoSW
    SnoEXVYcahEQqPNvau057g_YptkAnm4P0Lf2Aqb1-jxxP8K1Q9wJ20>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvgeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcuuehi
    vghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeeijeef
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    guodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqdef
    fedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peguvghmhigrnhhshhesghhmrghilhdrtghomhdprhgtphhtthhopegvsghighhgvghrsh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqtg
    hrhihpthhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:58HMaffov1of8JNuHMN4oOxsHFNxSxWtDF3-qvRP1QWE_I-HptSNww>
    <xmx:58HMaQppTlMbBH2euTNr0rKhLClv-OxbZzZFM5tmg71hN90MXYhP6w>
    <xmx:58HMacDI5PMUgwJHLm-NvmSMoDoJcWk7plETcj4gWsuXaeGcpcZZ8g>
    <xmx:58HMaVbg8hCTBb-N592BhE8KskDO9brbEXrFJrdSXOtP9LsAspaLGQ>
    <xmx:58HMaX5bUXNzsaX815sclL6u6prvohGQto4K0BBKWez3iEeF78XHt6zv>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9D820700065; Wed,  1 Apr 2026 02:57:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aics4N9pNpZs
Date: Wed, 01 Apr 2026 08:57:23 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Demian Shulhan" <demyansh@gmail.com>
Message-Id: <232d35ea-433b-4eef-86e7-5cfb9f033bf5@app.fastmail.com>
In-Reply-To: <20260331223300.GA45047@quark>
References: <20260330144630.33026-7-ardb@kernel.org>
 <20260330144630.33026-8-ardb@kernel.org> <20260331223300.GA45047@quark>
Subject: Re: [PATCH 1/5] lib/crc: arm64: Drop unnecessary chunking logic from crc64
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_235746_065600_D409F8F6 
X-CRM114-Status: GOOD (  12.73  )
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



On Wed, 1 Apr 2026, at 00:33, Eric Biggers wrote:
> On Mon, Mar 30, 2026 at 04:46:32PM +0200, Ard Biesheuvel wrote:
>> On arm64, kernel mode NEON executes with preemption enabled, so there is
>> no need to chunk the input by hand.
>> 
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> There's still similar "chunking" in other arm64 code:
>
>     $ git grep -E 'SZ_4K|cond_yield' lib/crypto/arm64
>     lib/crypto/arm64/chacha.h:              unsigned int todo = 
> min_t(unsigned int, bytes, SZ_4K);
>     lib/crypto/arm64/poly1305.h:                    unsigned int todo = 
> min_t(unsigned int, len, SZ_4K);
>     lib/crypto/arm64/sha1-ce-core.S:        cond_yield      1f, x5, x6
>     lib/crypto/arm64/sha256-ce.S:   cond_yield      1f, x5, x6
>     lib/crypto/arm64/sha3-ce-core.S:        cond_yield 4f, x8, x9
>     lib/crypto/arm64/sha512-ce-core.S:      cond_yield      3f, x4, x5
>
> I thought it was still sticking around, despite kernel-mode NEON now
> being preemptible on arm64, because of CONFIG_PREEMPT_VOLUNTARY.
>
> However, I see that support for CONFIG_PREEMPT_VOLUNTARY was recently
> removed on arm64.  So that's what finally makes this no longer needed,
> and we can now clean up these other cases too, right?
>

Indeed.

