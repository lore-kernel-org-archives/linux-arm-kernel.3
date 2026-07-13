Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618E5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzVYUSuBBF9FEkEqEOe9VwNEyKcV5wLxGPP24ZKIagQ=; b=auauRp2UW/7frYbxrvSTqeoUiH
	ONtEE1UiVdOMv4jmYk6LtlDVDMeaGEgRYWk2Aa33dKp0FP6+7CZI1lMQeKQ6o95YYkSAc4XB0zena
	vhf5/dxmZQCMbNxX6nEpeUeYsKzkKgzAprHdWPev+fXm0PNC7Y1JlY4G/DARISCxiLLa6bGzQ3qX6
	xZLjJBbJflyi0rWnLKE01yBbBAvYkUxIB6fFIbohaDX++daNUqJlVB2AGBu0p8OAAhKNwJJ/Z2uFu
	6xfIy6Rtirb+AxSMJHQmo+ccVfMvez3mei2hdToB/7KAMpzmuyKqjkTrdrHH13JZipXvtl7e7G0a9
	0PqWO/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBwZ-00000008ZPj-08Pk;
	Mon, 13 Jul 2026 08:23:15 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBwU-00000008ZP3-252d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:23:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xzVYUSuBBF9FEkEqEOe9VwNEyKcV5wLxGPP24ZKIagQ=;
	b=1zoEklZPd4tbXSZxVs5dRc1HQYOVRy45e8o///TsmjEyXNYr7QjKeQgcCQwgsxENIF3QuG+LX
	h7qUvf9Euf33y9YEr4dnzzxJ5D3ISMjPjx/pKTw4H13VIHUPI3MX0xa4NUpUqhh+ba3kSz0duM4
	1w1KtNT8qBoxR0xbeRhSyGk=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gzFZM1sRLzcbNp;
	Mon, 13 Jul 2026 16:13:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E00E40561;
	Mon, 13 Jul 2026 16:22:59 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 16:22:58 +0800
Message-ID: <e1694eb7-3459-43bd-9f37-1066bef43a14@huawei.com>
Date: Mon, 13 Jul 2026 16:22:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 23/36] arm64/efi: Implement override for IRQ flags
 checks
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-24-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-24-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_012311_200249_465C2BE0 
X-CRM114-Status: GOOD (  17.12  )
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



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
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
> index e8a9783235cb..479741d52c90 100644
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

Can this comment be deleted?

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
> +	arm64_update_exc_hwstate(__st, true, true);		\
> + } while(0)
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
> +} while(0)
>  
>  /* arch specific definitions used by the stub code */
>  


