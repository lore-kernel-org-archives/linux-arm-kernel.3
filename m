Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6ACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 20:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZhYXroNL93BmY8U8wCRELS3jGajq5aeu0CEhns52as=; b=Vj2o7GTJunwG/1p//+Tv1qy+JA
	XwzTy1SJD532UL98aS5ltRpaIktlEzPD8kmOQVUApVfw1N1q66AoUANeZx7Awt2SZuSr3vMz4JNIC
	43gWe/IgFoO9PGgc7wrnV6ONxpx4eXdfIfgJn/Xqbf+Y+7fgfP0XBwK3FXoTrtEoZ+VOP+c8F5HBJ
	nMFZxEWNkCnuUrkp7AhQcAl+hFckp7dDu2zuv6YolUalnUI0egRwGxeqt26OHsCe79sfzbyTeIVFN
	vfbALtiv3kyJgQaWRHHvEGVPl3sYnThsUfATeimwi+KY5tUnnLkXK2kgnRR/gtimaL8sCxrZkyKTE
	JgSSkqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMtJt-00000000HpN-2y2U;
	Tue, 12 May 2026 20:03:09 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMtJq-00000000Hoj-0E1S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 20:03:08 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d1872504cbso5452215a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 13:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778616184; x=1779220984; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZhYXroNL93BmY8U8wCRELS3jGajq5aeu0CEhns52as=;
        b=zoqFgAtyI0MA77VEQdYJ8gRMWX+niErV6Pc9nUnqeRA9vkwcu/feJP12zBn/8KXyVs
         MQwjAOmJimxNLu3NaGe7geyZfbG/ywNtmS+cmxkgJ3mCl1sY25+CpUv6iTJZX9k7cj7/
         xNjXylYdZ0IPafdF8bIuCEmmU6NicIBApH7ak6pVpuV+uwObHiAXDmjPBDy19rjee+Vt
         hIBs/C2QASwrocRIaty+b1eUWEwnVWqNV4UV9/RemRtr1XRGx1UHd3Q3Fur+dz41WaxG
         1KzgNxAim8o46LLqLBJk3aQMxUJGUu5BVRi9ZCi23KrFZ6+fuqK2CTuezpTvj0vrm9zM
         qadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778616184; x=1779220984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZhYXroNL93BmY8U8wCRELS3jGajq5aeu0CEhns52as=;
        b=S4ktqFTc3Y0QanPMnbZ6yE8+1YW/4NG7tgNf7pM38jsMWfOxUNdiCQcwuUJv2JeHHD
         nESQBHSRIq8WgMiUTgzzjTkrEJiOHzttZev+AFhy9Zx2xazsiOXp/0tuwSmGRnK673/+
         gCcif7k6nTujlyhIWDbAtKmb8YwEdcGbM3kt1nguqwiu/SEaHqYHgAxE7nNHCQnkccB6
         mYiYnErto3nyposZ3AQLFQ9zGi7kb5E2ThI5AP6zjAFTi6Cu/47GQ2XDdT7v2xD5pAWL
         +pvoEGHENhbjaJ/TSKbZhuzF0Z3529ml+f+jaw+c7NUXxjT6sKf8u0AL7mjr05q+iyv1
         hQcw==
X-Forwarded-Encrypted: i=1; AFNElJ/uYW2UcYzt0UpjzG25mbpvxfpcen1QbiSMYYIRy5O+1kmEBJhnca9olDZDSDl+IbT1uYEF1im4iqm9+SdVzSXC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5kPtf9AbSPfzMlFbA/bBwe/J+U9j4onZiwTOKndGkqdaYRwJi
	KiPpBR0WOpH2qtdoHOPezjLFtw6TaPXsiC3K0lN/iGzcT8+faaz+YjsKVhjoMzvUgXo=
X-Gm-Gg: Acq92OEIERHCeAod+cvZ6hh+X+iM8ERu+UFY2TCWm96XB8iFhe8WsN7r4enD0DdfnbV
	oBRzpu/Y+zQl1WGNBEYDrwSc5yM1gVGNQ3Qc3o7Gak8q7meusmS7QxwqTUgvkLElT9/xBu+dk6V
	cnhe9nqCjH2iYE5FNWi0WzQucwCfi2DM0Gxs08WgQoaRL1Vywl6xi/aaR4ljM81LXaugjWLYr3E
	1uzcJyP09Nw+MAiR3JtPaD/6eSoobEioy83P37zFc9QRtqZF5kEaoEVCOuSVuUmhbFUKgojWj0b
	9xXlqsWIUCaqZ1vwSyIpF70G9mZe7sKlWyx79AjlEY7J00vvMEh3y9MjT7X2cv72D7T0ckUjNmS
	bHN4TtHb9fOykSSNB2OurV9omIGG7tRppAAZwowUUX2HBh0IY64CW8K+j/sROJysOtwrAFnBaYg
	F2E3O+E5mmsZwFuK2vPAOABxz0FUvySV7gPXVUZhW3r3BvNG3f3hwWVSENVmxWpCZwJrarbFYps
	A==
X-Received: by 2002:a05:6830:350a:b0:7dc:e78b:158 with SMTP id 46e09a7af769-7e3d87a6729mr310526a34.4.1778616183074;
        Tue, 12 May 2026 13:03:03 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:baa4:f7fb:528a:2457? ([2600:8803:e7e4:500:baa4:f7fb:528a:2457])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367df2fc5sm9557334a34.25.2026.05.12.13.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 13:03:02 -0700 (PDT)
Message-ID: <5a02550a-a578-4c0b-a8b0-2056f0248478@baylibre.com>
Date: Tue, 12 May 2026 15:03:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings to
 YAML schema
To: Rob Herring <robh@kernel.org>, Pramod Maurya <pramod.nexgen@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
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
 <CAL_JsqKP-C-rA6_19vtMzevVxQiD7bH=k5ObEZZDM3-Zmr_vtg@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAL_JsqKP-C-rA6_19vtMzevVxQiD7bH=k5ObEZZDM3-Zmr_vtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_130306_350165_9E1298C8 
X-CRM114-Status: GOOD (  24.73  )
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

On 5/12/26 2:42 PM, Rob Herring wrote:
> On Tue, May 12, 2026 at 8:58 AM David Lechner <dlechner@baylibre.com> wrote:
>>
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
>>>>>>   - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
>>>>>>   - xlnx,axi-xadc-1.00.a  (AXI softmacro)
>>>>>>   - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizard)
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
> I'm absolutely not suggesting changing the node name.
> 
> The common schemas globally disallow commas in nodenames. We can relax
> that and allow commas in any nodename. That check is largely from
> QCom's amazingly consistent use of 'qcom' prefix in nodenames. We've
> finally beat that practice out of them. So maybe it's not needed
> anymore.
> 
> The other approach is to exclude this nodename and any other we have
> to keep. I don't like dtschema having to know about some random name,
> but we already have that in a few cases and I don't expect that list
> to be too long given this is the first case we've seen.
> 
> Rob

Got it. So when I said "fix the bot" earlier, I should have said
"fix dtschema". We went through this before with adi,channels, but
I didn't remember exactly what you did.

I created a pull request for dt-schema [1] for this since it was
easier than trying to explain it for someone else to do.

[1]: https://github.com/devicetree-org/dt-schema/pull/195




