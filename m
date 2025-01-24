Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AB8C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 06:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUWDcgHyAFM18RO3R6oc8J3erVbUv0Ng/r++00YFCrU=; b=jNcxANegO9YclDujdodv7eDa1t
	GBwgSLU66ZDAQRhlIfRAQ2aAUxJreXoUQwOdfV1VuJFTMQwmpX0f7P2e/c4BmYcke/6wvImIWwMa6
	e7n9kqpp+8HSGjR3BW+NXVcWo/XpDteBhdDJyJxZa76kdUIow9gBzBQeQbjKxTF4Nl/akOCT5D1Is
	fWlNBvuJZjWXXFlTZaEmmkVIW2eBQTEaMdfBvGCrZIZTAB9dYo+GmN3GG/KPFOwEUBJnnvzLe0VpP
	GV3Ee+cT5DZE1HP5K4G6IuFAdiZHa83vnczDXtwJ2WPT478CDupBJqoq0ahA7exOD7kkv4dm6JGjP
	PnLhsZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDZJ-0000000E3gL-3kHY;
	Fri, 24 Jan 2025 06:53:29 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDUb-0000000E2MT-3KtB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 06:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1737701313; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UUWDcgHyAFM18RO3R6oc8J3erVbUv0Ng/r++00YFCrU=;
	b=KXgHq9bVyBkZcDMAsC+DnwjmU/6qkpkI/HlJp9V9jNzKwwWEMZ3b57r1Ckm0tDXf37yiuV6wki3sFCZbDP2IPpT6/5FQDKeK8FBmyYcrKW3EOji92QcvWuNNUCXfbjyQKkpO0c5pXCxbEI32qX1mIbBqrJXIC0Dbw1Xp1tzSv/A=
Received: from 30.246.161.230(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WODip5B_1737701310 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jan 2025 14:48:31 +0800
Message-ID: <31e00081-8695-4ca6-a1ef-af5a007a7565@linux.alibaba.com>
Date: Fri, 24 Jan 2025 14:48:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] perf/dwc_pcie: fix duplicate pci_dev
 devices
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250123074830.90923-1-cuiyunhui@bytedance.com>
 <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com>
 <CAEEQ3wmDej9bbPUmkx-ZrD4FG9Z7gTHMeCrVszx64g90O0RyiQ@mail.gmail.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <CAEEQ3wmDej9bbPUmkx-ZrD4FG9Z7gTHMeCrVszx64g90O0RyiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_224838_594074_A6569636 
X-CRM114-Status: GOOD (  16.98  )
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



在 2025/1/24 10:56, yunhui cui 写道:
> Hi Shuai,
> 
> On Thu, Jan 23, 2025 at 5:50 PM Shuai Xue <xueshuai@linux.alibaba.com> wrote:
>>
>>
>>
>> 在 2025/1/23 15:48, Yunhui Cui 写道:
>>> During platform_device_register, wrongly using struct device
>>> pci_dev as platform_data caused a kmemdup copy of pci_dev. Worse
>>> still, accessing the duplicated device leads to list corruption as its
>>> mutex content (e.g., list, magic) remains the same as the original.
>>>
>>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>>> ---
>>>    drivers/perf/dwc_pcie_pmu.c | 25 ++++++++++++++++++-------
>>>    1 file changed, 18 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
>>> index cccecae9823f..8b208f287a1f 100644
>>> --- a/drivers/perf/dwc_pcie_pmu.c
>>> +++ b/drivers/perf/dwc_pcie_pmu.c
>>> @@ -565,9 +565,7 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
>>>        u32 sbdf;
>>>
>>>        sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
>>> -     plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
>>> -                                              pdev, sizeof(*pdev));
>>> -
>>> +     plat_dev = platform_device_register_simple("platform_dwc_pcie", sbdf, NULL, 0);
>>>        if (IS_ERR(plat_dev))
>>>                return PTR_ERR(plat_dev);
>>>
>>> @@ -614,19 +612,32 @@ static struct notifier_block dwc_pcie_pmu_nb = {
>>>
>>>    static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>>>    {
>>> -     struct pci_dev *pdev = plat_dev->dev.platform_data;
>>> +     struct pci_dev *pdev = NULL;
>>>        struct dwc_pcie_pmu *pcie_pmu;
>>> +     bool found = false;
>>>        char *name;
>>>        u32 sbdf;
>>>        u16 vsec;
>>>        int ret;
>>>
>>> +     for_each_pci_dev(pdev) {
>>> +             sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
>>> +             if (sbdf == plat_dev->id) {
>>> +                     found = true;
>>> +                     break;
>>> +             }
>>> +     }
>>> +     if (!found) {
>>> +             pr_err("The plat_dev->id does not match the sbdf");
>>> +             return -ENODEV;
>>> +     }
>>> +
>>
>> How about using pci_get_domain_bus_and_slot() to find pci_dev?
> It's not necessary. pci_get_domain_bus_and_slot also invokes
> for_each_pci_dev, and it further requires splitting the sbdf.

Compose sbdf from domain, bus number, and devfn is almost essentially
corresponding opposite operation. And I think we should grab a reference
count of pdev and handle it properly.

Personally speaking, I prefer pci_get_domain_bus_and_slot() because it is
simple and robust.

> 
>>
>>>        vsec = dwc_pcie_des_cap(pdev);
>>>        if (!vsec)
>>>                return -ENODEV;
>>>
>>>        sbdf = plat_dev->id;
>>> -     name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
>>> +     name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%d_pmu", sbdf);
>>
>> A new name will break previous user tools.
> This name isn't suitable. It can't clearly show which is the PMU
> device. Userspace tools don't have binding relationships, like perf.
> Tools must traverse PMU devices before use.

The device is under /sys/bus/event_source/ which indates it is PMU device.
As far as I know, most of PMU devices do not endup with a '_pmu' prefix.

Thanks.

Shuai


