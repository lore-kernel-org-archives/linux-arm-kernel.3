Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF86CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 07:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nUSSdMGjCPyedd7TdeRQen8rxiQXem7xcM3JbGA06U=; b=2JWrGk2gbOXZY9w3lkkKVmHNbN
	z96HEqv9Jh/4v4ySBd87wNAccor0NZAmeX55LfoT5Kok+f+5fPfBhTmAycHCmDEJJ9qt1tCetj5el
	oUTtmCbonusO6NVStPQmIsqo60+p60/rW98DFocjNOWopcbOvO0NnUegLpJ0cJf7EKPtH+cKn2bq8
	GF4bSSNNpAAL4zViASn4/h+qhLAhdzRXJKUkpG4Xaxcp6oVpQ99HfRIMnYeu6kSkYlCvhk5f9FeN9
	UWhOepvRfMnXVjU+dDxROZtofUEqRRofBKfNFLguprqfLlKgrS3ie/V+7sWxo6FxLvItHof0VAHqV
	T7GDnKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4DIG-00000009lNb-1v0X;
	Thu, 02 Oct 2025 07:00:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4DIF-00000009lNB-30Lg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Oct 2025 06:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4nUSSdMGjCPyedd7TdeRQen8rxiQXem7xcM3JbGA06U=; b=KpJLT52RHdvKhObcwKz6jJRp+h
	zmoAC9FcXdcRe9RFLOxoImJUgXkif5lNiHTFmXO5MMbg+axMk8qseO/hvSlxn03ESEqcdmeinF57u
	nvZDWUavaXN0kIQY2dPnJExRxpKDZz/NN/9+D6wsu5SifI3wfM/JIlZ5U8euH/btWZLYznmlykuv7
	wJCmpjq6ffmJepZAIo0H/bSEdKTFkhpGvPI17xaoVHEly2HW9tKzaGjZkVKNh6pGquV9Ldx3rML/M
	yHrLLVUsf17rmlPfrYHfXKWvgLjwJZMqjMUW62hid2ebuAYWV7cscwLZwcaI8gPWwVgGS1IkUrsO4
	63HwanTQ==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4DIB-0000000E78f-0BzZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 06:59:58 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251002065945euoutp029a7f5eb5f3ee0c4d514878697ea76fec~qmmpSZ1Nr1318813188euoutp021
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Oct 2025 06:59:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251002065945euoutp029a7f5eb5f3ee0c4d514878697ea76fec~qmmpSZ1Nr1318813188euoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759388385;
	bh=4nUSSdMGjCPyedd7TdeRQen8rxiQXem7xcM3JbGA06U=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bHQOrmcq+tbmKJVoWSiB5DhUyHx2uLWBWwI6ayGSO+2oXmD9Jb6m4t6DU3cBV8etp
	 QWjLZZ7gmNJ0UJYFSOBG4H4jGj5qXLms0BHPL+9+US3SVlu+iHMGnGTEh8ImGJPCc9
	 1S3U1DhDg0Q6nk/xgwhYQ9lwGUuFt2CEDlC9tF/o=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251002065945eucas1p16f58178b5dc221a973e2671ede0b2011~qmmo674Rq1373113731eucas1p1B;
	Thu,  2 Oct 2025 06:59:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251002065942eusmtip133e1f9973fdf1d7de571b742c1d219ea~qmmmaedYH2189721897eusmtip1O;
	Thu,  2 Oct 2025 06:59:42 +0000 (GMT)
Message-ID: <70a9ca8c-a38c-44e4-9e7f-ca260eb5e37f@samsung.com>
Date: Thu, 2 Oct 2025 08:59:41 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Melissa Wen <mwen@igalia.com>, Stefan Wahren <wahrenst@gmx.net>,
	=?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz
	Julienne <nsaenz@kernel.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Maxime Ripard <mripard@kernel.org>, Iago
	Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, Dave
	Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ca9605fc-79da-43c1-9146-3638cd5791c4@igalia.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251002065945eucas1p16f58178b5dc221a973e2671ede0b2011
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3
X-EPHeader: CA
X-CMS-RootMailID: 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
	<20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
	<CGME20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3@eucas1p2.samsung.com>
	<727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com>
	<2b1537c1-93e4-4c6c-8554-a2d877759201@gmx.net>
	<1e5d1625-1326-4565-8407-71a58a91d230@samsung.com>
	<c40880aa-ce14-41bc-a32f-7f46506a8909@gmx.net>
	<ca9605fc-79da-43c1-9146-3638cd5791c4@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_075955_305466_79EC3DC9 
X-CRM114-Status: GOOD (  29.00  )
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

On 01.10.2025 22:50, Melissa Wen wrote:
> On 26/09/2025 07:36, Stefan Wahren wrote:
>> Am 26.09.25 um 09:27 schrieb Marek Szyprowski:
>>> On 25.09.2025 18:48, Stefan Wahren wrote:
>>>> Am 25.09.25 um 09:57 schrieb Marek Szyprowski:
>>>>> On 31.07.2025 23:06, Maíra Canal wrote:
>>>>>> Currently, when we prepare or unprepare RPi's clocks, we don't 
>>>>>> actually
>>>>>> enable/disable the firmware clock. This means that
>>>>>> `clk_disable_unprepare()` doesn't actually change the clock state at
>>>>>> all, nor does it lowers the clock rate.
>>>>>>
>>>>>> >From the Mailbox Property Interface documentation [1], we can 
>>>>>> see that
>>>>>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>>>>>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>>>>>> prepare and an unprepare hook for RPi's firmware clock.
>>>>>>
>>>>>> As now the clocks are actually turned off, some of them are now 
>>>>>> marked
>>>>>> CLK_IS_CRITICAL, as those are required to be on during the whole 
>>>>>> system
>>>>>> operation.
>>>>>>
>>>>>> Link:https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface 
>>>>>>
>>>>>> [1]
>>>>>> Signed-off-by: Maíra Canal<mcanal@igalia.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> About the pixel clock: currently, if we actually disable the pixel
>>>>>> clock during a hotplug, the system will crash. This happens in the
>>>>>> RPi 4.
>>>>>>
>>>>>> The crash happens after we disabled the CRTC (thus, the pixel 
>>>>>> clock),
>>>>>> but before the end of atomic commit tail. As vc4's pixel valve 
>>>>>> doesn't
>>>>>> directly hold a reference to its clock – we use the HDMI encoder to
>>>>>> manage the pixel clock – I believe we might be disabling the clock
>>>>>> before we should.
>>>>>>
>>>>>> After this investigation, I decided to keep things as they 
>>>>>> current are:
>>>>>> the pixel clock is never disabled, as fixing it would go out of
>>>>>> the scope of this series.
>>>>>> ---
>>>>>>     drivers/clk/bcm/clk-raspberrypi.c | 56
>>>>>> ++++++++++++++++++++++++++++++++++++++-
>>>>>>     1 file changed, 55 insertions(+), 1 deletion(-)
>>>>> This patch landed recently in linux-next as commit 919d6924ae9b 
>>>>> ("clk:
>>>>> bcm: rpi: Turn firmware clock on/off when preparing/unpreparing"). 
>>>>> In my
>>>>> tests I found that it breaks booting of RaspberryPi3B+ board in ARM
>>>>> 32bit mode. Surprisingly the same board in ARM 64bit mode correctly
>>>>> boots a kernel compiled from the same source. The RPi3B+ board 
>>>>> freezes
>>>>> after loading the DRM modules (kernel compiled from
>>>>> arm/multi_v7_defconfig):
>>>> thanks for spotting and bisecting this. Sorry, I only reviewed the
>>>> changes and didn't had the time to test any affected board.
>>>>
>>>> I was able to reproduce this issue and the following workaround avoid
>>>> the hang in my case:
>>>>
>>>> diff --git a/drivers/clk/bcm/clk-raspberrypi.c
>>>> b/drivers/clk/bcm/clk-raspberrypi.c
>>>> index 1a9162f0ae31..94fd4f6e2837 100644
>>>> --- a/drivers/clk/bcm/clk-raspberrypi.c
>>>> +++ b/drivers/clk/bcm/clk-raspberrypi.c
>>>> @@ -137,6 +137,7 @@ 
>>>> raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>>>          [RPI_FIRMWARE_V3D_CLK_ID] = {
>>>>                  .export = true,
>>>>                  .maximize = true,
>>>> +               .flags = CLK_IS_CRITICAL,
>>>>          },
>>>>          [RPI_FIRMWARE_PIXEL_CLK_ID] = {
>>>>                  .export = true,
>>>>
>>> Right, this fixes (frankly speaking 'hides') the issue. Feel free to 
>>> add:
>>>
>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>> AFAIK the offending clock change isn't in the downstream kernel, so I 
>> like to see the opinion of María and the Raspberry Pi people first.
>
> Hi,
>
> I see in the downstream kernel the CLOCK_V3D was removed in favor of 
> firmware clock:
> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/drivers/clk/bcm/clk-bcm2835.c#L2076 
>
>
> Also, v3d in RPi4 is set to use the firmware clock:
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi#L97 
>
>
> I think v3d clock is missed on boot, but I also think the issue should 
> be solved by setting the v3d firmware clock for Pi3.
> WDYT? Can you check it on your side? Something like:
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi 
> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> index 8b3c21d9f333..3289cb5dfa8e 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> @@ -14,6 +14,7 @@ &hdmi {
>  };
>
>  &v3d {
> +       clocks = <&firmware_clocks 5>;
>         power-domains = <&power RPI_POWER_DOMAIN_V3D>;
>  };
>
This works for me and fixes the mentioned issue. Feel free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


