Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47B3C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvFeSJ52Hy9OjYjsdGSFO6cUYL0PGqG3iOQEMzPpfqY=; b=Z9v/5o403GQJtV+igi23gWkbcv
	nHsqv06YWq4HBQrKXhFK1fRFGDtJrdr6k77qdT7/xW8N0zDVqNY1myDbGmL47TEFj9VFlPxYsVAjb
	BHF6pEOXhHROaJOubFZ0fpCOXL7h3BitS4sQ0R9wWCZRFUKNMrYCbh1lN5rDVduO11Psn//mYHpyb
	8J7lM9nyjVr9uhw02lvK6+lJh64xUVx088rW/MQVfiRc/IQHcztnHdWug9UmwRD6cJIYU0nNIRStl
	kZ4JLK79XhsuDX1vQy4b1+HOET/l+UyvAcV0TUr59czEEMuA32KKvzdxInrK3viQgp/eEThIf4qz5
	yZehYUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe5s-00000004ocp-2iTE;
	Tue, 28 Jul 2026 09:27:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe5r-00000004ocX-0agL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:27:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97E8D436B6;
	Tue, 28 Jul 2026 09:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3981F000E9;
	Tue, 28 Jul 2026 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785230842;
	bh=vvFeSJ52Hy9OjYjsdGSFO6cUYL0PGqG3iOQEMzPpfqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E3pj7Y2L4G/RAxOBSkVa7jWXgajNAmVApyA0rgIkGqGmBAIt5qVRZtxwr6AchxN9D
	 mkmB5xfNdfLsc6YOiqyuxBG4XTpVgbzDK/WLE4szFuS/rrrWdfAWTdSApSknzc8xTM
	 WSCgwCDNFYL05fXY8DgC2jEfljAJY6P51Ffl3DDQIUseDDEGpdhtRCI7kkHtvmKnfx
	 bU7fU0f0NQfTnt53UbhDCDrzmRhyPeVUZt8A+f4ZnbC2KLF3GMn4E+8tZEe6rMkEhh
	 2gRtv8yNE/JvegoBC7fvL0IosmwDzievIsJIfgF0XXYdXXkNYqXaMhpYhYjxMCNyzV
	 DzpcrFuMCNaXA==
Date: Tue, 28 Jul 2026 10:27:17 +0100
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ljs@kernel.org
Subject: Re: [v8 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <amh19c6vtDNKsl3C@willie-the-truck>
References: <20260609214205.1260279-1-yang@os.amperecomputing.com>
 <255744ec-2a58-492c-a69a-850357440183@os.amperecomputing.com>
 <amCqBzwIYDOvRI1S@willie-the-truck>
 <79d7069b-2895-4be3-a2a0-327ad3444bf3@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79d7069b-2895-4be3-a2a0-327ad3444bf3@os.amperecomputing.com>
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

On Mon, Jul 27, 2026 at 12:50:59PM -0700, Yang Shi wrote:
> On 7/22/26 4:31 AM, Will Deacon wrote:
> > > Yes, it may race with memory hotplug. I missed memory hotplug for v7
> > > Sashiko. Two options to solve it:
> > > 
> > > 1. Use atomic variables. Make lm_meminfo[NR_LM_TYPE] atomic_long_t, then
> > > manipulate it with atomic ops.
> > > 2. Protect it with a spin lock.
> > > 
> > > The contention for the cache line or the spin lock should be rare since
> > > memory hotplug should happen rarely. Any preference?
> > I'd vote for keeping it simple and using a lock. Might be worth looking
> > at the ongoing work from Lorenzo:
> > 
> > https://lore.kernel.org/all/20260717-series-vmap-race-fix-v5-0-606a0ac6d3e5@kernel.org/
> 
> Thanks, Will. Took a look at Lorenzo's work. IIUC he used init_mm mmap_lock
> to protect vmalloc area and linear mapping collapse on x86 in order to
> serialize against ptdump. I don't think we should use init_mm mmap_lock. We
> want to serialize linear mapping counter update between split and memory
> hotplug, but neither of them takes init_mm mmap_lock. We can let them take
> init_mm mmap_lock, but it sounds too overkilling.

Hmm, but if split and hotplug don't take the mmap_lock, how are they
serialised against ptdump? From what I understood, Lorenzo's patches
change ptdump to take it for write in order to serialise against other
walkers.

Will

