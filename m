Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B978CAC5BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5TiAseZcVQOtO3WU44wqIk3ETdplagD04sSEDVxBRM=; b=YI7sWl9PmHuu2bIqzUAwJ64gC5
	8sLSkiPCXclBJ/aSK+wS2gA0gqIX3/oR3Vq24sRMrMyPvvcglIwvakyzDF+W9qgsLgHnA74JXYnby
	4hN1hkrkGoaDa2YDvp+/awrvMKnoQy64G/4slXFsQRZKI4PV/JFy/4fojNStj0HFIu3TIg5P29cbJ
	ZC6mxunxjwhpTMRKr6G+17sO5szB0BvpwiQZrYU1Mty/oAmWZx2qRB2k/H8tNDFCsxkmepJArEbUW
	yxBLYWlrASDSzfDWretWszSAQZUip7C919Cq0gqVqfUZ2gkt9b/YiBxzUEJtewW4yeMk1qX5oLDGB
	EbIOf3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3D7I-00000002TsE-1pxY;
	Mon, 29 Sep 2025 12:36:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3D7D-00000002TrL-2v6P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 12:36:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso29347055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759149386; x=1759754186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5TiAseZcVQOtO3WU44wqIk3ETdplagD04sSEDVxBRM=;
        b=J28mLzcQbd+aD0s7VfEfCc5RLrDX4JzXrcWxH17iQfuJv0gcjSnnFPgfP0WwdTAptt
         Rj+mrSwfcdVwiSYMQY6/uxbb3U4HIKZpl1wX4tqwj7ptxTrduXljA2Pi8DejV+0MdWUs
         Jde0I4eqI2JjETGWWAFXy6367fSWaFlkveDcysQgkqB3U6LBnEqFLd1OMkbr6i10lq07
         7TBysiA1+eZUQK90cfNS8clDl2KVCuLwzjxBRuy+osH8DBjlbVUvO5GA2+f/cxJmEG+W
         TKsPMGDKjRpm0jWYWurYlsgF6iJKXqep6G4zzMDl8OwdTVuOZxCDIBlWq8gt8ENf3drr
         46DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759149386; x=1759754186;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t5TiAseZcVQOtO3WU44wqIk3ETdplagD04sSEDVxBRM=;
        b=Kle2+IrmqEmkLWQeKADGVziBWubZZzqedt9lMdjoZSywnCTs4EJdGkCnZwcPJ7W/kO
         Kf7Jlm4H5uCNOvYlf+u74oSSG90gtmWfAJaW82eX3tBo0UjW88Q8kt80YTOlIeNFOhSY
         na71Zo82He2vVPWKW8MW3z4/N0uW91y1vB3j18FHAKTEVfiKNbJ7Pit82zLGAFQSgX34
         4iX/sBu5/EmxO3/vIiXJW5pEvmvkiFIWIXWFkuf1cWyh+sbc8Do6g5cu0ofolWnuBufQ
         nmypJms8k+m/29gzETzw1xe1heVB8Cz75slnjDUE0yDFB+Dn3fobxSJPIvdOdaWz2csJ
         Zp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeXaJjaLIItXqG2FRM5czhG8gXKwD/BQpwAqXyI9g3YcV1YBzz5UK8w3kg4nUoq4U8NgMyO+DSyX8P5xjeuAn2@lists.infradead.org
X-Gm-Message-State: AOJu0YwPGWmohiKJqfKZCGNr6es+bMunILmLcwZb5RJjG6P1EM49l4L4
	+GhBSetUSz2qQsE8rqzlDNQVbDqhvf/KajqL4jeJj781PRB1Da5tB+QGL6ReZm4PVJg=
X-Gm-Gg: ASbGnctd2DUhpOQp1L3fJeVNl3ZsNC9ps0UvO31H30wK/1qsU3bUcXAeYoCeBVXklLy
	oJf2+1SP45bIsWChTk1iwdwC/J0gEHhiokW7Or/mj78ZEuup+SlX8QdQ6OweK3nvGkNUFMpzb/f
	6luiItYMcMVn3r+etmuFy5qwIThZsUiWvDWIa/xm9qguxBEHpC2Bjhkxsx71/K4iTsBffCoihD0
	ul0Q3Am2n2NJVisXVVAa/Aea3pvbqk4a8SqPm1eBG6Bk4ioh7/mI5fAf6YjqA61GaozHFvCHNpl
	+X/pe4rsmTB0VFGLi67a3LbazoUFSdNi1ZA2tAc8W7du/Zr5RpLM7NLSn/Xc3X/e+dvhVrMDzV+
	W3h6xbdw08urDYnMVafka/0fV9ahVuJ0=
X-Google-Smtp-Source: AGHT+IHo0QKRizwsJhQ5D0tkdyBpVp2YHvhvxBq16FZ5DocejNzdXKBFoyHjJt0irT3wdJx8Oxn2bA==
X-Received: by 2002:a05:600c:4453:b0:46d:cfc9:1d20 with SMTP id 5b1f17b1804b1-46e329fa931mr124081375e9.22.1759149385782;
        Mon, 29 Sep 2025 05:36:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9ad:4617:2761:d4d0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2a9af27dsm229660415e9.8.2025.09.29.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 05:36:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
In-Reply-To: <eee93d9d-2977-449d-8792-b2416f0c09ad@amlogic.com> (Chuan Liu's
	message of "Mon, 29 Sep 2025 11:15:46 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
	<CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
	<20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
	<1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
	<e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
	<9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
	<CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
	<eee93d9d-2977-449d-8792-b2416f0c09ad@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Sep 2025 14:36:24 +0200
Message-ID: <1ja52d5tbr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_053628_004002_A4EA753D 
X-CRM114-Status: GOOD (  35.08  )
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

On Mon 29 Sep 2025 at 11:15, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Martin:
>
> Thanks for the detailed explanation.
>
>
> On 9/29/2025 4:55 AM, Martin Blumenstingl wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hello,
>>
>> On Sun, Sep 28, 2025 at 8:41=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com=
> wrote:
>>>
>>> On 9/28/2025 2:05 PM, Chuan Liu wrote:
>>>> Hi Jerome & Martin:
>>>>
>>>> Sorry for the imprecise description of the glitch-free mux earlier.
>>>>
>>>> Recently, while troubleshooting a CPU hang issue caused by glitches,
>>>> I realized there was a discrepancy from our previous understanding,
>>>> so I'd like to clarify it here.
>> [...]
>>> An example of the clock waveform is shown below:
>>>
>>>
>>>          __    __    __    __    __    __    __    __
>>> ori:  =E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91=
  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91
>>>                     ^
>>>                     1 * cycle original channel.
>>>          _   _   _   _   _   _   _   _   _   _   _   _
>>> new:  =E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=
=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=
=91 |_=E2=86=91
>>>                                         ^
>>>                                         5 * cycles new channel.
>>>          __    __                        _   _   _   _
>>> out:  =E2=86=91  |__=E2=86=91  |______________________=E2=86=91 |_=E2=
=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91
>>>                ^                        ^
>>>                start switching mux.     switch to new channel.
>> Thank you for the detailed report!
>> This is indeed problematic behavior. I guess the result is somewhat
>> random: depending on load (power draw), silicon lottery (quality),
>> temperature, voltage supply, ... - one may or may not see crashes
>> caused by this.
>
>
> Yes, our glitch-free mux is designed to prevent glitches caused by
> excessively short high or low levels in the clock output.
>
>
>>
>> Based on the previous discussion on this topic, my suggestion is to
>> split the original patch:
>> - one to add CLK_SET_RATE_GATE where needed (I think the meson8b.c
>> driver already has this where needed) to actually enable the
>> glitch-free mux behavior
>> - another one with the CLK_OPS_PARENT_ENABLE change (meson8b.c would
>> also need to be updated) to prevent the glitch-free mux from
>> temporarily outputting an electrical low signal. Jerome also asked to
>> document the behavior so we don't forget why we set this flag
>>
>> Both patches should get the proper "Fixes" tags.
>> I think it would also be great if you could include the waveform
>> example in at least the commit message as it helps understand the
>> problem.
>>
>> Let's also give Jerome some time to comment before you send patches.
>
>
> A V2 version was submitted later with changes based on your suggestions.
> Regarding the "Fixes" tag, Jerome had proposed some modifications.
>
> [PATCH v2 0/3] clk: Fix issues related to CLK_IGNORE_UNUSED failures and
> amlogic glitch free mux - Chuan Liu via B4 Relay
> <https://lore.kernel.org/all/20241111-fix_glitch_free-v2-0-0099fd9ad3e5@a=
mlogic.com/>
>

The comments I've provided on this still stands.

>
> Adding CLK_OPS_PARENT_ENABLE causes the CLK_IGNORE_UNUSED configuration
> of it's parent clocks on the chain to become ineffective, so this patch
> depends on fixing that issue before it can proceed.

Unused clocks are NOT a configuration.

They are by-product of the bootloader. You cannot rely on them. If
anything depends on them, you have a(nother) problem to solve.=20

>
>
> Jerome and I have submitted patches to address the issue of
> CLK_IGNORE_UNUSED becoming ineffective. I originally planned to wait
> for progress on this patch and then incorporate Jerome's feedback before
> sending the V3 version.

I've provided a suggestion but this something happening in clock core.
I suggest that you split this out of your series so things that need to
go through Stephen are not mixed with Amlogic stuff.

But again, you cannot rely on the state of clock just because it has
CLK_IGNORE_UNUSED:

* Nothing says it is enabled to begin with
* Nothing says it will stay on if a consumer comes and goes
* ... and yes, it does not survive CCF usage checking down the road.

It is unreliable and it is not meant to be more than that, AFAIK

>
> Hi Jerome, sorry if this caused any misunderstanding on your part; I
> will provide timely feedback moving forward.
>
>
>>
>>
>> Best regards,
>> Martin

--=20
Jerome

