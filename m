Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D56CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZ0NfGJRq2tFfwOVanBGqxtnfQQCUaZv/aphNtTj7xo=; b=rZeODnzwBeLqHR+1pb4rWPVTWf
	UyNt7b59hO+41AbUs1eQZhpyxMmNC1YdRfxtIDySfmX0y0Pbvzua4ZeRLE3t2yprpmY0d1J/FkBTA
	qQq9ScTHiLybhXIv2e7U1IXZask6ovxGE4GxMeSbmONod8qM+J49Zghp03c4rlra/SrjK9RjMYeua
	WnkoEQywPpVMpRW81nAULYym3LBoLj+NieYP+wr7mLTJ4xrZ4NvgtiHanTtz8+C1BqZuG6jvWlB1H
	Br49B60AH7Sj7fhnqhegy5m3xQ6RrFwMFxE5844pinHA4TCwS0sgkmiT47vn6OGk85GgIhr9NKt+l
	2bOTAT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzE3x-0000000HRiu-2tBF;
	Thu, 18 Sep 2025 12:48:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzE3w-0000000HRiB-0IKn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:48:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CD0E6020E;
	Thu, 18 Sep 2025 12:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC16C4CEE7;
	Thu, 18 Sep 2025 12:48:32 +0000 (UTC)
Date: Thu, 18 Sep 2025 13:48:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: will@kernel.org, ryan.roberts@arm.com, akpm@linux-foundation.org,
	david@redhat.com, lorenzo.stoakes@oracle.com, ardb@kernel.org,
	dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v8 5/5] arm64: kprobes: call set_memory_rox() for kprobe
 page
Message-ID: <aMv_nhEuCSHKp5J6@arm.com>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-6-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917190323.3828347-6-yang@os.amperecomputing.com>
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

On Wed, Sep 17, 2025 at 12:02:11PM -0700, Yang Shi wrote:
> The kprobe page is allocated by execmem allocator with ROX permission.
> It needs to call set_memory_rox() to set proper permission for the
> direct map too. It was missed.
> 
> And the set_memory_rox() guarantees the direct map will be split if it
> needs so that set_direct_map calls in vfree() won't fail.
> 
> Fixes: 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in alloc_insn_page")
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 0c5d408afd95..c4f8c4750f1e 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -10,6 +10,7 @@
>  
>  #define pr_fmt(fmt) "kprobes: " fmt
>  
> +#include <linux/execmem.h>
>  #include <linux/extable.h>
>  #include <linux/kasan.h>
>  #include <linux/kernel.h>
> @@ -41,6 +42,17 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>  static void __kprobes
>  post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
>  
> +void *alloc_insn_page(void)
> +{
> +	void *page;

Nit: I'd call this 'addr'. 'page' makes me think of a struct page.

> +
> +	page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
> +	if (!page)
> +		return NULL;
> +	set_memory_rox((unsigned long)page, 1);

It's unfortunate that we change the attributes of the ROX vmap first to
RO, then to back to ROX so that we get the linear map changed. Maybe
factor out some of the code in change_memory_common() to only change the
linear map.

Otherwise it looks fine.

-- 
Catalin

