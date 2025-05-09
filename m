Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBC9C3ABCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqSqgdbr6mkrFUbRKHE1fLZLEEIHfO7KWsMJjVuS+q4=; b=HHquJf3Y7GPZTNgciSOXc6hEqT
	J1r+IkeIiDYAQAMafa6IJnWvlX+5VcetGJt01bsh7kS04yz0/DVb2VydC1NOxnS+bU8klmwqjArzH
	6jOvYbzpg2IH4r/xcFkH6Qk3yogKmkxg6c4BIGYwjZ+Bv7FwkuI0YXrJPYm6psZhyaEkex9HYTEPx
	IAAMyyiWY6no0XucsxF7VtCuy56jQl9XeQ7CXlFk+wk6bt6ihi6rd3uqNI4eAmE+Ybtyd+g2nWWlE
	ruAz/zvm7VbFlIexlQbLU9hkh95QRuAUV9Rga2ut2bsBvAm7oNiT2uN0/MNUIQuT5jLUDS8nl8c2G
	x1sRc2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDN4g-00000003ceJ-20u6;
	Fri, 09 May 2025 12:43:34 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDM6u-00000003ScY-2phd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:41:49 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ad220f139adso101941766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746790907; x=1747395707; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqSqgdbr6mkrFUbRKHE1fLZLEEIHfO7KWsMJjVuS+q4=;
        b=e4pwOms5q6zHz7fw/B90MpPhoee2JXbEQrcGR8F2iPkLbkeVvPYHNQTROgmGUrbVv0
         oNxPE0Abvpk1FsOHmAbKBpKS65SCRaPLKCks2GwhgZnwUAul3TqnaqEs1wBUZFFzjarV
         jFz1OzLC1zgxGAzrczWjA7NWAVvGG5idts0LREBpv1AgAeSS+IS2oarCmbvfzHbDo1ut
         c/KR/UovtTjc4UtS5cWDpkULP4qp2mZe68LYfmSKzClPikjynrslxgdmv8szMdQmwfv+
         4K0TaSXOSJvInvQQjqPPXEN3kY0d7U+uWbZB7P6sD00F/FScjKoHr6cJAcYniGv77Swf
         RuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790907; x=1747395707;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqSqgdbr6mkrFUbRKHE1fLZLEEIHfO7KWsMJjVuS+q4=;
        b=oisYq4ydw65ek+tumYWEXVYIDvbS6tdquqmow1DzHiTGL55kFTIWCAzK3rTlv9593Q
         TvfvctBCeUisn0j+Bd9XlkWIvhRpFl6By3QjrINV/9/1is9W1ZMsH6R4el6tim/NBT2C
         0oLZX5ZahK6PG1KRd5eoLy5vdepmMD8apExUC2SfmC2Sa0umcF4aRflgXduufk70YPgk
         VWB7+nX/uchrI+aD936PuonunKd7J7hSQWS1NwQ7NMmT5KYdVQGQm4hdWVUYp8ZFYt3z
         3L4p4bvhoVQMPnNadNpjz9he8y7wQCBGNVzZehWJdm6T6Wlf/dN9yexlYqTNpZ5Y0aY5
         pmfA==
X-Forwarded-Encrypted: i=1; AJvYcCWJS+pheopH+Q2ThAdy8hFjHFlZ09TKponVf0sjBJdjP7e7+ZcqY1o6+6xhTS6Y1q8qSrTOcWtTLTDV0uW3h89X@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd6Lwo2q2tpxomAKrbl0RenUsNqWGzhcrVvbGIWH9C6RwaPHYy
	K5soYY2hebGO5hqlVFani0FpIs/4HoFX0fEJXPIMJ+oMsVHyM7VLJZjPxb7nw98=
X-Gm-Gg: ASbGncvVO2HH1Pqt7Ei0V/JXWLqMdApwcHUQ/L9Kfi3zEGi6S2djxVolxW43IAOvgvn
	9yhfoLxAz3NgUlpFtTT39DJWhBxawG/xNy89AmEegq8KTMTutabBYUVUxvlD+tyaaS78Umh1KZg
	7lYpLySyN3HBf5luZiezhVYjzwSQsXjru8oBn9JZa6sd+QwKNCYYFICk+JWBys23BvGAUACNYuZ
	/VpNMzNxy5RykpayCUN9M2bO+ae2GzTgmwb9ukF/BG5WJOrVoIn4dJBmGXgZRF2KOjHhT8+oS4b
	iUh6qpHjYhqbL2PxYxJh79/5YcoJbZW3AkU8TMROeyfnPnFH
X-Google-Smtp-Source: AGHT+IG2j0Pea0l+03cwVMYbfwrcANbL1huFvD6sD/j4JhDPCTCSj3oUMBeHqG1csVa7s5Hq/oxNxw==
X-Received: by 2002:a17:907:1907:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-ad218ea823fmr310536466b.4.1746790907122;
        Fri, 09 May 2025 04:41:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd2a8sm138611966b.145.2025.05.09.04.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:41:46 -0700 (PDT)
Message-ID: <b4771b63-3198-47c8-a83d-5133ba80d39b@tuxon.dev>
Date: Fri, 9 May 2025 14:41:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Philipp Zabel <p.zabel@pengutronix.de>, bhelgaas@google.com,
 lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, saravanak@google.com
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
 <20250430103236.3511989-6-claudiu.beznea.uj@bp.renesas.com>
 <42a5119e547685f171be6f91e476a9b595599cf9.camel@pengutronix.de>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <42a5119e547685f171be6f91e476a9b595599cf9.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_044148_726017_B2A60915 
X-CRM114-Status: GOOD (  24.31  )
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

Hi, Philipp,

On 09.05.2025 13:51, Philipp Zabel wrote:
> Hi Claudiu,
> 
> On Mi, 2025-04-30 at 13:32 +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>> only as a root complex, with a single-lane (x1) configuration. The
>> controller includes Type 1 configuration registers, as well as IP
>> specific registers (called AXI registers) required for various adjustments.
>>
>> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
>> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
>> host driver can be reused for these variants with minimal adjustments.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  MAINTAINERS                              |    8 +
>>  drivers/pci/controller/Kconfig           |    7 +
>>  drivers/pci/controller/Makefile          |    1 +
>>  drivers/pci/controller/pcie-rzg3s-host.c | 1561 ++++++++++++++++++++++
>>  4 files changed, 1577 insertions(+)
>>  create mode 100644 drivers/pci/controller/pcie-rzg3s-host.c
>>
> [...]
>> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
>> new file mode 100644
>> index 000000000000..c3bce0acd57e
>> --- /dev/null
>> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
>> @@ -0,0 +1,1561 @@
> [...]
>> +static int rzg3s_pcie_resets_bulk_set(int (*action)(int num, struct reset_control_bulk_data *rstcs),
>> +				      struct reset_control **resets, u8 num_resets)
>> +{
>> +	struct reset_control_bulk_data *data __free(kfree) =
>> +		kcalloc(num_resets, sizeof(*data), GFP_KERNEL);
>> +
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	for (u8 i = 0; i < num_resets; i++)
>> +		data[i].rstc = resets[i];
>> +
>> +	return action(num_resets, data);
>> +}
> 
> What is the purpose of this? Can't you just store struct
> reset_control_bulk_data in struct rzg3s_pcie_host and call
> reset_control_bulk_assert/deassert() directly?

Yes, I can. I was trying to avoid storing also the reset_control_bulk_data
in struct rzg3s_pcie_host since all that is needed can be retrieved from
the already parsed in probe cfg_resets and power_resets.

> 
>> +static int
>> +rzg3s_pcie_resets_init(struct device *dev, struct reset_control ***resets,
>> +		       struct reset_control *(*action)(struct device *dev, const char *id),
>> +		       const char * const *reset_names, u8 num_resets)
>> +{
>> +	*resets = devm_kcalloc(dev, num_resets, sizeof(struct reset_control *), GFP_KERNEL);
>> +	if (!*resets)
>> +		return -ENOMEM;
>> +
>> +	for (u8 i = 0; i < num_resets; i++) {
>> +		(*resets)[i] = action(dev, reset_names[i]);
>> +		if (IS_ERR((*resets)[i]))
>> +			return PTR_ERR((*resets)[i]);
>> +	}
>> +
>> +	return 0;
>> +}
> 
> Why not use devm_reset_control_bulk_get_exclusive() directly?

I wasn't able to find a bulk_get_exclusive_deasserted() kind of API.

This IP needs particular sequence for configuration. First, after power on,
the following resets need to be de-asserted:

	const char * const power_resets[] = {
		"aresetn", "rst_cfg_b", "rst_load_b",
	};

then, after proper values are written into the configuration registers, the
rest of the resets need to be de-asserted:

	const char * const cfg_resets[] = {
		"rst_b", "rst_ps_b", "rst_gp_b", "rst_rsm_b",
	};

So I was trying to get and de-assert the power_resets in probe and just get
the cfg_resets in the 1st step of the initialization, and later to
de-assert the cfg_resets as well.

Now, after you pointed it out, maybe you are proposing to just
get_exclusive everything in one shot and then to de-assert what is needed
at proper moments with generic reset control APIs?

Thank you for your review,
Claudiu

