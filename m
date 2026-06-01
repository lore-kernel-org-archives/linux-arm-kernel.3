Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC65BCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZFkDlb0M/DK/+4npGDmhkRBwuIrbB14olid11Coyvg=; b=CeaQ2X7+CBWeHHaU0zsG82iOjs
	EIoWz2Q6PDoIsA4jRc3Sc5cIaE3vU18RhAEB6PRA4b9wbVMrxHy2KZbBjQGOoe5I4+nGaU2aqQFzO
	y5KW/ti1TPepvJ6l+EppgolEAW5mg0hs36HBCdnX9gKTLXRZiJiq/kkSYjgpum+Lax0XH6beStHGi
	VvS0T4PXDxYcQ8kAA13QKZWrqwIgBlPr2qhkz3zA6u31d2/UMco4DQqFg36BRTYjOXXq1kHbgQjn0
	TdU9YchEoHAF047lq0XFz5sVSv6zTdlQOYETdXBOmslQYHi+eKgHAAPEDlKJvXxB2ZbDFiEUDN8I3
	BGT2MhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzAz-0000000AVnB-353G;
	Mon, 01 Jun 2026 09:43:17 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzAx-0000000AVm9-0rT3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:43:16 +0000
Message-ID: <d144b0a1-acd5-4d08-aab0-5b2dc8219219@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780306989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZFkDlb0M/DK/+4npGDmhkRBwuIrbB14olid11Coyvg=;
	b=p86NKhR5i/z2Uh1CGWtYdPqyJsB+l0ogupMPW57FzLrGY97HrT45jbXoDRvfhPQV6Ko/kB
	2hro5IL7lC1A5P78SDTfsqD7kOeIkD0+PPOkCGMw6SlHX/T7JIK1pyusIGtQ8D3kehnye3
	M7VgyTjtAKFZd3DPmFiYvQRNTNJOE8E=
Date: Mon, 1 Jun 2026 10:43:03 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v6 2/2] mm: use mapping_max_folio_order() for
 force_thp_readahead order
To: Jan Kara <jack@suse.cz>
Cc: Pedro Falcato <pfalcato@suse.de>, willy@infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc,
 Andrew Donnellan <andrew+kernel@donnellan.id.au>, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, brauner@kernel.org,
 catalin.marinas@arm.com, dev.jain@arm.com, kees@kernel.org,
 kevin.brodsky@arm.com, lance.yang@linux.dev,
 "Liam R. Howlett" <liam@infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, ljs@kernel.org, mhocko@suse.com,
 npache@redhat.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 rppt@kernel.org, surenb@google.com, vbabka@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, wilts.infradead.org@pedro-suse.lan,
 ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 kernel-team@meta.com
References: <20260528165635.2068012-1-usama.arif@linux.dev>
 <20260528165635.2068012-3-usama.arif@linux.dev>
 <ahlh2vdHEGo6ZSot@pedro-suse.lan>
 <cc9a1cf7-7b96-439a-b0be-ecdcf27b5da5@linux.dev>
 <ahmSolHvUChl-3vM@pedro-suse.lan>
 <185f1caf-b33d-4467-beb5-51bd8520ac78@linux.dev>
 <u52xvwk2fjjk2izdb4wvuqq2zhc5neb4q6usimcxejluuyngxw@d64sc6rvojyp>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <u52xvwk2fjjk2izdb4wvuqq2zhc5neb4q6usimcxejluuyngxw@d64sc6rvojyp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_024315_465317_D7BDE56D 
X-CRM114-Status: GOOD (  26.22  )
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



On 30/05/2026 16:16, Jan Kara wrote:
> On Fri 29-05-26 15:11:54, Usama Arif wrote:
>> On 29/05/2026 14:40, Pedro Falcato wrote:
>>> On Fri, May 29, 2026 at 01:19:03PM +0100, Usama Arif wrote:
>>>>
>>>> which means mapping_max_folio_order(mapping) <= MAX_PAGECACHE_ORDER <= HPAGE_PMD_ORDER is always
>>>> true, and you dont need the min3(..) in your diff.
>>>>
>>>> Now the question is if then why not just do:
>>>>
>>>> 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && (vm_flags & VM_HUGEPAGE)) {
>>>> 		if (mapping_large_folio_support(mapping)) {
>>>> 			force_thp_readahead = true;
>>>> 			thp_order = min_t(unsigned int,
>>>> 					  mapping_max_folio_order(mapping),
>>>> 					  get_order(SZ_2M));
>>>> 		}
>>>> 	}
>>>>
>>>>
>>>> This is because this will regress the 16K ARM case where we already got 32M
>>>> folios. Someone might upgrade the kernel and start getting 2M folios now.
>>>
>>> So maybe limit to 32MB? It's still arbitrary but at least you get simpler
>>> logic. If the architecture does not support 32MiB folios, it will clamp
>>> the maximum folio order to HPAGE_PMD_ORDER, and you get the same result.
>>>
>>> Does this sound correct?
>>>
>>
>> Yes, so if we replace it with SZ_32M, it sounds correct. I just think
>> the 32M size is too large. But as you pointed out, even 2M can be too large...
> 
> So AFAIU the practical discussion is about two options:
> 
> 1) limiting at 2MB with a slighly more complicated logic to keep mapping at
> PMD order for 16k pagesize on ARM but use 2MB pages for 64k pagesize on ARM
> 
> or
> 
> 2) limit at 32MB with simple logic which results in larger (32MB) folios
> with 16k and 64k pagesize on ARM and thus larger memory overhead.
> 
> I'd like to maybe offer option 3): limit at 2MB with simple logic. This
> will reduce folio size on 16k pagesize ARM compared to 1) but do we really
> care? I.e., is there big enough practical performance impact with conpte
> and other tricks ARM is playing?
> 

I think the logic isn't that complicated for 1, but I am happy with option 3.

>>> Bottom line is that changing things will always affect someone :) Particularly
>>> since the logic we have is not too careful at deciding what should or should
>>> not be a THP (both in anon and file cases). And if (once?) we make it smarter,
>>> it will surely also regress someone!
>>
>> Yes completely agree on this as well.
>>
>> So personally I do have a preference of keeping the cap at 2M atleast initially
>> while we currently try and solve the issues we see with 2M alone. As we are already
>> seeing reports of thrashing and compaction with just 2M, I dont think the logic
>> in this patch with just an if else is that complicated.
>>
>> Matthew, Jan, do you have any thoughts or strong preferences on cap size?
> 
> Frankly, no strong opinion. I'd think 3) is worth trying for its simplicity
> and seeing whether somebody complains, otherwise I can live with both 1)
> and 2).


Thanks! Yes, let me send this. 

Andrew I will send this as a new and hopefully last revision as I am not sure
if you would like another fixup on top of this series! Thanks!


> 
> 								Honza


