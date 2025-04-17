Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844B2C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZZ0OiCh3i8QphKEZyGH0TyGWbIM9TA+BFLKz7OvmdY=; b=nXzkcwhFUDKRWA67KC51iUyCZv
	nANBAoZ2wgXeLIFCWGclaqFErmPpKnhqxxvYS1Ctg6xfZjHOM/48VWZBpOAi5OgLy1B4Patw6Qrpt
	uGWO+6Shth9rkD+WkGg6r2wh5rJVeRDSAprvlF7espvTyL7K/4DDAU7AUSAzU+bQ08j6+LDBYqj10
	9QeIaozngFkdZHZ0Y+KhbRNBHrF1ysg+wRkl/pXNOsZLPHfG6cCB8Q65nY+Gyhr+lb0QnuCGBY02E
	/GMu1d4avSASqEvNF+bID1u9mQ7Qp1W2HnDXeycqvqrie97ODQiYdShPCrICGYsVjQSwd+WH64cxI
	L5aFUOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5INN-0000000Bql8-2O4P;
	Thu, 17 Apr 2025 06:05:29 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IJt-0000000BqEW-1TTy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:01:54 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-476b4c9faa2so4840891cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744869712; x=1745474512; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZZ0OiCh3i8QphKEZyGH0TyGWbIM9TA+BFLKz7OvmdY=;
        b=Z+eQsFlzEXIaEOIdNvNh8UgLo9juf4XZO3tqVpuX0gdik9X8Pt6bDK5YL8xoe/3AAk
         o8Be1EuF+wfvHJkbYejyRbqjLhWO+6363TqykuUeL/X/d5mKUT48u0/VMx6mHj/lxMG7
         IY/8ASF+VKuIYn985wZaDATt+2aRY7R1ufQHT0qskxp+sjMydIGpTsXfuZSYS6zFCbh4
         dCv3IQsk675R09U3n8wXzXOI21ZbtsgGELm7zm0+RxitW38wpdz8NbT+MwYVb4fTSnsE
         cBGKngBXQVzhqoxLstHfWZryPwD0CTe1MQCbOpgEOEwOxqCWyEIV4Ve/rf1hqagY6F6i
         Cu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744869712; x=1745474512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZZ0OiCh3i8QphKEZyGH0TyGWbIM9TA+BFLKz7OvmdY=;
        b=EgJd5RlFzW+Uls7LpLQNPy7G9dT+ntPkmji6bSOpvkLZhgVzHgp28h1+mXqP1ZsiO6
         KndlbjzbdC4RpeFzJ3pilXHr3j1TtwPlPlPBwZxuHc6X8UKFXwWFj8ECRyXLP3sPp19V
         LB42qxuayTfMA89nTv1h8QuPLAuomx16e+dkEi+v/+oGRR4r/Isq1VntNvmM5zafesRd
         63B6nBxQY96DA1wKeCtFX/CQWhMb2r4A8gbIds3sMz8Zr4tvnGejlGWFSqX2mdyK1iOC
         N/gi+FRaZB7411jZ2elzuwBcoBTvm4dO+HnnoqUA8gZygIclXv+ee4GGRB0kDHaxvq/t
         INKg==
X-Forwarded-Encrypted: i=1; AJvYcCUEzG194E+Zn7z/Ie62/9ISpf6/No2Hb29fIw4KqMzc+US+ZYhVfviaVKoDhtuflHJHj8ha00CC+qYgNy0q8sYl@lists.infradead.org
X-Gm-Message-State: AOJu0YzsYNQoVcEBjn+eX+SnLImdXpCPKmYGUdLx6JzFoe45R6KhiuHW
	HL188oqCUL6aGU1ROkTZ+X1EbtsWnkFJT50915wMvzYHd6hPyZSIamYRdVc6UtV1/EvdsHtYbsE
	1ItfZk0kyypknwoanp+Sn4s1IhcA=
X-Gm-Gg: ASbGnct1+wT5Hs5S42f2VjRzfNaiBaNRdkn9m0AD0wrVly0SfOiiujIcRYEX0r02W4a
	aAJeYkEYiJ5UgWYtnfbiZwDeT+jmmx597cTPUmyKv2gWmJeWpkhJrkR9urL0xoaNRGILHHIJMZt
	1J2ACurbaaz5SIef+oE7J1bTOSZEO8RXLx3FSr3HH39vQpmoDrFXXsE2I=
X-Google-Smtp-Source: AGHT+IF8tMblL4zzcQke4qYiQBnX4U0VMVjKusdYcCfocK8IStZ6GIbCT+kwGjMmzlxIaiYYv7SzQwcpgCKgqbWryyE=
X-Received: by 2002:ac8:7d8f:0:b0:476:98d6:141d with SMTP id
 d75a77b69052e-47ad811527fmr75350031cf.32.1744869711825; Wed, 16 Apr 2025
 23:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-12-f9af689cdfc2@gmail.com> <8feea1ba-2d4a-4898-9882-cf3ec8b03852@kernel.org>
In-Reply-To: <8feea1ba-2d4a-4898-9882-cf3ec8b03852@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 10:01:47 +0400
X-Gm-Features: ATxdqUHbb-NLlWiY3v98GpI67Jq817VdD6NkjDUJu2KmL6qXEllQohh5zOadrGI
Message-ID: <CABjd4YzkUYE3B7sPCm97NFcv7=nkwQTNFjSiomjCHzTFRDCLZg@mail.gmail.com>
Subject: Re: [PATCH 12/13] ARM: dts: vt8500: Add VIA APC Rock/Paper board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_230153_387137_9877062D 
X-CRM114-Status: GOOD (  15.60  )
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

On Thu, Apr 17, 2025 at 9:36=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/04/2025 10:21, Alexey Charkov wrote:
> > diff --git a/arch/arm/boot/dts/vt8500/Makefile b/arch/arm/boot/dts/vt85=
00/Makefile
> > index 255f4403af91c1d6a22416ab694b8eab44bf98a2..c5a2e57d53af4babe40fe2d=
79b2f8d9c1ae1b8db 100644
> > --- a/arch/arm/boot/dts/vt8500/Makefile
> > +++ b/arch/arm/boot/dts/vt8500/Makefile
> > @@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_VT8500) +=3D \
> >       wm8505-ref.dtb \
> >       wm8650-mid.dtb \
> >       wm8750-apc8750.dtb \
> > -     wm8850-w70v2.dtb
> > +     wm8850-w70v2.dtb \
> > +     wm8950a-apc-rock.dtb
> > diff --git a/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts b/arch/arm/bo=
ot/dts/vt8500/wm8950-apc-rock.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..58b3c8deb4f20ae072bf138=
1f1dfa5e5adeb414a
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
>
>
> Odd license, we don't do GPL v4 in the kernel. We do however dual
> license for bindings and DTS. Why choosing such license? Did you take
> the code from somewhere?

I picked the license identifier of the wm8850.dtsi include, which
defines most of the functionality for this board. No preference from
my side, and happy to use whichever license is common practice for
DTS, but I'm simply not sure how differently licensed files and
includes combine together - thus the conservative choice to stick to
what's already there. The original .dtsi was written by Tony Prisk,
not me.

Best regards,
Alexey

