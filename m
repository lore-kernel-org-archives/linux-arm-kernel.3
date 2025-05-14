Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141CDC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4mPx04d8ciBVCzc7o5kQLaD0nCzpxnBqCMUyERgNAs=; b=EJci2yY775CvF1IpHnH1QBqlGo
	hsdg84orkIWdZSqTOIV9yheSF8Wxu3IIUbujt8En7VflMr+aOzc5ZZAuQzFkEgTV8+f9mJIdZqY1x
	oxhRr0p1JR7xXdAdc4ox2z6vtpD49/Mj+W4Q+xnEPnqXc2l4mAdhidjI47U22nwl4OzTwNO0GkFnQ
	FRoIFGpppJRMxuYwDcqB/4/F/l1Zv8KvA12gtU0606BsxUAQ/F6gOgoChqwCSlKEgpH/GIwSje4Za
	nznamyBu1cqwVe70ia4rXOGcxcDJD8uNfYTRMPfl0OmeEsNwSZFxieVDz0mGSPiD0C/XwANAISKcF
	VEog/9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4T-0000000F1On-2iZa;
	Wed, 14 May 2025 12:18:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8YE-0000000EgrJ-0sLl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:37:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso3059714f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747215440; x=1747820240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4mPx04d8ciBVCzc7o5kQLaD0nCzpxnBqCMUyERgNAs=;
        b=eYh1z00ABrMCMJs/tG0/gsDHtfELkfBh3m5IWLgnNDjkt+BvZFDTqaH9dX8ngnq+sa
         nzf+WxxopLzaXOOHzJ9xQ0PZdsc4xDK2FiGgFkY+xV/vsFXg/rHoComOxm8T9FYXadQZ
         UhSAPurcRFQSVHQgz4mArRQnBTMtJ/8lazmEhW2W68MTEKRCVRCeaQrkDgtJJH/P+FlN
         4fIdF4s7wr+wnqxICstlLlPiWbI7aExB7Xvdh744YvYYTYm+uO7PIJW6SwtgBYL029EX
         +GptEf7hjex7tlz/MTgTeSily5SWYNccCmkF9e3B4d3F0HgDck58LsxierPRwNHU+aB0
         Mtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747215440; x=1747820240;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4mPx04d8ciBVCzc7o5kQLaD0nCzpxnBqCMUyERgNAs=;
        b=DMCc95mTGzHjE0b9yJfeMBwdFjxDOYI0b6MQL+5RNnrvz34JD/gvgfjgbdZ2M18EYc
         6iWu9HE4q6iFJUYtO8I0kualMr9zfnQb3LgP9QGkHNEDWDRA93GebM8k6NmbYyS7ZjBw
         VLgtljNn9u/IxOAPA7B5isU/R/pkNLYvjw3O6b2UkSYgC8KU/wgteYtN0tNEaeHRLwHX
         hEMZv1HIL+yaYxUXazZllhRMNPLzGgMWnG5Ucu0dd5k6H95NnArzlXRX5/iIIxTXJjOR
         V+ARGVon6pWAieqP8Cauq+3JQxgneVlizdpUVCUQRtF92zBbJD7MLNBcWH0FiBy/dgGI
         CKPg==
X-Forwarded-Encrypted: i=1; AJvYcCXXbdP5qsW0hUubHAjfDw4It4ut8SIgixLXeDSOYtDWvWkEB1yZb8yX+MlzuoYPlzlBiEN0CV0L4RbIqx8GOKBE@lists.infradead.org
X-Gm-Message-State: AOJu0YzmLcltsk6CtGwpcuo5t/YBeNeH6aWzu0LLU9aPPWxr2iFYbQy6
	8zAneQdQmYlr4KKcPBMYZOVhc+xfgLz0xa8PP48IulRq6QUDZbr0irVH8uGowdE=
X-Gm-Gg: ASbGncv0+v/HB8mmxw1gow+vMXc6J083l3VNt5uf/Q8mQFcRPavGo1Az+OH6zLAQMzK
	BMuVvPsSBpeva8lAiBaMfQupMx0C+6T4FtFcUl1PTSjFzq3Rr2nE57Ox2KX7XV0iPLv84nHO69K
	bfHbW/sWoyLscgLiWfxp0yp8HplGFdGwG8kKA6IqC69qv+OpDGBgiYDxRg5VLEE1FHab5pEm4YC
	g7GmmFisxDEQNYRAekp0Be8N5AyRQjnQJMRGZc3LOajTBDIFpxp2xG/nQYFTPaubhGsMerPv/dz
	CqXhcIjD/10fBf8mEsRTMLFWDv/bw0k/+PCHq3HLngXJWC5aNZt5deMQIak=
X-Google-Smtp-Source: AGHT+IHnSc4wA94qOllSk7otA1xRX53jldMfyoziJ8FC+BVymjse5i0ZvJhyS6S2mppTOQu7gsAr1Q==
X-Received: by 2002:a05:6000:2586:b0:3a0:8291:20d0 with SMTP id ffacd0b85a97d-3a3496c20afmr2168258f8f.29.1747215440172;
        Wed, 14 May 2025 02:37:20 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebec4sm19438238f8f.36.2025.05.14.02.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 02:37:19 -0700 (PDT)
Message-ID: <84b88ab7-65f6-4c9a-a28b-620cc4d8d453@tuxon.dev>
Date: Wed, 14 May 2025 12:37:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, saravanak@google.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250512202550.GA1126561@bhelgaas>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250512202550.GA1126561@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023722_256091_DF536076 
X-CRM114-Status: GOOD (  30.49  )
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

Hi, Bjorn,

On 12.05.2025 23:25, Bjorn Helgaas wrote:
> On Mon, May 05, 2025 at 02:26:43PM +0300, Claudiu Beznea wrote:
>> On 01.05.2025 23:12, Bjorn Helgaas wrote:
>>> On Wed, Apr 30, 2025 at 01:32:33PM +0300, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>>> only as a root complex, with a single-lane (x1) configuration. The
>>>> controller includes Type 1 configuration registers, as well as IP
>>>> specific registers (called AXI registers) required for various adjustments.
>>>>
>>>> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
>>>> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
>>>> host driver can be reused for these variants with minimal adjustments.
>> ...
> 
>>>> +static void rzg3s_pcie_irqs_init(struct rzg3s_pcie_host *host)
>>>
>>> This and many of the following functions have names that don't
>>> correspond to anything in other drivers, which makes it harder to
>>> transfer knowledge between the drivers.  If you can find a pattern
>>> somewhere to follow, it will make it easier for others to read the
>>> driver.
>>
>> OK, I'll think about it. Do you have a recomentation?
> 
> Not really.  Maybe pick a driver with recent activity.
> 
>>>> +static int rzg3s_pcie_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct device *dev = &pdev->dev;
>>>> +	void *devres_group_id;
>>>> +	int ret;
>>>> +
>>>> +	devres_group_id = devres_open_group(dev, NULL, GFP_KERNEL);
>>>> +	if (!devres_group_id)
>>>> +		return -ENOMEM;
>>>
>>> What's the benefit of using devres_open_group()?  No other PCI
>>> controller drivers use it.
>>
>> This driver uses devm_add_action_or_reset() to keep the error path simpler.
>> Some of the action or reset registered handlers access the controller
>> registers. Because the driver is attached to the platform bus and the
>> dev_pm_domain_detach() is called right after driver remove [1] having devm
>> action or reset handlers accessing controller register will later lead to
>> hangs when the device_unbind_cleanup() -> devres_release_all() will be
>> called on remove path. Other issue described in [2] may arries when doing
>> continuous unbind/bind if the driver has runtime PM API (not case for this
>> driver at the moment) that access directly controller registers.
>>
>> This is because the dev_pm_domain_detach() drops the clocks from PM domain
>> and any subsequent pm_runtime_resume() (or similar function) call will lead
>> to no runtime resume of the device.
>>
>> There is a solution proposed to this here [2] but it slowly progresses.
>> Until this will be solved I chosed the appraoch of having the devres group
>> opened here. If you agree with it, I had the intention to drop this call if
>> there will be an accepted solution for it. If you are OK with going forward
>> like this, for the moment, would to prefer me to add a comment about the
>> reason the devres_open_group() is used here?
>>
>> This is not PCIe specific but platform bus specific. There are other
>> affected drivers on this side (e.g. rzg2l-adc [3], rzg3s-thermal [4]).
>>
>> A similar solution as [2] is already used by the i2c subsystem.
> 
> OK.  Is there something unique about rzg3s that means it needs
> devres_open_group(), while other PCI controller drivers do not?  Or
> should the other drivers be using it too?  Maybe they have similar
> latent defects that should be fixed.

Nothing particular for RZ/G3S. The issue is there for every drivers
attached to platform bus (at least the ones that have their clocks as part
of their PM domain as RZ/G3S is having) which are accessing IP registers
though devres cleanup APIs or are accessing IP registers in the runtime PM
APIs. This is because these accesses ends up to be done when the clocks
cannot be enabled anymore though runtime resume calls (detailed explanation
in [1]). This is the reason for which I am trying to impose it in the
platform bus driver, but the discussion is slowly progressing and not all
involved parties agrees with having the fix in the platform bus driver [1].

[1]
https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/

> 
> If there's something unique about rzg3s, please add a brief comment
> about what it is so we know why it needs devres_open_group().

In the initial version I've added a comment in the documentation of struct
rzg3s_pcie_host::devres_group_id. I'll update the place where this is call,
too.

Thank you for your review,
Claudiu

