Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DE4CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eiR0rgb8eb14UCK8OF6nqxlziRjDbGGmUvvYEGUxVw=; b=4rnbBDlTqrfJQL22SmUkAHyyKc
	ujYh6Tlo+WYnGiWLz2qw4MDlSbd6ZLfSDIgtdwdAltsoWLEqMbMg/QlD3dFN5O+gb6Z8P5dYTKyMg
	W99dX1BK5cXblCPSS2TJ66thkMTYU53drdd/P/reu1zfVbRIbpqd3eqWvmbPSJy6Lw47SkaivDpGq
	2//2JMb7LZLaVoBw4SSaMi2JD9BqiMLohoH8CgH34rAzOQeh4y+pnUTYiPFkjgSXXkWRB1MvJk8dJ
	lhL1NKSlU51XOmgmqukMJG6T/u7uHjOV0QdKg+zMws8ASxQmKnpodaFYL0pDuAHfBt6dguwh+sy9W
	mJowNOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gXj-0000000CWs5-3u61;
	Fri, 03 Oct 2025 14:13:55 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gXg-0000000CWqG-2o52
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 14:13:54 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-86420079b01so219638285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 07:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759500831; x=1760105631; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eiR0rgb8eb14UCK8OF6nqxlziRjDbGGmUvvYEGUxVw=;
        b=ex8xOpWzVl/P4OPlHQfaLgwj+iLwmfMJkU05bTCYehcJEMezSK7BY3XiJX0UzPCK2A
         bQouirvLaT0+IM6XwNBr/NMbRXpZiF8sjImdjT9y7QWnEhwXRWUxlLRPPEKJBtLTVcJc
         r3TaSS8KK7adziXZ1rUZsokxbrFHHBAk+pGyBSlDUVBqQ2m05YEJJhlumcvROtQQBdW9
         NvWc7HJfaL4ZgrpDdiEuJuyJiUi8uyMA8zSSZRxqdwckdAXFulqW81Ny1Ru33YJydG4R
         4e+2W73QJMmg2PDPYDdsXDS0H8Q/Q91QqqLO4yrb+zA1Ienty935CvbchHmM1Vi4t1De
         rY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759500831; x=1760105631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eiR0rgb8eb14UCK8OF6nqxlziRjDbGGmUvvYEGUxVw=;
        b=W4YPKycgdMGVwjC1q/D1YRMvPABj0okd8BFcacziv+ATp1tAiMBSPPCyVHEMZhBadU
         XsLn6lfvcsypiSqROvcQ04NsSFkLM800g2fJA4U1qepgIeNuCglfcfWBc6qG+dtj+QT4
         gkbmJERmmNnFhq5bdIQ3syFdAyFOwpDvaDgVLE5MljjjTBuzuqqGYxaheeDIFg7yPPIJ
         93ZFQOn2icjJWJonNMVpUjCdcMbwrmL8LWVdQh+r9o61pcgXFdAsNuxkQUHqw++Pfj3d
         UVK4bMb1P5DI6HTRcksI99KL5v8V0r9RRBFOW4W+kRdgE3KLFiniJ3p2qgTmDzGkYXhJ
         xOBg==
X-Forwarded-Encrypted: i=1; AJvYcCWhAlv+Naj06XiI+IiPc3pOEp0NTlfZREkVKrqTBhRolS6iYptRaeMDlZyAoPaFYkj0jVMHeesqT9KDvDZ6T+dl@lists.infradead.org
X-Gm-Message-State: AOJu0YybhIZr1AbMbTM7ph6bJhES2D4uJCzin02pclM0Oy8Pfn4pYU6p
	Ndl1q9b6u+Tb/eC5VKmxe7p9HWX24JdSHaCBtc0TvCkVCMiZaBxzGk8CEY//a2LRITqxpMZVbJA
	e7feQDKlRVluNEBqQAHg3+Bv9G5Z89K8=
X-Gm-Gg: ASbGncvziB0LstuPCQlxQAx7gCINrh5ZjiUUp1wT7RhMQT3RqZ5fuefM1hRIZqBFSzA
	hABvXtbJ2qifVmELvQIHieXcOsg4QIRKkwDZH0Ljs2jqCVMNPtKpTb2wsNfnEdeJdKtZqK6KHR/
	yE+Yv1gNyI8rWlopmmpaDl2ULTL02o5j7QYmmL7UCCWepWI+j2VesNwwU5PtrxB0pCAPlp1nDiD
	XzKfOUcoC2vuk3wEPArQhX31mEG223pl6Rc0XG+AhhILsyltn9bH/k/33qF0d99T+2si+Pco/B/
	xGGGUm2ERQ==
X-Google-Smtp-Source: AGHT+IF1x6d1SXgWlIOwQSzb64vcGY7LmH9kcXNKvkdLjUNWf0fEfHQbonCQLlSRkqLoUgYilLGKYu0omGuSD7gRJpw=
X-Received: by 2002:a05:620a:2a0d:b0:866:a24e:2eb1 with SMTP id
 af79cd13be357-87a378d2e60mr519951485a.40.1759500831038; Fri, 03 Oct 2025
 07:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org> <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org> <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
 <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com> <20251003133304.GA21023@pendragon.ideasonboard.com>
In-Reply-To: <20251003133304.GA21023@pendragon.ideasonboard.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 3 Oct 2025 18:13:39 +0400
X-Gm-Features: AS18NWBIZkivEeoQjAejLL_ZipTHn0V26YdQouI-n9UYPc0VVnN7Wrl6g590H6Y
Message-ID: <CABjd4YxbyUWghd1ya8UayFkAE-VWQSd5-J2QD0sV7WmS8AXkCg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251003_071352_742744_5FBE9FC7 
X-CRM114-Status: GOOD (  51.58  )
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

Hi Laurent,

On Fri, Oct 3, 2025 at 5:33=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jan 24, 2025 at 11:44:34PM +0400, Alexey Charkov wrote:
> > On Fri, Jan 24, 2025 at 9:23=E2=80=AFPM Alexey Charkov <alchark@gmail.c=
om> wrote:
> > > On Fri, Jan 24, 2025 at 2:37=E2=80=AFPM Dragan Simic <dsimic@manjaro.=
org> wrote:
> > > > On 2025-01-24 11:25, Alexey Charkov wrote:
> > > > > On Fri, Jan 24, 2025 at 2:06=E2=80=AFPM Dragan Simic <dsimic@manj=
aro.org>
> > > > > wrote:
> > > > >> On 2025-01-24 09:33, Alexey Charkov wrote:
> > > > >> > On Fri, Jan 24, 2025 at 9:26=E2=80=AFAM Alexander Shiyan
> > > > >> > <eagle.alexander923@gmail.com> wrote:
> > > > >> >>
> > > > >> >> There is no pinctrl "gpio" and "otpout" (probably designed as
> > > > >> >> "output")
> > > > >> >> handling in the tsadc driver.
> > > > >> >> Let's use proper binding "default" and "sleep".
> > > > >> >
> > > > >> > This looks reasonable, however I've tried it on my Radxa Rock =
5C and
> > > > >> > the driver still doesn't claim GPIO0 RK_PA1 even with this cha=
nge. As
> > > > >> > a result, a simulated thermal runaway condition (I've changed =
the
> > > > >> > tshut temperature to 65000 and tshut mode to 1) doesn't trigge=
r a PMIC
> > > > >> > reset, even though a direct `gpioset 0 1=3D0` does.
> > > > >> >
> > > > >> > Are any additional changes needed to the driver itself?
> > > > >>
> > > > >> I've been digging through this patch the whole TSADC/OTP thing i=
n the
> > > > >> last couple of hours, and AFAIK some parts of the upstream drive=
r are
> > > > >> still missing, in comparison with the downstream driver.
> > > > >>
> > > > >> I've got some small suggestions for the patch itself, but the is=
sue
> > > > >> you observed is obviously of higher priority, and I've singled i=
t out
> > > > >> as well while digging through the code.
> > > > >>
> > > > >> Could you, please, try the patch below quickly, to see is it goi=
ng to
> > > > >> fix the issue you observed?  I've got some "IRL stuff" to take c=
are of
> > > > >> today, so I can't test it myself, and it would be great to know =
is it
> > > > >> the right path to the proper fix.
> > > > >>
> > > > >> diff --git i/drivers/thermal/rockchip_thermal.c
> > > > >> w/drivers/thermal/rockchip_thermal.c
> > > > >> index f551df48eef9..62f0e14a8d98 100644
> > > > >> --- i/drivers/thermal/rockchip_thermal.c
> > > > >> +++ w/drivers/thermal/rockchip_thermal.c
> > > > >> @@ -1568,6 +1568,11 @@ static int rockchip_thermal_probe(struct
> > > > >> platform_device *pdev)
> > > > >>          thermal->chip->initialize(thermal->grf, thermal->regs,
> > > > >>                                    thermal->tshut_polarity);
> > > > >>
> > > > >> +       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO)
> > > > >> +               pinctrl_select_default_state(dev);
> > > > >> +       else
> > > > >> +               pinctrl_select_sleep_state(dev);
> > > > >
> > > > > I believe no 'else' block is needed here, because if tshut_mode i=
s not
> > > > > TSHUT_MODE_GPIO then the TSADC doesn't use this pin at all, so th=
ere's
> > > > > no reason for the driver to mess with its pinctrl state. I'd rath=
er
> > > > > put a mirroring block to put the pin back to its 'sleep' state in=
 the
> > > > > removal function for the TSHUT_MODE_GPIO case.
> > > >
> > > > You're right, but the "else block" is what the downstream driver do=
es,
> > >
> > > Does it though? It only handles the TSHUT_MODE_GPIO case as far as I
> > > can tell (or TSHUT_MODE_OTP in downstream driver lingo) [1]
> > >
> > > [1] https://github.com/radxa/kernel/blob/edb3eeeaa4643ecac6f4185d6d39=
1c574735fca1/drivers/thermal/rockchip_thermal.c#L2564
> > >
> > > > so I think it's better to simply stay on the safe side and follow t=
hat
> > > > logic in the upstream driver.  Is it really needed?  Perhaps not, b=
ut
> > > > it also shouldn't hurt.
> > > >
> > > > > Will try and revert.
> > > >
> > > > Awesome, thanks!
> > > >
> > > > > P.S. Just looked at the downstream driver, and it actually calls
> > > > > TSHUT_MODE_GPIO TSHUT_MODE_OTP instead, so it seems that "otpout"=
 was
> > > > > not a typo in the first place. So maybe the right approach here i=
s not
> > > > > to change the device tree but rather fix the "gpio" / "otpout" pi=
nctrl
> > > > > state handling in the driver.
> > > >
> > > > Indeed, "otpout" wasn't a typo, and I've already addressed that in =
my
> > > > comments to Alexander's patch.  Will send that response a bit later=
.
> > > >
> > > > I think it's actually better to accept the approach in Alexander's
> > > > patch, because the whole thing applies to other Rockchip SoCs as we=
ll,
> > > > not just to the RK3588(S).
> > >
> > > Anyway, I've just tried it after including the changes below, and
> > > while /sys/kernel/debug/pinctrl/pinctrl-handles shows the expected
> > > pinctrls under tsadc, the driver still doesn't seem to be triggering =
a
> > > PMIC reset. Weird. Any thoughts welcome.
> >
> > I found the culprit. "otpout" (or "default" if we follow Alexander's
> > suggested approach) pinctrl state should refer to the &tsadc_shut_org
> > config instead of &tsadc_shut - then the PMIC reset works.
>
> I've recently brought up an RK3588S-based Orange Pi CM5 Base board, made
> of a compute module (CM5, see [1]) and a carrier board (Base, see [2]).
> The carrier board has a reset button which pulls the PMIC_RESET_L signal
> of the CM5 to GND (see page 3 of the schematics in [3]).
>
> With &tsadc_shut_org the reset button has absolutely no effect. With
> &tsadc_shut it resets the board as expected.

Interesting. The TSADC shouldn't affect the physical button operation
at all, if it's really wired to the PMIC as the signal name implies.
There isn't even any default pull value associated with the TSHUT pin
config.

What if you switch the GPIO0_A1 pin to GPIO output mode with no pull?
Does the button work then? Does the board reset if you toggle the GPIO
value with `gpioset`?

Best regards,
Alexey

