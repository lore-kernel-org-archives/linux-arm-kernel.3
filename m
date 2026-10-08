Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA653CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q86C4+wQJqBq95W/ZrCF57RUMIh12mIvymieYtRqSKQ=; b=XM1vzewOgnYSo8
	PSw8Qde5Tr+8FEBi5JKWkA8Uxf/8oHwa7Rd9jgVNbdhA7R0Q53uno/7Gbs7PdBwmEUFUGK1w0DMUl
	RVkVKpb3c84tEI24ATdCKpQuKFH/KW2omxMjHvBTzMt0ySfLuhrvJ3+bEr7IoKmJF3VvvZOWvbDHj
	FV3SIdfSavoaCw7GSVrr0OUT4YB+b3qadbeN3AcNcjhso/p9Mkxd3CD0FaN04lQ+z8O+Hmj218sXW
	eL2hiHGxi1/aik+vL6bnnar40UjtFBKaaZl4sl3ueHsnRPxp5XFwS+IMBg5xw37hFuAP1xpJlkQiG
	mbobblh3VaSSlNtmN13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjF3-00000003pzp-0DHf;
	Thu, 08 Oct 2026 08:12:41 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjF0-00000003pyy-1L75
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:12:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=q86C4+wQJqBq95W/ZrCF57RUMIh12mIvymieYtRqSKQ=;
	b=xCpcy42SMFyqW7jHMGgAWk06lsLb/UlmWRgB+83TmvKYhzr4SdacsZzbKANEUKz0fzyvs5oio
	Xo3zYe3f7oHQ0q34P2OjFQ4JBdls2XsZdH6ScQgWrTVhoa/0rYbAOu5Nr9E2cHMgdsa19IB3lYh
	dqUDAB8djimDU0sjgT9Ejyw=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j0j8z0XDDznTbJ;
	Thu,  8 Oct 2026 16:00:35 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D3D3F40578;
	Thu,  8 Oct 2026 16:12:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 16:12:30 +0800
Message-ID: <aefc8c70-9423-446f-9e07-163c975cc00b@huawei.com>
Date: Thu, 8 Oct 2026 16:12:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] arm64: percpu: Specialise set_my_cpu_offset()
 for the primary CPU
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-11-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-11-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_011238_974933_513869A8 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/19 0:13, Will Deacon 写道:
> set_my_cpu_offset() is only called from smp_prepare_boot_cpu() which
> runs once on the primary CPU and before alternatives have been applied.
> 
> Rework the function so that it operates only on the boot CPU offset,
> drop the unused alternative code sequence and internalise it into smp.c
> alongside its only caller.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/percpu.h | 8 --------
>  arch/arm64/kernel/smp.c         | 8 +++++++-
>  2 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index b57b2bb00967..3dc7291b16e9 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -12,14 +12,6 @@
>  #include <asm/stack_pointer.h>
>  #include <asm/sysreg.h>
>  
> -static inline void set_my_cpu_offset(unsigned long off)
> -{
> -	asm volatile(ALTERNATIVE("msr tpidr_el1, %0",
> -				 "msr tpidr_el2, %0",
> -				 ARM64_HAS_VIRT_HOST_EXTN)
> -			:: "r" (off) : "memory");
> -}
> -
>  static inline unsigned long __hyp_my_cpu_offset(void)
>  {
>  	/*
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index a61dc3016a11..702dee8d0db5 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -446,6 +446,12 @@ void __init smp_cpus_done(unsigned int max_cpus)
>  	mark_linear_text_alias_ro();
>  }
>  
> +static void __init set_boot_cpu_offset(void)
> +{
> +	asm volatile("msr tpidr_el1, %0"
> +			:: "r" (per_cpu_offset(0)) : "memory");
> +}

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +
>  void __init smp_prepare_boot_cpu(void)
>  {
>  	/*
> @@ -453,7 +459,7 @@ void __init smp_prepare_boot_cpu(void)
>  	 * setup_per_cpu_areas(), and CPU0's boot time per-cpu area will be
>  	 * freed shortly, so we must move over to the runtime per-cpu area.
>  	 */
> -	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
> +	set_boot_cpu_offset();
>  
>  	cpuinfo_store_boot_cpu();
>  	setup_boot_cpu_features();

-- 
Best regards,
Jinjie


