Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D29EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 03:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVnYeGBlDBGrhVKk0r+EaTVkrquS1ikN6rg11Ll70/k=; b=3NdroTVpIu3fzbdvpHCknrPR9b
	KBi8tzLRFNncvNMbovuMjOaiisWUdOzivH8SzMOIdiQXHMRQw0NZUmBILlSb03vksI/91s+ym1ygn
	/Two7jtf8iehwHRrfBG5amYsafsboJd8Ywhkhq0W3o9aJIrwRqfoR9zqjmI2zG6h0fLEaQQdhlchg
	NSO0JTkHDiWr50bPd+LGM45h2/kVR0IFP6NIkFtDZwjATgawG1mDaUU0oOiPWY+/8Gsl4qlMDQYH6
	iNy40RnlcMtf4xE9TajWycp7Ujebo9oXcj/fm/Y5u0g1CVRiZ9eiKgZXf/BMg+SMqiADqYQazlVcN
	Zw1reeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuUL-00000004Yk2-0yZE;
	Tue, 24 Jun 2025 03:38:25 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTtSl-00000004UFt-0pIb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 02:32:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bR88126JLz29dp4;
	Tue, 24 Jun 2025 10:30:57 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 92A55140276;
	Tue, 24 Jun 2025 10:32:33 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemo100006.china.huawei.com
 (7.202.195.47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Jun
 2025 10:32:32 +0800
Message-ID: <04d85016-31db-b451-30d0-345b3984e070@hisilicon.com>
Date: Tue, 24 Jun 2025 10:32:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RESEND PATCH v2 2/2] arm64/watchdog_hld: Add a cpufreq notifier
 for update watchdog thresh
To: Yicong Yang <yangyicong@huawei.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <akpm@linux-foundation.org>, <dianders@chromium.org>,
	<sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<yangyicong@hisilicon.com>, <linuxarm@huawei.com>
References: <20250619114805.16968-1-yangyicong@huawei.com>
 <20250619114805.16968-3-yangyicong@huawei.com>
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20250619114805.16968-3-yangyicong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_193243_605275_34FFB6AB 
X-CRM114-Status: GOOD (  20.60  )
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



On 19/06/2025 19:48, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> arm64 depends on the cpufreq driver to gain the maximum cpu frequency
> to convert the watchdog_thresh to perf event period. cpufreq drivers
> like cppc_cpufreq will be initialized lately after the initializing of
> the hard lockup detector so just use a safe cpufreq which will be
> inaccurency. Use a cpufreq notifier to adjust the event's period to
> a more accurate one.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/arm64/kernel/watchdog_hld.c | 58 ++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)

In general, this makes the watchdog period closer to the expected.
The actual period might be longer if the cpu maxfreq is lowered down later,
or shorter if boost is turned on later.
LGTM as it's anyhow better than a fixed 5GHz.

Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>

> 
> diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
> index dcd25322127c..e55548cb26df 100644
> --- a/arch/arm64/kernel/watchdog_hld.c
> +++ b/arch/arm64/kernel/watchdog_hld.c
> @@ -34,3 +34,61 @@ bool __init arch_perf_nmi_is_available(void)
>  	 */
>  	return arm_pmu_irq_is_nmi();
>  }
> +
> +static int watchdog_perf_update_period(void *data)
> +{
> +	int cpu = raw_smp_processor_id();
> +	u64 max_cpu_freq, new_period;
> +
> +	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
> +	if (!max_cpu_freq)
> +		return 0;
> +
> +	new_period = watchdog_thresh * max_cpu_freq;
> +	hardlockup_detector_perf_adjust_period(cpu, new_period);
> +
> +	return 0;
> +}
> +
> +static int watchdog_freq_notifier_callback(struct notifier_block *nb,
> +					   unsigned long val, void *data)
> +{
> +	struct cpufreq_policy *policy = data;
> +	int cpu;
> +
> +	if (val != CPUFREQ_CREATE_POLICY)
> +		return NOTIFY_DONE;
> +
> +	/*
> +	 * Let each online CPU related to the policy update the period by their
> +	 * own. This will serialize with the framework on start/stop the lockup
> +	 * detector (softlockup_{start,stop}_all) and avoid potential race
> +	 * condition. Otherwise we may have below theoretical race condition:
> +	 * (core 0/1 share the same policy)
> +	 * [core 0]                      [core 1]
> +	 *                               hardlockup_detector_event_create()
> +	 *                                 hw_nmi_get_sample_period()
> +	 * (cpufreq registered, notifier callback invoked)
> +	 * watchdog_freq_notifier_callback()
> +	 *   watchdog_perf_update_period()
> +	 *   (since core 1's event's not yet created,
> +	 *    the period is not set)
> +	 *                                 perf_event_create_kernel_counter()
> +	 *                                 (event's period is SAFE_MAX_CPU_FREQ)
> +	 */
> +	for_each_cpu(cpu, policy->cpus)
> +		smp_call_on_cpu(cpu, watchdog_perf_update_period, NULL, false);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block watchdog_freq_notifier = {
> +	.notifier_call = watchdog_freq_notifier_callback,
> +};
> +
> +static int __init init_watchdog_freq_notifier(void)
> +{
> +	return cpufreq_register_notifier(&watchdog_freq_notifier,
> +					 CPUFREQ_POLICY_NOTIFIER);
> +}
> +core_initcall(init_watchdog_freq_notifier);

