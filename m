Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA7FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2VPK+LGzPHiwIqFk3Ohj/RoTK5gsaz46bIEazLhBRA=; b=X0uppW3a/2Lqyis0BGh17S3v11
	m6Du743LzYO9rqL2Du6jLd3z5RFKPSXCN2syprUQzlumFQlk9W0Zl21r9Whrw3pEgoOe7K2wTOE0/
	WzW9dakkduU5BZu2HLGLIX3WNAQ0C75NihHse9WyuoSI7CnnxvlLYqqHBMq8y3Ri0h8Fvsme2SJEZ
	YT4N0huW7gBeLxkvdzM1q3U7wqsVpt5SHaOxKmZY+5dyU8v24eMGt0BAWWxBH8BCyixsGwDqButTa
	tbaKdcvQ13wUAEip9JrpwGsvufH2D+p5iDPCsKzPDBx7Qdu+jrDqTsQeaUlPJNkuMdLfMh03NqJ68
	cpZ84FgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma1c-0000000HUS9-0epR;
	Thu, 14 Aug 2025 15:37:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZAH-0000000HIyF-0bad
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 14:42:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so7024675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 07:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755182567; x=1755787367; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p2VPK+LGzPHiwIqFk3Ohj/RoTK5gsaz46bIEazLhBRA=;
        b=JVrzyCT9klkQaEZ3NGIwq2dG1q6R1XS1hJ9GoxSlWYEle8DFdgntk+7I+tIxakeNtR
         e+i1NxwC0+E3fHMGZyUVp57yK49g6qM3FNIyNZQ64J2pUYCB/poCEG2SKY5CiGyuymNT
         ISbKAl3FFoYwGo/Q0NrayBkoaFUCFynlmbJ4IMHMxzEceJwNWlNynPEt0FFgg7B2suHO
         vDvzlWY7eNPG5D6iZNZibcc1ieDMdMW0uhuBJf1Mb3ynBM7Gv/oFQ4LcyrlMCI0a7bOL
         3BMC+btGgtJJpOx8mbQpvKfDdIxjVBIp5VBmmZEyKRQ7R3KXSsjAgDThLEm4JfjqUPXX
         MUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755182567; x=1755787367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2VPK+LGzPHiwIqFk3Ohj/RoTK5gsaz46bIEazLhBRA=;
        b=M8T0bA9W/9anuSQ1Rhuc/hxqy7Ib4BNkaMh14W7eIjQLemS9/jqV8Jy1RgitgsDDUY
         b3EWWPq5usFvDRHSUOm1t2zIM4tLjHQ8xdHLACdSFCV6KFqmixgEGN8aVwb0dgVKYcXu
         eYSZZgVooCwWWLkopT6modtZnJxyruKhI9AgKiy7RCYdpoHZjUxlNh3b/AX0S7yybzVe
         SRjUr8Paws+f0Xf0tK7NHagoVUu60rdBmwb+/TSxCYB5z7A/EnjUgVU3IBN/jUE9UWNg
         sSk0v2pYPjsfahZkcEMv9q9NIEbP1wqEsQsfA4A5e58JMiGIgCBd24cFHRnXmv2meIND
         lj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmAAu6muXMGDyivz8d400w6cm/XuB/o8ZbNIcBgUaMYdycriOj4C6WrJ9OsLxIU2U79FfNPO2rwcxAopuvQgKQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8DUKC6ccFbQIfS6zMQQnAfr9kwvO6uuSI4IJpIJHfO8cCgeSD
	aYwWK8nP9I3e7HMHBu/spQQzNna569TYqT3pNA5XeD1BXtmarte0uqFW
X-Gm-Gg: ASbGncuYTW+immgykjykyGB1iX9pX7CaQlW3BPhhBU5Ive/gA2u66OuWJk3fygMazCd
	zAglulQKCR1YeTUWo472hZBpxeIsS64CYVuSNy3jZeKlCmNVr7+hfC2+avgJpPDjbvKg4s5t3Ft
	QVFmcelny4TCkoMccYYuT6g06Abp00MQh4ru1QRNxceR21Kmi9ZRUvl6MxWJiyScBxsaFDjGdWf
	3tA2a6DEjdzHA1P9XwO285DeIrAjzG5eWTdGReU+rR/apVGADAK7HbsNSlGiz6Hs/Ns6dzLW/a0
	PvJb04j1FZKFDJ9xHHj6MIS7IOW7Pu2TgDI/cNWWvJbyFyWuLK5TbB2MZoX1c8V1PWrrnd0abdl
	BVklMC/t1GIhL70Iqwe5UqQHXw4ECRUVzzsAk45IzE32mNeKcPOp8VxcgrUVdsgSDmb5Mbd1Fqa
	i3sRWd8WOJ9M6VS3ZPyA4UaalIGW4SN2LGggZQWbzy6GcUD1IBaPwxoF8nAy028OrcAJXcrwQoY
	9Y=
X-Google-Smtp-Source: AGHT+IFhCWJEojvA7i+pME+fago4vJDtFzuQD2e2yOvIROciTuu5CIqY7MvPDw7EgLATDPP7poH6og==
X-Received: by 2002:a05:600c:4f49:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-45a1fe78624mr4900695e9.4.1755182567395;
        Thu, 14 Aug 2025 07:42:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:941b:4c00:f383:4db2:82a:81e9? (2a01cb08941b4c00f3834db2082a81e9.ipv6.abo.wanadoo.fr. [2a01:cb08:941b:4c00:f383:4db2:82a:81e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c718769sm24256305e9.30.2025.08.14.07.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 07:42:46 -0700 (PDT)
Message-ID: <da8578ae-3f79-4082-b0fb-760553004c93@gmail.com>
Date: Thu, 14 Aug 2025 16:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/20] dt-bindings: memory: introduce DDR4
To: Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
 <20250730211151.GA1749004-robh@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250730211151.GA1749004-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_074249_180424_F222FF24 
X-CRM114-Status: GOOD (  15.08  )
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

Hi Rob,

On 30/07/2025 23:11, Rob Herring wrote:
> On Mon, Jul 28, 2025 at 05:29:37PM +0200, Clément Le Goffic wrote:
>> Introduce JEDEC compliant DDR bindings, that use new memory-props binding.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
>> new file mode 100644
>> index 000000000000..f457066a2f8b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
>> @@ -0,0 +1,34 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr4.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: DDR3 SDRAM compliant to JEDEC JESD79-4D
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +
>> +allOf:
>> +  - $ref: jedec,sdram-props.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - pattern: "^ddr4-[0-9a-f]{2},[0-9a-f]{1}$"
> 
> Shouldn't this be 'jedec,ddr4-...'

That's not the case for lpddr bindings, I wanted both lpddr and ddr 
bindings to be similar but this can change.

> 
>> +      - const: jedec,ddr4
>> +
>> +required:
>> +  - compatible
>> +  - density
>> +  - io-width
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    ddr {
>> +        compatible = "ddr4-ff,f", "jedec,ddr4";
>> +        density = <8192>;
>> +        io-width = <8>;
>> +    };
>>
>> -- 
>> 2.43.0
>>

Best regards,
Clément

