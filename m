Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F078DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyeDfNgF8wSUnxJsK4c0ibCBKb5iWxSmVaedgdkZ/qE=; b=BnPPj31gCU/u1WTIq0X99jKHO/
	cRonxkHxmaMJZgD/EGbjX472LOXKjNT8eq+85/FxWpw3hncHJ8YtHlTAW48cw3pMtqRVkyUUXqUrt
	ym05oprQQPXX06DdYzqAodfiO9WZsk9XQvnwVvbSvKHdPqG+b+lCEC8Oje4IyfEwlCr+CruMDBRPI
	h0LFWQisYUnDlxomk4i/QGy4jyCP7XUSUbvlbd5tTuf0XoS2QCtNyTDRbt0zWWk2j6Tp2WjlYko4l
	mJBUA6dAwqhIFWzJ3XJy+cXczKO6ig8MWLnKcGw8PdEXTtlElErKhPXj6K256jsXWB3rwKeAAb8rc
	jtt9Q1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYIp-00000009H7S-0ZVV;
	Thu, 30 Jan 2025 17:26:07 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYHV-00000009Gsj-1nKi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:24:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-386329da1d9so574439f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738257883; x=1738862683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyeDfNgF8wSUnxJsK4c0ibCBKb5iWxSmVaedgdkZ/qE=;
        b=ko943lmhr29GBwxmIp4Uuduv8w06zGEYb/hqFBGzFAVAQv2dkPCOxuAcFGhLlz7vbN
         yPcBV6YQPFgjRav+oYHH8t2QNq0+blJzEir7pYP9Sgd1IBF7zpYmTyIcinUe7W1OZVTU
         8aqVZ89lHFUJlBr4lctCjXtPDvJDX9Zdq5BZd97QDqAZ4FRNwzqUl0vldM77bm72TTqu
         q3yXlY//sizJ79lXNfDCPk9JCaliYV8TY71ogeNyENYl/VAHvetb9qflEY/BxI/PwWo0
         P0FDCZndU40W1drZiRRg/g5G4Fo0UukHFImJG8z/ZiPawfiLpejBsksCtN66GC/DQ1Bt
         UYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257883; x=1738862683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyeDfNgF8wSUnxJsK4c0ibCBKb5iWxSmVaedgdkZ/qE=;
        b=OzwTrv/YsZa4oQ9GlQuGmh5nVOba9KD/phsHNjNHTsZlJLwz0lT+1agSYJNPPuUH5I
         7/gF4aG4uGiEJI0eUFTroTdWD/3+dpv3fqmF1CVpFIVFxT3W9T4Y6ltyGnR+cRxe2fSv
         qfXzI2aBC4SZvDfw+zZ9QoovkeCJ35sJD//824ycZrmQ7beR8EyG5T5PcKl1PtKGwoTN
         dcdwvj9xdAiiSa9y5PjbHE4DbEHmAh9iutI4hHBeV6Zysc/SmFJVGK5uRw5ny2L4eQEw
         VxDsyIxCRwwtwu8rdwYwgekW+f+ngtL89cYMd2/yF/BoY1vA5blvNI84k4JSY3+dXlrx
         9Q7g==
X-Forwarded-Encrypted: i=1; AJvYcCWtGgtyt94SbTxFOIM/oxYKHLfh6GRw/I8J/nxrlbb8+lgE7mb7bhPEI/9A4ueu4k9jmYDxRDioT11tlXnuZ7kt@lists.infradead.org
X-Gm-Message-State: AOJu0YxufSSnSogMkImGP6a4CipJRUn/0NyMhvsVqnzFiCncHoQ9TrjD
	SJIEANSeMvpsTcRq7QSkCoq+n3E3DyP8/vddeXQjSJsLiYdWwKZuUKCoatikkpU=
X-Gm-Gg: ASbGncvTVOjmp/dfScDLsLt4sWFtl8KPyKYVsr1TyWOENXhfxLdaDzqNjpjliUwLqQx
	u3ror7WwaLAwyoQaaJ78cyeo0U5bVxiA7V7AYDIti9By5GarGX+PDn8xFPySIHIk1RGiuKXxC9M
	T0VailWQ/p/l9KCXJqMEDLYrRc845ZQGI8KULnw3Aj8kXa9K1Y3/7PxFXKy33thcsa17oD5q9Rx
	ulpJbkmrJBUb4LdgS2uCOq/f1Tp0sGpIUeI+YKauZcvCBOgjrAcp3k3FpFomTvj5gg+fJhFcznU
	P93vfTFhAl6NkxPRWkQNWBoKNORQmrE33j2JWOkNp18FZajKYXLdZis=
X-Google-Smtp-Source: AGHT+IFOKhwS7SVTZlAgB/KmUq5YUcsnKXwUcdqRruGMwNm81PK27tTx5RK+9qsQBjRXDr0I6E36aQ==
X-Received: by 2002:a5d:6d02:0:b0:385:f092:e1a with SMTP id ffacd0b85a97d-38c5194c3b6mr6343222f8f.11.1738257883252;
        Thu, 30 Jan 2025 09:24:43 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c0ebfdasm2599755f8f.17.2025.01.30.09.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:24:42 -0800 (PST)
Message-ID: <b496d933-3c57-4b02-ab65-0582a30939af@linaro.org>
Date: Thu, 30 Jan 2025 18:24:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_092445_484883_0082779E 
X-CRM114-Status: GOOD (  17.52  )
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

On 30/01/2025 11:30, Claudiu Beznea wrote:
> 
> 
> On 30.01.2025 12:07, Daniel Lezcano wrote:
>> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>>> Hi, Daniel,

[ ... ]

>>>> Would the IP need some cycles to capture the temperature accurately after the
>>>> clock is enabled ?
>>>
>>> There is nothing about this mentioned about this in the HW manual of the
>>> RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>> - wait at least 3us after each IIO channel read
>>> - wait at least 30us after enabling the sensor
>>> - wait at least 50us after setting OE bit in TSU_SM
>>>
>>> For this I chose to have it implemented as proposed.
>>
>> IMO, disabling/enabling the clock between two reads through the pm runtime may
>> not be a good thing, especially if the system enters a thermal situation where
>> it has to mitigate.
>>
>> Without any testing capturing the temperatures and compare between the always-on
>> and on/off, it is hard to say if it is true or not. Up to you to test that or
>> not. If you think it is fine, then let's go with it.
> 
> I tested it with and w/o the runtime PM and on/off support (so, everything
> ON from the probe) and the reported temperature values were similar.


Did you remove the roundup to 0.5°C ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

