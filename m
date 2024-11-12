Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C05D12D66
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9hxsmKDBDKSSi/jW2NU++UBfd3Bt98xWitaVEtQSBs=; b=CMLETDvq/v051zsX/SzLbhATbU
	hmsoCAEOzJ+wK7cQCZWtYvx/c1t0oYB0dthV5wLMtg+7kP0fOxxERXUJPIOJKCC08msVAUqRMoGpw
	kIm7mCK+GMg1M2GMUZQXQwGgLVzhLEuHHFkbUlSBahZ+GPX46yKf/m33bB2XZ6tVmgRy8lUSLoeV+
	C/RTHBTpCwrJjlz+20gDt4KSlJfcqR06ctdOY7iXz3OrqGdkAEhoZmT9q0dHbnlAzIl7r8jCw2BAv
	IFGxSHwBj3LC0129s5y2N78k7wkqnxCyEkX2Ab1oahODtNx5V60x9w8bBYg82FGhT3ViLg0A09kXP
	YkPG3EFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqRO-00000003TBe-3o5N;
	Tue, 12 Nov 2024 12:56:18 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqPB-00000003ShH-1pce
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 12:54:12 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so57476371fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 04:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731416039; x=1732020839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9hxsmKDBDKSSi/jW2NU++UBfd3Bt98xWitaVEtQSBs=;
        b=Yh3V88HxrUprXqId2YtJs6DBAMsxe0uCmTPDiGUanRTz3XvMoEkpyHVpbklDRM51D6
         0Bi87KkYT9zmJCbLZL/fRFaSvTQzfni8U3NN8vQyaVZ+dLXNuprWNGDAYS1ILp3LTDoe
         u4bVJtBvmG3rMWxQic3LkJuu6H4zQIRBpC/oy3oftt0TIVbQqfsAXSAbZgWQ9pEnp45h
         DejiMQ2J0oH/1OXXWYTHqb5KUC02h08Ff1XLcuu225iuZLq2FLUR0LjW/MT/BREPRHKo
         KIGqryC23T7TqaPO55FUjxBUPeXVDJDzax3v3iMG2+bWcOtR55NVCrmBJekXUxAyIAPZ
         flmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731416039; x=1732020839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9hxsmKDBDKSSi/jW2NU++UBfd3Bt98xWitaVEtQSBs=;
        b=FRu4mSl22EyGapusFuMHoLaZuCcqZXKEBHIiPN2xNKo0YhBIQCk0ZyW0q/M1zVRWsw
         ty5QOn4Vdul27AG+3S3afKmDVjHJBQ9bKNhmHecXBZERBHoOwC+1v4kNDT1BrlSwEayd
         w/OD7PEPSHTqwbQfZMPNBmjicp43Qs9Q0g1S+T1KNHOu218kqC60oqOVimCF2M6wxvrI
         TvGozKh8w8e0lZP46lqBNen9dc4p59U4HPjgFpGezv4KofVJSRZdhW3XAfjOzmUQfK1y
         AqGzxwKKz0qAUiySFR1t9B5zBLf2PQDYjZlTc70ExLulUHVZDERNJUDtWtSeVh2h3Adh
         Yn5w==
X-Forwarded-Encrypted: i=1; AJvYcCU6WwGFCmgA5C8NQRl2ZpEqWNP9eP7zd3jCXqMv2bzTWnFJkPn9sS8gxZlI/5KzxQhAhTGb4RkL9g4SgybVq8QM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+mZv+OkwwDCrU37LXzcM08qayMTb3a+eHBB6T8vyovz0BApfF
	aJbb7mK+7ZSuH8B0nHeTr6g0ddJ8QuVhrOjCcxT0uVaGUnRBVrF1iUOE/p4QNmREo7nLGkexGsK
	MFLHzoIo01k9jofuTPBpDHdS8esAkMXtz1SUTxw==
X-Google-Smtp-Source: AGHT+IGbmE0o5QthwRBQiRAF+JVGWtz10N60VDzpRavWFxo0o78BzJrNfw3tuJBFoTaZr9DjOr15SEHztRHupcY74Sg=
X-Received: by 2002:a05:651c:1542:b0:2f1:a30c:cd15 with SMTP id
 38308e7fff4ca-2ff202ad40fmr80832201fa.36.1731416039490; Tue, 12 Nov 2024
 04:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-5-ye.zhang@rock-chips.com> <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
 <ZzMwh2GMP-bE7aLO@smile.fi.intel.com> <CAMRc=MePqsQatxNy7p5c3sE4z8RepjjLeFgpppKgEctCU3jAUw@mail.gmail.com>
In-Reply-To: <CAMRc=MePqsQatxNy7p5c3sE4z8RepjjLeFgpppKgEctCU3jAUw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 13:53:48 +0100
Message-ID: <CAMRc=MdY1idv1o_nZFb1fKLpM5DHCPmEu5t5MMa_kV9csLgQWw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request irq
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org, heiko@sntech.de, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_045401_501883_47A9BD7A 
X-CRM114-Status: GOOD (  21.61  )
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

On Tue, Nov 12, 2024 at 1:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Nov 12, 2024 at 11:40=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Nov 12, 2024 at 09:48:06AM +0100, Bartosz Golaszewski wrote:
> > > On Tue, Nov 12, 2024 at 2:54=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips=
.com> wrote:
> > > >
> > > > Since the GPIO can only generate interrupts when its direction is s=
et to
> > > > input, it is set to input before requesting the interrupt resources=
.
> >
> > ...
> >
> > > This looks like a fix to me, do you want it sent for stable? If so,
> > > please add the Fixes tag and put it first in the series.
> >
> > Independently on the resolution on this, can the first three be applied=
 to
> > for-next? I think they are valuable from the documentation perspective =
as
> > it adds the explanation of the version register bit fields.
> >
> > The last one seems to me independent (code wise, meaning no potential
> > conflicts) to the rest and may be applied to for-current later on.
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
>
> There's another issue I see with this patch. It effectively changes
> the pin's direction behind the back of the GPIOLIB. If a GPIO is
> requested, its direction set to output and another orthogonal user
> requests the same pin as input, we'll never update the FLAG_IS_OUT

I meant to say "same pin as interrupt". Sorry for the noise.

Bart

> value and I don't think any subsequent behavior can be considered
> defined.
>
> I applied the first 3 patches as they look alright.
>
> Bart

