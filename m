Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26525D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLL0CXWtIsqIF65EdxQpHUFOBAjPtfjPtszmjqI/qoY=; b=uVjSPvV60Omx2fThyDjeLMb3Ej
	PxfBRS7nepTqSKwh7NQP/RZyHxlBWVvwgQ0ZbOfYOmXqUzTmWIjDGGMLlpsZpFDlyQSPFltvu1EzU
	0Mssuz5w1Y3H5rZeqBeFZOAtfOUTxIahrRDfbdPKKFWyWV4mFFemNzCpGlhVKJeAYj9QIjoDvIJGK
	08X2gJNruA8w56vhPey5WzPXKl6QzYU0w/qVLUpX68MmQZAh5PdfOqpFfLt8UqPoX7tMKV9Dq0Be+
	mbF4E7HeSQINq13fyK+8jJTRzijR0kiEehxzBcZzlWsq70ZXUbIlgHHpAXnBhHYJdg+UXhIjRIzwD
	76z8PdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApdM-00000003Knn-2Z1k;
	Tue, 12 Nov 2024 12:04:36 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAosJ-00000003Bb4-1OgX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:16:02 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so5466566e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 03:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731410157; x=1732014957; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YLL0CXWtIsqIF65EdxQpHUFOBAjPtfjPtszmjqI/qoY=;
        b=0vVFEa807i8IWU0JdZURIvohCUg7Ho54uC4mOFbXCGo2KMJ4ubWGbGDHzq+U31At0a
         cFqFTyqvaG2CQ3vFpsqGUaTHb/D3+u4wZM1dCw6ztPBb4M2oFq3FCwvDOycY1FOLBQEe
         fViVl7qJ66+oMqG59L/3sNYOP1luW1o1/FPPEgEBFbrgvLC6SJiTZjB1ybcDzHUorDI9
         H9RIlJmKTTb8kMKNZg/PrpTG3ZBdf1MwJchd5DSXKOfqinYVn5zLd502ecfWLiW1MAAY
         rclG4GyBJ9OD8mrVfYvr99f0n8XbKquYW6OCndD46azvN0l1HufNZBVvBk6bHO9zCt3s
         u1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731410157; x=1732014957;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YLL0CXWtIsqIF65EdxQpHUFOBAjPtfjPtszmjqI/qoY=;
        b=PVCzDpLjj9WxqLxXbzEThMwVv7eah8qYWClDUaXHppMSCre/VvicO5VLhBc2XWFILx
         3ktaXzbetSyBd4eASijPHw0AcBXNlGZ2m3vyOvvg+hyJ7mxiw0lcg391hC2971hNX0HW
         Dicj9OVT94mw1gA5qe9DzvBBlWvOFlK1d4sKrQOMV22CrQLioVIGodr2tXWigrLUOKti
         vf+BV3RcllAHtpaJScJaucKGhK6uNekJrvkClT56UfBHImyvvYVW2/Ws0z/sIsaVa2js
         NDU59DMoYK3c1/SHKeODvVICsN4tjoOWRXj3La8Nv3kADbgqoEirzDFt9NXbVd5A+OtY
         cCvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ppbdBoIKrCDEVsj70Phmm3RdfoyUzriya3Rs70RltCWfkyJiNnlcg7LKWZ9QlyUDZPPeGsa7S9y+uniqe324@lists.infradead.org
X-Gm-Message-State: AOJu0YwbUTcXSTBV8Ne4FZRZef/jhIxr8cYhCbpDV4MKNJofoWYNtb+G
	FPRO/Shqy7Ap58L5ICRo2x2ronUYzBkAJxB2G6OpZEwnnfFdSjY5zPt5BCKmU5Y=
X-Google-Smtp-Source: AGHT+IHEnq216Q7LNkZLWrIemOsyxij0OgTuGcQwQihenpTOIVLKF1wFfG65zMsIE16TFRIJKtz4ww==
X-Received: by 2002:a05:6512:124b:b0:539:e454:942e with SMTP id 2adb3069b0e04-53d862c6d31mr7835933e87.16.1731410157372;
        Tue, 12 Nov 2024 03:15:57 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b0562642sm208909975e9.21.2024.11.12.03.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 03:15:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jian Hu <jian.hu@amlogic.com>,
  Dmitry Rokosov <ddrokosov@sberdevices.ru>,  Yu Tu <yu.tu@amlogic.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: Fix children of ro_clk may be tampered with
In-Reply-To: <e13bc132-fc90-4378-852b-1ff45a6872b9@amlogic.com> (Chuan Liu's
	message of "Tue, 12 Nov 2024 18:16:40 +0800")
References: <20241111-fix_childclk_of_roclk_has_been_tampered_with-v1-1-f8c1b6ffdcb0@amlogic.com>
	<1jr07g25da.fsf@starbuckisacylon.baylibre.com>
	<e13bc132-fc90-4378-852b-1ff45a6872b9@amlogic.com>
Date: Tue, 12 Nov 2024 12:15:56 +0100
Message-ID: <1jikss1z4j.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_031559_689056_06905B39 
X-CRM114-Status: GOOD (  24.03  )
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

On Tue 12 Nov 2024 at 18:16, Chuan Liu <chuan.liu@amlogic.com> wrote:

> On 11/12/2024 5:01 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Mon 11 Nov 2024 at 17:37, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> When setting the rate of a clock using clk_regmap_divider_ro_ops, the
>>> rate of its children may be tampered with.
>>>
>>> Fixes: 84af914404db ("clk: meson: a1: add Amlogic A1 Peripherals clock controller driver")
>>> Fixes: 87173557d2f6 ("clk: meson: clk-pll: remove od parameters")
>>> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
>>> Fixes: 64aa7008e957 ("clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller")
>>> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
>>> Fixes: e787c9c55eda ("clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver")
>> Think about stable trying to pick up this ...
>>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> ---
>>> Background: During the execution of clk_set_rate(), the function
>>> clk_core_round_rate_nolock() is called to calculate the matching rate
>>> and save it to 'core->new_rate'. At the same time, it recalculates and
>>> updates its 'child->newrate'. Finally, clk_change_rate() is called to
>>> set all 'new_rates'.
>>>
>>> In clk_regmap_divider_ro_ops, there is an implementation of
>>> 'determine_rate'. If a clock (name as 'ro_divider') that references
>>> clk_regmap_divider_ro_ops is not configured with CLK_DIVIDER_READ_ONLY,
>>> it will result in the calculation of an incorrect core->new_rate and
>>> potentially tamper with child->newrate, ultimately leading to the
>>> corruption of the rate for 'ro_divider's' children.
>> A slitghtly more simple way to put it, is that ro_ops have the regular
>> determine_rate function, so it can actually alter the rate.
>>
>> That should be in the commit description, not where it will be dropped.
>>
>> Requiring the flag in addition to ro_ops in redundant.
>> Plus, it is not the platform that should be fixed but the divider
>> driver.
>>
>> Just put the content of the CLK_DIVIDER_READ_ONLY if clause into a
>> function, clk_regmap_div_ro_determine_rate(), and use it
>> - directly for ro_ops
>> - under if clause for regular ops.
>
> The approach of adding clk_regmap_div_ro_determine_rate() will be
> inconsistent with the style in clk-divider.c in CCF, and
> CLK_DIVIDER_READ_ONLY will also become meaningless for our driver.
> Do we need to maintain the style of clk-divider.c in CCF?

There is no point in having ro_ops that are not actually RO.
Please fix the ops.

>
>>
>>> ---
>>>   drivers/clk/meson/a1-peripherals.c |  2 ++
>>>   drivers/clk/meson/axg.c            |  5 +++--
>>>   drivers/clk/meson/g12a.c           | 23 ++++++++++++++---------
>>>   drivers/clk/meson/gxbb.c           | 18 ++++++++++--------
>>>   drivers/clk/meson/meson8-ddr.c     |  2 +-
>>>   drivers/clk/meson/meson8b.c        |  4 +++-
>>>   drivers/clk/meson/s4-peripherals.c |  2 ++
>>>   drivers/clk/meson/s4-pll.c         |  2 +-
>>>   8 files changed, 36 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
>>> index 7aa6abb2eb1f..eedf7c2bf970 100644
>>> --- a/drivers/clk/meson/a1-peripherals.c
>>> +++ b/drivers/clk/meson/a1-peripherals.c
>>> @@ -266,6 +266,7 @@ static struct clk_regmap sys_b_div = {
>>>                .offset = SYS_CLK_CTRL0,
>>>                .shift = 16,
>>>                .width = 10,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "sys_b_div",
>>> @@ -314,6 +315,7 @@ static struct clk_regmap sys_a_div = {
>>>                .offset = SYS_CLK_CTRL0,
>>>                .shift = 0,
>>>                .width = 10,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "sys_a_div",
>>> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
>>> index 1b08daf579b2..eb86c4d10046 100644
>>> --- a/drivers/clk/meson/axg.c
>>> +++ b/drivers/clk/meson/axg.c
>>> @@ -71,7 +71,7 @@ static struct clk_regmap axg_fixed_pll = {
>>>                .offset = HHI_MPLL_CNTL,
>>>                .shift = 16,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "fixed_pll",
>>> @@ -130,7 +130,7 @@ static struct clk_regmap axg_sys_pll = {
>>>                .offset = HHI_SYS_PLL_CNTL,
>>>                .shift = 16,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "sys_pll",
>>> @@ -471,6 +471,7 @@ static struct clk_regmap axg_mpll_prediv = {
>>>                .offset = HHI_MPLL_CNTL5,
>>>                .shift = 12,
>>>                .width = 1,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "mpll_prediv",
>>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>>> index d3539fe9f7af..c7c9fdfd021f 100644
>>> --- a/drivers/clk/meson/g12a.c
>>> +++ b/drivers/clk/meson/g12a.c
>>> @@ -76,7 +76,7 @@ static struct clk_regmap g12a_fixed_pll = {
>>>                .offset = HHI_FIX_PLL_CNTL0,
>>>                .shift = 16,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "fixed_pll",
>>> @@ -443,6 +443,7 @@ static struct clk_regmap g12a_cpu_clk_mux1_div = {
>>>                .offset = HHI_SYS_CPU_CLK_CNTL0,
>>>                .shift = 20,
>>>                .width = 6,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "cpu_clk_dyn1_div",
>>> @@ -627,6 +628,7 @@ static struct clk_regmap g12b_cpub_clk_mux1_div = {
>>>                .offset = HHI_SYS_CPUB_CLK_CNTL,
>>>                .shift = 20,
>>>                .width = 6,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "cpub_clk_dyn1_div",
>>> @@ -746,6 +748,7 @@ static struct clk_regmap sm1_dsu_clk_mux0_div = {
>>>                .offset = HHI_SYS_CPU_CLK_CNTL5,
>>>                .shift = 4,
>>>                .width = 6,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "dsu_clk_dyn0_div",
>>> @@ -781,6 +784,7 @@ static struct clk_regmap sm1_dsu_clk_mux1_div = {
>>>                .offset = HHI_SYS_CPU_CLK_CNTL5,
>>>                .shift = 20,
>>>                .width = 6,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "dsu_clk_dyn1_div",
>>> @@ -1198,7 +1202,7 @@ static struct clk_regmap g12a_cpu_clk_apb_div = {
>>>                .offset = HHI_SYS_CPU_CLK_CNTL1,
>>>                .shift = 3,
>>>                .width = 3,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "cpu_clk_apb_div",
>>> @@ -1232,7 +1236,7 @@ static struct clk_regmap g12a_cpu_clk_atb_div = {
>>>                .offset = HHI_SYS_CPU_CLK_CNTL1,
>>>                .shift = 6,
>>>                .width = 3,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "cpu_clk_atb_div",
>>> @@ -1266,7 +1270,7 @@ static struct clk_regmap g12a_cpu_clk_axi_div = {
>>>                .offset = HHI_SYS_CPU_CLK_CNTL1,
>>>                .shift = 9,
>>>                .width = 3,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "cpu_clk_axi_div",
>>> @@ -1300,7 +1304,7 @@ static struct clk_regmap g12a_cpu_clk_trace_div = {
>>>                .offset = HHI_SYS_CPU_CLK_CNTL1,
>>>                .shift = 20,
>>>                .width = 3,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "cpu_clk_trace_div",
>>> @@ -1736,7 +1740,7 @@ static struct clk_regmap sm1_gp1_pll = {
>>>                .shift = 16,
>>>                .width = 3,
>>>                .flags = (CLK_DIVIDER_POWER_OF_TWO |
>>> -                       CLK_DIVIDER_ROUND_CLOSEST),
>>> +                       CLK_DIVIDER_ROUND_CLOSEST | CLK_DIVIDER_READ_ONLY),
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "gp1_pll",
>>> @@ -1999,7 +2003,7 @@ static struct clk_regmap g12a_hdmi_pll_od = {
>>>                .offset = HHI_HDMI_PLL_CNTL0,
>>>                .shift = 16,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "hdmi_pll_od",
>>> @@ -2017,7 +2021,7 @@ static struct clk_regmap g12a_hdmi_pll_od2 = {
>>>                .offset = HHI_HDMI_PLL_CNTL0,
>>>                .shift = 18,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "hdmi_pll_od2",
>>> @@ -2035,7 +2039,7 @@ static struct clk_regmap g12a_hdmi_pll = {
>>>                .offset = HHI_HDMI_PLL_CNTL0,
>>>                .shift = 20,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "hdmi_pll",
>>> @@ -4048,6 +4052,7 @@ static struct clk_regmap g12a_ts_div = {
>>>                .offset = HHI_TS_CLK_CNTL,
>>>                .shift = 0,
>>>                .width = 8,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "ts_div",
>>> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
>>> index 262c318edbd5..e2b419100e0c 100644
>>> --- a/drivers/clk/meson/gxbb.c
>>> +++ b/drivers/clk/meson/gxbb.c
>>> @@ -131,7 +131,7 @@ static struct clk_regmap gxbb_fixed_pll = {
>>>                .offset = HHI_MPLL_CNTL,
>>>                .shift = 16,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "fixed_pll",
>>> @@ -267,7 +267,7 @@ static struct clk_regmap gxbb_hdmi_pll_od = {
>>>                .offset = HHI_HDMI_PLL_CNTL2,
>>>                .shift = 16,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "hdmi_pll_od",
>>> @@ -285,7 +285,7 @@ static struct clk_regmap gxbb_hdmi_pll_od2 = {
>>>                .offset = HHI_HDMI_PLL_CNTL2,
>>>                .shift = 22,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "hdmi_pll_od2",
>>> @@ -303,7 +303,7 @@ static struct clk_regmap gxbb_hdmi_pll = {
>>>                .offset = HHI_HDMI_PLL_CNTL2,
>>>                .shift = 18,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "hdmi_pll",
>>> @@ -321,7 +321,7 @@ static struct clk_regmap gxl_hdmi_pll_od = {
>>>                .offset = HHI_HDMI_PLL_CNTL + 8,
>>>                .shift = 21,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "hdmi_pll_od",
>>> @@ -339,7 +339,7 @@ static struct clk_regmap gxl_hdmi_pll_od2 = {
>>>                .offset = HHI_HDMI_PLL_CNTL + 8,
>>>                .shift = 23,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "hdmi_pll_od2",
>>> @@ -357,7 +357,7 @@ static struct clk_regmap gxl_hdmi_pll = {
>>>                .offset = HHI_HDMI_PLL_CNTL + 8,
>>>                .shift = 19,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "hdmi_pll",
>>> @@ -413,7 +413,7 @@ static struct clk_regmap gxbb_sys_pll = {
>>>                .offset = HHI_SYS_PLL_CNTL,
>>>                .shift = 10,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "sys_pll",
>>> @@ -703,6 +703,7 @@ static struct clk_regmap gxbb_mpll_prediv = {
>>>                .offset = HHI_MPLL_CNTL5,
>>>                .shift = 12,
>>>                .width = 1,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "mpll_prediv",
>>> @@ -911,6 +912,7 @@ static struct clk_regmap gxbb_mpeg_clk_div = {
>>>                .offset = HHI_MPEG_CLK_CNTL,
>>>                .shift = 0,
>>>                .width = 7,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "mpeg_clk_div",
>>> diff --git a/drivers/clk/meson/meson8-ddr.c b/drivers/clk/meson/meson8-ddr.c
>>> index 4b73ea244b63..950f323072fb 100644
>>> --- a/drivers/clk/meson/meson8-ddr.c
>>> +++ b/drivers/clk/meson/meson8-ddr.c
>>> @@ -65,7 +65,7 @@ static struct clk_regmap meson8_ddr_pll = {
>>>                .offset = AM_DDR_PLL_CNTL,
>>>                .shift = 16,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "ddr_pll",
>>> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
>>> index e4b474c5f86c..4dba11c0ab7e 100644
>>> --- a/drivers/clk/meson/meson8b.c
>>> +++ b/drivers/clk/meson/meson8b.c
>>> @@ -104,7 +104,7 @@ static struct clk_regmap meson8b_fixed_pll = {
>>>                .offset = HHI_MPLL_CNTL,
>>>                .shift = 16,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "fixed_pll",
>>> @@ -457,6 +457,7 @@ static struct clk_regmap meson8b_mpll_prediv = {
>>>                .offset = HHI_MPLL_CNTL5,
>>>                .shift = 12,
>>>                .width = 1,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "mpll_prediv",
>>> @@ -635,6 +636,7 @@ static struct clk_regmap meson8b_mpeg_clk_div = {
>>>                .offset = HHI_MPEG_CLK_CNTL,
>>>                .shift = 0,
>>>                .width = 7,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "mpeg_clk_div",
>>> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
>>> index c930cf0614a0..470431355e25 100644
>>> --- a/drivers/clk/meson/s4-peripherals.c
>>> +++ b/drivers/clk/meson/s4-peripherals.c
>>> @@ -175,6 +175,7 @@ static struct clk_regmap s4_sysclk_b_div = {
>>>                .offset = CLKCTRL_SYS_CLK_CTRL0,
>>>                .shift = 16,
>>>                .width = 10,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "sysclk_b_div",
>>> @@ -221,6 +222,7 @@ static struct clk_regmap s4_sysclk_a_div = {
>>>                .offset = CLKCTRL_SYS_CLK_CTRL0,
>>>                .shift = 0,
>>>                .width = 10,
>>> +             .flags = CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "sysclk_a_div",
>>> diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
>>> index d8e621e79428..5dc051afc06a 100644
>>> --- a/drivers/clk/meson/s4-pll.c
>>> +++ b/drivers/clk/meson/s4-pll.c
>>> @@ -72,7 +72,7 @@ static struct clk_regmap s4_fixed_pll = {
>>>                .offset = ANACTRL_FIXPLL_CTRL0,
>>>                .shift = 16,
>>>                .width = 2,
>>> -             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
>>>        },
>>>        .hw.init = &(struct clk_init_data){
>>>                .name = "fixed_pll",
>>>
>>> ---
>>> base-commit: 664988eb47dd2d6ae1d9e4188ec91832562f8f26
>>> change-id: 20241111-fix_childclk_of_roclk_has_been_tampered_with-61dbcc623746
>>>
>>> Best regards,
>> --
>> Jerome

-- 
Jerome

