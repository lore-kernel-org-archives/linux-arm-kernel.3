Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B82CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 12:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4AJhIRDhtQztFOcWyZbbOIS6wbTlWTjViXERoklQ24=; b=z02P6IEY0uqIAegQWfu8hnoQ5D
	ZVe6CkPs7rlDS3PoZH5yKc3oVYb+WE8bBINX5YxP4eJKYurWvwL/p/jhYSBLpNOOXrqPHOKcLW6cC
	UVCaHrohFnXw33mquSjxlyFUaFs/jW5mwxiiaJy3vE3EXDiBym7VgOC00DQ0sUBbQFOiqgJBYqGWL
	6axB1MTaV91A2fev7VEpeMNdM5lulEw87oONAQbg8zManB1ZpLXkYEa7F0jQAtx/Qf5qhGGV4Lj5V
	cat3xc4WetrmN9Rpn5PzCradus0ElZuajg1Kj/vnTM59KUikvlKx/hBgz1Xp/HbTcldigj1mV88ig
	BL9BzHCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DPa-00000002VNh-3Elj;
	Mon, 29 Sep 2025 12:55:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DPY-00000002VMs-0q56
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 12:55:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e425de753so16347465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759150522; x=1759755322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4AJhIRDhtQztFOcWyZbbOIS6wbTlWTjViXERoklQ24=;
        b=a2wQsJbJ4CnEj88R5M1v0nU2z0aFXXDk7BQA50VfjPco0ax+Mm+vWZjhusKvTwBu6U
         8I6wqCcGmSgyRzRRR9cMqCsjwSq6EWLsR0ukZ1FTmIwl1MBK9c+5zDk1JPsQrH/zeXxp
         3ew/XjQUaYEq+6r1cOM43VuSDI7LebiHHeSqXIdFHknniTOAutkfyhRcM+uJHTLDt7Xi
         NeBdgnlZGMUn3xYWe4+yvmiVGOR16ZInM0zEaP4W5lXAM2bykD0dcjyUXLOQHoA4nDM3
         8lifhqYQQQN4Kwv/PQ1UkR9h8Ruw7lI/4knUP2W+AlD+dz9l41kyKY9mzU6fvlys4EB1
         ThNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759150522; x=1759755322;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p4AJhIRDhtQztFOcWyZbbOIS6wbTlWTjViXERoklQ24=;
        b=HoyrGxg3kgPDgpwtlrGlfE8haMHDEKkGqL2i+SnCc5eaqAj4BF1hKdLAtPCABm37VC
         fRkxQO4O9FS08lrQ+YyWgF7fEESq3DTEhdLEsIQjvebLgSG3oN1O4AHfTCAnhl4TyWDG
         alIz+050XhGshx0FxPN3xKx0mbdcHybsLpoGOtZaMRVuOpFQX6IQa9l1DQ/uSPNDTtlv
         MtNrHXc7ihqRZnbNlRLfTLWtZrTHfbsrX+fn82KueYdacpp5H1XeS4GzTYEXgdYIXANQ
         ekkF5pkAPzgAL77iqGRZsFe/TgyG3XTkZXwOKFJCTL6lwDfWGMH6IVJTzEtr7UXv0grz
         JEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY+/nIcQDiTqagr69jQxvbAHFSljPC80Qu/KXlQFwgUBLVZCdVR0L5sAnw9pcU2+RqQLQx9FAuyMWUFr/exSTY@lists.infradead.org
X-Gm-Message-State: AOJu0YzvBkGDzzb4zl2F8AAjhHn19p7eImuNfqbC4nPqQqdZC4mNSIP5
	KEUN8h3/RCGp4kE66uQ9Ozkc7JYavCpisyrnPTt2BlohSyKfWuBZgK7k2uySRnMJl6o=
X-Gm-Gg: ASbGncsjYa63PQIURU4r3r1hHXr3Tft6uMK97cIWQUZeFrKmPaf+LgU0vPwfIJUmWc/
	uDuTN0MTqArjeJ5EoYdb7Btmz1RxX+JQKLfhL/050gs0It0mJQUVhDQT68ukjyqrSeMGp19m0jM
	nzxgDjP+r87o990FT6dHzGgTHQxhs1tdhERIKI2uJ9o8ET7FLQv3swku/Uo0Blj3OIhA15kFPtB
	yEXGRB+rBdEJy0ll6M5uKKPKlwRW/pYxiTWCypJC+PkIS44rTpTkP+Ow/kVuP3k9JLq/dkKiAmb
	hpYDjyVeaXhTwf7WZFXycIyVVxg+i5FcW4bUV2W+2LgPaogZhHAYUtb4WyTfIKGVBEtL2vSOWAB
	4Au/QZylg08RVjyowGub2w9INCihuyWs=
X-Google-Smtp-Source: AGHT+IFVFN0XLFy2t2r8lsVdrqYeMn/8TCLqXkS7DTElSFf2//cTI3KRbqZwOsdLupaXoEn5NrWF2w==
X-Received: by 2002:a05:600c:3b23:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-46e32dd1cbemr151873375e9.7.1759150522095;
        Mon, 29 Sep 2025 05:55:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9ad:4617:2761:d4d0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e56f64849sm12304965e9.11.2025.09.29.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 05:55:21 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
In-Reply-To: <36cd6282-ae1d-43f3-8738-592f043d0ba6@amlogic.com> (Chuan Liu's
	message of "Mon, 29 Sep 2025 17:31:07 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
	<CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
	<20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
	<1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
	<e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
	<9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
	<CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
	<1jfrc563wa.fsf@starbuckisacylon.baylibre.com>
	<36cd6282-ae1d-43f3-8738-592f043d0ba6@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Sep 2025 14:55:20 +0200
Message-ID: <1j1pnp5sg7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_055524_262780_4A24700B 
X-CRM114-Status: GOOD (  25.50  )
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

On Mon 29 Sep 2025 at 17:31, Chuan Liu <chuan.liu@amlogic.com> wrote:

> On 9/29/2025 4:48 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Sun 28 Sep 2025 at 22:55, Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>>
>>> Hello,
>>>
>>> On Sun, Sep 28, 2025 at 8:41=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.co=
m> wrote:
>>>>
>>>> On 9/28/2025 2:05 PM, Chuan Liu wrote:
>>>>> Hi Jerome & Martin:
>>>>>
>>>>> Sorry for the imprecise description of the glitch-free mux earlier.
>>>>>
>>>>> Recently, while troubleshooting a CPU hang issue caused by glitches,
>>>>> I realized there was a discrepancy from our previous understanding,
>>>>> so I'd like to clarify it here.
>>> [...]
>>>> An example of the clock waveform is shown below:
>>>>
>>>>
>>                       1                  2
>>                       v                  v
>>>>          __    __    __    __    __    __    __    __
>>>> ori:  =E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=
=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91
>>>>                     ^
>>>>                     1 * cycle original channel.
>>>>          _   _   _   _   _   _   _   _   _   _   _   _
>>>> new:  =E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=
=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=
=91 |_=E2=86=91
>>>>                                         ^
>>>>                                         5 * cycles new channel.
>>>>          __    __                        _   _   _   _
>>>> out:  =E2=86=91  |__=E2=86=91  |______________________=E2=86=91 |_=E2=
=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91
>>>>                ^                        ^
>>>>                start switching mux.     switch to new channel.
>> Ok ... but when is it safe to disable the "ori" clock ?
>> Can you do it at '1' already ? or do you have to wait for '2' ?
>
>
> It should wait for "2", because there is a state machine in the
> glitch-free mux, this state machine is driven by the working clock
> provided by its channel 0.

Then I don't think the 2 flags are enough to make it safe

Nothing guarantees that CCF will wait for those 5 cycles to turn off
the clock noted 'ori' above.

I think you need new specific ops for this mux

Something that would
* protect both parents before changing the mux
* do the actual change
* wait for it to settle
* remove the protection

>
>
>>
>>> Thank you for the detailed report!
>>> This is indeed problematic behavior. I guess the result is somewhat
>>> random: depending on load (power draw), silicon lottery (quality),
>>> temperature, voltage supply, ... - one may or may not see crashes
>>> caused by this.
>>>
>>> Based on the previous discussion on this topic, my suggestion is to
>>> split the original patch:
>>> - one to add CLK_SET_RATE_GATE where needed (I think the meson8b.c
>>> driver already has this where needed) to actually enable the
>>> glitch-free mux behavior
>>> - another one with the CLK_OPS_PARENT_ENABLE change (meson8b.c would
>>> also need to be updated) to prevent the glitch-free mux from
>>> temporarily outputting an electrical low signal. Jerome also asked to
>>> document the behavior so we don't forget why we set this flag
>> Yes please split the changes and visit all the controllers shipping this
>> type of muxes.
>>
>>> Both patches should get the proper "Fixes" tags.
>> ... and proper fixes tag maybe different depending on the controller so
>> there might more that just 2 changes.
>>
>>> I think it would also be great if you could include the waveform
>>> example in at least the commit message as it helps understand the
>>> problem.
>>>
>>> Let's also give Jerome some time to comment before you send patches.
>>>
>>>
>>> Best regards,
>>> Martin
>> --
>> Jerome

--=20
Jerome

