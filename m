Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E63CC54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e25eRHyPaGpfrunghh9CMaB2BGvg6mju2YC6suLb9dg=; b=X4/4EH7zIF0MG7IiJFGGOlFcfQ
	MXThtMBmkIOIL3YaZJdp2/Lg1LfMPlxP4x+Za6N176gFXtFdf2ICVZgYVxmtvWL8XsxbxmYlk29As
	aJ2bd/ubRI7F7Q1Ebpoj5t6S/nAjXlV7pVdcl6Q1BI7suriJaSaTLD78M2dYnpAhYI93bBOqZw/5A
	B3B6ApXNisHVJjOrGMsUrAhZqgLFIHYPYABxOjXnJGKR0xezVX7cC9RryjMefim7RvjBSBq4Z59kc
	cdlRPG/2/gTVMMg3cb2z0tpadARvmML729nd28zSR8Uxr+gekV5RFqLsfA6NsEYn1vxRr2OpOoLs7
	slgvpqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodBd-00000004iNS-28xn;
	Tue, 28 Jul 2026 08:29:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodBa-00000004iMT-37EO;
	Tue, 28 Jul 2026 08:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785227352;
	bh=f6ahL+mDCp4GOtiCvt/A5VrHg763alI3Zyu7EZLrDO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jbgG64dtvkMpnQhap0BIoWtTEWNeR6xJXF1mYIpzsC8tvlHd6lAqK2F0rI7SxHnnZ
	 Qya/631YjBP3P/jh4uFND0KOMDIzYPeuYaNYYGIUcQiw0CedLdlwsgNf7yOtBo97FG
	 o2I6RMiBEOpQJDNXbB1lRm6X8OJUE/xVUJ7Nyz3YmYNyMgQvxCDPIZmJORBjZqkapO
	 pSXM4hMofpAz1Nk3EoAv7hV88XAFHEsDMEhimQ0PH6Otbts07LuQu7XbX6VotcEo/1
	 d9sYooEpijM/oItOAOqmO/eKCPJWPwgmjz/SNMfH1UL3DJwjd5RMhQYK8wSEmWjcJa
	 7KBGKahI8RCqA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1858017E063E;
	Tue, 28 Jul 2026 10:29:12 +0200 (CEST)
Message-ID: <9ae852e3-97bb-48bb-ba6f-bf2ab9ae8dd6@collabora.com>
Date: Tue, 28 Jul 2026 10:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
 <CAPx+jO-1_ZpYcnPtoYxRn5vv34tiP7TXnjKZ3SaWkEzdeTfXpA@mail.gmail.com>
 <3130633c-fbff-4b1a-a127-bd4eb678c3f6@collabora.com>
 <CAPx+jO9-b_XyhS_CtX1ZFiH96WMYjjcvOEcO6u6CLEZq61rpaw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPx+jO9-b_XyhS_CtX1ZFiH96WMYjjcvOEcO6u6CLEZq61rpaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_012914_966688_FFEE312E 
X-CRM114-Status: GOOD (  37.08  )
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

On 7/27/26 18:48, Ulf Hansson wrote:
> On Mon, Jul 27, 2026 at 1:04 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> On 7/24/26 17:01, Ulf Hansson wrote:
>>> On Wed, Jul 22, 2026 at 3:28 PM Dmitry Osipenko
>>> <dmitry.osipenko@collabora.com> wrote:
>>>>
>>>> Depending on firmware, part of the MFG domains may be left ON at boot
>>>> leaving only some MFG cores powered, to let the ACP to prefetch the GPU
>>>> region when the display controller is brought up. This doesn't play well
>>>> with an eventual delay in probing Panfrost when the display controller is
>>>> fully set up, as that would make genpd's sync_state() to power off the
>>>> domain while ACP tries to prefetch: this is causing an AXI stall,
>>>> effectively freezing the AP indefinitely. In order to prevent this from
>>>
>>> I haven't made any detailed investigation, but to me, it sounds like
>>> there is a missing consumer somewhere.
>>>
>>> Should the ACP/panfrost devices be a consumer of the MFG domains as
>>> well? Or perhaps, if the ACP/panfrost should rely on the display
>>> controller to be probed and powered-on, to be able to probe?
>>>
>>
>> This is about how the bootloader is leaving the display controller, the ACP,
>> and the MFG registers before booting the kernel.
> 
> Right.
> 
>>
>> The kernel drivers themselves will reset this weird state when the HW gets
>> to full probe so there won't be any more issue(s) from that point onwards.
>>
>> Actually, there would be A LOT to say about this, but I'll be very brief...
>>
>> Basically, before booting the kernel, the bootloader is leaving a half-assed
>> setup to potentially support continuous splash functionality, but without it
>> being actually used on the device(s) that we're talking about here...
> 
> So does that mean that the print in scpsys_add_one_domain() ("A
> default off power domain has been ON") gets printed for these PM
> domains?
> 

Yeah...

> If so, perhaps it would be better to turn off the PM domains (if
> possible) before registering them with genpd?
> 

Eh, that's not possible :-(

Doing that would bring us back to square 1. The SoC will lockup.... ACP is still
trying to constantly prefetch, and the issue here is going totally unpowered, as
explained in the commit description - because that's the HW condition that causes
the stall eventually.

To make things "funnier" (in this case) for everyone, the ACP is always-on, of
course, so there's no cleaner way around it.

>>
>> Again, I should put a remark on every word of that last paragraph, but this
>> is the gist of it.
>>
>> If you're curious or need more information, of course I can expand a bit,
>> there's no secret involved here, it's just that I'm avoiding to write a wall
>> of text around that...
>>
>> P.S.: We've been discussing that internally and chasing this issue for months
>> before deciding to "solve" it like this.
> 
> Huh, I see, thanks for sharing.
> 
> I think it would be nice to clarify a little bit more in the commit
> message, as it all kind of indicates to me that there is a missing
> consumer or that a parent needs to be runtime resumed before a child
> is probed.
> 

Eh for both me and Dmitry the commit message looked clear, but yeah, it's surely
just because we bashed our heads over this issue, and our knowledge makes things
look obvious when they are definitely *not*, as you just pointed out - so thanks
for that!

So yeah, Dmitry, if you can please send a v2 with some more clarification in the
commit message (practically, add the information that I shared in this topic),
that would be awesome.

> Or another way of looking at it, that perhaps makes better sense.
> Based on your latest information, it seems like the PM domain isn't
> really fully powered-on by the bootloader, but still we are telling
> genpd that it is, leading to an inconsistent state and errors.
> 

Yeah, the bootloader is doing random things, leaving the PDs only partially powered
ON (just the SRAM, which is half of the MFG_ASYNC setup, and 2D accelerator, but
not the rest, which makes little sense because there's another parent in the middle
that is not powered at all...) and that's why this issue is experienced.

I think this is really just a bootloader bug in this case, so if we lived in a
parallel universe where the MediaTek kernel drivers supported continuous splash on
upstream... I'm mostly sure that this issue would still be there, and that this SoC
would still randomly and spectacularly freeze without this commit.

Cheers,
Angelo


> [...]
> 
> Kind regards
> Uffe

