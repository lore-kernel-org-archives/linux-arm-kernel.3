Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05200C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=; b=qasTB5kDk7cQvMD+v/JvyOMGmA
	JEJ7Smrwsq/HflQx/Oe7m3PYMQO/ufjTnXbZrrEVnlKNaTnr+H9AmYjYbYXG203sfscO8RUHHxIFG
	Xy4dSt3FWY/YJO8JvacigU72dU3C1qg9Tk/gKhp1faWY6woj28hO/f0XsBfog6mSOGJsilbhnVgEW
	Gn9gaWVXtULj2Y2J2Fl8V9tRw6bmw98LnKP+jzLVZSyPCk52Bo0CVd8d3GM3JGExDDGAq5fiFgOUg
	SlxWm7KmoMN3bgcZSWvErAgm/tziFnNB0Z/QhTz74cGnSyfDwb6Kyd8Yrnl263G2flAfq3npOmHFo
	e1uuHl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOg3Q-00000004lyd-00v0;
	Mon, 09 Jun 2025 17:13:00 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOem2-00000004Zxn-0OvP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:50:59 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-60402c94319so2779504eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 08:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749484256; x=1750089056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=NiWyJCR3PzG5mBnZ1baCpRGyDl1cHCPo8oLVFJ50KXa2XT6W8p2AGOG04yt/VdYgYP
         a7ljBlVZSvCvYqqC2zfd50P70wMR5wBIwCnTrA9aA7E+fTPdb1JH7muKgyEDl2AKXqmc
         Uy9eBgqqZ6Nf0Woxis2swM2uc/7nKnLl/Jl4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484256; x=1750089056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=PdaI0kjU1194AwHW3ErsJo+c/vnBWm8tIkn7j4VmTM+9X8LaizdjtBlrjeBJbq5D0/
         4oRz9l9j/IzkxvckCw8wzH5XBfktc1fl6AkiyhtUkK/NCfO1diub7+XfwJ36tumJTIbi
         DwC9I/WsUsyczpnrUtzTvYLDxzRxE0jIwQKu2Mjm+lA/KD4wnA5tG66EL6veqBenQwIm
         vf2SlQGXyphHjqPu/1SqnWvom1L+5OYIzllttCv0cJ9GTMpvMvNH0n9gDXGc+YErnLsy
         2AOWluJ+l1V+DZmMQke4oAT5K8BIsy5Me3sd0JhYvj1ve+8N7U9l0xkmEWliOaGJ3f0a
         8ikg==
X-Forwarded-Encrypted: i=1; AJvYcCXBTjutZaYiIOXSQnwsL5IOLEP0OFcF5a8pXv68fxOwE5c7uMR0vs40vIuNPsgrKG26BN9IMnZ6Gjm2Rly9oHoG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz0vbW9uAHH63dkduFLHJcsaK11GPivwqm1a22Cyy1nFIe7WnZ
	xK/N3X4GrY8No2yfw0Kb080mHoojca80snMDIx1qdPYW61ozelFGRKmlUvdgeNYQ4TIjjto4LbE
	hCpA=
X-Gm-Gg: ASbGncuYQYsHBPSblM3F/1T8lX4xqBsMkRQPRKfazIFbtNDGNw4B848N1OkwChTD1GP
	r2N3myMUHNWcnQZs5gUmkArbcT9UEUYqFDw16UCE1pQFY0mmtl9z4djxars0nnE9EGeLVSJBrSf
	OXdbwSAx7k2q5y0SRHmjPkC4rUnEPfX3x/d6aHoNpMm8rP5LzHdo7ImQDSkCmUhk89SVDOVY+Xs
	g3pDNU4AAPJWHMgLCyGRXF/LnkJLAfpiivsz8hVlirAwlWxX40nZ4CZAHuLlTevbMRlVS8EQ2Fs
	4SD6o/jVucnjAtrNhevJUpgsDSJy3fBugTpzFBpQX9JGPjY2ZurvGIdFTqqUOYcuS2utljK2SgB
	8VgosV4OS0nM60EIEvjE=
X-Google-Smtp-Source: AGHT+IHcew43P6vWrrJEdeumaM/fQiZGg1NSWjGquzTyGrRghXVi6/JAIEwGwXWcgz6+gZ3TGzgmIw==
X-Received: by 2002:a05:6870:5147:b0:2d5:2955:aa6b with SMTP id 586e51a60fabf-2ea007cdf93mr8674793fac.5.1749484255975;
        Mon, 09 Jun 2025 08:50:55 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea70259b52sm120997fac.43.2025.06.09.08.50.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:50:55 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4066a0d0256so2937403b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 08:50:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXofTTQozNzwRhjWJ27u/RkTrMYtMUkaXL5KzQqNoSOLtnT+jBLm9WV2FOA4UoeX2suWGUExIE2GlGLy2SsCdq8@lists.infradead.org
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-313472d3204mr17932741a91.1.1749483806734; Mon, 09 Jun 2025
 08:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com> <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 08:43:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
X-Gm-Features: AX0GCFvkFbIIK7ULGaQhmTqdCQ0r1uM5Yw-QxUNG98qVpJtj4RBGOmfISaSOf8g
Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_085058_127894_D1A74D7B 
X-CRM114-Status: GOOD (  24.85  )
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

Hi,

On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:
>
> > Hi,
> >
> > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibr=
e.com> wrote:
> >>
> >> The auxiliary device creation of this driver is simple enough to
> >> use the available auxiliary device creation helper.
> >>
> >> Use it and remove some boilerplate code.
> >>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++---------------------=
---------
> >>  1 file changed, 7 insertions(+), 42 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll snooze this for a bunch of weeks and check back to see if this
> > can be landed in drm-misc-next every once in a while. If you notice
> > that drm-misc-next has the necessary patches before I do then feel
> > free to poke me and I'll commit it.
>
> Hi Doug,
>
> FYI, this is safe to take with v6.16-rc1.
> Please let know in case you prefer a resend.

Thanks for the reminder. Unfortunately, I still need to wait. This
patch will need to land through drm-misc-next and that doesn't have
v6.16-rc1 yet.

https://cgit.freedesktop.org/drm/drm-misc/

...presumably v6.16-rc1 will get merged in before too much longer.
I'll try to keep an eye on it.

-Doug

