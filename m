Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5D1C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wc+ifX+7O38yry593NEDWvp79xQMU3g4ALAygrP5+5k=; b=tUMP4PiU8sFxn56n9dWBeRBbtM
	s5Mcfm/vWDsULoczXd6m3GFIFoR8BCRXmY+b1lR7N5SKmbo0TCLjsy259eIniHzBSY3ooqXkr/7J7
	0NmdMSKzJmvbm6uOMwODoB7+36LyfWQ82j8FGDIGewaXbUaMKdyO3BJC6RysoICG6R0m1VP4oQCNP
	FV8wgHl32mbTyc16ysCyxLAunmQVAw6IgnjsBWpwfm/joggxOjIzxnKIZwl7PkKERJl386tnHAl62
	2y1atAtbQN7I7ND4m3ceG6aLryNi26upCCbDkB6kBgC+31CuhFpFI/ZKOboBzmS2WhWciuFRoHQzc
	FwVmqz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNT9p-0000000HV4P-12NN;
	Fri, 06 Jun 2025 09:14:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNT7i-0000000HUnd-1Bfk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 09:12:27 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-addda47ebeaso367306266b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 02:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749201144; x=1749805944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wc+ifX+7O38yry593NEDWvp79xQMU3g4ALAygrP5+5k=;
        b=hxf5edsbArza+DZ1IEAjtDvCAa4KPXstSNn8B9mEtPRZVUgwF9q+naCD45ly4xABWQ
         EkDsaQDhpY41lF1ihXpPT1m0ZhBuOYZd5S65+WXRTHXTT3vs0C3DphhQQgjWrVY3EfqE
         CC1l2FEF+qGxKjUn4onUTbaeL7gSZMqOGqFpusOw7BALlwX1AmvFaWogI/nOeq8lZLr1
         4Y1LW/zX65c9fC++d0fcp8cDfrJ83E+ZL5OTRRMEdv4zItVeFfKOVpPMUBTT0C42eoGx
         aitfUWp7mueLySOI/2I1DegiXu7JyJLuPKvXT4Lu2nsTeLKIBv/bsNl8gxqg1MriDVwj
         Pemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201144; x=1749805944;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wc+ifX+7O38yry593NEDWvp79xQMU3g4ALAygrP5+5k=;
        b=IgGR74RZfcHKwK6LmB7O7KietOBs5IgYXgdOtpTnFFwfD0tGAViebjLUOROauQAwzA
         jEdXL/+YrBgNpmZ50+rjOwxhaRsSabR6rT3O+CLvOsYpVFACkdSuafBBjwl3ANn7j3LU
         EPRSDI51jxmsrn11p64fm/Cr/W59rt4PgPqiamh8JE64hiyQmvICeQTWso5NlT9+NOhO
         t/RA4dgxd0sn+l65XEtpSDlAm0xNaS00j8RsFCT7xkOmKPv0XeRkCeF4qnLweROqTkno
         TulLAacfnbFM8lD3J0K+tf5eE3johJ72fajxHsx/UQtyQ7tzufqEi3J/KJgkW1UzW/Nx
         uN+w==
X-Forwarded-Encrypted: i=1; AJvYcCVw0MYF8czF0N3ItAw6vkaa1hwW/S7TUH55B39Mg5iYOSJtRBxI84sOzVEY9ujMqcCgSJ4hCps9u4O8pObAhpxp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4tYCJHgfF77QMwgqQ5vIKOLfwFanp6vxhLiMN/Oaf9ql8gMN/
	reERZqznv0LksDkPgMVAXTkgLgoBuC6olFDvwMxE7E6x9fuQG7ThlKjEQeDoqPMsk+c=
X-Gm-Gg: ASbGncsbNpJ/T2W9/HQo8DhYPth5w6aqD4ykE16mTZo3zggwi7IM3Et9NyZuF0y5bFw
	3m+YSy/1MJhNBlMIKlZTd6tPhLPBFPH3klhfukh/fOkGd/tPm4H9yhdCV9aTmhrOzzm0nj0HB8M
	Ds9DMQMx1Sg6ehg1nVKeVuRvRZaySoa49OZU3ID4AhNGINtrfq2vsNE9DQAzW2jNuoyDoYMO8mj
	C2Dson1bacnBD9pBFqshsxgNArku4J0oZX6vuIDlOHUWg4uqT2f78N18Fq6avsuAWR12j62nR2s
	rL2RIXZUsf2Gggo4GC5k02+eyvgPf1/us5w/NLWitB0ZSmpKAVN0/w82PfjD
X-Google-Smtp-Source: AGHT+IEjDHiLE7sMo+a12s7VFlD8SjfCEiBfxxMF3QVGmJjKfSvQI7x7ZEGc6pDRlowYGNhvaszk6A==
X-Received: by 2002:a17:907:bb49:b0:adb:428f:f748 with SMTP id a640c23a62f3a-ade1aa06c95mr206620466b.21.1749201143788;
        Fri, 06 Jun 2025 02:12:23 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7d300sm85900566b.179.2025.06.06.02.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 02:12:23 -0700 (PDT)
Message-ID: <53921bd9-6ac9-49fb-8c9d-2c439ec8cd5b@tuxon.dev>
Date: Fri, 6 Jun 2025 12:12:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 john.madieu.xa@bp.renesas.com,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250605225730.GA625963@bhelgaas>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250605225730.GA625963@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_021226_415988_B9449B39 
X-CRM114-Status: GOOD (  20.19  )
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

Hi, Bjorn,

On 06.06.2025 01:57, Bjorn Helgaas wrote:
> On Fri, May 30, 2025 at 02:19:13PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>> only as a root complex, with a single-lane (x1) configuration. The
>> controller includes Type 1 configuration registers, as well as IP
>> specific registers (called AXI registers) required for various adjustments.
> 
>> +/* Timeouts */
>> +#define RZG3S_REQ_ISSUE_TIMEOUT_US		2500
>> +#define RZG3S_LTSSM_STATE_TIMEOUT_US		1000
>> +#define RZG3S_LS_CHANGE_TIMEOUT_US		1000
>> +#define RZG3S_LINK_UP_TIMEOUT_US		500000
> 
> Are any of these timeouts related to values in the PCIe spec?  If so,
> use #defines from drivers/pci/pci.h, or add a new one if needed.
> 
> If they come from the RZ/G3S spec, can you include citations?

The values here were retrieved by experimenting. They are not present in
RZ/G3S specification. I'll look though the header you pointed and use any
defines if they match.

> 
>> +static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host, bool probe)
>> +{
>> +	u32 val;
>> +	int ret;
>> +
>> +	/* Initialize the PCIe related registers */
>> +	ret = rzg3s_pcie_config_init(host);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Initialize the interrupts */
>> +	rzg3s_pcie_irq_init(host);
>> +
>> +	ret = reset_control_bulk_deassert(host->data->num_cfg_resets,
>> +					  host->cfg_resets);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Wait for link up */
>> +	ret = readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, val,
>> +				 !(val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS), 5000,
>> +				 RZG3S_LINK_UP_TIMEOUT_US);
> 
> Where do we wait for PCIE_T_RRS_READY_MS before pci_host_probe()
> starts issuing config requests to enumerate devices?

I missed adding it as RZ/G3S manual don't mention this delay.

> 
>> +	if (ret) {
>> +		reset_control_bulk_assert(host->data->num_cfg_resets,
>> +					  host->cfg_resets);
>> +		return ret;
>> +	}
>> +
>> +	val = readl(host->axi + RZG3S_PCI_PCSTAT2);
>> +	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
>> +
>> +	val = FIELD_GET(RZG3S_PCI_PCSTAT2_STATE_RX_DETECT, val);
>> +	dev_info(host->dev, "PCIe x%d: link up\n", hweight32(val));
>> +
>> +	if (probe) {
>> +		ret = devm_add_action_or_reset(host->dev,
>> +					       rzg3s_pcie_cfg_resets_action,
>> +					       host);
>> +	}
>> +
>> +	return ret;
>> +}
> 
>> +		 * According to the RZ/G3S HW manual (Rev.1.10, section
>> +		 * 34.3.1.71 AXI Window Mask (Lower) Registers) HW expects first
>> +		 * 12 LSB bits to be 0xfff. Extract 1 from size for this.
> 
> s/Extract/Subtract/

OK.

Thank you for your review,
Claudiu

