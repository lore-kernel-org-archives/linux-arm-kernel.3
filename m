Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A214CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJEyad8/zSUSfFThXl+omadAtBvnvl3F5572ZCdBP0Y=; b=QCvquG5fb9SUk0VBuH+/Xq1FGf
	2qD7RC4XIxdZU1aolPSyJbwZO/s8i+ItsvOOEAgn5no5EO/NHHWMaTcC6B+S3F+z81vJVR+T8saXM
	50dYVJsJ66GKKluDcs+F4GK4jY6246nY4AXU4nGJZL593qaHAIF5oq/joyMfciZkG/DIKtgUnWBoR
	3cKH0xnhpduAh7MwEX9XC9LoqL6djN5LZLk+on1XO3WhuZfCXboaEPZOsqsEnZU1bx/AR4BolzMY6
	8RgpWZY3P/D91ygFLjnGQOn6lhIOcp7ajzKaDnAOxmC9r9hKv8MdlXq176La4RlLZzDeOAG3yUdAQ
	0g924rqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7Nf-00000008fbZ-2F85;
	Thu, 21 May 2026 17:40:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7Nb-00000008faI-02l0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779385216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJEyad8/zSUSfFThXl+omadAtBvnvl3F5572ZCdBP0Y=;
	b=Q3GU+rDXn2ofGh7+OLNbyCxaMmxEOzZUW0rxkX6Y/ls5Nux676LcuAf0zJZ9bKgiZW5cIf
	0vcGYV02KDh0U2RfENWNcc9LwKwDQgK3TBVVUwqJZL/DN4H5EyNQy+eHADEA53iaPt/Sxs
	KilqWhw8LkJRUlwaiLKgVBBS8x6os4A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-bF8ejiEDPdiWvmJNxRVV2g-1; Thu,
 21 May 2026 13:40:13 -0400
X-MC-Unique: bF8ejiEDPdiWvmJNxRVV2g-1
X-Mimecast-MFC-AGG-ID: bF8ejiEDPdiWvmJNxRVV2g_1779385211
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29255180060D;
	Thu, 21 May 2026 17:40:09 +0000 (UTC)
Received: from [10.22.80.218] (unknown [10.22.80.218])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 43AD119560AB;
	Thu, 21 May 2026 17:40:04 +0000 (UTC)
Message-ID: <f0f4841a-816a-4442-bebb-277984ee950e@redhat.com>
Date: Thu, 21 May 2026 13:40:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gfp_types: Introduce a new GFP_ATOMIC_RT gfp flag
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-rt-devel@lists.linux.dev, Matthew Wilcox <willy@infradead.org>
References: <20260520204628.933654-1-longman@redhat.com>
 <ag8zX5KJUKo70TvG@lucifer>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ag8zX5KJUKo70TvG@lucifer>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: yE-osPR6ihHhzh_a779vnmlDq0Zsft6drQ2faCjg0Lg_1779385211
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_104019_120871_E2ACE091 
X-CRM114-Status: GOOD (  31.74  )
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

On 5/21/26 12:40 PM, Lorenzo Stoakes wrote:
> +cc Matthew who has fairly strong opinions on GFP flags and such :)
>
> Also, please don't send 2 patch series with 2/2 in-reply-to 1/2, use a
> cover letter + have patches reply to that :) [yes it's one of those
> subjective things that people differ on a lot but generally how we do in
> mm]
>
> On Wed, May 20, 2026 at 04:46:27PM -0400, Waiman Long wrote:
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
> This seems like the wrong place for the solution, now we have to remember
> to use a specific GFP flag but only in one specific place in some IRQ code,
> yet RT is fine with this in any other scenario?
>
> This is really confusing.
>
> Wouldn't we better off with a way of actively detecting this context
> somehow in the page allocator?

This new GFP_ATOMIC_RT flag will make memory allocation more likely to 
fail compared with GFP_ATOMIC. That is the main reason why I think a 
separate flag with documentation about this difference will make the 
users of the new gfp flag more aware of what they should check before 
they use it.

I would certainly like to have the mm memory allocation code to handle 
it automatically if it doesn't impact the failure rate.

>
> It just instinctively feels like this is the wrong level of abstraction for
> a fix here :)
With PREEMPT_RT, GFP_ATOMIC_RT just translates to __GFP_HIGH. It can be 
set explicitly in the relevant call sites. This patch is more a 
documentation step to make clear the purpose and consequence of doing that.
>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   include/linux/gfp_types.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
>> index cd4972a7c97c..ac30882b6cd4 100644
>> --- a/include/linux/gfp_types.h
>> +++ b/include/linux/gfp_types.h
>> @@ -316,6 +316,13 @@ enum {
>>    * preempt_disable() - see "Memory allocation" in
>>    * Documentation/core-api/real-time/differences.rst for more info.
>>    *
>> + * %GFP_ATOMIC_RT is similar to %GFP_ATOMIC with the addition that it can also
>> + * be used in context where preemption and/or interrupt is disabled under
>> + * PREEMPT_RT, but not in NMI or hardirq contexts. The allocation is more
> I'm not sure 'GFP_ATOMIC_RT' really communicates all of this information.

I am not good at naming. If you have other good suggestion, I would like 
to hear it.

Cheers,
Longman



