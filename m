Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB68C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIJQd8/xiO8zk0JzBELYAOXAcVPyFlMXoXFFjOZkwuA=; b=VgrEJYQ3sS2dOO9461bGXkGhln
	yMA7CPuQs2YnzcqWfr2wjDKSEbv2TKFsbI8+/HfrXfsdAW8VW7jJwQQVChlyaiuz3RU8zkGTVhn9v
	1QSJx+lYC3d9C+tNMzOZi58Mn+u/HQh7RfWPIUWmrJ3D2dUE+mSpT0YzKqNcE/BT+Gvvqs36SCsi4
	w2LCvBwIQNWJOt3GtnVueRpnowOd01Q3aRsV5Urddjf9SXJp2l3V6vFNMKJ5b4G2YZdzff1A1VBY/
	JDqd7lQuf0hPQyhSljI9L58YaXrrQiOEFvJGwShRyx2ObEtE/3+SoeDOcfC8HoJNj+Mz3OO6Z9nIk
	OYnD3Awg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgE04-000000084CY-3sTd;
	Fri, 07 Feb 2025 02:21:48 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDyR-000000083bC-0srK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738894802; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=MIJQd8/xiO8zk0JzBELYAOXAcVPyFlMXoXFFjOZkwuA=;
	b=oJPb6odrzbdivn45m3DNDmOYcmtu5/4KGUzhPJrSEaww2asvPcETXIqYDFjJlxdbBdbDZ9GS4RHatwL7mvigTtCflnfzexA3wutgl8itcUIrAkQQppwskdhfgB8vq5erq+N+bqQoIad0133codl+p3GKpk8CjkC0xtZV4w+ZU28=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WOxloU6_1738894800 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 10:20:00 +0800
Message-ID: <76dad20a-0180-46a0-9840-6d8444d1749a@linux.alibaba.com>
Date: Fri, 7 Feb 2025 10:19:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] perf/dwc_pcie: fix the incorrect reference count
To: Yunhui Cui <cuiyunhui@bytedance.com>, renyu.zj@linux.alibaba.com,
 will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20250205031425.67265-1-cuiyunhui@bytedance.com>
 <20250205031425.67265-2-cuiyunhui@bytedance.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250205031425.67265-2-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_182008_037135_9ADA1746 
X-CRM114-Status: GOOD (  17.62  )
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



在 2025/2/5 11:14, Yunhui Cui 写道:
> for_each_pci_dev increments pdev refcount. Call pci_dev_put after access
> to decrement it.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   drivers/perf/dwc_pcie_pmu.c | 42 ++++++++++++++++++++++++++-----------
>   1 file changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index cccecae9823f..4ac53167d7ab 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -553,6 +553,7 @@ static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
>   
>   static void dwc_pcie_unregister_dev(struct dwc_pcie_dev_info *dev_info)
>   {
> +	pci_dev_put(dev_info->pdev);
>   	platform_device_unregister(dev_info->plat_dev);
>   	list_del(&dev_info->dev_node);
>   	kfree(dev_info);
> @@ -572,8 +573,10 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
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
> @@ -594,8 +597,11 @@ static int dwc_pcie_pmu_notifier(struct notifier_block *nb,
>   	case BUS_NOTIFY_ADD_DEVICE:
>   		if (!dwc_pcie_des_cap(pdev))
>   			return NOTIFY_DONE;
> -		if (dwc_pcie_register_dev(pdev))
> +		pci_dev_get(pdev);
> +		if (dwc_pcie_register_dev(pdev)) {
> +			pci_dev_put(pdev);
>   			return NOTIFY_BAD;
> +		}
>   		break;
>   	case BUS_NOTIFY_DEL_DEVICE:
>   		dev_info = dwc_pcie_find_dev_info(pdev);
> @@ -730,20 +736,29 @@ static struct platform_driver dwc_pcie_pmu_driver = {
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
>   	int ret;
>   
>   	for_each_pci_dev(pdev) {
> -		if (!dwc_pcie_des_cap(pdev))
> +		if (!dwc_pcie_des_cap(pdev)) {
> +			pci_dev_put(pdev);

If the pdev has no RAS cap, we do not need to put the device.

> The reference count for @from is
> always decremented if it is not %NULL.

Please see comments from pci_get_device() for more details.

Shuai


