Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B75CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcsQscn35Hn+B3P9DzOAGAp7XTk6vMF6bXs5BZWRQI4=; b=wQUsIVI8D2d0vtkxRgsSnSXHVE
	yB+nHnP3fOQYt+Z0oy/M8DqHy2qfYUX7X4vLUWbQUWKulUsWr/hMUSdAkY/ir8l1h1RiFI/XEZD2H
	K2qScw8UFC1SaUfdvte/6qTTWpph0mSRWpjUxOaI66fUWROf5KzPRnbf/6cihjBLGXWl7EnfPJJDZ
	oA6m/iFL7AnqMbg1xMicAJi20OhYc50Pez3bLTcqcp6caXcTy31DJOQcXPiMLdEAntjQWLvkHKIFq
	RLdO+YhLXwg7KOegIvCIt5N09FnuYK6qJWGVOe5RmWmqRsRjFufQpvG1LF9soSRuAZEy5QvJ+czXD
	YigEz1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXclc-00000009Emw-3D0r;
	Thu, 11 Jun 2026 10:36:08 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcla-00000009ElZ-0hN3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 10:36:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781174139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JcsQscn35Hn+B3P9DzOAGAp7XTk6vMF6bXs5BZWRQI4=;
	b=KFy8/n/U/fMnO10jGMsAygH4UuAAi21IOhBjFo7Xzu7zVu4XCvEjkoJ8LarfwYpOklSdRa
	kWeT9p74fCYbUZZMIJscQ118mwSlcgHEyJ71iwi/tBAUUtGcxMEmP6dGbNqb+yMd49Y/LP
	6NH3XiQ/KrwvwidiAoww7440ILnsNRI=
From: Lance Yang <lance.yang@linux.dev>
To: rppt@kernel.org
Cc: lance.yang@linux.dev,
	dave.hansen@intel.com,
	xueyuan.chen21@gmail.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	yang@os.amperecomputing.com,
	jannh@google.com
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero folio read-only
Date: Thu, 11 Jun 2026 18:35:12 +0800
Message-Id: <20260611103512.46955-1-lance.yang@linux.dev>
In-Reply-To: <aipacpSZrO1DKooO@kernel.org>
References: <aipacpSZrO1DKooO@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_033606_360272_5E2B1C3B 
X-CRM114-Status: GOOD (  26.50  )
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


On Thu, Jun 11, 2026 at 09:49:22AM +0300, Mike Rapoport wrote:
>Hi,

Hi,

>
>On Wed, Jun 10, 2026 at 11:20:22AM +0800, Lance Yang wrote:
>> Hi Dave,
>> 
>> Thanks for taking the time to review.
>> 
>> On Tue, Jun 09, 2026 at 12:33:36PM -0700, Dave Hansen wrote:
>> >On 6/9/26 07:37, Xueyuan Chen wrote:
>> >> +bool __weak arch_make_pages_readonly(struct page *page, int nr_pages)
>> >> +{
>> >> +	return false;
>> >> +}
>> >
>> >This is a rather wonky function. It's going to cause all kinds of fun if
>> >it is used like this:
>> >
>> >	arch_make_pages_readonly(syscall_table, 1);
>> 
>> Ouch, yeah, it is ...
>
>We already have set_direct_map* APIs, why don't you add a new one there?
>set_direct_map_ro() for example.

Good point. I was trying to make this generic, but that's a bit too cute.
This is really a direct-map thing, so adding a set_direct_map_ro() helper
there makes more sense.

> 
>> >It's also kinda weird to have it return a bool, and not check that bool
>> >at the single call site. Some things come to mind:
>> >
>> >1. This function needs commenting. It needs to say what it does, when
>> >   architectures should override it and what their implementations
>> >   should look like. It needs to be clear that this can't be used for
>> >   anything really important. What should architectures do with alias
>> >   mappings? Are they allowed to touch non-direct map aliases? Are they
>> >   required to?
>> 
>> Agreed. Needs a real comment ...
>> 
>> Just meant as a best-effort direct/linear-map permission chang, nothing
>> stronger than that. I should spell out what happens, or does not happen,
>> to non-direct-map aliases, if anything, and make clear callers cannot
>> treat this as a hard guarantee :D
>
>It's not only about highmem, anything that changes the direct map might
>fail to allocate memory when splitting larger mappings.

Yes, exactly.

> 
>> >2. The return type needs to be reconsidered. Is 'bool' even acceptable?
>> >   Should it just be 'void' if callers can't do anything when it fails?
>> 
>> Maybe ignoring it is OK now, but someone may need the return value later?
>> 
>> >3. What should the naming be? "readonly" vs "ro". Should it have a
>> >   "maybe" since it's kinda optional?
>> 
>> Fair point. "make" may be overstating it a bit ...
>> 
>> With a return value, arch_try_make_pages_readonly() sounds about right
>> to me. If we end up with void and pure best-effort semantics, maybe
>> arch_maybe_make_pages_readonly() fits better :)
>
>Realistically, I wouldn't expect 32-bit configs to enable
>PERSISTENT_HUGE_ZERO_FOLIO or even THP, so naming this function to reflect
>32-bit behaviour seems odd going forward.

Cool with that, if no one objects. No need to bake that into the name I
guess. int return plus a comment should be enough, just like
set_direct_map_*() family already does :)

>> >4. Should this new API be folio or page-based in the first place?
>> 
>> For page vs folio, I was mostly following David's RFC v1 suggestion.
>> 
>> Current caller is a folio, sure, but the page-range helper leaves room
>> for non-folio users later. Happy to add a simple folio wrapper if that
>> reads better ;)
>> 
>> >5. Is mm/huge_memory.c the right place to define a generic mm function,
>> >   even a stub?
>> 
>> Ah, you're right! My bad, wrong place for a generic stub. Will move it
>> out for RFC v3.
>
>We have include/linux/set_memory.h for such function declarations and their
>stubs.

Yep, will move it there :)

Thanks, Lance

