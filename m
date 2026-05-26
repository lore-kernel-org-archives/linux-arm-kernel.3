Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F638CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOZga64l4+qEI0ExolVv1Na0jB0MzxUaNAe9iBNorjE=; b=bTA7ViJKOlA35v0sHMZcmmAOxD
	Ckks9NkLRN8cqN7KISR64rgNJ2TTzln7cWq63Xmc6x4TF881mgGoD4ofipkSKzqxtGeFVXU5cmGNx
	kgnXeiS/XDTc+sRr9VD6bpj9C8sUiqOYsuU9DKEc9mH1HVCWu2uhys/7qSgseHJOKuwK3iHaekZlS
	rKOoQ2YSu+tRLNA+Mi9qubnIfKFuvs9nto+3KRQUetjj0ns+paGHdtJKvY4NSlQbWl8bPTOmM4zPt
	DzEcyBodXifilhSNTXsoaveR8dv17Q58ViXIuK+HeKLHAJIGkt2/qX5QcbHPKDhEdC3O9PiDrqUPP
	vM4Eu6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsFb-000000026tL-0qDt;
	Tue, 26 May 2026 13:55:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsFY-000000026sl-2bjj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:55:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66F814447B;
	Tue, 26 May 2026 13:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2265A1F000E9;
	Tue, 26 May 2026 13:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779803715;
	bh=TOZga64l4+qEI0ExolVv1Na0jB0MzxUaNAe9iBNorjE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=An1vJ5FKeLsmfAD5GsMF3Z1DGYPftLx702IeF3mDxSfjO7o+ThuhicLgk51gET/2n
	 m0hgHMmcjFUh27X2n/yhXO8JK7CyvjnGNDgPGwbKNf2qz3kushFkfmZJp+h+DJ8x3H
	 i4lgzUz3fg1vJ26Icd1Naiz9sxry0wHmRx03wVDcqLdpsteWuSms45vFlbQoVR7SAU
	 v6Yw4NzeDxNXkxlwqp4JmQbARFmbFq++EHRnlRSt0twEgbTHQ2995HNlWauY1PS6/m
	 YCyv0BY5QXI7f+Ete1wlB2R4FJF+SzdYJHIVjefIiOopVzgmKHZ/SWURG093Jguiog
	 MoJqPSkx+uHsA==
Message-ID: <16b36b01-7da2-4ec4-aefa-f06216ec218a@kernel.org>
Date: Tue, 26 May 2026 15:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gfp_types: Introduce a new GFP_ATOMIC_RT gfp flag
To: Michal Hocko <mhocko@suse.com>, Waiman Long <longman@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
References: <20260520204628.933654-1-longman@redhat.com>
 <ahQLVgj8zV4xQRh9@tiehlicka>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
In-Reply-To: <ahQLVgj8zV4xQRh9@tiehlicka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_065516_776735_947FE48B 
X-CRM114-Status: GOOD (  16.04  )
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

On 5/25/26 10:41 AM, Michal Hocko wrote:
> On Wed 20-05-26 16:46:27, Waiman Long wrote:
>> The GFP_ATOMIC flag is to be used in atomic context where user cannot
>> sleep and need the allocation to succeed. However, it does not support
>> contexts where preemption or interrupt is disabled under PREEMPT_RT
>> like raw_spin_lock_irqsave() or plain preempt_disable().
>>
>> With the advance of the ALLOC_TRYLOCK allocation flag in the v7.1
>> kernel, it is possible to allocate memory under such contexts by using
>> spin_trylock to acquire the spinlock in the memory allocation path. This
>> does increase the chance that the allocation can fail due to the presence
>> of concurrent memory allocation requests. So its users must be able to
>> handle such memory allocation failure gracefully.
>>
>> The ALLOC_TRYLOCK flag will only be enabled if none of the
>> ___GFP_DIRECT_RECLAIM and ___GFP_KSWAPD_RECLAIM flags are set.
>>
>> Introduce a new GFP_ATOMIC_RT gfp flag for those PREEMPT_RT
>> atomic contexts.  This new flag will fall back to GFP_ATOMIC in
>> non-PREEMPT_RT kernel. GFP_ATOMIC can continue to be used in contexts
>> where preemption and interrupt are not disabled in PREEMPT_RT kernel
>> like spin_lock_irqsave().
> 
> Before we go this way we need to really be clear we do want to support
> raw_spinlock (aka RT) contexts. This is a big commitment because it
> dictates internal allocator locking that would have potentially a much
> bigger impact long term. I would go this way only after/when we conclude
> there is absolutely no other way and we need to have allocator in those
> critical sections. Now you have a single place which complains ATM

We already have alloc_pages_nolock() which uses ALLOC_TRYLOCK internally
for these limited contexts. So the support and commitment exist. This
just exposes it via a new gfp flag alias. But if there's a single user
and it's already disputed, we don't have to expose it that way indeed.

> without much of an explanation why this cannot be really handled in
> other way. Have you even considered any options to pull the allocation
> from within the raw spin lock section?




