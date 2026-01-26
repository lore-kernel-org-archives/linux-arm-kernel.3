Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1FCD13C1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+beucbNKBCq81P9+drqPQ91StsFy/03VLiaWX7t2LwU=; b=RYoHRK/nZbVsenE3iyBaRNtQXf
	I4VXP95j5pGlQkp56Yt7p8f+9mLF4Ycqokc3rsrm1zFJe238ZLhmvowKNEaeCs9EOCNFr1LX86LNq
	B/IDofNzUwY9WqIGu5kJz/trJIXWWad5X8T1kHOyApt+t6l20i8x3LQqHnQvxp9d5ywy90rHhd3s4
	jGgPNeNriXIAICCsDmT04tir+lzojPE5cEyXvUzz85IsprsERnQfHdTKD8nBS7onyMrAE6orMwsJc
	TNQZ6ZSDrw22fOd22ChhS/oyRdywrHg8dskdq3ZpdE1dd+riyeT6Jj+dzAFOZ1g/UxtWxvhIkucpv
	NrIRVkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNQE-0000000CgJv-1YDp;
	Mon, 26 Jan 2026 14:18:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNQC-0000000CgJ7-1XBR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 14:18:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1689E4072D;
	Mon, 26 Jan 2026 14:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E019C116C6;
	Mon, 26 Jan 2026 14:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769437105;
	bh=SzW0Gil2VZdrbEyNqGsbocnMPP9c7OdoPzfUpkSM08M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MhCtSowZKbZn7fMam57zwRRM7aPZV0bbvMRfqnLop3buhqJc+Wb71u+XhmONIN071
	 nU+7aeg/7kubK2dDxPOM+HWSHexxqhL0JE8YADE95iGuBw8Y6vuJL7CpkeIQxDVO/B
	 ulAVokRwP31qSkK+hL4EN2onlhmmvyhpG3z4KNd4cq19xZXBEX3IJeU28qi8cmbEAv
	 tWgvQd6dg9CV9jgvZRO2mf5cTtz0Z3tzfcQqR8d/bIc8S81gBALU7kuvVdbV6mhODi
	 uJ8xQtTYfPC3b7vxc6Mf2QLUNePXtR/5dAxevjOFbax/PZ2HGfKsGUkDM2QFbVkLOP
	 Fl8KLiQaVSTvA==
Date: Mon, 26 Jan 2026 14:18:21 +0000
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <aXd3ralBsv9hPtfe@willie-the-truck>
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <5f1bfe55-454c-40d5-ac45-1aed651b3747@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f1bfe55-454c-40d5-ac45-1aed651b3747@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_061828_450091_E2C5F4A9 
X-CRM114-Status: GOOD (  30.80  )
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

On Tue, Jan 13, 2026 at 04:36:06PM -0800, Yang Shi wrote:
> On 1/13/26 6:36 AM, Will Deacon wrote:
> > On Tue, Jan 06, 2026 at 04:29:44PM -0800, Yang Shi wrote:
> > > +#if defined(CONFIG_ARM64_4K_PAGES)
> > > +	size[PTE] = "4k";
> > > +	size[CONT_PTE] = "64k";
> > > +	size[PMD] = "2M";
> > > +	size[CONT_PMD] = "32M";
> > > +	size[PUD] = "1G";
> > > +#elif defined(CONFIG_ARM64_16K_PAGES)
> > > +	size[PTE] = "16k";
> > > +	size[CONT_PTE] = "2M";
> > > +	size[PMD] = "32M";
> > > +	size[CONT_PMD] = "1G";
> > > +#elif defined(CONFIG_ARM64_64K_PAGES)
> > > +	size[PTE] = "64k";
> > > +	size[CONT_PTE] = "2M";
> > > +	size[PMD] = "512M";
> > > +	size[CONT_PMD] = "16G";
> > > +#endif
> > > +
> > > +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> > > +			size[PTE], dm_meminfo[PTE] >> 10);
> > > +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> > > +			size[CONT_PTE],
> > > +			dm_meminfo[CONT_PTE] >> 10);
> > > +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> > > +			size[PMD], dm_meminfo[PMD] >> 10);
> > > +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> > > +			size[CONT_PMD],
> > > +			dm_meminfo[CONT_PMD] >> 10);
> > > +	if (pud_sect_supported())
> > > +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
> > > +			size[PUD], dm_meminfo[PUD] >> 10);
> > This seems a bit brittle to me. If somebody adds support for l1 block
> > mappings for !4k pages in future, they will forget to update this and
> > we'll end up returning kernel stack in /proc/meminfo afaict.
> 
> I can initialize size[PUD] to "NON_SUPPORT" by default. If the case happens,
> /proc/meminfo just shows "DirectMapNON_SUPPORT", then we will notice
> something is missed, but no kernel stack data will be leak.

Or just add the PUD sizes for all the page sizes...

> > > @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
> > >   		    (flags & NO_BLOCK_MAPPINGS) == 0) {
> > >   			pmd_set_huge(pmdp, phys, prot);
> > > +			/*
> > > +			 * It is possible to have mappings allow cont mapping
> > > +			 * but disallow block mapping. For example,
> > > +			 * map_entry_trampoline().
> > > +			 * So we have to increase CONT_PMD and PMD size here
> > > +			 * to avoid double counting.
> > > +			 */
> > > +			if (pgprot_val(prot) & PTE_CONT)
> > > +				dm_meminfo_add(addr, (next - addr), CONT_PMD);
> > > +			else
> > > +				dm_meminfo_add(addr, (next - addr), PMD);
> > I don't understand the comment you're adding here. If somebody passes
> > NO_BLOCK_MAPPINGS then that also prevents contiguous entries except at
> > level 3.
> 
> The comment may be misleading. I meant if we have the accounting code for
> CONT_PMD in alloc_init_cont_pmd(), for example,

I think I'd just drop the comment. The code is clear enough once you
actually read what's going on.

> @@ -433,6 +433,11 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned
> long addr,
>                 if (ret)
>                         goto out;
> 
> +               if (pgprot_val(prot) & PTE_CONT)
> +                       dm_meminfo_add(addr, (next - addr), CONT_PMD);
> 
>                 pmdp += pmd_index(next) - pmd_index(addr);
>                 phys += next - addr;
>         } while (addr = next, addr != end);
> 
> If the described case happens, we actually miscount CONT_PMD. So I need to
> check whether it is CONT in init_pmd() instead. If the comment is confusing,
> I can just remove it.
> 
> > It also doesn't look you handle the error case properly when the mapping
> > fails.
> 
> I don't quite get what fail do you mean? pmd_set_huge() doesn't fail. Or you
> meant hotplug fails? If so the hot unplug will decrease the counters, which
> is called in the error handling path.

Sorry, I got confused here and thought that we could end up with a
partially-formed contiguous region but that's not the case. So you can
ignore this comment :)

Will

