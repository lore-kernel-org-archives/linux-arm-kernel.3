Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1538C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggn4Te8iAQAPapgsDrGJ7UYxvxj7+JoOGyy8tQVU2ws=; b=gfx6Wptd7t0AJ7YWcG+CbVWqDi
	5+pmJDcbQQmQoLM05k+0P1A1gfpHh3YlJxs4rojt/92cq5ZBB324qG39an5EmaN23KWp4vT4U5LT4
	7j7uCZXbJ3ZLIs78I2/ub0N/4zdHKIU3GBCvZ/KGSEffYXPAayXffvXNsWh3pUvtHCEl2g5/NMoET
	u8qEaAJrbH7527CXsxAUgrUPiivvVZe6U3OK/iRZVVttMz7X9q7Qo3Sdtxv/dB3lCgLKiShPCzPLC
	nKTb3n3+CKJCCRzV3BJGv7ZjhpfTmOyg20I4BXdxm7cy8j0ZjRkvvayykB4ei32shFA8B1IcQSUUU
	Do5TB7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAszs-00000002SlM-3DiA;
	Fri, 02 May 2025 16:12:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsxv-00000002SLQ-07Ew
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:10:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39efc1365e4so963868f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746202217; x=1746807017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggn4Te8iAQAPapgsDrGJ7UYxvxj7+JoOGyy8tQVU2ws=;
        b=msOoLPtOm0K4j1H43ZiAaG4vJYVpwYB+P7vPX83efV1PLqACDWM0CVYdCCP3Y2Y6B2
         rt8/g+4IONiTixZd67AGj7E0HiD9QXQnIxvnPBijMmCQRWoggaTOzhq5Oi1xm6F4mUsk
         YwEYDw5jkHt3UAfVCs/fjK4vstyzQf1i7tjoKzfenCqrya9oEigyTWtuH76Xh3mvqQHA
         oJhxQCb3zMgrSzRAhtPPbxN8flughDjmvbmMbasYFqpISGYhh7vdtDqSS+ocF30vDZD/
         RD28IaH14xXB1IoEa4OpzuBypuwgu5YTQvyd5TIWTznF6j5aR6yWfjSHHpy19OW2Ymt4
         RZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202217; x=1746807017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggn4Te8iAQAPapgsDrGJ7UYxvxj7+JoOGyy8tQVU2ws=;
        b=QLqjbluJCkaTH6sEQupZD6ZDgecgvNWRU/pAHqeCNSDwmB3qOVqJW28d3q8IfvZZKH
         F6HVJvOvO2sujG9SxxukxGxCIMyBTAsyF+33yBWaag47Raf9JBUle3hGor5Zu/29I6nx
         fx1/HIKh7P8tCIvutU1Z8/LJdt4/2s8kTFvLinDwZME9y0zHnTyEolBmmGGfYesfDalC
         w4y4W8JhHHxpWusGAA/C58TpqUe5YON4j6JIBaQYvnOJcxucxojFlaDZYfHcvn4Fw3qd
         VFtnHFA/2BWXGOCf9kRIyd9hTyEpiOMyLpkbGyzyiNDSRO51cijGjEzfxfSTaq6eqSUh
         WEcg==
X-Forwarded-Encrypted: i=1; AJvYcCVW3mEPuR5hu70vj+hYxeKRVXS7BdeAjB8eXNZ9v76YVAitzCCaaolomNz6JqvZEHEwqcK24lBhXqQuMrg+Iisa@lists.infradead.org
X-Gm-Message-State: AOJu0YydmOUpnz8n+bd4Rox79qC2hNVjVZ9qQGSHsV8/hAcxbHS7ydeS
	ohmIriDboVztfypA6stnUiNPAaECqqv9vFabuwTxfaJacZXwTQR9j6s3DvWxO/tyjrue3WFWtgM
	L3ZCRn4vmAnj/U2t1YDyWcB2U8XY=
X-Gm-Gg: ASbGncuMMRHeUo41l5fN9gT+rQIfv06Mad5H6kDlIbRFSkCuNZVkX/oUkeT0dvHGxQq
	Wd8PBOjGYSjjp4LCoJd25AGdC89TjpQyfiX5npEnRHwN8BT3GUBw4BqpO8kCWQuMCSmQvTBi/PW
	7+hgsLLqdfJuEvZgPtov3/sF6kq+9k0xZZzsk=
X-Google-Smtp-Source: AGHT+IGVezP+3T30En3pYmcMFWwOdEcdSVzIy5+rzYKoypmb6ZyPfJHRenADSTshAQ6cPwOLymhczd+ONEyDbXDFLLw=
X-Received: by 2002:a05:6000:184e:b0:3a0:9050:cd03 with SMTP id
 ffacd0b85a97d-3a099ae91a2mr2919909f8f.47.1746202217130; Fri, 02 May 2025
 09:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
In-Reply-To: <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 17:09:51 +0100
X-Gm-Features: ATxdqUGhCj9n_7XiK5shDvDJ2filmwcJeQUHGkzDLBKjTowp5A8Gn9P4TEI7_vQ
Message-ID: <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/renesas-ostm: Enable reprobe
 for all ARM64 SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_091019_064440_FE82EE60 
X-CRM114-Status: GOOD (  25.78  )
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

Hi Geert,

On Fri, May 2, 2025 at 3:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 2 May 2025 at 14:47, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Change the OSTM driver's probe condition to `CONFIG_ARM64` so that the
> > platform driver will defer and reprobe on any ARM64 Renesas SoC once it=
s
> > reset controller is available. Previously, only RZ/G2L and RZ/V2H(P)
> > were covered.
> >
> > By matching on `CONFIG_ARM64`, this avoids adding a new config entry
> > for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (ARM32)
> > are unaffected-they still use OSTM but do not define a resets property,
> > so the deferred reprobe mechanism is unnecessary.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Hi Geert,
> > I've restored the Reviewed-by tag from v1 with your suggestions applied=
.
> > I hope you're okay with this.
> > Cheers, Prabhakar
> >
> > v1->v2:
> > - Instead of adding config for new SoC, changed the probe condition to
> >   `CONFIG_ARM64`.
> > - Updated commit message
> > - Added a Reviewed-by tag from Geert.
> > ---
> >  drivers/clocksource/renesas-ostm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/r=
enesas-ostm.c
> > index 3fcbd02b2483..6a5785f9c9c1 100644
> > --- a/drivers/clocksource/renesas-ostm.c
> > +++ b/drivers/clocksource/renesas-ostm.c
> > @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
> >
> >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> >
> > -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> > +#if defined(CONFIG_ARM64)
>
> Sorry, I've just realized RZ/Five also wants this.
>
Ouch, I missed that too.

> "#ifndef CONFIG_ARM"?
>
Im wondering will it harm if we have it enabled for ARM too (I dont
have RZ/Ax to test it)?

Cheers,
Prabhakar

