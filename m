Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05A9E73158
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXhH8zrVylWsesycxP40bSnYIiTHShVUT+eNMfYxJ/I=; b=KHxRDo1dMj9Tnp9prUaIMQeU34
	0Q1Dspn3c3c2ES10wQ1qNEZPB8qYU3gTyTB1h9emG+UvqEA1TCjkux14ib7KtO+cFMlvd2eVjhiIQ
	a7oz8CVkbRN4kRxj8FdYNL17JRcjWHrcPnQrlYd0rtBjUqPplNNmv4kGInVDu26R4hb8fHP6ESWmB
	4V9xpri383Sagh3tlBsGGv8XiyrbQ7KE3+jUrA/bvrq2jXDBL+hjBUkmmNvLGR/ubGZlx6RU4idun
	eF8G+QnQAFlVYdrAbUC5zH6gP4wgZOI/BsPBcBowCP6StNL6KTFM0OkhBmCrmLz4RVAyYxlLwwgKG
	XrQGxPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrhx-00000004rv4-20fK;
	Mon, 02 Feb 2026 11:03:05 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrhu-00000004ruh-0q1v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:03:03 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82318b640beso2339462b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 03:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770030181; x=1770634981; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXhH8zrVylWsesycxP40bSnYIiTHShVUT+eNMfYxJ/I=;
        b=Sq0In3Iy1s30rrpzmtav2jhCfI/GC72lDn+g5T0t0+FXzdyLarDZCag2YYXwf2/IMw
         fXfk1TmojUcXmldM/9etDn129ZA6Hgn9inrUQMp8A7dw1BkMREpWasJr1/xQQajpDssg
         7byu7U+zy1r7Xtxgwafs45SjJJfo/r0O6RcsEKJAH9Jp4DFLuUjbTFRE/AfxQIb19QJP
         yeduhnLxMiyKUgo3h+FIAmh5RggxjWGFzIXRqMleyklA13XDp3xdit9qhh0nwxCV9cC9
         G9wbKpOuzhOkLYEtlAVCd74cJVNQbY5Q2WXtvsxHM0wwMYOamBOQxY9UjuL8yWU3begk
         19hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770030181; x=1770634981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXhH8zrVylWsesycxP40bSnYIiTHShVUT+eNMfYxJ/I=;
        b=EMYTemISv2fVErosZccLKhcF74dSd2PkpAY3mGxoSuaDu/qMvUAVg43/0VF7NVdhf4
         OVGUZTogA8YN+yryMDWki/gdq91Dc07Q/FGbGEKMrQBaazeDthDvpRYeQiSV2zRAL5kB
         QwyxObHBO9sFrIoEp41rDtgaqGRWiXhyebWCU3Qi1HkpKcD3VqlDKeNF7JYjJN9wP6VT
         4VXt00Uk3jeYMw+vwRekHImZEDsSgFYgEnZMoDJwRa/0IMOqaNjTkSG8otToXw5ERrVV
         AbcH583jMTNx5WWSW5Wt3YvdabEKRDfE0XtnI6gowY/bMGsDOH6FaJrhj+HZr1mww+Xc
         7AYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgTTyPBbi7GDmZablpVfcaRKJjrk9SPxXWbYGYa59GgoesS6GBnVBuglEQZQlPHQ5RnjtQnstD2qEbYzq862L8@lists.infradead.org
X-Gm-Message-State: AOJu0YzcJB4IVgHMOJ4sBl8P+Kl+bTLoOjvYwmA4TJix1wm3Z/JOWhqY
	2nKAL5dXEy3mraVefBwjCViJsDshNIYywglTKYlFHHQiut3X3tAUV/ZoWKs7Xg==
X-Gm-Gg: AZuq6aJ+Dm3mca1agldPLiNsOiwniZkynxoxgYWYxvg8Dest19CBikdFf9GhEviQ06q
	6h1lY/zoZhWyLYL6Wy6Us2k0bSkuijWtraPGnpToZfN8TkKf2OuJP8kVnFxp6Ouzckj5MC5LkmO
	7vd+ZdxqsBqC5X0q1VN36QQoCl3xJQ/y8YShiUpbiiBk65Ydd405QhIHkICFplpmx2miTvnrhtH
	FPTsXjokDyW2bfhRYAYJizMg8ksT0BpE6UCvQ+uPsfw0yjYS21Olj5k7CEJ42IuixrzyjhTdd1K
	gZjkbP7GVJO+OhU253x9vK6hKYr4jPGYeaQYhtYD6gCjsbk7eaK6ZxTfJIcabjXh1qbxFUgtjN/
	BwhyBZ693wR6d1m5hAx84a5wMMz1r1kR0grTAHNio7UVdRCqH3Cs4un5VIiMe5slHsow31Wkq78
	jZG1UVPQ4oNRf+TxqbynCeS7k5c1p//ush5MU=
X-Received: by 2002:a05:6a20:2d13:b0:35f:4e9d:d28b with SMTP id adf61e73a8af0-392e001cbc7mr10045124637.18.1770030181079;
        Mon, 02 Feb 2026 03:03:01 -0800 (PST)
Received: from [192.168.1.7] ([115.99.252.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4154fcsm141359955ad.36.2026.02.02.03.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 03:03:00 -0800 (PST)
Message-ID: <c7468b03-9acf-41e9-a441-96ed5d891e96@gmail.com>
Date: Mon, 2 Feb 2026 16:32:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: usb: atmel,at91sam9g45-ehci: convert to
 DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-arm-kernel@lists.infradead.org, Herve Codina
 <herve.codina@bootlin.com>, linux-usb@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>
References: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
 <20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com>
 <176994942956.410099.10343293169382130437.robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <176994942956.410099.10343293169382130437.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_030302_249202_B0C334C1 
X-CRM114-Status: GOOD (  19.93  )
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



On 01-02-2026 18:07, Rob Herring (Arm) wrote:
> 
> On Sun, 01 Feb 2026 11:34:21 +0000, Charan Pedumuru wrote:
>> Convert Atmel AT91SAM9G45 EHCI USB Host Controller
>> binding to DT schema.
>> Changes during conversion:
>> - Include "usb-ehci" as a fallback compatible to allow atmel EHCI
>>   driver matching.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../bindings/usb/atmel,at91sam9g45-ehci.yaml       | 71 ++++++++++++++++++++++
>>  1 file changed, 71 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Warning: Duplicate compatible "usb-ehci" found in schemas matching "$id":
> 	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
> 	http://devicetree.org/schemas/usb/generic-ehci.yaml#
> Warning: Duplicate compatible "atmel,at91sam9g45-ehci" found in schemas matching "$id":
> 	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
> 	http://devicetree.org/schemas/usb/generic-ehci.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.example.dtb: usb@500000 (atmel,at91sam9g45-ehci): Unevaluated properties are not allowed ('clock-names' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml

Hi Rob,
Isn't it pointing to the other schema ID which was not defined by me? Can I have your suggestion on changing the compatible name to other name to resolve this error? I ran dt_check in my machine on the latest version and I don't see any error there.

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com
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

-- 
Best Regards,
Charan.


