Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D7310F284F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=859ciwTLws9gTLdPiMbsS4SJ1GOzZrhoCCXtFwVU8lM=; b=3ed41XdAecnDYxMYKgToC3YlIg
	Q2L5fRSvCuoZM7kkPKeCgG/CZFZT/vbg4UJZmzWCUBqQpvavqZUE4sfFN6uG8jlI4IQvJKKRKB65m
	K2arSqJyK98vn1xOTP6+p3oFe8BSbczrxBM9HVaT1Q9pDdN6AcTPWLZpggeUQq9Va6KEJSiBqK9kl
	bOkHNoKvRS6cGlkC37RKtQEchVTfYH0x0LaCsDUmKqzIZdRUOwhj/AdY3XDFmV5BCjAZ3pr7N/JyI
	axUo9y2bwVsDg28UoYp1ogPs3tP8yTJ4qoB0KTmKPhHEEtrqUUE9i7jzjA4mqo6D65PuDMFigEfOL
	TuidYS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6APu-00000007oKv-0XfV;
	Fri, 27 Mar 2026 16:52:14 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6APr-00000007oJ0-1SVg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:52:13 +0000
Message-ID: <09f1f982-4143-4c57-9bf6-fee546b2606b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774630314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=859ciwTLws9gTLdPiMbsS4SJ1GOzZrhoCCXtFwVU8lM=;
	b=eQdxda0VXEY8Bm/gK5z/H6o1WBS+xzZU7GDDlPJSxH272S+kvcs994vq5gP6ylP0fK8WMr
	wZ1KR8sjIN6G+BRLqc71go1CgG/LVZHt2CFRm94mVG4EXUF0oS5jnoZ0DXugjTmf62p1Ib
	6N/JEBZtBILoFe3eY8E3oEAIcUuUG20=
Date: Fri, 27 Mar 2026 12:51:47 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] elf: align ET_DYN base to max folio size for PTE
 coalescing
Content-Language: en-GB
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc, jack@suse.cz,
 ajd@linux.ibm.com, apopple@nvidia.com, baohua@kernel.org,
 baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com,
 dev.jain@arm.com, kees@kernel.org, kevin.brodsky@arm.com,
 lance.yang@linux.dev, Liam.Howlett@oracle.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
 npache@redhat.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 rppt@kernel.org, surenb@google.com, vbabka@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, wilts.infradead.org@kvack.org,
 ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 kernel-team@meta.com
References: <20260320140315.979307-1-usama.arif@linux.dev>
 <20260320140315.979307-4-usama.arif@linux.dev>
 <ab1uqdcMBP1cBr7Q@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <ab1uqdcMBP1cBr7Q@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_095211_614982_CD575D8D 
X-CRM114-Status: GOOD (  21.01  )
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



On 20/03/2026 18:58, Matthew Wilcox wrote:
> On Fri, Mar 20, 2026 at 06:58:53AM -0700, Usama Arif wrote:
>> -static unsigned long maximum_alignment(struct elf_phdr *cmds, int nr)
>> +static unsigned long maximum_alignment(struct elf_phdr *cmds, int nr,
>> +				       struct file *filp)
>>  {
>>  	unsigned long alignment = 0;
>> +	unsigned long max_folio_size = PAGE_SIZE;
>>  	int i;
>>  
>> +	if (filp && filp->f_mapping)
>> +		max_folio_size = mapping_max_folio_size(filp->f_mapping);
> 
> Under what circumstances can bprm->file be NULL?

Yeah its unnecessary here. Its used in other places and this is never
checked, so we can remove it.

> 
> Also we tend to prefer the name "file" rather than "filp" for new code
> (yes, there's a lot of old code out there).
> 

ack. will change in next revision.

>> +
>> +			/*
>> +			 * Try to align the binary to the largest folio
>> +			 * size that the page cache supports, so the
>> +			 * hardware can coalesce PTEs (e.g. arm64
>> +			 * contpte) or use PMD mappings for large folios.
>> +			 *
>> +			 * Use the largest power-of-2 that fits within
>> +			 * the segment size, capped by what the page
>> +			 * cache will allocate. Only align when the
>> +			 * segment's virtual address and file offset are
>> +			 * already aligned to the folio size, as
>> +			 * misalignment would prevent coalescing anyway.
>> +			 *
>> +			 * The segment size check avoids reducing ASLR
>> +			 * entropy for small binaries that cannot
>> +			 * benefit.
>> +			 */
>> +			if (!cmds[i].p_filesz)
>> +				continue;
>> +			size = rounddown_pow_of_two(cmds[i].p_filesz);
>> +			size = min(size, max_folio_size);
>> +			if (size > PAGE_SIZE &&
>> +			    IS_ALIGNED(cmds[i].p_vaddr, size) &&
>> +			    IS_ALIGNED(cmds[i].p_offset, size))
>> +				alignment = max(alignment, size);
> 
> Can this not all be factored out into a different function?  Also, I
> think it was done a bit better here:
> https://lore.kernel.org/linux-fsdevel/20260313005211.882831-1-r@hev.cc/
> 
> +	if (!IS_ALIGNED(cmd->p_vaddr | cmd->p_offset, PMD_SIZE))
> +		return false;
> 


ack, will try and address this accordingly.


Thanks for the reviews!!

