Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6A4C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 22:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYAfR6rT+J2Pmezoedxv/QKmEL6vhTnAGCGwcyVDn58=; b=pasRW/sd9jz0r4PD//xOjNzdXZ
	g5R2ttjg9ebKXN1G0shOC/ISa2uoMnrGBe7z0xevShSiuN08TyJzRhDzw+Imt+SM0Bo2z7OM6EzF8
	tsKI8IjxLtvRgLO4eFcpMsR4Yq0uO7zNT7ulQbIXHmE63A/pwEvkZQzqP3pD7joZwDBapB4YVjJLs
	d7H/xUBI3i7b6hJkdXEX29sT35jV0JHCm6qfjmPAyGtxtIZUQ6ffpEYbSASs4htbigPeQnDwxXczA
	8qNf2zUmaVEfRpkMUOW7dDNGkOP1ZVt/dyoxssx9bX8lDXwyEybdrFzCGXblZ3JULjCqpelAUMC0+
	KII1a/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmmS-000000095dB-47vW;
	Thu, 27 Feb 2025 22:55:00 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmku-000000095SE-3haM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 22:53:26 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-545fed4642aso1456653e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 14:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740696803; x=1741301603; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYAfR6rT+J2Pmezoedxv/QKmEL6vhTnAGCGwcyVDn58=;
        b=cJgrCFwPXS8qnwxF/uJYNb1igaB7hMJcm8CG3UVib0QeNQqCMelDqo54ywa3gQtsIh
         FgCZ48vX3ECary3Xx8Ek+C6zRPy9f8FEmem6vmnEoQA9s+b8d8Ka612M1fRLgGotTNjf
         qKGkU+gXjNbvK4asmAjiz9i6AxWlL6YSt9NghvtHfFnvhtjpoKKzQk/YUmCgMgQrmp0j
         HA3lqZPthpmVQLdMwkDfHMSOPchSPr3GTS7L8LnvS3HjbL1LLPPTCD7qA2qJpdpFu9qO
         zKsZVUOvCR80FLM635WI6YxA7RnRGZQTsSEUsehvovz69OpJ+LexjzQ//j/hw9z+5lfs
         jGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740696803; x=1741301603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYAfR6rT+J2Pmezoedxv/QKmEL6vhTnAGCGwcyVDn58=;
        b=GLyaRk0FSCecBrKnYVxG89fCAEvEmcJDalwjh1g/he7lMEsTI2hInLD/BFC2T3p4d+
         iB6kP/57ssVqJM6T289a/yWK03h8qF3fkIP0I2+Kbsb1dcSej0ajKB+Nq0VPqWEP+Gsa
         OlRW/lhsuTvWHwiZy+aSg9R2NhcUa9i3Q21oZHfbsEC523Be17Skvy2nzJIw7a+30ji6
         kQ6tZg+0NYTEemWXPo9G0v7eFHSLU4oWL9CVQoRvs5c/LxHSyICB9ySU6f1k9jyNtECB
         WorbINKMjyUzDLpXj4TBBn5M/v2K6tvAHbjJ9nGBHfGVI8N4Cq3mbm3QUoDYZJBAHnPg
         008g==
X-Forwarded-Encrypted: i=1; AJvYcCU8P9iSiKTJ8pYkReHfJZXgbVQXe31BxiSQi3zKi5JXrF+LoXlSIlPrJCAVu3flPhyrhWJVJahxTfxRY9ujhwuY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyml2Fp85hMk6HyhKKJtgOr/uDF/Ux5FfS+YHAqHpFZobGUArJ4
	vMOtm3Tdr7G8vNOJu7VQjP31vS4UBxnalDe9ahw9HmxWFQvnfVYF7OC7Mr0ETSMeaom2LACNC0D
	7gEKg/CyrnguQBFezYRdbskmUktj26QbY3TTXTQ==
X-Gm-Gg: ASbGncufwaqv98vodHGDQM24ueojT9eU2BOenHdHwSIuh3KFejUBQoc3YIgG1BFm/2k
	C0OqfFwavZEWp7xBvRjYjmM4NRkxCxtbRguiUyZEPMovTC+IbfjCTyaiHnkYVCfCmSl8Aa+hxZ/
	VVbnyIRAI=
X-Google-Smtp-Source: AGHT+IEtwiHtj9LHUcW0e/otkeY6xFx8rK1S/vfrLBTeffolkmIjfF0YZc4BMa7wskN4DXcOEuc/fyfJLasqmpJiYAc=
X-Received: by 2002:ac2:4c4f:0:b0:545:2770:79b2 with SMTP id
 2adb3069b0e04-5494c351b83mr499150e87.33.1740696802619; Thu, 27 Feb 2025
 14:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20250219102750.38519-1-brgl@bgdev.pl> <Z7XqSVfhPGI5J63B@finisterre.sirena.org.uk>
 <CAMRc=MdEcjFUp2OEutcnDqSHbbait3f25NEWbdp7mARyKZLvBw@mail.gmail.com>
In-Reply-To: <CAMRc=MdEcjFUp2OEutcnDqSHbbait3f25NEWbdp7mARyKZLvBw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Feb 2025 23:53:10 +0100
X-Gm-Features: AQ5f1Jp6iZursAYFoyZhYUa8R_xOEcekX9mX715XkkcwLe7KRWmfwikYltCeIOs
Message-ID: <CACRpkdbkcX5pEeikkDZAxSGp+M3kJH5SWimxQA6P35iiDAUNdA@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Brown <broonie@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Liao Chen <liaochen4@huawei.com>, Chen-Yu Tsai <wens@csie.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_145324_923018_6F144882 
X-CRM114-Status: GOOD (  24.11  )
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

On Wed, Feb 19, 2025 at 3:30=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Feb 19, 2025 at 3:27=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> >
> > On Wed, Feb 19, 2025 at 11:27:50AM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Since commit 9d846b1aebbe ("gpiolib: check the return value of
> > > gpio_chip::get_direction()") we check the return value of the
> > > get_direction() callback as per its API contract. This driver returns
> > > -EINVAL if the pin in question is set to one of the alternative
> > > (non-GPIO) functions. This isn't really an error that should be
> > > communicated to GPIOLIB so default to returning the "safe" value of
> > > INPUT in this case. The GPIO subsystem does not have the notion of
> > > "unknown" direction.
> >
> > I see this was already tested for these specific boards.  I've also
> > found that Avenger96 is failing with bisect pointing to the same commit
> > this is fixing:
> >
> >     https://lava.sirena.org.uk/scheduler/job/1126314
> >
> > as is the Libretech Potato:
> >
> >     https://lava.sirena.org.uk/scheduler/job/1126285
> >
> > neither of which produce any output before dying, they'll not be fixed
> > by this change.  Seems like an audit of the drivers might be in order?
>
> Right. I don't know if they return EINVAL or some other error so let
> me prepare a change that will not bail-out but simply warn on
> get_direction() errors in gpiochip_add_data() instead.
>
> This patch can still go upstream IMO.

I'm fine to apply it, maybe as non-urgent fix at this point? (for -next)

Do you want to send a non-RFC/RFT version or should I just apply it?

Yours,
Linus Walleij

