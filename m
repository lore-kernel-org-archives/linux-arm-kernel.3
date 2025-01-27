Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37655C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBqjoTrsUdniKM56G4qXF9X4Og44OEoMJTzifBY6c9E=; b=u7mEkABGcUSeaZhYTzBMcws7eD
	/0PmQ3ypAZY/8LvSPmob2u7rdSWWQuTKt6PKNMDJ4W/h9Id/b66Z5xMOXkjL5X4hCiFXLItgse87A
	+JDzUQ8/BSqtlWfj9i/KYxK1dy31d/ygLM6vSaxfv/lPAAi9JUmusJ5wdXYHsx05ysuvz4jC2o/am
	/zK3xRsSsvpt5H8OIpTDeZSQknVc9au4RhctayWAz99Fq30AI0fVxDApyokhUK8oRZzr8D5hgZv4N
	N5Yl4n7mKjyb/tryiM6RsGNfbmXgE8+jHWhX+6YAaR26mEuxd4In9Hd3mOJN7F1QmKHnshc/RgDUO
	14TsO+sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLF4-00000001yoz-22Ve;
	Mon, 27 Jan 2025 09:17:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLDm-00000001ylA-1ITG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:15:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso28860945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 01:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737969353; x=1738574153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QBqjoTrsUdniKM56G4qXF9X4Og44OEoMJTzifBY6c9E=;
        b=Re8eda8ks3FD8wiyT8OFljBa68FZntscXozwEjw1QmZBNZXYNZQ7/SQYo7kJaI5ZMx
         YpyLn4TAK6w62yuDB9IM9UmHTjNkBiUE2pyVBCMePaDM6gGtLjmf2Ty2jD1weU1uccgm
         EAPEsEHBI/hBNVTH9Zh2n5qf2w/S+7vhE1KrccERdjiuqTQtHeXj2ilD8XOE/jWclcil
         /0y2T+pI1rYJpAX7D2cYwwtCi3agsxQF02hTclLYrwkSnBfc2ghALEAO2nVm4G0Vg1OI
         AszHD5CXINLaUFSKZnEwVBbQD8CL7KrdOw5x2wBMNTJhLwjExYoNCOWlGGdous3SWVjI
         4rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737969353; x=1738574153;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBqjoTrsUdniKM56G4qXF9X4Og44OEoMJTzifBY6c9E=;
        b=Y8m8LX7Iiy71BR+KfWeEgigrUQUrMB5yMRFa16jnbt7Z8+y0deRyCuyLDDHIFu4o4R
         jNsNGsGcoOSK7o6E3AHLitYcOD9sIzd/g8BkXF6uGE/BGtVPUXeMH1gJFnQdl2IsctWP
         /OqO05Nri3GFmVNiV+HNygOS3NwB2OGpe++Y5+11gVmRtHAWUHXX8RxkXB3NwpkJw2ez
         cPTn4ZPS4k1+JWMtKe6ITBY2g//AITX7yMsESRqTwlkvqqXi3X0Z+Ot0TxxEK6S6QqVJ
         r3TJxYJROjVQ4W9ovRyQIw/AkyjqjIZDXad8tT6aGEjEx3dd1S6bDkbFLcfpL9ILK8va
         qK4g==
X-Forwarded-Encrypted: i=1; AJvYcCWc/iaH8nD4SBd4p7we/mkAKnCFNPrw8GxgBCEDgr9P//pPzb3hI8DPP5zG1ewCl+AazLgRzn9EphfryJvdlp3q@lists.infradead.org
X-Gm-Message-State: AOJu0YydoKQ7SOMfNmjdk68ismORy5LJZCiR/18F20TYt9Hqd/7uYvwA
	PA1my2mtguYNFfONNO0LuXClwXqT74FtyBlLHOowBZBk2FR5h2KjMAdmCQm8cBw=
X-Gm-Gg: ASbGnct32LTKWQqN/4e6xI+mdkYTjMJp+VJM3fP0747tcwswC8Oclo3GVnCcXF3oyvk
	MFcYW44yzFcFfMaq8BYif5UwBtLQG5bWjjhJ5f9kNbcbbl5mD2fVM9RAK4jYl2WE4SlUmgxIjOK
	gYqarmhxHJcT2r43YsfyyznwDRvVJ91kuZdd36ySo7KlXmIunkU435xo5CbW0smJwA+0/5qCOty
	8cUxtq8E5eWT+4PShr23rUmXZ0TxsU5SYHQHV71Yv/pXKQgrl0NjMSPvAsyq0ukpfqO18OCTJnw
	gGzqFUjLre/H
X-Google-Smtp-Source: AGHT+IGH2u1eK/B2vFgK4fpD5Gq2Q6iaPMn6CotExrSV6h3jJObH/bOJSe5pLBi065ce7RjDuJEklA==
X-Received: by 2002:a05:600c:4710:b0:434:a59c:43c6 with SMTP id 5b1f17b1804b1-43891451388mr301531235e9.26.1737969352480;
        Mon, 27 Jan 2025 01:15:52 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd502007sm123494365e9.14.2025.01.27.01.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 01:15:51 -0800 (PST)
Message-ID: <3efa204f-ed98-42a4-a708-828bcf1f976a@tuxon.dev>
Date: Mon, 27 Jan 2025 11:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the
 Renesas RZ/G3S SoC
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Cameron <jic23@kernel.org>, "rafael@kernel.org"
 <rafael@kernel.org>, "daniel.lezcano@linaro.org"
 <daniel.lezcano@linaro.org>, "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUDKFRsZWsZG9DY4PHdxQEDoPqzfeRx8MNTreOpxdLvpw@mail.gmail.com>
 <20250125121826.6abbe7de@jic23-huawei>
 <3c7f5a92-254c-4ce1-9813-80c98c1f549e@tuxon.dev>
 <CAMuHMdUPPTyuJuWDEuHFT8EQCTVpy5=UtDh9GajdWUvZBNqy0g@mail.gmail.com>
 <TY3PR01MB113465C742C78714F7BC09D5786EC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113465C742C78714F7BC09D5786EC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_011554_352457_6C5C9ADF 
X-CRM114-Status: GOOD (  16.19  )
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

Hi, Biju,

On 27.01.2025 11:11, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Geert Uytterhoeven <geert@linux-m68k.org>
>> Sent: 27 January 2025 08:55
>> Subject: Re: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC
>>
>> Hi Claudiu,
>>
>> On Mon, 27 Jan 2025 at 09:33, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>> On 25.01.2025 14:18, Jonathan Cameron wrote:
>>>> On Wed, 22 Jan 2025 11:29:19 +0100
>>>> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>> On Fri, Jan 3, 2025 at 5:38 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that
>>>>>> reports the junction temperature. The temperature is reported
>>>>>> through a dedicated ADC channel. Add a driver for the Renesas RZ/G3S TSU.
>>>>>>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> Thanks for your patch!
>>>>>
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/thermal/renesas/rzg3s_thermal.c
>>>>>
>>>>>> +static int rzg3s_thermal_probe(struct platform_device *pdev) {
>>>>>> +       struct rzg3s_thermal_priv *priv;
>>>>>> +       struct device *dev = &pdev->dev;
>>>>>> +       int ret;
>>>>>> +
>>>>>> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>>>>> +       if (!priv)
>>>>>> +               return -ENOMEM;
>>>>>> +
>>>>>> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
>>>>>> +       if (IS_ERR(priv->base))
>>>>>> +               return PTR_ERR(priv->base);
>>>>>> +
>>>>>> +       priv->channel = devm_iio_channel_get(dev, "tsu");
>>>>>
>>>>> Given there's only a single IIO channel, you could pass NULL
>>>>> instead of the name, and drop "io-channel-names" from the DT bindings.
>>>>> I don't know what's the IIO policy w.r.t. unnamed channels, though.
>>>>
>>>> It's supported, so fine as long as no future additional names show up.
>>>> Will just fallback to index 0 I think.
>>>
>>> If everyone agrees, I would keep the name, too, to avoid complications
>>> in case this IP variant will be extended on future SoCs.
> 
> If you are planning to extend this driver to other SoCs then may be update

I don't plan to extend it. My point here was to keep the driver as is for
any possible future extensions that might arise.

Thank you,
Claudiu

> KConfig with dependency on ARCH_RENESAS? see [1]
> 
> [1] https://lore.kernel.org/linux-renesas-soc/20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin/
> 
> Cheers,
> Biju


