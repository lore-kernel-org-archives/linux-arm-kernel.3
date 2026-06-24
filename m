Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A746CCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKue2eDZGQbGOoIlsib3xrwOLrN59d+yjNHghXnQH/Y=; b=iyXzhkzyM5hdJtJnFZaMzb3MnE
	Mdw3676yiKpC0sFVkb/svYSts3ZB8mPXBZQgmWkzQzhqHP8VP9gVY+v4eYvxaaaOMRRAShi6sgp+p
	5wvZ95nfnTvgeF+ftxgQwtPWaKDZBdS+xY94eGo5DaCIgdQjEDptkGMoUOKwluNzbpniG4/hUSWre
	dqc/5UrmQSIar7OEiJpqlnT1NiIeSmhLT9LqbYmQAYCvVikGNzZmkmf7smLr3Kp0qMD7rbMeXZvF/
	PaHbOkDh/Mpze6oSHqPSowqQVvKPb8gkov1pfg05IUqSQeyvQH/ASat1mam0hZ78XnXHJqKF6iYoU
	Qq3SfTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPA6-00000007xr4-2qHd;
	Wed, 24 Jun 2026 15:05:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPA4-00000007xqf-0FJa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 15:05:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 392592308;
	Wed, 24 Jun 2026 08:05:00 -0700 (PDT)
Received: from [10.1.25.171] (XHFQ2J9959-4.cambridge.arm.com [10.1.25.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 228DF3F905;
	Wed, 24 Jun 2026 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782313504; bh=t/6bTMiWUaEV1IYOjK8N+ioKve+8nIP8GwG/6p2eaTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q35MDHB4NR7gxpgq4eAorP8mtkFCyLvLaC/Od24ga5UC549ID02pnOqRcnH6WRw4y
	 VnXBa8D8vtzVB1X31ZHO7sAz9n5a5CeMqqgaSGy+h846vop4qVp5pdAvA41zoByrv1
	 2c2Jsp9lHo0JDLD48N/06IdttEj2eHmNG5YdxR8c=
Message-ID: <d2a633c8-496e-48e1-bfa0-a0fc75bd0a08@arm.com>
Date: Wed, 24 Jun 2026 16:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 337/522] arm64/mm: Enable batched TLB flush in
 unmap_hotplug_range()
To: Will Deacon <will@kernel.org>, Ben Hutchings <ben@decadent.org.uk>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, patches@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 stable <stable@vger.kernel.org>, mark.rutland@arm.com
References: <20260616145125.307082728@linuxfoundation.org>
 <20260616145141.584613180@linuxfoundation.org>
 <b0d5836032ce3135bfc473f6bff791306d086925.camel@decadent.org.uk>
 <ajqXWqiAol6Shdd6@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <ajqXWqiAol6Shdd6@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_080508_186478_93369F95 
X-CRM114-Status: GOOD (  20.71  )
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

On 23/06/2026 15:25, Will Deacon wrote:
> On Sun, Jun 21, 2026 at 05:02:27PM +0200, Ben Hutchings wrote:
>> On Tue, 2026-06-16 at 20:28 +0530, Greg Kroah-Hartman wrote:
>>> 6.1-stable review patch.  If anyone has any objections, please let me know.
>>>
>>> ------------------
>>>
>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>
>>> [ Upstream commit 48478b9f791376b4b89018d7afdfd06865498f65 ]
>> [...]
>>> @@ -949,15 +953,14 @@ static void unmap_hotplug_pmd_range(pud_
>>>  		WARN_ON(!pmd_present(pmd));
>>>  		if (pmd_sect(pmd)) {
>>>  			pmd_clear(pmdp);
>>> -
>>> -			/*
>>> -			 * One TLBI should be sufficient here as the PMD_SIZE
>>> -			 * range is mapped with a single block entry.
>>> -			 */
>>> -			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>> -			if (free_mapped)
>>> +			if (free_mapped) {
>>> +				/* CONT blocks are not supported in the vmemmap */
>>> +				WARN_ON(pmd_cont(pmd));
>>> +				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
>>
>> It wasn't clear to me from the commit message why this now adds PMD_SIZE
>> rather than PAGE_SIZE.  It seems like this change is fine for Linux
>> 6.13+ with a CPU that supports TLB range flushing, but otherwise results
>> in unnecessarily executing multiple TLB invalidations at intervals of
>> the base page size.
> 
> Hmm, the commit message also makes very little sense to me and so I don't
> understand why this patch has us doing multiple TLB invalidations when
> we run into a !cont, block mapping at the PMD level. The old comment
> (which this patch removes) should still apply afaict.
> 
> Anshuman, Ryan, any ideas what's going on here?

I think this change was probably my fault; Given the API is called
flush_tlb_kernel_range() it seemed like an abuse/hack to pretend we are only
flushing the first PAGE_SIZE of the range. But as I understand it, even if the
HW shatters a block mapping into multiple TLB entries, all of the entries
relating to the block mapping will be invalidated if just one of them intersects
the TLBI range/address. So it should be safe to reapply this hack.

Although ideally I think it would be better if this API took a stride argument;
then intent is clear.

What's the best way to handle this? Submit a patch for mainline that reverts
this part, then get it backported to stable (implying this current patch will
have been applied to stable)?

Thanks,
Ryan


> 
> Will


