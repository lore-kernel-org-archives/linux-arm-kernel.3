Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D9BD42B80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/tz6t8emZ2B8dwA+ERmN9anAjhGd2BlkO2AWCSTy0A=; b=Mn5mNuV2uUoRjgWSOtPa3/gmww
	DWBweirYtM/0RNElZBsL5avootqHb6hPu6uXHKOQ4g9fZctJots9oBUw7P2l7tWXcqzLgtba4WMzc
	fL2ZDJgJK7FqyFcYR38L1fVGcBWoDtHDeMoDFdkHRc7v9mWvByDaWnAGjAR397t9LDB3aCvBtsi8R
	iu16RAorN32QT71obanJPVZ4nFG8t2F31yzrm6Ci5cBBuTStUhbR/SAY+ZTFuZO4G48ibzQ6pHYjV
	/0OUqdWhGd3y5HwFqZDUrqW3L4WSLNwjDiVXyh++91UKl+M3dv2+kfEwdGFqfC8AvpYrYlj5aTYQm
	uw1kMqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArJ2-00000003efn-3rgy;
	Tue, 12 Nov 2024 13:51:45 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tArHC-00000003eJu-3lUC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:49:52 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso58823151fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 05:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731419389; x=1732024189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/tz6t8emZ2B8dwA+ERmN9anAjhGd2BlkO2AWCSTy0A=;
        b=QUaBSE3O/c4yIkRvQC5gpkAd1sXyf44Mig8+9gGscRiIlihp+YDskQa9sc+ilMFOuY
         I4EDB82J6734o8VecpE6wR5ipdKRc2iPZud12q2JN6LpaHh51VnkN+JPeGuKwY5xeuJJ
         w7WSmNWHmYMG34cmSWtQ1dZRojWBmHyNX1eTOitk9zxrhAfc5UM03jZaIn3rSh+tHyo4
         cXdItKOm+NuYwj6Fd9Z6Arh8tJMXk3NE/hmIavbcbSA3Gxz3ddP/qPoCXEsDMCgWRMvO
         0OEfw+Blb8AeT3zgESrikfrwzjPkENxJ9HMvz5UnDjQl/+RJmWYjjL76x0I5z00Ach2S
         hBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731419389; x=1732024189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/tz6t8emZ2B8dwA+ERmN9anAjhGd2BlkO2AWCSTy0A=;
        b=OeDI0sV5KckkIz28i+toij5WgmgZd37Cq0knIgwrqZgEo9dLE5H2Byfavo3TGrFeHb
         EoAEXSaWlbva7T9e7pHoQp36ekgc5qLSjWXF8sso0s8tgSYxBnzAdEjiRtrSP8/hVozX
         b7uw+JPiSQ1cVTflqBqPjngxhwV+lNaODAd0nxbFXhqF+/7ofC4ZpmxyEsTA/D+Odnt+
         B1mWv0/7h/OQ87oDF9eHellyqMOvU8mtmUnQAPy6EZDHhV1CaX2M/vIHCQpBW6r3sEql
         7+n6KlRsXski/FQZiNaL+o7UxUxFDCKiWSpi7ChM31gxXan1+9c6in7ZEPilk302HJqn
         97DA==
X-Forwarded-Encrypted: i=1; AJvYcCWcJgMP1QBAad9R/9R+HVqrBV+xkZPxAPV0vfhFpmRygcxQ9k7y8FycUlRBhEkzHzFtWYsOc/Ew73c45RikfQT7@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ0d1kG+CVJAfK3/mtW+Ea/cUwVc/NK8TWPrE6dFxoZrly112x
	mjqQFZBG0ic0aEpaJK1iNpIdvfMjss4Dcdxk9kEmbj0W0GurPfa4CXpmw0OdYrykc39PleJ2x0j
	U5OFc+bojMexWgxdmG2F78oZ82TYLAwVm5R4XyA+wa5W/HIP+9sM=
X-Google-Smtp-Source: AGHT+IHWcY4HeLXrrsjlFeqF9hDRKyiwxqpUnrkcAstxBsqv/RvYFEsaSAglhvteVmoPlR9N2NfcmRsc49RXWORdTkQ=
X-Received: by 2002:a2e:a552:0:b0:2fe:e45a:4f6c with SMTP id
 38308e7fff4ca-2ff20963bd5mr52169231fa.6.1731419388773; Tue, 12 Nov 2024
 05:49:48 -0800 (PST)
MIME-Version: 1.0
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-5-ye.zhang@rock-chips.com> <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
 <ZzMwh2GMP-bE7aLO@smile.fi.intel.com> <CAMRc=MePqsQatxNy7p5c3sE4z8RepjjLeFgpppKgEctCU3jAUw@mail.gmail.com>
 <CAMRc=MdY1idv1o_nZFb1fKLpM5DHCPmEu5t5MMa_kV9csLgQWw@mail.gmail.com> <qwlya3kten7ugxzruohmbmmymjd6trz3rlbflirr3yym2vfe32@rapst33wknmd>
In-Reply-To: <qwlya3kten7ugxzruohmbmmymjd6trz3rlbflirr3yym2vfe32@rapst33wknmd>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 14:49:37 +0100
Message-ID: <CAMRc=MfVPn1+TL1XRtPfdCrD-TEy5mG-vuPJFtFyx73+EioSxQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request irq
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ye Zhang <ye.zhang@rock-chips.com>, 
	linus.walleij@linaro.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	tao.huang@rock-chips.com, finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_054950_966446_BE29DBCA 
X-CRM114-Status: GOOD (  26.37  )
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

On Tue, Nov 12, 2024 at 2:23=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Tue, Nov 12, 2024 at 01:53:48PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Nov 12, 2024 at 1:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > > On Tue, Nov 12, 2024 at 11:40=E2=80=AFAM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Nov 12, 2024 at 09:48:06AM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Tue, Nov 12, 2024 at 2:54=E2=80=AFAM Ye Zhang <ye.zhang@rock-c=
hips.com> wrote:
> > > > > >
> > > > > > Since the GPIO can only generate interrupts when its direction =
is set to
> > > > > > input, it is set to input before requesting the interrupt resou=
rces.
> > > >
> > > > ...
> > > >
> > > > > This looks like a fix to me, do you want it sent for stable? If s=
o,
> > > > > please add the Fixes tag and put it first in the series.
> > > >
> > > > Independently on the resolution on this, can the first three be app=
lied to
> > > > for-next? I think they are valuable from the documentation perspect=
ive as
> > > > it adds the explanation of the version register bit fields.
> > > >
> > > > The last one seems to me independent (code wise, meaning no potenti=
al
> > > > conflicts) to the rest and may be applied to for-current later on.
> > > >
> > > > --
> > > > With Best Regards,
> > > > Andy Shevchenko
> > > >
> > > >
> > >
> > > There's another issue I see with this patch. It effectively changes
> > > the pin's direction behind the back of the GPIOLIB. If a GPIO is
> > > requested, its direction set to output and another orthogonal user
> > > requests the same pin as input, we'll never update the FLAG_IS_OUT
> >
> > I meant to say "same pin as interrupt". Sorry for the noise.
>
> GPIO output and interrupt at the same time looks like a misconfiguration
> to me. Maybe check for that situation and return -EBUSY?
>

Of course it is. That's why we check for it in
gpiod_direction_output() and in gpiochip_lock_as_irq(): refuse to set
direction to output if the GPIO is used as interrupt and refuse to use
it as interrupt if direction already is output respectively.

This patch however proposes to set the direction to input implicitly
which is wrong. The underlying gpiochip_reqres_irq() will check the
current direction and return -EIO if it's output.

Bart

