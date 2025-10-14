Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C4ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 19:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9u2xhRjxMY0OHfkeZgBaJjHDhZQq+aqtFfr5uDFVIn8=; b=2vp45jMHhKJ8qiUKYYct1sitCk
	gtDymFL1rz4dAJmpRCwOE23RqblByYhZ/IHWYA9W2eRDxg4XWauhK2qKP8nyQ54Knr9ASYq6muaCM
	nxNnyWlJC+xKf+HjYouHtdxWZo4VAh0veZ3A5mZ9O3t1mkjvMC13kHTYNYy9LHmakQKZ+1Zy3nOvJ
	3orvKL+gDGQ8YPteZN7oqp6YtrVi4jDtQeXX446dGX0rBTaI4oY5Mdlc86jBWuK80RhojgIL87kgW
	oZOvdKwn3BKiw5YraFyefVc25kzZ291+0BYc2MeViSGbq8KU5H+2aYyoYkPJsIcHWLAURDokE6jeq
	qvmmNlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kWd-0000000HFfA-3Eze;
	Tue, 14 Oct 2025 19:17:35 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kWa-0000000HFeY-3TZj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 19:17:33 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so5833795e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 12:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760469451; x=1761074251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9u2xhRjxMY0OHfkeZgBaJjHDhZQq+aqtFfr5uDFVIn8=;
        b=KxfNJaY+XNQjawxCufsRcFfTcdag1xf2KzQQvwoemqC1gWokhs7yH5DVEdrFNX0pQA
         LEvkQWXvBBamquZAmgqQOe9aMgEMDCrISflV/5Hb1HKxfNSiYnQhKziTElK6MB4fCJDQ
         K5y2PXgqmrT+7dNoBBouVbRUGxiW7dQa52RGg0JxcxJ5ksJpr60Rupa5/C/XfVgLiy6d
         ii/ZXX1mU2KabGh0h1QCz+xyhKMs7fr5bMZ0qATsL/05+Svq9RdKV4q/mRPnVgmfkOku
         xWkw0udUTPPJNfsUR33F2GZBZGtSIfyGBaDDFksHra1XW2w0XLWcX/Pxt24bVUGjD+Rb
         39BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469451; x=1761074251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9u2xhRjxMY0OHfkeZgBaJjHDhZQq+aqtFfr5uDFVIn8=;
        b=kNlaVWI68tQvTehUHHXARruwe79fJQ+3Fn7HlVFJdhogkPOaE4Qn1lv96nUxHKc/6Z
         TMwWv9IGjlTval2tlSJQfqrpz2DrZmi60xqPEmBvtSH0qs5HunyM1vShtusZ64H1KAtI
         RuILZbBVEuD7K6T2qAlCxx0UBywzcJffL0p0UA5y0NxR57s2Tb/akMQvXlCAuw0ZULTf
         4OJJvJi2He8zHQYSMjFl8K+CLVMsvIdcQZoktpy1R/tuIapz3kOdqA7et+HP8S0fjgps
         4t8l1WzTfxah02ZA7k0Uy0zTeim6zIIJPVD8H3Ubfcn/bm3UQVhHrZiC+INnRy4exxGW
         K5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCX44Q42nWDcD897DeeF8vbsi3Fae5hoZbnofJt1vxmxpiHy1rg9MtvSFgyLX/G9yNjAZAB+lMT+3hYJYtGWgV9Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+StSudbTSM6vY4SGnYs2ayEVK9bxNUkiJk8nfQKj/UukFKNNJ
	htN54UDZQkIkn/NIZqVVPOMbhpyVA0q0ZM0ELiqdSaQdG/9DnGZHP5WAaS+DGMaW5lQINyYclLC
	Sws1awScqx/JZz0YPCqtBcHW1IiTEpfbaMrsHuJvU8g==
X-Gm-Gg: ASbGncugxJ9TjK3hWgEi56BwC/Q/NEGr8QLyxqZz2OqUoKgpw1dyfvFl4IjZbXwOgTy
	OrfEB8/2SrvJZqu9fMbHBNvKZgq06f72wx7fGQf+vncLDGmNR7VBqaNHmDAu3lyTYK/H09xqgLb
	V3uB8MFu+fdjG92g1CLlaTIg96lqoPT5beJhwaLJKr4iYiQVOxrSTVHMiztRYKqMxVHP9/U6XDQ
	raTUHSXn2+1oIzHcIk1CKZjT/7Ajg==
X-Google-Smtp-Source: AGHT+IEGUS4Gd3DOiYb0CWjdPtTrv4xdAxyOe7Tv+OqMwGviA724GimvTCnIrTO1U+O4G506e5yK1WmR/GzoIGF6mSU=
X-Received: by 2002:a05:6512:3d23:b0:58b:189:871e with SMTP id
 2adb3069b0e04-5906dc12463mr7452727e87.3.1760469450698; Tue, 14 Oct 2025
 12:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251014015712.2922237-1-gary.yang@cixtech.com>
 <20251014015712.2922237-2-gary.yang@cixtech.com> <CACRpkda-2BNj+Pt2kS9u_bbr41bsWGRGDqNd3EXVnys-xSqg0g@mail.gmail.com>
 <20251014-backyard-parted-572627bfc540@spud>
In-Reply-To: <20251014-backyard-parted-572627bfc540@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 21:17:19 +0200
X-Gm-Features: AS18NWAUmIlF_t1r_m5_roptigL3TJ5IfhnwTJl60nwKQLpHKJKzA9shz3gKjcE
Message-ID: <CACRpkdYX+Hz+LPvSq4vO2Y_JtruokSui-+CvB8dGua0p+FL9Qw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
To: Conor Dooley <conor@kernel.org>
Cc: Gary Yang <gary.yang@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_121732_895770_03D14E85 
X-CRM114-Status: GOOD (  13.32  )
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

On Tue, Oct 14, 2025 at 7:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:


> > > +          drive-strength:
> > > +            description:
> > > +              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
> > > +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinf=
unc.h.

(side note to Gary: drop the reference to the arch/arm64 etc
sky1-pinfunc.h file,
this is Linux-specific and U-Boot and BSD will be confused)

> Isn't this wrong?
> drive-strength is in mA but you're just shoving register values in here.
> pw-bot: changes-requested

That's right, Gary do you think you can add a mA->strength value
translation table into the driver and let this be configured in mA?

> >       type: object
> >       $ref: /schemas/pinctrl/pinmux-node.yaml
> >       $ref: /schemas/pinctrl/pincfg-node.yaml
> >       additionalProperties: false
> >
> > Something like this, I never get this right before actually testcompili=
ng...
>
> spacemit,k1-pinctrl has a node of this type, that can be copied from
> Gary. Essentially, you need an allOf: for the two references.

Neat, thanks Conor!

Yours,
Linus Walleij

