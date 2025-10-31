Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40C3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRyeAIdNCNVWpBCeP53EIPuNRhQqWF48SYqRwaIlzas=; b=FrwBSAx18GAdKWA+1EimmkHD37
	3YzVi4NS29gPwLFMhCLyF0VCnBDFEiyUVbd/e4LxRDi4BBOMhvhTIVb7W21FFdRK1Ae2EtkKnTbmt
	0Ue6rtSnY26uL77/EPXRoQ8HfcjTxiVX6z7pBB3C5/Fig0SBsK0eNno/QmxZ2gvTjV7X4geeRDdJb
	FpRFz2Ovu9Je/A9/2ZLhaERaYQPIsSp+2VAs67jsYlscWspApFi9MwCW5O6vQYrmQRK1kByRccqOa
	ro7DAF8dxIpT8NFq/e9moEvQVzZen6Vuw4uY5lRqU+1mayN+ryNkITGh6U9Ccocxqc+fc/Z1FJdEM
	PyWWhhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEre7-00000006Mvf-3AAG;
	Fri, 31 Oct 2025 16:06:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEre3-00000006MvB-3BYq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 16:06:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so19656655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761926790; x=1762531590; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRyeAIdNCNVWpBCeP53EIPuNRhQqWF48SYqRwaIlzas=;
        b=faWELIzVBRozbrLrq20tdDVZSCpQjCPIP9qY2XiaPxwpsObA98GiHsTJrnOmE0Z8jd
         1XKIm/b+2+1YH5nCwbRTyIE9KJ+RIyF+jUXt0Rj29IBoYtBPtM1AxNQ0CWD9690vpYM/
         +oSRgq5GbPwOpTpkfK1bVf90uJgd05FY4dqPDbFKdKM8BHspZc8W/WRPBFW1RGtbpPGs
         rzgx44JyQm9Fhlnh3nMQRvBKIY6aZyxT3QoAXkP0JO1qKCKez1lM4B26DzymWT+e5COH
         k+BatoMVky3j5wgt23nikSWwSsdELjvS6LGVOelAcUHftI3QbYhthRxCgJf8TJshZ3HA
         NR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761926790; x=1762531590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRyeAIdNCNVWpBCeP53EIPuNRhQqWF48SYqRwaIlzas=;
        b=GuBdX4/UYErRuYXYGi8T23pAWfYhFxrltw3ANSPjI1s+dWUHIUoBc8DklJzuPOyo2L
         yetKA/pvANb8Rjg/qqOw8b+R6d8RRUGOk8WqZId/KCrqAolhsy4zyPJsQdnIRbiy38dR
         SAubc1pKYI0ofksGZvuOdvJvleC9huDHfGufb8lkPf7eQIA84bhtb8IbZEAGH2jCdb6F
         8OOGEumeTGJqr3sLttMBh2JU9eUMWJJkTwvmNyphRdaAeJ4mA6MOjCH+YCbMWZKE8DDC
         bSzmqZlvd+Zu35AaGqDC9V9TyrJZmT7vZSMq8ejXbfj5hmg5JiIBdHDdKLpEQINB33kz
         7pqA==
X-Forwarded-Encrypted: i=1; AJvYcCVsZE4pFYlulW8wyTr/UPUtFvhDjYp9peimbqpnSYW93G2zOSjN11biq8aPSvf92KE/TbXv+qZuLe6zVnjBJELc@lists.infradead.org
X-Gm-Message-State: AOJu0YxHY0Z3FX6SYP5V5ZRdTDZW1wNglOB6yU/CVIAiX1S2a+EBrShx
	m57JwEL8lkUDldOuK1cO5HzBncUGcrkMtJ9bzeTDSXRzqv52KPVa8jdcZ6lre/1K2VA=
X-Gm-Gg: ASbGnctSYsvimpWVzyv4TPp4/vTNa+i5Mpx41hLcn0HpCSn4X1E30bM39n7ixTCFNJ8
	ckfGtdpSX31lThG/FWMSPDL+6fUI52gN6Fpk/ucDaWXYmTwpfdWtyG3OgKg9rXCXvI0lUUn89gG
	0NjQoKPPSPHUF63XIbwThzlLyqvS8zy737aS3juVvoPLT5y8OOwtwDmHwnIrM76rXWw3bqWjjNR
	xYxdCsoehs16jWLvh3x/fvz1vqfctRdYyVG7njnqHlvJYJhsIIxX4RumJslCN0dykNQXF48dk3Z
	yBeyn1pc2f/V0VUlLLGu4yarUsDEa8u45Q6yjSVxB7wEWhkgv/+cd0Lk2hMFavNiUZ0OnGgf5uz
	77+2BGbbFLSLAy0yjGahhIBl8+hMkPFC3m5ivc5CtWyWI6CEV5Yq70FVoN0L8s1izM3Ut8f2Ioo
	3J39z+F8NdYHAWWl3+eKKphLQy1emh/EA=
X-Google-Smtp-Source: AGHT+IFCU6WaBZgiF/ZmQ2rOEta9IrMmGJFMsWC5NGLfn/XlBZep1GcrbuAmBW+nOAHJjxzhUAPNvQ==
X-Received: by 2002:a05:600c:b8a:b0:46f:b42e:e39c with SMTP id 5b1f17b1804b1-477308efe61mr37787825e9.41.1761926789560;
        Fri, 31 Oct 2025 09:06:29 -0700 (PDT)
Received: from [192.168.0.252] ([82.76.204.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13ec105sm4271473f8f.36.2025.10.31.09.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 09:06:28 -0700 (PDT)
Message-ID: <336b06a7-8772-443e-8716-99e52ac4cc7e@linaro.org>
Date: Fri, 31 Oct 2025 18:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: nvmem: add google,gs101-otp
To: Conor Dooley <conor@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
 <20251031-gs101-otp-v1-1-2a54f6c4e7b6@linaro.org>
 <20251031-seltzer-briskness-6f223654c993@spud>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-seltzer-briskness-6f223654c993@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_090631_847930_12520814 
X-CRM114-Status: GOOD (  24.74  )
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



On 10/31/25 5:02 PM, Conor Dooley wrote:
> On Fri, Oct 31, 2025 at 12:45:09PM +0000, Tudor Ambarus wrote:
>> Add binding for the OTP controller found on Google GS101.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/nvmem/google,gs101-otp.yaml           | 68 ++++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2144911297beb89337b0389b30fe6609db4156ea
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/nvmem/google,gs101-otp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Google GS101 OTP Controller
>> +
>> +maintainers:
>> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
>> +
>> +description: |
>> +  OTP controller drives a NVMEM memory where system or user specific data
>> +  can be stored. The OTP controller register space if of interest as well
>> +  because it contains dedicated registers where it stores the Product ID
>> +  and the Chip ID (apart other things like TMU or ASV info).
>> +
>> +allOf:
>> +  - $ref: nvmem.yaml#
>> +  - $ref: nvmem-deprecated-cells.yaml
> 
> Why are the deprecated cells needed here?
> |  Before introducing NVMEM layouts all NVMEM (fixed) cells were defined
> |  as direct device subnodes. That syntax was replaced by "fixed-layout"
> |  and is deprecated now. No new bindings should use it.
>

This OTP controller has an OTP memory space that can be read/program/lock
using specific OTP commands /register pokes (I'm not adding support for
this in this patch set).

The OTP controller register space contains dedicated registers for the
Product ID and Chip ID, which I'd like to expose as nvmem cells so that
a client can parse them and register as a soc device (see [1]).

Right now I need to expose the OTP controller register space, but I
expect that the OTP memory space will need to be exposed as nvmem cells
in the future as well.

Thus I need to be able to expose both the OTP register space and the
OTP memory space as nvmem cells in DT. I thought of using the deprecated
(fixed) cells for the OTP register space and the fixed-layout syntax
for the OTP memory space.

What is the recommended way to expose the OTP register space? I guess
an alternative is to add empty nodes as direct device subnodes, and
define and add the cells to the nvmem device from the driver using
config->cells.

[1] https://lore.kernel.org/linux-samsung-soc/20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org/T/>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: google,gs101-otp
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: pclk
> 
> Why bother with clock-names when you only have one clock? Are you
> anticipating a variant with more?
> 

Likely, but I'll drop the name. We can add it later on.>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - clock-names
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/google,gs101.h>
>> +
>> +    otp: efuse@10000000 {
>> +        compatible = "google,gs101-otp";
>> +        reg = <0x10000000 0xf084>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
>> +        clock-names = "pclk";
>> +
>> +        product_id: product_id@0 {
> 
> Why does this node name have an underscore?

I forgot to update, will use product-id for the name> 
> Additionally, all nodes here should lose their labels.

and drop the labels from the examples.

Thanks!
ta

