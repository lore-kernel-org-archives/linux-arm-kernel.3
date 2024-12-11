Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5EBE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 20:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RF+SgaA8A4yu1/WtuO/9GkUtQsQvHRuIDWUMOSCXiAk=; b=eYAYAQca2/JskWp5EmUjn30dFw
	x9D+6ieo4o2Iy9XdxRevn+PBlORI9pjO6Mj8u1oygiztGH7zqcbfq1s3ji+2GeFjmAZvvBI42neO8
	NrbEB2iKy3qLzjbXsweJJaWWXsgLWJwdqZk26869GJUBtefm22sFmUmrYr8r8oSQM/1u+fsDprdI9
	cwmkg/z5IZPrYJ+t9U7dPEZ+3oO48vIgq818nAiINh8Xs9MsxdpgBRc13RpLnDBDgk2C4HS7vDgd4
	USDWs5eB0ePRdorf7WDg04hc0Sq8on2mH/KUA4T8JsIyDZtZgjS1RpuXNTvkMCB7e47CRTdHZRXyp
	ZGWOB6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLSv6-0000000FzeY-39Im;
	Wed, 11 Dec 2024 20:02:52 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLSu0-0000000FzK4-2RU0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 20:01:47 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4678664e22fso15100561cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 12:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733947303; x=1734552103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RF+SgaA8A4yu1/WtuO/9GkUtQsQvHRuIDWUMOSCXiAk=;
        b=Nl+gGm/qJ+ULcjZsIPMlgR1Ipr0LBSiX0b3FawyOKHqc5/JJpZaGNNQCByJBOJkWoU
         3IWT9nWVrPMMqCND44HTFgsNThA9Qcx3P/xqrkr4uiNBdwC+E6q46jBypcXGcklisupA
         GezzZ9CiGhnKPKLVt1H0azCebDgEcKiFPXJc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733947303; x=1734552103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF+SgaA8A4yu1/WtuO/9GkUtQsQvHRuIDWUMOSCXiAk=;
        b=sp9NSRgoVl5Xin79VXfedrhYZZQ3aYRKqaMUuFfuDtUqPG8r+U18EfyU6/ciDkjp39
         hERAaTqR2NpEhw1/6VesgY/xjAfvKZctVv5a5fj8HrOhDqfSj0oDgKDZvBbTCTT2U1q8
         GcihIz6v/cz+sQafbLostrPeQ6h25xvNLxHomOglWWeImCZ1Cb8RgzvdSZbPxydHL1m6
         IyGH1e5h/4fSwB2S7rI8I+I6U+EUWPnnpgsASNmCl8HcopikVA6Og4/bacW5qjewBwN4
         lJslmP9p7Whc34IVAtGkGa4Fex5bdbLb3CYNrlxJEQa3EkQpy5JpSoG1W9nEJ+JTJpCA
         wrsA==
X-Forwarded-Encrypted: i=1; AJvYcCWNFf7AL7Q2nTVhAOP7MMDAkk3wwdnAMzAB8pxzPkNEVk5jR0G2wnVJ4XXNmqAsdXGzJOa8/XKT9jzHACx8Ie6x@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd2bUZ8Rb5Uke5Z6i3fbyd8yvn5tlYt8S0dxMTfujkp04EtD4e
	4bHT7VJat/0c7eUwAVDa2eTRfHUVneFin+m4seCjOphoBjx6ld4NLQRyxvXuOQ==
X-Gm-Gg: ASbGncvDhHmH+pTfyQDOxXIsapCsJcoGsiKPLNTgrJH/+JYDmYfBF1vVSXWgongRCzM
	3o64c+1xDEKvR8x91/zLsrZp92FK/CwJIBPOc746p6h7yIjFUBeDvXu08N3lMnfRm0corYsjiLG
	I82JFTl8Sb+Q18hDPSQMw3rWIoAJCsrATlXSQiJ2cM6ACG8D0QUwJL+ccTpGaW9N6SzvHyUyGEi
	AsXuy4zSIL+ObYSqzImU6mBZGyOdOOIk67+JgiXbTppMYD3+31lPwWEfHOngDQFmawXKWgRISvP
	ZMV/3rui4HdpiFs=
X-Google-Smtp-Source: AGHT+IH1EItEhDF0PhWzxH0hzNi2adGVkl/4FI0Nh7NmAubh3vPiMk36HkqtIjpl2KFJLYurfshIMQ==
X-Received: by 2002:ac8:7f42:0:b0:467:59a3:b44a with SMTP id d75a77b69052e-467962a741dmr12907131cf.56.1733947303166;
        Wed, 11 Dec 2024 12:01:43 -0800 (PST)
Received: from [10.28.17.173] ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467583c1b6asm43931021cf.44.2024.12.11.12.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 12:01:42 -0800 (PST)
Message-ID: <f0a734d9-6bf6-4d28-b30b-99b6be9f62dc@broadcom.com>
Date: Wed, 11 Dec 2024 15:01:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 06/10] PCI: brcmstb: Enable external MSI-X if available
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>
References: <20241025124515.14066-1-svarbanov@suse.de>
 <20241025124515.14066-7-svarbanov@suse.de>
Content-Language: en-US
From: James Quinlan <james.quinlan@broadcom.com>
Autocrypt: addr=james.quinlan@broadcom.com; keydata=
 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
In-Reply-To: <20241025124515.14066-7-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_120144_619332_D2997646 
X-CRM114-Status: GOOD (  21.30  )
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

On 10/25/24 08:45, Stanimir Varbanov wrote:
> On RPi5 there is an external MIP MSI-X interrupt controller
> which can handle up to 64 interrupts.
>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---
> v3 -> v4:
>   - no changes.
>
>   drivers/pci/controller/pcie-brcmstb.c | 63 +++++++++++++++++++++++++--
>   1 file changed, 59 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index c01462b07eea..af01a7915c94 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1318,6 +1318,52 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
>   	return 0;
>   }
>   
> +static int brcm_pcie_enable_external_msix(struct brcm_pcie *pcie,
> +					  struct device_node *msi_np)
> +{
> +	struct inbound_win inbound_wins[PCIE_BRCM_MAX_INBOUND_WINS];
> +	u64 msi_pci_addr, msi_phys_addr;
> +	struct resource r;
> +	int mip_bar, ret;
> +	u32 val, reg;
> +
> +	ret = of_property_read_reg(msi_np, 1, &msi_pci_addr, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_address_to_resource(msi_np, 0, &r);
> +	if (ret)
> +		return ret;
> +
> +	msi_phys_addr = r.start;
> +
> +	/* Find free inbound window for MIP access */
> +	mip_bar = brcm_pcie_get_inbound_wins(pcie, inbound_wins);
> +	if (mip_bar < 0)
> +		return mip_bar;
> +
> +	mip_bar += 1;
> +	reg = brcm_bar_reg_offset(mip_bar);
> +
> +	val = lower_32_bits(msi_pci_addr);
> +	val |= brcm_pcie_encode_ibar_size(SZ_4K);
> +	writel(val, pcie->base + reg);
> +
> +	val = upper_32_bits(msi_pci_addr);
> +	writel(val, pcie->base + reg + 4);
> +
> +	reg = brcm_ubus_reg_offset(mip_bar);
> +
> +	val = lower_32_bits(msi_phys_addr);
> +	val |= PCIE_MISC_UBUS_BAR1_CONFIG_REMAP_ACCESS_EN_MASK;
> +	writel(val, pcie->base + reg);
> +
> +	val = upper_32_bits(msi_phys_addr);
> +	writel(val, pcie->base + reg + 4);

Hi Stan,

It looks like all this is doing is setting up an identity-mapped inbound 
window, is that correct?  If so, couldn't you get the same effect by 
adding an identity-mapped dma-range in the PCIe DT node?

Jim Quinlan  Broadcom STB/CM

> +
> +	return 0;
> +}
> +
>   static const char * const supplies[] = {
>   	"vpcie3v3",
>   	"vpcie3v3aux",
> @@ -1879,11 +1925,20 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>   		goto fail;
>   	}
>   
> -	msi_np = of_parse_phandle(pcie->np, "msi-parent", 0);
> -	if (pci_msi_enabled() && msi_np == pcie->np) {
> -		ret = brcm_pcie_enable_msi(pcie);
> +	if (pci_msi_enabled()) {
> +		msi_np = of_parse_phandle(pcie->np, "msi-parent", 0);
> +		const char *str;
> +
> +		if (msi_np == pcie->np) {
> +			str = "internal MSI";
> +			ret = brcm_pcie_enable_msi(pcie);
> +		} else {
> +			str = "external MSI-X";
> +			ret = brcm_pcie_enable_external_msix(pcie, msi_np);
> +		}
> +
>   		if (ret) {
> -			dev_err(pcie->dev, "probe of internal MSI failed");
> +			dev_err(pcie->dev, "enable of %s failed\n", str);
>   			goto fail;
>   		}
>   	}



