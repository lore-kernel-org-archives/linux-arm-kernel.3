Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA89ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRcckAhyKKIfk/Fgtz+kopwNbFInJmosFYKCEYbjFWg=; b=xWSbkQl9h3elWRY5yrMAl1hkCH
	cl+dG9pIenmHVaLCNrBlMw6wvoXKwokmSEXY0Fbs++zGeCuRuaOcrLMgwY0MylcaX3gwYm63QhrAR
	8Z3kYFP2+apLp8kodTTR5OhdgOVYt+yq2tFBDZoE/x1SiAhmwseiLo6riXXUcExJw+VL5B6jy+zOV
	5/MoYSpzyRclnwxOHR2Wy8qM/zWU83FrcVGF2/i5cAI32vWZGDlE/x62ZXAqcYZ6VM6CKX+AoXMEK
	rqlnunfkSObirPjM3CFICZrLlCWSwyr8ti+81SELq63TqeYgTG6XnRGbS7J6+JsohKsNwSsyK+e+b
	xgcThZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWiv-00000007zZo-0lhF;
	Mon, 25 Aug 2025 12:54:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVtA-00000007rIi-1iBK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:01:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b614ccbe4so5236035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 05:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756123286; x=1756728086; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rRcckAhyKKIfk/Fgtz+kopwNbFInJmosFYKCEYbjFWg=;
        b=bzIKevKz1XeqUiQcL6lXMbpOAcHHoNJulEjYwyJvl01ZNZiSMG02YE392f4CIOhLTI
         n5WkIMGU0h5OkEBJ55zGcUWF74H1CqTdQAN4DFS3vgdVj6a4IHXo+sR2oKOSSDZeVSD1
         KNnEM9tW9LVOHsIH36OWBR7FJ805DL1MJZD/DfhxI1no1ql8J7/lcybKU9NcR98y0wtG
         r7kRoQhzcnKYTEAzVB6zLZdKNItWc1vl66iTrPwUb+Z6Th/DqG9qINqX+BmU5V+BZU1F
         KOLZCecGZ4vDyxC1DxS6pw8+Lnl0t5sBzkFtbGVkwVwZiF9zNBNZBMFM4ygWAjCev/js
         WvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756123286; x=1756728086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRcckAhyKKIfk/Fgtz+kopwNbFInJmosFYKCEYbjFWg=;
        b=JAoRRQYRSgq5UwQFnCBpmgBMymVFbkOgZuJOSNwKJUQ4YI61Af+qkf9FHm+jsmRj4c
         8RWG5tiQN4gZmtM3Bkso7fCe1MtcUPoeKSHcd25MmvScwEXICc6ntgAu3Klcmw7ufWUh
         /6pHkTWc8JnFq1eR0grqnXxohJ1SVyXegKPKJJk5f1ZPfDebU44LF3Ha1rugtPuvEYad
         VJKGeWW5wrCP8pIXKCoCjc7PD44TM3OC83MSny5+SA28ixBZ+ollbckroO2s+AVdqQoi
         fi9Z1y4q6HdCRMT13nxy6NI/3Hbae4mokwqsyc08V/A9vzUmxlOw/n5PF93ngFWq8xGl
         2N2w==
X-Forwarded-Encrypted: i=1; AJvYcCWkaiOFC8yM09OdokqlMuw/GI8KC/3eyNIXAiUgXrAcluck7Dmrb08QmMVBGY/rfc5OCmMHe1X3caWI3M8c30So@lists.infradead.org
X-Gm-Message-State: AOJu0Ywujs7gbPcUAdGS1c+5XCrM3YjeJ/FVxfNQsX5onbShdi5XPa0R
	CWiCwBn8+c1W72Okq5OB4nlPJm4xN6G3n8WQG3YRbDq5QJOJtUH+sASBI1/muOAbWRw=
X-Gm-Gg: ASbGnctty2B740fVU7YiUFlr3HDxWpy6yzyh/njOvwH+iXXrCxxvIj27jo+xEwg5ml/
	tBtRylPotKH1nQ3jHkGXHjOs6kzdKhcRzrjEy664TGulHeI8Lcd1BaDlFSbEvpP/i1dXJ9fxB3g
	rQeuGwh/D4g2StFYJAqViae4to/hqYODfROPJj0P5RKl/w2Ideal9KoT/MUyy8aMtkKj7hTuYOt
	aLgS7ph562A4KiMXS4AJ2gPFJjIcc9BdsI/0EfncgGaBa/n/hlMuwP34bL138cMSioA1hG1shrl
	ujDu+phK19ESUnqcGD+O78gD0E7Hj7cHBNXjlG9Uq9kMbpI5FBMCSOS2I7sy3YarqhfFHZlHnaD
	bcm0buw24SL8K4u2UiglgdrhW68a1bAE=
X-Google-Smtp-Source: AGHT+IH62AfWArXNyegFI8zsNyQcP9qoQacs5w+PUV6JSw51oEdiaFXWL4IPdH3vJ0s3i8QgSe1+bQ==
X-Received: by 2002:a05:600c:3590:b0:459:a1c7:99ad with SMTP id 5b1f17b1804b1-45b6133ff14mr19383645e9.22.1756123286249;
        Mon, 25 Aug 2025 05:01:26 -0700 (PDT)
Received: from [192.168.0.251] ([82.76.204.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6300da81sm19978265e9.23.2025.08.25.05.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:01:25 -0700 (PDT)
Message-ID: <eb2416c2-ee1a-4770-803d-1d890e4ce238@linaro.org>
Date: Mon, 25 Aug 2025 13:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: firmware: google,gs101-acpm-ipc: add
 clocks node
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
 <20250822135521.GA3487754-robh@kernel.org>
 <ebea336e-c43f-4519-b2c6-4f8812e29448@linaro.org>
 <b7bfe424-2cfd-4897-ab0d-69c8e92acf24@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b7bfe424-2cfd-4897-ab0d-69c8e92acf24@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_050128_468969_B7667623 
X-CRM114-Status: GOOD (  17.11  )
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



On 8/24/25 6:00 PM, Krzysztof Kozlowski wrote:
> On 22/08/2025 17:03, Tudor Ambarus wrote:
>> Hi, Rob,
>>
>> On 8/22/25 2:55 PM, Rob Herring wrote:
>>> On Tue, Aug 19, 2025 at 11:45:36AM +0000, Tudor Ambarus wrote:
>>>> The firmware exposes clocks that can be controlled via the ACPM
>>>> interface. Describe the clocks exposed by the APM firmware.
>>>
>>> ACPM? APM is Advanced Power Management aka the predecessor to ACPI?
>>
>> ACPM (Alive Clock and Power Manager) is a firmware that operates on the     
> 
> Please unwrap the acronym in one place of bindings commit msgs.

Okay.

> 
>> APM (Active Power Management) module that handles overall power management                              
>> activities. APM is built around a GREBE processor.
>>
>> In linux we have an ACPM protocol driver that communicates with the firmware
>> via mailbox channels. It's similar to arm,scmi if you want.
> 
> Rest of Rob's comment seems valid, so this also invalidates the DTS.
> 

I assume Rob and you are suggesting to drop the child node and add 
#clock-cells to the parent. Then define the specific clock data in
the parent and create a platform device by hand for the clocks with
platform_device_register_data().

I think this works well as what's used in the kernel is just the
clock mailbox channel id, clock IDs and clock names. And these
can be defined with parent's compatible data.

Please correct me if I understood it wrong. Cheers,
ta

