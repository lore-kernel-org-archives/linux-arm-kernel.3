Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB34AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 06:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sC8ppSX1H/0TCM/Y3FF+igzDwHvNt7j5FKY8GrjOIKg=; b=OMgNhRe0dpgralEOzZhMZ242wW
	3JzAT6AX2RTPag+SU0ebeIHUXSeyzjANinVYwCGMIMMw0jSiBUi+eyS0e7Q0c5AYHmc0D03C+sa0y
	lEzUfyPE4SZZ86KjB0PHl72x03duoxPIMJLFbOUgNVvoRk/klJ00h9/FA+qVvXRgOw0iDrfxfLKFq
	Pj5jlbIyKD2vJ4UBwRUXwGfg4S6ownVOq9PjVkw2a82KfwCA7Ig8s7XJEJypThEE4oiGpVdJLk8TH
	8+nXUCbrTJ9CPqoDyPQpnOHZt/NMM/sQQAUgvpn2JSyfX/irtvZ6zh7tLKbT0Bb9Wlo10J/bNDj3+
	psF58PaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukzsv-00000005MFc-25UK;
	Sun, 10 Aug 2025 06:50:25 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukzqO-00000005M7q-44qs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 06:47:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so5415632a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Aug 2025 23:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754808467; x=1755413267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sC8ppSX1H/0TCM/Y3FF+igzDwHvNt7j5FKY8GrjOIKg=;
        b=Y99qY1d3VM9RgB8t9zME2AgHlmsRXwB40K9lAAyG1ERhsR5l5PaVUpuCWsEZPu/q1J
         ynvBrapQGZkDc9aMSCRnoAYFjwy488UK0nfBMz5YsX/i/fAEpaD9h8ha8AYYmZgMcMRP
         Aym4oX4qSo3hV06dT//OhO4NhjBq1u+Kih3M8KaT+HRYnjnecgDwWbdHCBGhm0TeBc2X
         is/6IdcOzV6Tt5Ezptggp+PwgxKGsKuvk0vXzdmm/wCF4wWvNQiQuiK0zCPog7ARK++3
         9Ks+FEquZHeVcSAw35R3Ohfaq//+DNUJqMr1ewPUQpZQmGkPmdsFP0hEhQkIMouIdXuo
         pI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754808467; x=1755413267;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sC8ppSX1H/0TCM/Y3FF+igzDwHvNt7j5FKY8GrjOIKg=;
        b=O4/Q5HhKFbC6ud3CCBp18cds7ceikUWWGhtCTTcqRsGZn9R5Bk+dcdlg+wWjvPYn0j
         1x41fgJIzh2H/5Ww9AXR6gBJM+VvZmJH5SSpEYhWUJ09cKI2Gnoq+oB4xAcYuiPTvbym
         yMcGiyoCDhjH595W6d9OJeX/Jr5dGBJ68DydSrWWNNUgcl4+lJulQ7cT2VuTEe16fBhX
         QcRSoL4Q3Hsq1UL0sKmHrFsykn+f9R5BU8alV7j6sp2ar+kmdRrI8Q0RxCXuCKEszxNI
         p58Cii6/0lvmVSi8LBOuuopyfmL7xx8lj585/fgIq+Dt1HPPhPwIN/rhOJFIoJCPPCdA
         2aTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtJzsrSpIgoWNyo5cErqukNRSV1c0lvjUr06aObROU1XMEB+JNNmhAtvExiLw8U7Yazh86GGm2CTq+F2Ysujwg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+0DVcd7AN6wLvQ13GjNdmvNFfjhTgK1gfkWK8x0CEVmDS0esn
	1eH31BlWq5YbLNkdOZk2leNBBDFIEGcxSYDyJnpOOXKkVw2hoU8QvEfx66VSh69ERUE=
X-Gm-Gg: ASbGncttecoESr0d08v8TWvEeDaLg3HouTZjE5KKuaePtLcBpwoJdbD1y4tFzhfCtEA
	e99MFvgRMfvQOJENQd5WjXKGzeRh6C3AJQ4GZEaTfmRAJWCbcrir2B8rVGEzOS6djY0ykwWSENT
	Pc5i1iObiDSK2A8b7yFxrBHofZOO1vzf73jrBJ2ZBE/Hq3rmzNFHHH4gt4F+m5Vz+xVsBfSBLK1
	pqOcyqWB3jWNRivex80kgJWBxyaZ/n3fBl7Nutp8lrD9VK+mz+L8H4F2X7JTrvGczwglTAJxlQi
	XgYr4CqaYMl1D0lJOLWx5zfbt6urrO5bv2i5TZrvmbITSmJkqycT+4CDM7yyzt3cQDr/oITKRoN
	PaJK0eVXPG0/klLwSbI9dsqzPWbHofg0vGQ3xj99yRQ==
X-Google-Smtp-Source: AGHT+IH/7dzLzWQyWlGILSjoAFS8eflMGUJjXYYLSezW9ohIbVGYZPagLxPqBOuF4SYx6XNBcYwt7w==
X-Received: by 2002:a05:6402:51cb:b0:615:c767:5ba1 with SMTP id 4fb4d7f45d1cf-617e2b661aemr7951088a12.3.1754808467315;
        Sat, 09 Aug 2025 23:47:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8ffbdb4sm16219007a12.52.2025.08.09.23.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Aug 2025 23:47:46 -0700 (PDT)
Message-ID: <1cc60291-194d-4d8c-ad0d-f83651ba4fc5@tuxon.dev>
Date: Sun, 10 Aug 2025 09:47:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] thermal: renesas: rzg3s: Add thermal driver for
 the Renesas RZ/G3S SoC
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
 <20250324135701.179827-3-claudiu.beznea.uj@bp.renesas.com>
 <20250705120617.GA671672@ragnatech.se>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250705120617.GA671672@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_234749_015218_A627F164 
X-CRM114-Status: GOOD (  18.73  )
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

Hi, Niklas,

On 05.07.2025 15:06, Niklas Söderlund wrote:
> Hi Claudiu,
> 
> Thanks for your work. 
> 
> Sorry for late review, Geert only alerted me to the series a few days 
> ago.
> 
> On 2025-03-24 15:56:59 +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that reports
>> the junction temperature. The temperature is reported through a dedicated
>> ADC channel. Add a driver for the Renesas RZ/G3S TSU.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>

[ ...]

>> +static int rzg3s_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
>> +{
>> +	struct rzg3s_thermal_priv *priv = thermal_zone_device_priv(tz);
>> +	int ts_code_ave = 0;
>> +	int ret, val;
>> +
>> +	if (priv->mode != THERMAL_DEVICE_ENABLED)
>> +		return -EAGAIN;
>> +
>> +	for (u8 i = 0; i < TSU_READ_STEPS; i++) {
>> +		ret = iio_read_channel_raw(priv->channel, &val);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ts_code_ave += val;
>> +		/*
>> +		 * According to the HW manual (section 40.4.4 Procedure for Measuring the
>> +		 * Temperature) we need to wait here at leat 3us.
>> +		 */
>> +		usleep_range(5, 10);
>> +	}
>> +
>> +	ret = 0;
>> +	ts_code_ave = DIV_ROUND_CLOSEST(MCELSIUS(ts_code_ave), TSU_READ_STEPS);
>> +
>> +	/*
>> +	 * According to the HW manual (section 40.4.4 Procedure for Measuring the Temperature)
>> +	 * the computation formula is as follows:
>> +	 *
>> +	 * Tj = (ts_code_ave - priv->calib1) * 165 / (priv->calib0 - priv->calib1) - 40
>> +	 *
>> +	 * Convert everything to mili Celsius before applying the formula to avoid
>> +	 * losing precision.
>> +	 */
>> +
>> +	*temp = DIV_ROUND_CLOSEST((s64)(ts_code_ave - MCELSIUS(priv->calib1)) * MCELSIUS(165),
>> +				  MCELSIUS(priv->calib0 - priv->calib1)) - MCELSIUS(40);
> 
> The issue Geert points out, can that not be solved by holding off 
> converting to MCELSIUS() to after you have done the calculation?

This method works as well, but at the cost of some precision. As of my
experiments, with it there will be no temperatures with .5 Celsius
resolution (e.g., 50.5, 51.5, 52.5, etc) reported.

Thank you,
Claudiu


