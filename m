Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CA4C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79HYUPxXmEiwQeTLRxHyWGIwdhNEzGLiGXQoDP2hR2k=; b=GSAmdLgRV8UvowYH1tyqU5jrss
	vJY7KXdkMfzIWShqe2dkf/fYhYXwJYx+gbgcrFdD25BCd+QwNcom2i+XJO1gKXW2Ls5rkDUg9eZ6R
	OQNfvTiDsVRR3D3sebPtz7lau8k6YyOGBfVkER539DqpJ+Zbex3QHP1OAkoCGlfohcaEhmmDxlYTB
	RiEfzuRxN/blHYC5StOk3Gfc4NS2Ntzra5PNW3ofZeX8BRUxlqVRi3KAce4ITp9teACkYkrCVdtkC
	/bBaZCIijHnQ5FdWyH4ziriuU8nLWfeT2IvcG4vS1g5SOlP40YtJZKe7TwUGVoSBblIIm9RAAqlHl
	ufJ+51gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oAL-0000000AJnJ-3pWe;
	Tue, 29 Apr 2025 16:50:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o5F-0000000AIPs-26qj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 16:45:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF9DF1515;
	Tue, 29 Apr 2025 09:45:12 -0700 (PDT)
Received: from [10.1.25.156] (XHFQ2J9959.cambridge.arm.com [10.1.25.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A832A3F66E;
	Tue, 29 Apr 2025 09:45:18 -0700 (PDT)
Message-ID: <b07c1320-3140-40d3-899b-7c2b6e0d3c18@arm.com>
Date: Tue, 29 Apr 2025 17:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/mm: Implement pte_po_index() for permission
 overlay index
Content-Language: en-GB
To: Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250415054442.2287891-1-anshuman.khandual@arm.com>
 <20250429151134.GB26272@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250429151134.GB26272@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_094525_588868_9B79F88F 
X-CRM114-Status: GOOD (  21.02  )
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

On 29/04/2025 16:11, Will Deacon wrote:
> On Tue, Apr 15, 2025 at 11:14:42AM +0530, Anshuman Khandual wrote:
>> From: Ryan Roberts <ryan.roberts@arm.com>
>>
>> Previously pte_access_permitted() used FIELD_GET() directly to retrieve
>> the permission overlay index from the pte. However, FIELD_GET() doesn't
>> work for 128 bit quanitites. Since we are about to add support for D128
>> pgtables, let's create a specific helper, pte_po_index() which can do
>> the required mask and shift regardless of the data type width.
> 
> You say:
> 
> "we are about to add support for D128 pgtables"

Providing some context: Anshuman has a private branch that adds D128 pgtable
support to the kernel (it does not yet do this for KVM). I originally created
this patch to fix a bug on that branch, so the "we are about to add ..." comment
really only makes sense in that context.

We are not yet ready to post D128 upstream - there are still a lot of questions
to answer - but Anshuman has been posting some of the reshuffling and cleanups
that prepare the way for D128 where (we think) it makes sense. The aim is to
reduce the diff as much as we can.

> 
> but all I've seen so far are piecemeal patches like this and it's hard
> to know what to do with them, to be honest. Somebody could reasonably
> turn up next week and clean this up to use FIELD_GET() again.
> 
> Grepping around, I also see that the KVM page-table code uses the FIELD_*
> macros on page-table entries, so perhaps we're better off adding support
> for 128-bit types to those instead of trying to avoid them?

I think FIELD_* are always implicitly 64 bit, right? I could be wrong...

But I agree with the overall sentiment; where stuff is clearly crossing over
into KVM, which hasn't been tackled yet, don't post until we have a good view on
what KVM needs.

Thanks,
Ryan

> 
> Will


