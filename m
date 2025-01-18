Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF40BC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1hO8Av0Prvv+mSmsQTFT06Ds8pT2IeI8pcHdJToW/w=; b=hMHgu+CEGFVVAGAuPlO3NgqyAz
	JBkZYkE3N6lAQAVQhUPzjdRDkvzvDTEsim3AmirUQ3OdLy0KNnWwB/7VelXfB/OAcFZCmk49Vw0iB
	9cdzIAsF8JNcT16CT73WVe2BL0zfOyXqTj1jJZ4riLF6lR2JDUVxe52uBRua0VIICTipbab9C8xT5
	lbahHXkLKSGgHpQfg1OPb/2LcVlrB1uw6F91X/l/vhxIVa04JjPq7mGYQQHi+WS5775qj5//77LWh
	J4z17NgyYlT5SzoORrPCZlPFXUb/DR+bvbDi+avAczySfah9riKsX9gq5qxhl/69cD2lhHBZt9q+F
	+EIy3JGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ9k3-00000002WKs-49BG;
	Sat, 18 Jan 2025 14:24:03 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ9im-00000002WBf-1WXW;
	Sat, 18 Jan 2025 14:22:45 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5da135d3162so5095205a12.3;
        Sat, 18 Jan 2025 06:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737210162; x=1737814962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1hO8Av0Prvv+mSmsQTFT06Ds8pT2IeI8pcHdJToW/w=;
        b=bXSoTwXSrzVLNhNXfYpflz1oz42P3TaiFEXtWCT5gOJU+8kf94nj478x+OWMm9S8ZB
         MDGcct6NugF3f3rR5FSaIy3lEoaIpQUvewvBMCT1IRvL7ER4lH8ZyjLklv8eO75fQsve
         MiDyH06UPn9pGjEqq/2Dn6YkZh2FtvNUppGxC0xkNWboFOiRozmBQvz7l1apcosskBFv
         v6ju7RgBK7qi0fv2HcQmH+euDZp7RJPZYz2qO4GEDSfpsO//xF8Lc0mRNv2mMYa5mzfa
         PsagSCZPBzCp/WrBbm5zT3s5RkTkxbEcIgRvRulDZ91HEEUfh3Vb6hWkpQ6nkOOkVyHv
         94kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737210162; x=1737814962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1hO8Av0Prvv+mSmsQTFT06Ds8pT2IeI8pcHdJToW/w=;
        b=ccqXXKVOSWW+cbcEras/hG87DkicwptZYPeHoHmuAd3beCTwlfd6Hec+pMjU2PXMQF
         E7DhMQme/N804OF52IcEi7lV8eAIZOO1eihaD3oYw4hEjbqA1pw6MsNy33T2lyz9uVhd
         zThZxw3NV5w26Z6hHFO2jhBGb+pWHl+0DAxEnQWyz/B7H3kRsV1pHMVzMdjWbrEZimlw
         AMvWNcaWAAp74z6jdmd/uYeHwjISNWXAizCnrVwPsuW/uv9ceCnz389QcEM1ONY1Xlpq
         Dth2KvAV6sOCf1X+uZ4cPIVEsAAHGDHCFpC/wB2wguS1pXWPbyRJowNyK9i0YylEjXRV
         XDew==
X-Forwarded-Encrypted: i=1; AJvYcCUNweikNWZK8PCQU16Gi4zRYhp8PozFwvKPfMCqTY8eVVMWZuSrSrgbeu2kx+0ceblpcXXIENjWtuT26etOyys=@lists.infradead.org, AJvYcCUeaDhYz/Ac3bZEFJHSI2a2oObcZwTSFWUE60xujwy2NIWif90q1TA4HOSU+KoHHfBUwqPK967g/K3nWaNjBNS5@lists.infradead.org
X-Gm-Message-State: AOJu0YwGJncH+iV4fBDMYQksA0IpedVR74zNBYgcqCrnGUyztU+lRLKA
	L82LVJYy2xl5lqAPjMZi6gYMnCUTWt3n5gTZhHis1rSiUSkuNl5D1olCl5e1ldoBdPAZ5RIKcMj
	uxEpm/VsIOZRmCrgOrdOgGMmTtHo=
X-Gm-Gg: ASbGncuR3SOa/FdR37CR8uzAoqtPNCewuuKsXn/5JJ6aR9pJr1/Rrq65heZEJ3o3Yee
	V0kDZeK0ts2k4z4WqGDSX9eJc9YuTa3KxZx6Ggw9K2pSZY4LSNukZ
X-Google-Smtp-Source: AGHT+IGLL45byqpbtcLY0ncWpmTsQggsOXGlEPKO1ncdAy05bHozMgobraeG+t4IuqfVynnkyLGDLBuv/oWB1vGYnJI=
X-Received: by 2002:a05:6402:1ed4:b0:5d2:7199:ae6 with SMTP id
 4fb4d7f45d1cf-5db7d2f591emr5966574a12.9.1737210161654; Sat, 18 Jan 2025
 06:22:41 -0800 (PST)
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <20250115012628.1035928-5-pgwipeout@gmail.com>
 <7c7ce820-8a9b-46df-b143-f77835b7e5a0@kernel.org> <D73NJYSP62XH.28CVZPNUE21H3@cknow.org>
 <1bc91b4214a1099801aaed6b3ef81ef3@manjaro.org> <dcfb46e8-f29a-4eee-b8f8-1ff774f272ce@kernel.org>
 <60ced7df829e7c10e264627cc0947762@manjaro.org> <20b474be-301e-4dc3-9eb7-77e9ef075191@kernel.org>
 <3d9ce9fd9b6309553b5669e111bc4200@manjaro.org> <735d89df-9954-44bd-aca6-4bb165737626@kernel.org>
 <7ab853de15e1c183ef184d2700a13d98@manjaro.org> <df2e466a-cdaa-4263-ae16-7bf56c0edf21@kernel.org>
 <f54375ebd12e8741d8da8a6bdbf40a80@manjaro.org>
In-Reply-To: <f54375ebd12e8741d8da8a6bdbf40a80@manjaro.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Sat, 18 Jan 2025 09:22:28 -0500
X-Gm-Features: AbW1kvb61bOALz4Ew8jQ2cOtmtpTFEbsHfgnIGuykWKPRpLnyKSgO4zvlfTRTz0
Message-ID: <CAMdYzYq3AbdEJJRV4N52p9Mn56V047wteZDnQH+KQRdo7wMJ=g@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/6] arm64: dts: rockchip: add rk3328 usb3 phy node
To: Dragan Simic <dsimic@manjaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Diederik de Haas <didi.debian@cknow.org>, 
	Heiko Stuebner <heiko@sntech.de>, zyw@rock-chips.com, kever.yang@rock-chips.com, 
	frank.wang@rock-chips.com, william.wu@rock-chips.com, wulf@rock-chips.com, 
	linux-rockchip@lists.infradead.org, Alex Bee <knaerzche@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_062244_405335_2F88D395 
X-CRM114-Status: GOOD (  51.92  )
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

On Sat, Jan 18, 2025 at 5:45=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> On 2025-01-18 11:29, Krzysztof Kozlowski wrote:
> > On 18/01/2025 11:10, Dragan Simic wrote:
> >> On 2025-01-18 10:52, Krzysztof Kozlowski wrote:
> >>> On 18/01/2025 10:43, Dragan Simic wrote:
> >>>>>>
> >>>>>> Please see the commit bdc48fa11e46 (checkpatch/coding-style:
> >>>>>> deprecate
> >>>>>> 80-column warning, 2020-05-29), which clearly shows that the
> >>>>>> 80-column
> >>>>>> rule is still _preferred_, but no longer _mandatory_.
> >>>>>
> >>>>> I brought that commit, but nice that you also found it.
> >>>>>
> >>>>> Still: read the coding style, not checkpatch tool.
> >>>>>
> >>>>>>>> 80 columns is really not much (for the record, I've been around
> >>>>>>>> when
> >>>>>>>> using 80x25 _physical_ CRT screens was the norm).
> >>>>>>>
> >>>>>>> You mistake agreement on dropping strong restriction in 2020 in
> >>>>>>> checkpatch, which is "not for years" and even read that commit:
> >>>>>>> "Yes,
> >>>>>>> staying withing 80 columns is certainly still _preferred_."
> >>>>>>>
> >>>>>>> Checkpatch is not coding style. Since when it would be? It's just
> >>>>>>> a
> >>>>>>> tool.
> >>>>>>>
> >>>>>>> And there were more talks and the 80-preference got relaxed yet
> >>>>>>> still
> >>>>>>> "not for years" (last talk was 2022?) and sill kernel coding
> >>>>>>> style
> >>>>>>> is
> >>>>>>> here specific.
> >>>>>>
> >>>>>> It's perhaps again about the semantics, this time about the
> >>>>>> meaning
> >>>>>> of "for years".  I don't think there's some strict definition of
> >>>>>> that
> >>>>>> term, so perhaps different people see it differently.
> >>>>>>
> >>>>>> To get back to the above-mentioned commit bdc48fa11e46, the
> >>>>>> 80-column
> >>>>>> limit has obviously been lifted, putting the new 100-column limit
> >>>>>> as
> >>>>>
> >>>>> "Lifted" on *CHECKPATCH*, not on coding style. Do you see the
> >>>
> >>> Repeating myself about because you are not addressing the actual
> >>> difference.
> >>
> >> Please see below.
> >>
> >>>>> difference? One is a helper tool which people were using blindly
> >>>>> and
> >>>>> wrapping lines without thinking, claiming that checkpatch told them
> >>>>> to
> >>>>> do so. Other is the actual coding style.
> >>>>>
> >>>>> You claim that coding style was changed. This never happened.
> >>>>
> >>>> It was obviously changed in the commit bdc48fa11e46, by making the
> >>>> 80-column width preferred, instead of if being mandatory.  The way
> >>>> I read the changes to the coding style introduced in that commit,
> >>>> it's now possible to go over 80 columns, up to 100 columns, _if_
> >>>> that actually improves the readability of the source code.
> >>>
> >>> The commit is for checkpatch. Point to the change in coding style.
> >>> You
> >>> are bringing argument for checkpatch, so only a tool, as argument for
> >>> coding style. Again, coding style did not change since years.
> >>
> >> Commit bdc48fa11e46 obviously addresses
> >> Documentation/process/coding-style.rst
> >> as well, as visible in the quotation from the commit below:
> >
> > Yes.
> >
> >>
> >>    -The limit on the length of lines is 80 columns and this is a
> >> strongly
> >
> > 80 is here...
> >
> >>    -preferred limit.
> >>    -
> >>    -Statements longer than 80 columns will be broken into sensible
> >> chunks, unless
> >>    -exceeding 80 columns significantly increases readability and does
> >> not
> >> hide
> >>    -information. Descendants are always substantially shorter than the
> >> parent and
> >>    -are placed substantially to the right. The same applies to
> >> function
> >> headers
> >>    -with a long argument list. However, never break user-visible
> >> strings
> >> such as
> >>    -printk messages, because that breaks the ability to grep for them.
> >>    +The preferred limit on the length of a single line is 80 columns.
> >>    +
> >>    +Statements longer than 80 columns should be broken into sensible
> >
> > 80 is here as well.
> >
> > So now to your original statement:
> > " but the 100-column limit
> > for the kernel code has been in effect for years."
> >
> > Where is 100? Only in checkpatch. There is no 100 limit in kernel
> > coding
> > style.
>
> Yes, "100" is in checkpatch only, but the coding style explicitly
> says that going over the 80-column limit it fine if it improves
> the readability.  Thus, going over the 80 columns has been allowed
> "for years", whatever one finds that term to mean, or more precisely
> since mid-2020, and having "100" present in checkpatch establishes
> "100" as the effective "hard" limit.
>
> > The change in coding style and checkpatch was partially done because of
> > your understanding: reading checkpatch output as a rule. But this was
> > never a correct approach and still is not. So whatever checkpatch is
> > telling you, e.g. "100 column limit", is not coding style. It's only
> > checkpatch, a tool trying to help you.
>
> No, that isn't my understanding.  I don't take checkpatch's output
> as some kind of mandatory rules; however, what checkpatch does and
> suggests should be based on the coding style, and if checkpatch
> advises wrongly, it should be fixed instead of being accused to be
> invalid and pointless.
>
> Though, in this particular case, checkpatch does it right.  The
> coding style explicitly says that going over the 80-column limit
> is fine if that improves the readability, and checkpatch follows
> that by allowing up to 100 columns.
>
> >> chunks,
> >>    +unless exceeding 80 columns significantly increases readability
> >> and
> >> does
> >>    +not hide information.
> >>    +
> >>    +Descendants are always substantially shorter than the parent and
> >> are
> >>    +are placed substantially to the right.  A very commonly used style
> >>    +is to align descendants to a function open parenthesis.
> >>    +
> >>    +These same rules are applied to function headers with a long
> >> argument
> >> list.
> >>    +
> >>    +However, never break user-visible strings such as printk messages
> >> because
> >>    +that breaks the ability to grep for them.
> >>
> >> I think it's obvious that the 80-column width is no longer _strongly_
> >> preferred, but has been demoted to some kind of a bit weaker
> >> preference.
> >
> > Yes, but this is not what you said before and this is not what I
> > questioned.
>
> It is, if you read what I wrote above carefully.  The 100-column
> width limit has been in effect "for years", and has been defined
> by the combination of the coding style and checkpatch.  The former
> says that going over 80 columns is fine, and the latter limits that
> to 100 columns, to prevent some very long lines.

I'd like to say I appreciate the 80 / 100 limit on code, as it pushed
me to separate out my driver code write operations into a separate
function and significantly clean up the code.

I apologize if my submissions aren't perfect the first time around. I
admit I'm still a baby developer, this is not my day job (although I'd
probably love it if it was). This is only the second driver I've
written from scratch (first, if you consider this is the second
iteration of a driver I wrote before my motorcomm driver). I depend
heavily on checkpatch and the feedback from maintainers, as well as
the coding style from similar drivers. The style and coding policies
that employed kernel maintainers and developers have committed to
heart I need to look up every time I submit something.

So, thank you for your feedback.

>
> >> Also, please note that the coding style explicitly says that the 80-
> >> column rule is to be followed "unless exceeding 80 columns
> >> significantly
> >> increases readability and does not hide information".
> >
> > I already said it earlier... so yeah, we keep repeating ourselves while
> > discussing original point claiming now something else than we actually
> > discuss.
>
> I think it's again about the semantics. :)  Please see above.

