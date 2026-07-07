Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1wR4i3S+qlUwOJNrTeVvJuUHl23Tu3l5qGQqGSCCrM=; b=qOuYnHdBMjv7TWltCHRrLZkNVN
	Ax3VMo1fAle+YPv7JH4z3+XLWcE/R6JRGsbfu3cAzFrtH+xuyITHWMn/g9SKuzncDI4VIM/r4M6pK
	widYpYEu//+v2lGMdgDrL5tmxCJeIn/2v5yQ1h0JVU1uXoQpLKtnxkCJyWVJZkqpmgiXs1E7EbcHs
	GZP+xSc+2ZMJcLZBnR2v7Fkbe2xBI75lE+QVcxcxXWhPYg1++EDZQOn9Obpc3EV7XhHQDWQlxo7uk
	E1qf2gsA/6pxSTcOC3+MN5nZm9sf8XzF5iM0uF6e+r9UTHEFauMCupbMhfyY/jp6cbAy1Faev03vN
	QwqFKvYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4XO-0000000Eucs-0CZr;
	Tue, 07 Jul 2026 12:04:30 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4XK-0000000EucQ-3Y4M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:04:28 +0000
Message-ID: <8a80a170-a508-4a9e-8090-27cfcedb1cd4@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783425863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1wR4i3S+qlUwOJNrTeVvJuUHl23Tu3l5qGQqGSCCrM=;
	b=CKowxmzEvsFi8bPEpRBxQBVEESRS+TLUCPFAFp2Q4CQOSUnmA2luvb+oOSG1ITQLz9Wn8C
	7IIXPpr5ArZNaxWGpffrKpCC3+CbZqbKCk7zB4JsIpGPqulFijoHPaPnGHwcuHdY5RjVt1
	YLmBUWejdchZmVwbrsNEyVaGPfcmAWA=
Date: Tue, 7 Jul 2026 14:04:21 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] PCI: apple: Integrate pwrctrl API
To: Marc Zyngier <maz@kernel.org>, Yureka Lilian <yureka@cyberchaos.dev>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20260707-apple-pcie-pwren-v1-0-5a281b182fe2@cyberchaos.dev>
 <20260707-apple-pcie-pwren-v1-1-5a281b182fe2@cyberchaos.dev>
 <86a4s3p2vy.wl-maz@kernel.org>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <86a4s3p2vy.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_050427_147858_34053EC2 
X-CRM114-Status: GOOD (  23.95  )
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

On 7/7/26 11:25, Marc Zyngier wrote:
> On Mon, 06 Jul 2026 23:38:27 +0100,
> Yureka Lilian <yureka@cyberchaos.dev> wrote:
>> Integrate the PCI pwrctrl framework into the Apple PCIe host driver to
>> provide standardized power management for PCI devices.
>>
>> Notably, this allows enabling powering on the WiFi, SD card reader on
>> various Macs by means of the pwrctrl framework before probing the ports.
>>
>> Previously, a custom solution for powering on the WiFi and SD card
>> reader was proposed[1], but we can now use the new pci-pwrctrl-generic
>> driver for this purpose.
>>
>> Link[1]: https://lore.kernel.org/lkml/20220502093832.32778-4-marcan@marcan.st/
>>
> nit: this paragraph and the accompanying link don't belong in the
> commit message and should be moved below the --- mark or even better,
> to the cover letter.
ack, will leave it out of the commit message of the individual commit in v2
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>>   drivers/pci/controller/Kconfig      |  1 +
>>   drivers/pci/controller/pcie-apple.c | 16 ++++++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
>> index 2247709ef6d6..af64630d28fa 100644
>> --- a/drivers/pci/controller/Kconfig
>> +++ b/drivers/pci/controller/Kconfig
>> @@ -46,6 +46,7 @@ config PCIE_APPLE
>>   	depends on OF
>>   	depends on PCI_MSI
>>   	select PCI_HOST_COMMON
>> +	select PCI_PWRCTRL_GENERIC
>>   	select IRQ_MSI_LIB
>>   	help
>>   	  Say Y here if you want to enable PCIe controller support on Apple
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index c2cffc0659f4..db038a9d4831 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -30,6 +30,7 @@
>>   #include <linux/msi.h>
>>   #include <linux/of_irq.h>
>>   #include <linux/pci-ecam.h>
>> +#include <linux/pci-pwrctrl.h>
>>   
>>   #include "pci-host-common.h"
>>   
>> @@ -825,6 +826,21 @@ static int apple_pcie_init(struct pci_config_window *cfg)
>>   	if (WARN_ON(!pcie))
>>   		return -ENOENT;
>>   
>> +	ret = pci_pwrctrl_create_devices(pcie->dev);
>> +	if (ret) {
>> +		dev_err(pcie->dev, "Failed to create pwrctrl devices: %pe\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = pci_pwrctrl_power_on_devices(pcie->dev);
>> +	if (ret) {
>> +		if (ret != -EPROBE_DEFER) {
>> +			dev_err(pcie->dev, "Failed to power on devices: %pe\n", ret);
>> +			pci_pwrctrl_destroy_devices(pcie->dev);
>> +		}
>> +		return ret;
>> +	}
>> +
> Why is this done globally while the whole driver works on a per-port
> basis, and that the proposed DT updates are also per port?

pci_pwrctrl_power_on_devices takes a struct device as parameter, but
pcie-apple does not allocate device structs for the individual ports.
This could be changed of course. But since pci_pwrctrl_* operate on
the subnodes recursively, it works just fine this way.
Additionally, we would like to be sure all the endpoints can be powered
before we start initializing the individual ports. Otherwise we could
end up in a situation where some ports are initialized but others are
not when we realize some driver needed to power on the endpoints for
port n is not yet bound. There is no appropriate pci_pwrctrl API for
checking for the availability without changing the state, so this is
an additional reason to do it early.

>
> Thanks,
>
> 	M.
>

