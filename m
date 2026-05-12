Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB6ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgNJhNIeorV7YFB4VYbzC5DWm0skgWvwJAbHsFTJdPA=; b=tOe1xfkkAhrJDKA/jQwXr/8zds
	0wqd2dN47Af5OfBtWMJMHGFQAuhKKW6qWGhnLroqcyD/I/BK+d0wowbxdCa7k6yJ40PeepTekrY4K
	dQv7v9+gURvLC/c4m9GJInzf3J9z6mr5FcrWR9vskB6RfdrS/esvbTjoxPxQt3Ry4APtO1wz5uB29
	KSZYRTpD7211uU8MRKFI7gWqTXtsDxApOD2ui9zX46Wi7t0ppoj9MeKApnS22LxUCooF1nV+mzhKV
	bYLfei4yUJgK24sicvPRz9ddKGsXICf6nWKEeZh+VVaGCtQLjrOuLDtSk0rL4N9kC6BF4AxQhFkly
	4ecPyFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnrK-0000000GzGQ-2MwK;
	Tue, 12 May 2026 14:13:18 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnrH-0000000GzFb-0Bvd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:13:16 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7dea20cf21aso5070245a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778595194; x=1779199994; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kgNJhNIeorV7YFB4VYbzC5DWm0skgWvwJAbHsFTJdPA=;
        b=prc7oHvjpGSvbr6jzplYMSn/JWq2xO+C5ByVIRccfStaXH5mvonPyvRlvb8K8F9Z9y
         n4YDlZSokmi7CKFG3uXaNl40tdQsXqYyHOb4diXunYQ3itimFZUhIGSzKgViKydPPMmJ
         r7FAWHabxUxu9ExttRFNAUfFbktTEmeksvMjxVhsNnwzOtblseL9opmJtsUnWm6HAMM5
         inBUAgSrwy6fDu1VXUavtepH6s3dCos4omL4Ec1g+1ZcAt75EhHwYY2rSsKsFyuEZVzL
         3N7GkSix54MN24bK9yoQmHAeDpaPjNh8g1Oa5n4SyRnWLrfWQisKjVSWFnxqTxu3xPB0
         LkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778595194; x=1779199994;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgNJhNIeorV7YFB4VYbzC5DWm0skgWvwJAbHsFTJdPA=;
        b=oavCOPaA5mDYsfVFvvV2UsWi7RsLT96ltFfxNf8crAq/SpTeLygPsCDSKLfVdHBDIi
         gb6AdpywY4JDhXtMBjI0zuhaDp5hsd0pt1EjBTowXMWUF7FApu1aZlQ7H4AIAg0UyOpy
         d7oUieZYOM0kc+hW7Md/6DR1v/f/97tra6EqefDupZgWdz3KDyGCNS9EZzKdP0BV7r2b
         891aCbS0uhSY4kJ3nthq3a0CErq41TKFHEOiyaOzHzYG3evABPMGWW4wBxADqdTvB54n
         m1yzt9vmGM2xWDVgEpWuFHWw3tyKEDvnvTevYJYAxUgovmH+egVqB0oi4OldFgKE9oSq
         QmKg==
X-Forwarded-Encrypted: i=1; AFNElJ/2NucfwgJUDx0xllqE2Id56yeTeYS0FK+7txli/26DvmVdaHmwQKZuMdf2VeA1bk4bgzCmFTAJqFRfmFUru/hU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9miSyA16ky2kY4VgJ0mGnjszAY57b7OYLKx3EGqVqTctentLP
	7/nQ4liNWcSvdhwn1q4KXhnC8xuJJVO+Ja1kO2YGQoKevC9ddEF/9si25dtBLzMkStA=
X-Gm-Gg: Acq92OHCXDDmtFn17rUj8layB93Q5Z6nKrur9uhwskg85bu1GecU80tI+M2sz8SBAE4
	Y7Z7sUBzniVsaKO0nTSR4TMITYtsUjOKamkLdz1nTQXA48wZkviuLwKYvHwGGd0crFVNSereskh
	hwNgH2wdHAcytaotybvbYRHA7GJ6pjhFq3OJUe1atst54O1cg5Wdx13/ImQZJHKyA+WS9Woub7/
	bY+V2Rrl+CwdAd9pjR2Z4VHaynk/xI7ROZ3pmd5Sm3Brkb7O4fNRtLwhSVH862Xtj52An9oxTqd
	an9wvftT+/YJOgduB3Le0fDzTjoMSLWjJA6DzWNFWgvuWhn2bSjwsii3Ifpr9KLIgM1N7bRIl9g
	tcRnTqou+ZthYyuWfSXPFOD32gH+KR1QLE1L1Jq1c9oVx2Ygb451k7+Xgez2rk0wmhRBVKnnBA/
	xIu4Z9CUsawTSyErW4aGCBbY1Vx7aMtSL3w51GwlXey5TwXROLVuKRzpSvvn0iOeRA1w0OngD2F
	A==
X-Received: by 2002:a05:6830:dcc:b0:7db:a184:2b39 with SMTP id 46e09a7af769-7e3c3d98299mr1933172a34.11.1778595194041;
        Tue, 12 May 2026 07:13:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:baa4:f7fb:528a:2457? ([2600:8803:e7e4:500:baa4:f7fb:528a:2457])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367be1168sm8998431a34.5.2026.05.12.07.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 07:13:13 -0700 (PDT)
Message-ID: <b90ba2e5-bec1-4acb-9ec6-97dffbd61182@baylibre.com>
Date: Tue, 12 May 2026 09:13:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings to
 YAML schema
From: David Lechner <dlechner@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Pramod Maurya <pramod.nexgen@gmail.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
 <20260510120141.118057-1-pramod.nexgen@gmail.com>
 <20260511171554.6541042b@jic23-huawei>
 <7baf9ca5-50ff-4131-995b-70ee094ed247@baylibre.com>
 <CAL_JsqLxtWLR+jxRXt7Uz6dcF-90NYmfyGWYQk9um9TYHSWbTw@mail.gmail.com>
 <a4ecfb27-5ef4-4682-b87c-24917f81b4f0@baylibre.com>
Content-Language: en-US
In-Reply-To: <a4ecfb27-5ef4-4682-b87c-24917f81b4f0@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_071315_090610_D232B036 
X-CRM114-Status: GOOD (  17.50  )
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

On 5/12/26 8:58 AM, David Lechner wrote:
> On 5/12/26 7:14 AM, Rob Herring wrote:
>> On Mon, May 11, 2026 at 11:24 AM David Lechner <dlechner@baylibre.com> wrote:
>>>
>>> On 5/11/26 11:15 AM, Jonathan Cameron wrote:
>>>> On Sun, 10 May 2026 08:01:36 -0400
>>>> Pramod Maurya <pramod.nexgen@gmail.com> wrote:
>>>>
>>>>> Convert the Xilinx XADC and UltraScale System Monitor device tree binding
>>>>> from the legacy plain-text format to a YAML schema, enabling automated
>>>>> validation with dt-schema.
>>>>>
>>>>> The new binding covers the same hardware and compatible strings:
>>>>>   - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
>>>>>   - xlnx,axi-xadc-1.00.a  (AXI softmacro)
>>>>>   - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizard)
>>>>>
>>>>> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
>>>> Hi Pramod,
>>>>
>>>> Something went wrong with your sending of v3. I have two versions sent
>>>> half a day apart and no idea how they are related.
>>>>
>>>> Anyhow one of them got feedback from Rob's bot so I'll assume we are
>>>> getting a v4 and wait for that.
>>>>
>>>> Jonathan
>>>
>>> I think Rob will have to fix the bot to make an exception for the
>>> legacy bindings. This should have been called out in the commit message
>>> as requested in a previous revision.
>>
>> The bot is not the problem. It just runs validation. The schemas will
>> have to either drop this check (comma's in nodenames) or exclude just
>> this property.
>>
>>
>> Rob
> 
> Even though this is an existing text-based schema that has been around
> for 12 years with this name already? Changing it could be a breaking
> change to existing users. Although there aren't any in any .dts in the
> kernel source.

Pramod,

Unless Rob changes his mind, the thing to do would be to use the standard
channels property from adc.yaml when converting the binding instead of
xlnx,channels.

We will also need to add handling in the driver for "channels" while
preserving "xlnx,channels" handling for backwards compatibility.

xlnx,channels will just be undocumented.

And all of this reasoning must be explained in the commit messages.


