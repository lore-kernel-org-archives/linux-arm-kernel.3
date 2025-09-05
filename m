Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69961CAC580
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4iBW7toaydLQ7imUc/GfTyAbD/CCBjwzlb8LKJDuO8=; b=jqSiE7gFNDF0hKQ9fJQUVVJCeI
	OKntWogXrdxN/2uw7ZbcsOPeQd10O155rNdRPNv4AM0zrOwzaumsjGlZMTJ2sfndxSeLWnfMjykBv
	70OPCMjLpPCWRD/snwoPOCMU+LfACWrwZP6zys/DVhM5wcCd2GD+iAHbmsA5haZlxkICre30btWe6
	56mQwqnEcAriFzVPBDZ6t65+99JTee81rksMfY9h3XhMOm4NnWYbqBbXnQMg6q7kGsd3Zi5yC9VdL
	DQyPtHIZWkGaSNkGm6w0ketb4khcvb1QurFydzHnSZ5ncZrw++WB6Ey66E2kVTwhmYFTiGYXe8Hz/
	h8XSulWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUv-00000002K2N-1Ixe;
	Fri, 05 Sep 2025 14:33:05 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSgG-00000000ioe-0mT4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:24:29 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-336b88c5362so18541041fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 02:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757064266; x=1757669066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4iBW7toaydLQ7imUc/GfTyAbD/CCBjwzlb8LKJDuO8=;
        b=oIle6AWJ1syyaVzFvSK47fCIoWvbvYSaVIbXs3ogbr67MZKc1pGjsaR2UIPQzMmStd
         4T7vsX5IoQMlCWF9rP3arAd54Pb+ptk6/eNb26cDdZ3vXTcgN4xXfRA9GwjEdf+ZpPdJ
         Qk24Lecrz/S4mwNzPX2JZiXO1tzieN4/gT2MHiHdxnFsXkRHaONEcMb72G8V+UQzA0vI
         qDRGTbPaak04HRbm3Zfdv6j+EiHNcCI3tyuT7pkxLBl52WpJQvievwpyiOwpVIB3NhxJ
         tA4ZOq/lwqVrI83VIe7yb9wog7rhkUDY1kk0+r0fnl2+sSviYBFevlEJmknjtpKqT4nt
         CicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757064266; x=1757669066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4iBW7toaydLQ7imUc/GfTyAbD/CCBjwzlb8LKJDuO8=;
        b=DYj3AQz1OoYcE57x1wuLAaXepcQilxRsuIZDCK9PKCU5ug713RTRjh5GG4WaKAlVHC
         Jcl//x8MSltMSh7hUGU9sCr9guauMJ19r1iy+imIvT4q3Lcnepy2GTKTOvnxyiWC9hmX
         8uhxzUkiSbs/xCBcHOTeTzQX8IMaMhLViwTOLjNmE+i3LhpH77tgLVZyts0jRrhpvC37
         0EIezJ34jjzM04rdDsDO2dL9o6BRamD8YyCTE40AgZAXjzqTEWvpjK89MwdzCqt77gjn
         uRZWfBEh34aaFeQxGPI3t6Yf0sm6Vu6rFcMMtody6dYulN42HG+pQwqyOe37Emd7zkV5
         wh8w==
X-Forwarded-Encrypted: i=1; AJvYcCX1o0neAKXNREqMCpd9LPhhpI1QLhN/2Uf52jMikDrMsb05We94FznJej4DTLqNWqDwdUhdpHzbUDBVrASwFjLA@lists.infradead.org
X-Gm-Message-State: AOJu0YwOCKx5WH8pVqMx+nVq+bhHJdHf5erxcaksCFzMpPrVxjmoc7QR
	e04/pwg1I7Rr0xbQJnd2Q9WwvC8vsYXTDqb2Gjq4h3Jkt4fBidxT6WrixaGABcYS8SH1LTyKD7J
	cspXnKPNi9MLaVl2qWY74P5qxkEnEXVrx6rv4AzPX3A==
X-Gm-Gg: ASbGncswuZgcsn7/W1tF+FaCBYW5QYsCBFIZRRV5F5TDZRDMyy9u58Z/ZcCVIyY9kcy
	kp8PH5oY8dWp+gf1tCxP23JCw4Z+t3H41+63RBrO7nCBIY+xFAy70EgbmL0rld9Q7gdz33xS9Gn
	K5v9QuJ8/5yWxmLuzK9RkA/Yt1Tcti54UO2FYoesEF03gWTvA/HLRG/ypyuzFyE2kMQpa9TSwYn
	5fpbHwZM7848sVgZw==
X-Google-Smtp-Source: AGHT+IHf8M+zGLz7Z5SlYPw0WPpQqAm9QKyvMQ2dhbv1sQOwJcfYvYdYRxdgHr8ORJ09bjn8JpTeTz4W49oHRu491HM=
X-Received: by 2002:a05:651c:4183:b0:336:95e1:9583 with SMTP id
 38308e7fff4ca-336cab04db0mr57663561fa.21.1757064266436; Fri, 05 Sep 2025
 02:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain> <CACRpkdZ9EHoHiKit+T-ur0xDKMEoN_=TydzTfoggNBQGdra2bQ@mail.gmail.com>
 <CACRpkdY3_ifPsQOTqa2e-kHR24Khy0axrZ=K+vO4OJB+FjdB2A@mail.gmail.com>
In-Reply-To: <CACRpkdY3_ifPsQOTqa2e-kHR24Khy0axrZ=K+vO4OJB+FjdB2A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 11:24:14 +0200
X-Gm-Features: Ac12FXxefXSGz6SnyspKuWNLPpG5rs79kfLCyyMTukP-5craFHKIm7xv9A9F5nI
Message-ID: <CACRpkdaJNK4+Viv+kdZUSXH6r6jRfGt0KixsTuRTP56qwQccYA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_022428_227878_066840A6 
X-CRM114-Status: GOOD (  29.18  )
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

On Fri, Sep 5, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Fri, Sep 5, 2025 at 10:27=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Sun, Jul 20, 2025 at 9:39=E2=80=AFPM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> >
> > > In SCMI the value of the pin is just another configuration option.  A=
dd
> > > this as an option in the pin_config_param enum and creating a mapping=
 to
> > > SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()
> > >
> > > Since this is an RFC patch, I'm going to comment that I think the SCM=
I
> > > pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
> > > enabling and disabling output on pins which can serve as both input a=
nd
> > > output.  Enabling it is supposed to write a 1 and disabling it is
> > > supposed to write a 0 but we use that side effect to write 1s and 0s.=
  I
> > > did't change this because it would break userspace but I'd like to ad=
d a
> > > PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
> > > But in this patchset I just use PIN_CONFIG_OUTPUT.
> > >
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >
> > I tweaked this patch around a bit and applied: removed the second comme=
nt
> > in the commit message and wrote the docs to be more generic since
> > in the future other things than SCMI might want to use this
> > config option.
>
> Then I thought about it some more. ...
>
> Isn't it more intuitive that we rewrite the curren PIN_CONFIG_OUTPUT_VALU=
E
> to just PIN_CONFIG_VALUE that can be used for both reading and
> writing binary low/high instead of having two different things like this?
>
> I will look over current users and maybe propose a patch.

I discovered that several in-tree drivers are already *reading* the
property PIN_CONFIG_OUTPUT_VALUE to get the logic level of
the line.

I sent a patch renaming this property to PIN_CONFIG_LEVEL so
it is clear that this can also be read, and you can drop this patch
and just read/write PIN_CONFIG_LEVEL instead for the GPIO
driver.

Yours,
Linus Walleij

