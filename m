Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E670C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4/vzmdSMKeOJ/C1GDf68MF2cf5I1Flzl1PjgFGcdcg=; b=ibTK+0yb4ido24gEbPa2calfiw
	rh0Td5EqAYeVqcrgP6chOxc9XENYkwJ9iD6bkjh7Dusp4g2xY8vmU3J2s3WAciI6M8PvlQ5j4zxj5
	uFLDlQv5ySDGITDUzkpNZZaHDrbi8+5oVvP0QydVqAV1ENDgDerN+rSM96oBV6sV9vAqCfdpiWOh4
	0Qc8wNp/hZ2W8hrNScwqYQ1zMgD47S9GUM7OoFfb/ROv0NBXDSoDwbJ5KXcuVCu9MmAbCYrXZlVCX
	2ujMr4dLFuObwJ6SlxpmeKHKOVvbmgLit4gc5uqbXPyxgRUHKeCNsyn8CFOB056rfnv3DkUYHfZ/G
	iBNBLN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNQJ-0000000FCfA-3Aze;
	Fri, 24 Jan 2025 17:24:51 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNP0-0000000FCYj-3Eat;
	Fri, 24 Jan 2025 17:23:32 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7bcf32a6582so203144685a.1;
        Fri, 24 Jan 2025 09:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737739409; x=1738344209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4/vzmdSMKeOJ/C1GDf68MF2cf5I1Flzl1PjgFGcdcg=;
        b=DsdDamx1eIpGpq+Pthja5fKTGKfC6hHAx0O6QqzvFRMm5PoTbsNo9XSYKvSFmN/JT1
         ua1bSW8cvt4k1I1iyGt/U7873e026yhi+v2NkhAw6iHOdbGleXtGmRBe5j/j8jeVDJlp
         U+/DgSpAv5Vp1vjOOArlpu+vF88KI+z+r0Jtpa55sDnb4Yv9ocnz/2+UFzVNJKZrCCFO
         c3rG4DdYrOLaTVvCfkY94flgjbSGi+i/49B8u5ZQ8YGfxztCbXF50t08qByggUPToB+b
         x/EULqChWgD+CNFrL4EBLBMFl7zs+VY0LPIPJN1npoa77dQqR+wSlXGQhGB1R73SFrfe
         sIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737739409; x=1738344209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4/vzmdSMKeOJ/C1GDf68MF2cf5I1Flzl1PjgFGcdcg=;
        b=nra9UAFWYGoUqjZnCRx9osPDNGVk3RTXDW5R2wXySre7qAX54NpjwL3SY/jB8d+0z1
         /56fGY1CJMdL6wFu2hIogddaijRggjIQdysjTjqI66iNm91Anb6jhdvqe2airvfnM0MO
         oxYeTo7Zc6cOACB61LXQX1kVc4CpmPHLTsJJLnlANrfS4dYbF8JVMUOt96D+LA2z604A
         ysBa/CxfJAoJ9bQxt69rnhg6ur+sfQPNdHVEUg7rGkFOoWfJ5XR2bs2S1k0McM0micJn
         ZyqiF5E2aXuGmwwW1CDFW846zBhKjKqzWS3uMuDDEjevZ3JjQi41UJiuk3wyYJgNUbnh
         MCZw==
X-Forwarded-Encrypted: i=1; AJvYcCUyQAv+paFjIcsXdN/ccHDbi2x6aQUZDW3rrtl1z9m1pOvCtuKx4wUs5dcXojIg3ssFf0I5HVMWgq0stHOtkhZA@lists.infradead.org, AJvYcCWdGZV6/WMI77bI3AgniT4CJIGFdTnOvVE+rMCZFWQCTiu9w20EO+/ysdLxxGuHnb7AlP2WBF4xFmAm0mCHCTE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxK+9Dec3srNsqL7i3ruWB5MI4nG7JqjmTU/wUhdXD0jq2VHDmD
	VW65s5sdzsXnmK8Qh3U8VQI5heU4bsFr3Tu6UeFtpelykdxtQZPVwUATrCtgnqzrdm44iX8aLkV
	LwnmOZUHKKavtZbVxCX3y3riyR8E=
X-Gm-Gg: ASbGncuYTjcoveNgwvluVsWIZ3qGXVv2PnTaQydGNP4A3vf9dDvz90xbu2isDf4X3Kg
	i58G8vnXAe/Smb0st06h6BNd9JxZ0IvTC9RaSmYLU+jeqprEf7mngc+9rTEWlFeRFpBvDvn5V8g
	==
X-Google-Smtp-Source: AGHT+IH/71bIsSUVZkYzfhIAkpahFedbMg/3ni3li/QddagsY09U7X5KUjEEkPxHsPsosORBWWQCWIZ/khOf2K+Bq2k=
X-Received: by 2002:a05:620a:17aa:b0:7b6:c92e:2e6d with SMTP id
 af79cd13be357-7be63288b8dmr4180692485a.52.1737739409330; Fri, 24 Jan 2025
 09:23:29 -0800 (PST)
MIME-Version: 1.0
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org> <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org>
In-Reply-To: <61b494b209d7360d0f36adbf6d5443a4@manjaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 24 Jan 2025 21:23:18 +0400
X-Gm-Features: AWEUYZmMc0C1SJlBvPcDZ7qyIIVJLWYZo934vdGbx4qMERT8_Fj27hNjzrjhk2A
Message-ID: <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250124_092330_818884_F35C4B39 
X-CRM114-Status: GOOD (  45.54  )
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

On Fri, Jan 24, 2025 at 2:37=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> On 2025-01-24 11:25, Alexey Charkov wrote:
> > On Fri, Jan 24, 2025 at 2:06=E2=80=AFPM Dragan Simic <dsimic@manjaro.or=
g>
> > wrote:
> >> On 2025-01-24 09:33, Alexey Charkov wrote:
> >> > On Fri, Jan 24, 2025 at 9:26=E2=80=AFAM Alexander Shiyan
> >> > <eagle.alexander923@gmail.com> wrote:
> >> >>
> >> >> There is no pinctrl "gpio" and "otpout" (probably designed as
> >> >> "output")
> >> >> handling in the tsadc driver.
> >> >> Let's use proper binding "default" and "sleep".
> >> >
> >> > This looks reasonable, however I've tried it on my Radxa Rock 5C and
> >> > the driver still doesn't claim GPIO0 RK_PA1 even with this change. A=
s
> >> > a result, a simulated thermal runaway condition (I've changed the
> >> > tshut temperature to 65000 and tshut mode to 1) doesn't trigger a PM=
IC
> >> > reset, even though a direct `gpioset 0 1=3D0` does.
> >> >
> >> > Are any additional changes needed to the driver itself?
> >>
> >> I've been digging through this patch the whole TSADC/OTP thing in the
> >> last couple of hours, and AFAIK some parts of the upstream driver are
> >> still missing, in comparison with the downstream driver.
> >>
> >> I've got some small suggestions for the patch itself, but the issue
> >> you observed is obviously of higher priority, and I've singled it out
> >> as well while digging through the code.
> >>
> >> Could you, please, try the patch below quickly, to see is it going to
> >> fix the issue you observed?  I've got some "IRL stuff" to take care of
> >> today, so I can't test it myself, and it would be great to know is it
> >> the right path to the proper fix.
> >>
> >> diff --git i/drivers/thermal/rockchip_thermal.c
> >> w/drivers/thermal/rockchip_thermal.c
> >> index f551df48eef9..62f0e14a8d98 100644
> >> --- i/drivers/thermal/rockchip_thermal.c
> >> +++ w/drivers/thermal/rockchip_thermal.c
> >> @@ -1568,6 +1568,11 @@ static int rockchip_thermal_probe(struct
> >> platform_device *pdev)
> >>          thermal->chip->initialize(thermal->grf, thermal->regs,
> >>                                    thermal->tshut_polarity);
> >>
> >> +       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO)
> >> +               pinctrl_select_default_state(dev);
> >> +       else
> >> +               pinctrl_select_sleep_state(dev);
> >
> > I believe no 'else' block is needed here, because if tshut_mode is not
> > TSHUT_MODE_GPIO then the TSADC doesn't use this pin at all, so there's
> > no reason for the driver to mess with its pinctrl state. I'd rather
> > put a mirroring block to put the pin back to its 'sleep' state in the
> > removal function for the TSHUT_MODE_GPIO case.
>
> You're right, but the "else block" is what the downstream driver does,

Does it though? It only handles the TSHUT_MODE_GPIO case as far as I
can tell (or TSHUT_MODE_OTP in downstream driver lingo) [1]

[1] https://github.com/radxa/kernel/blob/edb3eeeaa4643ecac6f4185d6d391c5747=
35fca1/drivers/thermal/rockchip_thermal.c#L2564

> so I think it's better to simply stay on the safe side and follow that
> logic in the upstream driver.  Is it really needed?  Perhaps not, but
> it also shouldn't hurt.
>
> > Will try and revert.
>
> Awesome, thanks!
>
> > P.S. Just looked at the downstream driver, and it actually calls
> > TSHUT_MODE_GPIO TSHUT_MODE_OTP instead, so it seems that "otpout" was
> > not a typo in the first place. So maybe the right approach here is not
> > to change the device tree but rather fix the "gpio" / "otpout" pinctrl
> > state handling in the driver.
>
> Indeed, "otpout" wasn't a typo, and I've already addressed that in my
> comments to Alexander's patch.  Will send that response a bit later.
>
> I think it's actually better to accept the approach in Alexander's
> patch, because the whole thing applies to other Rockchip SoCs as well,
> not just to the RK3588(S).

Anyway, I've just tried it after including the changes below, and
while /sys/kernel/debug/pinctrl/pinctrl-handles shows the expected
pinctrls under tsadc, the driver still doesn't seem to be triggering a
PMIC reset. Weird. Any thoughts welcome.

Best regards,
Alexey

rock-5c ~ # cat /sys/kernel/debug/pinctrl/pinctrl-handles
Requested pin control handlers their pinmux maps:
[...]
device: fec00000.tsadc current state: default
 state: default
   type: MUX_GROUP controller rockchip-pinctrl group: tsadc-shut (84)
function: tsadc (84)
   type: CONFIGS_PIN controller rockchip-pinctrl pin gpio0-1 (1)config 0000=
0001
 state: sleep
   type: MUX_GROUP controller rockchip-pinctrl group: tsadc-gpio-func
(95) function: gpio-func (97)
   type: CONFIGS_PIN controller rockchip-pinctrl pin gpio0-1 (1)config 0000=
0001
[...]

rock-5c ~ # gpioinfo 0
gpiochip0 - 32 lines:
       line   0:      unnamed "regulator-vdd-3v3" output active-high [used]
       line   1:      unnamed       unused   input  active-high
       line   2:      unnamed       unused   input  active-high
       line   3:      unnamed       unused   input  active-high
       line   4:      unnamed       unused   input  active-high
       line   5:      unnamed       unused   input  active-high
       line   6:      unnamed       unused   input  active-high
       line   7:      unnamed       unused   input  active-high
       line   8:      unnamed       unused   input  active-high
       line   9:      unnamed       unused   input  active-high
       line  10:      unnamed       unused   input  active-high
       line  11:      unnamed       unused   input  active-high
       line  12:      unnamed       unused   input  active-high
       line  13:      unnamed       unused   input  active-high
       line  14:      unnamed       unused   input  active-high
       line  15:      unnamed       unused   input  active-high
       line  16:      unnamed       unused   input  active-high
       line  17:      unnamed       unused   input  active-high
       line  18:      unnamed       unused   input  active-high
       line  19:      unnamed       unused   input  active-high
       line  20:      unnamed       unused   input  active-high
       line  21:      unnamed "regulator-pcie2x1l2-3v3" output
active-high [used]
       line  22:      unnamed       unused   input  active-high
       line  23:      unnamed       unused   input  active-high
       line  24:      unnamed       unused   input  active-high
       line  25:      unnamed       unused   input  active-high
       line  26:      unnamed       unused   input  active-high
       line  27:      unnamed       unused   input  active-high
       line  28:      unnamed "regulator-vcc5v0-usb-otg0" output
active-high [used]
       line  29:      unnamed       unused   input  active-high
       line  30:      unnamed       unused   input  active-high
       line  31:      unnamed       unused   input  active-high

(note line 1: unused above)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index 6e56d7704cbe..e8c4d9b3f828 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -873,6 +873,9 @@ regulator-state-mem {
};

&tsadc {
+       rockchip,hw-tshut-temp =3D <65000>;
+       rockchip,hw-tshut-mode =3D <1>; /* tshut mode 0:CRU 1:GPIO */
+       rockchip,hw-tshut-polarity =3D <0>; /* tshut polarity 0:LOW 1:HIGH =
*/
       status =3D "okay";
};

diff --git a/drivers/thermal/rockchip_thermal.c
b/drivers/thermal/rockchip_thermal.c
index f551df48eef9..4f474906b2b0 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -1568,6 +1568,9 @@ static int rockchip_thermal_probe(struct
platform_device *pdev)
       thermal->chip->initialize(thermal->grf, thermal->regs,
                                 thermal->tshut_polarity);

+       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO)
+               pinctrl_select_default_state(&pdev->dev);
+
       for (i =3D 0; i < thermal->chip->chn_num; i++) {
               error =3D rockchip_thermal_register_sensor(pdev, thermal,
                                               &thermal->sensors[i],
@@ -1614,6 +1617,9 @@ static void rockchip_thermal_remove(struct
platform_device *pdev)
       }

       thermal->chip->control(thermal->regs, false);
+
+       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO)
+               pinctrl_pm_select_sleep_state(&pdev->dev);
}

static int __maybe_unused rockchip_thermal_suspend(struct device *dev)
@@ -1629,7 +1635,8 @@ static int __maybe_unused
rockchip_thermal_suspend(struct device *dev)
       clk_disable(thermal->pclk);
       clk_disable(thermal->clk);

-       pinctrl_pm_select_sleep_state(dev);
+       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO)
+               pinctrl_pm_select_sleep_state(dev);

       return 0;
}
@@ -1674,7 +1681,8 @@ static int __maybe_unused
rockchip_thermal_resume(struct device *dev)
       for (i =3D 0; i < thermal->chip->chn_num; i++)
               rockchip_thermal_toggle_sensor(&thermal->sensors[i], true);

-       pinctrl_pm_select_default_state(dev);
+       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO)
+               pinctrl_pm_select_default_state(dev);

       return 0;
}

