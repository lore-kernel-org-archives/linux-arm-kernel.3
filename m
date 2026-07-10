Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE44C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TdwDc0XAcOK/OY25Nms9uokbZmoqDxyoN0F8mjR1M0=; b=yHLyLByp9BcTIIQZVc+1/GMkd7
	Y6h/Alw9Y/7Dmk3yaE2s3Q0761DdBRA++i8s3xjRa97s4DWWNroxd/qsHloeXPfiyzILb0iIyaDkN
	all8UbaUlZDClopjmT11CtOD66V5aDNotX5zcjvzBgprFsU1HNourqsUyXfnvn1uqK792oeqCl65C
	Vxpq65sGjwXvapC4udmCfpw3+A6yV+RKTuHEQrmpgIb0Jk2RWMPCHHjMLj+lV3GX/I/V2Zh6y+PXn
	JJ2dk5jtgZMJIFWjmJoyEuBCSbjMRhmmiGD2qmUWEx9Pjc36miFCNSbzqIug/sj48XobA6AbCTdR5
	x2mMUz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi81q-00000004eIa-37sq;
	Fri, 10 Jul 2026 10:00:18 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi81n-00000004eI6-2muJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:00:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5TdwDc0XAcOK/OY25Nms9uokbZmoqDxyoN0F8mjR1M0=;
	b=vJhvUe2uO3h8h5qTuDZTEe6Yi6AwDZPf5dGQuS5c0hQoF+f8cqWSmA4ahvCSHcEOvvJ6YV/+T
	LPav2v3goh+inZN1Z7zOIsOqVcMWYLKLJbZAoYvinT8TWl08Vfg/1+ApQKlnkhUqWKvv4fFe+68
	ock4AJ61PE5Y9KofusR9pE4=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gxRtR6py7z12Ldk;
	Fri, 10 Jul 2026 17:51:27 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 08F4540575;
	Fri, 10 Jul 2026 18:00:06 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 18:00:05 +0800
Message-ID: <656764bf-f62f-4380-a8dc-96055d4972f5@huawei.com>
Date: Fri, 10 Jul 2026 18:00:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/36] arm64: process: Use helper to check exception
 state
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-14-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-14-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_030016_187719_2C217AA2 
X-CRM114-Status: GOOD (  12.53  )
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
> debug_switch_state() explicitly checks the hardware exception state
> for both the pseudo-NMI and non-NMI paths. The expected state matches
> the NOIRQ_CONTEXT exception context introduced alongside the exception
> masking helpers and state checkers.
> 
> Use the helper instead of open-coding these checks.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/process.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 033643cd4e5e..ddda8d7aee24 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -51,6 +51,7 @@
>  #include <asm/exec.h>
>  #include <asm/fpsimd.h>
>  #include <asm/gcs.h>
> +#include <asm/interrupts/common_flags.h>
>  #include <asm/mmu_context.h>
>  #include <asm/mpam.h>
>  #include <asm/mte.h>
> @@ -738,25 +739,7 @@ void update_sctlr_el1(u64 sctlr)
>  
>  static inline void debug_switch_state(void)
>  {
> -	if (system_uses_irq_prio_masking()) {
> -		unsigned long daif_expected = 0;
> -		unsigned long daif_actual = read_sysreg(daif);
> -		unsigned long pmr_expected = GIC_PRIO_IRQOFF;
> -		unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
> -
> -		WARN_ONCE(daif_actual != daif_expected ||
> -			  pmr_actual != pmr_expected,
> -			  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
> -			  daif_actual, pmr_actual,
> -			  daif_expected, pmr_expected);
> -	} else {
> -		unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
> -		unsigned long daif_actual = read_sysreg(daif);
> -
> -		WARN_ONCE(daif_actual != daif_expected,
> -			  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
> -			  daif_actual, daif_expected);
> -	}
> +	arm64_debug_exc_context(NOIRQ_CONTEXT);


With CONFIG_DEBUG_IRQFLAGS，we can avoid the overhead of this check.

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  /*


