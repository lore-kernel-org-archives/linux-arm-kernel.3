Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A6BCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECS7M5UdJ33XaahEVws6tW0y/69FCVes8kzgWMXuvmQ=; b=MD/Wvc4fUZgn8w04ppNId/LOoj
	C8iWB7pU0Zlh6KBISqO+Yl27hlCMnqq6ck5XVwSZlW3rcQ4W/WfYpuk4gs6toU8bWm65vtsKcHHwR
	NIow/IMnkgZhvu2LVHJee5vhs8+IZmYrmo8kk7YNSaQ0WixBm66J6ihFNlquVCSubPjGP0Y3wCpLV
	hGGleOPZDgMS/MMiYtv98Hz5BroWMl6euoIwAXWHte4blQmRL+w1/FgVFrsgkMX9qtUi4f5dsxTqI
	CtEdkaX3vQrKKtFU6vmbU/M4vcgzNYpPdSho4qZHvafUL2vCWse9eeVTi5h0NIjGPba2StXvTnqfK
	MtEz7S7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScFN-00000005tf2-08Ro;
	Thu, 28 May 2026 15:02:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScFI-00000005te1-338V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 15:02:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so92978255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779980521; x=1780585321; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ECS7M5UdJ33XaahEVws6tW0y/69FCVes8kzgWMXuvmQ=;
        b=jccvR8xX1Xl/wbsy5wN0Y5SV4SozO5lq98ak9/BJP5mtHpJ9YcbC5Bd0TZmhxg8lPC
         8L+mcXnBnqnku66Q/ULCbbtW6iplDVyo/85fNufY8ZDRkqt3mri0FinNmX/sJu7YyYP5
         OU9rkciAN9lRlyBj+2+S7phg3xH9eAlpt0mxPo0bVWswQTJoGcvUU3MkcNYYtrU4zOx4
         mEOH/1rPPWBazQDCzcFsmtyDapRa8o0Oc8A4KXgf7T4IZWjgfyr70G4ozAu/OJ2fvnJz
         S2f6as4P4ayEcKb5mdvyM5PSLD71R839IQS744kAj/G4abNOmjcrRgif8Xjun24fLGS6
         ZG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980521; x=1780585321;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECS7M5UdJ33XaahEVws6tW0y/69FCVes8kzgWMXuvmQ=;
        b=Qe4xHnP0sQr6aXSxyL1UboSnFGllzCYyaeiECHRWJCKAIXXNcj1M5mERaJlWyuBRkI
         4R/whimJLzyQqiRpWw6R4mLhcBfkhXUTFJtWDlHagiQisfjJtL5BZt4cydV4/rjgj0ZR
         LjGI7bygxmJPsiPJyimN+YFYeTTRvjDeqUkRr8bFHPPfvuJIASFH6s+dmhu0hMrlQ50d
         hMi6p1YNshj3AwQuYEZhaB+Lx2iyB4zUOnM1MXweR7RkzcSGOlJkUj8ltkQ4kPvGkYGd
         6whKc0TvxqHtjkWvGMvHCEcuoUjdj4q/kmm2xdfRKbbVARRxdIqqPpFi7OphcBDB1+jz
         hLnA==
X-Forwarded-Encrypted: i=1; AFNElJ/yyVeHeUiHvyilgLGy0gFm3qigUq9vfUcA0EKIaWwadwOqwFK7qY3+zflmRAUo4RAA72OM/AyJrq68ZYuUf9UM@lists.infradead.org
X-Gm-Message-State: AOJu0YzqsYEcpLMankQHLduZldS5nWTAkpvIlZHrHl0iPAtE7r9Irg1s
	HimnIqOqUTt7TadZHEeWliRgpHyjZutyAokwec+aL49hDCI8DWGc6SFCG3aSaOx9aU8=
X-Gm-Gg: Acq92OEbO/7bUnkrugEZ7NNY+qT0zC59nMC5/Y9pRecUY6JpPTcgZuDQImXTh1LWD1N
	qYFujV18kE+bW+Xqo9w8VB6NANiotsN1X2ro+M1dUw5jUJWEWaOiLILOZ5yVLsQkupeIsWbxBCm
	gEH90w8Te6RBLcdAYmBTIsybe3wWQ2WY+zZ4AWRoJXg4WyyNELtFSwMA9wkPOd4fRfBx4O7gqmo
	spcoKru556kETvqxicKtaqzPWf+Ddi5OKOy8tsX0ywdC5Rv63H/9DgDveMbJ4hpgOGTbzwtlhjx
	LVS1SPjpflsXR3UnfKsXtVcA3vIaK0KKsJVyGXQO+5DhjN9ScPrw6bIzyFA3FQ4RDVQn4sNSb91
	+Yqv8TgJzYgKNCgstPrLUj21hiigyehMHzLN8ijwgSdqChgJO3pGAVwFLmLuf4sonJ5mlKaqwtx
	x78DVPDNKSKvUqg8C4iCf5PJt5MPung1D2B6WH
X-Received: by 2002:a05:600c:3e0d:b0:490:4e3e:b483 with SMTP id 5b1f17b1804b1-4904e3eb5abmr402523195e9.22.1779980521083;
        Thu, 28 May 2026 08:02:01 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909236ab3bsm53549395e9.4.2026.05.28.08.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 08:02:00 -0700 (PDT)
Message-ID: <a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com>
Date: Thu, 28 May 2026 17:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S
 output data
From: Valerio Setti <vsetti@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
 <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
 <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
 <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
Content-Language: en-US
In-Reply-To: <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_080205_071063_C0383316 
X-CRM114-Status: GOOD (  25.24  )
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



On 5/22/26 18:24, Valerio Setti wrote:
> 
> On 5/22/26 01:15, Mark Brown wrote:
>> On Fri, May 15, 2026 at 05:10:40PM +0200, Valerio Setti wrote:
>>> Create a new DAPM widget for "I2S formatter" and place it on the path
>>> between FIFO and output DAI interface. Remove I2S output formatting code
>>> from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.
>>
>> This series, it looks like this specific patch, is breaking pcm-test on
>> my libretech Le Potato board, the clocking looks to be seriously messed
>> up.  I'm getting:
>>
>> [...]
>>
>> Full log:
>>
>>     https://lava.sirena.org.uk/scheduler/job/2786342#L1934
>>
>> The prior patches seem to test fine, it's this one that seems to
>> introduce the issue.
> 
> Thanks a lot for the heads up and please apologize for the problem.
> I wasn't aware of these testing tools so I based my testing on playing 
> with userspace alsa tools on the physical board that I have.
> 
> I will take a look at it ASAP and send a properly tested v2.
> 

Hi!

I investigated a bit on the issue caused by my v1 patch series and I 
think I've found the root cause. I suspect my patch series helped 
discovering a misbehavior that was already present, so I'm seeking for 
suggestions on the proper way to proceed.

# First: the background

By default on OdroidC2/LePotato boards the only available audio playback 
is through HDMI. From DAI point of view the flow is as follows:

"I2S FIFO" -> "I2S Encoder Playback" -> "CODEC CTRL HDMI I2S IN" -> 
"HDMI CTRL SRC" (mixer) -> "CODEC CTRL HDMI OUT Capture"

In this chain the mixer "HDMI CTRL SRC" by default starts as "DISABLED" 
so it should prevent "CODEC CTRL HDMI OUT Capture" from receiving data.

# What changed before/after the last commit of my patch series?

- Before: "aiu-encoder-i2s.c" was calling "aiu_encoder_i2s_setup_desc()" 
in "hw_params()". Audio playback shouldn't work in this condition 
because as I mentioned "HDMI CTRL SRC"="DISABLED" by default, but 
apparently configuring the AIU_I2S_SOURCE_DESC register is enough to 
make the playback to work properly.

- After: those configurations are only set when 
"aiu_formatter_i2s_prepare" is called which happens if "I2S Formatter" 
widget is enabled. Since "HDMI CTRL SRC"="DISABLED" then "I2S Formatter" 
is not powered up and therefore its callbacks are not called and the 
playback fails.

Simply issuing the following command:
$ amixer sset 'AIU HDMI CTRL SRC' 'I2S'

resolves the problem and all pcm-tests pass.
This also explains why I didn't catch this issue before sending the v1 
series: I tested with NXP SGTL5000 codec, not the HDMI one.

# Final question

I have 2 alternative proposals for this:

- Change the default value of "HDMI CTRL SRC" so that at boot it's set 
to some working configuration (ex: "I2S"). This should be done somewhere 
in "aiu-codec-ctrl" I think.
- Run the 'amixer' command above before running ALSA tests.

Any suggestion on what's the best approach?

Thanks a lot.

-- 
Valerio


