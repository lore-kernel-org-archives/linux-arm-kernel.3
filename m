Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B6C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxDhZkSCewSzQX7ua1xIREYWkVFp8sJWfjRRBdflZuc=; b=WyqXa6yUWMG+J3XN4/nWadG45E
	5afnt+vfGC06gcS3J+J70oOH2yuzVWrrYqW5/4nUtJ6b3pnv+uSRMm2uWNqFZ/Z2WuhNkEJXj1HB7
	57+VGdB7MOrnwr4FKT9ggl+reckMqD0H4TWyHTZFvh6j6OKRzm9XFDLFFo50fOzWZ63yFPIlmcWw2
	r0Y1GQUax7nqcQ9EjrGIZdCmt2IgGMhYAUT22pwbMBovB396yaLhKXOQIejPSYSvml8cQZv1VgJBA
	TT3XjuBNsx720mjDB1nHPiaRFVmarC4h+QtJtkq2/08OnJIwWNKAziNj8XGDq6pLu3YjXpN2Uyl+F
	Xzm6+l7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDM0D-00000003RhJ-0iVa;
	Fri, 09 May 2025 11:34:53 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKzM-00000003HPi-11bC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:29:57 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac3b12e8518so395291166b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746786594; x=1747391394; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OxDhZkSCewSzQX7ua1xIREYWkVFp8sJWfjRRBdflZuc=;
        b=nbzOQnfy34oxy2ePxIuKHw9vx++TLC392xqJVcDa3FynHJ9AJzlyJYxlq6OBJzyJon
         tdSUJxDftxp8zt1nErbI10zqXk/GMgWvd+Hz1xUL4J1yZXLrbzi1bW1wp+/h/I87Vz+9
         O7FjplqY1VVKDLUcWuWQF7AN56ZOh8wgvg8lwp8hNtOCJrrswOYZOz2gUeui90vC1+mM
         kg97MqxbnciJHoQWLOrf58Gy6VSEzXmcfKUJd4cAy/hXXyZ7QDBjNv1ZUt0E7n47CRf0
         iCst061E8YLt6SwnT0XGKFzV+ohszQildhEvLDN9r1MrRFADwMliEQrgeX/3LeQdOt1K
         V8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746786594; x=1747391394;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxDhZkSCewSzQX7ua1xIREYWkVFp8sJWfjRRBdflZuc=;
        b=QAgcqHgDa2cRtFfr3QX86hC3QHHKnXEXOyFWaGDKxWp8xYKTeVFKUrJJoFS7RQ4nOJ
         v3NLX9k3l4Di+NxSx0NpNZSMTwUIwwt14ivk8y8J/C/ej3am2kNTnZURMEhnLsDY/dto
         Vf4mP8lLk/EgSxvESnVtnPIiXUhmqHRkfz+CLIUV48iKF4OnLP+Nq4NbW/SGam+x5tfp
         cOo+dhV7SJOgz77D3dRhclrtciAGECNBC/av3xrzjKqozucLSvlDO0ap/dju76/2icP2
         ZCAOLqccncSEs+Opd12KRbBy7BrwTs9o8nE8lhhGURGeHM3cks/s0Bk4iB7t8yi3ZHA+
         LH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJBsR3u2JAovEOkxf9A+Ho1GOIbvCbs9doniL9KnntOs7HnIHQpV7k2+t044MsB0zwNHW7ZMViSbyZtadRuG3s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+hrKPE1ZZT9iocWrQ0Py7Mt8HA5VPJ8h6WIq+dBYOfZlEHEtS
	kIo1cUUwkgoSS9SUtaPQQV9GY0O9FqY6ZnN9MWTTCLK0GdzZAmPZnGfzw9AXGAxxGFpKRsI7Tvh
	p
X-Gm-Gg: ASbGncvBpFtjt1C9pftN1+cCsHR45tLtojBaLj6vWRUKGRz2xp13g+8+dj+bJkyjnkh
	M8EiRxokQlnu1TLywfOjriScLMzcE84PKrmUADFenM9/9qfWdE0eYxaq0oCtGg3sKtIrOv0rCUL
	FHBg+LmixsG5FPDWD889Q4Ot1BIIQQR1WNbw/LUFCiSXBdiLpjmwBqeTEe5b4fILEplXpUV+hcU
	QRqfQReFoIkHEjtLhKkAeWh3dpA+qu9FYKeM7i9gY0yfng1SqE0xQ6rkiWGsHkfP0IgP9SG82wo
	nuBClyFAR0jDrAKPBkxTJbNyQuKOQzghsWBv1mBUkNVmBZbo5xhyGAFU8oE=
X-Google-Smtp-Source: AGHT+IEJa8UJZWqTw9Q0EAr9PxAZseg++6SUc4a2N49f6rYLuvjP7U+hvo7avLnkTy2C6pjkRuSQbA==
X-Received: by 2002:a17:906:c102:b0:acb:711d:36c8 with SMTP id a640c23a62f3a-ad219170decmr305473466b.38.1746786583223;
        Fri, 09 May 2025 03:29:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd3easm129122566b.147.2025.05.09.03.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 03:29:42 -0700 (PDT)
Message-ID: <869269a7-8267-45f3-9e4d-678de18c0888@tuxon.dev>
Date: Fri, 9 May 2025 13:29:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, saravanak@google.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250501201211.GA768334@bhelgaas>
 <26bdfbd6-7bf5-4688-b793-5d0f613d340b@tuxon.dev>
Content-Language: en-US
In-Reply-To: <26bdfbd6-7bf5-4688-b793-5d0f613d340b@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_032956_432886_A24712EA 
X-CRM114-Status: GOOD (  23.46  )
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

On 05.05.2025 14:26, Claudiu Beznea wrote:
> Hi, Bjorn,
> 
> On 01.05.2025 23:12, Bjorn Helgaas wrote:
>> On Wed, Apr 30, 2025 at 01:32:33PM +0300, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>> only as a root complex, with a single-lane (x1) configuration. The
>>> controller includes Type 1 configuration registers, as well as IP
>>> specific registers (called AXI registers) required for various adjustments.
>>>
>>> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
>>> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
>>> host driver can be reused for these variants with minimal adjustments.
>>
>> I guess this current driver only supports RZ/GS3 in Root Complex mode?
> 
> That's right.
> 
>> If so, I don't think this paragraph is necessary or really relevant.
> 
> OK, I'll drop it.
> 
>>
>>> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
>>> @@ -0,0 +1,1561 @@
>>
>> I can't figure out the line width you're using.  Generally code in
>> drivers/pci/ is formatted to fit in 80 columns.  Much of this file is
>> formatted for that, but there are many cases that seem to use 90 or
>> 100 columns.
> 
> I formated it at 100 columns where the lines were longer. I wasn't aware
> the PCI rule is to have line formated at 80 columns. I'll switch to it in
> the next version.
> 
>>
>> For single-line comments that are not a sentence or are a single
>> sentence, it's typical to omit the period at end.
> 
> I'll follow this rule, too.
> 
>>
>>> +static void rzg3s_pcie_update_bits(void __iomem *base, u32 offset, u32 mask, u32 val)
>>> +{
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl(base + offset);
>>> +	tmp &= ~mask;
>>> +	tmp |= val & mask;
>>> +	writel(tmp, base + offset);
>>> +}
>>
>> Nothing rzg3s-specific here.
>>
>> I think u32p_replace_bits() (include/linux/bitfield.h) is basically this.
> 
> I wasn't aware of it. I'll use it in the next version. Thank for pointing it.

I look into changing to u32p_replace_bits() but this one needs a mask that
can be verified at build time. It cannot be used directly in this function.
Would you prefer me to replace all the calls to rzg3s_pcie_update_bits() with:

tmp = readl();
u32p_replace_bits(&tmp, ...)
writel(tmp);

or is it OK for you to keep it as is?

Thank you,
Claudiu

