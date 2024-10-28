Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEF3D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7sEAvP8NG9JnAXi5TH/KAqfu5gH9AuYe39avRf1R9I=; b=uTe3Ydye9s243y/Qxrg0mFKx+S
	V7Zdch7L2BXWvQxc0kfYxKTIFgiqhx0mDItjR9IYrMdG/h7y/N1uCspb8nfouQLBIa7bWtArPLnbi
	Dii+WoTpf/n2Jfcg6U1y81DgzezUSzSyNKgVJ7J9UQ0j9yFvf6sCYOx6LiR50tAbd8eX+OFOk5FZJ
	iTt8otNC6DHO/FWg0SKMbpjHLtMs0RNUV7EX0POferVlAKJR35HysHCV69K8HrPKLYeA7jEr3LwoE
	mXj0QOEGnTr2FnYxiIaFqp1m2x0xTux3AFPa+vrZ56rLpp1rylFOGvFWMDSSqo9LYBddwKYRqrDO8
	Zjc8QZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lru-0000000ACTZ-207u;
	Mon, 28 Oct 2024 09:16:58 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5LpD-0000000AC9Z-3ILF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:14:13 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539d9fffea1so3762791e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730106850; x=1730711650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7sEAvP8NG9JnAXi5TH/KAqfu5gH9AuYe39avRf1R9I=;
        b=OFXGyFzB3liN2IqTMXmofHCQ+rPSuzZIGwoyUMkgKPmNUIKtdnhWLhZLQTGa7BySJV
         wIxfj5jJXUM5KXvb1lFP0uM3MS0QpH4+OpEOxOJ/hVhMV7lgFE4tGOOIhqXeIgGI5N0x
         +lXBUeE1TY3Yr7po4UvaYxp69YcYTjH4CjXi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730106850; x=1730711650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7sEAvP8NG9JnAXi5TH/KAqfu5gH9AuYe39avRf1R9I=;
        b=O4tY9BlI9BuTCALsUCphIYgfdj8BJh2QP7Ra7ZuK/9ccecBB36P6Z07ES8v7V+hY3D
         2IKcYo5qMvpiPuNoKm8OptBuznanXKoNBlzo4s38b//YGjTH5/9VGYDMFMrGe4b3Yldd
         Rl4mcy7+Zt6bhMxL/2vJhOT5QKpSbyPojUIaHC4bdd5dKWWHmxUCftvWFD6/9JHTx+08
         u0d6J7Eot9SKBr8TT/gQnrVT8T/P9CxgJ/jQjsYgyo6jIOrhL54ivHeg4Z5GepV1lVVE
         2clxfSxGhLG57228RzmdaXD6gajtS4hQDTqzUHALC34yZLaUCTf6nkMVnv2doBNTuhWW
         Q4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm6T1uRk0r9GTP5tyNJ55xw6g06Q3vJzZlNYfDTOXboI5Bu/o+pSreiMC8OG+kFzwD3zibj5G4XYM+EWzjTV+G@lists.infradead.org
X-Gm-Message-State: AOJu0YxhnfzxIQPCsCexSs1XX1SO4n4EK2X4hyt0LiXyCHBnKepKueVE
	a3icalVZdw+c9n3A0s2vQDzUsLCF/AF25c4Qj5fTeLIyduRTzPaKoTqOYbq5BPbksp9EEqSqJRZ
	AW85f7iDLDXZuJAtXDDAfGKqryzYYMNG9gH3JDlEburFtAtc=
X-Google-Smtp-Source: AGHT+IFPHFbPyPXoPFbsVwjDIUW/0WQx3PxGtpf1eVaSW6Z7Z3fXH3i+SJTqnAp2zN1OASRPnjVQ7nAeuz6Vm9QIUx0=
X-Received: by 2002:a05:6512:1188:b0:539:fc26:74bd with SMTP id
 2adb3069b0e04-53b3490ee7dmr2587366e87.27.1730106849694; Mon, 28 Oct 2024
 02:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-8-wenst@chromium.org>
 <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
In-Reply-To: <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Oct 2024 17:13:58 +0800
Message-ID: <CAGXv+5H8kxrr=JJsMMY5Y+HC5JqMN-bMkm7hztOzQgrbew6-rw@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_021411_923342_E0E05447 
X-CRM114-Status: GOOD (  29.48  )
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

On Fri, Oct 18, 2024 at 5:16=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Oct 17, 2024 at 2:42=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > Instead of having them all available, mark them all as "fail-needs-prob=
e"
> > and have the implementation try to probe which one is present.
> >
> > Also remove the shared resource workaround by moving the pinctrl entry
> > for the trackpad interrupt line back into the individual trackpad nodes=
.
>
> It could be worth noting in the description that it's a really bad
> idea to pick this patch if you don't also have the patch
> ("platform/chrome: Introduce device tree hardware prober").

I found that there's a stable tag one can add to reject AUTOSEL.
Sounds like the perfect thing to add here.

> > @@ -35,6 +37,7 @@ touchscreen@40 {
> >                 hid-descr-addr =3D <0x0001>;
> >                 interrupt-parent =3D <&pio>;
> >                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
> > +               status =3D "fail-needs-probe";
>
> It's a little weird that there's no pinctrl definition for the
> touchscreens but there is one for the trackpad, but that predates your
> patch and is unlikely to be a big deal.

To be honest I'm in favor of getting rid of pinctrl settings that
do nothing more than mux in a GPIO, as mentioned in my talk at ELCE.
Such settings are already implied by the interrupts or gpios properties.
The fact that the OS doesn't enforce exclusiveness between the
subsystems is not something the DT should deal with.

> >         };
> >  };
> >
> > @@ -47,6 +50,8 @@ &i2c4 {
> >         trackpad2: trackpad@2c {
> >                 compatible =3D "hid-over-i2c";
> >                 interrupts-extended =3D <&pio 117 IRQ_TYPE_LEVEL_LOW>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&trackpad_irq>;
> >                 reg =3D <0x2c>;
>
> I should have noticed before, but officially the order above is
> slightly off. According to:
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
> The "reg" property should be higher (right after compatible). It's not
> a new problem with your patch but since you're inserting a new
> property you might as well match the new dts style.

The entry in mt8173-elm.dtsi is also in the wrong order. I think I'll
do a patch later on to just fix it up if it's a major eyesore.

Angelo what do you think?

> In any case, nothing is a huge deal.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
ChenYu

