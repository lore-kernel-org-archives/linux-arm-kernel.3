Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F34AD6C29B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 21:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkxeQUfNljLvLRiRZhalC+n4lyNit8qK2o0nRa/RK2k=; b=FbnH1xK9aYhxRLowdYjGgGtI8i
	YK2JVYR9TXMJjS/5Qy2ykLmzZTjsKc1bWs3uYgVMJiJ6AJdL8bDEvHeKrTZ75nPyjoj3eGZK9u6hz
	oZIUySL+IrwcjDjA0X93ADsHKtjWpLR+JY3wMIdKQuGdFaAF1zkFAp8XyzeSAM4ZDw7nneIaAYJ7F
	wdPNYM4ABCI6sNww7Xj9rADyG9gjsiUlR+kNPj+HlL7J1HUZV+kI+1whmViRguYqakRXMSxdJljVK
	dOWYINXsv/gf/Visue2T91emyG11ARSxERVPEgPNf+pXeXVIpgrcBaLbpd9QuEqKYSlhp5qSdd04E
	PKsNqCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVyn-0000000Dpcr-0JrC;
	Tue, 19 Nov 2024 21:41:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVxq-0000000DpW4-1gjK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 21:40:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3823eaad37aso145758f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 13:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732052448; x=1732657248; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lkxeQUfNljLvLRiRZhalC+n4lyNit8qK2o0nRa/RK2k=;
        b=cLWkZPxdJRGJJ9m/iINzIfYMd8Y7fa05fWg2cuBOoj0b1T/SfTynhxDuryyrGL2R8i
         EZTUA8nnFVXvQhDo18rzU4UCb+qm57XJD1QdycI0whxUQ4RG0e4CPTSg3Dcr78ojoWBU
         HmJaLW7XJrDDKLC1PUGrKh9x2NTd1WsadARSDdw8lLGN+1Qj2MPNEaBAsWfKrOCWPq+8
         dOnUEOClXyFgeOB4ZtBgVRUT3v6Lfdm8gHauZ2z2ClymnqlE9PGrpgq6HaV3daGKxIPO
         qqIwPPZ/CAC3833GQh9uA9nF96DjLP9456Gcp6OeC796eusgDh5cBBV/cIA0a4KmBZHE
         fQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732052448; x=1732657248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lkxeQUfNljLvLRiRZhalC+n4lyNit8qK2o0nRa/RK2k=;
        b=AxpN8KTAnQGT6b1tYRDm8fvTNCQsbb1o5b9QFEMklBFpvMfwUnDOCtSB9HmE+UGEyj
         Ad37xi1XcNgWAlniCQKwmXbuwooyRI9W0G7Y3F1UwevUamGAbIgIF4qvM62Hw8o7FPMv
         Vm4s+rFnFUGrXRbuO/yS5rMnLuozhTS2rhcGuoFvFqCllQIxz/BiaCc7IYyf1rzLuy0x
         trJvnWrIkk1E2dcR5GRYqzOZm2Yr/bknxxbSbei7m3exdwtyo7JWu3pByfW2iz0uW9tZ
         8TdCobcULcoc3E0dkEraaYYBKGEp4f1H3HjmizX60tV7KfIw4gkKP9IvknsMngdAum6M
         sGzg==
X-Forwarded-Encrypted: i=1; AJvYcCV69RFXHtFolV8DaRxeUuzvIU7gKih7qzbSivmq9YP8IFDiETPpVqqCDdKeRkhKBn2R6st6J2EeDwqq0Nt7UeWh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3YnxLx0/Gd4E5sWs5jpWdbYNEB/hkbl8GVE+iDuyCVAavDX5B
	kIs8B9gPyHmoSjKmGWOOOWEgt+M9p1TcGZNkvD9xubVb9gG3WLEojgPy/34CrX4=
X-Google-Smtp-Source: AGHT+IG6bv5/VShXyjrdqEjy+T/UO+kLOX7JIB5cP3VCGPfmzISuivqKLJjNxAIIX4ocGdqh24oTtw==
X-Received: by 2002:a5d:5f91:0:b0:37d:47eb:b586 with SMTP id ffacd0b85a97d-3824cb30e45mr4340383f8f.4.1732052447252;
        Tue, 19 Nov 2024 13:40:47 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-382549055f2sm366236f8f.16.2024.11.19.13.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 13:40:46 -0800 (PST)
Message-ID: <cfca677b-bc74-49bb-a031-6f52629edd2b@linaro.org>
Date: Tue, 19 Nov 2024 22:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14] thermal/drivers/mediatek/auxadc_thermal: expose all
 thermal sensors
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 James Lo <james.lo@mediatek.com>, Michael Kao <michael.kao@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Ben Tseng <ben.tseng@mediatek.com>
References: <20241025-auxadc_thermal-v14-1-96ab5b60c02e@chromium.org>
 <5dd2d2a3-6eff-45fb-8af8-593945235dd3@linaro.org>
 <CAHc4DNKSsrdSjqunhk+oyWw_+oKY9BgzPcqag5QrmLJqjVsE1Q@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAHc4DNKSsrdSjqunhk+oyWw_+oKY9BgzPcqag5QrmLJqjVsE1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_134050_449668_8B67D283 
X-CRM114-Status: GOOD (  21.59  )
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

On 19/11/2024 08:38, Hsin-Te Yuan wrote:
> On Fri, Nov 15, 2024 at 12:48 AM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>>
>> Hi,
>>
>> On 25/10/2024 14:05, Hsin-Te Yuan wrote:
>>> From: James Lo <james.lo@mediatek.com>
>>>
>>> Previously, the driver only supported reading the temperature from all
>>> sensors and returning the maximum value. This update adds another
>>> get_temp ops to support reading the temperature from each sensor
>>> separately.
>>>
>>> Especially, some thermal zones registered by this patch are needed by
>>> MT8183 since those thermal zones are necessary for mtk-svs driver.
>>
>> The DT for the mt8183 describes the sensor id = 0 as the CPU. On this,
>> there is a cooling device with trip points.
>>
>> The driver registers the id=0 as an aggregator for the sensors which
>> overloads the CPU thermal zone above.
>>
>> Why do you need to aggregate all the sensors to retrieve the max value ?
>>
>> They are all contributing differently to the heat and they should be
>> tied with their proper cooling device.
>>
>> I don't think the thermal configuration is correct and I suggest to fix
>> this aggregator by removing it.
>>
>>
>>
>   As far as I know the thermal design of Mediatek's board is based on
> the highest temperature of the whole board. Also, removing the
> aggregator will break all the boards using this driver.

AFAICT, it is not a thermal design but a thermal configuration.

What is the rational of using power numbers related to the CPU but 
aggregate all temperatures as an input to the governor ?

And for example, the mt8173 has 4 banks and 4 sensors per banks, so 16 
sensors. And they are all grouped together under the thermal zone 
"cpu-thermal" with the cpu cooling device.

So if the GPU is getting hot, we cool down the CPU ?


> By the way, I heard that baylibre is working on multi-sensor
> aggregation support, which can be the alternative solution for the
> aggregator in this driver, but that should be another story and is
> unrelated to this patch.

Right.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

