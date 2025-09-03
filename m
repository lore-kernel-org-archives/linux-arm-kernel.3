Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C13CCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TY99cVzo51RXHn+Vw+SAL0C6lDtANRsUUB+6t6UiVNI=; b=qC2daHD8es24j4WqzvitVBEbGs
	gX8NiN7Iu4XHapDlTBd+ZxGh+7R6J46OaenLqAx1KYPp6BVUCHNOpVXkxAGTUQAgWyPdoVthl59Ou
	/Jb1qhOSbJggU29iLqO1O4pP34lz0MyIwuxSvzthjVCr5BiYG0awVJTYPfI5uYCyMcMtSV4jgGHAX
	QoBKvdIIiyA6TgiN2XPrt755CrkKz443BiBC8kucI7h7s08bL0sVRxbyiEKnOSmQjbQ3TYFrJ2lr0
	ZAphLmY3ZCi1ddDtbnJ0SNmLHbjnnLDNtTA/lZQG7dgddqFWiZsE/YH9dcafNhci+hBdryFYhNBm0
	sTbgODPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmPK-00000006MG7-2rlT;
	Wed, 03 Sep 2025 12:16:10 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlJ6-00000006Azu-2O1L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 11:05:42 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso3498674e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 04:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756897539; x=1757502339; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY99cVzo51RXHn+Vw+SAL0C6lDtANRsUUB+6t6UiVNI=;
        b=hA9/4BWSYs9AgVJHyG+xSUUtngNRpsDCnByDIuvIfF6Y21Oo6RQDC4yKXXDYrMnszF
         /SdoG1UIGc2vPcePKN/YbutdT1gF73PsgXuQqI0P/BEr0Hy0Yr7KJpgB3T1nGfwqav/7
         5UaGdeGxit/03cwHUee3fTxF28lryTAM1mFYJR3ciccKp/sR+nWU0NLnFPELaJkqDOdC
         4I67ih/EHKGk9iO7gRpPxeuQ7rg9o2W1ou8lFMV1kt1sV0S3bViBpcM0bHRMhA+z3g+Z
         NGbr7QBqxXGka2o2b6xxp05yQi+CjaF80itEKEzZl6tSCd9LhjEFDB8VPFZpClT9nFhK
         p/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756897539; x=1757502339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY99cVzo51RXHn+Vw+SAL0C6lDtANRsUUB+6t6UiVNI=;
        b=NzXrh4sI4Nj29IGxeCXCPtsvB5KvNZblf0ReXGeVV0S/WfG4j24TkxW20zTn4wNor1
         2cY6486eFFiApoSOugEtZuPPX9ymsXUX1wEdzVdBsjFkBmTrdYI45lFz7t18vRVmUJY0
         8BX0YJDBMKOKabzr6Vt/0v0YE8eF5Z9jGFBGOZkm5+b4+yw/J2VMS/YrFhyIc0n1dgy7
         6P/cZ+ugEVJbkddcj1mbHorgW8B4rcq9OtDOlbJat7zzpwZD7SUhmx2Dt6jZYOggWsfg
         xa6VSKM6D5WHjd3I9mg2aBPzdscxe9J+B3tcUfTWDIjxRXysn4aHfSL7OQHl9IN6DY0I
         x9mA==
X-Forwarded-Encrypted: i=1; AJvYcCXa6pC48/Ta3mTaahHSafuYR856/ZTCtAR2NCYSlzjDsHyVAkH8qtzQRhQDwv/Ien0ZJ/eisp65TIcRGuaq8ufE@lists.infradead.org
X-Gm-Message-State: AOJu0YxKMYqMnCEgbtVtHqUFE+WwnBZm5Ofs0volWpHydbPd3TtF9Btr
	r8ZrrYJznamGT+hsRzvfsRmCulBi2NTgJjmfbWE0c2D0z+7/4eM8Wtxldu8WiK118DXDdJm906H
	VZrBk/5ykivBfLtrI8iMnZ/Z0tj1Zt7jBWRIpoT9M0w==
X-Gm-Gg: ASbGncselEGRTX+1y2/Qrxm7kkAhzYSq8zvvA+xSfs6jP7ttWTMZ2pKYhso5evAq24J
	FcUzQzY8yY9zVSgsocWq4xl0Ae7q8VSSSn3rKiiKVmvnPanMGdhzwvd3QqPv9zrmBG/l3vyLReb
	zFI9xweTczdpOnCZgv+cwwwYDlb5DEsracm7H7r8jaEPMP4r6LvcmDk/o375emgqlrG6QriUPb1
	KHlSgC8mxXfx4GHQ2QTPWQHDXJoyJdZAkA7oeQh8I3mfFXLNg==
X-Google-Smtp-Source: AGHT+IGaO6jKgae4Bb0nnUY/KIMNPM9fcQrt4rcPCJpxbytVdpNy16Q2X9IuotKVynxw9JndtWotWpVme+DKGbgxexI=
X-Received: by 2002:a05:6512:b8a:b0:55f:62f9:cad2 with SMTP id
 2adb3069b0e04-55f7093e564mr3786208e87.26.1756897538646; Wed, 03 Sep 2025
 04:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com> <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com> <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
 <aLgeDNLABpmkShIU@smile.fi.intel.com>
In-Reply-To: <aLgeDNLABpmkShIU@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 13:05:27 +0200
X-Gm-Features: Ac12FXyayAu5ynqkVYj2uRlegQC_XlF19483EKV3MWs-LYc9T7mcvfMXmn9zXkQ
Message-ID: <CAMRc=MdD9g4WiBCP0qYGuy5e3pnQf5MUHTqkUOnrUvcWUYK27A@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_040540_612670_E48D9040 
X-CRM114-Status: GOOD (  38.10  )
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

On Wed, Sep 3, 2025 at 12:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 12:41:48PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 3, 2025 at 12:38=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Sep 03, 2025 at 12:34:00PM +0200, Bartosz Golaszewski wrote:
> > > > On Wed, Sep 3, 2025 at 12:22=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:
> > > > > On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > On Tue, Sep 2, 2025 at 10:46=E2=80=AFPM Andy Shevchenko
> > > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > > On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <b=
rgl@bgdev.pl> wrote:
> > > > > > > > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golasze=
wski wrote:
>
> ...
>
> > > > > > > > > > The strict flag in struct pinmux_ops disallows the usag=
e of the same pin
> > > > > > > > > > as a GPIO and for another function. Without it, a rouge=
 user-space
> > > > > > > > > > process with enough privileges (or even a buggy driver)=
 can request a
> > > > > > > > > > used pin as GPIO and drive it, potentially confusing de=
vices or even
> > > > > > > > > > crashing the system. Set it globally for all pinctrl-ms=
m users.
> > > > > > > > >
> > > > > > > > > How does this keep (or allow) I=C2=B2C generic recovery m=
echanism to work?
> > > > > >
> > > > > > Anyway, what is your point? I don't think it has any impact on =
this.
> > > > >
> > > > > If we have a group of pins that are marked as I=C2=B2C, and we wa=
nt to use recovery
> > > > > via GPIOs, would it be still possible to request as GPIO when con=
troller driver
> > > > > is in the strict mode?
> > > >
> > > > Yes, if you mark that function as a "GPIO" function in the pin
> > > > controller driver.
> > >
> > > How would it prevent from requesting from user space?
> >
> > It wouldn't, we don't discriminate between user-space and in-kernel
> > GPIO users. A function either is a GPIO or isn't. Can you point me to
> > the driver you're thinking about or is this a purely speculative
> > question?
>
> The recovery mechanism is in I=C2=B2C core and many drivers use that.
> I'm not aware of Qualcomm drivers in particular. But mechanism is
> in use in I=C2=B2C DesignWare which is distributed a lot among platforms,
> so using word 'purely' is incorrect, and word 'speculative' is a bit
> strong, but you can think of the issue coming later on when somebody
> does something like this.
>
> The same applies to the in-band wakeup UART mechanism.
>
> Which means that with this series we will relax it back anyway for
> the above mentioned cases.
>
> (Not sure, but SPI DesignWare requires programming SPI native chip select=
s even
>  if the GPIO is used for that, this might have also some implications, bu=
t here
>  it's for real 'purely speculative'.)
>

The high-level answer is: yes, a pin that will be used by GPIOLIB
needs the function it's muxed to, to be marked as "GPIOable" in its
parent pin controller if it's strict. That's still better than the
current situation.

I can imagine we could differentiate between in-kernel and user-space
users of GPIOs and then make it impossible for the latter to request
certain pins while they could still be requested in the kernel but
that's outside of the scope of this series.

I don't see why this would stop these patches though, as they don't
break anything unless you decide to make your pin controller strict in
which situation you'd need to verify which functions can GPIOs anyway.

Bartosz

