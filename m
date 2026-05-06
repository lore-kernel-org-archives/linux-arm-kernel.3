Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95689CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfHQJNSrcWZKEHr40jicKw8cLpZAeqLEydFiIKDjPew=; b=0mQ5gZXZ9IAZNF+q2znejaf0ov
	GYAnh7kM4sZNH3Wc3Q5CZQBFbeFFHUO0s41RzvF9fhwpqKse/uONBHMRlAyefywNoQvqlB8EnHNqS
	nrZQgKEMvZ0R5NxKDSCKutkiGU5n3xpJ5EOqBXicJlJhqXXAqGyiEOd/63Ijpy5evrPq3zp+iDQFe
	P8n+Bo9f0d9Te4Y339Y6kLE3ZWb61xGSBMWdahnwKNzfazqcN18e8n14dyEr0uPmVu9GZPNX6zQcn
	IRRilB6udfsDJ8jfS/zCVIxbTKalx4QtZyFbxjs+Omaete+32ERTYnRMOWQkZEk+78RCHq1XGfnIh
	Gn+d7w5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKetN-00000001Sz7-2uLO;
	Wed, 06 May 2026 16:14:33 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKetM-00000001SyO-0zoe;
	Wed, 06 May 2026 16:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=UfHQJNSrcWZKEHr40jicKw8cLpZAeqLEydFiIKDjPew=;
	b=X7e6W06dzG9bg7e4vXBUThRr6JgymlgdH6czq50E76dL69QAoJYpQAlXJIyIDf
	911If+Xaql37u8fiFpriZvbtopj0Y4/o5oBXZ+dKnpTIQLJgxRE6gDGcQFTNv7Ya
	JuN51vhC/W0GM9lar+eArupIeyzqAiPiHBh5syBSdVjYk=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCnyumpaPtp6K0KDw--.17012S2;
	Thu, 07 May 2026 00:13:30 +0800 (CST)
Message-ID: <384aac89-b99b-45bd-a080-adbc45c2d281@163.com>
Date: Thu, 7 May 2026 00:13:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
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
 <20260506152346.166056-2-18255117159@163.com>
 <qryvbq7tn7gpkx63ljauddp3qxczgbzlpfkxiula7vq6f23yaz@oi2pal2ynzgv>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <qryvbq7tn7gpkx63ljauddp3qxczgbzlpfkxiula7vq6f23yaz@oi2pal2ynzgv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wCnyumpaPtp6K0KDw--.17012S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWfXFyfAryDuryxtrykGrg_yoW8Cr1Dpa
	95GF1YkF48XFW3Wan3Aa43XFyYqFs3ta4UGr97Ga4kGF9xurn3JF4Fg3y5Wrn3Xrs0vr12
	yF15Kw17CF4YyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uso7iUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwwqdQWn7aKpcsQAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_091432_605934_62C4B8A1 
X-CRM114-Status: GOOD (  15.72  )
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



On 5/6/26 23:55, Manivannan Sadhasivam wrote:
> On Wed, May 06, 2026 at 11:23:39PM +0800, Hans Zhang wrote:
>> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
>> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
>> minimum of 100 ms after Link training completes before sending any
>> Configuration Request.
>>
>> Introduce a static inline helper pcie_wait_after_link_train() that checks
>> the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and calls
>> msleep(100) only when the speed is greater than 5.0 GT/s. The helper uses
>> the existing PCIE_RESET_CONFIG_WAIT_MS macro defined in pci.h.
>>
>> This allows multiple host controller drivers to share the same mandatory
>> delay without duplicating the logic.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/pci.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 4a14f88e543a..a8705a2a2d85 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
> 
> Since this helper is for host controller drivers, this needs to be defined in
> pci-host-common.h.
> 

Hi Mani,

Thank you very much for your reply and suggestions.

Will change.

>> @@ -60,6 +60,19 @@ struct pcie_tlp_log;
>>    */
>>   #define PCIE_RESET_CONFIG_WAIT_MS	100
>>   
>> +/**
>> + * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
>> + * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
>> + *
>> + * Must be called after Link training completes and before the first
>> + * Configuration Request is sent.
>> + */
>> +static inline void pcie_wait_after_link_train(int max_link_speed)
> 
> pci_host_common_link_train_delay()?

I think it's really great. Thanks.

Best regards,
Hans

> 
> - Mani
> 


