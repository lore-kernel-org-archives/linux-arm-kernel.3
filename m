Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69142CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9mWuuUO2oTiIhZB/31OQZAO1jKBhIUPfx0Zm8nC4/A=; b=oU8WccORoHdE2On6y4Wk/NfXwU
	mTYbCJK+lBt57nEOyK6f+RsH7M/XHUF51ZjhxWn/h2IBGjx53ibFXAbf+WAykPwKf9PFK561vPzH/
	BI9HRs5p6WfBR5JJF5KqrCdEoLGjalLMN5lC/o0aVlKVhrHcvZ7HedC0Jv3/54R8/mbwICM77E0G7
	bkM+1fAP6K7LbtNyDg9UgRxsB5X/FLzecm2rUYf9vRhOg5r00tPVqrwCH4x47e/JPQe/NRnQVVOGt
	CgMWYsh43JoFVjQJdWqAzTcT+Webtvd0ei911s6Vv9RfiEqW7KJWcT+q7MtGT5GHGOmKCfD99g6m8
	ErjzWkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39YO-00000001p8m-0kmU;
	Mon, 29 Sep 2025 08:48:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39YG-00000001p7V-3eLy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 08:48:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso3125471f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759135687; x=1759740487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9mWuuUO2oTiIhZB/31OQZAO1jKBhIUPfx0Zm8nC4/A=;
        b=dbebMIcSL4//frQhU7+YJUvS4DLWrMKLXbmiyAeZVp+CvoBDv9lYDLvYnQoMe4kVJW
         BxAezBHlNlbbeIrLrO4XX/gctSnexsNzyjqZQchvAnNwGlDjXbHfC75VMACgM5toUUYp
         V9iB8dDhxXc4vgTBkDBTwoyUhI93cVuL5+SRR4zkoXv2UJZQkSNLWx/YjcL0QWnfFDvt
         JoTuxIX/zv0eWC8o53LhC/0MI9yD+UlPZJt/rCBczDinYFGlKuQt9nMeYBURr3DiQbTG
         FCJzpiLKN5q7NzQeORWQG+EZkeVW9BK8KvQpeXTUJViCZwxgnlzHVvyzNwDZc/zisrWE
         SaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135687; x=1759740487;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9mWuuUO2oTiIhZB/31OQZAO1jKBhIUPfx0Zm8nC4/A=;
        b=PRy3vnXZBzDKML8VDPOsyo4fHUDI5rOcAPlVQVpZLz8ZOBghBgPOwfUcFGSk78S/fy
         W2CPk5bV9Htetyw9CHnufNQ3L+OqypUBGXK9zrQIwfjQAo4mDQfqu4IgpZwLvYElPCF5
         WQpE7M8I7wZ/9xpuJN80ytQ5dy8XingbvTvFCBhGnz3Jsu/QH2M/dTt3qUvoag2Q50X8
         D4FCgITagZe6u1WA7hPvLjrAXJwWeQyV2bPPjzlXcIst/PMJHe0LwMs1dPXsziJ+j0Mn
         EzMIGTEURcqDTumksIa82e6ERunE1oXmj0D5etqNxJok9yoU7pDyzMvozV9YHJzOPQ0O
         TlQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs2uPNtZSdoAs+fMQW3dhJpgpHHvnnwIe7iVa4ff8mNvWAUouQXxhrStZUkYCCS8MlP6JafY8M4dRnUUgLker7@lists.infradead.org
X-Gm-Message-State: AOJu0YxnSotj/FLzlfGZaSzTjWMQK+zD5TKxv4NoISrbgIvmnjsVPuf8
	mf0AcUWgJHPW0nf5tE9lsWomciMI2uuV2s+peJdW36eY3pKoOfCZOeKQMd0qNRCeH/o=
X-Gm-Gg: ASbGncvjsRKUxrVI75eHA9VxoTXSMa6cV8psODt5my4+keHP3yDdSZCVXX+fM5hNUSo
	Ycc9AHMjMUkwvmZT0iakgGfNyDaWrXThUOaDb+deSw2ChzPEIN8oC7I8/0Qr7otICZdF6lwZffg
	BMWn2Ex7CaRq3BuZrgzt8fpSDYIcRbSpwHD1vPsbCM4N5IWuroSjYLVPHya0/UthHElP0etuZH0
	n18m+hk2bbUUoOtnyeBYX2gdj81TyoJZwbOd3AcicmpLej4aONl5V6mNSosdpMypkSTEoYvspqj
	Z4+WbhhPgLV2xxxvdk72s7iwvRbhnksACQnxT6LU2jzuBWPidTWvei90frxucFLBE/URjLgr+du
	YcxNmchXF1SitD8GIR1KBWI7gs0w/7vxH
X-Google-Smtp-Source: AGHT+IEuJjQ2ywEf1FmcgUiPlzRMP7EQ4wv/Yzx58fshvg0ascmwTL+/3T4ksUZ0TgAGJ3QGBI0S5Q==
X-Received: by 2002:a05:6000:2586:b0:3ec:ea73:a91e with SMTP id ffacd0b85a97d-40e498b77bfmr13575306f8f.12.1759135686798;
        Mon, 29 Sep 2025 01:48:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9891:6c55:82b6:bfe9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb7203b8asm17522265f8f.9.2025.09.29.01.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:48:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Chuan Liu <chuan.liu@amlogic.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
In-Reply-To: <CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
	(Martin Blumenstingl's message of "Sun, 28 Sep 2025 22:55:50 +0200")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
	<CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
	<20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
	<1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
	<e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
	<9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
	<CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Sep 2025 10:48:05 +0200
Message-ID: <1jfrc563wa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_014808_934733_4475DCA8 
X-CRM114-Status: GOOD (  29.56  )
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

On Sun 28 Sep 2025 at 22:55, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hello,
>
> On Sun, Sep 28, 2025 at 8:41=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com>=
 wrote:
>>
>>
>> On 9/28/2025 2:05 PM, Chuan Liu wrote:
>> > Hi Jerome & Martin:
>> >
>> > Sorry for the imprecise description of the glitch-free mux earlier.
>> >
>> > Recently, while troubleshooting a CPU hang issue caused by glitches,
>> > I realized there was a discrepancy from our previous understanding,
>> > so I'd like to clarify it here.
> [...]
>> An example of the clock waveform is shown below:
>>
>>
                     1                  2
                     v                  v
>>         __    __    __    __    __    __    __    __
>> ori:  =E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91 =
 |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91
>>                    ^
>>                    1 * cycle original channel.
>>         _   _   _   _   _   _   _   _   _   _   _   _
>> new:  =E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=
=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91=
 |_=E2=86=91
>>                                        ^
>>                                        5 * cycles new channel.
>>         __    __                        _   _   _   _
>> out:  =E2=86=91  |__=E2=86=91  |______________________=E2=86=91 |_=E2=86=
=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91
>>               ^                        ^
>>               start switching mux.     switch to new channel.

Ok ... but when is it safe to disable the "ori" clock ?
Can you do it at '1' already ? or do you have to wait for '2' ?


> Thank you for the detailed report!
> This is indeed problematic behavior. I guess the result is somewhat
> random: depending on load (power draw), silicon lottery (quality),
> temperature, voltage supply, ... - one may or may not see crashes
> caused by this.
>
> Based on the previous discussion on this topic, my suggestion is to
> split the original patch:
> - one to add CLK_SET_RATE_GATE where needed (I think the meson8b.c
> driver already has this where needed) to actually enable the
> glitch-free mux behavior
> - another one with the CLK_OPS_PARENT_ENABLE change (meson8b.c would
> also need to be updated) to prevent the glitch-free mux from
> temporarily outputting an electrical low signal. Jerome also asked to
> document the behavior so we don't forget why we set this flag

Yes please split the changes and visit all the controllers shipping this
type of muxes.

>
> Both patches should get the proper "Fixes" tags.

... and proper fixes tag maybe different depending on the controller so
there might more that just 2 changes.

> I think it would also be great if you could include the waveform
> example in at least the commit message as it helps understand the
> problem.
>
> Let's also give Jerome some time to comment before you send patches.
>
>
> Best regards,
> Martin

--=20
Jerome

