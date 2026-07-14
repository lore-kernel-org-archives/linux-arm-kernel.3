Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748EAC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElhmPfVqBToQ9P063X0Nq/IxRb7L6/7x/Xi/WmPp8q8=; b=Cwh9PiG5wGuKYXge7g8eVbQyCq
	qSNQI+s0YjVRjw7cE+6M/WoyCH6BT6N1CNqsvb2Z2l9Cn3cFBQs9Cqd3JBjaLYUwwJY2Qvf/Q6RpD
	raLUHB3kuw3GKCRoO44PEcvj8MbiF2JgUrbcfY+coeqS/uwPy40H/snznmU+rY8aVIwqhSHiAmE7W
	Ph5YCQJQaF8j6y759SgYn/ZSalT6QO+v1J31RJ0KRjSyIiujG2qaRYuNpAN2JUBxaQ4qQsKtxCjQr
	NBh1F8ryk0ie1cnKFcSM6kWiJQ7kDLB33qFKCtEctMbBcOVtNqXtkyalmz9Ls8Jbhz9dcl+9HPnVp
	Fid+L62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgRd-0000000Chk5-2hUh;
	Tue, 14 Jul 2026 16:57:21 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgRa-0000000ChjV-3eh9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:57:20 +0000
Message-ID: <76243051-e391-45d2-b47a-d4a904f0a36f@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1784048232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ElhmPfVqBToQ9P063X0Nq/IxRb7L6/7x/Xi/WmPp8q8=;
	b=wXD8NEDs6UrKZDXX4nd5fYxC/7tBzufTuVhWqv8zYjnFqy5Q2LeX1zJB0H/vQ1BiRrWQDV
	9PIla8gaoYKbb2W9MT+o0bAUg+tQ7ia6DaIjgLVCqBn9vmYuM8tmpu6jioeEVzSsyVxH2x
	UYU6EfIakwLmTnKBtexaM7af2+KxcCc=
Date: Tue, 14 Jul 2026 18:57:11 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] PCI: apple: Integrate pwrctrl API
To: Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20260707-apple-pcie-pwren-v1-0-5a281b182fe2@cyberchaos.dev>
 <20260707-apple-pcie-pwren-v1-1-5a281b182fe2@cyberchaos.dev>
 <86a4s3p2vy.wl-maz@kernel.org>
 <8a80a170-a508-4a9e-8090-27cfcedb1cd4@cyberchaos.dev>
 <865x2qq4ts.wl-maz@kernel.org>
 <jqaxvdaxfpm5g3tdwdqpuk2ubkwim6ckmlblocvakloqishvmm@c5ofbdbdj7lf>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <jqaxvdaxfpm5g3tdwdqpuk2ubkwim6ckmlblocvakloqishvmm@c5ofbdbdj7lf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_095719_154836_55FFB02A 
X-CRM114-Status: GOOD (  22.14  )
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


On 7/9/26 14:29, Manivannan Sadhasivam wrote:
> On Tue, Jul 07, 2026 at 02:58:39PM +0100, Marc Zyngier wrote:
>> On Tue, 07 Jul 2026 13:04:21 +0100,
>> Yureka Lilian <yureka@cyberchaos.dev> wrote:
>>> On 7/7/26 11:25, Marc Zyngier wrote:
>>>> On Mon, 06 Jul 2026 23:38:27 +0100,
>>>> Yureka Lilian <yureka@cyberchaos.dev> wrote:
>>>>> Integrate the PCI pwrctrl framework into the Apple PCIe host driver to
>>>>> provide standardized power management for PCI devices.
>>>>>
>>>>> Notably, this allows enabling powering on the WiFi, SD card reader on
>>>>> various Macs by means of the pwrctrl framework before probing the ports.
>>>>>
>>>>> Previously, a custom solution for powering on the WiFi and SD card
>>>>> reader was proposed[1], but we can now use the new pci-pwrctrl-generic
>>>>> driver for this purpose.
>>>>>
>>>>> Link[1]: https://lore.kernel.org/lkml/20220502093832.32778-4-marcan@marcan.st/
>>>>>
>>>> nit: this paragraph and the accompanying link don't belong in the
>>>> commit message and should be moved below the --- mark or even better,
>>>> to the cover letter.
>>> ack, will leave it out of the commit message of the individual commit in v2
>>>>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>>>>> ---
>>>>>    drivers/pci/controller/Kconfig      |  1 +
>>>>>    drivers/pci/controller/pcie-apple.c | 16 ++++++++++++++++
>>>>>    2 files changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
>>>>> index 2247709ef6d6..af64630d28fa 100644
>>>>> --- a/drivers/pci/controller/Kconfig
>>>>> +++ b/drivers/pci/controller/Kconfig
>>>>> @@ -46,6 +46,7 @@ config PCIE_APPLE
>>>>>    	depends on OF
>>>>>    	depends on PCI_MSI
>>>>>    	select PCI_HOST_COMMON
>>>>> +	select PCI_PWRCTRL_GENERIC
>>>>>    	select IRQ_MSI_LIB
>>>>>    	help
>>>>>    	  Say Y here if you want to enable PCIe controller support on Apple
>>>>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>>>>> index c2cffc0659f4..db038a9d4831 100644
>>>>> --- a/drivers/pci/controller/pcie-apple.c
>>>>> +++ b/drivers/pci/controller/pcie-apple.c
>>>>> @@ -30,6 +30,7 @@
>>>>>    #include <linux/msi.h>
>>>>>    #include <linux/of_irq.h>
>>>>>    #include <linux/pci-ecam.h>
>>>>> +#include <linux/pci-pwrctrl.h>
>>>>>      #include "pci-host-common.h"
>>>>>    @@ -825,6 +826,21 @@ static int apple_pcie_init(struct
>>>>> pci_config_window *cfg)
>>>>>    	if (WARN_ON(!pcie))
>>>>>    		return -ENOENT;
>>>>>    +	ret = pci_pwrctrl_create_devices(pcie->dev);
>>>>> +	if (ret) {
>>>>> +		dev_err(pcie->dev, "Failed to create pwrctrl devices: %pe\n", ret);
>>>>> +		return ret;
>>>>> +	}
>>>>> +
>>>>> +	ret = pci_pwrctrl_power_on_devices(pcie->dev);
>>>>> +	if (ret) {
>>>>> +		if (ret != -EPROBE_DEFER) {
>>>>> +			dev_err(pcie->dev, "Failed to power on devices: %pe\n", ret);
>>>>> +			pci_pwrctrl_destroy_devices(pcie->dev);
>>>>> +		}
>>>>> +		return ret;
>>>>> +	}
>>>>> +
>>>> Why is this done globally while the whole driver works on a per-port
>>>> basis, and that the proposed DT updates are also per port?
>>> pci_pwrctrl_power_on_devices takes a struct device as parameter, but
>>> pcie-apple does not allocate device structs for the individual ports.
>>> This could be changed of course. But since pci_pwrctrl_* operate on
>>> the subnodes recursively, it works just fine this way.
>> Works fine is one thing. Being consistent with the way the rest of the
>> driver works is another. pci_pwrctrl_create_device() and
>> pci_pwrctrl_power_on_device() appear to do exactly what would be
>> required for a single port. They just needs to be exported made
>> global/exported.
>>
> I'm fine with exporting pci_pwrctrl_create_device() and
> pci_pwrctrl_power_on_device() and calling them with per-port np.
>
> - Mani

In theory I do agree this would work to power on the slots, and I can 
send a v2 of the patch doing it that way, but I don't quite understand 
yet how this fits better with the existing driver code: If this is the 
case, what is the difference between pcie-apple and pcie-qcom and why 
should pcie-qcom use the recursive function but pcie-apple not?


Thanks,

— Yureka


