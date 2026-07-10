Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC814C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 04:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+44eqqKft3VD53G/1SvMud8uiJM6et7ZC2iWZt2Lnx4=; b=5GcpuLMPmCi1Q5
	1nFY//wgsP2XMSjjMkvJPulrZK5cNWviFyb7NmKby9NaeEoQUNe2zFSB+E7dvg3BqnelkUbwEES0H
	Iw2deZDnHMDoDDJkjije3iJsYdQvWesJGzLFMUGl9JwlLW/XIJ40slHkwW6amhiPjZtkX32zup6cA
	r6dWkQCr3qeU1GCaPq/I7ub0awm2Lv+GoxXsUzqEY2rbX2XZ5vRBYIgLMOBBYH3TQjNZk4eRphoD0
	maIugcJtdFtdTDd5lC6C2RN1s/F00lF3fPEeMp/NGK+1UcdaKaXMyBSXq7NwWyerPGSR3iHSmPy6y
	ShALJndhI1sSWgJ1vcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2W7-000000044k1-15mC;
	Fri, 10 Jul 2026 04:07:11 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2W4-000000044j2-04Yh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 04:07:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+44eqqKft3VD53G/1SvMud8uiJM6et7ZC2iWZt2Lnx4=;
	b=ZKKIf1Wi1eT1xQGDcIfHLIkEqYK7X8RIT7DgXKTMhD5tzM8bpdfLCsovPhVcH6orzRQaMxcE+
	xUmmKVGb84CcaBsVTvkk8GJAlRgyta151nr5/lpACvPiUVDBaQuVWgzqbkS+g1cXypaec6OkTru
	AUfmtxOiEFCXV5wyeTbLVNs=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gxJ2M2MMDz1K96S;
	Fri, 10 Jul 2026 11:57:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C57240586;
	Fri, 10 Jul 2026 12:07:01 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 12:07:00 +0800
Message-ID: <4e5e1586-2862-4e30-ac5d-84f1e0fb0010@huawei.com>
Date: Fri, 10 Jul 2026 12:06:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/36] arm64: suspend: rely on daif helpers to handle
 PMR
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-5-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-5-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_210708_661713_BEE87B6D 
X-CRM114-Status: GOOD (  24.55  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> Commit 77345ef70445 ("arm64: suspend: Use cpuidle context helpers
> in cpu_suspend()") added cpuidle helpers to handle PMR manipulation
> and restoration to ensure that the CPU receives interrupts when suspended
> and pseudo-NMIs are enabled.
> 
> However, those helpers are called in between a pair of `local_daif_save()`
> and `local_daif_restore()`, which already configure the PMR as expected.
> Effectively, `arm_cpuidle_save_irq_context()` is a no-op here,
> even when using pseudo-NMIs, and `arm_cpuidle_restore_irq_context()`
> would not restore proper interrupt masking configuration early enough
> if there were unexpected changes during suspend or resume.
> (This can be observed with Trusted Firmware A (TF-A) at EL3 handling
> suspend through PSCI. Even though it should not be the case, TF-A can
> reset `ICC_PMR_EL1` during CPU_SUSPEND, thus resuming the kernel
> with an inconsistent priority mask value on hardware implementing
> more than the minimum number of priority levels, such as Morello.)
> 
> Thus : remove the cpuidle context helpers as they do not do anything,
> but keep the comment mentioning the need for interrupts to reach the CPU
> if we are using pseudo-NMIs.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/suspend.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
> index eaaff94329cd..c41724a40b75 100644
> --- a/arch/arm64/kernel/suspend.c
> +++ b/arch/arm64/kernel/suspend.c
> @@ -99,7 +99,6 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
>  	int ret = 0;
>  	unsigned long flags;
>  	struct sleep_stack_data state;
> -	struct arm_cpuidle_irq_context context;
>  
>  	/*
>  	 * Some portions of CPU state (e.g. PSTATE.{PAN,DIT}) are initialized
> @@ -121,6 +120,9 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
>  	 * Strictly speaking the trace_hardirqs_off() here is superfluous,
>  	 * hardirqs should be firmly off by now. This really ought to use
>  	 * something like raw_local_daif_save().
> +	 *
> +	 * This also unmasks interrupts in PMR in order to reliably
> +	 * resume if we're using pseudo-NMIs.
>  	 */
>  	flags = local_daif_save();
>  
> @@ -131,12 +133,6 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
>  	 */
>  	pause_graph_tracing();
>  
> -	/*
> -	 * Switch to using DAIF.IF instead of PMR in order to reliably
> -	 * resume if we're using pseudo-NMIs.
> -	 */
> -	arm_cpuidle_save_irq_context(&context);
> -
>  	ct_cpuidle_enter();
>  
>  	if (__cpu_suspend_enter(&state)) {
> @@ -159,8 +155,6 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
>  		__cpu_suspend_exit();
>  	}
>  
> -	arm_cpuidle_restore_irq_context(&context);

If we use pseudo-NMIs only, the behavior after simplification is also
consistent.

- initial PMR is GIC_PRIO_IRQOFF
- initial DAIF is 0

Then the original flow:

1、local_daif_save()：
   1)、As pmr != GIC_PRIO_IRQON, saved flags = “PSR_I_BIT | PSR_F_BIT”
   2)、set all DAIF bit and set PMR "GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET"

2、arm_cpuidle_save_irq_context()
   1)、save daif( all set) and pmr (GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET)
   2)、set daif to DAIF.IF set (daif all set) and pmr to "GIC_PRIO_IRQON
| GIC_PRIO_PSR_I_SET"  -> duplicate code

3、arm_cpuidle_restore_irq_context()
   1)、restore PMR to “GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET"
   2)、restore DAIF to all set.

4、local_daif_restore() restore saved flags(“PSR_I_BIT | PSR_F_BIT”)
   1)、set pmr to GIC_PRIO_IRQOFF
   2)、set daif to 0

After remove
arm_cpuidle_save_irq_context()/arm_cpuidle_restore_irq_context():

1、local_daif_save()：
   1)、As pmr != GIC_PRIO_IRQON, saved flags = “PSR_I_BIT | PSR_F_BIT”
   2)、set all DAIF bit and set PMR "GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET"

2、local_daif_restore() restore saved flags(“PSR_I_BIT | PSR_F_BIT”)
   1)、set pmr to GIC_PRIO_IRQOFF
   2）、set daif to 0

> -
>  	unpause_graph_tracing();
>  
>  	/*


