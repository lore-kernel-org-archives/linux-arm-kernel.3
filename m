Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4659DE7C70A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 07:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kpHK17s1Z6xz3JjVRVavy0ExWhOFP+85VyJ3RdlE4w=; b=xDxbhpb8PO36TKFEB23DTD3Q43
	ZFHRdor9+Xg16veIJnV5QZWCgRRfVl5qPC+LYCL4F9GZamldI5n2nzlK42LB5xOTg3COOIfNDku2g
	8VIU1sOrDRfg9qD/Zz0w3GUh4CPwfu4LKYp2rxp2Xgwy/FixBBCZvTWRKYLmPu6jze2C8HTedJTSA
	UpOmsqQBojYlsvCNgk20Bk+ioKtczNKTuS3m9VyyFHDDDCgqnRc0jh3W1eWnxtayfa3lllL7KLcPd
	jjwx8dpPve1WPqiZvLeQ/SV+mrbcho38sEmtGrM/0oy0Pvoko7WtVnJV7nx0ZFOLGrjqNbot44yyj
	dFGOFicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmobJ-00000004biD-0btm;
	Mon, 02 Feb 2026 07:44:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmobH-00000004bhs-07Uo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 07:44:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00B9A442D3;
	Mon,  2 Feb 2026 07:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9AFC4AF0B;
	Mon,  2 Feb 2026 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770018235;
	bh=Wx6zDnajmZZdgiHVlWIKBs8yudA1QP5iyWHbsFAQdLQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=HVcBQxLTn4UjZnq7J+5Fs086qlBUOTmwv7OeLyww2/ZP9HTfRqVIzU4MbogF/6VJK
	 FgrMjRkWSai0c7nyHtgK168o+hUiMKPXL0E+z165pmp0qg1fuvFZQ38ewrq1IJJNmm
	 6lG6p131ma9B+4EfA/Y5DERj+RODI2MNXbxm6Ya8hIpQKxKYB1qWzpSbvzzFHDAJbm
	 uNmcN5RJCYGUw4W7oFb5uKjfs1K3BxV6GtetPuP98VeubJZb4lt76xz9KHcvflZ1Zr
	 cKUjxYwQa8atrrj9ss3YAFhPrt+mAso0zAYmP3A+fsq9fiZXEbLV8HMn46vvVCZ6Dz
	 pk4HUFy1KZ3Zw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 54B85F4007C;
	Mon,  2 Feb 2026 02:43:54 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Mon, 02 Feb 2026 02:43:54 -0500
X-ME-Sender: <xms:ulWAaStlknjTrDUWdERH9gRRoaSapAK41Km3o1tsqdI_p5u8sj4TPQ>
    <xme:ulWAaSSJbEbY2KvtploRNTV2Y62CJO9JctCpTAzZg71odj0SkBYa2i1c1uv4Qps4H
    T2Ln-zTC3qC8ia_kjsEctQEv4Di-UwQoBHIoDRRvqPuyEuhnS7_Yn1k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeejtdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeetkeehudehiedufefhjeeiffeugeeltdfghfdtffeftdeivdehhfefieeu
    tedttdenucffohhmrghinhepphhrohgtrdhssgenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhguodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdduieejtdehtddtjeelqdeffedvudeigeduhedqrghruggspeepkhgvrh
    hnvghlrdhorhhgseifohhrkhhofhgrrhgurdgtohhmpdhnsggprhgtphhtthhopedugedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrsh
    esrghrmhdrtghomhdprhgtphhtthhopeguvghvrdhjrghinhesrghrmhdrtghomhdprhgt
    phhtthhopehrhigrnhdrrhhosggvrhhtshesrghrmhdrtghomhdprhgtphhtthhopegrrh
    hnugesrghrnhgusgdruggvpdhrtghpthhtoheptghlsehgvghnthifohdrohhrghdprhgt
    phhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmh
    hmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgu
    rghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslh
    hishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:ulWAaXd-c82xllHkjEfnMapa4yE-fDVMzEQNGOXkNVE_WY6yEmkAhg>
    <xmx:ulWAaXnXtIzo5E2r4L2IbfA2fKc1x4AXhdXQUznZ3koN8Fh6qn7cdQ>
    <xmx:ulWAaWoU6aCVYlM8hYFj2rZAQiQXmVJV0_WLy5mvAKNNASWViRJdvA>
    <xmx:ulWAaUERtMTwuQR4-pmODvqa5YD-RYmzqvjCIEQ5PQLRvVBCt1uN7Q>
    <xmx:ulWAacTDQmKAc3SsySmM-bxpbQhloUzG_f89gqScbXpnqzC-tu8C4Lja>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 28379700065; Mon,  2 Feb 2026 02:43:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AF_iGlW-huzg
Date: Mon, 02 Feb 2026 08:43:32 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>, "Yang Shi" <yang@os.amperecomputing.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Ryan Roberts" <ryan.roberts@arm.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand" <david@redhat.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Dev Jain" <dev.jain@arm.com>, scott@os.amperecomputing.com,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Message-Id: <bf94fb74-d391-440c-a90e-1346312328c4@app.fastmail.com>
In-Reply-To: <fd18c462-60ce-4dc1-9877-2a1d162d5879@app.fastmail.com>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-5-yang@os.amperecomputing.com>
 <fd18c462-60ce-4dc1-9877-2a1d162d5879@app.fastmail.com>
Subject: Re: [PATCH v8 4/5] arm64: mm: split linear mapping if BBML2 unsupported on
 secondary CPUs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_234359_117109_98143165 
X-CRM114-Status: GOOD (  16.92  )
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



On Mon, 2 Feb 2026, at 08:18, Arnd Bergmann wrote:
> On Wed, Sep 17, 2025, at 21:02, Yang Shi wrote:
>
>> +	.pushsection ".idmap.text", "a"
>> +SYM_TYPED_FUNC_START(wait_linear_map_split_to_ptes)
>> +	/* Must be same registers as in idmap_kpti_install_ng_mappings */
>> +	swapper_ttb	.req	x3
>> +	flag_ptr	.req	x4
>> +
>> +	mrs     swapper_ttb, ttbr1_el1
>> +	adr_l   flag_ptr, idmap_kpti_bbml2_flag
>> +	__idmap_cpu_set_reserved_ttbr1 x16, x17
>
> I'm getting build failures here, using CONFIG_CFI using clang-21:
>
> ld.lld-21: error: undefined symbol: __kcfi_typeid_wait_linear_map_split_to_ptes
>>>> referenced by arch/arm64/mm/proc.o:(.idmap.text+0x298) in archive vmlinux.a
>
> I can get it to build by using plain SYM_FUNC_START() instead of
> SYM_TYPED_FUNC_START(), but I have no idea if that makes any sense:
>
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -439,7 +439,7 @@ SYM_FUNC_END(idmap_kpti_install_ng_mappings)
>  #endif
> 
>         .pushsection ".idmap.text", "a"
> -SYM_TYPED_FUNC_START(wait_linear_map_split_to_ptes)
> +SYM_FUNC_START(wait_linear_map_split_to_ptes)
>         /* Must be same registers as in idmap_kpti_install_ng_mappings */
>         swapper_ttb     .req    x3
>         flag_ptr        .req    x4
>

This is not the right fix: the indirect call from linear_map_split_to_ptes() will be instrumented, and so it requires the CFI annotation to precede the function entry point, which is what SYM_TYPED_FUNC_START() is supposed to emit.

The typeid symbol is injected by the compiler into every object file that takes the address of the function in question, and so the fact that it is missing seems to suggest that linear_map_split_to_ptes() has been optimized away entirely. Could you double check arch/arm64/mm/mmu.o if that is the case?


