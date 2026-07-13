Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD39EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo+wz/D4rTK5XgrgM58J5D6P+QKK3zQE7nNXXQGP/R8=; b=r7E/zs8zAssdYfi7bZlmcpCfPc
	saGCagIkID0mqKzQN/RzqEiD1jkrIgkBtw90wHcrgAtgvMRggnqreNetN2JIBKrJ1zILEk0ftjPM5
	sRtJ0EKeuvuSxe02I+goxl3RQd9R23lQsbJWyAGX1rmYmGQpwHsrvQ5RFHigJTJKPerP+kXvz+yY5
	QZblKHYnkyqn9hrL25n8RLQWPXy0JU6sLKDonWSeS7Aq8nljeXq/UGFZizl9XYB7DU7lXYTH7qW1p
	jussgxrEqj3qfM+AgbTA8TcrVC0JweUBqGEuX904c6H4XYgSTm5O9PVdsKN9zTutmi8RJQRKYQEON
	3cUdBazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC0S-00000008aBf-2vy1;
	Mon, 13 Jul 2026 08:27:16 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC0P-00000008a8D-1qTQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:27:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Eo+wz/D4rTK5XgrgM58J5D6P+QKK3zQE7nNXXQGP/R8=;
	b=vFzWrNHLthRh/X3F9Th7sfXXxpr6Bh5/Yzt4z5MZ9wFyj/MN05HZr2PREK9IwicdGdK70Zqk3
	Po2gkTHveqPwubuF4YiOZR0ZPAGW9bgG63cpLlw5iUdkUi8kY4vNGtA0AYG4SfKCnKDsaOMhQtb
	DogmzW/LUrZJodP/U7Xfatg=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gzFg00bCfz1K96g;
	Mon, 13 Jul 2026 16:17:48 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id EC99340586;
	Mon, 13 Jul 2026 16:27:03 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 16:27:03 +0800
Message-ID: <d5d6b5ec-d624-469f-a509-eff49cf74db7@huawei.com>
Date: Mon, 13 Jul 2026 16:27:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 22/36] efi/runtime-wrappers: Permit architectures to
 override IRQ flags checks
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-23-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-23-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_012713_809664_9690E713 
X-CRM114-Status: GOOD (  15.80  )
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
> Representation of IRQ flags on arm64 has recently changed. They now
> track both DAIF and PMR state while remaining compatible with the
> irqflags API by encoding the state in an unsigned long.
> 
> While the generic check can still detect corruption of the IRQ flags
> caused by EFI runtime services, the resulting error message is cryptic
> because it does not understand the arm64-specific representation.
> 
> Permit architectures to override the IRQ flags checks and associated
> error messages, while keeping the existing implementation as the
> default.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  drivers/firmware/efi/runtime-wrappers.c | 32 +++++++++++++++----------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
> index da8d29621644..498fb3612643 100644
> --- a/drivers/firmware/efi/runtime-wrappers.c
> +++ b/drivers/firmware/efi/runtime-wrappers.c
> @@ -137,6 +137,25 @@ struct efi_runtime_work efi_rts_work;
>  #define arch_efi_restore_flags(state_flags)	local_irq_restore(state_flags)
>  #endif
>  
> +#ifndef arch_efi_check_flags
> +#define arch_efi_check_flags(state_flags, caller) 							\
> +do {													\
> +	unsigned long cur_flags, mismatch;								\
> +													\
> +	cur_flags = efi_call_virt_save_flags();								\
> +													\
> +	mismatch = state_flags ^ cur_flags;								\
> +	if (!WARN_ON_ONCE(mismatch & ARCH_EFI_IRQ_FLAGS_MASK))						\
> +		break;											\
> +													\
> +	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_NOW_UNRELIABLE); 					\
> +	pr_err_ratelimited(FW_BUG "IRQ flags corrupted (0x%08lx=>0x%08lx) by EFI call from %pS\n",	\
> +			   state_flags, cur_flags,							\
> +			   caller ?: __builtin_return_address(0));					\
> +	arch_efi_restore_flags(state_flags);								\
> +} while(0);
> +#endif
> +
>  unsigned long efi_call_virt_save_flags(void)
>  {
>  	unsigned long flags;
> @@ -147,18 +166,7 @@ unsigned long efi_call_virt_save_flags(void)
>  
>  void efi_call_virt_check_flags(unsigned long flags, const void *caller)
>  {
> -	unsigned long cur_flags, mismatch;
> -
> -	cur_flags = efi_call_virt_save_flags();
> -
> -	mismatch = flags ^ cur_flags;
> -	if (!WARN_ON_ONCE(mismatch & ARCH_EFI_IRQ_FLAGS_MASK))
> -		return;
> -
> -	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_NOW_UNRELIABLE);
> -	pr_err_ratelimited(FW_BUG "IRQ flags corrupted (0x%08lx=>0x%08lx) by EFI call from %pS\n",
> -			   flags, cur_flags, caller ?: __builtin_return_address(0));
> -	arch_efi_restore_flags(flags);
> +	arch_efi_check_flags(flags, caller);
>  }
>  
>  /*


