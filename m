Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D61EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WZetRp5ukCN3RFrLbUEaBdA30WIpXABNZMPxGA5CMM=; b=g2BzGbdp3PH23RQGL/IW63BXiS
	RsHbMSj0ZTWT58F8lUCWmH19419G6VZKJGa6y0XK9pCcjrGAer/v8MySihOzSD9coo/utSCLgL9H4
	BQXtfTtCwqLP8XSaJYD1bpW/lLh7WVKuapuSB3007r6ffnT8bqpXLqSzQmrx+/FWpsvUSX605il9x
	xpYmw0/srH8j6n3UBUuSvnHMyjwCn4QyO/3MRQxEPeWDihaQHimVItI+kwko/2rkjhKjrVcGczyCv
	nlzwtOiPONPgb6fUiDo7Thqj+bs/pMIQQ0UX/mequJLxI/IyY9y1ifFb4kXWVoIUXFna6xCRL554g
	AjPssuZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzDbi-00000000Ezw-0zTH;
	Mon, 31 Mar 2025 11:47:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzDZz-00000000Ei4-09zV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 11:45:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so8235127a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 04:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743421521; x=1744026321; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WZetRp5ukCN3RFrLbUEaBdA30WIpXABNZMPxGA5CMM=;
        b=D4bube9dR0fIon2QY92dGVL6KHbeONh83Tm+IVXDTXVZpyrouOLmohjYX0XDuPFot/
         2ZT/p0mFeeNxSRBRALBGDte0RD7Uj6vVfjZ9SuxL+MwASCsvmJaeNPqzeW3KlnK6xjWv
         F77Amzornb1Zab5dVEbhfkDT9Wf8ODfkOiRBfCFj45zRY64EQIrKx+IEQwRxtfPnROZp
         IvmLHZWUR72mCbSfztyT/SUE8ZapdfB4jspbq+l3kyit4XUd/4v4hj2jAFZtrHe20l4Z
         Vtp/oAXc5XsmMpFIByVfwbXR40Pth+NSHYIu+rt3aOTp9uEYOerNVvzYuz2DEsFg0AGJ
         Hjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743421521; x=1744026321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WZetRp5ukCN3RFrLbUEaBdA30WIpXABNZMPxGA5CMM=;
        b=pzC6KnTG4BAUpwZMOnSqXknV0eUpL2dskFpSjFwVMPJHTM1EaqlNifGhoAMbsUHrgl
         5pRmZ/OZZNAYYyQsi5cxP6ez4eEET22axrWO1CGt0Z25IjqpRLGrZ9EasQRE/xzMBRS/
         BlyjEXgz6/91Gl8P00LnKiFhqwwlw2y8RwT0VgDqARP6j4RsukhGJhI74RjN06ho3C3k
         z7HwEqVxS1yvw77UXX5DQy9I0v7ga9WhDs8eZCp1vzt7XrM2z/DT8ti6UPrkRzqos+T0
         gylkicN7vN4bstAiXgJYtVi0KmxL0BJSJd/nWKCB/5Y88kyljWdkW2jon5odQWla87b3
         HZJg==
X-Forwarded-Encrypted: i=1; AJvYcCUzdxOjWSgyltOBOrp5+3EgNEMMh+TVlTHVEvIUdt6MWE65XPAnrS40mlZ+cNrRf/H1yCb3BXpgKdZ/Ejqhowvb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx67HwDjya0tCHSTMeW8/Hq5vmXPaGGvhnWi01pCAux0jzlMQBS
	6LIP9KIkD/ppRzsU0dwEyIJnBIsyq6ZYYPksOK4e1HV3A2GaklZc
X-Gm-Gg: ASbGncuvHMRe42RVjR9CFT/xzcfe3T9SDMWNgewX7xk0C1Hw9yIcOtwfSJWQqwUjNeQ
	Hyfw5mP5/nMPWMO9+5eFOBH7jwD0NPlVDgkFc2Wcq/REoSA9UOCsQ9Q4b9bzM3S6zJDzTv1Xf4X
	SbDFttA7VaSH89QhYDbqZJxtod6u1X50q8/KEm+CdhR6NtHPhgebzRUJBSXKWAhW/HFb8FnlfTL
	WdzjbEX4zQW7pmd+0KO0wrtTEGjbAXo7/NtHVtCZ+Wf1sc2gZ0mfcjvDzqRHCrdYxBpkwKlB1ba
	WQXaAkDBgEBJnBZTE7IM5rYuLrFxyavmclS7+CBw7QkOFI0jAHjZEsj0l8gohXy9uiDuxLU=
X-Google-Smtp-Source: AGHT+IHcwdKHyjGn7qgKGCjwufvZuSvuzHtrMAol97MyCW4LRBy9QxYiA7v5eA7QLgnV+kdOOMmuBg==
X-Received: by 2002:a05:6402:2709:b0:5e5:ca1b:c425 with SMTP id 4fb4d7f45d1cf-5edfd101725mr7051020a12.17.1743421520816;
        Mon, 31 Mar 2025 04:45:20 -0700 (PDT)
Received: from [192.168.5.165] ([92.120.5.14])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc1493d9dsm5532289a12.0.2025.03.31.04.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 04:45:20 -0700 (PDT)
Message-ID: <e0d328e0-bc54-4763-9c55-694c0fd93746@gmail.com>
Date: Mon, 31 Mar 2025 14:57:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Content-Language: en-GB
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
 <20250324162556.30972-2-laurentiumihalcea111@gmail.com>
 <20250325032303.GA1624882-robh@kernel.org>
 <2301b0f7-1a76-4823-8d3f-d346f8f8e865@gmail.com>
 <20250331064152.g4hlw6pbpzbnlsmp@pengutronix.de>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250331064152.g4hlw6pbpzbnlsmp@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_044523_113080_DD95C57A 
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


On 31.03.2025 09:41, Marco Felsch wrote:
> On 25-03-28, Mihalcea Laurentiu wrote:
>> On 25.03.2025 05:23, Rob Herring wrote:
>>> On Mon, Mar 24, 2025 at 12:25:52PM -0400, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Add documentation for IMX AIPSTZ bridge.
>>>>
>>>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>>>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
>>>>  1 file changed, 107 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>>> new file mode 100644
>>>> index 000000000000..c0427dfcdaca
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>>> @@ -0,0 +1,107 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Secure AHB to IP Slave bus (AIPSTZ) bridge
>>>> +
>>>> +description:
>>>> +  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
>>>> +  issuing transactions to IP Slave peripherals. Additionally, this module
>>>> +  offers access control configurations meant to restrict which peripherals
>>>> +  a master can access.
>>> Wrap at 80 chars.
>>
>> fix in v4, thx
>>
>>>> +maintainers:
>>>> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: fsl,imx8mp-aipstz
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: bus
>>>> +      - const: ac
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#access-controller-cells":
>>>> +    const: 0
>>> With 0 cells, how do you identify which device it is?
>> we don't atm. We're relying on the default configuration.
> I think Rob is speaking from DT API pov. What the driver is doing with
> additional information is up to the driver.
>
>> we don't have any APIs for AC configuration so I left the
>> cell number to 0 thinking that the cell number might depend
>> on the API.
>>
>> if need be, I can set it to the value I was initially thinking of in
>> v4.
> Which is?
>
> According the TRM it's a bit tricky to define the API since you need to
> describe two different types:
>  - master configuration
>  - peripheral configuration
>
> One which came up in my mind is:
>
>   <&phandle TYPE ID VALUE>;
>
> e.g.
>
>   <&aipstz AIPSTZ_MASTER 0 0xf>;
>   <&aipstz AIPSTZ_PERI 0 0xf>;
>
> One could use a defien for the magic value of 0xf of course.


so, my original idea was to use 2 cells: <&phandle ID VALUE>, where bit 0 of ID is used

to identify the IP type (master or slave/peripheral) and the rest of the bits are used to encode

the ID itself.


I think I like your idea a bit more though (i.e: have the TYPE as a separate cell)

because I think it's easier to deal with/understand from the DTS user's perspective.


