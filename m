Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD08DD3E2A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvMPCIRxcWlgVDj1SYKpQOgqABEqS4mtXMluObvexxE=; b=KeXrlDVjLkmY+eI/65zuhMrXUC
	ZHCJQ5IuYK7K7kL2OVgXhWFTvyfF+TO14SMcgds/GzCl+DY8zVdw/SU5R9DzqP8hP3/Hz4LW/Au1q
	+aaJDPgMf81eVYWpJkheMQqxRvNWUIAsVTYqQzmagibnXMUOCZjThHWxOnb9kjzaVMMC+6ktluaYI
	BoYFr2VXstE/6TaNzX4vUP26T0GN/h+gqqSWkRtX/Cm2lg0Hh412poifRgCcmgElTSMM1LcsL+ehv
	fZE0JnvZW0EmvhJjilgdlN79IgCVj9xJRJnn3A6NVXP+ZETAmJYPSJ5KPOik+GPhTveEOHtZ2+Vkc
	zwIzKkVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Uxr-0000000BvF8-3KTT;
	Mon, 28 Oct 2024 18:59:43 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Uq4-0000000Btff-1949
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 18:51:42 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-460c0f9c13eso40169231cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 11:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1730141497; x=1730746297; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vvMPCIRxcWlgVDj1SYKpQOgqABEqS4mtXMluObvexxE=;
        b=X8kum1CpK5jSpX/O9UqNEtjTA4V07fxGc1O7nxkDPirigZe0glFLSMbzXGd8vUa9fc
         8EE+KY/Og8SYhWsgCx4hGvEMbyBUk8SYTr7bj3tDoGZfEh4+ttgXTbPF8LoWIPSQQYnp
         Fd1xiqIVLO09HTfeLWSTlI/3xMreIf2OwnTns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141497; x=1730746297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvMPCIRxcWlgVDj1SYKpQOgqABEqS4mtXMluObvexxE=;
        b=YZNmKQYO5gE1WHUgXFA7nsIus/EOZFbLSTfbo9JfQuRjhLaWYGvACYMb/ouTL7DrXK
         UCI1/1JzZDsPlTm47crl7h8Gy+4y+3aP1vDnH/zAzm+ZQtVHOkxoz/yXIGPSV4SdbiWA
         r2TrCDUM6qCwffm8DvBhzt9sSGTZBTVD+CcdyuBILTuwKE9FKHWxwo+J01nQeP5WtcJr
         jf1hcdoU9jrLHS7HytoS5NwzSurVlvYGJ/ytiFhiajnIQR0Pb9xXCJ1XksGyQ2EkmWHN
         uNYXh6SA5Jseomif0xt06Bh5Sz4USRWxnsBSM1lZ+8EdaVTIYXudxTZGWgeYsd/uM661
         mvHg==
X-Forwarded-Encrypted: i=1; AJvYcCXYVsybc5CX1xpU4Use/hGo2FAB9xgN23bBfLn49gOPq8a/R4df+GYroqnDiXdcBhCyS2erA36scHvkwHwtfkYk@lists.infradead.org
X-Gm-Message-State: AOJu0YyPCO4aNa+AgWhIRy3gWwosG3ch3UwIx6R6UZlaFKNuD/Eladnj
	Aoxj4mGnhTyPo+tuTsAQVzkSyOT39gWfNn+P4WS1riqBjaB+OqH8bMh+Ku4O2g==
X-Google-Smtp-Source: AGHT+IHJLJXC2SFObrOT9aEQl9Km+EitJdlHJzZPAOFX9KFB/utnurItv65zf+HdnNn6NbuOje/Y8g==
X-Received: by 2002:ac8:7dc6:0:b0:461:371d:89c9 with SMTP id d75a77b69052e-4616425c606mr9887591cf.20.1730141497517;
        Mon, 28 Oct 2024 11:51:37 -0700 (PDT)
Received: from [10.28.17.173] ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a068d1sm34605066d6.101.2024.10.28.11.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 11:51:36 -0700 (PDT)
Message-ID: <954d6c11-ab4e-485f-8152-94bf38625f9c@broadcom.com>
Date: Mon, 28 Oct 2024 14:51:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/1] RFC: dt bindings: Add property "brcm,gen3-eq-presets"
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
 Rob Herring <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241018182247.41130-1-james.quinlan@broadcom.com>
 <20241018182247.41130-2-james.quinlan@broadcom.com>
 <20241021190334.GA953710-robh@kernel.org>
 <77d3a1a9-c22d-0fd3-5942-91b9a3d74a43@quicinc.com>
Content-Language: en-US
From: James Quinlan <james.quinlan@broadcom.com>
Autocrypt: addr=james.quinlan@broadcom.com; keydata=
 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
In-Reply-To: <77d3a1a9-c22d-0fd3-5942-91b9a3d74a43@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_115140_380455_A6A90B9D 
X-CRM114-Status: GOOD (  23.75  )
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

On 10/24/24 21:08, Krishna Chaitanya Chundru wrote:
>
>
> On 10/22/2024 12:33 AM, Rob Herring wrote:
>> On Fri, Oct 18, 2024 at 02:22:45PM -0400, Jim Quinlan wrote:
>>> Support configuration of the GEN3 preset equalization settings, aka the
>>> Lane Equalization Control Register(s) of the Secondary PCI Express
>>> Extended Capability.  These registers are of type HwInit/RsvdP and
>>> typically set by FW.  In our case they are set by our RC host bridge
>>> driver using internal registers.
>>>
>>> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
>>> ---
>>>   .../devicetree/bindings/pci/brcm,stb-pcie.yaml       | 12 
>>> ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml 
>>> b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
>>> index 0925c520195a..f965ad57f32f 100644
>>> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
>>> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
>>> @@ -104,6 +104,18 @@ properties:
>>>       minItems: 1
>>>       maxItems: 3
>>>   +  brcm,gen3-eq-presets:
>>> +    description: |
>>> +      A u16 array giving the GEN3 equilization presets, one for 
>>> each lane.
>>> +      These values are destined for the 16bit registers known as the
>>> +      Lane Equalization Control Register(s) of the Secondary PCI 
>>> Express
>>> +      Extended Capability.  In the array, lane 0 is first term, 
>>> lane 1 next,
>>> +      etc. The contents of the entries reflect what is necessary for
>>> +      the current board and SoC, and the details of each preset are
>>> +      described in Section 7.27.4 of the PCI base spec, Revision 3.0.
>>
>> If these are defined by the PCIe spec, then why is it Broadcom specific
>> property?
Yes, I will remove the "brcm," prefix.
>>
> Hi Rob,
>
> qcom pcie driver also needs to program these presets as you suggested
> this can go to common pci bridge binding.
>
> from PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4.2 for data rates
> of  8.0 GT/s, 16.0 GT/s, and 32.0 GT/s uses one class of preset (P0
> through P10) and where as data rates of 64.0 GT/s use different class of
> presets (Q0 through Q10) (Table 4-23). And data rates of 8.0 GT/s also
> have optional preset hints (Table 4-24).
>
> And there is possibility that for each data rate we may require
> different preset configuration.
>
> Can we have a dt binding for each data rate of 16 byte array.
> like gen3-eq-preset array, gen4-eq-preset array etc.

Yes, that was the idea when using "genX-eq-preset", for X in {3,4...}.

Keep in mind that this is an RFC; I have a backlog of commit submissions 
before I can submit the code that uses this DT property.  If you 
(Krishna) want to submit something now I'd be quite happy to go with 
that.  I don't believe it is acceptable to submit a bindings commit w/o 
code that uses it (if I'm incorrect I'll be glad to do a V2).

Regards,

Jim Quinlan
Broadcom STB/CM

>
> - Krishna Chaitanya
>>> +
>>> +    $ref: /schemas/types.yaml#/definitions/uint16-array
>>
>> minItems: 1
>> maxItems: 16
>>
>> Last I saw, you can only have up to 16 lanes.
>>
>> Rob
>>


