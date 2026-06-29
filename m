Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4820CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTUwvNadQrvVpwtKaon11x72JePn9X3S2cEHloyT/Hw=; b=XCXcGr4Tto84xLD/DQOLydewj4
	W4VNqUToPvo6Oh0W+mUd+yKB7pZ1QObG3JFxZG9L8Uwn7i6VmlCeDkGFNWgA0R7+u3M2PKwK7LSqM
	8BEyAwx+g3ieVd9kX6uXsYzyFRCZUIDX0VSVm6mHYZdStG3xb1DdiFImEaoU7cCvzj2S7hTnofKt9
	1/oLEY/wX85zIwzwXAZD/YuK431IOHzwZpBoOJeOUxh1TSdc3RCOGZEOXg288uiw/XIomcby5y5ul
	OqNX+9xC3Y4NivfgH1i9nQyOuTmY9oxEkDCf1BoDC4qjKDQr3v7A727zZxT9gccN7R/H7byLtVLZe
	ZgLWrQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDcF-0000000F1iq-3ZMy;
	Mon, 29 Jun 2026 15:09:43 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDcD-0000000F1iL-1Qo9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:09:42 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-4488e958486so692576fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782745780; x=1783350580; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTUwvNadQrvVpwtKaon11x72JePn9X3S2cEHloyT/Hw=;
        b=Z8KoK9FoJUDt3aK0onwCaoQ2uJkwZYb7wHqUQ5b4zhmsci1E4tRjQ/fjfRqQ5UIyQ0
         TNvlct1+zltgBLoI9KF3doHOGFn2ywvHgwa6UC6ZqD71VTQY6Usf02ilvLE5qDkEX9+j
         NnqJKirvwC4M294CWLj2615E9erYFmoVcvcFj1v52d33SbqC2yxMeVMB0WAves5R9V9Q
         +WDKZAyImZltyGuBt/DKTfvc9LY+GpsBUPd0u0pqxYCpqIcslUiqBLYwPYtBXS4eL/yQ
         tpd6dN7YyVV9OVR4vcWViZMUfBrU10YQRdfJjr6OLCK2ofgDvuTcYdTs8EegqcBNRA9i
         jQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745780; x=1783350580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTUwvNadQrvVpwtKaon11x72JePn9X3S2cEHloyT/Hw=;
        b=FmmmwqHTwdgb4xpk1iHT37nbEhoEeXqKeQNg/6AxtJjB+tmlbqNQe6315LNEGFmlkx
         GfI8xBYRhNe91fSZndrDoUMYB2h5YfvABuMKjCunJ2mMMZ9SBKd2g4NiMtdjRQtqpXpI
         daMlfRHHl6yQAEzYt09VnSCv3OSbenuKgO5+r9F9uSyKs4fpfpIto6wdjYiDmNaezy6E
         iy450GGNZHc4mkjssYB5RAHSOK6rjr5BnNPbPHawrdPVuj0b4wPrvvQ7Kvs/XptxXaoY
         fusps9gOxnId29ZbWqTu1m3P5n1WY9c82BdQx7rFTP/PiABhGGRuhwyumc2Djdegs9lo
         9OGw==
X-Forwarded-Encrypted: i=1; AHgh+Rpi9NR1bSqeQFkHRiKEUloCpE4CNBQ65Lwo5f0rP8H2vVd/6ZYgdvzXO8MLofDHUEkA/ulZMp/XU6GU7OejSRae@lists.infradead.org
X-Gm-Message-State: AOJu0YzQWR8qBps8iyLbKBqJn+LWTgAjiB6PLTgFFbHOePn31cP6OTNj
	9Ute3j8+9o4vXWbd8xgBGCl1ltnRVlQ0pLl+DjKQZC2TykT77AuvV785zXDOREJPXRI=
X-Gm-Gg: AfdE7cnj26DGufLHXeymT5oC3VhbZZyesy4TSjR0u4B/Y4WBQJ370/4Ad7wbUN3e1ZZ
	hilu2ST6F+S6kUdJZNh8NTfc8eST7eltTXGBet60j/lmS28vCoKNWpJiYMaKG5w1sX4HpO6/M6G
	45/df3kKRASZGIoNRvlFALCcZeUMAySW7G3H2t0RUfECCiMYRyDh7igJxo6IBEnTJcTC0tJ0wyC
	0e9k1Wl3c8bf4TPd6FVtbPFWlP7gdymdPVP2IvzmBfTNdl1qtBI45jWFjTPuy/CrvJsgUL46FuB
	sXojuBvd8ghEOhAadPulko55U6GNLTQhsPi9w0OcX4cmQq86KvaZRKj1vHaZmeZK+4urjiAejKP
	qp8cl6pAQiwEjlsDU+z55fXDyV4AIGr2P0UeKR9OISy4rYh3yj+qvfHOaXSkmv/duXGwqSFBDnL
	WlUP3zuCk2xIshqvdQCOiEG+SPmhYUIJRsnHEUHcOAP1qQuFjNDxiTS7W/Dy8MNtQ=
X-Received: by 2002:a05:6870:830a:b0:439:a524:a29d with SMTP id 586e51a60fabf-4484e87cee4mr7386130fac.1.1782745780245;
        Mon, 29 Jun 2026 08:09:40 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448dbee3badsm19615fac.12.2026.06.29.08.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:09:39 -0700 (PDT)
Message-ID: <f759ad9b-56ef-482a-9389-85ea1e3fd7d3@baylibre.com>
Date: Mon, 29 Jun 2026 10:09:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Chi-Wen Weng <cwweng.linux@gmail.com>, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-3-cwweng.linux@gmail.com>
 <66ad5723-6589-473a-91da-b13e2ba90aeb@baylibre.com>
 <5e65eabd-699b-4587-bb38-d8ef5c6d2aaa@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <5e65eabd-699b-4587-bb38-d8ef5c6d2aaa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_080941_385055_0CA60FB6 
X-CRM114-Status: GOOD (  23.19  )
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

On 6/29/26 2:32 AM, Chi-Wen Weng wrote:
> Hi David,
> 
> Thanks for the detailed review.
> 
> After looking at your comments and the other review feedback, I plan to
> simplify v2 and limit the initial upstream driver to direct raw reads for
> the external single-ended ADC channels.
> 
> In v2, I will drop the triggered buffer support, the device trigger and
> the differential channel support for now. Buffered capture and
> differential inputs can be added later as follow-up patches once the
> scan sequencing, trigger model and differential pair constraints are
> handled properly.

This is a simple/small enough driver that it would be fine to still
keep all of those features in v2. It would still be fine to split
them into separate patches, but you could still send them all as
a single patch series.

> 
> This also means that the scan buffer layout comments will no longer
> apply to v2, since the triggered-buffer path will be removed from the
> initial submission.
> 
> I will address the other driver comments in v2:
> - drop the unused struct device pointer,
> - remove the triggered-buffer and trigger-related Kconfig selects,
> - switch the register access helpers to regmap,
> - avoid forcing the external reference path unconditionally,
> - add optional vref-supply handling,
> - add IIO_CHAN_INFO_SCALE based on the selected reference source,
> - use the internal reference when no vref-supply is provided,
> - add a named macro for the sample-time field,
> - drop the unused channel address field,
> - drop datasheet_name from the initial driver,
> - use device_for_each_child_node_scoped(),
> - use devm_mutex_init(),
> - keep only INDIO_DIRECT_MODE for the initial driver.
> 
> For the firmware-described channels, v2 will only accept the external
> ADC input channels 0 to 7. The internal VBAT channel and differential
> inputs will not be described or exposed by the initial driver.
> 
> Thanks,
> Chi-Wen
> 
> David Lechner 於 2026/6/28 上午 04:52 寫道:
>> On 6/25/26 6:06 AM, Chi-Wen Weng wrote:
>>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>>
>>> Add an IIO driver for the Nuvoton MA35D1 Enhanced ADC controller.
>>>
For future reference, please don't top-post, but rather put your
reply inline like this and trim any irrelevant context.


