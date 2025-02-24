Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCFEC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 01:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEmpU6CxySYSJOx99iwbmfKn56SP3FGaigjsO4xV1Bw=; b=QujjjqF+I7Mz+Y85+wYYto6ypJ
	gEjZWFanuU6F4ZqW9NcUG/Cvh2/LP3W2GvkBrzd+4yRR1ygnt3m9KTBUz1O+VYrlZ7wVZfkZljCD3
	SeC0UdgC1N/0HPk4hQDOORWIvgH7Oki9HOtQvwnzBl9jLOi96Om0z3CbJnim/orR6uJuLrjA8YHBD
	eqrTlhqHpIQB3kxet5UsoVer/jmvtcC8QsbLHZHmPcPwtm2jOBRkdGBhJf52Pmf+6t74PWCwEuJiD
	8Gc6imQwbD9TNu4TC1M+GpthUkaktDjkfEU9muKTAG/4X9vc9T/z7FdQyJ+7S+bDW+78ILKZZBf9/
	inJ4SSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmNg3-0000000C65O-2EyJ;
	Mon, 24 Feb 2025 01:54:35 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmNeZ-0000000C5zN-16Eq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 01:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740361978; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=oEmpU6CxySYSJOx99iwbmfKn56SP3FGaigjsO4xV1Bw=;
	b=GUPZOygfQjKKaXISSKdPHlT6m9mCkj1WljoG9M2UWWRjuPytNh0IdDydUSyyppIWKForLMR9BKukr3HtRJdT9V7WLDxLiSJzrIHvmUPtbAmWAG6oNvnQwo/u+U00sOnWPAlvyojG077WpynDloORgeYPMYx2A7mg9bmrBFplusI=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WQ1RZA4_1740361975 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 24 Feb 2025 09:52:56 +0800
Message-ID: <f532b261-631f-41ac-813e-cb351eb1f8f3@linux.alibaba.com>
Date: Mon, 24 Feb 2025 09:52:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] perf/dwc_pcie: fix some unreleased resources
To: Yunhui Cui <cuiyunhui@bytedance.com>, renyu.zj@linux.alibaba.com,
 will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250220121716.50324-1-cuiyunhui@bytedance.com>
 <20250220121716.50324-2-cuiyunhui@bytedance.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250220121716.50324-2-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_175303_995790_7C34E7C7 
X-CRM114-Status: GOOD (  17.44  )
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



在 2025/2/20 20:17, Yunhui Cui 写道:
> Release leaked resources, such as plat_dev and dev_info.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   drivers/perf/dwc_pcie_pmu.c | 33 ++++++++++++++++++++++-----------
>   1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index cccecae9823f..19fa2ba8dd67 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -572,8 +572,10 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
>   		return PTR_ERR(plat_dev);
>   
>   	dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
> -	if (!dev_info)
> +	if (!dev_info) {
> +		platform_device_unregister(plat_dev);
>   		return -ENOMEM;
> +	}
>   
>   	/* Cache platform device to handle pci device hotplug */
>   	dev_info->plat_dev = plat_dev;
> @@ -730,6 +732,15 @@ static struct platform_driver dwc_pcie_pmu_driver = {
>   	.driver = {.name = "dwc_pcie_pmu",},
>   };
>   
> +static void dwc_pcie_cleanup_devices(void)
> +{
> +	struct dwc_pcie_dev_info *dev_info, *tmp;
> +
> +	list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, dev_node) {
> +		dwc_pcie_unregister_dev(dev_info);
> +	}
> +}
> +
>   static int __init dwc_pcie_pmu_init(void)
>   {
>   	struct pci_dev *pdev = NULL;
> @@ -742,7 +753,7 @@ static int __init dwc_pcie_pmu_init(void)
>   		ret = dwc_pcie_register_dev(pdev);
>   		if (ret) {
>   			pci_dev_put(pdev);
> -			return ret;
> +			goto err_cleanup;
>   		}
>   	}
>   
> @@ -751,35 +762,35 @@ static int __init dwc_pcie_pmu_init(void)
>   				      dwc_pcie_pmu_online_cpu,
>   				      dwc_pcie_pmu_offline_cpu);
>   	if (ret < 0)
> -		return ret;
> +		goto err_cleanup;
>   
>   	dwc_pcie_pmu_hp_state = ret;
>   
>   	ret = platform_driver_register(&dwc_pcie_pmu_driver);
>   	if (ret)
> -		goto platform_driver_register_err;
> +		goto err_remove_cpuhp;
>   
>   	ret = bus_register_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
>   	if (ret)
> -		goto platform_driver_register_err;
> +		goto err_unregister_driver;
>   	notify = true;
>   
>   	return 0;
>   
> -platform_driver_register_err:
> +err_unregister_driver:
> +	platform_driver_unregister(&dwc_pcie_pmu_driver);
> +err_remove_cpuhp:
>   	cpuhp_remove_multi_state(dwc_pcie_pmu_hp_state);
> -
> +err_cleanup:
> +	dwc_pcie_cleanup_devices();
>   	return ret;
>   }
>   
>   static void __exit dwc_pcie_pmu_exit(void)
>   {
> -	struct dwc_pcie_dev_info *dev_info, *tmp;
> -
>   	if (notify)
>   		bus_unregister_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
> -	list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, dev_node)
> -		dwc_pcie_unregister_dev(dev_info);
> +	dwc_pcie_cleanup_devices();
>   	platform_driver_unregister(&dwc_pcie_pmu_driver);
>   	cpuhp_remove_multi_state(dwc_pcie_pmu_hp_state);
>   }


LGTM. Thanks.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Shuai

