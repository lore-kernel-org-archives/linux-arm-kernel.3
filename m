Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817B3CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFGQIxzV0XqW9nC0/AKOyv2OIrk100bnZQY5xlfWlcc=; b=LlQDqtDqSMi82/BJhvkdsHaDMY
	BOT8itnKfwKQ3Ajfo3ODMcAPNSjRaecr3McZsVjS6OGedEgoDfkZAJt4jreXlJd058hoDjZwa2iTf
	QqAqBl9XpTJXoyJQ+c3B/QuPNIfy9MIPS+X7KofKAdV9tqHqHwYxwCfeQ3XykjYhi19BtLIqOkOGA
	RWHR84O5U60GISciGqM6+fnBtZWdytxyrgYKHFb0xR1aEa1cpfgqTGOH4+8cOTJkQHuUWzuA/0NVS
	QVYIbofdGco3HEHMklN/nnS6WdNHldJtwQKFl9KrC8y1/vHIyyAg6HIsZWxgsu0NXSdSSmq5vZ4tw
	UjmB/g6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKetv-00000001TKT-0ftl;
	Wed, 06 May 2026 16:15:07 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKett-00000001THW-2IkP;
	Wed, 06 May 2026 16:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=FFGQIxzV0XqW9nC0/AKOyv2OIrk100bnZQY5xlfWlcc=;
	b=dxaB81nrrQv9ZYzmI+hxe9hf8pTaEG82gZB2ZW/exdXHtXFqRWfJtaSl9rVb7X
	g/HMC0XeUUgN9EmtXmooML8TP+K1xVY24fdLXFsnpQJQWKCb1Xdp+1TyCuNEY9fh
	YefWdL+yAUf76s44LeF+K8/ooMF18Pq7SeBqqoHafOxRI=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnr1XeaPtpun1fDQ--.22605S2;
	Thu, 07 May 2026 00:14:23 +0800 (CST)
Message-ID: <72aff075-847d-4e30-a5c3-bf26670646b5@163.com>
Date: Thu, 7 May 2026 00:14:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and
 100 ms delay after link training
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org,
 s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-3-18255117159@163.com>
 <jmqw5tmgbpou5lanjcnolrpmipgnny6chm53wqybtqg4epfuql@cxqryplrmylk>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <jmqw5tmgbpou5lanjcnolrpmipgnny6chm53wqybtqg4epfuql@cxqryplrmylk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PSgvCgDnr1XeaPtpun1fDQ--.22605S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWrWrAFWDCF43GF48Zr43Jrb_yoW5ArW8pa
	yDGa4fGF1IqrWY93WkZ3W5XryYqas0k3s7Kws2ka4xWr13Cr1UJF12gF15WF9xKrWDAr17
	ZF1DtF9rGF4ayFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UN6pPUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwx+qTmn7aN9kqQAA3Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_091505_967572_4108885C 
X-CRM114-Status: GOOD (  15.03  )
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



On 5/7/26 00:03, Manivannan Sadhasivam wrote:
> On Wed, May 06, 2026 at 11:23:40PM +0800, Hans Zhang wrote:
>> The Cadence LGA (Legacy Architecture IP) PCIe host controller currently
>> lacks the mandatory 100 ms delay after link training completes for speeds
>>> 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.
>>
>> Add a 'max_link_speed' field to struct cdns_pcie to record the maximum
>> supported link speed (or the currently configured speed). In the common
>> host layer function cdns_pcie_host_start_link(), after the link has been
>> successfully established, call pcie_wait_after_link_train() to insert the
>> required delay if max_link_speed > 2.
>>
>> Glue drivers must set max_link_speed appropriately (e.g., from the device
>> tree property "max-link-speed") to enable the delay.
>>
> 
> You need to club those glue driver patches into this one. Otherwise, you'll end
> up breaking bisectability.

Hi Mani,

Will change.

Best regards,
Hans

> 
> - Mani
> 
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
>>   drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> index 2b0211870f02..51376f69d007 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> @@ -14,6 +14,7 @@
>>   
>>   #include "pcie-cadence.h"
>>   #include "pcie-cadence-host-common.h"
>> +#include "../../pci.h"
>>   
>>   #define LINK_RETRAIN_TIMEOUT HZ
>>   
>> @@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc,
>>   	if (!ret && rc->quirk_retrain_flag)
>>   		ret = cdns_pcie_retrain(pcie, pcie_link_up);
>>   
>> +	if (!ret)
>> +		pcie_wait_after_link_train(pcie->max_link_speed);
>> +
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
>> index 574e9cf4d003..e222b095d2b6 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence.h
>> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
>> @@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
>>    * @ops: Platform-specific ops to control various inputs from Cadence PCIe
>>    *       wrapper
>>    * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
>> + * @max_link_speed: maximum supported link speed
>>    */
>>   struct cdns_pcie {
>>   	void __iomem		             *reg_base;
>> @@ -98,6 +99,7 @@ struct cdns_pcie {
>>   	struct device_link	             **link;
>>   	const  struct cdns_pcie_ops          *ops;
>>   	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
>> +	int				     max_link_speed;
>>   };
>>   
>>   /**
>> -- 
>> 2.34.1
>>
> 


