Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208BDFD45EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 20:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9q4+ySLo4ROExE1JyfWwBdelFnFYshX8PHSjHp2QTY=; b=Iiep7Z9xcDZ2tSvBcPnWGe7g37
	yt5Y8mRmdc7FVsBcJGBIDT6elZNwBIaCugZkbLom9H+nnV+0rCWxdIv0EGEiV6Lqrej5/EQBU+Iwh
	oMWZ6ihNdQs6EUIKtsIMzArvM/JPddEzm35ziLdqfVK78EzexnAxOquKhzwp/HuctMc6ypKQmGjRw
	xmb3OTxrURquxGK1Zesdgq2qkn69Ev7OHZNmgDlSkl20vv67D0g8no+86LiNQO92vsMe44L5H/fUS
	bBiV/wR4h1taiCL0PuxC2uSd1h4+nkqXAWkv54vF3ULLxnSzTUnFNjQvgj7z7sQHGnBuDud9qtg16
	bc2D90vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLF2-00000004pTH-0jlc;
	Wed, 25 Feb 2026 20:12:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLF1-00000004pSt-1PZU;
	Wed, 25 Feb 2026 20:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A64960053;
	Wed, 25 Feb 2026 20:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D57AC116D0;
	Wed, 25 Feb 2026 20:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772050334;
	bh=PjnaX0nrKvXjwoSWqMyc2RZCBMHlMtQJ84VIGiaaCKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3ryCiLcJGsyHMU46ADgUo9zZyQbXK8ByyDOF6ZcP79iIzgOgLMp8mEQdmmUcqZf5
	 Pxf++y4Y5IDWpJZbdark3vMfgh0qpC6jyr0Cs59TzUh+PhVJVr7yjO9PHAHFXkVuB+
	 aII7SnpUP3wUPYgewdTvtioSYsECISw4h5NkzOYRc9FWs1BhDAuC8lA+bmmvWFVGjZ
	 eg1b1L7gNZAOmxN0ZP2giZPs0eltQWZJZ1T2pzdz4tBSjGGKqRHqmfl3skOpCffwj2
	 kIhQM6Il91b2LvNC+n/LzZHXloJl3DVXyOn1di3ZKkEPuxg7ZgbHQCLs1QBl6Jktj/
	 LHkOZijjnfmWw==
Date: Wed, 25 Feb 2026 22:12:05 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mark Brown <broonie@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/5] mm: arch/shstk: Common shadow stack mapping
 helper and VM_NOHUGEPAGE
Message-ID: <aZ9XlUAJvPux4xCQ@kernel.org>
References: <20260225161404.3157851-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225161404.3157851-1-catalin.marinas@arm.com>
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

On Wed, Feb 25, 2026 at 04:13:57PM +0000, Catalin Marinas wrote:
> This is v2 of the series extracting the common shadow stack mmap into a
> separate helper for arm64, riscv and x86. Thanks for the review.
> 
> Andrew, if you are happy with this, I think taking the patches through
> the mm tree makes most sense.
> 
> Minor changes since v1:
> 
> - Removed #ifdef from the helper function declaration
> - Used two tabs for the alignment of multi-line function arguments
> - Added "There is no functional change" to the arch patches log
> - Collected ack/review/test tags
> 
> v1:
> 
> https://lore.kernel.org/r/20260224175800.2500729-1-catalin.marinas@arm.com
> 
> Catalin Marinas (5):
>   mm: Introduce vm_mmap_shadow_stack() as a helper for VM_SHADOW_STACK
>     mappings
>   arm64: gcs: Use the new common vm_mmap_shadow_stack() helper
>   riscv: shstk: Use the new common vm_mmap_shadow_stack() helper
>   x86: shstk: Use the new common vm_mmap_shadow_stack() helper
>   mm: Do not map the shadow stack as THP

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
 
>  arch/arm64/mm/gcs.c         | 14 +-------------
>  arch/riscv/kernel/usercfi.c | 12 +-----------
>  arch/x86/kernel/shstk.c     | 12 ++----------
>  include/linux/mm.h          |  2 ++
>  mm/util.c                   | 29 +++++++++++++++++++++++++++++
>  5 files changed, 35 insertions(+), 34 deletions(-)
> 
> 

-- 
Sincerely yours,
Mike.

