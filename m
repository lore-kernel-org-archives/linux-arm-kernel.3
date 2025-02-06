Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01707C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVP15nWlaJTuF5QAI5a7hQoatbM7KGy1mQBSxj1R2Xo=; b=FN/FqAhE+Zlc+z02LXeTeIbj/t
	MvCAZdqClxXPCunZXGJuz64HobZsZ/cOgboDnVlr9dPHiMODvQqmF05y1/XR5de5wqCJKlbKwDaUH
	aAUuhDDuL8hQo8KZeNes8HJHtVo7TcD4UXb28dO8AJqhlP7sPIoe7V7ZHSbypPfsp3ATDI34U9DJy
	IvEMM0fzkur62j61qfo8usKZAajOF8GXmCtJqRUQ/tirA+ARt4UQ0pE8Qk5WrD/dZMoJ1be8uxP1Q
	NR92scqjsCrvb7UMhHT75bzaBboCH9L7xANemyMcY/n9SuD5dWhvhS58DKDrv7i/wHRv6XYViZkVZ
	gGPLBBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1Xm-00000006L5a-0ihk;
	Thu, 06 Feb 2025 13:03:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1WN-00000006Kvq-3mmi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:02:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 784E75C57D9;
	Thu,  6 Feb 2025 13:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB887C4CEDD;
	Thu,  6 Feb 2025 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738846938;
	bh=gMnKCXJJNauCnoNW3VMTOeQupLk2wpUlZoB93lQkTRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oBd+0AB65uFPz1BTJrl7XALLiRqtd8nV3WZObgdI7ERBuQ2LTvgaUCOooHYV0WQbU
	 HCnn47UMXsSNMJ8ehggMypBX1Rp2BlnKqClWGlR7e9sfxt7hPXG2Bl3iSkL//6C2HT
	 TeiqE9FKOo0ZlHAGS9A63MCFXchMTHsXAjOVSgoNFELq3FgYEFINAoS0qAvUla18Ue
	 xBgBfOGhE1t8mopo/SppjaFK5Xya1VXh5uaBT/EI9RR5PESF8p9jRRcVvYX0zQolLS
	 1NlfKTtX7Wu/gkxZkMWyUP2V08kp975V5XnVi+ap+ZlnZEyj286hrKJ/uFRINqr49X
	 68k45E6Ex1OOg==
Date: Thu, 6 Feb 2025 13:02:14 +0000
From: Will Deacon <will@kernel.org>
To: Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] arm64: cacheinfo: Avoid out-of-bounds write to cacheinfo
 array
Message-ID: <20250206130213.GA3204@willie-the-truck>
References: <20250123181159.1849346-1-rrendec@redhat.com>
 <20250204123955.GD1063@willie-the-truck>
 <bc37567a390a5ebe1fac2a196358ac139c751561.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc37567a390a5ebe1fac2a196358ac139c751561.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_050219_985929_D35053D3 
X-CRM114-Status: GOOD (  21.36  )
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

On Tue, Feb 04, 2025 at 10:55:53AM -0500, Radu Rendec wrote:
> On Tue, 2025-02-04 at 12:39 +0000, Will Deacon wrote:
> > On Thu, Jan 23, 2025 at 01:11:59PM -0500, Radu Rendec wrote:
> > > diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
> > > index d9c9218fa1fdd..77ffda7284754 100644
> > > --- a/arch/arm64/kernel/cacheinfo.c
> > > +++ b/arch/arm64/kernel/cacheinfo.c
> > > @@ -101,16 +101,18 @@ int populate_cache_leaves(unsigned int cpu)
> > >  	unsigned int level, idx;
> > >  	enum cache_type type;
> > >  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
> > > -	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
> > > +	struct cacheinfo *infos = this_cpu_ci->info_list;
> > >  
> > >  	for (idx = 0, level = 1; level <= this_cpu_ci->num_levels &&
> > > -	     idx < this_cpu_ci->num_leaves; idx++, level++) {
> > > +	     idx < this_cpu_ci->num_leaves; level++) {
> > >  		type = get_cache_type(level);
> > >  		if (type == CACHE_TYPE_SEPARATE) {
> > > -			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> > > -			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> > > +			if (idx + 2 > this_cpu_ci->num_leaves)
> > > +				break;
> > 
> > Why are you checking 'idx + 2' rather than 'idx + 1'?
> 
> I don't like "magic constants", and I thought "idx + 2" would be more
> suggestive since 2 elements were added.
> 
> The check is correct though. For example, if this_cpu_ci->num_leaves = 3
> (the array size is 3) and idx = 2, then 2 + 2 > 3 is true, so you can't
> add two more elements. On the other hand, if idx = 1, then 1 + 2 > 3 is
> false, so you can add the two elements (at indices 1 and 2).
> 
> If there's a strong preference for "idx + 1", I can change it. But then
> of course ">" will need to change to ">=" as well.

Might just be me, but I'd personally find that clearer given that we're
assigning to infos[idx] and infos[idx + 1].

Thanks,

Will

