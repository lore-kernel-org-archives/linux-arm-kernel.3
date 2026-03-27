Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5551E10F284F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9csAY2Lvawgp7Rsam87YjKnm7rldK4hTm6EIfaKTPo=; b=Jm9sY+mBhLC7wIgsezIoe8A+Dm
	KPnBLC7KPdlR9GJYv11lltq2h+4pPZyHVLDC9EceBNYStQ5LgnP9DUHvDKHkCeDfDzK299pzLDrt0
	xqis1U33LgMF0CJ3m1qxlPzHHeJWcyi0Yys24ciJKmhzX+vRAp0Z/BdO88yj83mTHxo2LAPyN1HW6
	+5fS/HvUZ3qY+u+yxSuuUtNpbojEXb17IPix6Y+xO8/MAoIkR2sxl+LtImV+0b4H6KIbW4ODSuweZ
	rCrRJmP0PqNw6Kljkvl627f0sYn2H2E4IgqHTtjJ8b3vN5L5cgRZ+6TEGEGSj0kqY2V/aO/GzU97Z
	293OAiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ARS-00000007oXi-0ZWQ;
	Fri, 27 Mar 2026 16:53:50 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ARP-00000007oWX-0p1s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:53:48 +0000
Message-ID: <0725ce97-b8a3-47c9-952f-7b512873cc35@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774630424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9csAY2Lvawgp7Rsam87YjKnm7rldK4hTm6EIfaKTPo=;
	b=f75mPENZ/0pogd7iZftgXzxU1U3uP/uDnUH51xNQ/Zl5ECBs158ZiTywN4eeQRE3ZbgIbD
	SOe/t2tapJrZ/LL8Ctf7vJeDgJkGGx5TgRBO6QFlILAZ2e8der8tSRw0PhdSMLZ2+GanQJ
	v6cbU9Vsavrir2wRkkI4EJWCx3V2d4c=
Date: Fri, 27 Mar 2026 12:53:34 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] elf: align ET_DYN base to max folio size for PTE
 coalescing
Content-Language: en-GB
To: WANG Rui <r@hev.cc>
Cc: Liam.Howlett@oracle.com, ajd@linux.ibm.com, akpm@linux-foundation.org,
 apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com,
 brauner@kernel.org, catalin.marinas@arm.com, david@kernel.org,
 dev.jain@arm.com, jack@suse.cz, kees@kernel.org, kevin.brodsky@arm.com,
 lance.yang@linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.l, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, npache@redhat.com,
 pasha.tatashin@soleen.com, rmclure@linux.ibm.com, rppt@kernel.org,
 ryan.roberts@arm.com, surenb@google.com, vbabka@kernel.org,
 viro@zeniv.linux.org.uk, willy@infradead.org
References: <20260320140315.979307-4-usama.arif@linux.dev>
 <20260320160519.80962-1-r@hev.cc>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260320160519.80962-1-r@hev.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_095347_541585_179DA8FC 
X-CRM114-Status: GOOD (  23.70  )
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



On 20/03/2026 19:05, WANG Rui wrote:
> Hi Usama,
> 
> On Fri, Mar 20, 2026 at 10:04 PM Usama Arif <usama.arif@linux.dev> wrote:
>> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
>> index 8e89cc5b28200..042af81766fcd 100644
>> --- a/fs/binfmt_elf.c
>> +++ b/fs/binfmt_elf.c
>> @@ -49,6 +49,7 @@
>>  #include <uapi/linux/rseq.h>
>>  #include <asm/param.h>
>>  #include <asm/page.h>
>> +#include <linux/pagemap.h>
>>
>>  #ifndef ELF_COMPAT
>>  #define ELF_COMPAT 0
>> @@ -488,19 +489,51 @@ static int elf_read(struct file *file, void *buf, size_t len, loff_t pos)
>>         return 0;
>>  }
>>
>> -static unsigned long maximum_alignment(struct elf_phdr *cmds, int nr)
>> +static unsigned long maximum_alignment(struct elf_phdr *cmds, int nr,
>> +                                      struct file *filp)
>>  {
>>         unsigned long alignment = 0;
>> +       unsigned long max_folio_size = PAGE_SIZE;
>>         int i;
>>
>> +       if (filp && filp->f_mapping)
>> +               max_folio_size = mapping_max_folio_size(filp->f_mapping);
> 
> From experiments (with 16K base pages), mapping_max_folio_size() appears to
> depend on the filesystem. It returns 8M on ext4, while on btrfs it always
> falls back to PAGE_SIZE (it seems CONFIG_BTRFS_EXPERIMENTAL=y may change this).
> This looks overly conservative and ends up missing practical optimization
> opportunities.

mapping_max_folio_size() reflects what the page cache will actually
allocate for a given filesystem, since readahead caps folio allocation
at mapping_max_folio_order() (in page_cache_ra_order()). If btrfs
reports PAGE_SIZE, readahead won't allocate large folios for it, so
there are no large folios to coalesce PTEs for, aligning the binary
beyond that would only reduce ASLR entropy for no benefit.

I don't think we should over-align binaries on filesystems that can't
take advantage of it.

> 
>> +
>>         for (i = 0; i < nr; i++) {
>>                 if (cmds[i].p_type == PT_LOAD) {
>>                         unsigned long p_align = cmds[i].p_align;
>> +                       unsigned long size;
>>
>>                         /* skip non-power of two alignments as invalid */
>>                         if (!is_power_of_2(p_align))
>>                                 continue;
>>                         alignment = max(alignment, p_align);
>> +
>> +                       /*
>> +                        * Try to align the binary to the largest folio
>> +                        * size that the page cache supports, so the
>> +                        * hardware can coalesce PTEs (e.g. arm64
>> +                        * contpte) or use PMD mappings for large folios.
>> +                        *
>> +                        * Use the largest power-of-2 that fits within
>> +                        * the segment size, capped by what the page
>> +                        * cache will allocate. Only align when the
>> +                        * segment's virtual address and file offset are
>> +                        * already aligned to the folio size, as
>> +                        * misalignment would prevent coalescing anyway.
>> +                        *
>> +                        * The segment size check avoids reducing ASLR
>> +                        * entropy for small binaries that cannot
>> +                        * benefit.
>> +                        */
>> +                       if (!cmds[i].p_filesz)
>> +                               continue;
>> +                       size = rounddown_pow_of_two(cmds[i].p_filesz);
>> +                       size = min(size, max_folio_size);
>> +                       if (size > PAGE_SIZE &&
>> +                           IS_ALIGNED(cmds[i].p_vaddr, size) &&
>> +                           IS_ALIGNED(cmds[i].p_offset, size))
>> +                               alignment = max(alignment, size);
> 
> In my patch [1], by aligning eligible segments to PMD_SIZE, THP can quickly
> collapse them into large mappings with minimal warmup. That doesn’t happen
> with the current behavior. I think allowing a reasonably sized PMD (say <= 32M)
> is worth considering. All we really need here is to ensure virtual address
> alignment. The rest can be left to THP under always, which can decide whether
> to collapse or not based on memory pressure and other factors.
> 
> [1] https://lore.kernel.org/linux-fsdevel/20260313005211.882831-1-r@hev.cc
> 
>>                 }
>>         }
>>
>> @@ -1104,7 +1137,8 @@ static int load_elf_binary(struct linux_binprm *bprm)
>>                         }
>>
>>                         /* Calculate any requested alignment. */
>> -                       alignment = maximum_alignment(elf_phdata, elf_ex->e_phnum);
>> +                       alignment = maximum_alignment(elf_phdata, elf_ex->e_phnum,
>> +                                                     bprm->file);
>>
>>                         /**
>>                          * DOC: PIE handling
>> --
>> 2.52.0
>>
> 
> Thanks,
> Rui


