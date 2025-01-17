Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D383BC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5OCrW6gTNsEMxml0b1MJlVaYrg+HOlJbgHUesKNAbM=; b=LmG54dLF47CQh3pFwIdATd7y/Y
	ZLUOyp7Xge5VJ1OKteufUk6FZ7TL1gRYa3g7xP/o8Ve4JiC6EqQ96VvgLkllCaa471zuoeW+Tcb8T
	cjzmeZ3yZuk8JIoCn6ArJDYP2ppUvBF5UioUJVPfMiHDLGPMAJfHPXLe/VtSRmQg1ZNhS3ZmWSi8f
	maUSx//8UkklovmTdEVArvGSDiNgvE7yu6q+2CB61EL9IR6k9BMZ5vX8YWC/omZRwiKqiw2ibvbbX
	4WGbzwv1VJfk0VcfokD++ynucUINMHfBKzMV6ZrjE/eSbvBuwJMbE6xp1AKn170PoBRuZtwsJUII/
	V0QFAskg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYm6M-00000000K4H-3vng;
	Fri, 17 Jan 2025 13:09:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYm57-00000000Jpu-0rrv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 13:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F76D5C622D;
	Fri, 17 Jan 2025 13:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0C2C4CEDD;
	Fri, 17 Jan 2025 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737119292;
	bh=msPZM5IDix+Tn6A1dQHVMIMoFBXucrIv9odOQfpHXNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/KoeuNGdFn7rLzidJ6jfvzDoLYevcC36toPxN53Jze8sjfb90Hrn9GwDZLJsJSHw
	 mkYnPEnbnV8Xmcy4lwhnuaqfXk2JJhEwDX66X65jOKT41/owuVgB5wzN68Qkc2dCuk
	 6saOlDIixhfMXwkRTlUT0poGJLloA1334tXpUj4VWD91RlMdHQkeWEUmItrCFOQJ2M
	 qnWTVtIzXL+690BLZRMARNSCIfcB18CQs69e6KsMhUm8k/2ZpjrlORSHnWf1PBt3IZ
	 bIdjSQJr49Qh7yuaULsyIjwVdOROaOsRh3DXurB+kPOlzD4Ad6GitRY2p02eJWRlc8
	 up89h44XAjh0Q==
Date: Fri, 17 Jan 2025 07:08:11 -0600
From: Rob Herring <robh@kernel.org>
To: Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>
Subject: Re: [RFC PATCH 0/1] arm64: cacheinfo: Avoid out-of-bounds write when
 DT info is incorrect
Message-ID: <20250117130811.GA445389-robh@kernel.org>
References: <20250116185458.3272683-1-rrendec@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116185458.3272683-1-rrendec@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_050813_327490_1C84F98A 
X-CRM114-Status: GOOD (  31.28  )
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

On Thu, Jan 16, 2025 at 01:54:57PM -0500, Radu Rendec wrote:
> Hi all,
> 
> I found an out-of-bounds write bug in the arm64 implementation of
> populate_cache_leaves() and I'm trying to fix it. The reason why this
> is an RFC is that I'm not entirely sure these changes are sufficient.
> 
> The problem is described in detail in the patch itself, so I won't
> repeat it here. The gist of it is that on arm64 boards where the device
> tree describes the cache structure, the number of cache leaves that
> comes out of fetch_cache_info() and is used to size the cacheinfo array
> can be smaller than the actual number of leaves. In that case,
> populate_cache_leaves() writes past the cacheinfo array bounds.
> 
> The way I fixed it, the code doesn't change too much and doesn't look
> ugly but it's still possible to write past the array bounds if the last
> populated level is a separate data/instruction cache. But I'm not sure
> if this is a real-world scenario, so this is one of the areas where I'm
> looking for feedback. For example, the DT may define a single unified
> level (so levels=1, leaves=1) but in fact L1 is a split D/I cache. Or
> the DT defines multiple levels, the last one being a unified cache, but
> in reality the last level is a split D/I cache. I believe the latter
> scenario is very unlikely since typically only L1 is a split D/I cache.

I think it is a safe assumption there is not a split cache below a 
unified cache. The DT binding doesn't support that either as 
'next-level-cache' is a single phandle (though I guess it could be 
extended to allow multiple phandles).

> The other thing that doesn't look right is that init_of_cache_level()
> bumps the level at each iteration to whatever the node corresponding to
> that level has in the `cache-level` property, but that way one or more
> levels can be skipped without accounting any leaves for them. This is
> exactly what happens in my case (the Renesas R-Car S4 board, described
> in arch/arm64/boot/dts/renesas/r8a779f0.dtsi). In this case, even if
> populate_cache_leaves() is fixed, the cache information in the kernel
> will be incomplete. Shouldn't init_of_cache_level() return -EINVAL also
> when a level is skipped altogether?
> 
> Last, and also related to the previous question, is a device tree
> definition that skips a cache level correct? Or, in other words, should
> the definition in r8a779f0.dtsi be fixed?

The answer depends on whether there's L2 caches in in the cores 
or not. They are optional in the A55. Calling the L3 level 2 when 
there's no L2 would be confusing. So if there's not an L2, I think 
the description is correct (though perhaps missing L1 cache sizes if 
that's not otherwise discoverable). If there are L2 caches, then there 
should be a cache node under each cpu node.

It could get even messier with heterogeneous systems where some cores 
have an L2 and some don't.

So the cacheinfo code needs to deal skipped levels.

Rob

