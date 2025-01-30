Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1BCC02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKM3RWBudOMOvAAaqh0C7cledBNgLwcsgWWCL/oBsw8=; b=Ttidv8fLi4jnkt6dWenyS/cEx/
	QwkM0OGq5uBvayYKjBtjkE0js0Vy1b8IzYrj+MdiJfgDviEn+i7v4dKk6cXiM4maWLtMlrktyDUTh
	plrzFuEiTyJhiG3W6u/vdjHZFnAXT1x/YagNiOet+GMtM8P8UeNYQyIlyrUoX4xR1AhHrU4+vJSuw
	pBfM5OR+TlCU7BKO09JEdnan4nh+gODPfMIYWCInLPBCHsR8jL+cuxj2d2peEHBQKH/DjiSkO0F77
	bBNYbEPjgxJOC1MsFnEA4UbOQLii0BEzGQAYl4Ob8AAeJROiH894GHk6EHUmI0HwCsE10Nfs2CHsu
	srqcT/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYR5-00000009IBY-0x4D;
	Thu, 30 Jan 2025 17:34:39 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYP7-00000009Hys-0vBz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:32:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-385df53e559so817756f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 09:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738258355; x=1738863155; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKM3RWBudOMOvAAaqh0C7cledBNgLwcsgWWCL/oBsw8=;
        b=C+H4ZDXpfTa65eP/cs7+0DZuCtiqYsRiP4bjmgu/0jFMzjOMBCLXgft8iZt2QS3Ggl
         AJ3zgPd9ootHyQ6BHiaZZ7libMyTYYCiHIcAj12jfE3yeRNrAdF2ukdQYIEQQ/SP6w1v
         5CT8l95jebW3v/u2+aa99COcwbNXUhXkvWoiqyG5XN2xuJN1PsmKSRpf0DDLd84DlX7f
         O2Fur/fFuKewpYy8wzYPdCHT7ovG2Ps4zeB1kLn5LSIORvzaITUxi5YHy1Cw58Vekm5p
         oXZv/CCzkg+sLNI/XjPa5WTW45SnwOoVlXzbM5avA55lilx2eODoFKOC1ZgPK6a6mTMG
         okXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738258355; x=1738863155;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKM3RWBudOMOvAAaqh0C7cledBNgLwcsgWWCL/oBsw8=;
        b=viz42Zp8xrOJEeTyjy8IwbanuxeGfXujosP8Bc04P7qJsqOlkLXPeoeyoVl+OGOPXE
         lvO7yRv1rT0SjKMc6zieDo9jibmPtmBRhzNfsM3Bisn66DWnTCle+dnzoMRGZmWkGIKT
         AOZeXhzPpYEorhFUZF2F/BCXNHoUMKs0Kz9iKbQWYnTBJJ3qbFdCnUOk+wh0B5f1oWnL
         as4pa/7l/4deag5eiRLv+yTGGbsHQ7crnjQdJ0po+/zsoIeASHYtuka3pkpOWFGQYlmh
         lfKushlSS2sShJ+RpMRqDHodrV2qyAxOpI9i+fOw58NImHFrx1OVTeJt9aQe7mMQ9NwY
         8cLw==
X-Forwarded-Encrypted: i=1; AJvYcCUU62UUv7bYwyjUmLTH110mLQqbUkdcqK00vHxtWx9/BBTDfZs+zpn8v5PReyQQztV2dIXzcEnD+gsD5tk8kYQw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfziw1teX957B/df9+wfu0HmIaGhlsett2dbcUVO3/icfHqntd
	Pl0vn93pK4lYT4AOrXChOgKTVLEHaIh1zso36Ax1JXCA6dfzQhbd2+b9VbzKVVQ=
X-Gm-Gg: ASbGncsqLm6ECUt0uXkuaWtCzN6qyDkXE1/Tc9NhH/XxeCe+Oe/B1M2+JMlx/h2bVkc
	dJUIVWeoVxGD8Z0m+wkmEV7cZE3xYJjrRSSP8/sHySr7SIG40Uvvv7R4UD+p+oU61SYFgTHU1mm
	ZfoGgH8CjJXCwCZO6drHzAMvLKL0qKDNB4L3Kuzzdhj0kAl2TF/iKg7g65iFFKNmJosJQE1C8BT
	u5xpP6izQJ8PuwlCjJs4PJDU0BGKSLqiDhQCAGmiZJolhPfAxBdR53EEVj1phFI08i0HmT6ZXZ5
	ebAgm8+pay8dTC66sAVvWxs5
X-Google-Smtp-Source: AGHT+IG0JtM8ysE8yCX0gXJFKaojoUHoYmkNQfMIe/tVvsLydgMxPhUkmT/xfpvP3KXVGI9I0CFgmA==
X-Received: by 2002:a5d:6d09:0:b0:385:fae7:fe50 with SMTP id ffacd0b85a97d-38c5209128bmr6322840f8f.42.1738258355362;
        Thu, 30 Jan 2025 09:32:35 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bdbsm2538261f8f.28.2025.01.30.09.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:32:34 -0800 (PST)
Message-ID: <2d5be56d-4334-4ad3-a98b-33d3a86f028a@tuxon.dev>
Date: Thu, 30 Jan 2025 19:32:33 +0200
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
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <b496d933-3c57-4b02-ab65-0582a30939af@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093237_353583_D2DAB6BB 
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



On 30.01.2025 19:24, Daniel Lezcano wrote:
> On 30/01/2025 11:30, Claudiu Beznea wrote:
>>
>>
>> On 30.01.2025 12:07, Daniel Lezcano wrote:
>>> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>>>> Hi, Daniel,
> 
> [ ... ]
> 
>>>>> Would the IP need some cycles to capture the temperature accurately
>>>>> after the
>>>>> clock is enabled ?
>>>>
>>>> There is nothing about this mentioned about this in the HW manual of the
>>>> RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>>> - wait at least 3us after each IIO channel read
>>>> - wait at least 30us after enabling the sensor
>>>> - wait at least 50us after setting OE bit in TSU_SM
>>>>
>>>> For this I chose to have it implemented as proposed.
>>>
>>> IMO, disabling/enabling the clock between two reads through the pm
>>> runtime may
>>> not be a good thing, especially if the system enters a thermal situation
>>> where
>>> it has to mitigate.
>>>
>>> Without any testing capturing the temperatures and compare between the
>>> always-on
>>> and on/off, it is hard to say if it is true or not. Up to you to test
>>> that or
>>> not. If you think it is fine, then let's go with it.
>>
>> I tested it with and w/o the runtime PM and on/off support (so, everything
>> ON from the probe) and the reported temperature values were similar.
> 
> 
> Did you remove the roundup to 0.5°C ?

No, the roundup was present in both tested versions.

Thank you,
Claudiu

> 
> 


