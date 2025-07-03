Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DF3C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rF2qYrvErubAyGK8fOu3JYouiv0z9Oj4BLs/e8Dkg7g=; b=nGyGBugtWU07RuI9RUSbaCSw9B
	ImFPwokiEdOyd6DX3WXRPt+3LTf0NixMwTqGdq/550BoZPU98+QEMGRAcy4UOyx27+H7XewJUJeXl
	HW4PcLRY/v3w9iN1Ioc/5juB1GKMrHRCuS7Hs8abSWB15eHH79g2pWMfLmpB51rzavd3iiH6cPbY3
	Zlvlq2/zaQazmYlpqVwQCQfPyo7EpklKPU/8eHLVgirOPiRfaC3Qih7XynkQnJgZL5XSPiqLlTT9M
	QLFRbaOVc624YHESgsdRXE4mEDxXwZbPxEu3bmmb+pm3V592CdiMicVEs5nS943ek8oXTeFSDcz3r
	LKoFO1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2I-0000000CXUi-41Ys;
	Thu, 03 Jul 2025 21:00:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMuf-0000000C0p3-3XF3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:35:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBAF461446;
	Thu,  3 Jul 2025 16:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BADC4CEE3;
	Thu,  3 Jul 2025 16:35:50 +0000 (UTC)
Date: Thu, 3 Jul 2025 17:35:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Will Deacon <will@kernel.org>, usamaarif642@gmail.com,
	Ard Biesheuvel <ardb@kernel.org>, rmikey@meta.com,
	andreyknvl@gmail.com, kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: efi: Fix KASAN false positive for EFI runtime
 stack
Message-ID: <aGaxZHLnDQc_kSur@arm.com>
References: <20250624-arm_kasan-v1-1-21e80eab3d70@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-arm_kasan-v1-1-21e80eab3d70@debian.org>
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

On Tue, Jun 24, 2025 at 05:55:53AM -0700, Breno Leitao wrote:
> KASAN reports invalid accesses during arch_stack_walk() for EFI runtime
> services due to vmalloc tagging[1]. The EFI runtime stack must be allocated
> with KASAN tags reset to avoid false positives.
> 
> This patch uses arch_alloc_vmap_stack() instead of __vmalloc_node() for
> EFI stack allocation, which internally calls kasan_reset_tag()
> 
> The changes ensure EFI runtime stacks are properly sanitized for KASAN
> while maintaining functional consistency.
> 
> Link: https://lore.kernel.org/all/aFVVEgD0236LdrL6@gmail.com/ [1]
> Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/arm64/kernel/efi.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index 3857fd7ee8d46..d2af881a48290 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -15,6 +15,7 @@
>  
>  #include <asm/efi.h>
>  #include <asm/stacktrace.h>
> +#include <asm/vmap_stack.h>
>  
>  static bool region_is_misaligned(const efi_memory_desc_t *md)
>  {
> @@ -214,9 +215,11 @@ static int __init arm64_efi_rt_init(void)
>  	if (!efi_enabled(EFI_RUNTIME_SERVICES))
>  		return 0;
>  
> -	p = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_KERNEL,
> -			   NUMA_NO_NODE, &&l);
> -l:	if (!p) {
> +	if (!IS_ENABLED(CONFIG_VMAP_STACK))
> +		return -ENOMEM;

Mark Rutland pointed out in a private chat that this should probably
clear the EFI_RUNTIME_SERVICES flag as well.

> +
> +	p = arch_alloc_vmap_stack(THREAD_SIZE, NUMA_NO_NODE);
> +	if (!p) {
>  		pr_warn("Failed to allocate EFI runtime stack\n");
>  		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
>  		return -ENOMEM;
> 

With that:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

(but let's see if Ard has a different opinion on the approach)

