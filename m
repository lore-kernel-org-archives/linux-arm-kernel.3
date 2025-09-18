Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BB8CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8+zKfoNS2I6BQ+QE3IfaDAwelJVYVurCIZ29hS40q8=; b=ox1Kgkm9WJCkUZ0x9JCamUua3C
	MBgTi64pBrwcoED5FFCV5/wopepgcRr9BFMlRstJK9JY+KD3KD1uGPt8PAnFM3Qb5AGvoLOtq/UBh
	Zzmo60e0ffOFx8Mu2dyqlFn10DXhYM+7AYAhveSqatKXLFFM9S+hOUz0D6Eth+rC5UOzqaukrG40X
	FgRY0/zeR9VkwtOBOchLSq0YgrjAM8fr3iEWGYxm/BS2VKb1w2FIrTGBPePyDcUw5juHtIf+YBpHn
	2auR4POzWNX3OVfqFJ447q9YdBlci0t942ShcS83eTz3obW4ysSfeXoWtr2AhTYXS5M8pLo5GEEVn
	oU9Ac3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIOt-00000000kpU-1Z6d;
	Thu, 18 Sep 2025 17:26:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIOr-00000000koZ-01fn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 17:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD9C743B3C;
	Thu, 18 Sep 2025 17:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8D4C4CEE7;
	Thu, 18 Sep 2025 17:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758216388;
	bh=D4nBP8hMCbB4vDax8k9rJfwFNgsqTbtX9Wh44DW4D60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVBnUIcYbbyFTvxE+hMKJY7gRyallrIo9e11bETCC/H9pudYzYxfCgDm7rQjz8Zzb
	 rT9D/mJ8/1U6nczvsDDdgucWCYsgV/ltP3sHI/mloVki2AA+WkH2pHTxrCf/ZR4PNc
	 mPXweVR9+KmHYJzkHdxY+jERWlS5DgtOaobv/d+g0Q57X2ag+rKewpAD49uwUo2ohz
	 Bb8Yijvv3GY1l/nD1T/Ic1+UAZaN6BdxpQRWFvMKdh1Iwi//FFM8eW70CTGWgf3vIZ
	 /tNmhF4gGJ0TdZgKnXHiRsbINjMAUT9SJLQnsIwjP4rcVkbZl/OGCRn29QXd80nqi9
	 tZAj2QEuNMlcA==
Date: Thu, 18 Sep 2025 18:26:24 +0100
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [v2 PATCH] arm64: kprobes: call set_memory_rox() for kprobe page
Message-ID: <aMxAwDr11M2VG5XV@willie-the-truck>
References: <20250918162349.4031286-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918162349.4031286-1-yang@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_102629_075737_D834908A 
X-CRM114-Status: GOOD (  19.59  )
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

On Thu, Sep 18, 2025 at 09:23:49AM -0700, Yang Shi wrote:
> The kprobe page is allocated by execmem allocator with ROX permission.
> It needs to call set_memory_rox() to set proper permission for the
> direct map too. It was missed.
> 
> Fixes: 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in alloc_insn_page")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
> v2: Separated the patch from BBML2 series since it is an orthogonal bug
>     fix per Ryan.
>     Fixed the variable name nit per Catalin.
>     Collected R-bs from Catalin.
> 
>  arch/arm64/kernel/probes/kprobes.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 0c5d408afd95..8ab6104a4883 100644
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
> +	void *addr;
> +
> +	addr = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
> +	if (!addr)
> +		return NULL;
> +	set_memory_rox((unsigned long)addr, 1);
> +	return addr;
> +}

Why isn't execmem taking care of this? It looks to me like the
execmem_cache_alloc() path calls set_memory_rox() but the
execmem_vmalloc() path doesn't?

It feels a bit bizarre to me that we have to provide our own wrapper
(which is identical to what s390 does). Also, how does alloc_insn_page()
handle the direct map alias on x86?

Will

