Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0422C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4yzJ1noedDWVQEaOZSM94W1Wxwn8zZ9kpiO6XR9LxU=; b=LoU3TZKQZRozMDZr72uWm/z8Q4
	Huf7V4P0Hci/ek92A5DaXldpPR46/o0olHxXWVmsuAfysrWaB96SJ6KlHF2jFf6+X9Z3sGpUYAISm
	WRzjVQ93SxvMXoE49JgUaEO4hXORd2VobIGMIZj2BLfcsuLcZ17+SoKwWncPjBZxUdVQbxR4Cedi1
	nZP/dyHzdLYiUzd0zqITJFFebxEZZ7ZeJ2PvE3urL41iMRWWOosfdi+hkigb6JjMwELDdxoL4XrCC
	9Gb6Z5TP9P17BiVImPBH3h8NUMoZJGfSp/vwT46nXDRiHnJ2SnaCz4jLUWtMztmb8Llz+KAyIVHp7
	uWJKhWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQF2-00000008oxM-3dlw;
	Wed, 25 Jun 2025 13:32:44 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNFt-00000008IMR-3FWI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:21:27 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P62V3v021991;
	Wed, 25 Jun 2025 12:21:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	C4yzJ1noedDWVQEaOZSM94W1Wxwn8zZ9kpiO6XR9LxU=; b=tzkHB94wRKqAwx4c
	0lvTUd/MYGBUx70suX7tiBjmz0UtKwRUjtVPIihur62TbMpXnmXpdcWmAcdp5xpW
	pJhiDVqchowhT7pV99S6j6SU6rDAOWYXhkkVwFxxMyC4wjjDYTsf0eHmDBFfiURV
	rU9kKk2Ce52GLRFVg3ZaOeyIaes040BDjPmJk81aWNwBTwCNso39GT/ejla9qTYW
	PqSVpiw4Ed0mzE2VIisvjpYOTdwxw3RJNg0AR5LWINIBu6zV9J+fp3aNyf5Y4M+D
	HRRQsYRdb9v8xpc3neYRQgJVZHr4su1XCjrpysVrcRguZdv2L4yM2cGfSe5ewNjS
	3LpBlw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjryqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 12:21:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 04F1A40046;
	Wed, 25 Jun 2025 12:19:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12132AE5D21;
	Wed, 25 Jun 2025 12:18:21 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 12:18:20 +0200
Message-ID: <01dbb6cf-3ab4-4922-b301-661464c9e56d@foss.st.com>
Date: Wed, 25 Jun 2025 12:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: (subset) [PATCH v12 0/9] Add STM32MP25 PCIe drivers
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
	<helgaas@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <johan+linaro@kernel.org>,
        <cassel@kernel.org>, <shradha.t@samsung.com>,
        <thippeswamy.havalige@amd.com>, <quic_schintav@quicinc.com>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <175068078778.15794.15418191733712827693.b4-ty@kernel.org>
 <20250624222206.GA1537968@bhelgaas>
 <3bmw76gzqjq2nmjvj7tb6gi5x233zzfrhv44uyjopl2lxyzbkh@zg5skeu62nbh>
Content-Language: en-US
In-Reply-To: <3bmw76gzqjq2nmjvj7tb6gi5x233zzfrhv44uyjopl2lxyzbkh@zg5skeu62nbh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_032126_086394_3ED5BB6A 
X-CRM114-Status: GOOD (  17.85  )
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



On 6/25/25 06:00, Manivannan Sadhasivam wrote:
> On Tue, Jun 24, 2025 at 05:22:06PM -0500, Bjorn Helgaas wrote:
>> On Mon, Jun 23, 2025 at 06:13:07AM -0600, Manivannan Sadhasivam wrote:
>>> On Tue, 10 Jun 2025 11:07:05 +0200, Christian Bruel wrote:
>>>> Changes in v12;
>>>>     Fix warning reported by kernel test robot <lkp@intel.com>
>>>>
>>>> Changes in v11;
>>>>     Address comments from Manivanna:
>>>>     - RC driver: Do not call pm_runtime_get_noresume in probe
>>>>                  More uses of dev_err_probe
>>>>     - EP driver: Use level triggered PERST# irq
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/9] dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
>>>        commit: 41d5cfbdda7a61c5d646a54035b697205cff1cf0
>>> [2/9] PCI: stm32: Add PCIe host support for STM32MP25
>>>        commit: f6111bc2d8fe6ffc741661126a2174523124dc11
>>> [3/9] dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings
>>>        commit: 203cfc4a23506ffb9c48d1300348c290dbf9368e
>>> [4/9] PCI: stm32: Add PCIe Endpoint support for STM32MP25
>>>        commit: 8869fb36a107a9ff18dab8c224de6afff1e81dec
>>> [5/9] MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
>>>        commit: 003902ed7778d62083120253cd282a9112674986
>>
>> This doesn't build for me with the attached config:
>>
>>    $ make drivers/pci/controller/dwc/pcie-stm32.o
>>      CALL    scripts/checksyscalls.sh
>>      DESCEND objtool
>>      INSTALL libsubcmd_headers
>>      CC      drivers/pci/controller/dwc/pcie-stm32.o
>>    drivers/pci/controller/dwc/pcie-stm32.c: In function ‘stm32_pcie_suspend_noirq’:
>>    drivers/pci/controller/dwc/pcie-stm32.c:83:16: error: implicit declaration of function ‘pinctrl_pm_select_sleep_state’ [-Werror=implicit-function-declaration]
>>       83 |         return pinctrl_pm_select_sleep_state(dev);
>> 	|                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    drivers/pci/controller/dwc/pcie-stm32.c: In function ‘stm32_pcie_resume_noirq’:
>>    drivers/pci/controller/dwc/pcie-stm32.c:96:24: error: ‘structdevice’ has no member named ‘pins’
>>       96 |         if (!IS_ERR(dev->pins->init_state))
>> 	|                        ^~
>>    drivers/pci/controller/dwc/pcie-stm32.c:97:23: error: implicit declaration of function ‘pinctrl_select_state’ [-Werror=implicit-function-declaration]
>>       97 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
>> 	|                       ^~~~~~~~~~~~~~~~~~~~
>>    drivers/pci/controller/dwc/pcie-stm32.c:97:47: error: ‘structdevice’ has no member named ‘pins’
>>       97 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
>> 	|                                               ^~
>>    drivers/pci/controller/dwc/pcie-stm32.c:97:61: error: ‘structdevice’ has no member named ‘pins’
>>       97 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
>> 	|                                                             ^~
>>    drivers/pci/controller/dwc/pcie-stm32.c:99:23: error: implicit declaration of function ‘pinctrl_pm_select_default_state’ [-Werror=implicit-function-declaration]
>>       99 |                 ret = pinctrl_pm_select_default_state(dev);
>> 	|                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
> 
> Hmm... I see two issues here. First is, wrong pinctrl header used. The correct
> one is:
> 
> #include <linux/pinctrl/consumer.h>

ah yes, the missing pinctrl_pm_select_default_state() should indeed be 
fixed by using the correct header.

> 
> Second issue is the driver accessing "struct device::pins" directly. The "pins"
> member won't be available if CONFIG_PINCTRL is not set (which is what your
> .config has). So either the member should not be accessed directly or the
> driver has to depend on CONFIG_PINCTRL. The latter one is not acceptable.It
> also looks weird that only this driver is accessing the "pins" member directly
> apart from the pinctrl core. So I think this part needs a revisit.
> 
> Christian?
The pinctrl "init" and "default" configurations are managed effectively 
by the probing code. The same approach is required in 
stm32_pcie_resume_noirq().

In this case, would introducing a new helper function, 
pinctrl_pm_select_init_state(), be preferable, even if we are the only 
consumer?

Thank you


> 
> - Mani
> 

