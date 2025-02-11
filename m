Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38C2C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHPDAundgcYY+YEOK6ITUkjYkkUi8bL66U1XWOeqKpc=; b=Owcbk9Sm9EXvznHPDEU8hIocsC
	EN1xN8ZiErZ0xVTIku7Xh+rAkbVjVGGEl6rrAPIqpzuiY1SFkPreVOxCV/q6jWKCTQXZzBbyPc005
	l5tRRuzAhexsnHJDvya42i64cyPxvjYdbLqqn4uV4kIBphcZlKWPbyIkjoznlOiBJE4Z2bpbYuTmD
	+7JuG0zudwdEaUqhPpeVb7qeq2ripPOxPW+MuZoLbP3wTdhYWhMHTxuc7SBNV20pxnW/eYNwK/eIN
	ddZ6Ygz9gEPIJRr8na4mjFgf3GnI3ixI3KoG2NYPYjZjJfVq3T+ehhPytX3w2IShJMDjgcCNd0mMZ
	kr0rUU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlGE-00000002vUm-1yyG;
	Tue, 11 Feb 2025 08:04:50 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlDY-00000002v00-0YWy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739260918; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=eHPDAundgcYY+YEOK6ITUkjYkkUi8bL66U1XWOeqKpc=;
	b=MYqhouqSu0kHvnH55JzI78Jgm7OUCne/Qf8InXp36+ghw41EpL+MLWqeZ8NXqT3Dlme1W3jK7X3Z3Cjq0l94p0787URmTIWF0GyXCVnabBanls0CYPA+7l7SxkH8QC6U7psFAYg6LnJ8sblmnu5JWfZv9l4NcDJ9AEGibj2cSPE=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WPG4n1E_1739260914 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 11 Feb 2025 16:01:54 +0800
Message-ID: <2fedcf43-05f9-40da-a4f7-1b836f30b0df@linux.alibaba.com>
Date: Tue, 11 Feb 2025 16:01:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] perf/dwc_pcie: fix duplicate pci_dev devices
To: Yunhui Cui <cuiyunhui@bytedance.com>, renyu.zj@linux.alibaba.com,
 will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20250208104002.60332-1-cuiyunhui@bytedance.com>
 <20250208104002.60332-3-cuiyunhui@bytedance.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250208104002.60332-3-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_000204_355007_B8F1AC29 
X-CRM114-Status: GOOD (  17.90  )
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



在 2025/2/8 18:40, Yunhui Cui 写道:
> During platform_device_register, wrongly using struct device
> pci_dev as platform_data caused a kmemdup copy of pci_dev. Worse
> still, accessing the duplicated device leads to list corruption as its
> mutex content (e.g., list, magic) remains the same as the original.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   drivers/perf/dwc_pcie_pmu.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index 19fa2ba8dd67..4f6599e32bba 100644
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

pci_dev_put(pdev) should move ahead to aovid return here.

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
> @@ -729,7 +735,7 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_n
>   
>   static struct platform_driver dwc_pcie_pmu_driver = {
>   	.probe = dwc_pcie_pmu_probe,
> -	.driver = {.name = "dwc_pcie_pmu",},
> +	.driver = {.name = "platform_dwc_pcie",},

Aha, it is very difficult to come up with a name that satisfies everyone. The
original name uses the '_pmu' suffix to follow the unwritten convention of
other PMU drivers.

Personally, I think the original name is more appropriate, but I'll leave the
decision to @Will.

Thanks.
Best Regards.
Shuai

