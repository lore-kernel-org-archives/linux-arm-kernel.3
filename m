Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E18CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmtbPxqvbUMAwpaMikq93NqcsvnJIS2FgaxENlamB/w=; b=b1AJACeONjymknlO9Hc78sPXW3
	zKAvpzHPJp37MYaS8gSX7AOLhlBnCzZTvfRVw/rrbSrOjEnkfkaEOplmRr6wjGJioLk0V+2afcohA
	jjl7lWev5JVUWYpmn/RYYCg8dVBcO6D5tJG6XgOCR5USLno3RvpvPJ1slPrFXQIPRvvmZliCSJbK2
	ZjHWit03Mjn/Wpjdm7DyNttJXx5NeypZJNSrTtNMpOAnicoIDoDZ9pK+Q38s4Ksm5/TjzXMri8fZA
	H6J3AXYPPPyvEL+bcr20WlfTFjztilqzgBxITGgsvJ0mNss4BXjbZbXYmAlsgC/a0BrwpM4Goc4k0
	JebJpK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hCA-0000000CbKG-1O0t;
	Fri, 03 Oct 2025 14:55:42 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hC7-0000000CbJN-0gIQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 14:55:41 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4e4f8122660so23776101cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 07:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759503338; x=1760108138; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmtbPxqvbUMAwpaMikq93NqcsvnJIS2FgaxENlamB/w=;
        b=TG745JEUbtdwu+dKdhI6SVqbQ1YDC69jmKh32IayPqpXdMzzp5W7Y5YZLd2WNXFdSs
         bSAjSwQcJP4ezicgLd7sO5hKo4HOIUEZJA/YQ3nGVPsyTmmUXHJ6cM7MjzOElc/wb7w0
         3MM66+fVLKt+3BgVaYZthSEnrjHbS0U3cVGGLj//KjUsjUfN00cawHXERcAXgF5ET9tl
         311ojpiAMt+8Fp91LbIdRZ8fd3uIEoUtASOLwLyzEc6cajvPSH/E/gX+IIufqFgsnCCn
         pr5TKYAQn0KY81OymxEd+9phs5a7clvIJ4UYNI5oUFmGLS2YnE6JQbPFx6dU+s7p1vzh
         l0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759503338; x=1760108138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmtbPxqvbUMAwpaMikq93NqcsvnJIS2FgaxENlamB/w=;
        b=IYRrGvUlOUaL7iMSlSnlmxFaECTAD5xtHdsTbvAo+jXPx1tRiDK7ZbGWtsA2XppQnQ
         nXbvFqjA1pb51hC5bWihJnkxVts2HwRVofAzr1MKf8Y0MjdcZgNXcRWKa68+ZFjKwlyV
         +iu9NVEAOu1XifZSYKOV474o8f6UDDhKGKKhmGrDXbH0EYjvqhUijBcy9Hc/fFYiolWI
         azZdIaBGQyTY2ldE4aO0YD5yd+vxgoOfURoScEuemwhYI4Le1AQ23EzN1eKE0oIR7aHB
         yMAsDxIXhIyArMF6f9/fP0FEz0NwjtiaZ1VgAgSFZFVDlO/bg2iiJPRasEWxl3JykOrY
         QgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWxm6bIN/Ux2qWD02LKE5BiFEgc8h//UN9YkxW7P/OGJDIP2VgWzQpYS4bOK0T/J8gp/logSz20i17MGde64iG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyib5SQ7GcUtZ+QhfiT0MvxXdN7XEr42+Emmp34MXYVS4YQjFtD
	iv248Dyd3qaPhOxmEmTvDV4zc/uSME+ls2/9d7e0/7eEywkILjrcOqLtGK1IrH77ELPsbHlirT3
	RmuRBi1Kfhjoc5EFlQA8DJhpL9n0CnZnFGXBKmDf6tw==
X-Gm-Gg: ASbGncv3VJ1SG4FqqXaDb0PTVK5EqTnBD8IU/8j2S1jZa0FNOrKSt4rDZKB+rrFLXOm
	r477b+2ttYT8hKzj0NzDgb8KbH6Z8rrQPs7Dix3v4mkmR9bGaozcyACODkQPgHT9i9EIHw+v8wy
	97B7cS30w+TMk4u386+HP2bFdnm0OrMUhcV4o2OQxMGCoi3GfbA7269x4qeJVckDM88Wkkf0DDg
	bN63KkK5DmozB6xGE7KSLzXvoKd80j0lWkCKBGZ8gvL20WN/QUf9r3g6mvIqg6P
X-Google-Smtp-Source: AGHT+IEHvSFx6aJopaLDBwFD78bU4fYMz9BJ0/a1hly+2/OCzn4OzJ5AVyA758ZdUYVd33wzD/pBPUkH88IUn5weYpQ=
X-Received: by 2002:a05:622a:53cb:b0:4d9:c572:f9b6 with SMTP id
 d75a77b69052e-4e576b06d58mr45151801cf.55.1759503337482; Fri, 03 Oct 2025
 07:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org> <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org> <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
 <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
 <20251003133304.GA21023@pendragon.ideasonboard.com> <CABjd4YxbyUWghd1ya8UayFkAE-VWQSd5-J2QD0sV7WmS8AXkCg@mail.gmail.com>
In-Reply-To: <CABjd4YxbyUWghd1ya8UayFkAE-VWQSd5-J2QD0sV7WmS8AXkCg@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 3 Oct 2025 18:55:26 +0400
X-Gm-Features: AS18NWAkfyiM21fDkrQMRVecEChPCYc2oBEI6uCtjM6V0760dRy7eaYuH27unlo
Message-ID: <CABjd4YwtwUYFX4bX5vy=AFi=Dn1r6nxWtMvmeKBSjkvriNJtsQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	devicetree@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_075539_222683_98BB2E30 
X-CRM114-Status: GOOD (  55.07  )
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

On Fri, Oct 3, 2025 at 6:13=E2=80=AFPM Alexey Charkov <alchark@gmail.com> w=
rote:
>
> Hi Laurent,
>
> On Fri, Oct 3, 2025 at 5:33=E2=80=AFPM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Fri, Jan 24, 2025 at 11:44:34PM +0400, Alexey Charkov wrote:
> > > On Fri, Jan 24, 2025 at 9:23=E2=80=AFPM Alexey Charkov <alchark@gmail=
.com> wrote:
> > > > On Fri, Jan 24, 2025 at 2:37=E2=80=AFPM Dragan Simic <dsimic@manjar=
o.org> wrote:
> > > > > On 2025-01-24 11:25, Alexey Charkov wrote:
> > > > > > On Fri, Jan 24, 2025 at 2:06=E2=80=AFPM Dragan Simic <dsimic@ma=
njaro.org>
> > > > > > wrote:
> > > > > >> On 2025-01-24 09:33, Alexey Charkov wrote:
> > > > > >> > On Fri, Jan 24, 2025 at 9:26=E2=80=AFAM Alexander Shiyan
> > > > > >> > <eagle.alexander923@gmail.com> wrote:
> > > > > >> >>
> > > > > >> >> There is no pinctrl "gpio" and "otpout" (probably designed =
as
> > > > > >> >> "output")
> > > > > >> >> handling in the tsadc driver.
> > > > > >> >> Let's use proper binding "default" and "sleep".
> > > > > >> >
> > > > > >> > This looks reasonable, however I've tried it on my Radxa Roc=
k 5C and
> > > > > >> > the driver still doesn't claim GPIO0 RK_PA1 even with this c=
hange. As
> > > > > >> > a result, a simulated thermal runaway condition (I've change=
d the
> > > > > >> > tshut temperature to 65000 and tshut mode to 1) doesn't trig=
ger a PMIC
> > > > > >> > reset, even though a direct `gpioset 0 1=3D0` does.
> > > > > >> >
> > > > > >> > Are any additional changes needed to the driver itself?
> > > > > >>
> > > > > >> I've been digging through this patch the whole TSADC/OTP thing=
 in the
> > > > > >> last couple of hours, and AFAIK some parts of the upstream dri=
ver are
> > > > > >> still missing, in comparison with the downstream driver.
> > > > > >>
> > > > > >> I've got some small suggestions for the patch itself, but the =
issue
> > > > > >> you observed is obviously of higher priority, and I've singled=
 it out
> > > > > >> as well while digging through the code.
> > > > > >>
> > > > > >> Could you, please, try the patch below quickly, to see is it g=
oing to
> > > > > >> fix the issue you observed?  I've got some "IRL stuff" to take=
 care of
> > > > > >> today, so I can't test it myself, and it would be great to kno=
w is it
> > > > > >> the right path to the proper fix.
> > > > > >>
> > > > > >> diff --git i/drivers/thermal/rockchip_thermal.c
> > > > > >> w/drivers/thermal/rockchip_thermal.c
> > > > > >> index f551df48eef9..62f0e14a8d98 100644
> > > > > >> --- i/drivers/thermal/rockchip_thermal.c
> > > > > >> +++ w/drivers/thermal/rockchip_thermal.c
> > > > > >> @@ -1568,6 +1568,11 @@ static int rockchip_thermal_probe(struc=
t
> > > > > >> platform_device *pdev)
> > > > > >>          thermal->chip->initialize(thermal->grf, thermal->regs=
,
> > > > > >>                                    thermal->tshut_polarity);
> > > > > >>
> > > > > >> +       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO)
> > > > > >> +               pinctrl_select_default_state(dev);
> > > > > >> +       else
> > > > > >> +               pinctrl_select_sleep_state(dev);
> > > > > >
> > > > > > I believe no 'else' block is needed here, because if tshut_mode=
 is not
> > > > > > TSHUT_MODE_GPIO then the TSADC doesn't use this pin at all, so =
there's
> > > > > > no reason for the driver to mess with its pinctrl state. I'd ra=
ther
> > > > > > put a mirroring block to put the pin back to its 'sleep' state =
in the
> > > > > > removal function for the TSHUT_MODE_GPIO case.
> > > > >
> > > > > You're right, but the "else block" is what the downstream driver =
does,
> > > >
> > > > Does it though? It only handles the TSHUT_MODE_GPIO case as far as =
I
> > > > can tell (or TSHUT_MODE_OTP in downstream driver lingo) [1]
> > > >
> > > > [1] https://github.com/radxa/kernel/blob/edb3eeeaa4643ecac6f4185d6d=
391c574735fca1/drivers/thermal/rockchip_thermal.c#L2564
> > > >
> > > > > so I think it's better to simply stay on the safe side and follow=
 that
> > > > > logic in the upstream driver.  Is it really needed?  Perhaps not,=
 but
> > > > > it also shouldn't hurt.
> > > > >
> > > > > > Will try and revert.
> > > > >
> > > > > Awesome, thanks!
> > > > >
> > > > > > P.S. Just looked at the downstream driver, and it actually call=
s
> > > > > > TSHUT_MODE_GPIO TSHUT_MODE_OTP instead, so it seems that "otpou=
t" was
> > > > > > not a typo in the first place. So maybe the right approach here=
 is not
> > > > > > to change the device tree but rather fix the "gpio" / "otpout" =
pinctrl
> > > > > > state handling in the driver.
> > > > >
> > > > > Indeed, "otpout" wasn't a typo, and I've already addressed that i=
n my
> > > > > comments to Alexander's patch.  Will send that response a bit lat=
er.
> > > > >
> > > > > I think it's actually better to accept the approach in Alexander'=
s
> > > > > patch, because the whole thing applies to other Rockchip SoCs as =
well,
> > > > > not just to the RK3588(S).
> > > >
> > > > Anyway, I've just tried it after including the changes below, and
> > > > while /sys/kernel/debug/pinctrl/pinctrl-handles shows the expected
> > > > pinctrls under tsadc, the driver still doesn't seem to be triggerin=
g a
> > > > PMIC reset. Weird. Any thoughts welcome.
> > >
> > > I found the culprit. "otpout" (or "default" if we follow Alexander's
> > > suggested approach) pinctrl state should refer to the &tsadc_shut_org
> > > config instead of &tsadc_shut - then the PMIC reset works.
> >
> > I've recently brought up an RK3588S-based Orange Pi CM5 Base board, mad=
e
> > of a compute module (CM5, see [1]) and a carrier board (Base, see [2]).
> > The carrier board has a reset button which pulls the PMIC_RESET_L signa=
l
> > of the CM5 to GND (see page 3 of the schematics in [3]).
> >
> > With &tsadc_shut_org the reset button has absolutely no effect. With
> > &tsadc_shut it resets the board as expected.
>
> Interesting. The TSADC shouldn't affect the physical button operation
> at all, if it's really wired to the PMIC as the signal name implies.
> There isn't even any default pull value associated with the TSHUT pin
> config.

On a second thought, I've got another hypothesis. Your baseboard only
pulls the reset line through  a 100 Ohm resistor when the button is
pressed. So if the TSHUT pin is in its default push-pull mode and
stays high when no thermal runaway reset is requested, the reset
button won't pull the line fully to zero, as the TSHUT line pulls it
high at the same time.

If you switch it from &tsadc_shut_org to &tsadc_shut, then it stops
working properly as the thermal protection reset, and GPIO0_A1 remains
high-impendance, thus allowing the reset button to function even
though its pull is too weak.

So maybe change the pin configuration of &tsadc_shut_org in
rk3588-base-pinctrl.dtsi to open drain and retry?

Best regards,
Alexey

