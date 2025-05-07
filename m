Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D12C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNmFFnlLRbbea3bahp28nTfyzV1Xhe+xKP45jX8AMAY=; b=GM0kDqVw3h60zrrCIKsVebpj1b
	CFMglyB7fBQLESrdSUatjUvVypLrJZe/TmVs2HA4HJc3bPXEvQSV+wDv4I/WMafn/St3sGaaykPw7
	9f8isuxU8VLrV6tsLCKeTVTdxfMcnm+KrWIpsHuxN081PPkUr3RkbhvEe099dMo0zSgqWWilMmhum
	6wmAP7QRloU6aG00Deg7c2Cf8WMRW1dKtF6ZOwEyU+j766N4duCpaeMiSTwG0gRqH+ZXI8d81+GSl
	eyYPOs1B37NI1nSpLyQv/BJhfnq8pYSL66wh3ntn58GHbr2P+u+fmf1QNjvNNAmFqrCrZaXMnd67z
	hc+KPCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCglW-0000000FzJZ-0p0P;
	Wed, 07 May 2025 15:32:58 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgCH-0000000Frxd-4AAJ;
	Wed, 07 May 2025 14:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=tNmFFnlLRbbea3bahp28nTfyzV1Xhe+xKP45jX8AMAY=;
	b=DW2le85cvHbAy9SNvaybMrSBPDunRSVb5CcYqqAywCjz8Z/8jafn3bTFOlIyEi
	BM2AtqF7+Ib74XnedGReayUxz/MTVTfZwXHuLvT4FlMeyDnn0O0MFoN+zFNl12Ec
	ieqn4hQYr23XcKusyjn0FzupqJ0MeMXNLtPVhmVVv99rg=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXG1lgdBtou6IsFA--.12424S2;
	Wed, 07 May 2025 22:55:29 +0800 (CST)
Message-ID: <2ae86e9f-2a91-476a-b017-e0e20489d8da@163.com>
Date: Wed, 7 May 2025 22:55:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] PCI: Configure root port MPS during host probing
To: Niklas Cassel <cassel@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, manivannan.sadhasivam@linaro.org, yue.wang@amlogic.com,
 pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-2-18255117159@163.com> <aBsN2_YG0RsH4RPA@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aBsN2_YG0RsH4RPA@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wAXG1lgdBtou6IsFA--.12424S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFy3Xr1UJw1DJrWfAFyDGFg_yoWDuFcEv3
	4Y9r47C3y8Xr90kw43ArZ8JrZxGanxZ3yjg348XrZay3s3Ar48A3s7K3WktF4Uu3WFvr17
	Cw1UZF1xA39xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1eT5PUUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxBGo2gbb-2P7AAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_075634_467227_8E5E06EC 
X-CRM114-Status: GOOD (  13.00  )
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



On 2025/5/7 15:38, Niklas Cassel wrote:
> On Wed, May 07, 2025 at 01:34:37AM +0800, Hans Zhang wrote:
> 
> (snip)
> 
>>   static void pci_configure_mps(struct pci_dev *dev)
>>   {
>>   	struct pci_dev *bridge = pci_upstream_bridge(dev);
>> @@ -2178,6 +2209,10 @@ static void pci_configure_mps(struct pci_dev *dev)
>>   		return;
>>   	}
> 
> We should probably add a comment explaining why we are doing this here.
> 
> Perhaps something like:
> 
> /*
>   * Unless MPS strategy is PCIE_BUS_TUNE_OFF (don't touch MPS at all),
>   * start off by setting root ports' MPS to MPSS. Depending on the MPS
>   * strategy, and the MPSS of the devices below the root port, the MPS
>   * of the root port might get overriden later.
>   */
> 
> 

Dear Niklas,

Thank you very much for your reply and suggestions.
It will be added in the next version.

Best regards,
Hans

>> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
>> +	    pcie_bus_config != PCIE_BUS_TUNE_OFF)
>> +		pcie_write_mps(dev, 128 << dev->pcie_mpss);
>> +
>>   	if (!bridge || !pci_is_pcie(bridge))
>>   		return;
>>   
> 
> 
> Kind regards,
> Niklas


