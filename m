Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C280B1090234
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hhn8rezeXE36o+RcqUQPfPx7XQWWc9UoTEjHiRuHEc=; b=VOcn8bevt316T5cms1OJAdEced
	h136EyKT2mH6cd16WreaZ6UrLREARsd4KRSgERY+XsmryF75/EoT50hmHUU0Mm2nk1GaQiE9A/HZz
	kxTMYUN2XKTQLiLm2xKT3jxwx5nsDCrtkypI6HBtMVN2QTG9wvocAsHTjWiEhhaKjBigoY0U3CcG4
	Z/VsUSJkKf0iaYsarU+jXXFIyr+AkSIPcFN3XZ5AIz3ovR8hVEyS5u1K3VmOJAW24FVsxsvctIgFZ
	BM0mV0EfEY9n68eIdQAksp0L0SYJM3oLGTct/V6oYq2CfiCZbRiMBa2tPmaPNFZu0hDM2fvNEkyUl
	y+vo5yvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EB2-0000000AlVr-1Pln;
	Thu, 19 Mar 2026 14:16:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EAz-0000000AlVW-14ex
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:16:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD07E1A25;
	Thu, 19 Mar 2026 07:16:31 -0700 (PDT)
Received: from [192.168.178.23] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A5133F7BD;
	Thu, 19 Mar 2026 07:16:35 -0700 (PDT)
Message-ID: <dd275884-665b-46ca-a72a-c32aa189fc25@arm.com>
Date: Thu, 19 Mar 2026 15:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: wens@kernel.org, Linus Walleij <linusw@kernel.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
 <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
 <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_071641_339628_7296F66A 
X-CRM114-Status: GOOD (  19.09  )
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

Hi,

On 3/19/26 15:06, Chen-Yu Tsai wrote:
> On Thu, Mar 19, 2026 at 9:46 PM Linus Walleij <linusw@kernel.org> wrote:
>>
>> On Sat, Mar 14, 2026 at 9:10 AM Michal Piekos
>> <michal.piekos@mmpsystems.pl> wrote:
>>
>>> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>>>
>>> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
>>> is in unitialized state.
>>>
>>> Solution is to set pinmux to GPIO INPUT in
>>> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
>>> earlier.
>>>
>>> Tested on Orange Pi Zero 3.
>>>
>>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>>> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
>>
>> Should this have a Fixes: tag and should it be applied as an urgent fix?
> 
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
> 
>> Tag for stable?
> 
> The original patch wasn't tagged for stable. And it doesn't seem like it
> was auto picked.
> 
>> Also: is there consensus with Andre that this is the way to proceed?
> 
> As Andre mentioned, the mux value for "disabled" is different between
> generations. So we likely need to make the value part of
> |struct sunxi_pinctrl_desc|.

There is already the SUNXI_PINCTRL_NEW_REG_LAYOUT flag, which describes 
exactly that: the new layout increased the bit field to 4 bits, moving 
the HiZ value to 0xf.
But it's just a flag passed to sunxi_pinctrl_init_with_flags(), not 
stored in desc, and not available during runtime. Which is what I tried 
to fix for my A733 series:
https://lore.kernel.org/linux-arm-kernel/20250821004232.8134-3-andre.przywara@arm.com/

So maybe we can cherry-pick just this patch, then check for that flag?

Cheers,
Andre

> 
> Michal, can you respin a version so that we can get this fixed in the
> same release?
> 
> 
> ChenYu
> 


