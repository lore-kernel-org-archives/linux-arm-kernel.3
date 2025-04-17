Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFE2C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlgWpR09t/bSRSkE9n5lqQqIokkyYXuy0tioT6D2/gU=; b=a52ar2tNT18wyhP2klU4b1vCXp
	LM8TSnSBqBNrUaYgIzkxmaLHev6e5zJTBMxAy/B1w8xrg+ynyWcyYGcI2LWS9ZOBDUjboOvsp6pRs
	CJW8rxq2NRUCYAalFqgoRsy1nhNduZikW9TnMRp34a/ZLGZC+MCZRh6DoA/g6l33cqnnOkggkSteb
	DjWJPT7U1K8UfQQ/sAb9mbpsBqwQF/xsiW8uULIRif29u9KLJmOB2u+R9xPB85zPxbt8W3XxcpWno
	5L1FU2bCEjtD7TudJuxBl6EXkrOjneKiSYvyRKmszGmlKu6W3ikZCq8H14XaVH867PlzBxtw56Lac
	5+j3ru0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KK9-0000000CENV-3Ujs;
	Thu, 17 Apr 2025 08:10:17 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KIH-0000000CDwV-1urP;
	Thu, 17 Apr 2025 08:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=HlgWpR09t/bSRSkE9n5lqQqIokkyYXuy0tioT6D2/gU=;
	b=RYGvreS4Se2WbeLN10BDpFsbNJdMWqT3wCNTLrz8G2chlNdbl9oubsIcSiZp09
	zKFwqAeB1t2wfiAGmwsN8s6b+irHTW/vvx8X+7ra05p6uoOxwLQpeVAzHA8VGUcq
	sVA8EuQdLYybGjyc3Tk1jt/NssiajnDWEm1DjQg7z+GUk=
Received: from [192.168.142.52] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAX613XtgBo09yjAg--.7973S2;
	Thu, 17 Apr 2025 16:07:53 +0800 (CST)
Message-ID: <52a2f6dc-1e13-4473-80f2-989379df4e95@163.com>
Date: Thu, 17 Apr 2025 16:07:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
To: Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, thomas.richard@bootlin.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250416151926.140202-1-18255117159@163.com>
 <aACoEpueUHBLjgbb@ryzen>
 <85643fe4-c7df-4d64-e852-60b66892470a@rock-chips.com>
 <aACsJPkSDOHbRAJM@ryzen>
 <ca283065-a48c-3b39-e70d-03d4c6c8a956@rock-chips.com>
 <aACyRp8S9c8azlw9@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aACyRp8S9c8azlw9@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAX613XtgBo09yjAg--.7973S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4kCr47Jw4rArWrXryrZwb_yoWrGF18p3
	y5Xa1Ykrs8tw45Jrs7t3Wv9rWYyFsxXFy5Wwn8JryUJwn0kr13tr4vkr4UKF17Xr4rGF4j
	qFyUJryfX3WDAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHrWwUUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxcyo2gAsnuqcwAAsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_010821_878373_C5CFEC3A 
X-CRM114-Status: GOOD (  14.95  )
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



On 2025/4/17 15:48, Niklas Cassel wrote:
> On Thu, Apr 17, 2025 at 03:25:06PM +0800, Shawn Lin wrote:
>> 在 2025/04/17 星期四 15:22, Niklas Cassel 写道:
>>> On Thu, Apr 17, 2025 at 03:08:34PM +0800, Shawn Lin wrote:
>>>> 在 2025/04/17 星期四 15:04, Niklas Cassel 写道:
>>>>> Hello Hans,
>>>>>
>>>>> On Wed, Apr 16, 2025 at 11:19:26PM +0800, Hans Zhang wrote:
>>>>>> The RK3588's PCIe controller defaults to a 128-byte max payload size,
>>>>>> but its hardware capability actually supports 256 bytes. This results
>>>>>> in suboptimal performance with devices that support larger payloads.
>>>>>
>>>>> Patch looks good to me, but please always reference the TRM when you can.
>>>>>
>>>>> Before this patch:
>>>>> 		DevCap: MaxPayload 256 bytes
>>>>> 		DevCtl: MaxPayload 128 bytes
>>>>>
>>>>>
>>>>> As per rk3588 TRM, section "11.4.3.8 DSP_PCIE_CAP Detail Registers Description"
>>>>>
>>>>> DevCap is per the register description of DSP_PCIE_CAP_DEVICE_CAPABILITIES_REG,
>>>>> field PCIE_CAP_MAX_PAYLOAD_SIZE.
>>>>> Which claims that the value after reset is 0x1 (256B).
>>>>>
>>>>> DevCtl is per the register description of
>>>>> DSP_PCIE_CAP_DEVICE_CONTROL_DEVICE_STATUS, field PCIE_CAP_MAX_PAYLOAD_SIZE_CS.
>>>>> Which claims that the reset value is 0x0 (128B).
>>>>>
>>>>> Both of these match the values above.
>>>>>
>>>>> As per the description of PCIE_CAP_MAX_PAYLOAD_SIZE_CS:
>>>>> "Permissible values that
>>>>> can be programmed are indicated by the Max_Payload_Size
>>>>> Supported field (PCIE_CAP_MAX_PAYLOAD_SIZE) in the Device
>>>>> Capabilities (DEVICE_CAPABILITIES_REG) register (for more
>>>>> details, see section 7.5.3.3 of PCI Express Base Specification)."
>>>>>
>>>>> So your patch looks good.
>>>>>
>>>>> I guess I'm mostly surprised that the e.g. pci_configure_mps() does not
>>>>> already set DevCtl to the max(DevCap.MPS of the host, DevCap.MPS of the
>>>>> endpoint).
>>>>>
>>>>> Apparently pci_configure_mps() only decreases MPS from the reset values?
>>>>> It never increases it?
>>>>>
>>>>
>>>> Actually it does:
>>>>
>>>> https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/kernel-parameters.txt#L4757
>>>
>>> If that is the case, then explain the before/after with Hans lspci output here:
>>> https://lore.kernel.org/linux-pci/bb40385c-6839-484c-90b2-d6c7ecb95ba9@163.com/
>>>
>>> His patch changes the default value of DevCtl.MPS (from 128B to 256B), but if
>>> pci_configure_mps() can bump DevCtl.MPS to a higher value, his patch should not
>>> be needed, since the EP (an NVMe SSD in his case) has DevCap.MPS 512B, and the
>>> RC itself has DevCap.MPS 256B.
>>>
>>> Seems like we are missing something here.
>>
>> So Hans, could you please help set pci=pcie_bus_safe or
>> pci=pcie_bus_perf in your cmdline, and see how lspci dump different
>> without your patch?
> 
> It seems that the default MPS strategy can be set using Kconfigs:
> https://github.com/torvalds/linux/blob/v6.15-rc2/drivers/pci/pci.c#L126-L136
> https://github.com/torvalds/linux/blob/v6.15-rc2/include/linux/pci.h#L1110-L1116
> 
> Note that the these Kconfigs are hidden behind CONFIG_EXPERT.
> So unless you have explicitly set one of these Kconfigs, the default should be:
> PCIE_BUS_DEFAULT,	/* Ensure MPS matches upstream bridge */


Hi Niklas and Shawn,

Thank you very much for your discussion and reply.

I tested it on RK3588 and our platform. By setting pci=pcie_bus_safe, 
the maximum MPS will be automatically matched in the end.

So is my patch no longer needed? For RK3588, does the customer have to 
configure CONFIG_PCIE_BUS_SAFE or pci=pcie_bus_safe?

Also, for pci-meson.c, can the meson_set_max_payload be deleted?


Best regards,
Hans



