Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A970FF495E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaGpJgvU7fzaZHNV9egMJ09PF1OrT8PBmReLhVLOy8s=; b=zFVDRbQIXSloZldbpJNHEHnmHa
	foQHaaCx0KvFgXHf/UpOMG9K9TwKxn0IVOv5G+PkTKcUr+jZW6ieiKdAFTgvHcHRhYSB0cw6GE/2i
	DFkVMc93JeOvRSlcC6JJdrZ8A+b4ZkXjGUZUqNaKxm7Hs/+zqdoa26+oTIupxRuS7rYCCfMig7TaJ
	9VoobGYoGfv1oPj05ciY0ddnFdfcScFNN5VtINjX710bTl8SCp5u84yXbfjZiX9IkE7788TCXOWOP
	dyt/MYujzbC5NzbLK5W4qg8rPXAp9OBO43NF4J+8YpTQogPMjZCVAGhTmB3elsbiJQbHOqfYARXGM
	wDmwRPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DAv-0000000BNvF-1OiF;
	Mon, 30 Mar 2026 14:01:05 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DAs-0000000BNtm-2SeX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:01:04 +0000
Message-ID: <e3876d3f-0e86-4542-861d-2de3d0cbf66e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774879244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CaGpJgvU7fzaZHNV9egMJ09PF1OrT8PBmReLhVLOy8s=;
	b=lS9w9BPlpn3w7Y6et2LBOIXHgvvaMn9p28qX39J+x4F8xAvdXoNIWXQtnIFst7cGSn4B8i
	lEUcuiFbizFcrIFZoDdU/tj2oIyK1tlAj28oBGq0wenPC6w5RPlSLYdxJN2bXYd0fqqi/3
	hAOTBN1N5ysSW5IbJMAZcoTn0ZQ4JsI=
Date: Mon, 30 Mar 2026 15:00:40 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] elf: align ET_DYN base to max folio size for PTE
 coalescing
Content-Language: en-GB
To: Matthew Wilcox <willy@infradead.org>, WANG Rui <r@hev.cc>
Cc: Liam.Howlett@oracle.com, ajd@linux.ibm.com, akpm@linux-foundation.org,
 apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com,
 brauner@kernel.org, catalin.marinas@arm.com, david@kernel.org,
 dev.jain@arm.com, jack@suse.cz, kees@kernel.org, kevin.brodsky@arm.com,
 lance.yang@linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
 npache@redhat.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 rppt@kernel.org, ryan.roberts@arm.com, surenb@google.com, vbabka@kernel.org,
 viro@zeniv.linux.org.uk
References: <0725ce97-b8a3-47c9-952f-7b512873cc35@linux.dev>
 <20260329043700.19355-1-r@hev.cc> <acpy6DLjPVXXzwJX@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <acpy6DLjPVXXzwJX@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_070102_802962_A1E7F508 
X-CRM114-Status: GOOD (  15.86  )
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



On 30/03/2026 15:56, Matthew Wilcox wrote:
> On Sun, Mar 29, 2026 at 12:37:00PM +0800, WANG Rui wrote:
>>> mapping_max_folio_size() reflects what the page cache will actually
>>> allocate for a given filesystem, since readahead caps folio allocation
>>> at mapping_max_folio_order() (in page_cache_ra_order()). If btrfs
>>> reports PAGE_SIZE, readahead won't allocate large folios for it, so
>>> there are no large folios to coalesce PTEs for, aligning the binary
>>> beyond that would only reduce ASLR entropy for no benefit.
>>>
>>> I don't think we should over-align binaries on filesystems that can't
>>> take advantage of it.
>>
>> Ah, it looks like this might be overlooking another path that can create
>> huge page mappings for read-only code segments: even when the filesystem
>> (e.g. btrfs without experimental) didn't support large folios,
>> READ_ONLY_THP_FOR_FS still allowed read-only file-backed code segments
>> to be collapsed into huge page mappings via khugepaged.

ah yes, Thank you for pointing this out!

Maybe we should rename mapping_max_folio_size() to mapping_fault_max_folio_size().

>>
>> As Wilcox pointed out, it may take quite some time for many filesystems
>> to gain full large folio support? So what I'm trying to clarify is that
>> using mapping_max_folio_size() on this path is not favorable for
>> khugepaged-based optimizations.

ack

I am worried that 32M is too large and we lose out on a lot of ASLR bits.
Instead of PMD_ORDER, should we do max(SZ_2M, PMD_ORDER)?

> Nono, that's not what I'm pointing out!  btrfs is simply not putting
> in the effort to support large folios, and that needs to change.
> READ_ONLY_THP_FOR_FS unnecessaily burdens the rest of the kernel.
> It was a great hack for its time and paved the path for a lot of what
> we have today, but it's time to remove it.


