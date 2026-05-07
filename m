Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E856CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 02:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcexbzChlIPm5ezwkYYKsN/sTQpx30eqrb2Z67XEnQQ=; b=t1xPsM8EwFGyVlkAr6dpV3PO5L
	O8zkHhbqKrQQJByYIfMd4RpmrPjJTSKQGPGr5Tyc/2E2JYpCeNcda8QUXsUHEVLVsuc32uYse/+Lk
	E6sLMEMJLkmz4BtwlO4hIx3RVF+032iKpJ7rv/limVfgIZMxSLDcQYqejQVtaR93RKrb/q4dIUc3+
	s8WPwXx3B+5aW/JcOmD16DfoOl0C4O2t+2kPfANYSqsMMruZLVhPoizenMjA76Wp+mZcBnGMJ9Ti1
	XzHp31rhU96SUy2FIkc21AyX27APu+H3A+GdtsRxY4UG8by2YW200GmmGp3SpghvkTbyk1rQcDoBo
	khpqqgWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKoug-00000002ZzZ-1jYg;
	Thu, 07 May 2026 02:56:34 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKoud-00000002Zyq-3t4h;
	Thu, 07 May 2026 02:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=rcexbzChlIPm5ezwkYYKsN/sTQpx30eqrb2Z67XEnQQ=;
	b=DUOy+8ohKqqvW2jpwsFKZZUC4czjWDI4CVp5StqhEa1h7q3YG+6lNdXd4ns7Qe
	afDrFlzProb4Qf1RNsTc6T1XVTc9Ui2OtupmW15JmT73g4Ur+moa+xR+rYSRQCP4
	kMx5L1Mxkt28VmNasoxt9VSofgCGz8pSdm9IUhN7CaBWY=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3R6Yn__tp9RRWDw--.64792S2;
	Thu, 07 May 2026 10:55:35 +0800 (CST)
Message-ID: <a236aca1-bc31-4ee5-b1b3-59d0a7d70c8b@163.com>
Date: Thu, 7 May 2026 10:55:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI: brcmstb: Assign pcie->gen from
 of_pci_get_max_link_speed()
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-pci@vger.kernel.org
Cc: Dom Cobley <popcornmix@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <mid:20260501202438.376033-1-florian.fainelli@broadcom.com>
 <20260506164537.103196-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260506164537.103196-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD3R6Yn__tp9RRWDw--.64792S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1fZr4fXry7KF4xJF1DKFg_yoW8Ar1Dpa
	9rJay8tFyUtFWrua1UG3W5uF1Ygan5urW7KwsxWw17uanIy34rKFy29ryfJF9rKFs7uw13
	X3Way3W7GF1ayF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR573PUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AhjB2n7-yhitgAA3R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_195632_335557_1185B38B 
X-CRM114-Status: GOOD (  15.13  )
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



On 5/7/26 00:45, Florian Fainelli wrote:
> After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
> pcie->gen stopped being assigned and as a result the established PCIe
> link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
> to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().
> 
> Whether the 'max-link-speed' property is not specified, or it exceeds
> Gen3, resort to the HW defaults.
> 
> Link: https://github.com/raspberrypi/linux/issues/7343
> Reported-by: Dom Cobley <popcornmix@gmail.com>
> Reported-by: Phil Elwell <phil@raspberrypi.com>
> Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Change-Id: Ic5431469dd7a6c8b391f84f27119dad876256880

Reviewed-by: Hans Zhang <18255117159@163.com>

> ---
> Changes in v2:
> 
> - utilize of_pci_get_max_link_speed() directly
> - also validate against exceeding Gen3
> 
>   drivers/pci/controller/pcie-brcmstb.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 714bcab97b60..08a0e7091ced 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -2072,8 +2072,10 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>   		return PTR_ERR(pcie->clk);
>   
>   	ret = of_pci_get_max_link_speed(np);
> -	if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
> +	if (ret < 0 || ret > 3)
>   		pcie->gen = 0;
> +	else
> +		pcie->gen = ret;
>   
>   	pcie->ssc = of_property_read_bool(np, "brcm,enable-ssc");
>   


