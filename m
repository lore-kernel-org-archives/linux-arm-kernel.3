Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BA2CCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trzVWn3q8K520lsD6h38S6zhjQv/gzjNZVwNLqNGPyU=; b=IUAxHh0BksohlI93PU4hmm2qpi
	hlqooh42uCzaoRc9BKTqUUCy5xTeeWpmlD4woRtnb8zGNswm1ATgkRnYAvRqU/tPkZiGoaF+CbBb7
	bpGz0vH9ZRR7imv3sef4BDUqjJoZvBAqcYS7f39Ymey/+3dXwnmI9R7sTCDi5acW703N37GSX/plr
	TWSDl1XL4Yaw1BkZokv5Ffaw7FgqFIHLje/bmXUDQwlvkZBv8+gc6DVaWYUlT1POZ2sqgtg07VJH/
	oLlnnobq9N8zPJvYjYQeonWq0aQ067Y9Gg0batBfTL2UE0pJrjVCtP+NRJPzKK3mi9PTZC6TNf/FR
	DhVsQIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJyL-0000000CCKr-3Ulq;
	Tue, 04 Nov 2025 16:33:29 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJyI-0000000CCJe-2YxQ;
	Tue, 04 Nov 2025 16:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=trzVWn3q8K520lsD6h38S6zhjQv/gzjNZVwNLqNGPyU=;
	b=am+dmD4/csrOyZJOXdSv2u8xwXTFEawi+UcC+idUmmLv+AgzSeygvq/5Ck0Xgh
	cpk0VkMOwAHn/1AZXzAmPrfewybsTU9OcfMi7rYJDgiiVc4co3uE0tCrahbMzuus
	vfmKoe+LvaGmNLfPd3ajSOM7Z6a9nv2LO4D227qGg7quM=
Received: from [IPV6:240e:b8f:927e:1000:355:1a70:fad9:bcdf] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3r7uOKgppcpmYBg--.12641S2;
	Wed, 05 Nov 2025 00:32:15 +0800 (CST)
Message-ID: <161d6789-4e7f-456a-91ed-9ef682187eae@163.com>
Date: Wed, 5 Nov 2025 00:32:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] PCI: Configure root port MPS during host probing
To: Niklas Cassel <cassel@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
 heiko@sntech.de, mani@kernel.org, yue.wang@amlogic.com, pali@kernel.org,
 neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250620155507.1022099-2-18255117159@163.com>
 <20250902174828.GA1165373@bhelgaas> <aLlmV8Qiaph1PHFY@ryzen>
 <aQoU-JhWz6IYTpGi@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aQoU-JhWz6IYTpGi@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD3r7uOKgppcpmYBg--.12641S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xr4rGw18Ww48Gw13uw4DJwb_yoW7Gw48pa
	yjqa1vyFn7GryfCrs2va1F9rWUtrZ3AFW5Jr98Jry093Z0vF1Iqr4qyw45Cas7Cr4DArWj
	vrZ8XryxZ3Z5AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U46wZUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:355:1a70:fad9:bcdf]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOgD7o2kKH03PFAAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_083327_084564_E0B7244E 
X-CRM114-Status: GOOD (  27.89  )
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



On 2025/11/4 23:00, Niklas Cassel wrote:
> Hello Hans,
> 
> Any chance that you have time to re-spin this series?
> 
> I've seen some new DWC based drivers like NXP that also want to
> configure MPS.
> 
> Most likely we know the reason... The PCI core does not change it
> without this series.
> 

Hi Niklas,

I will modify a version based on Bjorn and your opinions and then send 
it out.

Best regards,
Hans

> 
> Kind regards,
> Niklas
> 
> On Thu, Sep 04, 2025 at 12:13:43PM +0200, Niklas Cassel wrote:
>> On Tue, Sep 02, 2025 at 12:48:28PM -0500, Bjorn Helgaas wrote:
>>> On Fri, Jun 20, 2025 at 11:55:06PM +0800, Hans Zhang wrote:
>>>> Current PCIe initialization logic may leave root ports operating with
>>>> non-optimal Maximum Payload Size (MPS) settings. While downstream device
>>>> configuration is handled during bus enumeration, root port MPS values
>>>> inherited from firmware or hardware defaults ...
>>>
>>> Apparently Root Port MPS configuration is different from that for
>>> downstream devices?
>>
>> pci_host_probe() will call pci_scan_root_bus_bridge(), which will call
>> pci_scan_single_device(), which will call pci_device_add(), which will
>> call pci_configure_device(), which will call pci_configure_mps().
>>
>> This will be done for both bridges and endpoints.
>>
>> The bridge will be scanned/added first, before devices behind the bridge.
>>
>>
>> While pci_configure_device()/pci_configure_mps() will be called for both
>> bridges and endpoints, pci_configure_mps() will do an early return for
>> devices where pci_upstream_bridge() returns NULL, i.e. for devices where
>> that does not have an upstream bridge, i.e. for the root bridge itself:
>> https://github.com/torvalds/linux/blob/v6.17-rc4/drivers/pci/probe.c#L2181-L2182
>>
>> So MPS will not be touched for root bridges.
>>
>> This patch ensures that MPS for root bridges gets initialized to MPSS
>> (Max supported MPS).
>>
>> Later, when pci_configure_device()/pci_configure_mps() is called for a
>> device behind the bridge, if the MPSS of the device behind the bridge is
>> smaller than the MPS of the bridge, the code reduces the MPS of the bridge:
>> https://github.com/torvalds/linux/blob/v6.17-rc4/drivers/pci/probe.c#L2205
>>
>>
>> My only question with this patch is if there is a bridge behind a bridge,
>> will the bridge behind the bridge still have pci_pcie_type() ==
>> PCI_EXP_TYPE_ROOT_PORT ?
>>
>> If so, perhaps we should modify this patch from:
>>
>> +       if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
>> +           pcie_bus_config != PCIE_BUS_TUNE_OFF) {
>> +               pcie_write_mps(dev, 128 << dev->pcie_mpss);
>> +       }
>> +
>>          if (!bridge || !pci_is_pcie(bridge))
>>                  return;
>>
>>
>> to:
>>
>> +       if (!bridge && pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
>> +           pcie_bus_config != PCIE_BUS_TUNE_OFF) {
>> +               pcie_write_mps(dev, 128 << dev->pcie_mpss);
>> +       }
>> +
>>          if (!bridge || !pci_is_pcie(bridge))
>>                  return;
>>
>>
>>
>>>> During host controller probing phase, when PCIe bus tuning is enabled,
>>>> the implementation now configures root port MPS settings to their
>>>> hardware-supported maximum values. Specifically, when configuring the MPS
>>>> for a PCIe device, if the device is a root port and the bus tuning is not
>>>> disabled (PCIE_BUS_TUNE_OFF), the MPS is set to 128 << dev->pcie_mpss to
>>>> match the Root Port's maximum supported payload size. The Max Read Request
>>>> Size (MRRS) is subsequently adjusted through existing companion logic to
>>>> maintain compatibility with PCIe specifications.
>>>>
>>>> Note that this initial setting of the root port MPS to the maximum might
>>>> be reduced later during the enumeration of downstream devices if any of
>>>> those devices do not support the maximum MPS of the root port.
>>>>
>>>> Explicit initialization at host probing stage ensures consistent PCIe
>>>> topology configuration before downstream devices perform their own MPS
>>>> negotiations. This proactive approach addresses platform-specific
>>>> requirements where controller drivers depend on properly initialized
>>>> root port settings, while maintaining backward compatibility through
>>>> PCIE_BUS_TUNE_OFF conditional checks. Hardware capabilities are fully
>>>> utilized without altering existing device negotiation behaviors.
>>>
>>> This last paragraph seems kind of like marketing without any real
>>> content.  Is there something important in there?
>>>
>>> Nits:
>>> s/root port/Root Port/
>>>
>>> Reword "implementation now configures" to be clear about whether "now"
>>> refers to before this patch or after.
>>>
>>> Update the MRRS "to maintain compatibility" part.  I'm dubious about
>>> there being a spec compatibility issue with respect to MRRS.  Cite the
>>> relevant section if there is an issue.
>>
>> I'm not sure why the commit message mentions MRRS at all.
>>
>> Sure, pcie_write_mrrs() might set MRRS to MPS, but that is existing logic
>> and not really related to the change in this patch IMO.
>>
>>
>> Kind regards,
>> Niklas


