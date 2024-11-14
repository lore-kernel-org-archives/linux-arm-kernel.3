Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8365ED65C66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7E3oRv+rq/XKtcZoaXZsJTQg3amz2zyCTxOxkN0m2BA=; b=WeBl2o7N+wjQZBixR0ITaQOwt0
	IkiYABqd1/Lk9xVP0M+rTFTl1k4RwtZ/MolEamxdVHpHkBpsrETu41w+GWd/40f6TqpaPimvcd66I
	HYv4W1MvSQIxSU0iHrDqFSKnp2UaNvJcvVdIFll6rtqu16V4jup37LvbfeAu1g7EDXZ1zYoSi6BqV
	ssxjsPddsq85Dp/3zkkH2gq5njsbsnZF71afcJqgA/MOd9g4wVzQxAUN95vkycrpENayl93YOkVlL
	yVaxpCgi+6iDy7u4ELVXySqL43xw3QO16gqs80/VpB0ZGiwwEH1652dtwst+Y268PrYjXqyafN/aS
	w754x/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWPc-00000009PKz-0rlq;
	Thu, 14 Nov 2024 09:45:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWNk-00000009P3t-1O2C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 09:43:21 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ea0bf6bebbso122559a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 01:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731577398; x=1732182198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7E3oRv+rq/XKtcZoaXZsJTQg3amz2zyCTxOxkN0m2BA=;
        b=YL6ln98OkgxPJgAjhtn3bVXitUydA/SjwJLmwp3zZz9ow/56BWEGgvoYrba2p6vx5I
         C4tdfOwqdWVavYwntHv7L3iLBDjVUuieJWgz9m2tTCrFv5e+0jGTkL7JGxJvQoHAibSX
         8KRYhOk/yozusEvy4fZcvmf98TsUXfIGN4DfoNJWygDN9Ht15gq8JOrPZSgU6v1J10sz
         WDhMOvv7Zw5azQiOiIHjLOrO3Jvsov2Fq8Gzx/+lEtYRaI5hdSVf0RJgw5jMrCodYJZ8
         Mgc2yTMgP0FCjYcAPlTLw768/3SCP2/jNbifM2xwHCOp3d5fnkZAmqS8RVcivYLEEa8H
         miqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731577398; x=1732182198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7E3oRv+rq/XKtcZoaXZsJTQg3amz2zyCTxOxkN0m2BA=;
        b=r+8da3XmA4QAhE+a2rBCQOgcQXCGHNiulPthvATTOczY9FI7BYkGW9QOa3cWnr7v5y
         hAbXHSE7cCRBcSpltZ3W7QQAt57NBbjEM2d8Jowe+rvexGf7d07fEnmFqYp8e6K4VXk8
         BIZiZoPO2asw4qSr9go1JGTbJiNqAxVRdH80U/1X6X78trSfTVzwrux57Li3sxDPqzF+
         2RmlsmEkG03LcetIqgdUGaxuceBI7gLGQURDcOkKbCTkV55AAdfRpmY8gHVtj7ZcEsx3
         XLqhzLQLFHHLvZgVdb3PxPjib2LJi+9J6Hqr+OF5/el4fUuVKnrZydba2ec4mxMKbYfe
         ebSw==
X-Forwarded-Encrypted: i=1; AJvYcCURIl3CVSWjvAdrVvTgT/LqRV6zxypZ+vVEbf242onZHCQuUeKA2kLnOhWWV1MJIf8s8SLi93/Yk5sNPp+qHy2T@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3i5G70CUqZ5N44RyfB4c2rQG16j+dpQ8ZvEcGjXPcvE+Jfiuq
	GXrMD0hl1JB0Q7OndASqpfq30ayfBC5si05sgvDHH0x6qajw7qbD
X-Google-Smtp-Source: AGHT+IE7N5I7GpMECo0it1xEKMgqYnL8RbOemjcjR8CajkVg4l/czbLMGpNGruEWzRMOSH4KompvSQ==
X-Received: by 2002:a17:90b:3ec5:b0:2e9:5f95:54c1 with SMTP id 98e67ed59e1d1-2e9b173c441mr33338891a91.17.1731577398096;
        Thu, 14 Nov 2024 01:43:18 -0800 (PST)
Received: from [192.168.0.101] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f9c51esm783484a91.39.2024.11.14.01.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 01:43:17 -0800 (PST)
Message-ID: <bbc212a7-ae42-461a-b0a9-509838053ab2@gmail.com>
Date: Thu, 14 Nov 2024 17:43:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: nuvoton: Add schema for MA35
 family GMAC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, mcoquelin.stm32@gmail.com, davem@davemloft.net,
 conor+dt@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 devicetree@vger.kernel.org, joabreu@synopsys.com, edumazet@google.com,
 linux-kernel@vger.kernel.org, kuba@kernel.org, schung@nuvoton.com,
 yclu4@nuvoton.com, ychuang3@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-2-a0987203069@gmail.com>
 <173147854152.3007386.10475661912425454611.robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <173147854152.3007386.10475661912425454611.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_014320_416777_010A2806 
X-CRM114-Status: GOOD (  18.14  )
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

Dear Rob,

Thank you for your reply.

On 11/13/24 14:15, Rob Herring (Arm) wrote:
> On Wed, 13 Nov 2024 13:18:55 +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 ++++++++++++++++++
>>   1 file changed, 170 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: ignoring, error in schema: properties: compatible
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
> 	from schema $id: http://json-schema.org/draft-07/schema#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
> 	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too long
> 	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too short
> 	False schema does not allow 2
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
> 	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too long
> 	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too short
> 	False schema does not allow 2
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: 'oneOf' conditional failed, one must be fixed:
> 	'unevaluatedProperties' is a required property
> 	'additionalProperties' is a required property
> 	hint: Either unevaluatedProperties or additionalProperties must be present
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-0/ethernet@40120000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']
> Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-1/ethernet@40130000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113051857.12732-2-a0987203069@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>
These warnings/errors will be fixed in next patch.

Thanks!

BR,

Joey


