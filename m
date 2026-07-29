Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAE7C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7pTQ84ALbX/4r2igPejPxSAqnbe2d+NJmIUI1AGgJ0=; b=nGrQ4kMA0Fsp5DmBHlZ91nhVKF
	XUDu7jBN4CM4Gd/J/fEX3jxkQCF4fuBYW/ZP/lrKHbMdR0klrLT4fpeBsNc7A7iqTqa8m74LUDs/V
	RVUMB02mMi5qlhu6l4rdcNlItGx8IWuvtJ738pL14cNWVb4BXZOHJ/0kxFgpbLO754Wfxk9llmcKQ
	CBRkzQat3RqpLTSkJNeACHt9k+OCWJ7a527ScRbyREyn1FRPf163+qTkaHqfYJ+ecxElTvJv24saQ
	0hZzR4L2PA7D9M4HfoRcnjUTSGUcedMP+VYegIFlRVZe8szC5lDotGsd+nZinQiqGpyUuXQUSpV9A
	Eif4Td8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Cl-00000008Yyn-28NZ;
	Wed, 29 Jul 2026 16:32:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Cj-00000008Yxz-3aSB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 16:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Q7pTQ84ALbX/4r2igPejPxSAqnbe2d+NJmIUI1AGgJ0=; b=a/+0XAdlC3hkEMzN/d6dGzuifZ
	HbiehjFBrRRrxMu7iYRvkI2MsTgUoP079qIgQ/OyEOUlaZgqYm4YeNNUw2vRlP7QQUwwfw2qOr47a
	mw442Pu5V17wpEAwbFTIPnzWXRW43CybPWKIOmBH4CQUrjX+R4QaXbEOlKHGUMgyGXiSIlh6139lq
	pH/ONbOSu0ctlxL1+mMZEAsPFRAbSiupYlEwJ2VEk/RIiySPOA3rB03W4Bom1tZ3kR3EhV8jjACJ0
	neyj9nP7DYV435MMHCWd1R2rMx2iVcCZ9BpEWdu0X374OXtpSUT63Xyq/KBre5m3LEhmIy985DQcP
	IxncAIEQ==;
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp7Cg-000000060i7-2ymx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:32:24 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-51c2b2c9eccso8162151cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 09:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785342740; cv=none;
        d=google.com; s=arc-20260327;
        b=YAgnsmoHjAaH4voPC6Vlppxr6gm/ytrqxrfB2We5tIbRGV5hAV9mCA6PbkxVTzJBst
         oaxnEd7HvTUCWcBZdGar+z3yDwovXPyvS7FKKRjgNd9NqXxFo5ShpK6O4IJ2Z4d+SZcS
         5lDx1GrttGCctLlCaxyWvwALWxi8NqaMmnjUdGWog5ZMQX7bAr8HZoXr5QGJ2+wGlAQ7
         HnG6YOQIcoxreUc5QHT1op2WFVtrEnPCbv1mu66MrdknkvHgrWSHrlcGyr7rznrYNklv
         waj0zVMFkUAY+OW7QvSagikqGJkR9qwWSSbUuFX/6gCTyZp+yRUryB0EVhNxGJrlbEph
         rQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q7pTQ84ALbX/4r2igPejPxSAqnbe2d+NJmIUI1AGgJ0=;
        fh=EyFdr/HAoze2YGOLu87VapC+F/pXLEjDvOb8C2NEAzM=;
        b=WiG2Nl5Ea2RwVMpY7pEVTWPiAVzz39mDMKFiOrM/krsb6CeXZm1OlRBggA/PwgeyWz
         U3mhGJcbXS16bC/Aoglmi1c1O8qj9LL81Xzu6SKqGp8VWtoGYva1PTzHJ56fobzaPY6v
         XmNrWHhH88NU6mMrUq/Qjehqxz2xe80FqobBmRGnralS+dgUrlXhgbH2SWudY37NnpbP
         YFH3ntL0X6rDXjHOUMfr/pfe50QmM/fNQhxsPfScKjwtmG0Xt30Dd6jph4dKqnHo5aY3
         DSuKQlDQ5RW24RdeM0czg/ISWDbGN7Q1tkxMRc+BCarqlBOYZHXd1nhlCC8/zPuMCwMl
         uLnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785342740; x=1785947540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q7pTQ84ALbX/4r2igPejPxSAqnbe2d+NJmIUI1AGgJ0=;
        b=FkB2Puy9VhQbRNRAhkYbDkDatVwtKALGXX0zCKyYw0c9KJf58kE82nA2Nwoq6CnxOE
         V49p77C4gb4cv1wZc4zAX7PPzp2YQ2dEseX/eJdMptDMmpio7mfsVQXq1V2mlm7YKAp1
         4WsEaqR5vInDFtj7jeXccV2tpUvuWjub0Ha6LX04vrIACPwmtey97ORrZGCZbYqK0dsH
         k3pKIeC2H1UvExnNtOhxS7TOq/HiEcUpf4fxaBHFJaRBo6ChLgxsLVpz/C93x6CWz60+
         wxaHhHLuhnVGdomXtJmnPkwAY9NqLcHXpGtU7zmoZ6Xf8m5Il82KzUSnFxsDM2ocYFmf
         ebyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342740; x=1785947540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7pTQ84ALbX/4r2igPejPxSAqnbe2d+NJmIUI1AGgJ0=;
        b=Od5GmlvBwZsz+SkT2+ulLmtjYt8Rjgp60mWUtDEjiC07ZjCe/aitiZ1IxUL7u1JAIv
         2nC0Yzii1Nj3P1pvEuFxWr9EEmfB6jr4fZ7OIjwowAGfWfM1/uvVPUf2wr/H086ocLsd
         alJsATgtagbdUZFHTStWocKY9vI0AS1Ryg3RLnSytRphmCQ9JCaJl9Q/CJX+ZKYZOJ2l
         hO6QJNCNQ895VRJ7p+znJXSmfApwzh1g+eI/jdsBFeYXZlC7ECAlcPf1e6IIwDHYPWfs
         6lKDPoo6E9avajqLvzpoI0jS7YQHBA0b/jQYlaH50OycqdszMbeJKzz1W82nqQoustPf
         aAjQ==
X-Forwarded-Encrypted: i=1; AHgh+RphpHn7UKxo8PAINeVGEwhMoz4cpIc7HWdYIKmdXQsiCnijH+v8P0P2UiWxlDl8+hyAC5ycBC5iGiZjgMjoIzPR@lists.infradead.org
X-Gm-Message-State: AOJu0YyEGwIyVzxIKQHkAxTrdlP8dpscBthxsReE8gewHXWRXhe9/935
	21YvVpENH1KxKO3ndEBnFH8EsJ/CW5t+UO2TnYMi6hMBxGp8Tkqc6ZlIJMMZD+Vy+EMcDrWdT5I
	+PLRpWagy18jEWHkzz247g9BEdQUYzzE=
X-Gm-Gg: AR+sD12zM78xPfGSvyOlNK2pHYMCOZK6aeVL7bhSWpPn9p3NbZPyXbrzq6S9WuaySy6
	fNEIQmbS8zWI3LbZVYY6ahFWiWCFmS+Z8sT18VOmMEzB9wRl9toilXZoXbmAZNWy+z64cBCzPSX
	+PVNAvDwzEGtat+7IsnS8uYAyAG2DLvDvt0prIqp0ri0JgA+BuvOac5zSmFjuZz9SN6jj7z0I8Y
	aiGmuVe2UIqE/9VjorPJ3nIQzQ2+jzbuJJkcTTS+Ygw4M9SuawfP/pulvH9WcOYBW9FMsiDGTRT
	RyAPbQ2tBUyy2oAOSXXSZQU7oUeqlgPVvRl+Zv8H5DrVk5jE1qQienmAHSrF1HOPhsf2YgUx3p8
	=
X-Received: by 2002:ac8:5747:0:b0:51c:19af:6341 with SMTP id
 d75a77b69052e-529d713873fmr69349981cf.36.1785342739913; Wed, 29 Jul 2026
 09:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
 <748fd61a-31fb-436f-b028-b47807a4860c@gmail.com> <12339028.CDJkKcVGEf@phil> <29759328.czjnFlTdjD@diego>
In-Reply-To: <29759328.czjnFlTdjD@diego>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 29 Jul 2026 20:32:08 +0400
X-Gm-Features: AUfX_mzBEaSdgIsBEYN7VZbYtoGsNzcTEENadfy3YmzUtDsOgmQlt3t77sIoNTw
Message-ID: <CABjd4Yy7kzPFxSakaGqY18hyJCfQf5neCoHBdm4DueFrfnda0A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_173222_884566_B8101CA2 
X-CRM114-Status: GOOD (  36.35  )
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

On Wed, Jul 29, 2026 at 6:46=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Montag, 20. Oktober 2025, 14:31:12 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Heiko Stuebner:
> > Am Montag, 20. Oktober 2025, 10:50:58 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Alexey Charkov:
> > >
> > > On Mon, Oct 20, 2025 at 12:31=E2=80=AFPM Heiko Stuebner <heiko@sntech=
.de> wrote:
> > > >
> > > > Am Montag, 20. Oktober 2025, 10:19:51 Mitteleurop=C3=A4ische Sommer=
zeit schrieb Alexey Charkov:
> > > > > On Thu, Sep 25, 2025 at 12:38=E2=80=AFAM Alexey Charkov <alchark@=
gmail.com> wrote:
> > > > > >
> > > > > > Add support for the Rockchip W552793DBA-V10 LCD+touchscreen ass=
embly which
> > > > > > comes physically attached to Rockchip RK3576 EVB1 boards.
> > > > > >
> > > > > > The display part is driven by the on-chip MIPI DSI controller, =
and the
> > > > > > touchscreen is connected over I2C.
> > > > > >
> > > > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > > > ---
> > > > > > Note that backlight support is left out for now, as it depends =
on PWM
> > > > > > support [0] which has not yet been merged.
> > > > > >
> > > > > > A workaround is simply `gpioset -c 0 13=3D1` to set the respect=
ive GPIO
> > > > > > pin high and thus to light up the display unconditionally.
> > > > > >
> > > > > > [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434=
b0ce60c@collabora.com/
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++++=
++++++++++++++++
> > > > > >  1 file changed, 89 insertions(+)
> > > > >
> > > > > Hi Heiko,
> > > > >
> > > > > Any thoughts about this one? Can we perhaps get it merged for -ne=
xt?
> > > >
> > > > Does the gpio-backlight work on that device?
> > > > That would make the gpioset hack unnecessary.
> > >
> > > I've got a local patch using pwm-gpio and pwm-backlight as a stop-gap
> > > solution, but I don't think it's worth merging upstream, because the
> > > backlight is supposed to be driven by the hardware PWM on the same pi=
n
> > > (not bit-banging the GPIO line). After all, Nicolas has been working =
on
> > > adding a proper hardware PWM driver for RK3576.
> > >
> > > The display itself works without PWM support, and so does the touchsc=
reen.
> >
> > Right now, I don't think we have an actual timeline if/when Nicolas wil=
l
> > be able to work on the pwm again. So my idea was if we want to
> > integrate the baclight as you described below, to have an actual usable
> > display and then when the new pwm has landed switch over to that one?
>
> With the ELCE around the corner we're nearing the year-mark here ;-)
> (And I'm surprised, I remembered this pending patch)

I've been hoping that Nicolas' PWM series gets further along in the meantim=
e :)

> So how about integrating your gpio-pwm backlight for the time being?

Could do that, but I'm worried if it would immediately become set in
stone because DT is ABI, making it hard to switch to a "proper"
hardware-driven PWM once Nicolas' series lands.

> Or alternatively just going with a gpio-backlight, like the Anbernic Vita=
 did:
>
>         /*
>          * LEDs and Backlights can be controlled as a PWM, but PWM
>          * support is not yet available.
>          */
>         gpio_backlight: backlight {
>                 compatible =3D "gpio-backlight";
>                 gpios =3D <&gpio2 RK_PC4 GPIO_ACTIVE_HIGH>;
>                 pinctrl-0 =3D <&led_backlight_h>;
>                 pinctrl-names =3D "default";
>         };

In the case of RK3576 EVB1 enabling it at full power is eye-burning
bright, so some sort of PWM is definitely warranted.

Best regards,
Alexey

