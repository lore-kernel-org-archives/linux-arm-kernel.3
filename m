Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8925E9539A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucTLWIPqxA/vCqaGy0l8cS/iqXl1ur9qYq3vOPXkVyY=; b=slS8q+A28ckFzQfO5Onq5WZz+W
	C3c+G9FM8xBl9LjnCkt7HtWefFNSxccxwyOHEWmCBqtdhP0I3JBDO/jKJhEcu+GgzoUfvdtaf2y0/
	aGdt6R0jck+28SQfJWar+Fa6VR5O718nFy+x6S0rRtFao1Seuh2jC4XCr5PgaPcMw8Z9GtkOc/3mD
	ukLSs7sG2ZRR3sBoXHiCHarOwcCmgNoyJrCtUh1FsAwjjU5Q3NLNbBFosOFysAFQaK/BY1/bf7Bf0
	9APV9s38Kmy7YXjh1YB/naFe3/btB4A8MeFenw6cmMYouJmJeVGuYd3DVJ5ZmUMa56rgtcRGdnmx8
	q8XhT5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncdQ-00000008TnS-379w;
	Wed, 04 Feb 2026 13:09:32 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncdN-00000008Tmd-2Ig1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:09:31 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82310b74496so3909879b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 05:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770210568; x=1770815368; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ucTLWIPqxA/vCqaGy0l8cS/iqXl1ur9qYq3vOPXkVyY=;
        b=aEp/hIj4jfp1CZWXJjbUR26jgU+MFVRHwolVu3nn0qWN4H3wjxTHgK8ZpZCeZkLtsi
         q9qLj3DI+Tcs5qv2V7besRQ06nmEkNEMgszZwngHI82NKqihMHttNNj7/EwaTzeDLk+7
         5bLqfNFPAT+WjJ+T2m4QyrOzfrmpegQVUD2EeVkmbv7lwFIozH4jprYNZKGyOGCn4IRC
         PtkSpWM+9lnUzZb3N/aO9bwA+AqHg0hWsDf4IQ2UhmJUfXK52Sr6sLiz+Z1R7AK5abxQ
         UUTBGSxdp1GcCgoxl+o5b/utVDK+4zpY2rAII7bpFFaDd+rE/hh6gfQ5fOKYjyZZWOLY
         0FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770210568; x=1770815368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucTLWIPqxA/vCqaGy0l8cS/iqXl1ur9qYq3vOPXkVyY=;
        b=JYPMlKyQrEp5qg05ebVFejCW3PAxkCGpj/IkOxTarE2d8OW7gCbSSXwkGkDHc0zUPK
         dPOLP9+V7ZReCKekdZdzaNHXT4FYPVDtjy5wicOL9RvaUO8rnXN43SC44KH+lO1iVv1k
         lSlGJjy6Hd94BwPSeiqG0CJPWcp+AQBan5f4zhnWPvBtFthZ/KEnj8ll7JiBqvJjk5Go
         G9lmnVrYkteGF4gQx9Ityhe3JitNRGu2H5u7HdNsETwJ1gGjUoLWuy/rXTpEnppsB/nu
         9BDasQglOgtEE6X3YF8vHoxUmwsqk1t7iL6OjFnUKZG7ukYwZW5o5ec2rd3JgZFrCumk
         v9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCX+9KhslkyrZm82Mdav3EoZ6qWiEJnobppb+w9KUPswugDClVq2WG7/95s06b2RzYe4OLLEPg5gc8/GpzY+XVUr@lists.infradead.org
X-Gm-Message-State: AOJu0YzQL4Y8UWIi7Z/nFwZ5NMzCDLTx3+ufeWTOrn3q8QfQHWkAH9W6
	Y6btwvsWQuJOziVUwECvvd3ZvtFRf6MWtaggV7CL4g5R0tJHNCmkhx2Q
X-Gm-Gg: AZuq6aIftZmER7DWxt7Y2LDfRku0UM7Ta2RTVfavx2tFBVoiYL8bU1CfHSzJ2GYAE0a
	4rUgZmaBBsWjK2mJlkEXxYBEuNRhcpmB/kWBiMLw4NRPkdotdGSPvKsiN/9a8Du/ONa5nb7tAhB
	UR5qCmus9tO6CJpwIOJV+XNMjC20mZj9McaponixsdkaAaIVbVv3Dwv2rY04BG4kUsQ7v7LYvGD
	Se2NMEAKNH55Kz75b0HduOoMeVGdVt06Zqn5OI2VWasGDm7D0BKfN3Tks3AqNh2J4iRGmTfPAr0
	T4szYXywB8j17xfcrWxWpnYKkF4Aps9FroP0/ICvp6NBqSq58o+C09C9qmmQ5FqliTGt3G1i3XR
	uAZv27eUeoN4sWIO6dzEexBxHKSNoUSjpkoQ2yKHCCeen9ZDT8Qa54MoB/seQrkyWK5AU6Sfjmu
	cAJLwZyrfbJiI+S6k3AZwNYLu6L6LhOi8nM88=
X-Received: by 2002:a05:6a00:3915:b0:7fc:da5:f85c with SMTP id d2e1a72fcca58-8241c5ee4dcmr2492038b3a.38.1770210568081;
        Wed, 04 Feb 2026 05:09:28 -0800 (PST)
Received: from [192.168.1.7] ([115.99.252.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d163865sm2934498b3a.9.2026.02.04.05.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:09:27 -0800 (PST)
Message-ID: <8397e59d-7501-42ef-891f-3f8b3d7a3af6@gmail.com>
Date: Wed, 4 Feb 2026 18:39:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: usb: atmel,at91sam9g45-ehci: convert to
 DT schema
To: Rob Herring <robh@kernel.org>
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
 <c7468b03-9acf-41e9-a441-96ed5d891e96@gmail.com>
 <20260203180832.GA3217395-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260203180832.GA3217395-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_050929_604945_6F9F0B0F 
X-CRM114-Status: GOOD (  22.64  )
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



On 03-02-2026 23:38, Rob Herring wrote:
> On Mon, Feb 02, 2026 at 04:32:54PM +0530, Charan Pedumuru wrote:
>>
>>
>> On 01-02-2026 18:07, Rob Herring (Arm) wrote:
>>>
>>> On Sun, 01 Feb 2026 11:34:21 +0000, Charan Pedumuru wrote:
>>>> Convert Atmel AT91SAM9G45 EHCI USB Host Controller
>>>> binding to DT schema.
>>>> Changes during conversion:
>>>> - Include "usb-ehci" as a fallback compatible to allow atmel EHCI
>>>>   driver matching.
>>>>
>>>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>>>> ---
>>>>  .../bindings/usb/atmel,at91sam9g45-ehci.yaml       | 71 ++++++++++++++++++++++
>>>>  1 file changed, 71 insertions(+)
>>>>
>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Warning: Duplicate compatible "usb-ehci" found in schemas matching "$id":
>>> 	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
>>> 	http://devicetree.org/schemas/usb/generic-ehci.yaml#
>>> Warning: Duplicate compatible "atmel,at91sam9g45-ehci" found in schemas matching "$id":
>>> 	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
>>> 	http://devicetree.org/schemas/usb/generic-ehci.yaml#
>>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.example.dtb: usb@500000 (atmel,at91sam9g45-ehci): Unevaluated properties are not allowed ('clock-names' was unexpected)
>>> 	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
>>
>> Hi Rob,
>> Isn't it pointing to the other schema ID which was not defined by me? 
> 
> You can't have the same compatible defined in 2 places.

Okay.

> 
>> Can I have your suggestion on changing the compatible name to other 
>> name to resolve this error? 
> 
> Why are you converting this? It's already covered by generic-ehci.yaml. 
> Though I seem to recall there were some warnings for Atmel.

Yes, in that case I will drop this patch in the next revision.

> 
>> I ran dt_check in my machine on the 
>> latest version and I don't see any error there.
> 
> Please read the last paragraph below for why.

Okay, I understood now.

> 
>>
>>>
>>> doc reference errors (make refcheckdocs):
>>>
>>> See https://patchwork.kernel.org/project/devicetree/patch/20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com
>>>
>>> The base for the series is generally the latest rc1. A different dependency
>>> should be noted in *this* patch.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>>
>>> pip3 install dtschema --upgrade
>>>
>>> Please check and re-submit after running the above command yourself. Note
>>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>>> your schema. However, it must be unset to test all examples with your schema.
> 
> ^^^^^^^
> 
> Rob

-- 
Best Regards,
Charan.


