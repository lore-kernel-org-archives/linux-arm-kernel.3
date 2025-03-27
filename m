Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEB4C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhHAe+JTvzR7RyuUU9MBGaQgXXLZr3phu+/ywf4rw9U=; b=kf7RXQyKvom4xesifIHQWj/ljK
	3P31kPveCASNbGBVGrGRTxMIu0p1yL+F4TNQaspfICBHfBy9ZFhbCV4EQ4gOc5enArMRhukHP2DhT
	Pp0qxWwMFgfqoesxmdOvchKJO9CK9RX+VsKkZdhuXDHSP49q5M9AZ75qV6FXziJmnS+zKzvaclnqr
	U552P7orsg0cz4R1T8bB1rANRMdxdRM9nusqTOTExhVxjXOgU2eX8ZIsKd0VdbkkStw7lhTFBEIlY
	qbHHgaTUanev+ZusMTfkWvpQ4uipOvMpGjpEOmnmZiGLPHMvOpzojxLvQc4f3uXMg4wdUycECEMbJ
	AhP4OFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtuf-0000000ByNK-07Vd;
	Thu, 27 Mar 2025 20:33:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtl3-0000000BxOE-43X8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 20:23:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C4271762;
	Thu, 27 Mar 2025 13:23:25 -0700 (PDT)
Received: from [10.57.86.101] (unknown [10.57.86.101])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0CEA3F694;
	Thu, 27 Mar 2025 13:23:17 -0700 (PDT)
Message-ID: <5131c7ad-cc37-44fc-8672-5866ecbef65b@arm.com>
Date: Thu, 27 Mar 2025 16:23:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/filemap: Allow arch to request folio size for exec
 memory
Content-Language: en-GB
To: Matthew Wilcox <willy@infradead.org>,
 Kalesh Singh <kaleshsingh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20250327160700.1147155-1-ryan.roberts@arm.com>
 <Z-WAbWfZzG1GA-4n@casper.infradead.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z-WAbWfZzG1GA-4n@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_132322_100954_9007D1E6 
X-CRM114-Status: GOOD (  24.28  )
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

+ Kalesh

On 27/03/2025 12:44, Matthew Wilcox wrote:
> On Thu, Mar 27, 2025 at 04:06:58PM +0000, Ryan Roberts wrote:
>> So let's special-case the read(ahead) logic for executable mappings. The
>> trade-off is performance improvement (due to more efficient storage of
>> the translations in iTLB) vs potential read amplification (due to
>> reading too much data around the fault which won't be used), and the
>> latter is independent of base page size. I've chosen 64K folio size for
>> arm64 which benefits both the 4K and 16K base page size configs and
>> shouldn't lead to any read amplification in practice since the old
>> read-around path was (usually) reading blocks of 128K. I don't
>> anticipate any write amplification because text is always RO.
> 
> Is there not also the potential for wasted memory due to ELF alignment?

I think this is an orthogonal issue? My change isn't making that any worse.

> Kalesh talked about it in the MM BOF at the same time that Ted and I
> were discussing it in the FS BOF.  Some coordination required (like
> maybe Kalesh could have mentioned it to me rathere than assuming I'd be
> there?)

I was at Kalesh's talk. David H suggested that a potential solution might be for
readahead to ask the fs where the next hole is and then truncate readahead to
avoid reading the hole. Given it's padding, nothing should directly fault it in
so it never ends up in the page cache. Not sure if you discussed anything like
that if you were talking in parallel?

Anyway, I'm not sure if you're suggesting these changes need to be considered as
one somehow or if you're just mentioning it given it is loosely related? My view
is that this change is an improvement indepently and could go in much sooner.

> 
>> +#define arch_exec_folio_order() ilog2(SZ_64K >> PAGE_SHIFT)
> 
> I don't think the "arch" really adds much value here.

I was following the pattern used by arch_wants_old_prefaulted_pte(),
arch_has_hw_pte_young(), etc. But I think you're right. I'll change as you suggest.

> 
> #define exec_folio_order()	get_order(SZ_64K)

ooh... get_order()... nice.

> 
>> +#ifndef arch_exec_folio_order
>> +/*
>> + * Returns preferred minimum folio order for executable file-backed memory. Must
>> + * be in range [0, PMD_ORDER]. Negative value implies that the HW has no
>> + * preference and mm will not special-case executable memory in the pagecache.
>> + */
>> +static inline int arch_exec_folio_order(void)
>> +{
>> +	return -1;
>> +}
> 
> This feels a bit fragile.  I often expect to be able to store an order
> in an unsigned int.  Why not return 0 instead?

Well 0 is a valid order, no? I think we have had the "is order signed or
unsigned" argument before. get_order() returns a signed int :)

Personally I'd prefer to keep it signed and use a negative value as the
sentinel. I don't think 0 is the right choice because it's a valid order. How
about returning unsigned int and use UINT_MAX as the sentinel?

#define EXEC_FOLIO_ORDER_NONE	UINT_MAX

static inline unsigned int arch_exec_folio_order(void)
{
	return EXEC_FOLIO_ORDER_NONE;
}

Thanks,
Ryan


