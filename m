Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BACBD3EE9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 06:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KI30BF83QgBIY4X1JVP4wtQO6tRrM8r5lST04/IyiD8=; b=3K4E29yvlh9PQnCHN43Sn89w0h
	LIH8TEQ0exWtZ0CcgM7AfVhMWl/IjbSi+qknOy0etMnaQQ8pjIRNdjcYYCWn/k9FGGO90aViEjbm5
	peNav8eITwr9RosIIiiRWqNk8ul8PILjqxxCqBjim/F+WLEir4uj6bm/KI0jjUMQ6Y0xINt7KpNJv
	KPUmouV9ZejUYhEDvwD3/ycWDsTAEH1FHVVj7JOikHZO5kj4idoWCh5zu6dxKaOSXdM1iqOG1tQke
	p43WFvIR7W1gdw5Aj1VMuUpnLuwzSzwMWEF+Kc84CHpG1UzsZrZj6Up/xonUchUYSpYZoebieaZ70
	SPykoSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjB2G-00000008KE4-2xds;
	Fri, 23 Jan 2026 06:52:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjB2E-00000008KDk-44N5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 06:52:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA8E51476;
	Thu, 22 Jan 2026 22:52:38 -0800 (PST)
Received: from [10.164.18.52] (unknown [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E04B13F632;
	Thu, 22 Jan 2026 22:52:41 -0800 (PST)
Message-ID: <47fdacc6-1928-4d77-8024-28133daac0f4@arm.com>
Date: Fri, 23 Jan 2026 12:22:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: Unmap kernel data/bss entirely from the linear
 map
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260119164747.1402434-6-ardb+git@google.com>
 <20260119164747.1402434-10-ardb+git@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260119164747.1402434-10-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_225247_161766_690A14B7 
X-CRM114-Status: GOOD (  22.73  )
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



On 19/01/26 10:17 PM, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The linear aliases of the kernel text and rodata are mapped read-only as
> well. Given that the contents of these regions are mostly identical to
> the version in the loadable image, mapping them read-only is a
> reasonable hardening measure.
> 
> Data and bss, however, are now also mapped read-only but the contents of
> these regions are more likely to contain data that we'd rather not leak.
> So let's unmap these entirely in the linear map when the kernel is
> running normally.
> 
> Only when going into hibernation or waking up from it do these regions
> need to be mapped, so take care of this using a PM notifier.

Just curious - why do we need them mapped while going into or coming back
from the hibernation ?

> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/mm/mmu.c | 35 ++++++++++++++++++--
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index d978b07ab7b8..7b3ce9cafe64 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -24,6 +24,7 @@
>  #include <linux/mm.h>
>  #include <linux/vmalloc.h>
>  #include <linux/set_memory.h>
> +#include <linux/suspend.h>
>  #include <linux/kfence.h>
>  #include <linux/pkeys.h>
>  #include <linux/mm_inline.h>
> @@ -1024,13 +1025,13 @@ static void __init __map_memblock(pgd_t *pgdp, phys_addr_t start,
>  				 prot, early_pgtable_alloc, flags);
>  }
>  
> -static void remap_linear_data_alias(void)
> +static void remap_linear_data_alias(bool unmap)
>  {
>  	extern const u8 __pgdir_start[];
>  
>  	update_mapping_prot(__pa_symbol(__init_end), (unsigned long)lm_alias(__init_end),
>  			    (unsigned long)__pgdir_start - (unsigned long)__init_end,
> -			    PAGE_KERNEL_RO);
> +			    unmap ? __pgprot(0) : PAGE_KERNEL_RO);
>  }
>  
>  void __init remap_linear_kernel_alias(void)
> @@ -1041,7 +1042,7 @@ void __init remap_linear_kernel_alias(void)
>  	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
>  			    (unsigned long)__init_begin - (unsigned long)_text,
>  			    PAGE_KERNEL_RO);
> -	remap_linear_data_alias();
> +	remap_linear_data_alias(true);
>  }
>  
>  #ifdef CONFIG_KFENCE
> @@ -2257,3 +2258,31 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long i
>  	return 0;
>  }
>  #endif
> +
> +#ifdef CONFIG_HIBERNATION
> +static int arm64_hibernate_pm_notify(struct notifier_block *nb,
> +				     unsigned long mode, void *unused)
> +{
> +	switch (mode) {
> +	case PM_HIBERNATION_PREPARE:
> +	case PM_RESTORE_PREPARE:
> +		remap_linear_data_alias(false);
> +		break;
> +	case PM_POST_HIBERNATION:
> +	case PM_POST_RESTORE:
> +		remap_linear_data_alias(true);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static struct notifier_block arm64_hibernate_pm_notifier = {
> +	.notifier_call = arm64_hibernate_pm_notify,
> +};
> +
> +static int arm64_hibernate_register_pm_notifier(void)
> +{
> +	return register_pm_notifier(&arm64_hibernate_pm_notifier);
> +}
> +late_initcall(arm64_hibernate_register_pm_notifier);
> +#endif


