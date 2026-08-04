Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80253C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdhvKAhYjr952ymXAO2SIcsEDMnDBBXhxHNmkWFa9cE=; b=rzOcAhKgzTh3cRHS60yVtdcsKx
	juHpBZhzJ0pvD7fzAFznS4pJkV/23qd/xMOkEP9qm7Xmf7Dbwpy8UsOubx1IfyNpDVmYQypmtnSwH
	teGKoN3rEQRhfAFO++QgNpkXhA6W7zYwwV3q9FwkBx4FPtKkCHqys+/roxWJPWitfKmH2MIPBry7x
	/Vx2vlS4ztX3FnzVQVT7eAaZjAghKVgLvhjUAVyTXFg8Qm4tO2E+vdISrSsS4Lv+ezsNu0K7n+yJC
	ZzPlOv0cdnvYqRLrtram6yfKB/U45/jLPOETYoN5rNnmX2hJhOjxM8ExySJXf7CspfxkPL1vrIBgv
	ILkNEHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFOw-00000001x4V-0Fqe;
	Tue, 04 Aug 2026 13:41:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFOu-00000001x4H-4AlW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:41:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D37A41652;
	Tue,  4 Aug 2026 13:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925861F000E9;
	Tue,  4 Aug 2026 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785850908;
	bh=RdhvKAhYjr952ymXAO2SIcsEDMnDBBXhxHNmkWFa9cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dpJbmWzxqRKDbg86q7gF6Txf18mYxkBJG8vW8IUQb5mfBIxBCmiMjj2Qh9IMgM4u2
	 JalZUvvufBDe0TBeAYiP8fsYBZlfzT8UrZRJL7z2QEU/xlQlUqBZNl67jPUyBFE48S
	 eBjPgoAImjgIm3O2V2SZjJFq150LjsGWEeZVTz0jlK1+wfdkeHdUu+nTtBODN0++nK
	 cjd768w3aBbNSNe7JAXN8zGaTx3yAUKQYWz81PtWJKxBgJxoqcA5wtVywo3BMx3Rth
	 8K7ORRI2LF/RydoioAifxToROyKLKuTiGr3yxqUdJ6j+Fbw1TcWP/C3sWUYCwpUTMI
	 Saaan/BFUjMVg==
Date: Tue, 4 Aug 2026 14:41:44 +0100
From: Will Deacon <will@kernel.org>
To: Lianghong Liu <liulhong617@163.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org
Subject: Re: [PATCH] arm64: mm: fix accidental linear mapping of no-map
 reserved memory
Message-ID: <anHsGJhv66TMQFBo@willie-the-truck>
References: <20260513010255.3764038-1-liulhong617@163.com>
 <aljkLPTfyAbPaT98@willie-the-truck>
 <20260727015527.1@liulhong617.163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727015527.1@liulhong617.163.com>
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

On Mon, Jul 27, 2026 at 09:55:58AM +0800, Lianghong Liu wrote:
> Thanks for the review. Quick answers to the two open questions.
> 
> ## What I'm seeing on my system
> 
> 64K pages (PAGE_SHIFT=16). A no-map reserved region at 0xA2000000 with
> size 0x8000 (32 KiB, sub-page). The linear map should skip that hole and
> start at 0xA2008000; instead it starts at 0xA2000000 — the whole no-map
> region is mapped with PAGE_KERNEL. Debug print in
> __create_pgd_mapping_locked():
> 
>   create_pgd_mapping: phys 0xa2008000 ...
>     after PAGE_MASK align: phys 0xa2000000 - 0xab000000   <- start rounded DOWN into no-map
> 
> Cause: for_each_mem_range skips MEMBLOCK_NOMAP regions via
> should_skip_region(), but memblock_mark_nomap() splits at byte
> boundaries in memblock_isolate_range() (rgn->base = base), so the
> *adjacent* region is returned with a sub-page-aligned start/end. That
> value then hits
>   phys &= PAGE_MASK;
> in __create_pgd_mapping_locked(), which rounds the start DOWN and pulls
> the mapping back into the no-map page.
> 
> So this is a real isolation break, not cosmetic: no-map memory the
> firmware asked to leave untouched ends up read/writable in the linear
> region.
> 
> ## On "we might fail to map legitimately mappable pages"
> 
> The inward rounding can't lose any page the allocator owns. The buddy
> release path uses the exact same inward PFN rounding in
> __free_memory_core():
>   start_pfn = PFN_UP(start);
>   end_pfn   = min(PFN_DOWN(end), max_low_pfn);
>   if (start_pfn >= end_pfn) return 0;

Sorry, but I don't understand how this has anything to do with the
question I asked. It looks like you just fed my reply to an LLVM and
pasted the response here.

I'm not convinced your patch is correct and I don't understand your
reply.

Will

