Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C1FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Oct 2025 11:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpR+xC9UI9aVYPaJ+/mAuENyABy3uI8m/ggwA2QkJpA=; b=3eyYG9wneVnC/LtTP6wQb76WMe
	lCFZ7Uqo1LJe9fot6YcSJRkZ4dcSQUsLVWBZbm2ZkCXCmuR8u56RugJMqtyiSQ2qNM6EQue4b7vRM
	HAusAJjdA3P+DUOqmVdTFoRHQCB7THlicZ5JcCqlO2RaOzZLHQoQXJl5FNOuA/uqhhPdEKzMnwlZC
	rwGfymEXZ8KnIM37R/TjwDa+45n2ouPkKua3hI1QfSt9z6JKqrZFw/PcJLsYC52N9GiFaP8F+SUss
	5XKy8uMTZ6xVQW6AMez1rzGToaoborNtJvdsNuSX2TTGRxhqLTPHxqco7WG4ZMadKeM1ytgh0QM0L
	jASG79mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v50eE-0000000DgDU-0J5x;
	Sat, 04 Oct 2025 11:41:58 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v50eB-0000000DgCj-2YQt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Oct 2025 11:41:56 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4da37f6e64cso32831981cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Oct 2025 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759578114; x=1760182914; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpR+xC9UI9aVYPaJ+/mAuENyABy3uI8m/ggwA2QkJpA=;
        b=d0iL/Be3/9J/JdgQTdOh87qt92bdexg8MTsWu9rshNlFxJs7WVRryD8FVjjspIy/Js
         SVjScqMg8gjhm2Iu8GLXPcARRUWdKa6ePh+WgpsamjVrASLMxov6MsQzcQaQjTrbw31C
         ySNzhM+QzapURd66Ye8Kgjf3zPV1s79zJBUWy1R4mzqmKQsi00rTj4kmbwIUsvx5O9bX
         Kz4bt1tr15Fwc25hXeHsbBMtPF9azpXvk98KsH/swBn1+iFx3VmmHRrZy8TlZHUUKwd4
         qReGTTPu0ZwEUntjrpXM9ss+CvPnObqsTfdgmIAUR2Hvqi0knI74nePjNyrlQ6bMEjd5
         Ko3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759578114; x=1760182914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpR+xC9UI9aVYPaJ+/mAuENyABy3uI8m/ggwA2QkJpA=;
        b=OjgGXkj0XChOtwJi4LvWYFqf/Xb/hihfp4fUEEYEEPmJg0DsmfdntS5jfvIG9wMgFz
         5AyGNn8szLVmiOAQIuz+w01JFs+MWfiA5q/IhC5HyaAKGrC7szws1fn1tqsFwrBt96uC
         r2IVwMdtPdA6yaYVTwkLHGiP7G134m7KsxPcuvCxnf3rUybQP3BwXf2FvryJsjjo4/xj
         pGVKcH2/1YDK6XkFwk6xdWc7ciSSVt6engfIUANiAO6fCCOAFqa/6vaBL2vbl8aG4hYE
         3qduufggxwN0R+ITuIBYajKHhdflZAbe/WV1cXmPZGm+qHmUaHUIzafnc4+E+uydDjPA
         wq0g==
X-Forwarded-Encrypted: i=1; AJvYcCXRBQsbx1KWHtMuXlClUVaBk/CSoSWl4ee9/Wy2ROg57yq+ni3kJtAqnrTCCvpu/ThSgZumu93m8iJepQ8iei8M@lists.infradead.org
X-Gm-Message-State: AOJu0YwEDQegYRZa4zmtDbWRUlB37lVHtTOAfoVCsPi4ex0+sxrVe4yH
	8ukf6qHxylWYWf6yyf9RLtlLM29l0g61VLqYaB3JaJCDllwusWKwYhA8PdievqQJ7YlaPKukCyl
	Mm1WNpyklV93ALeEpISLHhNhw1SakMIo=
X-Gm-Gg: ASbGncs7HWmHBJT2cZnix0vsqfs2liSDAQCTYwBQsCBG5t/EWPiklofCdWR6/LXqJCR
	msJqLQ+nNWAsy6go8LfWBhqtuUGOFhwBHluMfXRb3e/PSQn/wTvaPOtZcRwUz57G6VuIoBcgjrb
	7mQ5k59CZnKwfk4p7tyXKAIthyr7E7qr1FD0nMma98HlL2kDDjPW8ULh2VkG+O1dt5+VvoYV7J7
	M8hsM2yPrU3sxQ3OpKV9ukwP/Xap9guFA==
X-Google-Smtp-Source: AGHT+IEiCgoQUtulfjfbUZqNJXGTIrrJgjtpSpNPgwEgXUAG2pMT/f/hMciGbXI2869MDPsj8X8CukNldkZDB51bknk=
X-Received: by 2002:ac8:5e4e:0:b0:4e3:16bd:3e16 with SMTP id
 d75a77b69052e-4e576b06dc6mr76789121cf.56.1759578114196; Sat, 04 Oct 2025
 04:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org> <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org> <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
 <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
 <20251003133304.GA21023@pendragon.ideasonboard.com> <CABjd4YxbyUWghd1ya8UayFkAE-VWQSd5-J2QD0sV7WmS8AXkCg@mail.gmail.com>
 <CABjd4YwtwUYFX4bX5vy=AFi=Dn1r6nxWtMvmeKBSjkvriNJtsQ@mail.gmail.com> <20251003232856.GC1492@pendragon.ideasonboard.com>
In-Reply-To: <20251003232856.GC1492@pendragon.ideasonboard.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 4 Oct 2025 15:41:41 +0400
X-Gm-Features: AS18NWD5l826BtvjlGeJjlKkvc2YdZS_POG-dgOrknV-XIqi7CLGxEQUrunvhfM
Message-ID: <CABjd4Yx9rt2W=MhCSyO5vaxndD1jvGHNWsz7J=HnvnJcgOvQHw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251004_044155_691358_5CE56EAD 
X-CRM114-Status: GOOD (  62.36  )
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

On Sat, Oct 4, 2025 at 3:29=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Alexey,
>
> On Fri, Oct 03, 2025 at 06:55:26PM +0400, Alexey Charkov wrote:
> > On Fri, Oct 3, 2025 at 6:13=E2=80=AFPM Alexey Charkov wrote:
> > > On Fri, Oct 3, 2025 at 5:33=E2=80=AFPM Laurent Pinchart wrote:
> > > > On Fri, Jan 24, 2025 at 11:44:34PM +0400, Alexey Charkov wrote:
> > > > > On Fri, Jan 24, 2025 at 9:23=E2=80=AFPM Alexey Charkov <alchark@g=
mail.com> wrote:
> > > > > > On Fri, Jan 24, 2025 at 2:37=E2=80=AFPM Dragan Simic <dsimic@ma=
njaro.org> wrote:
> > > > > > > On 2025-01-24 11:25, Alexey Charkov wrote:
> > > > > > > > On Fri, Jan 24, 2025 at 2:06=E2=80=AFPM Dragan Simic <dsimi=
c@manjaro.org>
> > > > > > > > wrote:
> > > > > > > >> On 2025-01-24 09:33, Alexey Charkov wrote:
> > > > > > > >> > On Fri, Jan 24, 2025 at 9:26=E2=80=AFAM Alexander Shiyan
> > > > > > > >> > <eagle.alexander923@gmail.com> wrote:
> > > > > > > >> >>
> > > > > > > >> >> There is no pinctrl "gpio" and "otpout" (probably desig=
ned as
> > > > > > > >> >> "output")
> > > > > > > >> >> handling in the tsadc driver.
> > > > > > > >> >> Let's use proper binding "default" and "sleep".
> > > > > > > >> >
> > > > > > > >> > This looks reasonable, however I've tried it on my Radxa=
 Rock 5C and
> > > > > > > >> > the driver still doesn't claim GPIO0 RK_PA1 even with th=
is change. As
> > > > > > > >> > a result, a simulated thermal runaway condition (I've ch=
anged the
> > > > > > > >> > tshut temperature to 65000 and tshut mode to 1) doesn't =
trigger a PMIC
> > > > > > > >> > reset, even though a direct `gpioset 0 1=3D0` does.
> > > > > > > >> >
> > > > > > > >> > Are any additional changes needed to the driver itself?
> > > > > > > >>
> > > > > > > >> I've been digging through this patch the whole TSADC/OTP t=
hing in the
> > > > > > > >> last couple of hours, and AFAIK some parts of the upstream=
 driver are
> > > > > > > >> still missing, in comparison with the downstream driver.
> > > > > > > >>
> > > > > > > >> I've got some small suggestions for the patch itself, but =
the issue
> > > > > > > >> you observed is obviously of higher priority, and I've sin=
gled it out
> > > > > > > >> as well while digging through the code.
> > > > > > > >>
> > > > > > > >> Could you, please, try the patch below quickly, to see is =
it going to
> > > > > > > >> fix the issue you observed?  I've got some "IRL stuff" to =
take care of
> > > > > > > >> today, so I can't test it myself, and it would be great to=
 know is it
> > > > > > > >> the right path to the proper fix.
> > > > > > > >>
> > > > > > > >> diff --git i/drivers/thermal/rockchip_thermal.c
> > > > > > > >> w/drivers/thermal/rockchip_thermal.c
> > > > > > > >> index f551df48eef9..62f0e14a8d98 100644
> > > > > > > >> --- i/drivers/thermal/rockchip_thermal.c
> > > > > > > >> +++ w/drivers/thermal/rockchip_thermal.c
> > > > > > > >> @@ -1568,6 +1568,11 @@ static int rockchip_thermal_probe(s=
truct
> > > > > > > >> platform_device *pdev)
> > > > > > > >>          thermal->chip->initialize(thermal->grf, thermal->=
regs,
> > > > > > > >>                                    thermal->tshut_polarity=
);
> > > > > > > >>
> > > > > > > >> +       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO)
> > > > > > > >> +               pinctrl_select_default_state(dev);
> > > > > > > >> +       else
> > > > > > > >> +               pinctrl_select_sleep_state(dev);
> > > > > > > >
> > > > > > > > I believe no 'else' block is needed here, because if tshut_=
mode is not
> > > > > > > > TSHUT_MODE_GPIO then the TSADC doesn't use this pin at all,=
 so there's
> > > > > > > > no reason for the driver to mess with its pinctrl state. I'=
d rather
> > > > > > > > put a mirroring block to put the pin back to its 'sleep' st=
ate in the
> > > > > > > > removal function for the TSHUT_MODE_GPIO case.
> > > > > > >
> > > > > > > You're right, but the "else block" is what the downstream dri=
ver does,
> > > > > >
> > > > > > Does it though? It only handles the TSHUT_MODE_GPIO case as far=
 as I
> > > > > > can tell (or TSHUT_MODE_OTP in downstream driver lingo) [1]
> > > > > >
> > > > > > [1] https://github.com/radxa/kernel/blob/edb3eeeaa4643ecac6f418=
5d6d391c574735fca1/drivers/thermal/rockchip_thermal.c#L2564
> > > > > >
> > > > > > > so I think it's better to simply stay on the safe side and fo=
llow that
> > > > > > > logic in the upstream driver.  Is it really needed?  Perhaps =
not, but
> > > > > > > it also shouldn't hurt.
> > > > > > >
> > > > > > > > Will try and revert.
> > > > > > >
> > > > > > > Awesome, thanks!
> > > > > > >
> > > > > > > > P.S. Just looked at the downstream driver, and it actually =
calls
> > > > > > > > TSHUT_MODE_GPIO TSHUT_MODE_OTP instead, so it seems that "o=
tpout" was
> > > > > > > > not a typo in the first place. So maybe the right approach =
here is not
> > > > > > > > to change the device tree but rather fix the "gpio" / "otpo=
ut" pinctrl
> > > > > > > > state handling in the driver.
> > > > > > >
> > > > > > > Indeed, "otpout" wasn't a typo, and I've already addressed th=
at in my
> > > > > > > comments to Alexander's patch.  Will send that response a bit=
 later.
> > > > > > >
> > > > > > > I think it's actually better to accept the approach in Alexan=
der's
> > > > > > > patch, because the whole thing applies to other Rockchip SoCs=
 as well,
> > > > > > > not just to the RK3588(S).
> > > > > >
> > > > > > Anyway, I've just tried it after including the changes below, a=
nd
> > > > > > while /sys/kernel/debug/pinctrl/pinctrl-handles shows the expec=
ted
> > > > > > pinctrls under tsadc, the driver still doesn't seem to be trigg=
ering a
> > > > > > PMIC reset. Weird. Any thoughts welcome.
> > > > >
> > > > > I found the culprit. "otpout" (or "default" if we follow Alexande=
r's
> > > > > suggested approach) pinctrl state should refer to the &tsadc_shut=
_org
> > > > > config instead of &tsadc_shut - then the PMIC reset works.
> > > >
> > > > I've recently brought up an RK3588S-based Orange Pi CM5 Base board,=
 made
> > > > of a compute module (CM5, see [1]) and a carrier board (Base, see [=
2]).
> > > > The carrier board has a reset button which pulls the PMIC_RESET_L s=
ignal
> > > > of the CM5 to GND (see page 3 of the schematics in [3]).
> > > >
> > > > With &tsadc_shut_org the reset button has absolutely no effect. Wit=
h
> > > > &tsadc_shut it resets the board as expected.
> > >
> > > Interesting. The TSADC shouldn't affect the physical button operation
> > > at all, if it's really wired to the PMIC as the signal name implies.
> > > There isn't even any default pull value associated with the TSHUT pin
> > > config.
> >
> > On a second thought, I've got another hypothesis. Your baseboard only
> > pulls the reset line through  a 100 Ohm resistor when the button is
> > pressed. So if the TSHUT pin is in its default push-pull mode and
> > stays high when no thermal runaway reset is requested, the reset
> > button won't pull the line fully to zero, as the TSHUT line pulls it
> > high at the same time.
>
> That's the most likely cause, I agree.
>
> > If you switch it from &tsadc_shut_org to &tsadc_shut, then it stops
> > working properly as the thermal protection reset, and GPIO0_A1 remains
> > high-impendance, thus allowing the reset button to function even
> > though its pull is too weak.
>
> By the way, what is the difference between tsadc_shut_org and tsadc_shut
> ? I haven't seen it being clearly documented in the TRM.

No idea frankly. Looks like a half-finished design change to me, which
left the non-"org" version unconnected internally.

> > So maybe change the pin configuration of &tsadc_shut_org in
> > rk3588-base-pinctrl.dtsi to open drain and retry?
>
> That's a good idea, but... how ? The pinctrl-rockchip driver doesn't
> seem to support generic open-drain configuration.

I thought I saw open-drain configurations here, but after reviewing
the TRM, bindings and the driver it turns out I must have been
daydreaming :( Sorry.

Looks like the best we can try is a lower drive strength while keeping
the push-pull mode, but I'm afraid this 100 Ohm pulldown is too weak,
because the lowest TSHUT drive strength Rockchip offers is 100 Ohm,
while the PMIC would only count anything below 30% reference voltage
as logical low. Maybe adding a pulldown to the pin config can help,
but most likely this board will require switching the pin to GPIO
input for high-z, and switching the TSHUT mode to CRU.

So how about something like this first:

&tsadc_shut_org {
        rockchip,pins =3D <0 RK_PA1 1 &pcfg_pull_down_drv_level_0>;
};

Best regards,
Alexey

