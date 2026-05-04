Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961B6CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 06:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoDyIB9MKLnXGCh0r+3x/f8pDxF2OmHPG/aL1VQ2lUw=; b=nTenWTrvRq9jqgF/BzJ3mn20p4
	4iTnmZMbOPoV0EVQFzI7d+a4BlGhScMOVACiWl7Iyl/pOFkBHzW6/8M/q3cEn03kYTQzECohufQAb
	2Z4t8lgpd3NgFJuKHLlH9LcRvsNU98OFt6lJ7AI6q87q+264Kcmn0+1tNZ7/EOT+knHSvia5xubNw
	jdXD0BVvdOIvMm5ghNaBDTXkOBjUcWdul37d6RBKZNsaf3MvBHjXvtAhAvJL3t7toRyMQZupeWpGx
	MIn7CWQ8aJr3s9EvY5Vx7uE/z9chYhVQH9+mrzJMnJ/dj2NFEgB2owPvVnua9nOuUG2b/owBN5hzM
	+tL7q51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmiz-0000000CUoo-0KeL;
	Mon, 04 May 2026 06:24:13 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmiv-0000000CUl2-3zeb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 06:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=eoDyIB9MKLnXGCh0r+3x/f8pDxF2OmHPG/aL1VQ2lUw=;
	b=MW0kuarWRqO895SdwzFvchUvvnwO4oPHaj9gpWOd7wlRac/b7eGBP4oVPstXsD
	+pMzLTGe+Q/O+Rth1SCCBAInEiTi0FDzvGQjFAGEc27WNasCYwxacLaQKsLhrhYm
	O1wPY0uYzCS6NiggMqlVbjzQQ2jEVi5EOaldtNOsGbCUw=
Received: from [192.168.50.71] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAX2IFmO_hpvbviCA--.227S2;
	Mon, 04 May 2026 14:23:38 +0800 (CST)
Message-ID: <ce5574b7-1c0d-4b46-b92e-e8f7ddbd8ef0@163.com>
Date: Mon, 4 May 2026 14:23:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: cadence: Ensure that
 cdns_pcie_host_wait_for_link() waits 100 ms after link up
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, vigneshr@ti.com, robh@kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501153553.66382-1-18255117159@163.com>
 <20260501153553.66382-2-18255117159@163.com>
 <4ce9f13a-b17f-4149-ade8-57519f4a4752@ti.com>
 <699bd359-7389-45fa-a79b-10046f73bf12@163.com>
 <a3093010-d120-4c5d-b272-d8cb3884f0b3@ti.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <a3093010-d120-4c5d-b272-d8cb3884f0b3@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgAX2IFmO_hpvbviCA--.227S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3XFyrGr1DZry3WFyUJFy7Jrb_yoWxAFy7pa
	yUWF1xKF40qr45u3Wvv3WUZrySqr98GFy7Gw4kKa4xZrnrCr17tF42gF43WF9xGrs0vr17
	Z3WUtF9rGF1YvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5DGOUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AqBJWn4O2qsAwAA3t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_232410_517695_A4FD7F94 
X-CRM114-Status: GOOD (  28.42  )
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



On 5/4/26 13:08, Siddharth Vadapalli wrote:
> On 03/05/26 21:16, Hans Zhang wrote:
>>
>>
>> On 5/2/26 13:18, Siddharth Vadapalli wrote:
>>> On 01/05/26 21:05, Hans Zhang wrote:
>>>> As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link 
>>>> speeds
>>>> greater than 5.0 GT/s, software must wait a minimum of 100 ms after 
>>>> Link
>>>> training completes before sending a Configuration Request.
>>>>
>>>> Add a new 'max_link_speed' field in struct cdns_pcie to record the
>>>> maximum supported (or currently configured) link speed of the 
>>>> controller.
>>>>
>>>> In cdns_pcie_host_wait_for_link(), after the link is reported as up,
>>>> insert a 100 ms delay if max_link_speed > 2 (i.e., > 5 GT/s). This
>>>> implements the required delay at the common Cadence host layer.
>>>>
>>>> Currently max_link_speed is zero-initialized, so the delay is not yet
>>>> active. Glue drivers must set max_link_speed appropriately to enable
>>>> the delay. This matches the approach taken for the Synopsys DWC
>>>> controller in commit 80dc18a0cba8d ("PCI: dwc: Ensure that
>>>> dw_pcie_wait_for_link() waits 100 ms after link up").
>>>>
>>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>>> ---
>>>>   .../pci/controller/cadence/pcie-cadence-host-common.c    | 9 +++++ 
>>>> ++++
>>>>   drivers/pci/controller/cadence/pcie-cadence.h            | 2 ++
>>>>   2 files changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host- 
>>>> common.c b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> index 2b0211870f02..d4ae762f423f 100644
>>>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> @@ -14,6 +14,7 @@
>>>>   #include "pcie-cadence.h"
>>>>   #include "pcie-cadence-host-common.h"
>>>> +#include "../../pci.h"
>>>>   #define LINK_RETRAIN_TIMEOUT HZ
>>>> @@ -55,6 +56,14 @@ int cdns_pcie_host_wait_for_link(struct cdns_pcie 
>>>> *pcie,
>>>>       /* Check if the link is up or not */
>>>>       for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
>>>>           if (pcie_link_up(pcie)) {
>>>> +            /*
>>>> +             * As per PCIe r6.0, sec 6.6.1, a Downstream Port that
>>>> +             * supports Link speeds greater than 5.0 GT/s, software
>>>> +             * must wait a minimum of 100 ms after Link training
>>>> +             * completes before sending a Configuration Request.
>>>> +             */
>>>> +            if (pcie->max_link_speed > 2)
>>>> +                msleep(PCIE_RESET_CONFIG_WAIT_MS);
>>>
>>> I think the above could be moved to cdns_pcie_host_start_link() as 
>>> follows:
>>>
>>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host- 
>>> common.c b/ drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>> index 2b0211870f02..0f885dcbdb12 100644
>>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>> @@ -115,6 +115,15 @@ int cdns_pcie_host_start_link(struct 
>>> cdns_pcie_rc *rc,
>>>       if (!ret && rc->quirk_retrain_flag)
>>>           ret = cdns_pcie_retrain(pcie, pcie_link_up);
>>>
>>> +    /*
>>> +     * As per PCIe r6.0, sec 6.6.1, a Downstream Port that
>>> +     * supports Link speeds greater than 5.0 GT/s, software
>>> +     * must wait a minimum of 100 ms after Link training
>>> +     * completes before sending a Configuration Request.
>>> +     */
>>> +    if (!ret && pcie->max_link_speed > 2)
>>> +        msleep(PCIE_RESET_CONFIG_WAIT_MS);
>>> +
>>>       return ret;
>>>   }
>>>   EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
>>>
>>> This will avoid an additional and unnecessary delay when 
>>> 'cdns_pcie_retrain()' retrains the link.
>>>
>>> Instead of checking for the link being up using "pcie_link_up(pcie)", 
>>> checking for 'ret' being zero should also work (ret being zero 
>>> indicates that the link is up).
>>>
>>> Since configuration space accesses will not be performed until 
>>> cdns_pcie_host_start_link() completes executing, it should be safe to 
>>> switch to the above implementation.
>>
>> Hi Siddharth,
>>
>> I think this is applicable to LGA IP as per the method you mentioned. 
>> However, for HPA IP, additional repetitive code needs to be added in 
>> the following code.
> 
> Yes, additional code is required as you rightly pointed out, but the 
> problem I was trying to address with your patch is the following:
>      cdns_pcie_host_start_link()
>        calls cdns_pcie_host_wait_for_link()
>          Link is Up and we wait for 100 ms here
>        calls cdns_pcie_retrain()
>            calls cdns_pcie_host_wait_for_link() a second time
>              Link is Up again after retraining and we wait and
>              we wait an additional 100 ms here.
> 
> Instead, it will be sufficient if we could wait just once after 
> cdns_pcie_retrain() returns.

Hi Siddharth,

Yes, I looked at the code and indeed it works this way.

Because of the abundance of redundant comments. I'm wondering if it's 
possible to encapsulate a helper function in the file 
drivers/pci/controller/pci-host-common.c, so that controller drivers 
like dwc and cadence can call this API. Or do you know where it would be 
appropriate to place it?

Hello, Bjorn and Mani, I wonder what your opinions are.

> 
>>
>> Regarding the "quirk_retrain_flag" tag, I reviewed this submission 
>> record and it appears to be a workaround method. Can it be considered 
>> that it is not a universal method? Or is the same processing logic 
>> also added in the HPA?
> 
> I am not sure, but to the best of my knowledge, the quirk is not 
> applicable to HPA.
> 

The SOC of our company is HPA IP, and it doesn't require this flag setting.

Best regards,
Hans

>>
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c b/ 
>> drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> index 0f540bed58e8..65159f52067d 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> @@ -305,6 +305,15 @@ int cdns_pcie_hpa_host_link_setup(struct 
>> cdns_pcie_rc *rc)
>>          if (ret)
>>                  dev_dbg(dev, "PCIe link never came up\n");
>>
>> +       /*
>> +        * As per PCIe r6.0, sec 6.6.1, a Downstream Port that
>> +        * supports Link speeds greater than 5.0 GT/s, software
>> +        * must wait a minimum of 100 ms after Link training
>> +        * completes before sending a Configuration Request.
>> +        */
>> +       if (pcie->max_link_speed > 2)
>> +               msleep(PCIE_RESET_CONFIG_WAIT_MS);
>> +
>>          return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(cdns_pcie_hpa_host_link_setup);
>>
>> Best regards,
>> Hans
> 
> [TRIMMED]
> 
> Regards,
> Siddharth.


