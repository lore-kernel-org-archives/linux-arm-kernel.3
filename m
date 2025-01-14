Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D73E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWXRGYqIYfAFCWYGR5cc8ElnhXv1e/ZNViY5lKk/9zc=; b=I6HUARRArUSA72GeeANuLayQo4
	NWdZ+F5uxuKqHnLIYG1RhRWC/nURzv4f7nsiXBeO4rNF9ZunjHOe51TilPhZRdwxhDOj4yCsT9euD
	7AlmUeaUoYP8r/UMgKfRtT57RgsfURTxtVnNEA5/8tF+rrTjkIAg2YmjbBvM7E50vlVsdB48bdkjH
	b6j1QG3YK2EbWEfoTctgFUZ5mzk1BzqXrtqTqntMudfr5s5/9QzZ9yDtixSDzzFSOn8P2penMzWfD
	INWxwd80v+VtTxJe2W5PHwn/BE2mmdVUmL6/QGKvgNz5n51F3v+CSnRkpI2pgEncv5Zm1lIfwohRM
	aoHitDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmso-00000009Zfz-3sxB;
	Tue, 14 Jan 2025 19:47:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlgQ-00000009Qi2-3Azi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 18:30:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436341f575fso61479065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 10:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736879433; x=1737484233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWXRGYqIYfAFCWYGR5cc8ElnhXv1e/ZNViY5lKk/9zc=;
        b=h4OpJ0QwtJJ3RufE41qQ9KZWn0oy+T7Wsu5BGSjBWI69s/W8w6UrIbc63idhERcqhy
         bulctRsqu4PxnOP1eMlgJwMUOndnmHraeEqCa5LOwk8W5ENttCEzERGmdL2IYnesNuJf
         iOC2xwChcbRGtm2i+AKjKX1LiMdH5L3IrxYTzEROizm7yHzMnC/ohVnnAh/wHwY0wxAv
         FdUwmYWY0CNSo37uP4TvjRkoBMKYZ2Hh1fPtmdtgxYrDDowg4TwWEfPvjqMJJIMaDwuB
         Y/zykrE1AO/iCCCnOTrmScOjs1C3pbi0wY4RSbITCQdeYH3zZxr8uIjmMQuiV9gLHxk6
         OfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736879433; x=1737484233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWXRGYqIYfAFCWYGR5cc8ElnhXv1e/ZNViY5lKk/9zc=;
        b=ADRezpCiI0n2QSJ1PJSo7LKzMtaSV5vw1fi601/7K3E89SHPJhfWDhIoOGEC7RL1EU
         2BwHfWtdI2GaTTeAnv9aNziQheA2VDDsqvKq6e+Br1NoCobj2E6z0kd3wYeyhfkqe1Ya
         lmBB0llL1SeubKROTvopEC/pOQrOPGEXY6N5PRzvb/lmu9A/9nBhiVkt5HNkKiAs3+Wa
         Hjac8iKMp2keAQaX7XMPDL9jsLMoTvvi1bNx9MOdWRu+sozejJDcJ7SHZQwGrlysSuGy
         /v+NZieCDrcdAKhzvvlyaQfvRoC46ItWf9YcvTerX7RGHoC6rA6rMbRU2hbxpT6EGzXI
         5i/g==
X-Forwarded-Encrypted: i=1; AJvYcCXyGaWbIh+E8OUl1x8YLu5Q8jWBqA8Ce4+Lm7K1ksbO2ZvwHHIERfGweKJokJfrI0aQqG060eMotuXGC1rtoJI6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9jHzSmvd8sw9hJVmVquMxBB0ulpdc2OnllnrCVeDPcbs4JnTZ
	+2pGe65eJiBIPIG/lSFbyFanyUJ6ThM9AjEy9cfVRRBwdW67WFKYQZ7SyLveJrQ=
X-Gm-Gg: ASbGnctaKObCkdmqM1FEJkKCotM1t+Li14yI2ubbzlP1MaZ76aN/GtSY1Ts+uTyc8sO
	iSKqFLSn8v8rfF+ctgp19142oEE5JJ+zXi9ORCGsCBTX6NXajBiMEJ2oglGmGvd+Ajyfxi7IC1g
	DV68MK1kvwyTyvyNKDFsg7fkc4hLHPcwwNODbPco8kM0T909j2P8a+HiGohtJHeHs7xbxsL0QjL
	gJ/XHl2PDn0NVmkBXXanTMIQHUWXDes2tNBj48hDUC2+7A0E+1MKYLnsyigAfefpQkfvUhuxBIO
	yUceJkV6SmmDs2PGDvLM
X-Google-Smtp-Source: AGHT+IEw8eHOips+m7BEL7pSk31Buqsgjf/0/YmNKYluWgMpJRjDHqhoLciiG4fuvyVDzaS9gJVk8A==
X-Received: by 2002:a05:600c:46d2:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-436e2679db4mr237168165e9.3.1736879433323;
        Tue, 14 Jan 2025 10:30:33 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2e8bea5sm217789155e9.31.2025.01.14.10.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 10:30:32 -0800 (PST)
Message-ID: <90dd8d93-5653-47f1-8435-f03502e4c0cc@linaro.org>
Date: Tue, 14 Jan 2025 19:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/5] thermal/drivers/mediatek/lvts: Disable low
 offset IRQ for minimum threshold
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 stable@vger.kernel.org
References: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
 <20250113-mt8192-lvts-filtered-suspend-fix-v2-3-07a25200c7c6@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250113-mt8192-lvts-filtered-suspend-fix-v2-3-07a25200c7c6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_103034_803023_4B4EF67F 
X-CRM114-Status: GOOD (  12.71  )
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

On 13/01/2025 14:27, Nícolas F. R. A. Prado wrote:
> In order to get working interrupts, a low offset value needs to be
> configured. The minimum value for it is 20 Celsius, which is what is
> configured when there's no lower thermal trip (ie the thermal core
> passes -INT_MAX as low trip temperature). However, when the temperature
> gets that low and fluctuates around that value it causes an interrupt
> storm.

Is it really about an irq storm or about having a temperature threshold 
set close to the ambiant temperature. So leading to unnecessary wakeups 
as there is need for mitigation ?

> Prevent that interrupt storm by not enabling the low offset interrupt if
> the low threshold is the minimum one.

The case where the high threshold is the INT_MAX should be handled too. 
The system may have configured a thermal zone without critical trip 
points, so setting the next upper threshold will program the register 
with INT_MAX. I guess it is an undefined behavior in this case, right ?


> Cc: stable@vger.kernel.org

[ ... ]


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

