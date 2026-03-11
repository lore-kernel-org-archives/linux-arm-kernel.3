Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B277FCC9AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 05:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAFS6SUaQW7xKOcNcQrq2ISZ+ChhVUr2hv2lfFTcIcs=; b=MlNzR+6Cjk4gaPEs8U/8+224ER
	T3NQnOMWzB2cgRhwvBeJerBcyeA0bPqW9nPToZbMHNkjN+xgDMfDsqFIV+WiC5DwSjmptcFBvUFu1
	aJzzAtjfXmcyqHYRE0ceznA8uwETINlZ7Xk6BIu4K/NL3eS2JzWKZ//xXqDG5UVv+Xlv0hWQ2QTc/
	mdWERFmOot/75Kq+kpiW+BJTqpZy11JTJf3adBtzfSpV8t2zAW3LzxUJasSfzMuoibdgfvi7CHQ7z
	1krj/GBxMZmVI7wCu1YgyXZCvvCifkF8Oew2SGtQpouSCfMMPm0xAwZv2nrE3LTa0HUszOzRsoULx
	Ia7M/akQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0C5F-0000000AmDZ-31Sn;
	Wed, 11 Mar 2026 05:26:13 +0000
Received: from mail-m19731111.qiye.163.com ([220.197.31.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0C5C-0000000AmCS-2yBP;
	Wed, 11 Mar 2026 05:26:11 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3681eb934;
	Wed, 11 Mar 2026 13:20:56 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Niklas Cassel <cassel@kernel.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>,
 Brian Norris <briannorris@chromium.org>, Wilson Ding <dingwei@marvell.com>,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 2/4] PCI: host-common: Add link down handling for Root
 Ports
To: Manivannan Sadhasivam <mani@kernel.org>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <20260310-pci-port-reset-v7-2-9dd00ccc25ab@oss.qualcomm.com>
 <2eb738fb-9dfe-1e88-6ea7-afdba9cb3d25@rock-chips.com>
 <vnsmjvtwaeticdxwz6u43dxnpi6duhc3r5motwnfer4l2bpqcm@noeme6lgq4jf>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <b80b2364-2b13-44e0-fc3f-df335fc426a0@rock-chips.com>
Date: Wed, 11 Mar 2026 13:20:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <vnsmjvtwaeticdxwz6u43dxnpi6duhc3r5motwnfer4l2bpqcm@noeme6lgq4jf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cdb5748be09cckunm13bcff7618b6f0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQksZTlYeGEJMH0wYHR0dGk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WBhuHUzXt2thVHZYmxTGM2+dktPzKjU3jRcVDumQwxTvN/ZF6KuBXlPAi4h5K/L4IimlhmM+BbLJDa1D98M3hAq5vc++t3KYr2IAaYi9QbJWLCfjlJ6VuL+uK780xW/Y7YrqYFB1C+e/4XPMs1PH4dDDf/0+IhPo0LR+UmCll+8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PAFS6SUaQW7xKOcNcQrq2ISZ+ChhVUr2hv2lfFTcIcs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_222610_898362_87624996 
X-CRM114-Status: GOOD (  30.50  )
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

在 2026/03/11 星期三 13:04, Manivannan Sadhasivam 写道:
> On Wed, Mar 11, 2026 at 08:55:01AM +0800, Shawn Lin wrote:
>> Hi Mani
>>
>> 在 2026/03/10 星期二 22:02, Manivannan Sadhasivam via B4 Relay 写道:
>>> From: Manivannan Sadhasivam <mani@kernel.org>
>>>
>>> The PCI link, when down, needs to be recovered to bring it back. But on
>>> some platforms, that cannot be done in a generic way as link recovery
>>> procedure is platform specific. So add a new API
>>> pci_host_handle_link_down() that could be called by the host bridge drivers
>>> for a specific Root Port when the link goes down.
>>>
>>> The API accepts the 'pci_dev' corresponding to the Root Port which observed
>>> the link down event. If CONFIG_PCIEAER is enabled, the API calls
>>> pcie_do_recovery() function with 'pci_channel_io_frozen' as the state. This
>>> will result in the execution of the AER Fatal error handling code. Since
>>> the link down recovery is pretty much the same as AER Fatal error handling,
>>> pcie_do_recovery() helper is reused here. First, the AER error_detected()
>>> callback will be triggered for the bridge and then for the downstream
>>> devices. Finally, pci_host_reset_root_port() will be called for the Root
>>> Port, which will reset the Root Port using 'reset_root_port' callback to
>>> recover the link. Once that's done, resume message will be broadcasted to
>>> the bridge and the downstream devices, indicating successful link recovery.
>>>
>>> But if CONFIG_PCIEAER is not enabled in the kernel, only
>>> pci_host_reset_root_port() API will be called, which will in turn call
>>> pci_bus_error_reset() to just reset the Root Port as there is no way we
>>> could inform the drivers about link recovery.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>> Tested-by: Brian Norris <briannorris@chromium.org>
>>> Tested-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>    drivers/pci/controller/pci-host-common.c | 35 ++++++++++++++++++++++++++++++++
>>>    drivers/pci/controller/pci-host-common.h |  1 +
>>>    drivers/pci/pci.c                        |  1 +
>>>    drivers/pci/pcie/err.c                   |  1 +
>>>    4 files changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
>>> index d6258c1cffe5..15ebff8a542a 100644
>>> --- a/drivers/pci/controller/pci-host-common.c
>>> +++ b/drivers/pci/controller/pci-host-common.c
>>> @@ -12,9 +12,11 @@
>>>    #include <linux/of.h>
>>>    #include <linux/of_address.h>
>>>    #include <linux/of_pci.h>
>>> +#include <linux/pci.h>
>>>    #include <linux/pci-ecam.h>
>>>    #include <linux/platform_device.h>
>>> +#include "../pci.h"
>>>    #include "pci-host-common.h"
>>>    static void gen_pci_unmap_cfg(void *ptr)
>>> @@ -106,5 +108,38 @@ void pci_host_common_remove(struct platform_device *pdev)
>>>    }
>>>    EXPORT_SYMBOL_GPL(pci_host_common_remove);
>>> +static pci_ers_result_t pci_host_reset_root_port(struct pci_dev *dev)
>>> +{
>>> +	int ret;
>>> +
>>> +	pci_lock_rescan_remove();
>>> +	ret = pci_bus_error_reset(dev);
>>> +	pci_unlock_rescan_remove();
>>> +	if (ret) {
>>> +		pci_err(dev, "Failed to reset Root Port: %d\n", ret);
>>> +		return PCI_ERS_RESULT_DISCONNECT;
>>> +	}
>>> +
>>> +	pci_info(dev, "Root Port has been reset\n");
>>> +
>>> +	return PCI_ERS_RESULT_RECOVERED;
>>> +}
>>> +
>>> +static void pci_host_recover_root_port(struct pci_dev *port)
>>> +{
>>> +#if IS_ENABLED(CONFIG_PCIEAER)
>>> +	pcie_do_recovery(port, pci_channel_io_frozen, pci_host_reset_root_port);
>>> +#else
>>> +	pci_host_reset_root_port(port);
>>
>> Since pci_host_reset_root_port() returns pci_ers_result_t, shouldn't we
>> check the result? If the return value is intentionally ignored here,
>> maybe pci_host_reset_root_port actually doesn't need a return value at
>> all?
>>
> 
> The return value is mostly for pcie_do_recovery() which iterates through the
> subordinate devices and calls pci_host_reset_root_port(). It also makes use of
> the return value, so we cannot make it void.
> 
> The reason why I skipped the return value in pci_host_handle_link_down() is
> that, we canot do much in the case of failure other than reporting the failure,
> which is already taken care in pci_host_reset_root_port().
> 

Ok, it makes sense to me, thanks for the explanation.
Feel free to add:

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

>>> +#endif
>>> +}
>>> +
>>> +void pci_host_handle_link_down(struct pci_dev *port)
>>> +{
>>> +	pci_info(port, "Recovering Root Port due to Link Down\n");
>>> +	pci_host_recover_root_port(port);
>>> +}
>>> +EXPORT_SYMBOL_GPL(pci_host_handle_link_down);
>>
>> This function shouldn't be called like in interrupt context because of
>> the pci_lock_rescan_remove() and pci_bus_error_reset()::pci_slot_mutex,
>> but it's not so obvious from the API name. It's prone for host drivers
>> to use it like:
>>
>> register_LDn_irq -> irq isr -> pci_host_handle_link_down()
>>
>> So perhaps add a comment about it would be better.
>>
> 
> Yes, I agree. I mentioned in the cover letter that this API should be called
> from a threaded IRQ handler, but it should be mentioned in the API description
> too. I will add it in next version or ammend it while applying.
> 
> - Mani
> 

