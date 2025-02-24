Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C07C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 01:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Mgf5q6qhRBmuSgAe02ZdEG2nF1QbJDMGd3ly1/yKPM=; b=wncsMm1njyg1NkWeRGnwUC1shs
	b9asrPbCRX+zqDNQu48bBWzB0r2KnNBBRVnTvsIv2rJL+pFwqWSNN/HMjL/AQEIWBB0K2H4tkxuAN
	dzCrCCjqpbsBzDbAiMgsj5R06pXR4oqhTwDvbPrUShtgpO3wXkzHPr5O/CapmRaPbXHP9LdrsIuvE
	fyUNAb7WBj0E35P9hd9/089mg0f9P83dlTTmwZr819ZPpBDB6iHCSe1Ezq1jyY2JYd6LzCqgFM8gB
	fz4GncsLDa70+q+OpF8MTwZYk3ywGhhHgQi0+8XkbIdrribc3+xJYnnyCFFItlS24ulkOaUI5xqeB
	sqnte1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmNhV-0000000C6Ls-17n6;
	Mon, 24 Feb 2025 01:56:05 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmNfj-0000000C63P-3cIO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 01:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740362053; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5Mgf5q6qhRBmuSgAe02ZdEG2nF1QbJDMGd3ly1/yKPM=;
	b=GTUH0jUVN1TwKVsYryzlqFO8wD1i1G+PaDBbdEx2EvUzt7gQBfa2lLfJSYqHvX5UtWfHNNiywp98yj6fbdFClxd+MxqirEVk2ZY0/r5MeLVZV9QtapiJ7qNmNwD2uQIOBkWQu+Bz3pKUCLkLJz+v5Ibg4LVopjGrd2GgGIUGgaw=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WQ1RZjo_1740362050 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 24 Feb 2025 09:54:11 +0800
Message-ID: <5f25bb49-ce73-48ea-aa74-bd8972a3517d@linux.alibaba.com>
Date: Mon, 24 Feb 2025 09:54:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] perf/dwc_pcie: fix duplicate pci_dev devices
To: Yunhui Cui <cuiyunhui@bytedance.com>, renyu.zj@linux.alibaba.com,
 will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250220121716.50324-1-cuiyunhui@bytedance.com>
 <20250220121716.50324-3-cuiyunhui@bytedance.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250220121716.50324-3-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_175416_067110_C84BA931 
X-CRM114-Status: GOOD (  15.56  )
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
> During platform_device_register, wrongly using struct device
> pci_dev as platform_data caused a kmemdup copy of pci_dev. Worse
> still, accessing the duplicated device leads to list corruption as its
> mutex content (e.g., list, magic) remains the same as the original.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   drivers/perf/dwc_pcie_pmu.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index 19fa2ba8dd67..f851e070760c 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -565,9 +565,7 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
>   	u32 sbdf;
>   
>   	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
> -	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
> -						 pdev, sizeof(*pdev));
> -
> +	plat_dev = platform_device_register_simple("dwc_pcie_pmu", sbdf, NULL, 0);
>   	if (IS_ERR(plat_dev))
>   		return PTR_ERR(plat_dev);
>   
> @@ -616,18 +614,26 @@ static struct notifier_block dwc_pcie_pmu_nb = {
>   
>   static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>   {
> -	struct pci_dev *pdev = plat_dev->dev.platform_data;
> +	struct pci_dev *pdev;
>   	struct dwc_pcie_pmu *pcie_pmu;
>   	char *name;
>   	u32 sbdf;
>   	u16 vsec;
>   	int ret;
>   
> +	sbdf = plat_dev->id;
> +	pdev = pci_get_domain_bus_and_slot(sbdf >> 16, PCI_BUS_NUM(sbdf & 0xffff),
> +					   sbdf & 0xff);
> +	if (!pdev) {
> +		pr_err("No pdev found for the sbdf 0x%x\n", sbdf);
> +		return -ENODEV;
> +	}
> +
>   	vsec = dwc_pcie_des_cap(pdev);
>   	if (!vsec)
>   		return -ENODEV;
>   
> -	sbdf = plat_dev->id;
> +	pci_dev_put(pdev);
>   	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
>   	if (!name)
>   		return -ENOMEM;
> @@ -642,7 +648,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>   	pcie_pmu->on_cpu = -1;
>   	pcie_pmu->pmu = (struct pmu){
>   		.name		= name,
> -		.parent		= &pdev->dev,
> +		.parent		= &plat_dev->dev,
>   		.module		= THIS_MODULE,
>   		.attr_groups	= dwc_pcie_attr_groups,
>   		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,


LGTM. Thanks.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Shuai

