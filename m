Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D1AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/R3Kj5RxKyC/KhlER84FuFknlFZZ9Jz1nTNe4KZCi4=; b=zUrhYL91jd5j/w4Z3nHdiXFcoM
	NfxunpgJRnlAOnC8lMsKG0HRocyO9jqWJG8afq7DejDt/pjVsRNTLxHP+JU1YwXYJuTqFqehbwq1j
	Xa8nHEOWQYdLAFNH5xlSOVtNkM0+E8M9fmqYd5RIHzkoTcfPTPR+t3x5cYio2eYlJ1KW8mvr17Qrt
	HpmKzy3N7/vxV7j+dqB71CMhqwVgUINPuePucI847ymYBOHyt5zaREguYURA+GYiZCW7tz8Wo3s+V
	I11FPwDc0dlzyDRlpk7iTJF1ztsqy9QVvEQQXn8WgtSUb0mcQjRQ0UZ6RXVaMMKkhtJ7+zw69rQeo
	oPIY1yBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKeo-00000002jMp-2Blm;
	Mon, 27 Jul 2026 12:42:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKek-00000002jMF-1CKH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:42:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD996143D;
	Mon, 27 Jul 2026 05:42:00 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70B2D3F86F;
	Mon, 27 Jul 2026 05:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785156124; bh=Q/Yl5c+2WfRxE1k8ZJXuSivHBIVDIXpw5VTOGvFhATE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IJDhamNOsp0IYmwWwvsTuJ40uSpCHis0I81coHpEN/RI02UVdFEHgiK7pTXry15YS
	 PuCBg0bjbwCTFnJuNqrsJA9GCdIIlE17m9iCUkbjTBcEY9qz7E8z6E2HPKGEMZLvY2
	 5FOZNf9fj72h/tACQmBpAtOeD4YaJer7wPDMERG4=
Message-ID: <18bd7977-c0d2-47c0-aaa4-a787ef935597@arm.com>
Date: Mon, 27 Jul 2026 13:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drivers/perf: hisi: Consolidate uncore PMU cpuhp
 states
To: Yushan Wang <wangyushan12@huawei.com>, will@kernel.org,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: u.kleine-koenig@baylibre.com, linuxarm@huawei.com,
 liuyonglong@huawei.com, prime.zeng@hisilicon.com, wangzhou1@hisilicon.com,
 wuyifan50@huawei.com
References: <20260724025238.3411328-1-wangyushan12@huawei.com>
 <20260724025238.3411328-2-wangyushan12@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260724025238.3411328-2-wangyushan12@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_054206_490199_9AAFF818 
X-CRM114-Status: GOOD (  24.41  )
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

On 24/07/2026 3:52 am, Yushan Wang wrote:
> Every HiSilicon uncore PMU driver allocates its own static cpuhp state
> even though they all register identical online/offline callbacks. This
> wastes slots in the cpuhp state enum and needlessly fragments the
> hotplug state space.
> 
> Move the cpuhp state setup into the shared hisi_uncore_pmu framework:
> register a single dynamic state (CPUHP_AP_ONLINE_DYN) at framework
> module init and export it for all HiSilicon uncore PMU drivers to use.
> Drop the now-unused static CPUHP_AP_PERF_ARM_HISI_* entries from
> include/linux/cpuhotplug.h.
> 
> The L3C PMU driver keeps a private dynamic state because it has its own
> hotplug callbacks for migrating multiple per-CPU interrupt affinities,
> but switches from its former static slot to CPUHP_AP_ONLINE_DYN for
> consistency.
> 
> No intended functional changes.
> 
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>   drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  | 34 +++---------------
>   drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 34 +++---------------
>   drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  | 34 +++---------------
>   drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  | 21 +++++------
>   drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   | 35 ++----------------
>   drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  | 35 ++----------------
>   drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   | 34 +++---------------
>   drivers/perf/hisilicon/hisi_uncore_pmu.c      | 25 +++++++++++++
>   drivers/perf/hisilicon/hisi_uncore_pmu.h      |  2 ++
>   drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 34 +++---------------
>   drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   | 36 ++-----------------
>   include/linux/cpuhotplug.h                    |  6 ----
>   12 files changed, 67 insertions(+), 263 deletions(-)

Neat! Seems like a pretty nice win already, plus it only makes a 
conversion easier if my generic hotplug idea takes off :)

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> diff --git a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
> index b879b81adfdd..83967725c51c 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
> @@ -295,7 +295,7 @@ static int hisi_cpa_pmu_probe(struct platform_device *pdev)
>   
>   	/* Power Management should be disabled before using CPA PMU. */
>   	hisi_cpa_pmu_disable_pm(cpa_pmu);
> -	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE,
> +	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state,
>   				       &cpa_pmu->node);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
> @@ -307,7 +307,7 @@ static int hisi_cpa_pmu_probe(struct platform_device *pdev)
>   	if (ret) {
>   		dev_err(cpa_pmu->dev, "PMU register failed\n");
>   		cpuhp_state_remove_instance_nocalls(
> -			CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE, &cpa_pmu->node);
> +			hisi_uncore_pmu_cpuhp_state, &cpa_pmu->node);
>   		hisi_cpa_pmu_enable_pm(cpa_pmu);
>   		return ret;
>   	}
> @@ -321,7 +321,7 @@ static void hisi_cpa_pmu_remove(struct platform_device *pdev)
>   	struct hisi_pmu *cpa_pmu = platform_get_drvdata(pdev);
>   
>   	perf_pmu_unregister(&cpa_pmu->pmu);
> -	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE,
> +	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
>   					    &cpa_pmu->node);
>   	hisi_cpa_pmu_enable_pm(cpa_pmu);
>   }
> @@ -336,33 +336,7 @@ static struct platform_driver hisi_cpa_pmu_driver = {
>   	.remove = hisi_cpa_pmu_remove,
>   };
>   
> -static int __init hisi_cpa_pmu_module_init(void)
> -{
> -	int ret;
> -
> -	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE,
> -				      "AP_PERF_ARM_HISI_CPA_ONLINE",
> -				      hisi_uncore_pmu_online_cpu,
> -				      hisi_uncore_pmu_offline_cpu);
> -	if (ret) {
> -		pr_err("setup hotplug failed: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = platform_driver_register(&hisi_cpa_pmu_driver);
> -	if (ret)
> -		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE);
> -
> -	return ret;
> -}
> -module_init(hisi_cpa_pmu_module_init);
> -
> -static void __exit hisi_cpa_pmu_module_exit(void)
> -{
> -	platform_driver_unregister(&hisi_cpa_pmu_driver);
> -	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE);
> -}
> -module_exit(hisi_cpa_pmu_module_exit);
> +module_platform_driver(hisi_cpa_pmu_driver);
>   
>   MODULE_IMPORT_NS("HISI_PMU");
>   MODULE_DESCRIPTION("HiSilicon SoC CPA PMU driver");
> diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
> index 21c494881ca0..e905160523ee 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
> @@ -401,7 +401,7 @@ static int hisi_ddrc_pmu_probe(struct platform_device *pdev)
>   	if (!name)
>   		return -ENOMEM;
>   
> -	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE,
> +	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state,
>   				       &ddrc_pmu->node);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Error %d registering hotplug;\n", ret);
> @@ -414,7 +414,7 @@ static int hisi_ddrc_pmu_probe(struct platform_device *pdev)
>   	if (ret) {
>   		dev_err(ddrc_pmu->dev, "DDRC PMU register failed!\n");
>   		cpuhp_state_remove_instance_nocalls(
> -			CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE, &ddrc_pmu->node);
> +			hisi_uncore_pmu_cpuhp_state, &ddrc_pmu->node);
>   	}
>   
>   	return ret;
> @@ -425,7 +425,7 @@ static void hisi_ddrc_pmu_remove(struct platform_device *pdev)
>   	struct hisi_pmu *ddrc_pmu = platform_get_drvdata(pdev);
>   
>   	perf_pmu_unregister(&ddrc_pmu->pmu);
> -	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE,
> +	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
>   					    &ddrc_pmu->node);
>   }
>   
> @@ -501,33 +501,7 @@ static struct platform_driver hisi_ddrc_pmu_driver = {
>   	.remove = hisi_ddrc_pmu_remove,
>   };
>   
> -static int __init hisi_ddrc_pmu_module_init(void)
> -{
> -	int ret;
> -
> -	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE,
> -				      "AP_PERF_ARM_HISI_DDRC_ONLINE",
> -				      hisi_uncore_pmu_online_cpu,
> -				      hisi_uncore_pmu_offline_cpu);
> -	if (ret) {
> -		pr_err("DDRC PMU: setup hotplug, ret = %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = platform_driver_register(&hisi_ddrc_pmu_driver);
> -	if (ret)
> -		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE);
> -
> -	return ret;
> -}
> -module_init(hisi_ddrc_pmu_module_init);
> -
> -static void __exit hisi_ddrc_pmu_module_exit(void)
> -{
> -	platform_driver_unregister(&hisi_ddrc_pmu_driver);
> -	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE);
> -}
> -module_exit(hisi_ddrc_pmu_module_exit);
> +module_platform_driver(hisi_ddrc_pmu_driver);
>   
>   MODULE_IMPORT_NS("HISI_PMU");
>   MODULE_DESCRIPTION("HiSilicon SoC DDRC uncore PMU driver");
> diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
> index 97cfaa586a87..93a250b7abb8 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
> @@ -490,7 +490,7 @@ static int hisi_hha_pmu_probe(struct platform_device *pdev)
>   	if (!name)
>   		return -ENOMEM;
>   
> -	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE,
> +	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state,
>   				       &hha_pmu->node);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
> @@ -503,7 +503,7 @@ static int hisi_hha_pmu_probe(struct platform_device *pdev)
>   	if (ret) {
>   		dev_err(hha_pmu->dev, "HHA PMU register failed!\n");
>   		cpuhp_state_remove_instance_nocalls(
> -			CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE, &hha_pmu->node);
> +			hisi_uncore_pmu_cpuhp_state, &hha_pmu->node);
>   	}
>   
>   	return ret;
> @@ -514,7 +514,7 @@ static void hisi_hha_pmu_remove(struct platform_device *pdev)
>   	struct hisi_pmu *hha_pmu = platform_get_drvdata(pdev);
>   
>   	perf_pmu_unregister(&hha_pmu->pmu);
> -	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE,
> +	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
>   					    &hha_pmu->node);
>   }
>   
> @@ -528,33 +528,7 @@ static struct platform_driver hisi_hha_pmu_driver = {
>   	.remove = hisi_hha_pmu_remove,
>   };
>   
> -static int __init hisi_hha_pmu_module_init(void)
> -{
> -	int ret;
> -
> -	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE,
> -				      "AP_PERF_ARM_HISI_HHA_ONLINE",
> -				      hisi_uncore_pmu_online_cpu,
> -				      hisi_uncore_pmu_offline_cpu);
> -	if (ret) {
> -		pr_err("HHA PMU: Error setup hotplug, ret = %d;\n", ret);
> -		return ret;
> -	}
> -
> -	ret = platform_driver_register(&hisi_hha_pmu_driver);
> -	if (ret)
> -		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE);
> -
> -	return ret;
> -}
> -module_init(hisi_hha_pmu_module_init);
> -
> -static void __exit hisi_hha_pmu_module_exit(void)
> -{
> -	platform_driver_unregister(&hisi_hha_pmu_driver);
> -	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE);
> -}
> -module_exit(hisi_hha_pmu_module_exit);
> +module_platform_driver(hisi_hha_pmu_driver);
>   
>   MODULE_IMPORT_NS("HISI_PMU");
>   MODULE_DESCRIPTION("HiSilicon SoC HHA uncore PMU driver");
> diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> index f963e4f9e552..0b78a0e094dd 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> @@ -93,6 +93,8 @@ struct hisi_l3c_pmu_ext {
>   	bool support_ext;
>   };
>   
> +static enum cpuhp_state hisi_l3c_pmu_cpuhp_state;
> +
>   static bool support_ext(struct hisi_l3c_pmu *pmu)
>   {
>   	struct hisi_l3c_pmu_ext *l3c_pmu_ext = pmu->l3c_pmu.dev_info->private;
> @@ -845,8 +847,7 @@ static int hisi_l3c_pmu_probe(struct platform_device *pdev)
>   	if (!name)
>   		return -ENOMEM;
>   
> -	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_L3_ONLINE,
> -				       &l3c_pmu->node);
> +	ret = cpuhp_state_add_instance(hisi_l3c_pmu_cpuhp_state, &l3c_pmu->node);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
>   		return ret;
> @@ -858,7 +859,7 @@ static int hisi_l3c_pmu_probe(struct platform_device *pdev)
>   	if (ret) {
>   		dev_err(l3c_pmu->dev, "L3C PMU register failed!\n");
>   		cpuhp_state_remove_instance_nocalls(
> -			CPUHP_AP_PERF_ARM_HISI_L3_ONLINE, &l3c_pmu->node);
> +			hisi_l3c_pmu_cpuhp_state, &l3c_pmu->node);
>   	}
>   
>   	return ret;
> @@ -869,7 +870,7 @@ static void hisi_l3c_pmu_remove(struct platform_device *pdev)
>   	struct hisi_pmu *l3c_pmu = platform_get_drvdata(pdev);
>   
>   	perf_pmu_unregister(&l3c_pmu->pmu);
> -	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_L3_ONLINE,
> +	cpuhp_state_remove_instance_nocalls(hisi_l3c_pmu_cpuhp_state,
>   					    &l3c_pmu->node);
>   }
>   
> @@ -939,20 +940,20 @@ static int hisi_l3c_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
>   
>   static int __init hisi_l3c_pmu_module_init(void)
>   {
> -	int ret;
> -
> -	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_L3_ONLINE,
> +	int ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>   				      "AP_PERF_ARM_HISI_L3_ONLINE",
>   				      hisi_l3c_pmu_online_cpu,
>   				      hisi_l3c_pmu_offline_cpu);
> -	if (ret) {
> +	if (ret < 0) {
>   		pr_err("L3C PMU: Error setup hotplug, ret = %d\n", ret);
>   		return ret;
>   	}
>   
> +	hisi_l3c_pmu_cpuhp_state = ret;
> +
>   	ret = platform_driver_register(&hisi_l3c_pmu_driver);
>   	if (ret)
> -		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_L3_ONLINE);
> +		cpuhp_remove_multi_state(hisi_l3c_pmu_cpuhp_state);
>   
>   	return ret;
>   }
> @@ -961,7 +962,7 @@ module_init(hisi_l3c_pmu_module_init);
>   static void __exit hisi_l3c_pmu_module_exit(void)
>   {
>   	platform_driver_unregister(&hisi_l3c_pmu_driver);
> -	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_L3_ONLINE);
> +	cpuhp_remove_multi_state(hisi_l3c_pmu_cpuhp_state);
>   }
>   module_exit(hisi_l3c_pmu_module_exit);
>   
> diff --git a/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c b/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
> index 246cc0333099..ad898153ff49 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
> @@ -13,9 +13,6 @@
>   
>   #include "hisi_uncore_pmu.h"
>   
> -/* Dynamic CPU hotplug state used by MN PMU */
> -static enum cpuhp_state hisi_mn_pmu_online;
> -
>   /* MN register definition */
>   #define HISI_MN_DYNAMIC_CTRL_REG	0x400
>   #define   HISI_MN_DYNAMIC_CTRL_EN	BIT(0)
> @@ -291,7 +288,7 @@ static int hisi_mn_pmu_dev_init(struct platform_device *pdev,
>   
>   static void hisi_mn_pmu_remove_cpuhp(void *hotplug_node)
>   {
> -	cpuhp_state_remove_instance_nocalls(hisi_mn_pmu_online, hotplug_node);
> +	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state, hotplug_node);
>   }
>   
>   static void hisi_mn_pmu_unregister(void *pmu)
> @@ -320,7 +317,7 @@ static int hisi_mn_pmu_probe(struct platform_device *pdev)
>   	if (!name)
>   		return -ENOMEM;
>   
> -	ret = cpuhp_state_add_instance(hisi_mn_pmu_online, &mn_pmu->node);
> +	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state, &mn_pmu->node);
>   	if (ret)
>   		return dev_err_probe(&pdev->dev, ret, "Failed to register cpu hotplug\n");
>   
> @@ -376,33 +373,7 @@ static struct platform_driver hisi_mn_pmu_driver = {
>   	.probe = hisi_mn_pmu_probe,
>   };
>   
> -static int __init hisi_mn_pmu_module_init(void)
> -{
> -	int ret;
> -
> -	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "perf/hisi/mn:online",
> -				      hisi_uncore_pmu_online_cpu,
> -				      hisi_uncore_pmu_offline_cpu);
> -	if (ret < 0) {
> -		pr_err("hisi_mn_pmu: Failed to setup MN PMU hotplug: %d\n", ret);
> -		return ret;
> -	}
> -	hisi_mn_pmu_online = ret;
> -
> -	ret = platform_driver_register(&hisi_mn_pmu_driver);
> -	if (ret)
> -		cpuhp_remove_multi_state(hisi_mn_pmu_online);
> -
> -	return ret;
> -}
> -module_init(hisi_mn_pmu_module_init);
> -
> -static void __exit hisi_mn_pmu_module_exit(void)
> -{
> -	platform_driver_unregister(&hisi_mn_pmu_driver);
> -	cpuhp_remove_multi_state(hisi_mn_pmu_online);
> -}
> -module_exit(hisi_mn_pmu_module_exit);
> +module_platform_driver(hisi_mn_pmu_driver);
>   
>   MODULE_IMPORT_NS("HISI_PMU");
>   MODULE_DESCRIPTION("HiSilicon SoC MN uncore PMU driver");
> diff --git a/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
> index 616f4af57db7..abf44fa46d17 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
> @@ -41,9 +41,6 @@
>   HISI_PMU_EVENT_ATTR_EXTRACTOR(ch, config1, 2, 0);
>   HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_en, config1, 3, 3);
>   
> -/* Dynamic CPU hotplug state used by this PMU driver */
> -static enum cpuhp_state hisi_noc_pmu_cpuhp_state;
> -
>   struct hisi_noc_pmu_regs {
>   	u32 version;
>   	u32 pmu_ctrl;
> @@ -324,7 +321,7 @@ static int hisi_noc_pmu_dev_init(struct platform_device *pdev, struct hisi_pmu *
>   
>   static void hisi_noc_pmu_remove_cpuhp_instance(void *hotplug_node)
>   {
> -	cpuhp_state_remove_instance_nocalls(hisi_noc_pmu_cpuhp_state, hotplug_node);
> +	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state, hotplug_node);
>   }
>   
>   static void hisi_noc_pmu_unregister_pmu(void *pmu)
> @@ -353,7 +350,7 @@ static int hisi_noc_pmu_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = cpuhp_state_add_instance(hisi_noc_pmu_cpuhp_state, &noc_pmu->node);
> +	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state, &noc_pmu->node);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Fail to register cpuhp instance\n");
>   
> @@ -408,33 +405,7 @@ static struct platform_driver hisi_noc_pmu_driver = {
>   	.probe = hisi_noc_pmu_probe,
>   };
>   
> -static int __init hisi_noc_pmu_module_init(void)
> -{
> -	int ret;
> -
> -	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "perf/hisi/noc:online",
> -				      hisi_uncore_pmu_online_cpu,
> -				      hisi_uncore_pmu_offline_cpu);
> -	if (ret < 0) {
> -		pr_err("hisi_noc_pmu: Fail to setup cpuhp callbacks, ret = %d\n", ret);
> -		return ret;
> -	}
> -	hisi_noc_pmu_cpuhp_state = ret;
> -
> -	ret = platform_driver_register(&hisi_noc_pmu_driver);
> -	if (ret)
> -		cpuhp_remove_multi_state(hisi_noc_pmu_cpuhp_state);
> -
> -	return ret;
> -}
> -module_init(hisi_noc_pmu_module_init);
> -
> -static void __exit hisi_noc_pmu_module_exit(void)
> -{
> -	platform_driver_unregister(&hisi_noc_pmu_driver);
> -	cpuhp_remove_multi_state(hisi_noc_pmu_cpuhp_state);
> -}
> -module_exit(hisi_noc_pmu_module_exit);
> +module_platform_driver(hisi_noc_pmu_driver);
>   
>   MODULE_IMPORT_NS("HISI_PMU");
>   MODULE_DESCRIPTION("HiSilicon SoC Uncore NoC PMU driver");
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
> index 80108c63cb60..3d1e0af64260 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
> @@ -468,7 +468,7 @@ static int hisi_pa_pmu_probe(struct platform_device *pdev)
>   	if (!name)
>   		return -ENOMEM;
>   
> -	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE,
> +	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state,
>   				       &pa_pmu->node);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
> @@ -479,7 +479,7 @@ static int hisi_pa_pmu_probe(struct platform_device *pdev)
>   	ret = perf_pmu_register(&pa_pmu->pmu, name, -1);
>   	if (ret) {
>   		dev_err(pa_pmu->dev, "PMU register failed, ret = %d\n", ret);
> -		cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE,
> +		cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
>   						    &pa_pmu->node);
>   		return ret;
>   	}
> @@ -493,7 +493,7 @@ static void hisi_pa_pmu_remove(struct platform_device *pdev)
>   	struct hisi_pmu *pa_pmu = platform_get_drvdata(pdev);
>   
>   	perf_pmu_unregister(&pa_pmu->pmu);
> -	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE,
> +	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
>   					    &pa_pmu->node);
>   }
>   
> @@ -515,33 +515,7 @@ static struct platform_driver hisi_pa_pmu_driver = {
>   	.remove = hisi_pa_pmu_remove,
>   };
>   
> -static int __init hisi_pa_pmu_module_init(void)
> -{
> -	int ret;
> -
> -	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE,
> -				      "AP_PERF_ARM_HISI_PA_ONLINE",
> -				      hisi_uncore_pmu_online_cpu,
> -				      hisi_uncore_pmu_offline_cpu);
> -	if (ret) {
> -		pr_err("PA PMU: cpuhp state setup failed, ret = %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = platform_driver_register(&hisi_pa_pmu_driver);
> -	if (ret)
> -		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE);
> -
> -	return ret;
> -}
> -module_init(hisi_pa_pmu_module_init);
> -
> -static void __exit hisi_pa_pmu_module_exit(void)
> -{
> -	platform_driver_unregister(&hisi_pa_pmu_driver);
> -	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE);
> -}
> -module_exit(hisi_pa_pmu_module_exit);
> +module_platform_driver(hisi_pa_pmu_driver);
>   
>   MODULE_IMPORT_NS("HISI_PMU");
>   MODULE_DESCRIPTION("HiSilicon Protocol Adapter uncore PMU driver");
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> index de71dcf11653..276785a79ae9 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> @@ -23,6 +23,9 @@
>   
>   #define HISI_MAX_PERIOD(nr) (GENMASK_ULL((nr) - 1, 0))
>   
> +enum cpuhp_state hisi_uncore_pmu_cpuhp_state;
> +EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_cpuhp_state, "HISI_PMU");
> +
>   /*
>    * PMU event attributes
>    */
> @@ -621,5 +624,27 @@ void hisi_pmu_init(struct hisi_pmu *hisi_pmu, struct module *module)
>   }
>   EXPORT_SYMBOL_NS_GPL(hisi_pmu_init, "HISI_PMU");
>   
> +static int __init hisi_uncore_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "perf/hisi/uncore:online",
> +				      hisi_uncore_pmu_online_cpu,
> +				      hisi_uncore_pmu_offline_cpu);
> +	if (ret < 0)
> +		return ret;
> +
> +	hisi_uncore_pmu_cpuhp_state = ret;
> +
> +	return 0;
> +}
> +module_init(hisi_uncore_pmu_init);
> +
> +static void __exit hisi_uncore_pmu_exit(void)
> +{
> +	cpuhp_remove_multi_state(hisi_uncore_pmu_cpuhp_state);
> +}
> +module_exit(hisi_uncore_pmu_exit);
> +
>   MODULE_DESCRIPTION("HiSilicon SoC uncore Performance Monitor driver framework");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> index 3ffe6acda653..e5a4b3898865 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> @@ -171,4 +171,6 @@ int hisi_uncore_pmu_init_irq(struct hisi_pmu *hisi_pmu,
>   void hisi_uncore_pmu_init_topology(struct hisi_pmu *hisi_pmu, struct device *dev);
>   
>   void hisi_pmu_init(struct hisi_pmu *hisi_pmu, struct module *module);
> +
> +extern enum cpuhp_state hisi_uncore_pmu_cpuhp_state;
>   #endif /* __HISI_UNCORE_PMU_H__ */
> diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
> index cd32d606df05..d01340ff2e5c 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
> @@ -503,7 +503,7 @@ static int hisi_sllc_pmu_probe(struct platform_device *pdev)
>   	if (!name)
>   		return -ENOMEM;
>   
> -	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE,
> +	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state,
>   				       &sllc_pmu->node);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
> @@ -515,7 +515,7 @@ static int hisi_sllc_pmu_probe(struct platform_device *pdev)
>   	ret = perf_pmu_register(&sllc_pmu->pmu, name, -1);
>   	if (ret) {
>   		dev_err(sllc_pmu->dev, "PMU register failed, ret = %d\n", ret);
> -		cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE,
> +		cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
>   						    &sllc_pmu->node);
>   		return ret;
>   	}
> @@ -530,7 +530,7 @@ static void hisi_sllc_pmu_remove(struct platform_device *pdev)
>   	struct hisi_pmu *sllc_pmu = platform_get_drvdata(pdev);
>   
>   	perf_pmu_unregister(&sllc_pmu->pmu);
> -	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE,
> +	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
>   					    &sllc_pmu->node);
>   }
>   
> @@ -551,33 +551,7 @@ static struct platform_driver hisi_sllc_pmu_driver = {
>   	.remove = hisi_sllc_pmu_remove,
>   };
>   
> -static int __init hisi_sllc_pmu_module_init(void)
> -{
> -	int ret;
> -
> -	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE,
> -				      "AP_PERF_ARM_HISI_SLLC_ONLINE",
> -				      hisi_uncore_pmu_online_cpu,
> -				      hisi_uncore_pmu_offline_cpu);
> -	if (ret) {
> -		pr_err("SLLC PMU: cpuhp state setup failed, ret = %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = platform_driver_register(&hisi_sllc_pmu_driver);
> -	if (ret)
> -		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE);
> -
> -	return ret;
> -}
> -module_init(hisi_sllc_pmu_module_init);
> -
> -static void __exit hisi_sllc_pmu_module_exit(void)
> -{
> -	platform_driver_unregister(&hisi_sllc_pmu_driver);
> -	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE);
> -}
> -module_exit(hisi_sllc_pmu_module_exit);
> +module_platform_driver(hisi_sllc_pmu_driver);
>   
>   MODULE_IMPORT_NS("HISI_PMU");
>   MODULE_DESCRIPTION("HiSilicon SLLC uncore PMU driver");
> diff --git a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
> index e8186b6e1687..b4d017a5d688 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
> @@ -13,9 +13,6 @@
>   
>   #include "hisi_uncore_pmu.h"
>   
> -/* Dynamic CPU hotplug state used by UC PMU */
> -static enum cpuhp_state hisi_uc_pmu_online;
> -
>   /* UC register definition */
>   #define HISI_UC_INT_MASK_REG		0x0800
>   #define HISI_UC_INT_STS_REG		0x0808
> @@ -488,7 +485,7 @@ static int hisi_uc_pmu_dev_probe(struct platform_device *pdev,
>   
>   static void hisi_uc_pmu_remove_cpuhp_instance(void *hotplug_node)
>   {
> -	cpuhp_state_remove_instance_nocalls(hisi_uc_pmu_online, hotplug_node);
> +	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state, hotplug_node);
>   }
>   
>   static void hisi_uc_pmu_unregister_pmu(void *pmu)
> @@ -518,7 +515,7 @@ static int hisi_uc_pmu_probe(struct platform_device *pdev)
>   	if (!name)
>   		return -ENOMEM;
>   
> -	ret = cpuhp_state_add_instance(hisi_uc_pmu_online, &uc_pmu->node);
> +	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state, &uc_pmu->node);
>   	if (ret)
>   		return dev_err_probe(&pdev->dev, ret, "Error registering hotplug\n");
>   
> @@ -559,34 +556,7 @@ static struct platform_driver hisi_uc_pmu_driver = {
>   	.probe = hisi_uc_pmu_probe,
>   };
>   
> -static int __init hisi_uc_pmu_module_init(void)
> -{
> -	int ret;
> -
> -	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> -				      "perf/hisi/uc:online",
> -				      hisi_uncore_pmu_online_cpu,
> -				      hisi_uncore_pmu_offline_cpu);
> -	if (ret < 0) {
> -		pr_err("UC PMU: Error setup hotplug, ret = %d\n", ret);
> -		return ret;
> -	}
> -	hisi_uc_pmu_online = ret;
> -
> -	ret = platform_driver_register(&hisi_uc_pmu_driver);
> -	if (ret)
> -		cpuhp_remove_multi_state(hisi_uc_pmu_online);
> -
> -	return ret;
> -}
> -module_init(hisi_uc_pmu_module_init);
> -
> -static void __exit hisi_uc_pmu_module_exit(void)
> -{
> -	platform_driver_unregister(&hisi_uc_pmu_driver);
> -	cpuhp_remove_multi_state(hisi_uc_pmu_online);
> -}
> -module_exit(hisi_uc_pmu_module_exit);
> +module_platform_driver(hisi_uc_pmu_driver);
>   
>   MODULE_IMPORT_NS("HISI_PMU");
>   MODULE_DESCRIPTION("HiSilicon SoC UC uncore PMU driver");
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 0fb3a2a62eb0..965d6ce02a29 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -210,12 +210,6 @@ enum cpuhp_state {
>   	CPUHP_AP_PERF_S390_SF_ONLINE,
>   	CPUHP_AP_PERF_ARM_CCI_ONLINE,
>   	CPUHP_AP_PERF_ARM_CCN_ONLINE,
> -	CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE,
> -	CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE,
> -	CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE,
> -	CPUHP_AP_PERF_ARM_HISI_L3_ONLINE,
> -	CPUHP_AP_PERF_ARM_HISI_PA_ONLINE,
> -	CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE,
>   	CPUHP_AP_PERF_ARM_HISI_PCIE_PMU_ONLINE,
>   	CPUHP_AP_PERF_ARM_HNS3_PMU_ONLINE,
>   	CPUHP_AP_PERF_ARM_L2X0_ONLINE,


