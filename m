Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14C3C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 09:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1Ts7XE8Xr5IE3ZwrGLXx/LOXkXGx3YbnOYf+1AJwHU=; b=b8qrNQtH5udY/VYVkKcvPKrrkA
	58WS/hClQBfXhwqIPFtB/djL82GCtF2iWlFbNT7DXOFz6JuIac6J8GrRBxN+k+cVPs7siSzT1HSQF
	fRHxTgszoBWz1AHyZBkFNNZFWDIYjKk9+2gCFYa3wKqw5hbMqtTkgr8ykfkyCNJS5aOC2/6yVdt7M
	gQw8JzFi9O1kpwxOunuXFkr7Y3naWCzsJf68pvfIZTB3f6PkXwsSz/gR3cIhyfetjze6dRjh3lU8m
	djPwb5hJbZdXZ8HIx5FU1gKo+AH3EJPXbZ4UNWNVIVDk0wFc304L00NI+6MqxCk+vjlrKtYWrmcqc
	BAKtkB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tatru-0000000C8Ax-1b6k;
	Thu, 23 Jan 2025 09:51:22 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tatqa-0000000C7xa-2a6l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 09:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1737625794; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Q1Ts7XE8Xr5IE3ZwrGLXx/LOXkXGx3YbnOYf+1AJwHU=;
	b=rJvh+khstHOdmmKEZR0XOtxt/+U/k1WdxubxsvMMheQRdzB6a4rzo41qq11CKve4LyQxmAt3MEfIezOg6EUSck8pleB79A33DpeTilpTyr2Os6pRP/7s/MK6dzFnApf1kC69b+8Pp++G/bYEKY85ZIvnO1jtbYA+Ip9flRJoebQ=
Received: from 30.246.161.230(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WOBFs9N_1737625791 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 23 Jan 2025 17:49:52 +0800
Message-ID: <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com>
Date: Thu, 23 Jan 2025 17:49:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/dwc_pcie: fix duplicate pci_dev devices
To: Yunhui Cui <cuiyunhui@bytedance.com>, renyu.zj@linux.alibaba.com,
 will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250123074830.90923-1-cuiyunhui@bytedance.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250123074830.90923-1-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_015001_248550_43A44466 
X-CRM114-Status: GOOD (  18.57  )
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



在 2025/1/23 15:48, Yunhui Cui 写道:
> During platform_device_register, wrongly using struct device
> pci_dev as platform_data caused a kmemdup copy of pci_dev. Worse
> still, accessing the duplicated device leads to list corruption as its
> mutex content (e.g., list, magic) remains the same as the original.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   drivers/perf/dwc_pcie_pmu.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index cccecae9823f..8b208f287a1f 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -565,9 +565,7 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
>   	u32 sbdf;
>   
>   	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
> -	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
> -						 pdev, sizeof(*pdev));
> -
> +	plat_dev = platform_device_register_simple("platform_dwc_pcie", sbdf, NULL, 0);
>   	if (IS_ERR(plat_dev))
>   		return PTR_ERR(plat_dev);
>   
> @@ -614,19 +612,32 @@ static struct notifier_block dwc_pcie_pmu_nb = {
>   
>   static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>   {
> -	struct pci_dev *pdev = plat_dev->dev.platform_data;
> +	struct pci_dev *pdev = NULL;
>   	struct dwc_pcie_pmu *pcie_pmu;
> +	bool found = false;
>   	char *name;
>   	u32 sbdf;
>   	u16 vsec;
>   	int ret;
>   
> +	for_each_pci_dev(pdev) {
> +		sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
> +		if (sbdf == plat_dev->id) {
> +			found = true;
> +			break;
> +		}
> +	}
> +	if (!found) {
> +		pr_err("The plat_dev->id does not match the sbdf");
> +		return -ENODEV;
> +	}
> +

How about using pci_get_domain_bus_and_slot() to find pci_dev?

>   	vsec = dwc_pcie_des_cap(pdev);
>   	if (!vsec)
>   		return -ENODEV;
>   
>   	sbdf = plat_dev->id;
> -	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
> +	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%d_pmu", sbdf);

A new name will break previous user tools.

>   	if (!name)
>   		return -ENOMEM;
>   
> @@ -640,7 +651,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>   	pcie_pmu->on_cpu = -1;
>   	pcie_pmu->pmu = (struct pmu){
>   		.name		= name,
> -		.parent		= &pdev->dev,
> +		.parent		= &plat_dev->dev,
>   		.module		= THIS_MODULE,
>   		.attr_groups	= dwc_pcie_attr_groups,
>   		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
> @@ -727,7 +738,7 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_n
>   
>   static struct platform_driver dwc_pcie_pmu_driver = {
>   	.probe = dwc_pcie_pmu_probe,
> -	.driver = {.name = "dwc_pcie_pmu",},
> +	.driver = {.name = "platform_dwc_pcie",},
>   };
>   
>   static int __init dwc_pcie_pmu_init(void)

Thanks.

Best Regards,
Shuai


