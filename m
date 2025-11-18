Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E11CF2562
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 22:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+61w5T6iw2L+z7yyBk2vWNFdM7DOlMNfukQs3rBBhU=; b=GigpVhG71vPmZuckf4XH+lm3NR
	44dfhE5D3qlR/3iZlDs8M0aZ4AWU6wlS1LThSXOmHKI9D8+a3B/NSxGVcspa8+SSxbwySbnVmAxZg
	0ya+Z4iy0dstEnwgQdcguSSvdbXwuhEl1ywpIkupMnmDU005SM9pNRIrG5WI8ISM2YuEX45c99Xm/
	soIBvrwHq6ABMjl9qDPgrMU2TR0lIFOwnob556ddYe+qT2rBUJtnmnMct/tMkQz7LSPEMKK1+5gYY
	Fby6zS20yuXr/b6lAA3vyOQSRi0n29KC9ifcDW8fEUaUorXYwZc5akRKHUT68D+0643Es3ZEjRRur
	d36fJPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUeY-00000001CvU-02n2;
	Tue, 18 Nov 2025 22:58:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUeU-00000001Cum-481v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 22:58:24 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5957f617ff0so6612660e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 14:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506701; x=1764111501; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+61w5T6iw2L+z7yyBk2vWNFdM7DOlMNfukQs3rBBhU=;
        b=VamYgR2VZLshvwzlbi6zARUbXiN8aUVdHnsq3cRNafMfEll+TV1QasXUPvK1jEOwIW
         x6jEFAYIkXeWXkMl2+2jFCxBDG72TyA5Eq7sAT0MC69OdO0V3Vn0VoAqOxHB5/teh4N8
         fRYdIqpq5fHbpZP3/dzU6uUlPxH7BX2Bc5XOEgqZNW/yHlL0PrAxXDFGZDWvcib5fgtZ
         tYYKSvUJWB+hcTk9y9OlAbvs+zat6AN9CL0G0wMMy6BmjNvLvSveILSYazYrNHecNOLk
         TVX0FdZfjoRDRYDg70c/RNPMlI9tQ77VRKi1LSZn/kz8hct2gIDfaJ+3+gauWdSYSMOd
         V2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506701; x=1764111501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+61w5T6iw2L+z7yyBk2vWNFdM7DOlMNfukQs3rBBhU=;
        b=kWH4EPZRMywLoEidtcvBsY7I9dC71y2n3BiEonjfVj91IwUWDnu9z1kRSBbPla6lSu
         XoZ29Kbl+cBi4YBeQpedlVxCdVPtge4ZE4NkK9zTVE4gtSBHWIIQ4L2NNj+ayAl2Iubw
         Xo6NCakgB5lTrEG0tuhTh+nEVtZZZ1ehmbUPbQERSE6uFAyHv1Fe1lu/OvQbkhUA00Bm
         Jp1u6UzYkNcAM1r9snUsfvl7Y8kZ/kR+TqqUBkHrFr/Y8zuoDYFP0wWmm4uacqe3GD28
         O3QeSH5KbT1LKzUsNQB2BkXzyn52bMJNCQDA/dKxBbqy6zgdvp8PYusiU090MF31Q985
         r80Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAWW/Z+omVP2NDl+0dIaJftxEhwH4rDzRyft8MpUsdEFdOA80sbNDYZDHXMHnLHMybPewHxQIEF/BII+bxYHUB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5KjLj2YyaYR59hUVnDr1ExuOKD1Y/8EA59yq/J4U3pEdLVyjc
	oqxC9w1E1DnlS/H8l+sa8pmK90QsJxte4P6YoPzgfjkAmBKg2tjpjBqGXnILMZ/ocJaw1UKWxTw
	uIvcoBRiTP3m7JUKJE5D9pq0i7sbjb6iRniyIoqqsIA==
X-Gm-Gg: ASbGncsrDgfxUOWgl7XRqjAxO2bPmZ5S8s6N2u0RolgJB6dK6cngjLhQ5PyY2ppTw/d
	XIRAfS2OdwS3ctaqvZ+WCY4ONNA0ZXtsMBS3JS8budYZVrGpG5udSrQ9WyvEAZmeKqVQITv8wea
	l50eaIpvL7tEkzO/9wVZKg+xdP4baMdXg3WVCmWsJB38iWgGsOtmWDX3ufFnNMNHJWKQPg60WEQ
	RS7Ti07xKeXkiGpsIiFAF0/9KxmSoahCJVOBzvncgSbz5BYq3Yac/zmcE4Qt8TE/exKznw=
X-Google-Smtp-Source: AGHT+IEgaegsgmXSR9c8Hx3M4QpdDNUJIc1KFnkqGODlEyosq51AmUd5jf6mWflPCoaxnA933h/YZYR/OFhWE8sa4io=
X-Received: by 2002:a05:6512:33d0:b0:592:f48e:c725 with SMTP id
 2adb3069b0e04-595841f9725mr5921930e87.34.1763506700860; Tue, 18 Nov 2025
 14:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org> <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
 <CAMRc=McySdUtj4foEf5a2db8jUEa=CnPmVVms2nwHoO2UYChSg@mail.gmail.com>
In-Reply-To: <CAMRc=McySdUtj4foEf5a2db8jUEa=CnPmVVms2nwHoO2UYChSg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 23:58:08 +0100
X-Gm-Features: AWmQ_bkpyyk7f39_4wc6746I8bnl6C3ILvHa9yZ2lrW5div8cVmrRRgtpGXas6k
Message-ID: <CACRpkdYjL3u2UyD8A9uLWf1wU6jQXvAOhU5+Y6+8QXeTAe1ksg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_145823_042391_A4A0224F 
X-CRM114-Status: GOOD (  18.28  )
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

On Wed, Nov 12, 2025 at 9:06=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Nov 11, 2025 at 11:44=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >
> > On Wed, Oct 22, 2025 at 3:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Provide an interface allowing consumers to check if a GPIO descriptor
> > > represents a GPIO that can potentially be shared by multiple consumer=
s
> > > at the same time. This is exposed to allow subsystems that already
> > > work around the limitations of the current non-exclusive GPIO handlin=
g
> > > in some ways, to gradually convert to relying on the new shared GPIO
> > > feature of GPIOLIB.
> > >
> > > Extend the gpiolib-shared module to mark the GPIO shared proxy
> > > descriptors with a flag checked by the new interface.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
>
> I think you wanted to leave this under v3?

Yeah probably, a bit messy in my inbox!

Yours,
Linus Walleij

