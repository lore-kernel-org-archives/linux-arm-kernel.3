Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF80C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWNTXIBLk44jOWCaxqVWXnPJfTyD2vfL7kKmjrg4X+s=; b=sue7mGZz6akBPCeqSUBUlsIxHX
	S6L7n5G6Fa/T28uP4ShblcnEbEeV3PZu7K9dMfPkRVA/YSnD+eqr1lLCuasKEUpHgtT2CXe9BzhIv
	i+Bdmp+fNu79ov+e8bzpD2QSyOOsPmUeo2LmJdMBmYEgf/gCCHewX8VHs0l0YMjr18kIcvJWOFH7z
	DcbDBrCHF4UxquQYbcykkpWat7o/eSDReHMJLH8Qjin4hrzy748ONX5+bbmRq34UJaUkGvkHseJSM
	tSr2a6wVR7jIux4Cmdmowzeqz9QBWoUZdzGo4ia65sHvsVhzzoMvWWuQxPWCdyASUKP6VtAJAZUoe
	e4cZCL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlI0-00000002w2L-3ENm;
	Tue, 11 Feb 2025 08:06:40 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlGZ-00000002veo-275N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739261109; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=OWNTXIBLk44jOWCaxqVWXnPJfTyD2vfL7kKmjrg4X+s=;
	b=R3HWCD1KTK0APpsBTtL/WqPiyE/jiBTVBC4kZAwLSAcu3r9evjyIvQWQaSy7Tao6Y9sLwtBYJSrAlkX0B6nilVhxia35Gzz5zmIFqe2+cirrAcjWDMWfU4X4PDJgtQF+TEE1+r0cfFaVwk1VFU/LNh9Q2ojfFFTV/wDtXbh1Oms=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WPG-wH._1739261107 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 11 Feb 2025 16:05:08 +0800
Message-ID: <d1db3047-f478-4d8f-b9f6-e7a5820d5a29@linux.alibaba.com>
Date: Tue, 11 Feb 2025 16:05:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] perf/dwc_pcie: fix some unreleased resources
To: Yunhui Cui <cuiyunhui@bytedance.com>, renyu.zj@linux.alibaba.com,
 will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>, linux-pci@vger.kernel.org
References: <20250208104002.60332-1-cuiyunhui@bytedance.com>
 <20250208104002.60332-2-cuiyunhui@bytedance.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250208104002.60332-2-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_000511_708782_8F0A0A06 
X-CRM114-Status: GOOD (  16.05  )
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

Should we get a reference count of pdev in dwc_pcie_register_dev and put it in
dwc_pcie_unregister_dev?

Thanks.
Shuai


