Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E2BC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp5jO+3XqshE99v9cEk3EOttPZ9/nyT0f5i7VRcI51Q=; b=4fW3H05xmh5aKon8yRqZEPdeFH
	sGxHmErbwcVItFPoWrgdGvZ1EGqXuHzoIri+bhWYQKjcsEnOlmjlj5O5aTQ33YRlT+hKoO2q/HeyH
	jcf+84uB6iCjVG5dB0MlRuFx01waVRiI4GcgZTQ3iwdErwsIhBCMdGmuhngB3OPQzIz5MHN1tuOL4
	UzCoUhoogpstmAlIeMQccm+0uF8dx/hWLrrjm1dwMTK3Ia+YQHIopU/giEikfXRMakBz8ROdYYvdG
	OBjZr3TdsmXPWjkUj2pNWqtx5YLOeHHiZxDFYcXEzsYYCHdxhPUf+pQJSkhIXpUfs76G4jBgZm0OH
	kNloEDLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzcp-000000057xZ-05z0;
	Tue, 24 Jun 2025 09:07:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzWF-000000056pP-2NQD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1F61629C9;
	Tue, 24 Jun 2025 09:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9639C4CEE3;
	Tue, 24 Jun 2025 09:00:40 +0000 (UTC)
Date: Tue, 24 Jun 2025 10:00:38 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: andreyknvl@gmail.com, kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	song@kernel.org, mark.rutland@arm.com, usamaarif642@gmail.com,
	Ard Biesheuvel <ardb@kernel.org>, rmikey@meta.com
Subject: Re: arm64: BUG: KASAN: invalid-access in arch_stack_walk
Message-ID: <aFppNmkSrdsbwhed@arm.com>
References: <aFVVEgD0236LdrL6@gmail.com>
 <CA+fCnZfzHOFjVo43UZK8H6h3j=OHjfF13oFJvT0P-SM84Oc4qQ@mail.gmail.com>
 <aFlA1tXXUEBZP1NH@arm.com>
 <aFmHQbpwX4WnR/5p@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFmHQbpwX4WnR/5p@gmail.com>
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

On Mon, Jun 23, 2025 at 09:56:33AM -0700, Breno Leitao wrote:
> arm64: Use arch_alloc_vmap_stack for EFI runtime stack allocation
> 
> Refactor vmap stack allocation by moving the CONFIG_VMAP_STACK check
> from BUILD_BUG_ON to a runtime return of NULL if the config is not set.
> The side effect of this is that _init_sdei_stack() might NOT fail in
> build time if _VMAP_STACK, but in runtime. It shifts error
> detection from compile-time to runtime

_init_sdei_stack() is only called from init_sdei_stacks() if
CONFIG_VMAP_STACK is enabled.

> Then, reuse arch_alloc_vmap_stack() to allocate the ACPI stack
> memory in the arm64_efi_rt_init().
> 
> Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> diff --git a/arch/arm64/include/asm/vmap_stack.h b/arch/arm64/include/asm/vmap_stack.h
> index 20873099c035c..8380af4507d01 100644
> --- a/arch/arm64/include/asm/vmap_stack.h
> +++ b/arch/arm64/include/asm/vmap_stack.h
> @@ -19,7 +19,8 @@ static inline unsigned long *arch_alloc_vmap_stack(size_t stack_size, int node)
> {
> 	void *p;
> 
> -	BUILD_BUG_ON(!IS_ENABLED(CONFIG_VMAP_STACK));
> +	if (!IS_ENABLED(CONFIG_VMAP_STACK))
> +		return NULL;
> 
> 	p = __vmalloc_node(stack_size, THREAD_ALIGN, THREADINFO_GFP, node,
> 			__builtin_return_address(0));

We can leave this unchanged to catch possible misuses in the future.

> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index 3857fd7ee8d46..6c371b158b99f 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -15,6 +15,7 @@
> 
> #include <asm/efi.h>
> #include <asm/stacktrace.h>
> +#include <asm/vmap_stack.h>
> 
> static bool region_is_misaligned(const efi_memory_desc_t *md)
> {
> @@ -214,9 +215,8 @@ static int __init arm64_efi_rt_init(void)
> 	if (!efi_enabled(EFI_RUNTIME_SERVICES))
> 		return 0;
> 
> -	p = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_KERNEL,
> -			   NUMA_NO_NODE, &&l);
> -l:	if (!p) {
> +	p = arch_alloc_vmap_stack(THREAD_SIZE, NUMA_NO_NODE);

and bail out earlier here similar to init_sdei_stacks():

	if (!IS_ENABLED(CONFIG_VMAP_STACK))
		return -ENOMEM;

> +	if (!p) {
> 		pr_warn("Failed to allocate EFI runtime stack\n");
> 		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
> 		return -ENOMEM;

-- 
Catalin

