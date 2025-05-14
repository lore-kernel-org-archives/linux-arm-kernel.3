Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87970C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fU4PVewcc9MxNH8+f8DwyzdamtEdKDmr83HGRbxUgQA=; b=H16wVyUpb/LpJCkW3BgwKBl2ZU
	Uc+TNU0yT5OsTt3LICRH6fK9t2yXNlXarkM2Xh1Uf/awtfDnTwlL+9a8PsxM1NiMIL3TGWI/rrrqK
	IdCndNECs73jganG94najKDZyu2Al+82fRSp1n7tSTjtcqhTJ+r87cmlyzpSPiY/Uafurq3XLJdWI
	CQ4WR3ceryHBkles96Qje1ip7AE+OJN/z2OPPcbUk6ZIVuoKUTHOligXxqoaOoniUhwT5So+3+x+N
	W4vL90NmuBQykyLRix/tKLvU70Zu+0N3rgE+0XDfQkdWHvkC0o0SEtRHNcDeHJapgwlwOJXjlHESm
	2lpaKN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5u-0000000F3k7-1Iwc;
	Wed, 14 May 2025 12:20:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9MX-0000000En5A-2Fy2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 10:29:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a0b646eff7so5724647f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747218560; x=1747823360; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fU4PVewcc9MxNH8+f8DwyzdamtEdKDmr83HGRbxUgQA=;
        b=cdoGc0XwjZnYRHiKKcAqV7iN9vQvHrjx6nbqbAlDtQ09IlH76kbodd0VeJ8F/PMnSs
         IASnPi0S6gpn5HzM91i8AWZ6t7r5bmLK0bLhozvPgdU4nybcPo2+oae3WQ4ID/5WwALY
         yVEq+vMw+gZpOVd+RtGaffSwpr0yXoK17PB1TjNwIUhkSeSZA62B1bQQeHaKHqmzQxQx
         VIAm4mkN9M7b4gPjCstWLn5F/ONDp8S9t7l6XNjgHvVRMg9Y3WU/SBFHsjmpxg2PaktI
         Bj22jGv72Gqf4HBYpXcG3+5y+t+oT7ZSHsGeu3n8rs5uhfRZt8TtuVd8bWCGUVcI/VZB
         JWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747218560; x=1747823360;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fU4PVewcc9MxNH8+f8DwyzdamtEdKDmr83HGRbxUgQA=;
        b=RsGTiwgJHjS1wJxjgIlvZHBnuYF2iMCUAtsETfmraECu8oABYgvurWkXhCBj+qQqhS
         WcCu2m78rGWzP5KnI1PtEgOiRfDcihkVBBIGyKloS2hjxDbBEqPr6uKwvGS/RfRTqW2J
         qqVDLqPl5XHgH3N2MGp1PhsfYfUvNlL31q3rzxG8KaJ2oOY/RQP3awWqfXb8CyvXL04z
         KouLuiAlbaIfuAef/oqO1tm7SpzKiaMXEGaH49BhJlJbmnWVLOnuOuxxtY2b904QV6fs
         nAOaN0pCXMwr4x2fjZDhkY59HyJbB8eA4opMZxssEviEbdRC40Drz22jFMQODa21atWz
         +ntQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXu7xtPkaUVFkHPLcAzhC0idIZXBuLeplR724w8HrbDRs3KxUjq4TFER9Xc9HQMP27iI9hlfXYVrIhrBOg4WpX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi0/M+w81WrElTOKgfdyeepON5jA5LPYPup12Ek+qb+uxpYyIz
	UTeAAzX3g/qar8R7EwBAFLPpO3XiGEnlPN2wXpuCoSZmylPtS7Xo9R8NDJ1OI7w=
X-Gm-Gg: ASbGnctgn5bzY1qCvpEM2HPmBcSkyhxuRWCUpAY/ArakhPYA5EwPG0FmGkMMWKPfoZw
	WgzSAyuskeARN9V6JhTV98/KWnJERlJ8d7l6zmApy0NRQdPMu3EpajT6o1yhd9qAiwA0FDJKMSr
	HWpcPBI49F6PI9AcCRN3U9YRyKFw4lyy+5BqDypc20ojjGClI7k044YVu11yHIWfkr5wxK3nCB5
	dLTGqNO6nYr2mbUcM40m1KntnB57vTYj2eBfpEeEUIhMszjdZe1zOcWSZ9Lg5hMIVUkyPlLNmUA
	cpqrkIo9GGKKjt0/IQ9U+1HfdeL3TzD/k3MmnjeeQea84duwqnaEgk/eItY=
X-Google-Smtp-Source: AGHT+IGyw3NxozgVzbMrkAVh72sdE2V/yiO6fwgF41eG84LxNtgGijn9Y7vFEYBwAZhyZjVRwxqXEQ==
X-Received: by 2002:a05:6000:400c:b0:3a0:aeba:23b1 with SMTP id ffacd0b85a97d-3a349946a98mr1835187f8f.49.1747218559944;
        Wed, 14 May 2025 03:29:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a22ea7a53asm7334492f8f.23.2025.05.14.03.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 03:29:19 -0700 (PDT)
Message-ID: <e470715b-6f76-4b65-b1af-7a24e0432a30@tuxon.dev>
Date: Wed, 14 May 2025 13:29:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, saravanak@google.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250512203851.GA1127434@bhelgaas>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250512203851.GA1127434@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_032921_576462_CBD2A0B7 
X-CRM114-Status: GOOD (  21.88  )
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

On 12.05.2025 23:38, Bjorn Helgaas wrote:
> On Fri, May 09, 2025 at 01:29:40PM +0300, Claudiu Beznea wrote:
>> On 05.05.2025 14:26, Claudiu Beznea wrote:
>>> On 01.05.2025 23:12, Bjorn Helgaas wrote:
>>>> On Wed, Apr 30, 2025 at 01:32:33PM +0300, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>>>> only as a root complex, with a single-lane (x1) configuration. The
>>>>> controller includes Type 1 configuration registers, as well as IP
>>>>> specific registers (called AXI registers) required for various adjustments.
>>>>>
>>>>> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
>>>>> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
>>>>> host driver can be reused for these variants with minimal adjustments.
>> ...
> 
>>>>> +static void rzg3s_pcie_update_bits(void __iomem *base, u32 offset, u32 mask, u32 val)
>>>>> +{
>>>>> +	u32 tmp;
>>>>> +
>>>>> +	tmp = readl(base + offset);
>>>>> +	tmp &= ~mask;
>>>>> +	tmp |= val & mask;
>>>>> +	writel(tmp, base + offset);
>>>>> +}
>>>>
>>>> Nothing rzg3s-specific here.
>>>>
>>>> I think u32p_replace_bits() (include/linux/bitfield.h) is basically this.
>>>
>>> I wasn't aware of it. I'll use it in the next version. Thank for pointing it.
>>
>> I look into changing to u32p_replace_bits() but this one needs a mask that
>> can be verified at build time. It cannot be used directly in this function.
>> Would you prefer me to replace all the calls to rzg3s_pcie_update_bits() with:
>>
>> tmp = readl();
>> u32p_replace_bits(&tmp, ...)
>> writel(tmp);
> 
> It seems like this is the prevailing way it's used.
> 
> You have ~20 calls, so it seems like it might be excessive to replace
> each with readl/u32p_replace_bits/writel.
> 
> But maybe you could use u32p_replace_bits() inside
> rzg3s_pcie_update_bits().

I tried it like:

#define rzg3s_pcie_update_bits(base, offset, mask, val)	\
	do {						\
		u32 tmp = readl((base) + (offset));	\
		u32p_replace_bits(&tmp, (val), (mask));	\
		writel(tmp, (base) + (offset));		\
	} while (0)

But the mask may still depend on runtime variable. E.g. there is this call
in the driver (and other similar):

static void rzg3s_pcie_msi_irq_mask(struct irq_data *d)
{
        struct rzg3s_pcie_msi *msi = irq_data_get_irq_chip_data(d);
        struct rzg3s_pcie_host *host = rzg3s_msi_to_host(msi);
        u8 reg_bit = d->hwirq % RZG3S_PCI_MSI_INT_PER_REG;
        u8 reg_id = d->hwirq / RZG3S_PCI_MSI_INT_PER_REG;

        guard(raw_spinlock_irqsave)(&host->hw_lock);

        rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_MSIRM(reg_id),
                               BIT(reg_bit), BIT(reg_bit));

}

reg_id is a runtime variable and cannot be checked at compile time thus the
compilation of u32p_replace_bits() fails with:

../include/linux/bitfield.h:166:3: error: call to ‘__bad_mask’ declared
with attribute error: bad bitfield mask
  166 |   __bad_mask();
      |   ^~~~~~~~~~~~

Please let me know if you have other suggestions.

Thank you,
Claudiu

