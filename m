Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94391C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9Xvw9T6eAQSk6Ziei+kwmi6b3zyorGLKbWsnxvpWlc=; b=DIGtJn/Ry12wve5ugpk09AdDGu
	0zWwyzEGsJu708XPEDSULCM3Addsjm/goB/JQqXuRun0ec495Z2W6BcuGmeQOjcw1fjB8MkJFCEOu
	liqhRdcAZYXkv0jKXz2thDrnp6d4khtTjle48D6A07iNmphBEx4G8TH3bIJKJRIQRZUtIy1deGyNk
	TxVYc5yo1HQpnWX/JoXM9EuByRQoaOEP52X1IyVr3O2gh8wl0kTS1zdvrdBgHCrY2hdpitmh6VIsY
	sIYdW/Yb39K5fRHMjR5aZdh6FFYq4PQmZ679vSz1J3ydibWvE713Tp377bzvECnoht9CsO/56b1hK
	1OYQBgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmm4U-0000000DU5F-1r10;
	Thu, 23 Jul 2026 05:34:14 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmm4R-0000000DU4V-2huC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 05:34:13 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso391577a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 22:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1784784849; x=1785389649; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9Xvw9T6eAQSk6Ziei+kwmi6b3zyorGLKbWsnxvpWlc=;
        b=hS+/4OoyR+X+Nj98bDjby88mscWRHyR1M7OjWCFT8FUwfJASJKzKf2gGmZOySJrPR6
         gjCJ/03Lhe48bCIYXMmFdgF5w40byyZ0ggJuaJK5Mh5Iw/TXeOqiwBA7mlt828JDoe1h
         F2rTSzS70ALT8ovj6ovQybA4Ne+4cVTWMz2E1QutKQlruehLCp0jsFdiDFfQ30NLW1IE
         XCOZjDyWqugtrOUutNxozBn7p8U8YND4H/AQZkSCAEzJJYezI+aHHJoIECGxbcfySiCQ
         lqobcHHm3KkaANx/kKEK7WFuqhbMqbWuvaCRj/ovqB1RSYJnVzkZ2RUV++q2L2CSPpjw
         XGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784784849; x=1785389649;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9Xvw9T6eAQSk6Ziei+kwmi6b3zyorGLKbWsnxvpWlc=;
        b=jv0JnDZqmV10i6fLtq2THCcDtvu1qnOqTW8itOvn+P/SFObL1Jb+rCAjaXro5f9DmN
         ECPsUBqXeYEGE/ou9PyhNAM5vxt6Lze+ZXy+YCwfsfKrZWQlw4TGuSHnsLLgLA7YrSXp
         OVKTGXj/x1OmIdXN1Ykv0dpoVEk4Pqjf9x7xPv7KTqzk5bpos/j3Hk3/ZSYSZeIobvM4
         JyEuQvdXBq3UaTaB9suGL6YRP+6Hm/LlFEb2pmJdyYEshXoPVJm6qMrzLKK8EHa5hY1t
         LsI9q6c7vO6HB9tN/SspCSgQiMO/RJ8IZOGgCuKe6RfO9LO57T42gMmX6MWx+7gjDDY9
         PNhw==
X-Forwarded-Encrypted: i=1; AHgh+RrHk6tM39xwBKRsBTnBSbZqoVug4q20Uvuqb7XWRtm+sH0QK91Uvkqe4Z99f6yO7uYj8dymsQFpUqx3Wv0HY+mF@lists.infradead.org
X-Gm-Message-State: AOJu0YzmQYuxuDmsYQoaYgp1uWatVjPgdteY086PRcDLaYRAEWHZfoL7
	jTDXBbi35dDy+FVY/9PuTL1i/RW1JLIocye3pi3iasXqFW/j99JC9KdheFvLnnG/Tg==
X-Gm-Gg: AR+sD12cGgvfGi//UggCATeeHM2FKqEiEfB+u+6V1/8igpEYmCjrczmp6IsDfwNvOw2
	Jfz0uwkpjMJVXEK0qpOqMBxYXGtEwOVjxsxeAjpFOng3pxJ4lquAr5JQiUX161f1R5HIcpTqbFw
	3MdYkNwWGlTL2xMMaEYnUqM29xH8s0RwwLLO8SCUzdF1YynnHFrxxetBg3Q6FllyDCFE9r63ovn
	TST8aGp27oO/hcGzFVEoh6Kp5FFRdj6y1SIfcGjgeMt56xwRIcs+TEoNZfbY3X8RS8Wlr89V6Df
	WIKsIbJ5lrpji6iTID53xuYVOunsHFCpDGySKHapC5JcbU7YJKGSS2kgCdqVNYe2BOsrDWPl7ky
	E/5CsONa79cw7fyITkWwXRyANz8xcTKznOuH9bMZuKA1BNH4ZH8ZhZq/xsc++5RRzAhZWqZjRSp
	plAnkko2EW1d9CZ7fipJENfYkFPhjvOaIAMes00NjW4f3vanD6UNYnjTml/6F/zK28k4++e3haf
	uTBuItjl4Hk9ZvNy9WPrnMSJ3N5yHeg1UisBoV3X9DOVcY2XVBD+Q==
X-Received: by 2002:a05:6402:4555:b0:698:99be:29d6 with SMTP id 4fb4d7f45d1cf-69f6c4ef29dmr358015a12.29.1784784848988;
        Wed, 22 Jul 2026 22:34:08 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:30b7:a679:c7a7:7d05? (2a02-a466-4d7a-0-30b7-a679-c7a7-7d05.fixed6.kpn.net. [2a02:a466:4d7a:0:30b7:a679:c7a7:7d05])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1b18sm1838609a12.2.2026.07.22.22.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 22:34:07 -0700 (PDT)
Message-ID: <6cc68287-ee87-4db6-8f40-531ec2d92fb2@pardini.net>
Date: Thu, 23 Jul 2026 07:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
To: Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniele Briguglio <hello@superkali.me>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20260624123914.1767374-1-hello@superkali.me>
 <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_223411_768054_54AFD2D8 
X-CRM114-Status: GOOD (  13.05  )
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

On 28/06/2026 21:13, Heiko Stuebner wrote:
> 
> On Wed, 24 Jun 2026 14:39:14 +0200, Daniele Briguglio wrote:
>> No in-tree board references these gates yet. Boards drive the codec
>> MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
>> managed clocks, clk_disable_unused() turns them off at boot. On a board
>> that relied on firmware leaving the output enabled, that cuts the MCLK
>> and analog audio stops working.
>>
>> Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
>> state firmware left. A board that wants the kernel to own the gate can
>> reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
>        commit: 946352b2f88fd2378f0341312e47dff1e8dc2fac
> 

Hi Heiko, Stephen,

sorry to pester, but do you think it's possible to include this in the 
next -fixes for Linus?
It's been in mmind v7.2-clk/fixes for a few weeks now, but I haven't 
seen it in -rc4.

Thanks,
Ricardo


