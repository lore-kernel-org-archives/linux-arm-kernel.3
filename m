Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB52FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKipKjwmAYHSpItleSKPId0JyA0V7zJvz2+mQe2PcFk=; b=wQLNuNWckIS+r65olcA3LQQK0+
	ICvZRbto/M220Xqbatpbx1z7fhWL+2hpfJ4xld5RNTbFe6yVmnePQKBdHehdyikb0d5ZGY+OhU2Nw
	eWz5v6sA4eIT9FLnFGbQWJJq2jBv9bdYwXF7nv4SZuBrMzBaji2ymAe5PhsMFFYTaAVSCe8TR29WU
	pSbgjjTlUeziiruq+PD02v3TYFeIyH++8ZmSDgU37uXxvk1uPS0ywKjw/ADUMF9FZ6mXGp3mj5C/Y
	jXQ86Np1hGhkjCauHfyfUU4RbcI0imuypu/8CQl2gZPZgXZgqw70dkLd0F0DDjnbfGWvr2h7Bdvwg
	sH65nIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tddn9-00000009lmp-33De;
	Thu, 30 Jan 2025 23:17:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tddlp-00000009leP-472J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:16:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43626213fffso16286675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 15:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738278984; x=1738883784; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKipKjwmAYHSpItleSKPId0JyA0V7zJvz2+mQe2PcFk=;
        b=VtuUFM3iwEAXHIzWRKFdq+3gq+08Kd3mhOyOeFBLpmhOaQbhT48IbNfNf9G8i24Y9n
         t0fuqBRwKVVedO2LHw3YAcVPyMU6Wsi96c9qwRJrlNMWpIcXTMtKjpbd6jmORwQ+Gt+r
         WFQ+xaxSQoYZAlp+msB5svKog6cu8hiernR3eoIKvzBk5b5TWpJ5Sf0tqKZV0sBabet+
         LOftcl8WKNISE89ZCrqmTNz1t4bxbgYUVlobPjfklZLt6ifaUGb3kHbEDaYrg1ps4qB+
         TqkAb1bLPZZlLRPhxRKh9e8AbGtRojK6j1hefNzp5nzEVfDb4dD50KtG+kFMGV3T41A+
         G1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738278984; x=1738883784;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKipKjwmAYHSpItleSKPId0JyA0V7zJvz2+mQe2PcFk=;
        b=kBNC9s1D/5FLMo/09JFrkIXOiHN1CXrSSqUC6YsXqIOxpgQyH4XUCJfkc969LrcR76
         SVBwOHB/706YV7gOqWTEXf30AYsrfAPMEWTzHPbvIC5AcPIAzQnEsAM4+VL1sEOxNzjg
         glzO8YhtTpOQysfufGcguwhXKXFQl728D1unuALvsAoDheNDwnfTGVExwh5LbcSOZoW1
         7LiH/yhnGO2/H67mMvOn4zMXCaPucxM8gqTxZ14Docz/b4k551qH69fI2cBNWnK5iNfN
         ulubOPwVUtxnkZj8h26iYhURrdN/dFzSayXlJb27XX2HnJbJnNcLveUpK3hXuVLTggM7
         zWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY6WD2zQZKaC2MdcRfIzYZqalXSBP7nM75D8EfnP2+9ejCZ2r4Pe7noqUOdu8mNbHDC0K9bPPy62jcDHJKRxF3@lists.infradead.org
X-Gm-Message-State: AOJu0YylUOO5DKBUj4EV4yOa2kUF+zA+khduvpdvFQnj1CtvLPngGMn1
	vtCK5gR70WwkP+h6uNG7Fa7Fs4+voRQThrlF0jd593A6gk4xsX5/gxqQguRLO9A=
X-Gm-Gg: ASbGncvJxa33vVO1Qn60DqmGSIFKZNkPdY5wDlur/uK0BL5is9c+ZPagwh1lwJS/62W
	9kVsN40RGoeSTKJPmrkfPgusessW7UEHCuSnklH/V3D4bJ63dn81pStH5atYD/C1TfZnFcfN3cb
	hnvRUAoIHsm6SQ1CEBb6jQZVJX+HJ3MGAj9mtLZwV0d6fML5XUXwEh3OJz2vbzognoliCXYvyh+
	hS/Pv2cKAkzY55rPya3i9vyPrl/39AaSYbCF5115FiR692+XfbqPOvijPmlA15E7vQOpw7aNdGW
	bsmTc8I0ceG1BJkN0XELCwwN
X-Google-Smtp-Source: AGHT+IFcX0KAMJy9mDTmsmnBGbqaMI8pUxKSFAWR413yvxqX324Lhy/8MDI3PwdZ8Dx+waNguOL2CQ==
X-Received: by 2002:a05:600c:3b83:b0:436:e3ea:64dd with SMTP id 5b1f17b1804b1-438e6eff1fbmr11181485e9.11.1738278984176;
        Thu, 30 Jan 2025 15:16:24 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ecc80sm3263917f8f.16.2025.01.30.15.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 15:16:23 -0800 (PST)
Message-ID: <e7374f91-a65d-4882-8a9b-de478582e09e@tuxon.dev>
Date: Fri, 31 Jan 2025 01:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
 <b496d933-3c57-4b02-ab65-0582a30939af@linaro.org>
 <98ddf1b6-1804-4116-b4e2-f54a62c27966@tuxon.dev>
 <7d1bf72b-183a-429d-9a0c-10e1936a9abe@linaro.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <7d1bf72b-183a-429d-9a0c-10e1936a9abe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_151626_198452_513FAD49 
X-CRM114-Status: GOOD (  43.06  )
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

Hi, Daniel,

On 31.01.2025 00:33, Daniel Lezcano wrote:
> On 30/01/2025 21:53, Claudiu Beznea wrote:
>> Hi, Daniel,
>>
>> On 30.01.2025 19:24, Daniel Lezcano wrote:
>>> On 30/01/2025 11:30, Claudiu Beznea wrote:
>>>>
>>>>
>>>> On 30.01.2025 12:07, Daniel Lezcano wrote:
>>>>> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>>>>>> Hi, Daniel,
>>>
>>> [ ... ]
>>>
>>>>>>> Would the IP need some cycles to capture the temperature accurately
>>>>>>> after the
>>>>>>> clock is enabled ?
>>>>>>
>>>>>> There is nothing about this mentioned about this in the HW manual of the
>>>>>> RZ/G3S SoC. The only points mentioned are as described in the driver
>>>>>> code:
>>>>>> - wait at least 3us after each IIO channel read
>>>>>> - wait at least 30us after enabling the sensor
>>>>>> - wait at least 50us after setting OE bit in TSU_SM
>>>>>>
>>>>>> For this I chose to have it implemented as proposed.
>>>>>
>>>>> IMO, disabling/enabling the clock between two reads through the pm
>>>>> runtime may
>>>>> not be a good thing, especially if the system enters a thermal situation
>>>>> where
>>>>> it has to mitigate.
>>>>>
>>>>> Without any testing capturing the temperatures and compare between the
>>>>> always-on
>>>>> and on/off, it is hard to say if it is true or not. Up to you to test
>>>>> that or
>>>>> not. If you think it is fine, then let's go with it.
>>>>
>>>> I tested it with and w/o the runtime PM and on/off support (so, everything
>>>> ON from the probe) and the reported temperature values were similar.
>>>
>>>
>>> Did you remove the roundup to 0.5°C ?
>>
>> I did the testing as suggested and, this time, collected results and
>> compared side by side. I read the temperature for 10 minutes, 60 seconds
>> after the Linux prompt showed up. There is, indeed, a slight difference b/w
>> the 2 cases.
>>
>> When the runtime PM doesn't touch the clocks on read the reported
>> temperature varies b/w 53-54 degrees while when the runtime PM
>> enables/disables the clocks a single read reported 55 degrees, the rest
>> reported 54 degrees.
>>
>> I plotted the results side by side here:
>> https://i2.paste.pics/f07eaeddc2ccc3c6695fe5056b52f4a2.png?
>> trs=0a0eaab99bb59ebcb10051eb298f437c7cd50c16437a87392aebc16cd9013e18&rand=vWXm2VTrbt
>>
>> Please let me know how do you consider it.
> 

After sending this to you I figured it out that precision is lost somewhere
so I re-tested it with the following diff (multiplied parts of the equation
with 1000):

diff --git a/drivers/thermal/renesas/rzg3s_thermal.c
b/drivers/thermal/renesas/rzg3s_thermal.c
index 6719f9ca05eb..84e18ff69d7c 100644
--- a/drivers/thermal/renesas/rzg3s_thermal.c
+++ b/drivers/thermal/renesas/rzg3s_thermal.c
@@ -83,7 +83,7 @@ static int rzg3s_thermal_get_temp(struct
thermal_zone_device *tz, int *temp)
        }

        ret = 0;
-       ts_code_ave = DIV_ROUND_CLOSEST(ts_code_ave, TSU_READ_STEPS);
+       ts_code_ave = DIV_ROUND_CLOSEST(MCELSIUS(ts_code_ave), TSU_READ_STEPS);

        /*
         * According to the HW manual (section 40.4.4 Procedure for
Measuring the Temperature)
@@ -91,11 +91,8 @@ static int rzg3s_thermal_get_temp(struct
thermal_zone_device *tz, int *temp)
         *
         * Tj = (ts_code_ave - priv->calib0) * 165 / (priv->calib0 -
priv->calib1) - 40
         */
-       *temp = DIV_ROUND_CLOSEST((ts_code_ave - priv->calib1) * 165,
-                                 (priv->calib0 - priv->calib1)) - 40;
-
-       /* Report it in mili degrees Celsius and round it up to 0.5 degrees
Celsius. */
-       *temp = roundup(MCELSIUS(*temp), 500);
+       *temp = DIV_ROUND_CLOSEST((u64)(ts_code_ave -
MCELSIUS(priv->calib1)) * MCELSIUS(165),
+                                 MCELSIUS(priv->calib0 - priv->calib1)) -
MCELSIUS(40);

 rpm_put:
        pm_runtime_mark_last_busy(dev);

With this, the results seems similar b/w runtime PM and no runtime PM cases.

The tests were executed after the board was off for few hours. The
first test was with runtime PM suspend/resume on each read. Then the board
was rebooted and re-run the test w/o runtime PM suspend/resume on reads.

Figure with results is here:
https://i2.paste.pics/5f353a4f04b07b4bead3086624aba23f.png?trs=0a0eaab99bb59ebcb10051eb298f437c7cd50c16437a87392aebc16cd9013e18&rand=5n34QNjWID


> Thanks for taking the time to provide a figure
> 
> Testing thermal can be painful because it should be done under certain
> conditions.
> 
> I guess there was no particular work load on the system when running the
> tests.

No load, indeed.

> 
> At the first glance, it seems, without the pm runtime, the measurement is
> more precise as it catches more thermal changes. But the test does not give
> information about the thermal behavior under stress. And one second
> sampling is too long to really figure it out.
> 
> In the kernel source tree, there is a tool to read the temperature in an
> optimized manner, you may want to use it to read the temperature at a
> higher rate. It is located in tools/thermal/thermometer
> 
> Compiling is a bit fuzzy ATM, so until it is fixed, here are the steps:
> 
> (you should install libconfig-dev and libnl-3-dev packages).
> 
> cd $LINUX_DIR/tools/thermal/lib
> make
> LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LINUX_DIR/tools/thermal/lib
> 
> cd $LINUX_DIR/tools
> make thermometer
> 
> 
> 
> Then change directory:
> 
> cd $LINUX_DIR/tools/thermal/thermometer
> 
> 
> Run the tool:
> 
> ./thermometer -o out -c t.conf -l DEBUG -- <my_command>
> 
> 
> The content of the configuration file t.conf is:
> 
> thermal-zones = (
>           {    name = "cpu[0_9].*-thermal";
>         polling = 100; }
>       )
> 
> All the captured data will be in the 'out' directory
> 
> For 'my_command', I suggest to use a script containing:
> 
> sleep 10; dhrystone -t 1 -r 120; sleep 10
> 
> If you need the dhrystone binary, let me know.
> 
> The thermal zone device tree configuration should be changed to use a 65°C
> passive trip point instead of 100°C (and the kernel setup with the step
> wise governor as default).
> 
> The resulting figure from the temperature should show a flat temperature
> figure during 10 seconds, then the temperature increasing until reaching
> the temperature threshold of 65°C, the temperature stabilizing around it,
> then followed by a temperature decreasing when the test finishes.
> 
> If the temperature does not reach the limit, decrease the trip point
> temperature or increase the dhrystone duration (the -r 120 option)
> 
> At this point, you should the test with and without pm runtime but in order
> to have consistent results, you should wait ~20 minutes between two tests.
> 
> The shape of the figures will give the immediate information about how the
> mitigation vs thermal sensor vs cooling device behave.
> 
> Additionally, you can enable the thermal DEBUGFS option and add the
> collected information statistics from /sys/kernel/debug/thermal/*** in the
> results.
> 
> 
> Hope that helps

Thank you for all these details. I'll have a look on it but starting with
Monday as I won't have access to setup in the following days.

Thank you,
Claudiu

> 
> 
> 
> 
> 
> 


