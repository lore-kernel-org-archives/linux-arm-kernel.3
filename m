Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2848ECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzdyIVkDD4QspuDbsjStOhs6nIN3cMjYoJI+LAqsHhM=; b=ZHRsd/KAlldPrITX4D1LfAQBY7
	oO4NWbRVArgco6kymLT1h4oAHbp8LSOjuO8gP8pwZN1NVhfwh44jKtejnIIP7KXm/hBkADmfILFXM
	WbYikzhvM3Bfe6tkV4spM6wSQPTDSUO56pAU7vbs0j7cw5lYRkLxWhjofOpFHgQ9ahHmP+s+EZEDO
	VL33xqruXaM1newD792cJnyTFW88ZftcKLsOnFu999bVGpMYrRUp9GxSzJKH6p6EMYM4h4zftpZ1v
	eX8ElY7bm6rDUyCdkmZ/47KFZMrwS/UFnPbdsB2v8xabUeU1eJYP8JcGflFXsN9dfWe0ixW0md4Zl
	ZghlhnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk0t-0000000GNXr-0Agy;
	Tue, 12 May 2026 10:06:55 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk0q-0000000GNWO-3DN0;
	Tue, 12 May 2026 10:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=kzdyIVkDD4QspuDbsjStOhs6nIN3cMjYoJI+LAqsHhM=;
	b=cJYzaqLU7FvnxIe/dHqjQJeaKxTf8ggNXlJTQgH3HEwIGLY7vFGCYrEX/oQJnb
	63fAXELNRTnwJ7/qRDPvHd8k+TZblVxS/lx5kQSogukkwyNY0sFVeO8xkDZsXq31
	JTib7FThncgOzzXPag82g0b5MvcqThZnlyli6+FlV8sfs=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnLwyM+wJqRYgUBA--.13809S2;
	Tue, 12 May 2026 18:06:06 +0800 (CST)
Message-ID: <bc68a395-0a66-481a-b6ae-cb10bfb68cb9@163.com>
Date: Tue, 12 May 2026 18:06:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] PCI: Add pci_host_common_link_train_delay() helper
To: Claudiu Beznea <claudiu.beznea@kernel.org>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
 mpillai@cadence.com
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-2-18255117159@163.com>
 <e092cd5d-6a46-4440-9085-95c929e8fb83@kernel.org>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <e092cd5d-6a46-4440-9085-95c929e8fb83@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnLwyM+wJqRYgUBA--.13809S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF13JFy3JFy5XF1xur48WFg_yoWrGrykpa
	yxJF1akF4kJFW3ua17Za4UuFyYq3Z5Jayjkr9xG3s3ZrnxWrnakryjgwsYqF97Jrs5ZF12
	yF1Ygwn7Cr47taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4UDXUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCww494GoC+4645QAA3Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_030653_197550_78648E07 
X-CRM114-Status: GOOD (  26.81  )
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



On 5/12/26 15:05, Claudiu Beznea wrote:
> Hi, Hans,
> 
> On 5/11/26 08:59, Hans Zhang wrote:
>> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
>> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
>> minimum of 100 ms after Link training completes before sending any
>> Configuration Request.
>>
>> Introduce a static inline helper pci_host_common_link_train_delay() that
>> checks the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and
>> calls msleep(100) only when the speed is greater than 5.0 GT/s.
>>
>> This allows multiple host controller drivers to share the same mandatory
>> delay without duplicating the logic.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/pci-host-common.h | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/ 
>> controller/pci-host-common.h
>> index b5075d4bd7eb..d709f7e3e11a 100644
>> --- a/drivers/pci/controller/pci-host-common.h
>> +++ b/drivers/pci/controller/pci-host-common.h
>> @@ -10,6 +10,9 @@
>>   #ifndef _PCI_HOST_COMMON_H
>>   #define _PCI_HOST_COMMON_H
>> +#include <linux/delay.h>
>> +#include "../pci.h"
>> +
>>   struct pci_ecam_ops;
>>   int pci_host_common_probe(struct platform_device *pdev);
>> @@ -20,4 +23,18 @@ void pci_host_common_remove(struct platform_device 
>> *pdev);
>>   struct pci_config_window *pci_host_common_ecam_create(struct device 
>> *dev,
>>       struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
>> +
>> +/**
>> + * pci_host_common_link_train_delay - Wait 100 ms if link speed > 5 GT/s
>> + * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/ 
>> s, ...)
>> + *
>> + * Must be called after Link training completes and before the first
>> + * Configuration Request is sent.
>> + */
>> +static inline void pci_host_common_link_train_delay(int max_link_speed)
>> +{
>> +    if (max_link_speed > 2)
>> +        msleep(PCIE_RESET_CONFIG_WAIT_MS);
> 
> In case of RZ/G3S driver the max_link_speed is populated based on "max- 
> link-speed" DT property (by calling of_pci_get_max_link_speed()). My 
> understanding from [1] (and the review of the initial RZ/G3S driver 
> support) is that this is not a mandatory property (note also the "Host 
> drivers *could* add this" from [1]). At least for the RZ/G3S driver, in 
> case the "max-link-speed" DT property is not present in DT but the 
> controller supports more than 5GT/s (that is possible as the driver 
> supports more controller variants), the max_link_speed argument will be 
> negative. In that case the msleep() will not be called. This looks like 
> an opposite of what the patch set is trying to achieve.

Hi Claudiu,

The situation you mentioned also exists in the dwc common driver. My 
understanding is that we are writing this driver at the normal rate 
which is greater than GEN2. For some exceptions, or when the support is 
greater than GEN2 but the actual operation is less than or equal to 
GEN2, this situation might be unavoidable. Furthermore, for RZ/G3S, the 
"max-link-speed" attribute can be added to the DT.


> 
> Also, if I'm not wrong, there is also the possibility of having the max- 
> link-speed > 2 but the downstream port to not support more than 5GT/s. 
> In that case the mspeep() would also be executed (but I think that 
> wouldn't be really an issue).


Before this patch, the RZ/G3S driver would always perform a msleep(100) 
regardless of whether it was greater than GEN2 or less than or equal to 
GEN2.

Best regards,
Hans

> 
> Thank you,
> Claudiu
> 
> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/ 
> schemas/pci/pci-bus-common.yaml#L117
> 
> Thank you,
> Claudiu


