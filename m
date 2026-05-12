Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6D4CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQnrgdg1gVahQ/5LxpQYUhIfSAqiqplYWW6YUhu5COw=; b=jpuDqCpVS5Gzwrs67Wz10HQyKj
	yiV2FrXnx/NhvoYyGW79ZKlIe3eG5MdNbsWP/1nZLS3YCVoTa+h0DIQqsmwOx+07iRNWomDaBpgWr
	08fitAGD2fUBvBDLwPQTgDWmmS/ihaP8ulKDxH0/hKqrs8yugp191xK9jafoszJSdiyaipiQnHgRN
	0/Sj9PcSRAfCtcGwn5mk88aRD1d7rlNZOFJ7nKJLw3sKClAEdkT9W52DC2EURNhgKH76rEJiknOr0
	njizIBOTUlN9DPPyNMebmxg2pzDL7qCZsW9ivB05OYRbSJ+fiwwjrQqFI9CA5YI74QD05efyy3EYg
	S4kdiq5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnua-0000000H04F-2Ubp;
	Tue, 12 May 2026 14:16:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnuZ-0000000H03q-3ElD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 14:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oQnrgdg1gVahQ/5LxpQYUhIfSAqiqplYWW6YUhu5COw=; b=fNX9GBPeO+IcaBFnC9n7taT3i8
	DSkeFpr+wvdtJbj8NZ0hGHFCva8fvUjVZpKfp2XEEyMZI9Sg0fsnSyIfsKjDMeQcng6MCAGkXA0+P
	FaK3+7hTYZQ836G9hqbi51Hev5dzcIkue7fH6obFVEamXpUZ1tzrOSV63Gos3C0K+rgHAX1w6gFJr
	tncFohhWGQvhErzND2Lr2XokqK+UXo4fWHWCInQ3YHcY7gUEGD0Ycw6CJTI6KCY1ZsaWDvEJ+a1s9
	1PvI686vkHgpr2Lha9bg6wGpqp6jgZTci932E7RZ4eISdXShE5e26WPjoe5af69pveNns1eEdspvW
	8Pj989EA==;
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnuR-0000000ExCw-0Ww8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:16:34 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-694891f8f75so3082164eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778595388; x=1779200188; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQnrgdg1gVahQ/5LxpQYUhIfSAqiqplYWW6YUhu5COw=;
        b=0DfgarkQ4n5uC5m+hKT/jJeQxFalac1lzy6rgrTlFb8nkXnKNDnVtBw5InEIbK9v9P
         +81LNrIt+y62YelnUn+lJIZe1vAO6WfMqTwh13gzUcKDpkQvI3tppo/QjdL7hB69mqSZ
         33RZJPgxwe1AzKg44dcnpCi/q9C1giqQsP3c/P0t13CFeddLyF4nnINmM0BAnlieV5+y
         6wcxA4HqvDX72VKW99snfkLpLq2WPmvmNJy7JAkLVI34ginZVnupaiO+cCWhG9tm1KtG
         a4LwKtG+58rX5oQa93tlUqgqpjvth7M7kL9QE2VA2FyeBMhn1TH56EROHriNm6RHuZmO
         oUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778595388; x=1779200188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQnrgdg1gVahQ/5LxpQYUhIfSAqiqplYWW6YUhu5COw=;
        b=bNVWgxvvrT4m+UPCnJPTPMLVHndJoQyljmAcSrt98EIbv4bIKpYxwZCpmQwE48L46K
         oNd6tXvzDpOex6Kc0c2INIUJFsJHid8+zVLk0g31RgxsCQSZ2afwdc53j2o+EBTp+Hcg
         /S5y2rhcTTCq/l0wHNYkrIDzN/qQJ5mhb45T5ljnoEcBS1meLRZWPzQzBLGQRM66hXI7
         t579Hmz4eTY02J/cyj+EQfPIVM1o3ZkaNl5/DtZ1b7FmQaMiX4Qi9DpdawUmozSOxE8W
         xgK2yuCjMSCj6EMc9PX3wcz3YSIt+5Fwzr3Udc7Y06xUbYr1D72/iIXUnuqqoDIYFXSJ
         mMqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IzG/sRdMOghFNzWjmpzmU7EItsKHAnsQeyWETEljcNivLqSyDkX0iiCds97mGLKUe5lXkKwC6bWDlnDNMR2TI@lists.infradead.org
X-Gm-Message-State: AOJu0YydSsCNV7VGO+bH//3PtD9muR8bVGy7f2XCgb/gawG7NsWsr5AZ
	5XA+Xpiu3gEov7faiQgw8gHzFHpMDRXdE4tYYIf/z4O4k7dXcBOxIAlFwZBVMNwNgZw=
X-Gm-Gg: Acq92OEBtcGwSn059Af3997OXoFEJw/54OcMvh5gxvv3sLm8nH0IlTbkuYl4RlIv0lW
	vUvySewBGg7wSC/zWoaBAMnBdOQ3mrNw55WwIdeNAd+TDxvGep+nE1XINCwkhDToSZasBq7+nA6
	rg6j9MI5lZvVyquVlPL9OcuwlHXGsyD+NgofVQRRXNAvFzjVfLLkCCGomJuEbCQPbLJvwSW7GeQ
	rnI4pgYME+/hMDdacVlefHFE+6yaJGI2HPTU7xEFv6PW7eKHgRXeEYz1xQB8zKHgcKrTZJZJvIU
	PkBaxlrkd5OoyEgwS8ba2afWXFBLVfL+LoMzwmYNftYoZNFhs9arMrRe/9iAMiKTGeSoGg+D763
	DkSJpw7NnX6hZhyBvjFkTCzEjUtmRzLav4i7ZivswZwPpDd4LIR1qeAprCPqkWb0dC2X6iQTPZk
	DSyPbF4eHyjJTvkCKB6OwTjG5/lr9gL8jUIAT3SNMfWEi5FauV6/EVSs1fIQs3w7eM6EX478aKk
	j7pzaFjAI7g
X-Received: by 2002:a05:6820:a0d:b0:696:6c93:e81f with SMTP id 006d021491bc7-69998cfdb44mr16111351eaf.33.1778595388361;
        Tue, 12 May 2026 07:16:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:baa4:f7fb:528a:2457? ([2600:8803:e7e4:500:baa4:f7fb:528a:2457])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25e0d124sm7192765eaf.12.2026.05.12.07.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 07:16:27 -0700 (PDT)
Message-ID: <db7fc677-56bb-4421-969d-6116a0a57d77@baylibre.com>
Date: Tue, 12 May 2026 09:16:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings to
 YAML schema
To: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Pramod Maurya <pramod.nexgen@gmail.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
 <20260510120141.118057-1-pramod.nexgen@gmail.com>
 <20260511171554.6541042b@jic23-huawei>
 <7baf9ca5-50ff-4131-995b-70ee094ed247@baylibre.com>
 <CAL_JsqLxtWLR+jxRXt7Uz6dcF-90NYmfyGWYQk9um9TYHSWbTw@mail.gmail.com>
 <a4ecfb27-5ef4-4682-b87c-24917f81b4f0@baylibre.com>
 <cc26edcf-3218-4294-a522-ffafdaf41070@amd.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <cc26edcf-3218-4294-a522-ffafdaf41070@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_151631_603753_2524E150 
X-CRM114-Status: GOOD (  18.84  )
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

On 5/12/26 9:10 AM, Michal Simek wrote:
> 
> 
> On 5/12/26 15:58, David Lechner wrote:
>> On 5/12/26 7:14 AM, Rob Herring wrote:
>>> On Mon, May 11, 2026 at 11:24 AM David Lechner <dlechner@baylibre.com> wrote:
>>>>
>>>> On 5/11/26 11:15 AM, Jonathan Cameron wrote:
>>>>> On Sun, 10 May 2026 08:01:36 -0400
>>>>> Pramod Maurya <pramod.nexgen@gmail.com> wrote:
>>>>>
>>>>>> Convert the Xilinx XADC and UltraScale System Monitor device tree binding
>>>>>> from the legacy plain-text format to a YAML schema, enabling automated
>>>>>> validation with dt-schema.
>>>>>>
>>>>>> The new binding covers the same hardware and compatible strings:
>>>>>>    - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
>>>>>>    - xlnx,axi-xadc-1.00.a  (AXI softmacro)
>>>>>>    - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizard)
>>>>>>
>>>>>> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
>>>>> Hi Pramod,
>>>>>
>>>>> Something went wrong with your sending of v3. I have two versions sent
>>>>> half a day apart and no idea how they are related.
>>>>>
>>>>> Anyhow one of them got feedback from Rob's bot so I'll assume we are
>>>>> getting a v4 and wait for that.
>>>>>
>>>>> Jonathan
>>>>
>>>> I think Rob will have to fix the bot to make an exception for the
>>>> legacy bindings. This should have been called out in the commit message
>>>> as requested in a previous revision.
>>>
>>> The bot is not the problem. It just runs validation. The schemas will
>>> have to either drop this check (comma's in nodenames) or exclude just
>>> this property.
>>>
>>>
>>> Rob
>>
>> Even though this is an existing text-based schema that has been around
>> for 12 years with this name already? Changing it could be a breaking
>> change to existing users. Although there aren't any in any .dts in the
>> kernel source.
> 
> Zynq has it described.
> arch/arm/boot/dts/xilinx/zynq-7000.dtsi:111:                       compatible = "xlnx,zynq-xadc-1.00.a";
> 
> And make no sense to describe programmable logic which are that other two.
> 
> Thanks,
> Michal

The issue is with the xlnx,channels property name. Searching only shows
this in the driver and in the examples in the bindings .txt file.


