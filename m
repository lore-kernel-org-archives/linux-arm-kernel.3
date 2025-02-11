Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F495C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CMMII7gg+S8ZOua/g5opUsXHaf674ZZLjjOpdOjwqM=; b=FbLVJoVQJLkC/+AMyFCuoRgvrQ
	t9aC/QhE1M7XmGEcL0w/mzpcuxAK56fl8kftHBEG80BezoTo33wfOW+jtMHpEVKGdNqk5O63aPfA0
	Y3gjZh5qmBmOsH3qmklJjX9T09OLSU5EwcuyjirxiQx2U+sVUjlUfiR0jt+NNQRfpz9zODo3oWiqn
	wotz6oCr8rArUqJBg8G2uVMkeWO7dQFnMFgKEuQDwWTvBJ2X7dCR+FJh0tmsX6Hy71Cm/vFAKXQHW
	cOHlG7MIm8Dg00NU819rBWR7FR63X5PrNmo76Wmzf25asvkL7lXJyFYxbkks3Zy2XEruw550CxAPT
	H/02xDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvso-000000050YF-0Dle;
	Tue, 11 Feb 2025 19:25:22 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvpX-00000004zPS-2h0W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:22:01 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 082C92540113;
	Tue, 11 Feb 2025 14:21:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 11 Feb 2025 14:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1739301715; x=1739388115; bh=4CMMII7gg+
	S8ZOua/g5opUsXHaf674ZZLjjOpdOjwqM=; b=p6Lng5ZCX20mDzQNjqo+bbgI9M
	npPT8FklqciXwLGjqcT8Au3W5BJI/lfFBHCsx3UZ41Fkp6M5gU2f9WIZIOO4IfLz
	eHNEABYblCeOEjtnbpydn8zc0VTyiRzm9iQ4qofAp9wVD8UAk3agXPiOwekZJrXz
	MvT6b8fJXFN5kyiXff4fO4L/oHCGySvOGR/gddZU1pOPYxzRRSNvKtrgjJmac6Td
	ciFEHYYJojcv/0BNV1Lzde7dicQ6r/SYjMTRI0BGvYeZ77lwA535KlomsZaNVfc2
	TA/wK7WxQlNtSm2jKC9nklyzpSeG4seTsb7N858T0Got3o/pU/SijgS9TWmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739301715; x=1739388115; bh=4CMMII7gg+S8ZOua/g5opUsXHaf674ZZLjj
	OpdOjwqM=; b=M95Iwyi6FtMUh7KPJgK56Wce/ol4WOjqun99tTLR3eZjBJ1KvCG
	/iqKQsfU7sGOuerb6/qDJg6j88pFxwSRG+GHAQ8B0iaFyA9pxM0mq8yMgdak5C4k
	SpQsVAx4GQ3yXT918CeeU4ozH4WjhUOoEM/1XYz/mh8sdKhF+Ns6Tibrko24g9Gj
	KEw/7ugiEuAacIkqxI+UOgkgrRKKjYH4bWSK4bgeZpc1B+xEjxe8Bkx91gXHV/cj
	5KVs76A9L37pziRP7TOmg0QTKfvBn/GcvxifPVkChPosFMPl4jfFYcYokxxjfn5f
	lBvsAdaZ4DIXEs6yAo63CXTjpgXYorJnSPQ==
X-ME-Sender: <xms:U6OrZ59UBYN-cFuUVAg1HUTC2A-KvdIGR5abqEbWIcEDnO70U8Vunw>
    <xme:U6OrZ9v91b_sCtxu66wg1qC57Prxo9R2ELtqAbe8Si0fkcxSNUQCSBoZ_sTWfQJnV
    mya6vod980qYXA-xkE>
X-ME-Received: <xmr:U6OrZ3AwdNfjAI-szRwK1zvGJ4MkQaoMkDJ_lRNg9DR2R34TVispYQ0gqlJsbN0_mVmRGJylH5NuUtAxgDH8338W6syNm-8Y5hs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepudefhfehudetjeeutdfhvefhtdeltdfgheefkeefleegveev
    tedtveelfffhiedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgv
    thdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprh
    hosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtoheprghlhihsshgrsehr
    ohhsvghniiifvghighdrihhopdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvpdhrtghpthhtohepjhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopeif
    ihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlh
    hinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhi
    shhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehiohhmmhhusehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:U6OrZ9erICxeLKtv6LRcbSWf_u5GLNZ9i4lTMgfqxre8ndwsGs8jTQ>
    <xmx:U6OrZ-MYxDweROPJ9p79fDIf7AD8irrFJGtIkDHdI8ztD3q1iIzbiA>
    <xmx:U6OrZ_kmBVpDMbmoe4CARgdr7aXORa4zf45F6JPMOeAw3CuYclXYqA>
    <xmx:U6OrZ4vfXkODZch2zGpMRRxixhJGTtKwlqSfNW8UflKv_hk17rYx3g>
    <xmx:U6OrZ1pwJBCZX0WeuuCRjO1xQVKskjEe_pnW_ebS2OFBRQqfVc4qhonm>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Feb 2025 14:21:54 -0500 (EST)
Date: Tue, 11 Feb 2025 20:21:52 +0100
From: Janne Grunau <j@jannau.net>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] iommu/dart: Assert !locked when configuring
Message-ID: <20250211192152.GA810942@robin.jannau.net>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-5-5d97fe247f35@rosenzweig.io>
 <756ba6d7-b18e-4139-851b-496b1820117a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <756ba6d7-b18e-4139-851b-496b1820117a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_112200_177078_156CEE41 
X-CRM114-Status: GOOD (  13.24  )
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

On Tue, Feb 11, 2025 at 06:41:00PM +0000, Robin Murphy wrote:
> On 2025-02-10 7:39 pm, Alyssa Rosenzweig wrote:
> > Configuration is only possible and needed for non-locked DARTs and will
> > fail for locked DARTs. We cannot try -- assert that we do not.
> 
> Except now we absolutely will - if a locked DART and its client device 
> are advertised to Linux, instead of gracefully refusing to touch it, 
> we'll now attach the client to a DMA domain, firing a barrage of 
> multiple WARNs in the process, and give it DMA ops which still cannot 
> work. I'm not really convinced this series on its own leaves us in a 
> better position than we're already in now... :/
> 
> How hideous is the rest of what's required to actually make this usable?

The TTBR can not be changed but the preset first level table can
modified at will. The driver keeps a shadow first label table and syncs
that to the preset 1st level table on flush_tbl().
It gets more complicated by the fact that the iommu for the display
coprocessor is locked and mappings for its firmware and boot framebuffer
are preinstalled and have to be maintained or restored on
initialization.
This is handled via reserved memory with translation.

Downstream change to handle this is in
https://github.com/AsahiLinux/linux/commit/d90cc3590ea460e1c574b4b7c47fdafb2794af6a
not including the change to parse / handle reserved memory with
translation in iommu core.

Janne

