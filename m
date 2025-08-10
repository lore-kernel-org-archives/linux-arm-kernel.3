Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0671C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 06:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enK6t5KGIg+LruZrfThBHUu3Mt7qcO2z+leeT+ugu7M=; b=Kcumcb2ofcaib7RKEp47RCACN7
	/vKSQZbel/DX86lYY9flMkE5Kq3N+AccoEPza4lGpJPJ+ymjvySo/X9Z4kyM6F/uc1cah4e35/2Q4
	mlcRIZbuizrb9ZuTSGU9xuDLdEv9z4LSvCUhx1JK3ElCe3k2kvrmHrL0Xu7vjmvhlT+N/T+LibZAo
	5OfFVpjnJNuyV9W/rM1IxjpnI0xVQ2TwU6Z2uTyFruHNP3bnt+IpAYEMW9Zueu/OUqe7tbjhiN8nU
	nJBKvREQHTRMohaM8T3/6kRJfdSFrdu78wB+g3xXbcM1NnTwNSkOT8K4eeRR6J6RFiE2Ecq92YKhk
	tr9g8RvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukzhg-00000005Lfe-0VsD;
	Sun, 10 Aug 2025 06:38:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukzf9-00000005LYK-1z8h
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 06:36:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so3624608f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Aug 2025 23:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754807769; x=1755412569; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=enK6t5KGIg+LruZrfThBHUu3Mt7qcO2z+leeT+ugu7M=;
        b=YVM0GZHlV29B9Nirt4ZVb4kn2A3+Hpdl2p+Z/MMximbQFeazfBo+qRJlhIHIks+UTU
         sA9la7sHppXzAXCaWLVxAawbAom8UqNr5URmZM/IVY4VDkL/kTMpt/eNhLhU+ztmWupI
         Ja3atNO9jW518srvblPat8k9M8MojvMq9s7EqkAsiE/ZeFW+Ybi6hArxqiSrKL2Ufqpx
         50rNlSmJPFTw5ewefcOa9LcbNYZ3Ff6d3+MqgAFY0tSxqzSy7XzIl/f+9inH1hck1eeE
         OrnJcLjQBpvMbQ57KxlrjKCOlhgUwGwzndOq9M9OshmEqzApce9tT0VLsa838PgP6HZU
         vQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754807769; x=1755412569;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enK6t5KGIg+LruZrfThBHUu3Mt7qcO2z+leeT+ugu7M=;
        b=bivfhGEsFNlb0JejTBNkwGxUbbhhernAUmgyETHnigCV5mYMvT1kgqyrjKuoLsqTKG
         F/h6oG0Uua9WEwSPDfwnHm/b1P0c2mkvHN+RX7rULwRHlBTjEndSSmZVv1wCYoVAmaD2
         xkLVgu43n5smL/2GhBHPyaftXClB/QHqUdasaQwlh356nAW3CnK7qgCTe3rm9hOyq1Ga
         qDzyQLDQsM6WEA86OzvvhsM4REqKsnsCiDxXXtRIUFBJkBbgutOCahUK+pqiqgcSyhZ6
         eSkMQTgMCrl1Jf+wG4Ft45f7d7Tq+sq13p+uGZ28HD7tHh9hZ1C7WnurBTvV0xgzUE5g
         bEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/6b00GMovmVh6dv7Cqw3WuQ7H7I/IrqQ2Z/xXdnggJ7BkKoLw7JGz/bOCUOpQ116Qdo/x3tHXICl3nCIgmaIK@lists.infradead.org
X-Gm-Message-State: AOJu0YwugoxbxMt9XhFpwmsq1xaG7sX7P36ilmjWRglOIeahRDzlEhM/
	+H61MLS0wHmXrzq3RgIAcKB2I/4zXJORuD/FykRduG8Q2SJkmihKR/MVKcPRPfqxQIs=
X-Gm-Gg: ASbGncuWwnnfZzi98Y/x0yEyDxSQCncia1FDoVfNUceklpsDWRl4tfz88MxBHor9b5N
	r8ElSvQbmizRJexq7I5CciKk22B51dEYjCFoU5UbyAdZ70HqSaNF3hs36tcLsQdPaszn9z4eNmP
	ie3qwfojgwH9XvzxP5YKYGjQIoMOaUzFoHPpsYjMKcLtX8Z9xIcAkJdsD8qSbqq59UHaSOX2l73
	PV5eHvRKbEvI93gZprFruSG2y29kHsu6rZdpVSqBYljnChzWIw8l1ZGIWees9g6t2VX75yPwXyx
	iPpslPzDc08kL6AyrSaIynU9Y6TcDbGew+XPOVxnixKYAUvXbp9jJnpGCkZIgyUjM7xlqL7OXGt
	sKctejl7ZIdP/f+N6HUts9EvHHQoJjt4oKLgAyUgg/g==
X-Google-Smtp-Source: AGHT+IHmNQ00RBKMICMOm289G3m3lvi/tK0YBzD0KPkGdwuOB4ix5SW7xxWMXMIQt9BAVjaFLPdtNA==
X-Received: by 2002:a05:6000:420b:b0:3b7:9b58:5b53 with SMTP id ffacd0b85a97d-3b900b78614mr7383299f8f.45.1754807769119;
        Sat, 09 Aug 2025 23:36:09 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b95f4sm36052015f8f.23.2025.08.09.23.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Aug 2025 23:36:08 -0700 (PDT)
Message-ID: <8963764e-0948-4f11-a907-de74b0f8ba3b@tuxon.dev>
Date: Sun, 10 Aug 2025 09:36:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] thermal: renesas: rzg3s: Add thermal driver for
 the Renesas RZ/G3S SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
 <20250324135701.179827-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUUNFo4pqbXh1xMatsv7T7cnq0SmDxM_o9em0=gpurdCA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdUUNFo4pqbXh1xMatsv7T7cnq0SmDxM_o9em0=gpurdCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_233611_650052_9F998CF2 
X-CRM114-Status: GOOD (  31.75  )
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

Hi, Geert,

On 26.03.2025 15:26, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, 24 Mar 2025 at 14:57, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that reports
>> the junction temperature. The temperature is reported through a dedicated
>> ADC channel. Add a driver for the Renesas RZ/G3S TSU.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - drop the runtime resume/suspend from rzg3s_thermal_get_temp(); this
>>   is not needed as the temperature is read with ADC
>> - opened the devres group id in rzg3s_thermal_probe() and rename
>>   previsouly rzg3s_thermal_probe() to rzg3s_thermal_probe_helper(), to
>>   have simpler code; this approach was suggested by Jonathan in [1];
>>   as there is no positive feedback for the generic solution [2] this
>>   looks currently the best approach
> 
> Thanks for the update!
> 
>> --- /dev/null
>> +++ b/drivers/thermal/renesas/rzg3s_thermal.c
> 
>> +static int rzg3s_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
>> +{
>> +       struct rzg3s_thermal_priv *priv = thermal_zone_device_priv(tz);
>> +       int ts_code_ave = 0;
>> +       int ret, val;
>> +
>> +       if (priv->mode != THERMAL_DEVICE_ENABLED)
>> +               return -EAGAIN;
>> +
>> +       for (u8 i = 0; i < TSU_READ_STEPS; i++) {
>> +               ret = iio_read_channel_raw(priv->channel, &val);
>> +               if (ret < 0)
>> +                       return ret;
>> +
>> +               ts_code_ave += val;
>> +               /*
>> +                * According to the HW manual (section 40.4.4 Procedure for Measuring the
>> +                * Temperature) we need to wait here at leat 3us.
>> +                */
>> +               usleep_range(5, 10);
>> +       }
>> +
>> +       ret = 0;
>> +       ts_code_ave = DIV_ROUND_CLOSEST(MCELSIUS(ts_code_ave), TSU_READ_STEPS);
>> +
>> +       /*
>> +        * According to the HW manual (section 40.4.4 Procedure for Measuring the Temperature)
>> +        * the computation formula is as follows:
>> +        *
>> +        * Tj = (ts_code_ave - priv->calib1) * 165 / (priv->calib0 - priv->calib1) - 40
>> +        *
>> +        * Convert everything to mili Celsius before applying the formula to avoid
> 
> milli
> 
>> +        * losing precision.
>> +        */
>> +
>> +       *temp = DIV_ROUND_CLOSEST((s64)(ts_code_ave - MCELSIUS(priv->calib1)) * MCELSIUS(165),
>> +                                 MCELSIUS(priv->calib0 - priv->calib1)) - MCELSIUS(40);
> 
> This is a 64-by-32 division. When compile-testing on arm32:
> 
> rzg3s_thermal.c:(.text+0x330): undefined reference to `__aeabi_ldivmod'

Thank you for reporting this! I'll switch to div_s64().

Claudiu

> 
>> +
>> +       /* Report it in mili degrees Celsius and round it up to 0.5 degrees Celsius. */
> 
> milli
> 
> 
>> +       *temp = roundup(*temp, 500);
>> +
>> +       return ret;
>> +}
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


