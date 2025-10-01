Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58000CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 20:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lg6fCLmy2w9+WR+K0ohol53Fdm9e/jawsYloYw3+SzY=; b=KCl8orpAiLbWYikknwhD8A0XxG
	fWPOxPyPGhOAn1nzaQvj7IrqWSkHJPMqregC5b56A1cVrNYjE3bB4GPhgKWl1JYWj/pvTXcZ+/Gko
	qh45UFn1sbkrhVf74fcinamh2LthDo9s8WoRgrqVAgUxzxttm3WWnBPLmn656kfXIlx4eApXwk8+M
	YuoQOzCaSvgQGUWn5gosxEBE++P2KvjPUpAUgc7KtRhKhH0/MscolomxXlZoAUGk6q/xVZDZZwJMj
	Rw1jZSfvHOHhVyy899VhfSuPz8C0EQgkSkf6D8AoMWHpMCBKHP4UOTCB7qZmtMdq261rK8r3z/GMj
	H/7kC9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43nC-00000008wU9-3NSE;
	Wed, 01 Oct 2025 20:51:18 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43n9-00000008wTD-13UQ;
	Wed, 01 Oct 2025 20:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lg6fCLmy2w9+WR+K0ohol53Fdm9e/jawsYloYw3+SzY=; b=bL0rZR50CAwOg5alQBQEpOJ5DP
	fKCjgXaK7PlKlnBhKGZUnMjklwXY9RVNBinia5voFH1IkHyY76IeRuwDeJ+ptsv3CAiRNfTTIX/3P
	pMuIBjQTNThTfLE65e/wJ2as8JZJVO+sB7tFRjDwcYHf9Tg6LNbmSZMFiWx2hm8MKZzilV205M+ht
	PwsQrSFOYZO8PPVnElprso+7Im+3V2JJKfUfdiB/kAGMC8c5cQdhum+Eq7ZTW2AWRyHR1B9eKWFIP
	E5reOL1qNPP1UgiTFxdEAKIfuv7dF5gUwSFTEr19iJoRMXOcp8li86e8uhxGVn6c9AF4BmZ1+bumh
	Qoo4cZ7g==;
Received: from [189.6.17.207] (helo=[192.168.174.20])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1v43mc-0031l8-Ne; Wed, 01 Oct 2025 22:50:43 +0200
Message-ID: <ca9605fc-79da-43c1-9146-3638cd5791c4@igalia.com>
Date: Wed, 1 Oct 2025 17:50:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Stefan Wahren <wahrenst@gmx.net>,
 Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
 <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
 <CGME20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3@eucas1p2.samsung.com>
 <727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com>
 <2b1537c1-93e4-4c6c-8554-a2d877759201@gmx.net>
 <1e5d1625-1326-4565-8407-71a58a91d230@samsung.com>
 <c40880aa-ce14-41bc-a32f-7f46506a8909@gmx.net>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <c40880aa-ce14-41bc-a32f-7f46506a8909@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_135115_286501_E9834D4E 
X-CRM114-Status: GOOD (  28.87  )
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



On 26/09/2025 07:36, Stefan Wahren wrote:
> Hi Marek,
>
> Am 26.09.25 um 09:27 schrieb Marek Szyprowski:
>> On 25.09.2025 18:48, Stefan Wahren wrote:
>>> Am 25.09.25 um 09:57 schrieb Marek Szyprowski:
>>>> On 31.07.2025 23:06, Maíra Canal wrote:
>>>>> Currently, when we prepare or unprepare RPi's clocks, we don't 
>>>>> actually
>>>>> enable/disable the firmware clock. This means that
>>>>> `clk_disable_unprepare()` doesn't actually change the clock state at
>>>>> all, nor does it lowers the clock rate.
>>>>>
>>>>> >From the Mailbox Property Interface documentation [1], we can see 
>>>>> that
>>>>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>>>>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>>>>> prepare and an unprepare hook for RPi's firmware clock.
>>>>>
>>>>> As now the clocks are actually turned off, some of them are now 
>>>>> marked
>>>>> CLK_IS_CRITICAL, as those are required to be on during the whole 
>>>>> system
>>>>> operation.
>>>>>
>>>>> Link:https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface 
>>>>>
>>>>> [1]
>>>>> Signed-off-by: Maíra Canal<mcanal@igalia.com>
>>>>>
>>>>> ---
>>>>>
>>>>> About the pixel clock: currently, if we actually disable the pixel
>>>>> clock during a hotplug, the system will crash. This happens in the
>>>>> RPi 4.
>>>>>
>>>>> The crash happens after we disabled the CRTC (thus, the pixel clock),
>>>>> but before the end of atomic commit tail. As vc4's pixel valve 
>>>>> doesn't
>>>>> directly hold a reference to its clock – we use the HDMI encoder to
>>>>> manage the pixel clock – I believe we might be disabling the clock
>>>>> before we should.
>>>>>
>>>>> After this investigation, I decided to keep things as they current 
>>>>> are:
>>>>> the pixel clock is never disabled, as fixing it would go out of
>>>>> the scope of this series.
>>>>> ---
>>>>>     drivers/clk/bcm/clk-raspberrypi.c | 56
>>>>> ++++++++++++++++++++++++++++++++++++++-
>>>>>     1 file changed, 55 insertions(+), 1 deletion(-)
>>>> This patch landed recently in linux-next as commit 919d6924ae9b ("clk:
>>>> bcm: rpi: Turn firmware clock on/off when preparing/unpreparing"). 
>>>> In my
>>>> tests I found that it breaks booting of RaspberryPi3B+ board in ARM
>>>> 32bit mode. Surprisingly the same board in ARM 64bit mode correctly
>>>> boots a kernel compiled from the same source. The RPi3B+ board freezes
>>>> after loading the DRM modules (kernel compiled from
>>>> arm/multi_v7_defconfig):
>>> thanks for spotting and bisecting this. Sorry, I only reviewed the
>>> changes and didn't had the time to test any affected board.
>>>
>>> I was able to reproduce this issue and the following workaround avoid
>>> the hang in my case:
>>>
>>> diff --git a/drivers/clk/bcm/clk-raspberrypi.c
>>> b/drivers/clk/bcm/clk-raspberrypi.c
>>> index 1a9162f0ae31..94fd4f6e2837 100644
>>> --- a/drivers/clk/bcm/clk-raspberrypi.c
>>> +++ b/drivers/clk/bcm/clk-raspberrypi.c
>>> @@ -137,6 +137,7 @@ 
>>> raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>>          [RPI_FIRMWARE_V3D_CLK_ID] = {
>>>                  .export = true,
>>>                  .maximize = true,
>>> +               .flags = CLK_IS_CRITICAL,
>>>          },
>>>          [RPI_FIRMWARE_PIXEL_CLK_ID] = {
>>>                  .export = true,
>>>
>> Right, this fixes (frankly speaking 'hides') the issue. Feel free to 
>> add:
>>
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
> AFAIK the offending clock change isn't in the downstream kernel, so I 
> like to see the opinion of María and the Raspberry Pi people first.

Hi,

I see in the downstream kernel the CLOCK_V3D was removed in favor of 
firmware clock:
https://github.com/raspberrypi/linux/blob/rpi-6.12.y/drivers/clk/bcm/clk-bcm2835.c#L2076

Also, v3d in RPi4 is set to use the firmware clock:
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi#L97

I think v3d clock is missed on boot, but I also think the issue should 
be solved by setting the v3d firmware clock for Pi3.
WDYT? Can you check it on your side? Something like:

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi 
b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
index 8b3c21d9f333..3289cb5dfa8e 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
@@ -14,6 +14,7 @@ &hdmi {
  };

  &v3d {
+       clocks = <&firmware_clocks 5>;
         power-domains = <&power RPI_POWER_DOMAIN_V3D>;
  };

Best regards,

Melissa

>
> Currently I know that in the error case the following clocks are 
> disabled during boot of Raspberry Pi 3B+:
> fw-clk-vec
> fw-clk-isp
> fw-clk-v3d
>
> So it's very likely that the vc4 drivers tries to access the register 
> after the these clocks has been disabled and then the system freeze. 
> The workaround above was just a wild guess, so currently I don't know 
> why this change avoid the freeze.
>
> Best regards


