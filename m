Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B22C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZV2eo8l44i659VRpU6Jc0rPYdN+/WIVgMkUx/EFXO4=; b=01b+ILpeLOmoCQMC4CHITXjOWm
	S+VYubSi3mdq+ufmW1mfBQepjN3u2TwPKEtzX0B7bifU+KuJyb6TXIqPa7rq+JOFn4ynRN/N9fydE
	qHc38PNNvPn/99wnfeo5YVR4DCFlbrDjY1oh0uetSG0ZNdaa8H2txCH+7YVsSpX77tVgDhibkF7xJ
	vriWt5BL6WvItHcV7v+MkLcm3HupnMNOQPDyymDbDL9LGpZ3ntGwKG29cT6plGVxpbnrF2yldkhVe
	MmK1gmeo+0fqYH6qfkf3r5EezsVf5dyPs/P19hJq69q6fNzgbhzfNU3XCC4VL4f6M4vLhg3x2go8w
	qhAK93mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJ3Z-0000000Ceqd-2WjJ;
	Fri, 21 Aug 2026 06:48:49 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJ3W-0000000CeqI-0m53
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 06:48:47 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-39fa5e3a428so4412101fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 23:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787294924; cv=none;
        d=google.com; s=arc-20260327;
        b=okigwJB5o9sZW6RClQE6H9CsRwGuXtBlubWoIYyykp+L26hbrCpZpalkgbGULmdSij
         T5+3wxw22DYNTxFmJSOEelLhGWTbQy9zm1R5GEYUyiFetvFLms9CFrUryaGEAwKz4Kq1
         19ODUIMlanC7YYK5HfRM4THN/4gzfj6CFRJV1/WTX0u+BjNlkWjWtqZBJ5rbNsxccpW4
         zbx7pA5Xa5iqcqm5vjnbP6WQ3C60wrAsbv3qp3DND7TKkAF0knePpfHOyCBldxqjSdzt
         HIRnpC5wPKt8w7uYZlpIqowVrdFQ6WK1iga+I7TSOjrU9UVRMMjYyGT8aXyJcw1Wkw6V
         JYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZV2eo8l44i659VRpU6Jc0rPYdN+/WIVgMkUx/EFXO4=;
        fh=jNRt+pHdGKwcNea4WzMwpcwjHmchlwo0NtUeocMTp5I=;
        b=GZEm9O6tlYM5V2IaOPxW4vW3iqdbUaPK4MvFEBubFWWxEWy1i3qQvKF0ZRIEUghS1Z
         24Rwche3va78a71Kyl5x8pWKRsU1h1EubJxnmNeNjF+o8bxhqgSyIOkOjl3iqYtgOj9U
         RRtiiskMJzIw4l8sT/Df+zPkHvSOFx/PCq8AQ942EejNJoPuRcIwPnbspxMMQhjUULR0
         Kw3IQ77Jk+NSayjDO1WvB0p431wG5cY2KzFrkPhIfud3WPB3SuJkE+8tzKEkS4jQ0MfK
         lPubDPtqi45fzALaoXjqMIlMVMDQLyzi14VgLZZzSrd7CanT4hukrd0LeXPexpYuN8Mq
         ycoQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787294924; x=1787899724; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZV2eo8l44i659VRpU6Jc0rPYdN+/WIVgMkUx/EFXO4=;
        b=TZo9CHJu4sqLVnAkUEOfarHdakEs3tqYJH8df022fbQzOSggGPd7PpG4Iu5ij0yjaS
         q0XB/fNrCaNleOLQZ+btrGJlVEvDDHNRMzzJyh/83aSiikhYH9GV3aZvrZMfbQkGMboU
         FtNGfw9Gc6TaBr204jMWf9XHqsLol7DJVsrKz56u5byuGM/Ur3arhjdIYy4Da73HXUfu
         o2WCuLpqz3TJGdjuL9NwBF2UhYNYHHQmGzfIU8eBFq486TrXpcYBqDFXywiah4EEIg5+
         cSzOBiAYn0bZoK3wkpgawKdgGHv/tKjCkJg97IDkmj0dZ8a7m7NgZPHmpnUncqoJitL3
         8ZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294924; x=1787899724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZV2eo8l44i659VRpU6Jc0rPYdN+/WIVgMkUx/EFXO4=;
        b=mnwqKc4M1CgZEtI3RcwsnfQK4bzE66xJTf7w7KSCAadJSucy4mqKIYUu5WoKZbKH0f
         iQOPl2blf+ndnpJgQ32SDruWOPtc/3+TmZvdjXikWJXPX1v9JWfvBZy+FWJFhP2Nklr0
         uRXzgL9X+6QhmHw1mtycWmMbcDVsrGf9ydA6gQuOmW8HhGKynUSARSMfiPGCb3VzTPd5
         YkIB4sKWOUv6SvN32jDhMorF67Yo/LtouVbOb6ECTkO1Abz58WQqOl5XQbNxZZtH2BqO
         A9hVGAL+dAi43deBYfGjkDniHuCD7n/LKwxqUm2HH+1lWJtl5/BDRtIfLJYQYGeFoZgJ
         Abpg==
X-Forwarded-Encrypted: i=1; AHgh+Row8+ufYL6DK6PZftMEA2MkOKRdz+O3m24ShjS17MVtKTG8cCNvNueNS2tBnYET1tEcJnixb/YmSxN9hAG/NBDu@lists.infradead.org
X-Gm-Message-State: AFuF++no4oKRHGfitt5tN+c5Jh198z/TJOrUi6iZA9VEbEF0U4g7uVBa
	mne0W52LsUop2+8XSFh3mF6GSq9lTfVVpgYH4Kim6p76zpEG8TZKbCfvwytMKUzp3muSGgVhxPs
	himuOhRQm/lYUDxEZzMcsO5sBpqF4LcQ=
X-Gm-Gg: AR+sD12in4ZF9e75d1R7cKaFwFbPkCm00NNmFTkVx0LnwOW2I8Sf/xJh8ccxfs1+40B
	oIKoFmucyEpCksscIh87t70/u04RJYKJ5UmAxfGYUszt3rjYmfiQpcN1Ov+Qm3aFYZ06Wh79ABA
	Q8t2QKcF3661JwSlGNnKI5/w1zxtUjE4J+qbZHFPVT8oQnq29IkB39tbUwh3u6RWKiA+GOFnfuo
	ih+ycta0DlGTgjXY6/9Rj8SB+KlPpmLqeLQ0nCHPhFMs9avvzDuLRGg8/2JukiWEVC8jHqkpWgW
	twgSRKFeKqHHTRKfF8fVODgF2ziFWTIcJU26T2K4nTx6Mw==
X-Received: by 2002:a05:651c:222b:b0:3a1:8dd6:aada with SMTP id
 38308e7fff4ca-3a1b0e134edmr3994451fa.4.1787294924052; Thu, 20 Aug 2026
 23:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
 <20260727-ventura2_initial_dts-v9-2-504c0ec68039@gmail.com>
 <178724902712.20555.7009712214570349708.b4-review@b4> <CAF7HswN1ZzwjfXjG2hV5tEkVZkZYp0CiVNSo_9A4m3tsqQp_Bg@mail.gmail.com>
In-Reply-To: <CAF7HswN1ZzwjfXjG2hV5tEkVZkZYp0CiVNSo_9A4m3tsqQp_Bg@mail.gmail.com>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 21 Aug 2026 14:51:47 +0800
X-Gm-Features: AcwNN1U6V2Do82rvIt74ZZ-aX7aerlDnXhaA1qYUWN10XHuS2TwjSTUhQfWOomU
Message-ID: <CAF7HswMpfibMRysJQYrkA4EC2Ks3C_20nZkhpVPP3w-J4BoxQA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Tan Siewert <tan.siewert@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_234846_279771_956194C4 
X-CRM114-Status: GOOD (  30.85  )
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

Hi Andrew,

On Fri, Aug 21, 2026 at 2:31=E2=80=AFPM Kyle Hsieh <kylehsieh1995@gmail.com=
> wrote:
>
> Hi Tan,
>
> Thanks for the review.
>
> On Fri, Aug 21, 2026 at 2:04=E2=80=AFAM Tan Siewert <tan.siewert@9element=
s.com> wrote:
> >
> > Hi Kyle,
> >
> > > Ventura2 is a Rack Management Controller. It is a modular
> > > device designed to manage liquid cooling systems and monitor hardware
> > > states within an IT rack. The system uses an AST2600 BMC for manageme=
nt.
> > >
> > > RMCv2 serves several critical roles:
> > > - Detects liquid leakage at both tray and rack levels.
> > > - Communicates with and controls liquid cooling equipment.
> > > - Manages leakage events and executes system recovery protocols.
> > >
> > > Key hardware features include:
> > > - An extensive I2C and IO expander topology to support comprehensive
> > >   sensor monitoring and backward compatibility with legacy trays.
> > > - MCTP over I2C support for asynchronous device communications.
> > > - A dual-flash design for BMC firmware redundancy.
> > >
> > > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> >
> > *snip*
> >
> > > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dt=
s b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > > new file mode 100644
> > > index 000000000000..f1273ca31bf8
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > > @@ -0,0 +1,3005 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +// Copyright (c) 2023 Facebook Inc.
> > > +/dts-v1/;
> > > +
> > > +#include "aspeed-g6.dtsi"
> > > +#include <dt-bindings/i2c/i2c.h>
> > > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > > +
> > > +/ {
> > > +     compatible =3D "facebook,ventura2-rmc", "aspeed,ast2600";
> > > +     model =3D "Facebook Ventura2 RMC";
> > > +
> > > +     aliases {
> > > +             /*
> > > +             * Pre-allocate I2C bus aliases for userspace predictabi=
lity.
> > > +             * Several I2C channels are intentionally left empty in =
this
> > > +             * DTS as they are strictly reserved for future hardware
> > > +             * feature expansions and add-on boards that will interf=
ace
> > > +             * with these busses.
> > > +             */
> > > +             /*
> > > +             * i2c switch 0-0077, pca9548, 8 child channels assigned
> > > +             * with bus number 16-23.
> > > +             */
> >
> > This alignment is one of the things that seem to be a false-positive fo=
r
> > dt-check-style in strict mode (value-whitespace). See [0] where Krzyszt=
of said
> > that it may report false-positives, and "Review and investigate warning=
s from
> > 'strict' mode, but do not fix them automatically without thinking".
> >
> > @Krzysztof wdyt about this one?
>
> You're right, and this is a regression I introduced in v9. In v8 these co=
mment
> blocks used the standard kernel style. While running dt-check-style, I ap=
plied
> the strict-mode output too mechanically and dropped the space before '*' =
in all
> 38 comment blocks in the file. I will restore to the standard style in v1=
0.

This is the part I'd like your input on, since it goes against your v8
review where you asked me to fix the 49 mixed-indent-chars reported in
relaxed mode.

Looking at the output again, all 52 hits on the current file are on comment
lines. The standard kernel comment style '\t * ' is a tab followed by a
space, so the tool flags every correctly formatted multi-line comment. The
49 you saw in v8 were the same thing. [property-order] on the spi node
behaves the same way - it wants #address-cells and #size-cells split apart,
which is what Tan asked me to change back.

So I can either restore the kernel comment style and note these as false
positives in the cover letter, or keep the v9 form that satisfies the tool.
Which would you prefer for v10?

Thanks,
Kyle Hsieh

