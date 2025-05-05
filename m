Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4BCC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZj3TMI5ZHzLqZ/IZuXafTVZNj9+1p3yfcVmzlPtx5M=; b=fS/KrMnA5F0YEA/m/XoFKLpD6Z
	eIypwpcqdFW1SGvFnZ+uBV5/NXQ6guKgGVcnrn7gs6+bX95XKYrRh+vy8RBb2bl9DZb4v05DI3uBu
	zjxskNzEQbaxfuRma1WUenWbuqRhLebAzoxGxWnob8/62ViuuD1TbtflmMA2ZG5e2rIdBNbNSrMhx
	ji06V8EvHL/FEw5C1nKazwrdfIoUU8xJlxqSolQR3MzNGRh2tl0QpQ96FGWwvXmYQT0KHO/zUEgKR
	l7Fz5VeV6+hekoINeml6MIcQHNGcLrZM730xkYt4f5kHZ8/vpkCqmOHaP1+pw8gXUcbrDWFH1/CVd
	wAdcV/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrZp-00000006pxK-480K;
	Mon, 05 May 2025 08:53:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrXJ-00000006pcI-3HVb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 08:50:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD2BD1007;
	Mon,  5 May 2025 01:50:43 -0700 (PDT)
Received: from [10.163.53.144] (unknown [10.163.53.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 257CA3F5A1;
	Mon,  5 May 2025 01:50:49 -0700 (PDT)
Message-ID: <16ffa9f2-5ebb-4839-ab87-3c193ab9683a@arm.com>
Date: Mon, 5 May 2025 14:20:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/mm: Implement pte_po_index() for permission
 overlay index
To: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250415054442.2287891-1-anshuman.khandual@arm.com>
 <20250429151134.GB26272@willie-the-truck>
 <b07c1320-3140-40d3-899b-7c2b6e0d3c18@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <b07c1320-3140-40d3-899b-7c2b6e0d3c18@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_015053_869208_E437AAEF 
X-CRM114-Status: GOOD (  23.72  )
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



On 4/29/25 22:15, Ryan Roberts wrote:
> On 29/04/2025 16:11, Will Deacon wrote:
>> On Tue, Apr 15, 2025 at 11:14:42AM +0530, Anshuman Khandual wrote:
>>> From: Ryan Roberts <ryan.roberts@arm.com>
>>>
>>> Previously pte_access_permitted() used FIELD_GET() directly to retrieve
>>> the permission overlay index from the pte. However, FIELD_GET() doesn't
>>> work for 128 bit quanitites. Since we are about to add support for D128
>>> pgtables, let's create a specific helper, pte_po_index() which can do
>>> the required mask and shift regardless of the data type width.
>>
>> You say:
>>
>> "we are about to add support for D128 pgtables"
> 
> Providing some context: Anshuman has a private branch that adds D128 pgtable
> support to the kernel (it does not yet do this for KVM). I originally created
> this patch to fix a bug on that branch, so the "we are about to add ..." comment
> really only makes sense in that context.
> 
> We are not yet ready to post D128 upstream - there are still a lot of questions
> to answer - but Anshuman has been posting some of the reshuffling and cleanups
> that prepare the way for D128 where (we think) it makes sense. The aim is to
> reduce the diff as much as we can.

Agreed. All these patches have been really harmless clean ups and re-orgs etc,
that do not affect existing 64 bit page table management or its functioning in
any manner. OTOH these changes help the kernel prepare for D128 enablement.

> 
>>
>> but all I've seen so far are piecemeal patches like this and it's hard
>> to know what to do with them, to be honest. Somebody could reasonably
>> turn up next week and clean this up to use FIELD_GET() again.
>>
>> Grepping around, I also see that the KVM page-table code uses the FIELD_*
>> macros on page-table entries, so perhaps we're better off adding support
>> for 128-bit types to those instead of trying to avoid them?
> 
> I think FIELD_* are always implicitly 64 bit, right? I could be wrong...
> 
> But I agree with the overall sentiment; where stuff is clearly crossing over
> into KVM, which hasn't been tackled yet, don't post until we have a good view on
> what KVM needs.
Keeping KVM changes separate was the motivation in V1 of this patch for similar
reasons. KVM uses FIELD_GET() for all the page table management purposes, hence
wanted to keep these S1 changes separate.

