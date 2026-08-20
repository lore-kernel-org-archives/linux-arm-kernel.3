Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E355EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O76Qqjz5M37uL6Y9glYmziUW+XhtTTDVk40P+J+uEl8=; b=wnhtW1eL9DN6RYWUAl/mtidMMn
	/rQgeFkoxm1S2BG5yzpLXzgFs7HZdsEilel6qNSyxudNNmoG2DaDiFYkhdazsWcVioza/4nGCyeZ1
	o/UH4o4dV4gbBdsHC8rZNFkuePR6abMJkTwsyiI/8uoub7e2NmcGwqt2iIianncdUgIUqP+XiyWf7
	F0j7WLnyMUo+fbxbUuy1/+ZXCKJwNUxRhAIejZLHFTkIloU+rJIczxRc2SAHY5QNs6I4BG50MH8p2
	Mdift5ubLj2Qw1oE18eQy8A+iQKPFaaUq/ebBIF2BLFfIaivhljsb1MK5bVGoqlZV+wsheW8HFwC/
	5zFxq3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2J0-0000000BaQd-0A11;
	Thu, 20 Aug 2026 12:55:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2Ix-0000000BaQ4-2NzD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:55:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AC69153B;
	Thu, 20 Aug 2026 05:55:29 -0700 (PDT)
Received: from [10.1.25.29] (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9E403F85F;
	Thu, 20 Aug 2026 05:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787230533; bh=Y9Gu9Q+6PR+86XIVM8RAJWycXicry5KvRAo6sOf68bw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bns+tBwOFCYBqXFOvDOBwQdaUfdlfsgueLdq+uHMwTlY5VDzHotm1Vh3XwwKCKTd3
	 wxR32A0443Sj9AgIBtyqaL0RGV5l9VR3eM3WMKrGC3kM0aqwGuynm7/TKAX1iJKQix
	 WbKDlsUTHRDoThx2/F8+5LGVl0FN5OsOEoFRMZYs=
Message-ID: <88aed40c-051e-4535-9964-3666456e79ee@arm.com>
Date: Thu, 20 Aug 2026 13:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] irqchip/gic-v3-its: Zero shared pages after
 conversion
To: Marc Zyngier <maz@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Thomas Gleixner <tglx@kernel.org>,
 "T.J. Mercier" <tjmercier@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Jiri Pirko <jiri@resnulli.us>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20260820105026.53208-1-steven.price@arm.com>
 <20260820105026.53208-2-steven.price@arm.com> <87wltlnfay.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <87wltlnfay.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_055535_872291_8E42AB22 
X-CRM114-Status: GOOD (  38.28  )
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

On 20/08/2026 13:32, Marc Zyngier wrote:
> On Thu, 20 Aug 2026 11:50:24 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> its_alloc_pages_node() passes __GFP_ZERO to the page allocator before
>> calling set_memory_decrypted(). This assumes that converting a page from
>> private to shared preserves its contents.
>>
>> For Arm CCA with MEC (Memory Encryption Contexts) the key used to access
>> the page will change, and so by default the visible data will change.
>> The host could ensure that it zeros the page, but rather than relying on
>> the host's behaviour it's best if the guest simply zeros after the
>> decryption rather than before. Specifically in this case the ITS tables
>> are required to be zeroed.
> 
> What are the guarantees that we want to enforce post decryption?  My
> recollection is that the RME firmware cleans the caches to the PoPA,
> making the data immediately visible to the hypervisor. Obviously, this
> isn't the case anymore, since the zeroing comes after that, and I
> don't see any CMO enforcing this.

The firmware should be ensuring that things are cleaned sufficiently
that the original data is inaccessible - that's required as part of the
wiping when converting from private. However the wipe doesn't have to be
writing zeros, indeed the RMM spec suggests that two "possible
implementations" are:

* The RMM (or other platform firmware) writing either random data or
  zeroes to the memory location
* The MEC of the memory location being changed

My assumption (I have to admit I haven't checked) is that the GIC code
is doing sufficient CMO to ensure that the zeros that are being written
after the conversion are visible to the hypervisor - but that's no
different to the non-CCA case.

> I'm concerned that this relies on undocumented behaviours that may
> hold today on some undisclosed combinations of HW and hypervisors, but
> that are not guaranteed at all. set_memory_decrypted() doesn't really
> say anything, and I have the feeling that we may want some hypervisor
> specific hook to perform the correct CMO magic. I don't think this is
> required right now, but I'm not excluding anything!

This is reducing how much Linux relies on undocumented behaviour - at
the moment Linux is relying on either the zeros it has written still
being visible or the firmware/hypervisor writing zeros after any
private->shared transition. This patch makes the guest do it rather than
relying on anything else.

You have a point that a spec clarification about CMOs might be worth
having - the RMM spec doesn't make clear what is required of the
firmware. Clearly for security it should be doing something to ensure
that the old data from the realm doesn't become visible.

>>
>> Mask out __GFP_ZERO from the allocation request, and do the zeroing as a
>> separate step after decryption.
>>
>> Fixes: b08e2f42e86b ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 6f5811aae59c..c954bbe9f4db 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -213,10 +213,12 @@ static gfp_t gfp_flags_quirk;
>>  static struct page *its_alloc_pages_node(int node, gfp_t gfp,
>>  					 unsigned int order)
>>  {
>> +	bool want_zero = gfp & __GFP_ZERO;
>>  	struct page *page;
>>  	int ret = 0;
>>  
>> -	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
>> +	page = alloc_pages_node(node, (gfp & ~__GFP_ZERO) | gfp_flags_quirk,
>> +				order);
>>  
>>  	if (!page)
>>  		return NULL;
>> @@ -231,6 +233,9 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
>>  	if (ret)
>>  		return NULL;
>>  
>> +	if (want_zero)
>> +		clear_pages(page_address(page), 1 << order);
>> +
> 
> nit: please use BIT(order), which matches the type required for
> clear_pages().

Sure, this was matching the use in set_memory_decrypted(), but I can
update that too.

> But I'd really like some discussion about the CMO side of things.

I'm not sure what more to say about CMO - if you want changes in the
commit message(s) then please suggest something. AFAICT this patch
doesn't change anything about cache maintenance. You're welcome to raise
spec clarifications if you want to.

Thanks,
Steve

PS. I'll take a look at the Sashiko comments - but they are both
pre-existing issues not issues with this series.

