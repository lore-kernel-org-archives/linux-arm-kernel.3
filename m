Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935DBD2F033
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xritG435HQ6RC2wWMwUy4qKHz1FW1so7WuycV++ue9U=; b=Cx3bTp/xijZnO2FulS6Zs0qvPh
	w3TbOuzYCytPVDFTqpbMzXMZq1OPkWxMbEJKswnjhUNoa2sHHUlamGBYpA2DVER4Mkf0Qa77x2HWD
	UgneeQO2yTARCOfiAk7bQ2scu8aQ1VcnLbKAl0VydkXLS2XI0IyOG9uyFtafMVE2pGsx+xhkIuHX/
	RIzALJd0gDqQYWc1SzE2BMGZHx+vrFlUCKdE2vB2O51/ZfFuSP4kR4p/j8+Gelcjxq4cCKlj7sz+L
	dDJelWiAlJgKYpQoOEQLCTstDpxKo3FcPsXEPqolnTJj2ji2nzTVNtEryB0yFQIH3w4VxWie6c/BD
	EaL3d+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjfc-0000000EMJY-0MJF;
	Tue, 27 Jan 2026 14:03:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjfZ-0000000EMJA-0fM0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:03:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5F3C1595;
	Tue, 27 Jan 2026 06:03:40 -0800 (PST)
Received: from [10.1.37.210] (XHFQ2J9959.cambridge.arm.com [10.1.37.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 738653F73F;
	Tue, 27 Jan 2026 06:03:45 -0800 (PST)
Message-ID: <8184baab-8774-4a73-8cee-d8d3e22553c0@arm.com>
Date: Tue, 27 Jan 2026 14:03:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] arm64: mm: Wrap flush_tlb_page() around
 ___flush_tlb_range()
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
 <20260119172202.1681510-13-ryan.roberts@arm.com>
 <20260127125933.00006101@huawei.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260127125933.00006101@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_060349_324066_17B90901 
X-CRM114-Status: GOOD (  27.98  )
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

On 27/01/2026 12:59, Jonathan Cameron wrote:
> On Mon, 19 Jan 2026 17:21:59 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> Flushing a page from the tlb is just a special case of flushing a range.
>> So let's rework flush_tlb_page() so that it simply wraps
>> ___flush_tlb_range(). While at it, let's also update the API to take the
>> same flags that we use when flushing a range. This allows us to delete
>> all the ugly "_nosync", "_local" and "_nonotify" variants.
>>
>> Thanks to constant folding, all of the complex looping and tlbi-by-range
>> options get eliminated so that the generated code for flush_tlb_page()
>> looks very similar to the previous version.
>>
>> Reviewed-by: Linu Cherian <linu.cherian@arm.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> So this does include the use of the
> 
> Case TLBF_NOBROADCAST from previous patch, but only whilst (I think)
> slightly changing behavior.
> 
> Gah.  I'm regretting looking at this series. The original code is really hard to
> read :)  Rather you than me to fix it!
> 
>>  static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>>  {
>>  	const unsigned long stride = PAGE_SIZE;
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index be9dab2c7d6a..f91aa686f142 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -239,7 +239,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
>>  	 * flush_tlb_fix_spurious_fault().
>>  	 */
>>  	if (dirty)
>> -		local_flush_tlb_page(vma, address);
>> +		__flush_tlb_page(vma, address, TLBF_NOBROADCAST);
> 
> Ultimately I think this previously did __tlbi(vale1) and now does __tlbi(vae1)
> Original call was to __local_flush_tlb_page_notify_nosync()

No not quite; the new code is still doing __tlbi(vale1).

The trick is that the __flush_tlb_page() wrapper unconditionally adds
TLBF_NOWALKCACHE to the flags. Since this API is operating on a *page* it is
implicit that we should only be evicting a leaf entry (as per the old
implementation).

You'll see I've also updated the documentation to make that clear in tlbflush.h.

Now that you have raised it, I can see how it might be confusing though, since
__flush_tlb_page() does not explicitly have TLBF_NOWALKCACHE. We could require
all __flush_tlb_page() callers to explicitly pass TLBF_NOWALKCACHE if you think
that helps? It would still be implicit for flush_tlb_page() (the generic kernel
API) though.

> 
> I'd like to see that sort of change called out and explained in the patch description.
> It's a broader scoped flush so not a bug, but still a functional change.

As I say, the emitted code is the same. It's my new API that's the problem here...

Thanks,
Ryan

> 
>>  	return 1;
>>  }
>>  
> 


