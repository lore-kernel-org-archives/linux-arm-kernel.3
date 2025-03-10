Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE0EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ND2kqJOrUJ4yzGsa9gnO+yqtj6hclSewbFNs2ty9z4=; b=4lk/GbGiPSeZQYdDLataXyndRM
	gtPGNUdrw9iaky0XqCq0Un/mOMCVU9ZPTO9Mkh+0L0sIyiwLpSBFzS3lfurlUVkHHEbSTEyJR9Q7h
	XynV4EwX1nC5MiwvTk3ohLbh8BMCp8EenFKTzmNaMsG76mnxUdGSCgmzO3mXcAOsv6EBA0KzwNBym
	ZpVOEKu4Q9BrcHsYABQAaS823ElLWONnEOZ+vacQmiHb2j5GlM4Z1s8NpQsu7TU6Ns/0vz/UY1sP0
	TDFsuzwwsCr19o1xW+tkQ+tjCzBGMeHE2SloW2WwMl+U5Hao6mfj9fHvX7UGtA2azq8Bm4YDdTDUE
	OvHADKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcVR-00000002fhN-3EJa;
	Mon, 10 Mar 2025 12:45:17 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcBP-00000002bGd-0PMZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:24:36 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e53a91756e5so3190928276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 05:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741609473; x=1742214273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ND2kqJOrUJ4yzGsa9gnO+yqtj6hclSewbFNs2ty9z4=;
        b=qtByWyDgHzhooYgBY1IFY7uYFhJ2wXnIi8e1ggN11dLGfj+g9gsqI9YLgyMBym0CAn
         yCL9EJT75hCiFUmxrp8a9rGRatAp80rV9JZJ0ot3m1eGAfRaufYMrfxUOhYC+ciHC+Tm
         bXkvF4Mgnw8ONDSyudOHU3ORpH8E1k5sWqJ5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741609473; x=1742214273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ND2kqJOrUJ4yzGsa9gnO+yqtj6hclSewbFNs2ty9z4=;
        b=AA4zdG8TQwnCIvwoUzc2RISLoSzhAdgMt2eY9werIWieeFZk4rouxNTUzq533s+cTH
         i7l7257AMTH574aO4p4n5bDsBsQpHHrJ0qko0ZY07KgEZIdE8cMACVvkfMd+C3N0QT7o
         ZIX/cFJ/AiQLfBcPa0ENJMS7jd4CzHDVBZ4r13uo/MrOvsWOGQJ5p3qZqsczJ66RolCl
         Iwf8VcY2Vuz9lBlFftCauKmMk50qSvjBOz0phZbpPMY5LRSLwan+LRNSwtA+3d/YZWW9
         ix096XNBlPXwccsYzwx1xRaZz/7udPSyPtbyvQ6yI/7UwyZaV6X0Bz8onJtdLx2POgbT
         V9tw==
X-Forwarded-Encrypted: i=1; AJvYcCXMLAHvuAPT6mtXN9Yzgr6tei9j+2gbISoVBkWNv259ImlJLG+amNXxwlW9SHf69nr/kldNCna688Xx2L6iwxN/@lists.infradead.org
X-Gm-Message-State: AOJu0YymybclpLTAUpNZLqQANxZwa54EYJJKLOLMpFw2Tx3SUdOQOXju
	cI4rrl54/tFYhp1i/t7J9axnqDGFsYZ2zXMTRZTyIArVqnTkyAR/BULy8YDTIYATaEDyUuhINNK
	374VEhhMKHOQ7982IgsL9FEoMPz6+3udlK3lZAw==
X-Gm-Gg: ASbGncseYDB4StYtr3uzFc2JY9fIAbQGMkJeQ4boZqgcpjTENuos1P8UHGYKT9QQZ9c
	QYPTdF33yPeClz3T5hI4zCuSji1gpLW+wlrgn2kLu6GGIM6ZgtfAcdHsfzuxo1Du5ufQPV7AGTB
	w55gIl5qpW7RHTuK1YsvDULM2meE8M
X-Google-Smtp-Source: AGHT+IH0tHXGp9UeHGxfrLbUzZnkh/DxT1q5vNyoFPhPKc+dkvw3h1KG8wG9Fqv0xSyH4YITslHYsvlvq709Vj41Cn4=
X-Received: by 2002:a05:6902:3388:b0:e5d:bcc5:c33a with SMTP id
 3f1490d57ef6-e635c1dbebdmr14201756276.43.1741609472105; Mon, 10 Mar 2025
 05:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250301115116.2862353-1-dario.binacchi@amarulasolutions.com> <e5a5dd9b-475b-4c66-a580-08f11a80e5a3@foss.st.com>
In-Reply-To: <e5a5dd9b-475b-4c66-a580-08f11a80e5a3@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 10 Mar 2025 13:24:18 +0100
X-Gm-Features: AQ5f1Jpjge_vQvtcg2fYtLcCxKDZuRZi6uFbkDzRqCoH-Q0HlGPggWhyZjwoZak
Message-ID: <CABGWkvpM+MbC=W1Z2yVnQiCXznVKXXv6ijn0dw8AGup8Wuyh0Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: stm32: use IRQ_TYPE_EDGE_FALLING on stm32mp157c-dk2
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052435_132866_29B472D7 
X-CRM114-Status: GOOD (  17.77  )
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

Hi Alexandre,

On Mon, Mar 10, 2025 at 11:50=E2=80=AFAM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dario
>
> On 3/1/25 12:51, Dario Binacchi wrote:
> > Replace the number 2 with the appropriate numerical constant defined in
> > dt-bindings/interrupt-controller/irq.h.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> >   arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/d=
ts/st/stm32mp157c-dk2.dts
> > index 5f9c0160a9c4..dcf17c493022 100644
> > --- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> > +++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> > @@ -11,6 +11,7 @@
> >   #include "stm32mp15-pinctrl.dtsi"
> >   #include "stm32mp15xxac-pinctrl.dtsi"
> >   #include "stm32mp15xx-dkx.dtsi"
> > +#include <dt-bindings/interrupt-controller/irq.h>
>
> really needed ? as it comes also with
> dt-bindings/interrupt-controller/arm-gic.h

yes, you are right:
         stm32mp157c-dk2.dts
         --> stm32mp157.dtsi
               --> stm32mp153.dtsi
                     --> stm32mp151.dtsi
                           #include <dt-bindings/interrupt-controller/arm-g=
ic.h>

I'll submit v2.

Thanks and regards
Dario
>
> >   / {
> >       model =3D "STMicroelectronics STM32MP157C-DK2 Discovery Board";
> > @@ -67,7 +68,7 @@ &i2c1 {
> >       touchscreen@38 {
> >               compatible =3D "focaltech,ft6236";
> >               reg =3D <0x38>;
> > -             interrupts =3D <2 2>;
> > +             interrupts =3D <2 IRQ_TYPE_EDGE_FALLING>;
> >               interrupt-parent =3D <&gpiof>;
> >               touchscreen-size-x =3D <480>;
> >               touchscreen-size-y =3D <800>;



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

