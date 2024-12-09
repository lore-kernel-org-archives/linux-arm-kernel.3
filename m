Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEF7E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0pYVI0rIMt/vUsXuEhU3q6EMT1SoyXTaXNYDyXxI18=; b=QCF8jYQ3CxERMN3203NTUOSskn
	Dt2c2mm6rBjngMuwUvQbwAKOKV3zRMxJ3Q5zjMNDE1sL8/9wQoCZJ7QtY5tkSYRqgXYcMvOne66Gc
	OqBrhXn0Mz7H4Sq4dKenqijCBMWsuvAHLUApgOmiaH4OhDjyRDD6i9jRgnoP8hPe2nRiMYrdhkY/o
	XOcQ9QKLKC2pi64j1QOAfh7VxN0FSBeAynvCATgE8YAN1UEcJ+iX/bY92CwosKu/ffCRyE1J1pxzn
	At7ebVMZVgIez6XElztx8fTAOJjL0bXMZFA2RJhdNIRThC5jB5vSkJa0G9HP/JIUZhc0yfiJGODiZ
	srru+W9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdYN-00000007tnZ-2Y9o;
	Mon, 09 Dec 2024 13:11:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdEi-00000007nOx-3paV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 12:51:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so4335471a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 04:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733748699; x=1734353499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0pYVI0rIMt/vUsXuEhU3q6EMT1SoyXTaXNYDyXxI18=;
        b=ZVfHMHU6wXFLEkXyPNh99n7TqAfuHNvJ97JN6bAbe2o4FBV8e6kTuZ2bmc0p1iBQ4o
         qE/gZWJFvtP447kysTj7flAzy6CQqWUH65CYQIm1IdNCe9YN8PkDrTqpZo+YfiR0OeTY
         l8J84KNaOr+VHt7mm7e9S/KKt0vRS/kD5oMX25zNWaUt2x7hKps8+cFD8Gn6N7ay9Kf6
         siGL/RrAHHWF9121d12aXbj+0blE/qtvdn4cyzle7vvMaS/GXdBu6voFVa19k82zwwLp
         IPbo6Ff0Ai+F16svoT5eiI1t9r1RI9KAVvE9CYsrrZs7t5Bw1NjdHCH1vdXs4qXQVO3l
         31QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733748699; x=1734353499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0pYVI0rIMt/vUsXuEhU3q6EMT1SoyXTaXNYDyXxI18=;
        b=oECAW/eBUhw7gKuq9NNRIA1ErEbLSp53YAdswMBhocPdDufKiTbGS3cDIzr7x/tJqE
         P+3g2BMVaWD2F+mx9XYRHqWLZgVywPfJXEWeZ+Pf+L4oKHdKO3I1jMp8D2JIjpedkPYH
         Lntk3tZEjQxbJZdUSiiuJwrPeS1BYYmniN8xzKBRJy7d8Uz27BPB4ima4bpEqnirYnMd
         OJwQyymKXPwrh3nS58rKKlAZSLJiUwl7WWRDMVIqezb6GO43S8iVrNZvoc3UXSlMW0Yi
         qoPSBcUBvvZV1QfIHnvXrO59p4mV0oY9/x5nMCe1iocv6xDbHomF+f0dR1aMXeUU+Yay
         ELOA==
X-Forwarded-Encrypted: i=1; AJvYcCUIkvZRiTIeKaQQZnw7XlUnLF6P+FBO0IBOFlEIMXjKJv2BIoiqY/Vsuuawr1MVQJG8Jk0DAC6+HpXX5vgA/hNS@lists.infradead.org
X-Gm-Message-State: AOJu0YzsAQpCc3byxdUY1/RItsbVtny6U0yiWJHiuWVgNFwhdjFX3ftb
	xjkd+Ng0pWovpkin1NBjCWHry5ES1DYehLfWnYot1DlDMTJbTQStdpUtKMsCofHq9r5qWXnY5Gz
	MuB0qCkEoK3gKNvgH3g3GTItWXyo=
X-Gm-Gg: ASbGncv/ezV2n9ZW4cup9lhaMgoVbtf2vCBA+dRXjWzSZXq7fyR5oDhsGHYBUGEJ24U
	WpVjW26DFdKRewHCcMdwW9dMIN6kfAiZxbNHeHHAPtSGHduXpbhICUmnZ7CYiMUOs
X-Google-Smtp-Source: AGHT+IExZsuV9qZ60jM3CNxwtfATwtZMmIJq3uoo8pM6xbqf0trkd4ZMavUYr+ponHmxavZhf+YgUtsJjOzCmMrNzZU=
X-Received: by 2002:a05:6402:2689:b0:5cf:e894:8de9 with SMTP id
 4fb4d7f45d1cf-5d4184f7b02mr641635a12.3.1733748699088; Mon, 09 Dec 2024
 04:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20241209105237.10498-1-o451686892@gmail.com> <3279e669-1ee2-4792-9e10-8b40928de6b4@sirena.org.uk>
In-Reply-To: <3279e669-1ee2-4792-9e10-8b40928de6b4@sirena.org.uk>
From: Weizhao Ouyang <o451686892@gmail.com>
Date: Mon, 9 Dec 2024 20:51:28 +0800
Message-ID: <CAHk0Hov5k37=MtTBLWTj+Dwm4EXE0xGJS1Uc8xgyLtJxusqsww@mail.gmail.com>
Subject: Re: [PATCH] kselftest/arm64: abi: fix SVCR detection
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_045140_948917_C7B7DB2C 
X-CRM114-Status: GOOD (  15.85  )
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

On Mon, Dec 9, 2024 at 8:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Dec 09, 2024 at 06:52:37PM +0800, Weizhao Ouyang wrote:
>
> > When using svcr_in to check ZA and Streaming Mode, we should make sure
> > that the value in x2 is correct, otherwise it may trigger an Illegal
> > instruction if FEAT_SVE and !FEAT_SME.
>
> >       // Set SVCR if we're doing SME
> > -     cbz     x1, 1f
> >       adrp    x2, svcr_in
> >       ldr     x2, [x2, :lo12:svcr_in]
> > +     cbz     x1, 1f
> >       msr     S3_3_C4_C2_2, x2
>
> This is against an older verison of the code so wouldn't apply now.
> It's not also checking the value of SVCR, this is checking the SME flag
> passed in via x1.  You can see that the SVCR value is loaded into x2 but
> the check is against x1.

Hi Mark,

This patch aims to fix the second check (SVCR_ZA_SHIFT) instead of
the first one (the x1 SME flag you're referring to):

// Load ZA and ZT0 if enabled - uses x12 as scratch due to SME LDR
tbz x2, #SVCR_ZA_SHIFT, 1f
mov w12, #0
ldr x2, =3Dza_in
2: _ldr_za 12, 2

If SME disabled, x2 will not have an expected value.

BR,
Weizhao

