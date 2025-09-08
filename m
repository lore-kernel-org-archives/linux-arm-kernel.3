Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40136CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfMVf6nBBryTF7E6UcdgModrpBMwN13bx9ZSeOrOTno=; b=1GCmhXKrs7KDYK7qMr9S7T+QnN
	u6kpMDt+qk9f3T4TUpxHNXMJ2oYUez2T7lGPFrUgZql9z9NuOc3Knr7y0Js2gH5DJuAJh1Va5rv76
	FugZNmTngN2JuTelNFGGVGMrI60zF/lZgZUbsGzCYleeq4ZvVjjS1b6WwlwQm2+lnC0EQcDK/6rWS
	g14enXnouTPq9MCn5fc4+wH8hs2VwrzpxyJLWPlNBtXrafKky0YIpQ5VetfcLh7qabtnb2Aaylo6J
	1pmZl+/0d9HcOSN4Xc8SBRXT+lUqT7NggC0eDRbrD9U1ocB0nv0pB6L532ijW5jivDJIb8umic+jT
	TQFkXpHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfNP-000000013Kw-1ktr;
	Mon, 08 Sep 2025 17:09:59 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbaB-0000000HG15-2V9M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:06:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb7322da8so840569066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757336814; x=1757941614; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfMVf6nBBryTF7E6UcdgModrpBMwN13bx9ZSeOrOTno=;
        b=AYjB22I0edwLDu2jvR3nb+VV7ftqnkjX9hXVAzh7DGdRfNOq2057blSaMNZ7v+kVSa
         1YBheV7xjD0/2z9OXaAYf52B8eU/tSbqEpgCjaYSiZWA3V5+Fvr8SPfAwkx+LdS6GgGv
         wmy2dUpkM54OsnC7DljN2CPl5Jqx7CR82RWUOqSJOue7ckBVdw8ypqkyRel5yBJz8vIq
         UFnnkBNBBGd7WTIBxt4UIUx3HEK1yQSeuGnL+iaMuugGFsazh72e8R4C/f9Es4j26+DK
         qXfWiU2WpwckJdxkhotf7ZWsKPpxpIeaBWx8hb/GSntGuJtNFwFqJn0oHjJ9n4QF1XwO
         fZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336814; x=1757941614;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfMVf6nBBryTF7E6UcdgModrpBMwN13bx9ZSeOrOTno=;
        b=ljBJjvcrkJS/mrL5UH7NzzIq4WY62qo4Oxgjc5Jv2m8G+CI5d9NDSknP/ive5NHRvv
         D7Z9IG0jdgXIHpfFDJIwwtgy7GSYfCQrElcftq+83FMSKVOmQmr5mVJ/P4bSBUXcxGF5
         JS7c0CxmElrXAkMqXXBAnjnFMfpfLxLGod4W8PJIZO4ygSC2TRnQTfLI5KnSkkLQJUE3
         28jVrvooqPp9UxSyY4FvJYrMmvr/2OBOD8GHDxOdhYQ48yiECeFF6p3LG0qUgSPeBY3n
         Mp3KKfC5fJG8VVpppBpCDYiceBhoDkff/SnzcLkMbBMeqXFx6RPavJaUqxggEyFVGBoo
         IkZg==
X-Forwarded-Encrypted: i=1; AJvYcCUY43AOI+VCkO+sHacgeW4r24U1y56ABBxU3ywpspQaa3erTWifBDA372p+6zjMv6aRDFDDBOBLBkpIC4KEd83p@lists.infradead.org
X-Gm-Message-State: AOJu0YwI9d9jo71q8CHROOkgIi+sq251iFIstUfx/Pv2X6wFu1da1klm
	1/eHmvbFS0UxYXpJiqhj5D2z2a6v/iAVMFbLLxkXwWHVKYuc1qKHDBQdxPyfQBDmwaQ=
X-Gm-Gg: ASbGncsgulbI6SpRAd2FTF/ttTNSU2ckuxNlBRiTwEC5bUhy6ctH80BoJeZ8YNf6/H6
	fNAgSqsXnEywIu91fLHZ+qWj0SKt4IP1bsiS+oGbn9+fcCiobIVb52gtQrZzVS09kdR14oOUZ/k
	9N8YQ85rXhCC+9rAHBB7Hnr6srpAf+wEiAuNYYeFS4tt2Z4RblbVbG3mXtNSWx00B2uM6kW3t4Z
	ZIZjchl683OHXT9Mz+zw7rnoJkDFH5/1n+1s9v+MxHJpH1BWhUWrtYYrzK3ikkGEzhw7kg2ayVV
	WGTwCiltKDyO97RNYeuFdubaYcFDK5BjIpFSptDfSTKkT3EJW3NokZ2hvpbna8MCEf63x49vVaN
	C9UD6b0ZNHCWMAHm57VUG19+Z7Rq5nvg/gnCzDWpbRo3R0udgdvF/
X-Google-Smtp-Source: AGHT+IHNtIRcKMzfVe31q41uVJvIJUKXuFurzwJj/AutDBZPs44uojZLouOewThTolpsDraRQmap2Q==
X-Received: by 2002:a17:907:2d0c:b0:b04:a780:4673 with SMTP id a640c23a62f3a-b04b1663c1cmr806523566b.31.1757336813148;
        Mon, 08 Sep 2025 06:06:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0438102debsm1795871566b.66.2025.09.08.06.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:06:52 -0700 (PDT)
Message-ID: <742cf1ae-1723-4cf5-8931-afd35699cc95@tuxon.dev>
Date: Mon, 8 Sep 2025 16:06:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Manivannan Sadhasivam <mani@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-6-claudiu.beznea.uj@bp.renesas.com>
 <ddxayjj5wcuuish4kvyluzrujkes5seo7zlusmomyjfjcgzcyj@xe3zzzmy2zaj>
 <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev>
 <zsgncwvhykw4ja3bbqaxwupppjsqq4pcrdgrsduahokmt72xsm@twekpse6uzzh>
 <CAMuHMdUu0uXBJndcwWoZp8NNyBJox5dZw4aoB8Ex50vBDDtP7g@mail.gmail.com>
 <6f2hpdkonomgrfzqoupcex2rpqtlhql4lmsqm7hqk25qakp7ax@bfrzflghmnev>
 <CAMuHMdUEqKc+qtRXiPzgjhWaer5KLroZ+hCSVLCQ497h3BtOAw@mail.gmail.com>
 <vdn4lomtgr6htab7uodgm75iphju6yyimhlnfonysxxdpudib7@qm4yettsvsrs>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <vdn4lomtgr6htab7uodgm75iphju6yyimhlnfonysxxdpudib7@qm4yettsvsrs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_060655_641600_E9CCF913 
X-CRM114-Status: GOOD (  34.04  )
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

Hi, Manivannan,

On 9/1/25 18:54, Manivannan Sadhasivam wrote:
> On Mon, Sep 01, 2025 at 04:22:16PM GMT, Geert Uytterhoeven wrote:
>> Hi Mani,
>>
>> On Mon, 1 Sept 2025 at 16:04, Manivannan Sadhasivam <mani@kernel.org> wrote:
>>> On Mon, Sep 01, 2025 at 11:25:30AM GMT, Geert Uytterhoeven wrote:
>>>> On Sun, 31 Aug 2025 at 06:07, Manivannan Sadhasivam <mani@kernel.org> wrote:
>>>>> On Sat, Aug 30, 2025 at 02:22:45PM GMT, Claudiu Beznea wrote:
>>>>>> On 30.08.2025 09:59, Manivannan Sadhasivam wrote:
>>>>>>> On Fri, Jul 04, 2025 at 07:14:05PM GMT, Claudiu wrote:
>>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>>
>>>>>>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>>>>>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>>>>>>> only as a root complex, with a single-lane (x1) configuration. The
>>>>>>>> controller includes Type 1 configuration registers, as well as IP
>>>>>>>> specific registers (called AXI registers) required for various adjustments.
>>>>>>>>
>>>>>>>> Hardware manual can be downloaded from the address in the "Link" section.
>>>>>>>> The following steps should be followed to access the manual:
>>>>>>>> 1/ Click the "User Manual" button
>>>>>>>> 2/ Click "Confirm"; this will start downloading an archive
>>>>>>>> 3/ Open the downloaded archive
>>>>>>>> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
>>>>>>>> 5/ Open the file r01uh1014ej*-rzg3s.pdf
>>>>>>>>
>>>>>>>> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
>>>>>>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>>>>>> +  ret = pm_runtime_resume_and_get(dev);
>>>>>>>> +  if (ret)
>>>>>>>> +          return ret;
>>>>>>>> +
>>>>>>>
>>>>>>> Do you really need to do resume_and_get()? If not, you should do:
>>>>>>
>>>>>> It it's needed to enable the clock PM domain the device is part of.
>>>>>>
>>>>>
>>>>> I've replied below.
>>>>>
>>>>>>>
>>>>>>>     pm_runtime_set_active()
>>>>>>>     pm_runtime_no_callbacks()
>>>>>>>     devm_pm_runtime_enable()
>>>>
>>>>>>>> +static int rzg3s_pcie_suspend_noirq(struct device *dev)
>>>>>>>> +{
>>>>>>>> +  struct rzg3s_pcie_host *host = dev_get_drvdata(dev);
>>>>>>>> +  const struct rzg3s_pcie_soc_data *data = host->data;
>>>>>>>> +  struct regmap *sysc = host->sysc;
>>>>>>>> +  int ret;
>>>>>>>> +
>>>>>>>> +  ret = pm_runtime_put_sync(dev);
>>>>>>>> +  if (ret)
>>>>>>>> +          return ret;
>>>>>>>
>>>>>>> Since there are no runtime callbacks present, managing runtime PM in the driver
>>>>>>> makes no sense.
>>>>>>
>>>>>> The PCIe device is part of a clock power domain. Dropping
>>>>>> pm_runtime_enable()/pm_runtime_put_sync() in this driver will lead to this
>>>>>> IP failing to work as its clocks will not be enabled/disabled. If you don't
>>>>>> like the pm_runtime_* approach that could be replaced with:
>>>>>>
>>>>>> devm_clk_get_enabled() in probe and clk_disable()/clk_enable() on
>>>>>> suspend/resume. W/o clocks the IP can't work.
>>>>>
>>>>> Yes, you should explicitly handle clocks in the driver. Runtime PM makes sense
>>>>> if you have a power domain attached to the IP, which you also do as I see now.
>>>>> So to conclude, you should enable/disable the clocks explicitly for managing
>>>>> clocks and use runtime PM APIs for managing the power domain associated with
>>>>> clock controller.
>>>>
>>>> Why? For the past decade, we've been trying to get rid of explicit
>>>> module clock handling for all devices that are always part of a
>>>> clock domain.
>>>>
>>>> The Linux PM Domain abstraction is meant for both power and clock
>>>> domains.  This is especially useful when a device is present on multiple
>>>> SoCs, on some also part of a power domain,  and the number of module
>>>> clocks that needs to be enabled for it to function is not the same on
>>>> all SoCs.  In such cases, the PM Domain abstraction takes care of many
>>>> of the integration-specific differences.
>>>
>>> Hmm, my understanding was that we need to explicitly handle clocks from the
>>> consumer drivers. But that maybe because, the client drivers I've dealt with
>>> requires configuring the clocks (like setting the rate, re-parenting etc...) on
>>> their own. But if there is no such requirement, then I guess it is OK to rely on
>>> the PM core and clock controller drivers.
>>
>> When you need to know the actual clock rate, or change it, you
>> indeed have to handle the clock explicitly.  But it still may be enabled
>> automatically through the clock domain.
>>
> 
> Yeah!
> 
>>>>> But please add a comment above pm_runtime_resume_and_get() to make it clear as
>>>>> most of the controller drivers are calling it for no reason.
>>>>
>>>> Note that any child device that uses Runtime PM depends on all
>>>> its parents in the hierarchy to call pm_runtime_enable() and
>>>> pm_runtime_resume_and_get().
>>>
>>> Two things to note from your statement:
>>>
>>> 1. 'child device that uses runtime PM' - Not all child drivers are doing
>>> runtime PM on their own. So there is no need to do pm_runtime_resume_and_get()
>>> unless they depend on the parent for resource enablement as below.
>>
>> It indeed depends on the child device, and on the bus.  For e.g. an
>> Ethernet controller connected to a simple SoC expansion bus, the bus must
>> be powered and clock, which is what "simple-pm-bus" takes care of
>> ("simple-bus" does not).
>>
> 
> Right. But most of the PCI controller drivers call pm_runtime_resume_and_get()
> for no good reasons. They might have just copied the code from a driver that did
> it on purpose. So I tend to scrutinize these calls whenever they get added for a
> driver.

To be sure I will prepare the next version with something that was
requested: are you OK with keeping pm_runtime_resume_and_get() and add a
comment for it?

Thank you,
Claudiu


