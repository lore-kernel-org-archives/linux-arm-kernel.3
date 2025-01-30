Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E76C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 20:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ec98s6sSsx0UR0Kfm0pnIvUMmPvbuc2qUG4lSwDUwKQ=; b=rfoYXv6wTVv7LoRTLHnmDOB3mq
	tDHL9nwEoNJ2GjFCHFhnhyYIIVRr5IKzHt7wen2vt8Jf8iMTEBLZquAgwLA6WulhacmKR49hanBZL
	efE0PvW8FveuZL+x9NZ/2nGmXOSJKxdRCzIxdXnY+0k+bYGUpNqpAaKkAVXLjWzM821s1g5nKyLgk
	YrtRblpm4Tz+ldwuYSs6go4cT1ijPMZvt1GaKge0ispTL9ex8bbNZK7oH63rDbbr+uVwWa6FdMYKQ
	eqhSI8VElJI0iHtcDtdqVnCTWBKGTJ1NDZgcbHjCEBdfEDg+7I2atRpUBL2aaGc4NWCWsTospQWMe
	blG/cfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdbYl-00000009bAy-3ZVe;
	Thu, 30 Jan 2025 20:54:47 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdbXS-00000009b7I-24Rt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 20:53:27 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so1176102f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 12:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738270405; x=1738875205; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ec98s6sSsx0UR0Kfm0pnIvUMmPvbuc2qUG4lSwDUwKQ=;
        b=liFhUgz3WdauxayBJAw9jCcVWFZUgmruB74YcORC5pmKWgeUWwtexjbakMHWswewGi
         7WmbcRoHfaDt/EQwf60DVbDFKv3f4MI6r+yseAxxUA7jcf5T7/fF8LpN8DK9JGzz2V5h
         d56tqVGboTRSXVuE/I5q9xDwYVD5mkNpJ1Lzos0YAduYnkp3yZy/i750GfbrFulYrdYR
         ceSAwIh13cU4tgZ7YxvUMbyGnm9tkOgwO8S7OgX9pk+dsjs30pd8cD04TtOEzz90Inc8
         ViPFAEWtK6ZJH4Jj3Or7FthwAQ6j5sBztXgdiiVdY+NQeebRjFniAV6Z8X0SLgXcf3Ur
         tDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738270405; x=1738875205;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ec98s6sSsx0UR0Kfm0pnIvUMmPvbuc2qUG4lSwDUwKQ=;
        b=HQ/saFKGIC0AhRRC6y5TXPe42hwwvKjLu93EumY3xKU86cgF5DZVvrizYbEA++hSHd
         xneN87cZOF4pbjSva5LPaS3PhcWOyAirg2DcvDiX4nyQ8IoF2p8TKNG9MCvXq/WIgCJg
         EJTwoqVrJhquL3/dhMdCzqs20RB3tI5BXbWStSVgDtWgdy0EfmW+gfP8IE18izHSdZdT
         +ctOqWTc8N2oyEV+zrXGMndl6+QRkAI471++svWXjP5C93Em8hklkWinlGubGG0xsYgV
         VR1YQOB2LzocfZmlT26zy+JGvihlOb6hBdjY/Q1bOTpU15Nd6YLv1xl1WD31mm8qOYT3
         Plgw==
X-Forwarded-Encrypted: i=1; AJvYcCXUGjO0Xsaz6yghLKq96oYIfZ5HHrABTlv+iFTGvsXXnitq3/FMEAtBl3fdV0zcmsGSxbBx5K8WZUuG0B/hPoCp@lists.infradead.org
X-Gm-Message-State: AOJu0YyntbySIdNpf8AEBZlMYcrDSRqPutLvSzPWPimKm/D0oDQ+2xFH
	Q6FpXLMXyGdZWFi8o7+AD+vRtKGwyq/56fhH9GLrLvOQQW0mfAZ9oaVMhMz4fXU=
X-Gm-Gg: ASbGncs+Ir7lfJNSSSMgE/9zE6mrVF0wesZFgJeqo3SpAG8SQv9Bq3FM0YwdUpZE8EL
	81/QLHxlc/sPjwynRQZMCwNu8w7VzCi/EG8r3z70bHQBXfA/2F4oHqyGiROzZnJz+LtWdX8zn+N
	ROy3onDY8O43ko40vJxBseWaYHxMW3pdBWczcnMiOL0zfagOTHb6KIAc5hjNBFAnozXMQpHK/Db
	LCpKdLimTlMtie0ESNBk3nRnIul1d31h/biG8Ve2OZTSNQKXm/Ow6GRvy1UklkD5xKSZWpXRJBx
	xKHPk58uwIG8FP5FTMedUj9p
X-Google-Smtp-Source: AGHT+IF/6O8ZXA61LdSg0FqUiKKK/7fHOXHRr8I9s7+f0jQYC6+kW2kgrBrfA1n9/pzq79turnK8vQ==
X-Received: by 2002:adf:e591:0:b0:385:fb56:5596 with SMTP id ffacd0b85a97d-38c51944328mr4917084f8f.19.1738270404698;
        Thu, 30 Jan 2025 12:53:24 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b51e1sm2946779f8f.77.2025.01.30.12.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 12:53:24 -0800 (PST)
Message-ID: <98ddf1b6-1804-4116-b4e2-f54a62c27966@tuxon.dev>
Date: Thu, 30 Jan 2025 22:53:22 +0200
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
X-CRM114-CacheID: sfid-20250130_125326_538849_3DB7B2CC 
X-CRM114-Status: GOOD (  18.31  )
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

I did the testing as suggested and, this time, collected results and
compared side by side. I read the temperature for 10 minutes, 60 seconds
after the Linux prompt showed up. There is, indeed, a slight difference b/w
the 2 cases.

When the runtime PM doesn't touch the clocks on read the reported
temperature varies b/w 53-54 degrees while when the runtime PM
enables/disables the clocks a single read reported 55 degrees, the rest
reported 54 degrees.

I plotted the results side by side here:
https://i2.paste.pics/f07eaeddc2ccc3c6695fe5056b52f4a2.png?trs=0a0eaab99bb59ebcb10051eb298f437c7cd50c16437a87392aebc16cd9013e18&rand=vWXm2VTrbt

Please let me know how do you consider it.

Thank you,
Claudiu

> 
> 


