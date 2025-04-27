Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF30C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hi3ytW2JJOVFOaND+zNAN3cQVQYz5DqcVtZd66jYcc=; b=wksRdwoB9wz7UGsPHK2mfFWy2f
	wiTA6gFt/wvMC50hjMe1dGWTnP6dRQuK8HpVpsmm2L90tM4ODlScxKellZfbf0KXbHDLRdX6AAnPf
	vBqavL01JgFQASSnexpvF9LJwJMOnlq4FT+bhoFCRq0aHQARHJGFDeP8aabR7/kpxmv9zQU/mzMjY
	wRmyyzv6RsXRklGtqNfp6jC9/MH1KBfh5nof16A+WXDRS/eTpbXM9m6UEvYrPwPvw1Q8jc4a+j2fq
	vkx3DmmS/9dRoKQsyEAcH13zznjPZU3pPZ+fsaM31kNEGhASNiOQLYOFLMUaGgTS0YP9UDP8dEnOz
	RXwdjAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9368-00000003fvf-1IkL;
	Sun, 27 Apr 2025 14:35:12 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92yq-00000003f4L-1tQE;
	Sun, 27 Apr 2025 14:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=6hi3ytW2JJOVFOaND+zNAN3cQVQYz5DqcVtZd66jYcc=;
	b=TqUXsezzrI68t0pq8SAyOPLMcSZPD/TOy9nhOxYI1Pxb9h73VjBklZt2FnMyLb
	/yOdzzwpq7iocWGZnF1CR6arfo9YsdKOLHb4KSNxzWdC+fP/le8rPRAwSZSqVkD7
	cN4XPeeAtY5hlEmypu149GH+lqLQ7fbvcP00fSGqnqVy8=
Received: from [192.168.71.89] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wA3jySSPg5ofRKLCw--.19505S2;
	Sun, 27 Apr 2025 22:26:27 +0800 (CST)
Message-ID: <c12ac95a-51d6-45a6-bf1b-29964e817a7d@163.com>
Date: Sun, 27 Apr 2025 22:26:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] PCI: dw-rockchip: Reorganize register and bitfield
 definitions
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, robh@kernel.org, jingoohan1@gmail.com,
 shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Niklas Cassel <cassel@kernel.org>
References: <20250427125316.99627-1-18255117159@163.com>
 <20250427125316.99627-3-18255117159@163.com>
 <mbgc46teac74goifhuj4fegmtaagfoqkhlm4uid23jurbvi2xa@wnhycs77kk6w>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <mbgc46teac74goifhuj4fegmtaagfoqkhlm4uid23jurbvi2xa@wnhycs77kk6w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wA3jySSPg5ofRKLCw--.19505S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Wr13Ww18try3uF1DCFykZrb_yoW7Xr47pa
	4DAa4Ikr45t3y7Z3sY9F98ZFWIqrnxKFWUGrs3K3y8u3WkAw18Gr1jgF95Wry7Jr4kAryf
	uwn8u34xWFWakrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBrWwUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhw8o2gOIurF2wACsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_072740_872422_C30CBC8A 
X-CRM114-Status: GOOD (  13.91  )
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



On 2025/4/27 22:14, Manivannan Sadhasivam wrote:
> On Sun, Apr 27, 2025 at 08:53:15PM +0800, Hans Zhang wrote:
>> Register definitions were scattered with ambiguous names (e.g.,
>> PCIE_RDLH_LINK_UP_CHGED in PCIE_CLIENT_INTR_STATUS_MISC) and lacked
>> hierarchical grouping. Magic values for bit operations reduced code
>> clarity.
>>
>> Group registers and their associated bitfields logically. This improves
>> maintainability and aligns the code with hardware documentation.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> Reviewed-by: Niklas Cassel <cassel@kernel.org>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> ---
>>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 49 ++++++++++++-------
>>   1 file changed, 31 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> index e7d33d545d5b..a778f4f61595 100644
>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> @@ -33,24 +33,37 @@
>>   
>>   #define to_rockchip_pcie(x) dev_get_drvdata((x)->dev)
>>   
>> -#define PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
>> -#define PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
>> -#define PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
>> -#define PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
>> -#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
>> -#define PCIE_CLIENT_INTR_MASK_MISC	0x24
>> -#define PCIE_SMLH_LINKUP		BIT(16)
>> -#define PCIE_RDLH_LINKUP		BIT(17)
>> -#define PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
>> -#define PCIE_RDLH_LINK_UP_CHGED		BIT(1)
>> -#define PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
>> -#define PCIE_CLIENT_GENERAL_CONTROL	0x0
>> +/* General Control Register */
>> +#define PCIE_CLIENT_GENERAL_CON		0x0
> 
> Is this the actual name of the register as per the documentation? Just asking
> because of '_CON' instead of '_CONTROL'.
> 

Hi Mani,

Yes. I saw that RK3588 TRM is named like this.

PCIE_CLIENT_GENERAL_CON

Best regards,
Hans


> - Mani
> 
>> +#define  PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
>> +#define  PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
>> +#define  PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
>> +#define  PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
>> +
>> +/* Interrupt Status Register Related to Legacy Interrupt */
>>   #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
>> +
>> +/* Interrupt Status Register Related to Miscellaneous Operation */
>> +#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
>> +#define  PCIE_RDLH_LINK_UP_CHGED	BIT(1)
>> +#define  PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
>> +
>> +/* Interrupt Mask Register Related to Legacy Interrupt */
>>   #define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
>> +
>> +/* Interrupt Mask Register Related to Miscellaneous Operation */
>> +#define PCIE_CLIENT_INTR_MASK_MISC	0x24
>> +
>> +/* Hot Reset Control Register */
>>   #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
>> +#define  PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
>> +
>> +/* LTSSM Status Register */
>>   #define PCIE_CLIENT_LTSSM_STATUS	0x300
>> -#define PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
>> -#define PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
>> +#define  PCIE_SMLH_LINKUP		BIT(16)
>> +#define  PCIE_RDLH_LINKUP		BIT(17)
>> +#define  PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
>> +#define  PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
>>   
>>   struct rockchip_pcie {
>>   	struct dw_pcie pci;
>> @@ -161,13 +174,13 @@ static u32 rockchip_pcie_get_ltssm(struct rockchip_pcie *rockchip)
>>   static void rockchip_pcie_enable_ltssm(struct rockchip_pcie *rockchip)
>>   {
>>   	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_ENABLE_LTSSM,
>> -				 PCIE_CLIENT_GENERAL_CONTROL);
>> +				 PCIE_CLIENT_GENERAL_CON);
>>   }
>>   
>>   static void rockchip_pcie_disable_ltssm(struct rockchip_pcie *rockchip)
>>   {
>>   	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_DISABLE_LTSSM,
>> -				 PCIE_CLIENT_GENERAL_CONTROL);
>> +				 PCIE_CLIENT_GENERAL_CON);
>>   }
>>   
>>   static int rockchip_pcie_link_up(struct dw_pcie *pci)
>> @@ -516,7 +529,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>>   	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
>>   
>>   	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_RC_MODE,
>> -				 PCIE_CLIENT_GENERAL_CONTROL);
>> +				 PCIE_CLIENT_GENERAL_CON);
>>   
>>   	pp = &rockchip->pci.pp;
>>   	pp->ops = &rockchip_pcie_host_ops;
>> @@ -562,7 +575,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>>   	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
>>   
>>   	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_EP_MODE,
>> -				 PCIE_CLIENT_GENERAL_CONTROL);
>> +				 PCIE_CLIENT_GENERAL_CON);
>>   
>>   	rockchip->pci.ep.ops = &rockchip_pcie_ep_ops;
>>   	rockchip->pci.ep.page_size = SZ_64K;
>> -- 
>> 2.25.1
>>
> 


