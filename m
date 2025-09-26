Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB7CCAC5BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 07:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfTqJAeUpyWDWUY0mZYgZGj49ET2JHgaUA22xnXpmkY=; b=M9WywkRS/Wx1XQdaHWCNEcOTI+
	ClRvOBIepXDg4ukdBmpNdsZ1pbBqGtARAX2ZZpMzygrCLShMGGBvvSgKTVJSGm23zLbIaphNtQZqt
	97og2Szbdp7uW7AMTPTSg+XLJ8RS0drXtCij9WzGZcDvrW5e9gPcs7taHA6j0U60ZCiGY1YwtV5s9
	kZQxlFPXUvL218Eu9BT8uQ+PgWZ7LemyaTPHW0SRwfYr8YEMwTQirm4cohkuOAYYYUKrKNZY0O6x6
	FB2bq7JxLEPweRmX+olKNI+76FzPCBVhMjTwilZlLA7VWBbx1IGpHJ+YLwYXewrVaM8jGWjhfbKiU
	coi33XVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22s0-0000000GmBA-28DY;
	Fri, 26 Sep 2025 07:27:56 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22rw-0000000Gm2A-3cln
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 07:27:55 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250926072746euoutp01897003564b3e0b18d5af2e4b4988c619~oxHYcF6v91678416784euoutp01Q
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:27:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250926072746euoutp01897003564b3e0b18d5af2e4b4988c619~oxHYcF6v91678416784euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758871666;
	bh=vfTqJAeUpyWDWUY0mZYgZGj49ET2JHgaUA22xnXpmkY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=SXqxsBnupU76fIpOgWpc3cxxUgtojx8A4U9ZVmc3fjzLt8Sai/y7EnEfFFn8i25Fc
	 zpM07Ptxl+rmYuluBBD0NxZSbiKLTU0oFTxEj74zJPuHnq/8s/p0OZmMxAVi7MNVtT
	 HUD0rXWmiHD+q5rhEnZr7Pcmr1EVqMIgBFaTMBsI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250926072745eucas1p139b192b8a0342c448f1917a867b91b23~oxHXwfdhJ1038710387eucas1p1w;
	Fri, 26 Sep 2025 07:27:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250926072743eusmtip144b115372f153f8c07ba60b620d2d799~oxHWbRlP82061920619eusmtip1S;
	Fri, 26 Sep 2025 07:27:43 +0000 (GMT)
Message-ID: <1e5d1625-1326-4565-8407-71a58a91d230@samsung.com>
Date: Fri, 26 Sep 2025 09:27:42 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Stefan Wahren <wahrenst@gmx.net>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
	<mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
	Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian
	Fainelli <florian.fainelli@broadcom.com>, Maxime Ripard
	<mripard@kernel.org>, Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga
	<itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <2b1537c1-93e4-4c6c-8554-a2d877759201@gmx.net>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250926072745eucas1p139b192b8a0342c448f1917a867b91b23
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_002753_495755_6E4889EF 
X-CRM114-Status: GOOD (  28.70  )
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

On 25.09.2025 18:48, Stefan Wahren wrote:
> Am 25.09.25 um 09:57 schrieb Marek Szyprowski:
>> On 31.07.2025 23:06, Maíra Canal wrote:
>>> Currently, when we prepare or unprepare RPi's clocks, we don't actually
>>> enable/disable the firmware clock. This means that
>>> `clk_disable_unprepare()` doesn't actually change the clock state at
>>> all, nor does it lowers the clock rate.
>>>
>>> >From the Mailbox Property Interface documentation [1], we can see that
>>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>>> prepare and an unprepare hook for RPi's firmware clock.
>>>
>>> As now the clocks are actually turned off, some of them are now marked
>>> CLK_IS_CRITICAL, as those are required to be on during the whole system
>>> operation.
>>>
>>> Link:https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface 
>>> [1]
>>> Signed-off-by: Maíra Canal<mcanal@igalia.com>
>>>
>>> ---
>>>
>>> About the pixel clock: currently, if we actually disable the pixel
>>> clock during a hotplug, the system will crash. This happens in the
>>> RPi 4.
>>>
>>> The crash happens after we disabled the CRTC (thus, the pixel clock),
>>> but before the end of atomic commit tail. As vc4's pixel valve doesn't
>>> directly hold a reference to its clock – we use the HDMI encoder to
>>> manage the pixel clock – I believe we might be disabling the clock
>>> before we should.
>>>
>>> After this investigation, I decided to keep things as they current are:
>>> the pixel clock is never disabled, as fixing it would go out of
>>> the scope of this series.
>>> ---
>>>    drivers/clk/bcm/clk-raspberrypi.c | 56 
>>> ++++++++++++++++++++++++++++++++++++++-
>>>    1 file changed, 55 insertions(+), 1 deletion(-)
>> This patch landed recently in linux-next as commit 919d6924ae9b ("clk:
>> bcm: rpi: Turn firmware clock on/off when preparing/unpreparing"). In my
>> tests I found that it breaks booting of RaspberryPi3B+ board in ARM
>> 32bit mode. Surprisingly the same board in ARM 64bit mode correctly
>> boots a kernel compiled from the same source. The RPi3B+ board freezes
>> after loading the DRM modules (kernel compiled from 
>> arm/multi_v7_defconfig):
> thanks for spotting and bisecting this. Sorry, I only reviewed the 
> changes and didn't had the time to test any affected board.
>
> I was able to reproduce this issue and the following workaround avoid 
> the hang in my case:
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c 
> b/drivers/clk/bcm/clk-raspberrypi.c
> index 1a9162f0ae31..94fd4f6e2837 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -137,6 +137,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>         [RPI_FIRMWARE_V3D_CLK_ID] = {
>                 .export = true,
>                 .maximize = true,
> +               .flags = CLK_IS_CRITICAL,
>         },
>         [RPI_FIRMWARE_PIXEL_CLK_ID] = {
>                 .export = true,
>
Right, this fixes (frankly speaking 'hides') the issue. Feel free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> The proper fix should be in the clock consumer drivers. I found that 
> vc4_v3d doesn't ensure that the clock is enabled before accessing the 
> registers. Unfortunately the following change doesn't fix the issue 
> for me :-(
>
> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c 
> b/drivers/gpu/drm/vc4/vc4_v3d.c
> index bb09df5000bd..5e43523732b4 100644
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -441,7 +441,7 @@ static int vc4_v3d_bind(struct device *dev, struct 
> device *master, void *data)
>         vc4->v3d = v3d;
>         v3d->vc4 = vc4;
>
> -       v3d->clk = devm_clk_get_optional(dev, NULL);
> +       v3d->clk = devm_clk_get_optional_enabled(dev, NULL);
>         if (IS_ERR(v3d->clk))
>                 return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed 
> to get V3D clock\n");

Well, this can be sorted out in the drivers as a next step.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


