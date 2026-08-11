Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4F3C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqDN8/oCng68xYLvZkz2cIdACIigPFlcuor8NDMkF1g=; b=W+hOH+ua9q++vbETe/KEXrXE5c
	mgBCxxCfGx6lbrgvxQDD9iwBsogXNcqfnVJd6ivATbsSjvHcFnJRDosA7cf/8eQOsLlLgIHZtlVTx
	cqPl2b+526LaZCLXtvEzaFxsxJw3O7rL1pPtwAOCxjwthGLMZtsk7Y3Y7g7W8w5G8pEh52JkX4fd7
	7hM7R2i0YmdoZ8uX35We18Exr/+IZpMm36uLPWxJ9jqWXSK6tODYcwvfnfnKPqrlgf89OwVbOJ1Vh
	T1ExLh3p4H5hPn2HbsRW/Pqm8NHrItzqS0TCXzKq3Dr7/B4lC3GSEZoest9JydHZX81pQtcZ5xDn7
	rZnk0uag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlas-0000000E1g0-2hr3;
	Tue, 11 Aug 2026 12:28:34 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlap-0000000E1fE-04LB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:28:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UqDN8/oCng68xYLvZkz2cIdACIigPFlcuor8NDMkF1g=;
	b=4RXBb1CUHVzpGHtcdQoAm6GhT7Y91pGLP+RLujBgeEGqqHcUtbGpwcE6vaj5BHy/m1/ct3ioj
	laUVHZs2uRjKDM9b3JelZsQPnfnJfZ2qEJCM0tKorPm/rvnKFG3gv5VMTai0A3JHFm4wF2KuQMg
	VIXk3XYonoYSgIMD/bedf/I=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hK9cl6C33znTVy;
	Tue, 11 Aug 2026 20:17:59 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D7C7940563;
	Tue, 11 Aug 2026 20:28:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Aug 2026 20:28:22 +0800
Message-ID: <1cbcf4b7-201d-4476-a9a7-e5bcac4166b3@huawei.com>
Date: Tue, 11 Aug 2026 20:28:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 26/45] arm64/efi: Implement override for IRQ flags
 checks
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-27-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-27-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052831_674383_FF9AE572 
X-CRM114-Status: GOOD (  16.20  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
> Take advantage of the recent changes to the way arm64 represents IRQ
> flags and implement an architecture-specific override for the EFI IRQ
> flags check.
> 
> IRQ flags now carry both DAIF and PMR state. EFI is not expected to
> modify either of them, so check both when verifying that IRQ state is
> preserved across EFI runtime calls.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/efi.h | 38 ++++++++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
> index e8a9783235cb..0fc5a8cd5850 100644
> --- a/arch/arm64/include/asm/efi.h
> +++ b/arch/arm64/include/asm/efi.h
> @@ -5,6 +5,7 @@
>  #include <asm/boot.h>
>  #include <asm/cpufeature.h>
>  #include <asm/fpsimd.h>
> +#include <asm/interrupts/common_flags.h>
>  #include <asm/io.h>
>  #include <asm/memory.h>
>  #include <asm/mmu_context.h>
> @@ -48,18 +49,43 @@ void arch_efi_call_virt_teardown(void);
>  	(efi_rt_stack_top != NULL &&					\
>  	 on_task_stack(current, READ_ONCE(efi_rt_stack_top[-1]), 1))
>  
> -#define ARCH_EFI_IRQ_FLAGS_MASK (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
> -
>  /*
>   * Even when Linux uses IRQ priorities for IRQ disabling, EFI does not.
>   * And EFI shouldn't really play around with priority masking as it is not aware
>   * which priorities the OS has assigned to its interrupts.
>   */
>  #define arch_efi_save_flags(state_flags)		\
> -	((void)((state_flags) = read_sysreg(daif)))
> -
> -#define arch_efi_restore_flags(state_flags)	write_sysreg(state_flags, daif)
> -
> +	((void)((state_flags) = arch_local_save_flags()))
> +
> +#define arch_efi_restore_flags(state_flags)			\
> +do {								\
> +	arm64_exc_hwstate_t __st = {.flags=state_flags};	\
> +								\
> +	arm64_update_exc_hwstate(__st);				\
> +} while(0)
> +
> +#define arch_efi_check_flags(state_flags, caller)									\
> +do {															\
> +	arm64_exc_hwstate_t __actual = {.flags =  arch_local_save_flags() };						\
> +	arm64_exc_hwstate_t __expected = {.flags=state_flags};								\
> +															\
> +	if (__expected.flags == __actual.flags)										\
> +		break;													\
> +															\
> +	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_NOW_UNRELIABLE);							\
> +															\
> +	if (system_uses_irq_prio_masking()) {										\
> +		pr_err_ratelimited(FW_BUG "DAIF+PMR corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
> +				   __expected.daif, __expected.pmr, __actual.daif, __actual.pmr,			\
> +				   caller ?: __builtin_return_address(0));						\
> +	} else {													\
> +		pr_err_ratelimited(FW_BUG "DAIF corrupted (0x%x=>0x%x) by EFI call from %pS\n",				\
> +				   __expected.daif, __actual.daif,							\
> +				   caller ?: __builtin_return_address(0));						\
> +	}														\
> +															\
> +	arch_efi_restore_flags(state_flags);										\

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +} while(0)
>  
>  /* arch specific definitions used by the stub code */
>  


