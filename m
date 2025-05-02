Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D488CC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 12:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rgNkZ9mACrHBZqehar2nVDjLj65HAeli8fMJrpgfgM=; b=ivAb0hVGsH7iujR86bPt0MyTNy
	ZiAEKNlv9NXUvw/Yewdd0qKCOCxoWrHSH4R/L4nHpLofBWpFWNs+NiaRozshSJ+98RzzytkMavdCj
	eHW8uy4trSfmgZBpvUC6gRAKpgReC34sC8eTwkIwggFO1H1MVSzLEIbN/QE1vWG9LHDfgVoSSMHrR
	zQZ91l03KDcILWKDpnZ/NaMdRp2qEksVZWd2EH0oi51CvQoXCtCnymCHt/OooE0SMrLh6+W0AOcMs
	2MxX9eZdDYGHxicfHd2SnHA44p1+HCteAtdxGeRy3asovj1Wk1bdJ3+g8VqaM/Oe211iB7g2WuZG8
	gvzuwJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApEH-00000001rRL-3twF;
	Fri, 02 May 2025 12:10:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApAh-00000001r1y-281e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 12:07:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so21004255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 05:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746187634; x=1746792434; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rgNkZ9mACrHBZqehar2nVDjLj65HAeli8fMJrpgfgM=;
        b=mwzC1o7TvcVILHg9idRB3ciwJeasCQdbhxqaFh3SuRnOySQK18fS3DAWHhJrDHYwTN
         bmpcr75lx7nZ71M/khBgpNTfhlKfKcKe4+ahmBoDVwXX2ZscAf6wOYkW6HCIyEOTbfdZ
         QGGJ3Gu3LGTbRRJnyyJLvRvq/aWnDN9sIna/5DbTO5/jrCzGIfvwRs0MW3J/EWGRKmeu
         j10FjTpFRCghQphvARvcR+4WKSFrlF3vILW+ru/s0nYBWWkCihNiIE5GpUxw3oziQYL+
         HH7wyka/9nozNBgShsFsytXTFNQ9hcpuvhkRemblRr6kBxKm/I67gKOrEeAAY/NNIaGL
         HzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187634; x=1746792434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rgNkZ9mACrHBZqehar2nVDjLj65HAeli8fMJrpgfgM=;
        b=LEZA05Fuo9g0F5RrRgXvfbICka4DZifJDzMj32ICRwir8CLNT008cuCGdUWBQnlPDN
         ld68Xj9wMeXgLJCvkFK4LhaJl5QlLi4/n3JETTN4CvYAV89g3bbFMzcQwTjcsIM5TgD9
         QB1ERZqNZk6SzVwUIiU+2tvate7F6a364at5Rtzk/Bm9UuxFC3SlMvZTI+WivnjR9pC+
         z+X9y/zz0t5yAf7NJ7PpLoTUu+SGiruoUjiRGkIebnBvbL03GCptbH31PSSqOQ8Syu6L
         0vWBUSF4jeefLxPJ2e/FfGRbsINyIUm2Q2SKolfU5PEODgHfUIlddyJfOxkW/WiCKb/L
         VCNg==
X-Forwarded-Encrypted: i=1; AJvYcCUo69eqlqyKE9yF4ffNK/gGq5HC1nTDYmOj3xW62L/vF94tsidCRNfMMJNWsWTnmfjcUF2Tbka8W4UffgZ7vwya@lists.infradead.org
X-Gm-Message-State: AOJu0YyB/nxUygPTBC+XsOKhl0WYQTUzx+HdCKVcetbWMrlL6Scb6aWg
	LTyyQ8rcY507ojeVtOcj8geTrk4WH/BOdviMYyOUaxDd6GkqtdUp5jTcVyvV45b2LxAdaCkMR/2
	M13TSTun8Ps0TQYBkNw43d27oaMI=
X-Gm-Gg: ASbGncvOeZnPtBDfN45uH8uoV5vNunn3sgsVp70U/USxeujXtFRDTPt81Be3WLAE++v
	lOZInK7rHNFg3I2AvRAPFQMirmk7iH18ba4GMxCGnXS7PD+MIXYw9V+4mKh5vTaktM1Jyxu0+nE
	3gXSQYexX8DqNXTiWjNoHsM2I=
X-Google-Smtp-Source: AGHT+IG7KvwtY+fAyvBOxFwEDzVqGI1LaVcoOaUFi107MbB8iN6ojKgoX5BnPbLTFowGo/R5psaH03J7RqO1MUbSm+0=
X-Received: by 2002:a05:6000:2289:b0:39e:cbca:74cf with SMTP id
 ffacd0b85a97d-3a09815877bmr2287432f8f.6.1746187633746; Fri, 02 May 2025
 05:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
In-Reply-To: <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 13:06:47 +0100
X-Gm-Features: ATxdqUHUbZrCuHG6LsgfD0KsnguPDclXPpaPdX70W3hLnuLJ0SMY1WBzujOGSiM
Message-ID: <CA+V-a8unYCmhvcOhz19WbN_OH5BctPLhGH5ofZeMzSk_r9CsfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clocksource/drivers/renesas-ostm: Enable OSTM reprobe
 for RZ/V2N SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_050715_542701_2606D492 
X-CRM114-Status: GOOD (  20.12  )
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

Thank you for the review.

On Fri, May 2, 2025 at 1:02=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 1 May 2025 at 14:37, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add CONFIG_ARCH_R9A09G056 to the probe condition in renesas-ostm.c so t=
hat
> > the OSTM platform driver can reprobe for the RZ/V2N (R9A09G056) SoC. Li=
ke
> > RZ/G2L and RZ/V2H(P), the RZ/V2N contains the Generic Timer Module (OST=
M)
> > which requires its reset to be deasserted before any register access.
> > Enabling the platform_device probe path ensures the driver defers until
> > resets are available.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/drivers/clocksource/renesas-ostm.c
> > +++ b/drivers/clocksource/renesas-ostm.c
> > @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
> >
> >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> >
> > -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> > +#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057) || de=
fined(CONFIG_ARCH_R9A09G056)
>
> What about simplifying this to a check for CONFIG_ARM64?
> The only SoCs which don't want this are RZ/A1 and RZ/A2, because they
> are Cortex-A9 and thus do not have the architectured timer, which is
> mandatory on ARM64.
>
Agreed I will simplify this to CONFIG_ARM64.

Cheers,
Prabhakar

