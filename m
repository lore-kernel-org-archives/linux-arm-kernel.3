Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF21FC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOD2UfYHJSjZl/pt9FbtcUXEWsxQSEJ9vHhIuaxcBT8=; b=AeVZUbSJggyOF30OZzofAaaU8s
	vyEN46pdNtGDQkkm2ZxNFa35cGxDa9BBqxNQMJHH6qVjKb1KKrlaAoLjubVg2DFcstsreYurnaaap
	TZNvEQ2bz2IYR138ZF8+AaGm+Op307CMEP/J7ryNtd/wLMeaLOj5UCc+1YZ01R9nUjpRlAHA/ea7Z
	aI4VS02hTpUPfcq8rtKi6p8bZEW4UWAN6NdtZRJTIlY4xwlYsAGpHvhYULkX+ASck6ic2NZCt4idK
	sTWf7FiQC/ZTY7aGzDRgNftx6SiU6442oyCrxb9MirgZvHkUORrhLMJU/mT542UlJMM0ww4tqtzed
	xgR0tI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbPd1-0000000FPTH-1t3o;
	Fri, 24 Jan 2025 19:46:07 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbPbi-0000000FPJb-3yF6;
	Fri, 24 Jan 2025 19:44:48 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e1a41935c3so36791936d6.3;
        Fri, 24 Jan 2025 11:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737747885; x=1738352685; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOD2UfYHJSjZl/pt9FbtcUXEWsxQSEJ9vHhIuaxcBT8=;
        b=O0WEnaN69fRDcpcf0+/M+LrDHQohIbXX40w/9vM3YrVWpH38egkwskMwdnFAlfWtc8
         L3ZEeOLHMfblRKn82ykm8RWaEakwKZaW4pvffzz5n6f0LgDf/Z5hS8QVPvd2rj7cV3RQ
         hsQqva8HEg6iHR8jH8u98qBEW33e1le5vnNFvqJ4By3KS6TRKuwHNO+7mNBhdK/ZB4x+
         xdkkyo4+/D3Ya+CfR5FM7Nua0kLG+wmVgQcmW4DlswrCHxG5KIGv/4MqT5srxgxykeNr
         RkLO3qFNcO8teQ9n+QQZNnk35RPAXn/71E++uJ17TXO0+bPGEIGerbY9+ASBJdsnLBzJ
         kAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737747885; x=1738352685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOD2UfYHJSjZl/pt9FbtcUXEWsxQSEJ9vHhIuaxcBT8=;
        b=N9ZRZuU0x6CvMB60uF1LvRfQj6PA5DATiOaLFzB0M7yQN2RdqB+IwOwhVKRIcF9veU
         1C5UixOzYvDB8dUKfhNFQj6LxJTBNF438KvY5+at+rfPjNpb1GGHa2/F3kUGS3UlDVh8
         jgMuu6XalIl0hNADT4kaNxgB+2uToV5sP6A7/XGHRaBVHtaOSm/u/vvKzLwMiaunF1Xf
         E7Uuxc6Uio7hk1bIsOkTfHGG+5Xx0vlC3B12skrLTJ2YfcFev0rD5LonBbr2nDzbd9Ov
         HfkvoHculLOvxaUqaon6uaTQ6ggsu1O9ypcmTiQ6bxbMQbBWeesrcglgPydwuH72Y7DD
         NTXw==
X-Forwarded-Encrypted: i=1; AJvYcCW/OQgrxBsdyLBOgNYL8MFfCPmqe2CBNNzkYax/G43QQ5GPwlQkynXF/2yTa/d2LdzkQSfJqmR6uG/WerXJ8PI=@lists.infradead.org, AJvYcCXUZkPLBqtbdQ7hV5k1fB87xpM0cB/2tblJNk+R1M9DvMxpFRHW2rPshIf9L7hHIp8FIlDXhigjlhAgAdZpKT06@lists.infradead.org
X-Gm-Message-State: AOJu0YwQzlLHuTAjqoEoy52T8zRwGzS3v+MwnhpKkFMvU44XkwNfV/jF
	9pD2qmN7fqYwfxv0g99vsA+/J1pgGGa0db0rOo/i+FO5XV+lP8FICUOy23k0m67hJOr8OmdpTXb
	lzzXtkBLSyo9rLQOLPUjZEcNN0pA=
X-Gm-Gg: ASbGncsmyQa7tYVSY7IJGf/QoF2X+t1GutMaEUs4Ip5644TyllLOvXl1HDe5/Cy7bB/
	vI0MzerNiJmEq69MaWWFRSglBr8Lm/+eU5pZJvthV7XIlvPGTgA956P8sYyOpiGk53KFTNliWWA
	==
X-Google-Smtp-Source: AGHT+IEwdcGyIv8lm858FpPS9WNGZiSmay44cu0Hl9ikO4VKi94V+TJkWI5vKNLFcYt7f/0KTwOHH8wB/TpJhS5EnOk=
X-Received: by 2002:a05:6214:3b81:b0:6dd:13b0:1008 with SMTP id
 6a1803df08f44-6e1b220a25emr426812666d6.30.1737747885315; Fri, 24 Jan 2025
 11:44:45 -0800 (PST)
MIME-Version: 1.0
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org> <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org> <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
In-Reply-To: <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 24 Jan 2025 23:44:34 +0400
X-Gm-Features: AWEUYZm_EiKPNGxbgHDs4gZQ4CmxiOcxC-PdiZ0tcOXrYDeOTA-NItxJz0l0e0g
Message-ID: <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
To: Dragan Simic <dsimic@manjaro.org>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_114446_986747_855A06FB 
X-CRM114-Status: GOOD (  44.35  )
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

On Fri, Jan 24, 2025 at 9:23=E2=80=AFPM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Fri, Jan 24, 2025 at 2:37=E2=80=AFPM Dragan Simic <dsimic@manjaro.org>=
 wrote:
> >
> > On 2025-01-24 11:25, Alexey Charkov wrote:
> > > On Fri, Jan 24, 2025 at 2:06=E2=80=AFPM Dragan Simic <dsimic@manjaro.=
org>
> > > wrote:
> > >> On 2025-01-24 09:33, Alexey Charkov wrote:
> > >> > On Fri, Jan 24, 2025 at 9:26=E2=80=AFAM Alexander Shiyan
> > >> > <eagle.alexander923@gmail.com> wrote:
> > >> >>
> > >> >> There is no pinctrl "gpio" and "otpout" (probably designed as
> > >> >> "output")
> > >> >> handling in the tsadc driver.
> > >> >> Let's use proper binding "default" and "sleep".
> > >> >
> > >> > This looks reasonable, however I've tried it on my Radxa Rock 5C a=
nd
> > >> > the driver still doesn't claim GPIO0 RK_PA1 even with this change.=
 As
> > >> > a result, a simulated thermal runaway condition (I've changed the
> > >> > tshut temperature to 65000 and tshut mode to 1) doesn't trigger a =
PMIC
> > >> > reset, even though a direct `gpioset 0 1=3D0` does.
> > >> >
> > >> > Are any additional changes needed to the driver itself?
> > >>
> > >> I've been digging through this patch the whole TSADC/OTP thing in th=
e
> > >> last couple of hours, and AFAIK some parts of the upstream driver ar=
e
> > >> still missing, in comparison with the downstream driver.
> > >>
> > >> I've got some small suggestions for the patch itself, but the issue
> > >> you observed is obviously of higher priority, and I've singled it ou=
t
> > >> as well while digging through the code.
> > >>
> > >> Could you, please, try the patch below quickly, to see is it going t=
o
> > >> fix the issue you observed?  I've got some "IRL stuff" to take care =
of
> > >> today, so I can't test it myself, and it would be great to know is i=
t
> > >> the right path to the proper fix.
> > >>
> > >> diff --git i/drivers/thermal/rockchip_thermal.c
> > >> w/drivers/thermal/rockchip_thermal.c
> > >> index f551df48eef9..62f0e14a8d98 100644
> > >> --- i/drivers/thermal/rockchip_thermal.c
> > >> +++ w/drivers/thermal/rockchip_thermal.c
> > >> @@ -1568,6 +1568,11 @@ static int rockchip_thermal_probe(struct
> > >> platform_device *pdev)
> > >>          thermal->chip->initialize(thermal->grf, thermal->regs,
> > >>                                    thermal->tshut_polarity);
> > >>
> > >> +       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO)
> > >> +               pinctrl_select_default_state(dev);
> > >> +       else
> > >> +               pinctrl_select_sleep_state(dev);
> > >
> > > I believe no 'else' block is needed here, because if tshut_mode is no=
t
> > > TSHUT_MODE_GPIO then the TSADC doesn't use this pin at all, so there'=
s
> > > no reason for the driver to mess with its pinctrl state. I'd rather
> > > put a mirroring block to put the pin back to its 'sleep' state in the
> > > removal function for the TSHUT_MODE_GPIO case.
> >
> > You're right, but the "else block" is what the downstream driver does,
>
> Does it though? It only handles the TSHUT_MODE_GPIO case as far as I
> can tell (or TSHUT_MODE_OTP in downstream driver lingo) [1]
>
> [1] https://github.com/radxa/kernel/blob/edb3eeeaa4643ecac6f4185d6d391c57=
4735fca1/drivers/thermal/rockchip_thermal.c#L2564
>
> > so I think it's better to simply stay on the safe side and follow that
> > logic in the upstream driver.  Is it really needed?  Perhaps not, but
> > it also shouldn't hurt.
> >
> > > Will try and revert.
> >
> > Awesome, thanks!
> >
> > > P.S. Just looked at the downstream driver, and it actually calls
> > > TSHUT_MODE_GPIO TSHUT_MODE_OTP instead, so it seems that "otpout" was
> > > not a typo in the first place. So maybe the right approach here is no=
t
> > > to change the device tree but rather fix the "gpio" / "otpout" pinctr=
l
> > > state handling in the driver.
> >
> > Indeed, "otpout" wasn't a typo, and I've already addressed that in my
> > comments to Alexander's patch.  Will send that response a bit later.
> >
> > I think it's actually better to accept the approach in Alexander's
> > patch, because the whole thing applies to other Rockchip SoCs as well,
> > not just to the RK3588(S).
>
> Anyway, I've just tried it after including the changes below, and
> while /sys/kernel/debug/pinctrl/pinctrl-handles shows the expected
> pinctrls under tsadc, the driver still doesn't seem to be triggering a
> PMIC reset. Weird. Any thoughts welcome.

I found the culprit. "otpout" (or "default" if we follow Alexander's
suggested approach) pinctrl state should refer to the &tsadc_shut_org
config instead of &tsadc_shut - then the PMIC reset works.

Best,
Alexey

