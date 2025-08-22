Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5979CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V014dFiaSCDPs2i3+HfkIg6rp9m74x/8h2rQVVO+dUk=; b=ocAPPNZ0Ouq6ZT4aGXIEdfVO+M
	3Tob7bL6WrF5zhokDBNn0tp4y140yUNiLGx+3pJWEYIgW+NIfBr46lxDFXc7nW68wRUePGvX202LK
	c9Vn+kCesPsk9DtQFyIfW1oaga7vy3w6SZ19gxEbZdY3GlSEKxEjIHfwYrov6Xz1dE2ttse4Qq5ze
	9oNMXOHTSfmFVyIdJtz6zvO0GNYGDC7wWvFOsKMsqrCeCfP+b193tZeFfSIifrrH/5+tRiIFTdeDm
	BcpsEhoqXZKgU4QS0CHiFidzS9RMzXXu2AXC9YtE5D4nea82X7zhcuI2jZ0C2y16NZl46BXMwg+4g
	ki2B3oFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqy-000000045yN-3UC0;
	Sat, 23 Aug 2025 06:35:52 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSJD-00000002hVe-1Q3w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:00:00 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-afcb731ca8eso343836166b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755871197; x=1756475997; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V014dFiaSCDPs2i3+HfkIg6rp9m74x/8h2rQVVO+dUk=;
        b=LBSs503SKUbJiKbQ820BGCpwUATULawcp4uxH9g53n6CQgTxTipIhfL95OJhc3K7iU
         +TenhzGndWgjo/f+QQPlaIPQDLhuYHsNL/gSHQTm8omMBy7XGv4UwW4WRovgWawYTn9R
         f1R2O+65wFbeHyNfQI6Yd8Wj6S3IeZR9Vs1TAE/imWpB0H6lpRip+xV23vCywDUv2n0T
         ai6Jfgm8GxN4G9FmG/seilw8mEtg4dxhg6+IWbQGIby+CcJHhujcKcUBhKHraEvW2Uc8
         Kcia9DedfBHS6GQrCMOTIV7xTC9GjnzcsUbQ4pTk1/IVpOD6bKfbcZkGos8oothpnqYa
         GYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755871197; x=1756475997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V014dFiaSCDPs2i3+HfkIg6rp9m74x/8h2rQVVO+dUk=;
        b=TdFyKtZb7IGqICPH0T4lJ4mxHQZZ7ADh3RJOizIJIHIzJMLYdLxdQqHKbohNWxB6lt
         Wjrfvv6VWCVR9tiA+V+0MMHsqUc/GkhwfLj53OVgv6UMqZeww+hpnLahkO+zRwr7BYyT
         lnnzRyEf1gHxweaCKzgGSjMvd2aTHVc+x+b+7BqJCubWbT7o3I3SRVAXoDctDzvL8GvZ
         eQ8GVxW8B5oEwjkvmDvFSP03+LUwPwSTCRebw99n2sljQticF8I1hGzFwIZKMjMjhpuF
         ZIrcK3z02vJ4ukpYG+zIjrc6SYaMqzY2W4Dainu7pukbctsH62k6DevvjU0Ro/KqhVrY
         v/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDdU/6KFgkXUkZj4AW5OH4czJ7Xx7LAalUHd7SzNSDbOLKokrWwjDFkPca5xh0+Sn6Uzr3SSOHDZaXkU68RP9m@lists.infradead.org
X-Gm-Message-State: AOJu0YwijVwBTtKqTiCbmCe8/gaL1eg+9A0NBk2ayaltTsXCGZDdOZo4
	Z+zgFWzTWXXx6JXSUsQ5gH8h0C0cHXDU9AaiLlsb9kLgAvBw0AyrFOtA
X-Gm-Gg: ASbGncuW4tFKs6lpBmy1QRcHURHtPDkIU46AyRYVryp4ZwaHul/9lPvGjZHDKksOYzc
	rjmJcZukS29T1OeFDIOdkdu1vcCn4E2iwuNXiO/FiDkuuvm2Qn6JFoe3NYWnXsMag9Oug4cNs2f
	HLaZ3MNCrFxiEVtZ2EbDx85HIxe4P32hA16+jOKAJedXSvMLvXV5xJRMcP1gCws2pogDJUjzQPp
	/ouqcsV68CL3wL01TPFd1aVU66f6YZZLa86FIrEWqrhlr2lHdBxUSXSIC7Dcho31/+xLDs8Pgxg
	flx/k9c4cByGHJ8c0qey8A9I+gAklOreLNSrj11a1cSeJbSS1uJ6DDFtuQnWsT5Ca4Mncvk9Srw
	irPsU88J/jBhOk807m/yZzys3TAk857KhrBR8xWAi9fV5EJrdXRN4ZYCfic/MmFjKbLOkETFItV
	fdBebwKuhD7fbO5uiQUwIdNG57nhQF/0jadmtiI5GmfC5f8pOi2oV1cphqI+jcOSPO81Nt6O+80
	Evk
X-Google-Smtp-Source: AGHT+IEf+0iTczeJWYRvKTzbPjuHcrR0Q/vZbiX0S4rQLygBrUblykK/q9qnm/yelo9JpR8nUFhBWw==
X-Received: by 2002:a17:907:60d3:b0:af9:e3d3:a450 with SMTP id a640c23a62f3a-afe28f77734mr245587666b.6.1755871197072;
        Fri, 22 Aug 2025 06:59:57 -0700 (PDT)
Received: from ?IPV6:2a02:8440:714a:ca26:61e9:f2d7:67f6:fe9d? (2a02-8440-714a-ca26-61e9-f2d7-67f6-fe9d.rev.sfr.net. [2a02:8440:714a:ca26:61e9:f2d7:67f6:fe9d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4796f3sm607923666b.61.2025.08.22.06.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 06:59:56 -0700 (PDT)
Message-ID: <6a10616b-3234-4336-aff6-4e60047ebcb6@gmail.com>
Date: Fri, 22 Aug 2025 15:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/20] dt-bindings: memory: introduce DDR4
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
 <20250730211151.GA1749004-robh@kernel.org>
 <da8578ae-3f79-4082-b0fb-760553004c93@gmail.com>
 <fb5083ff-4bee-4a0f-8774-54b492cd9a6d@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <fb5083ff-4bee-4a0f-8774-54b492cd9a6d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_065959_375311_C9C4667A 
X-CRM114-Status: GOOD (  17.12  )
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

Hi Krzysztof,

On 17/08/2025 09:19, Krzysztof Kozlowski wrote:
> On 14/08/2025 16:42, Clément Le Goffic wrote:
>> Hi Rob,
>>
>> On 30/07/2025 23:11, Rob Herring wrote:
>>> On Mon, Jul 28, 2025 at 05:29:37PM +0200, Clément Le Goffic wrote:
>>>> Introduce JEDEC compliant DDR bindings, that use new memory-props binding.
>>>>
>>>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>>> ---
>>>>    .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++++++++
>>>>    1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
>>>> new file mode 100644
>>>> index 000000000000..f457066a2f8b
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
>>>> @@ -0,0 +1,34 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr4.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: DDR3 SDRAM compliant to JEDEC JESD79-4D
>>>> +
>>>> +maintainers:
>>>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>>>> +
>>>> +allOf:
>>>> +  - $ref: jedec,sdram-props.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - pattern: "^ddr4-[0-9a-f]{2},[0-9a-f]{1}$"
>>>
>>> Shouldn't this be 'jedec,ddr4-...'
>>
>> That's not the case for lpddr bindings, I wanted both lpddr and ddr
>> bindings to be similar but this can change.
> 
> For LPDDR Julius introduced in commit 686fe63b2280 ("dt-bindings:
> memory: Add numeric LPDDR compatible string variant") ddr4-VENDORID
> pattern to distinguish individual manufacturers.
> 
> Jedec is not really the vendor here.
> 
> Is it the same case in DDR? You have a defined list of vendor IDs (also
> 1 byte)?

There is no defined list of vendor IDs.
The way the compatible string is created is explained in
jedec,sdram-props.yaml file which is created in patch 5 of this series.

Best regards,
Clément

