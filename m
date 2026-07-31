Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48B0C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEYf8XWt7uIQNYBnvw5HrwZeU0df85IjOKBJMRJ7Wzw=; b=UDZ3by/rp8x5WtlPjpwtsfOip7
	fRQEeL62jEJDULnisdG41ahFmT4R77wKcTmq9+dw/kQAYNWZb6Er/VgTPBJG1g1Xqdva2Knls6yTY
	5sLBjgfVaBvFB7sRx1b8hMHvQx2hr6PrMc3V+0mxolvJ/zgHR0yJu32CWzI7jW9Fp4xmyHXp0U11P
	Q+PAHaIyFEFNXU15hvVgW8uCkVHgLtfftCG/dm6YV4onlojN0FuasAfwtLDl0ySOvPaeO4Zx8cP2f
	9QvwdWzaDCMQ3FnWPlBTjHy5r/ERIQkuGg8y406xla5j8y+Xc7PBO0kewH/mJs6tKCiCcb4ec2U8Y
	3M7DyP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoJl-0000000Cj8h-3B0u;
	Fri, 31 Jul 2026 14:34:33 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoJj-0000000Cj7w-1UGK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:34:32 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1087718e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508469; x=1786113269; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEYf8XWt7uIQNYBnvw5HrwZeU0df85IjOKBJMRJ7Wzw=;
        b=iVNfMcpXFtB98Qeb1E85GFVl2aXJlrmx8pFMUkFDNYu0Ooyf7RhXgt8uXD8SMkc+Y7
         5Vi+W/w+nOzWF2Q+/EQFDex2XvZ/937VCkNlBH7p9Pn0CAWZgKddMgV5QLSjcDAB5Zt6
         EGNV3Kr3B2le0LDTt9aKplrM3ekC1fjZeJIygEYLJZd3psAoz7EuCITFxjEwItlv6Lg4
         Hj+rm+HOgrmW0o4mZSvoWLHzlFPrjYdTuZoKNEFzDSton+y0hV56oISBXejmIaWqlV/C
         opsNFn2wyQiE1bIgnvjBmWzM1btpiMzz5zzYFViTRqeX3+2+WkgnBQEjy5bGjGiVuq27
         zjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508469; x=1786113269;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEYf8XWt7uIQNYBnvw5HrwZeU0df85IjOKBJMRJ7Wzw=;
        b=D4JDkpd2+ZefHwCnXl+STv47zH92Q/HfBXW8hOZzb9sRhyui+YSo7cfLMIrordXhzg
         EM0i3Z6qdiLyqEeMDYtBUfH8pLtU3aTFiczLJ9ZCnCI0Il6XPemvgN6T+J0BOsDvC8wv
         1s3aqqIkVd5iWDWAte7sT1oSeMZFyCGVBB37TiqU+3j4rp/11kruks8+V8sw5pXJO8dJ
         2VwUiMeFILJTtmtCHlhgg6ktat2qfbgN/5ZiQm+gprmJMvoSQgmA+CEKEkwJZD+qMad8
         3EIObFCRrUe6xTZEGhk6CJQnjavoahSSxAfCzIeVBPNQApkNH1IcaBn5IQAX7dUS/zrN
         hfHA==
X-Forwarded-Encrypted: i=1; AHgh+RpGjIBuCQRpW8+s8SP7GuH9gW/dEmIxBT/psHxYFdr3rbpS2lCUsdk4dNe0WObQaAi8velLkRQmWBFNlr7z4mE6@lists.infradead.org
X-Gm-Message-State: AOJu0YwnAHzAsIrGYdHa7XM3bdu2Thfxzc4ipl4ZtFgg/OEG1/IBnuUe
	LPPMmLtpL4nBYocQyAZjt0JFIjbV0P95U9s5sMb6IrcLyEiU0WTLBPKe
X-Gm-Gg: AR+sD11p3JFe2C2zL/KngYUHa0je3n5WFoot1yDsyMmjgYzYE5fcP3+WyhqMcX+Fkm7
	bJVO1d9hkYMM7VcM3skuq9dmt68CAJ/byLZRuX0ZyeXy3UQiXLcoOKJpGdhSoc946ndXZyG0U2E
	V243ul5diatXxnP7lwFkXv6FZis0HHUFqIqt9p9lBy6fO7D4L5zja4JLkG9JQ8YAxKKbDJyjICl
	7OcGdCP7ZHOeDuUjkaXE7SPrxOz68088FOPta6Ssz/DUuVW+62IUPLcPpTghOF8NELuZ+x0LlK+
	heum/5NaSAsjy+ecr1LNU8Q4GkZ9EBtuuGBfH+zK/OTFMlPBzG7lOFFYFzCfGDNu2ysVoBGp5q4
	S6geDnXzlqhhvKiMdZo+pr/fh+fpy34I5I8peMZ73KjwNOQpS6lyyu6wGdyTUht8ulaPETQ7dGT
	5z10RVBFPMNH+4nggRK93C00Ypro7RnxVm3ULJNj5b7xgjGteut0GCNig9zvmfLmx0NOZNnC3U
X-Received: by 2002:a05:6512:3d03:b0:5ae:acbd:439c with SMTP id 2adb3069b0e04-5b2e2422d22mr454761e87.23.1785508468894;
        Fri, 31 Jul 2026 07:34:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2441db4sm332262e87.45.2026.07.31.07.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:34:28 -0700 (PDT)
Message-ID: <7855a0c3-29ac-4842-8e07-352fcb535a63@gmail.com>
Date: Fri, 31 Jul 2026 16:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
From: Konrad Dybcio <konradybcio@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-12-wenst@chromium.org>
 <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com>
Content-Language: en-US
In-Reply-To: <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073431_864569_CE129321 
X-CRM114-Status: GOOD (  13.47  )
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

On 7/31/26 4:33 PM, Konrad Dybcio wrote:
> On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
>> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
>>
>> MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
>> and USB 3.x Super Speed (SS). The block can also be synthesized with
>> either HS-only capability or HS+SS capability. The SSUSB controller
>> handles the device or gadget mode. Saying that SSUSB handles the HS
>> portion is wrong.
> 
> [...]
> 
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Super Speed (SS) data bus if SS-capable;
>> +          otherwise High Speed (HS) data bus.
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: High Speed (HS) data bus if controller is SS-capable.
> 
> FWIW this is opposite vs what the (most common) DWC3 schema defines:

(s/opposite/different to)

Konrad

> 
> 
> (also true for mediatek,mtu3 and renesas,usb3-peri)
> 
> -- Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>   ports:
>     $ref: /schemas/graph.yaml#/properties/ports
>     description:
>       Those ports should be used with any connector to the data bus of this
>       controller using the OF graph bindings specified if the "usb-role-switch"
>       property is used.
> 
>     properties:
>       port@0:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: High Speed (HS) data bus.
> 
>       port@1:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: Super Speed (SS) data bus.
> 
> Konrad

