Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D03DCCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRtPdzI1Yw78zykFlB0XCziKqeVOXzigJtW+jsiVzcI=; b=Ff5bueEB/01/aox0uOyzzTqhRz
	aLGOrUQlKalK28V6J0sMMFlinNJg68pDLSMbkaoLSfEYyV7l06Swn/GIQkpQ/8YLw0w1xR4vOnMGJ
	as/1onnIf4H7CJLqOD3FIaIwzkDx41pkS5QsuS3Hgw7lSojWYOHrKgtqskMaECz2zXfk2TfMWpfYl
	zQrmaqxhFW8R5yTtFC2gAaSh0BPuosIzKoOGKfe8qNEIF0dbcVJ92ccAqp4gdzIMVLgHp3RPH2kZ6
	VJ8Ep6flIkeLEQOA7WIdToP3jjAE1XWQZa7M04AxZFyb+ISMXry6lMq1PSfetwH1rJWeCcSJyyPdm
	oImxiSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOFg-0000000564K-0T8r;
	Mon, 10 Nov 2025 09:31:56 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOFd-0000000563v-3TIW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:31:54 +0000
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93518a78d0aso1553295241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762767112; x=1763371912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRtPdzI1Yw78zykFlB0XCziKqeVOXzigJtW+jsiVzcI=;
        b=V84CfHnm4uNzGa9a9oDTlgm2z+ZfeydK9GK9V4WsKCZlcwAEubNexg8ESZ+bklfFrO
         HgjLShfll8PWWTyD87TIdyC1mfW6K2OFBGK0gB0WETpjel/9I8dWE2Z5JRbdzV1cZF8r
         6D+hRc04+GPIsJXTf2zOTw8ohx2qIOWVjB3xbYNpTvGGY4+UsMjHjamkXfReGmuQavMo
         HCCXHgnx5kNvPrjYj/VXOoHgEi/8YQR78DWCbGw09nxyFingSPjILaUpCMyw7o8lvMBG
         18sHcPZLqYiv3TJD/WVLZJtl19P5SiqF+sF1rsICmLK2bRbCUO5qCACzYcNS4O2fqGv+
         qGQA==
X-Forwarded-Encrypted: i=1; AJvYcCWIXjF2NmYcQfTRs1WCuh+bZtN561C7mBX9JTII0fNJNaSqruinEqApOdcWCCUhk5ff6Rl2tNGDOD4Zg/eQ9t8m@lists.infradead.org
X-Gm-Message-State: AOJu0YxiKSi7j8Jb2YcDb4dhornYbwKukfcosVlW7PGOeil2RcaL6dao
	Q9TSnBmoWY63UjX0x+y3ZUtajL0XS41g1eflz0HXK+ppgK+uzqhDLeEM+RjbaVnS
X-Gm-Gg: ASbGncunWWuiW/8E6r5YN6aXAUbh8sPDAMuLR9AOZbaL+JjI++rGBU8RoQQdqONmwYA
	gxz1aaiJ7C3exvjNdOZS39WJiSR1OQIdDzL4/VTyszYy0DYE09k9iTK0n3+DWer/y5wCaXz8Rx7
	MAPu7h+1Haf2qzZqY2awRBRDCpXd77KKlHE/aUpB2dFxm9UABMkCpgM5P1EKzl/Vz/deSYSCbS6
	ER6ecnpHDi+pKHXDrGW1Ye+AORF2t59vuWxBGsRr9lC/E9lvHYBHX4QRQ+ScOLrDP82fM5J22m+
	cctDCUQaGXMEm9wsFAPo1uDuFRbqt1opfmaqKlaf8K39DLVtSiH8FmvusobgLsC3e4a0Xypma7a
	t2vlxo69fzgbel7Kb/dUTzyYGKQgGvdgUIqHzv2Cb+dNGKYZt8GV7kgmsVEp0FD2mR21nYngm2I
	Ami5q9949mKDTGn6WtDY8CuLpCHm/9zxZBAZ16er4P9456BPMeWKU2
X-Google-Smtp-Source: AGHT+IFkkJswJX/oVCk19IyTLdiijuF26N3ubhykX45Fnvec5WioXlDlt8BoyOH+eKYgAlHegqH/uw==
X-Received: by 2002:a05:6102:d8c:b0:5db:1e80:7813 with SMTP id ada2fe7eead31-5ddc47ee37cmr2341789137.43.1762767112089;
        Mon, 10 Nov 2025 01:31:52 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda1a6915fsm5788832137.0.2025.11.10.01.31.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:31:50 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ddaff87c82so2233270137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:31:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTV4LLhaSaXevC+ZaGhL+Q2EvXUFEanipSqkJerUGjVMe8hocFw4hNF+TmV1S8FrrjMyA1KLrwOSfckfTEZT14@lists.infradead.org
X-Received: by 2002:a05:6102:c04:b0:520:dbc0:6ac4 with SMTP id
 ada2fe7eead31-5ddc46497a0mr2779273137.2.1762767109934; Mon, 10 Nov 2025
 01:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org>
 <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
 <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com> <12779401.O9o76ZdvQC@jeanmichel-ms7b89>
In-Reply-To: <12779401.O9o76ZdvQC@jeanmichel-ms7b89>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 10:31:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW26uKBUnYB5c3XAzKPKFVGNoOOwra_u_NOjPCV20Y-AA@mail.gmail.com>
X-Gm-Features: AWmQ_blSVM0mC21k2j7-_pQqo1T8ZhoFgD5EPrlyILfYI73Lumvke_itdhGi4eY
Message-ID: <CAMuHMdW26uKBUnYB5c3XAzKPKFVGNoOOwra_u_NOjPCV20Y-AA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: coldfire: Add RNG support for MCF54418
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_013153_892874_F06EAE5A 
X-CRM114-Status: GOOD (  26.20  )
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

Hi Jean-Michel,

On Mon, 10 Nov 2025 at 09:34, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Le lundi 10 novembre 2025, 09:15:11 heure normale d=E2=80=99Europe centra=
le Geert
> Uytterhoeven a =C3=A9crit :
> > On Fri, 7 Nov 2025 at 11:29, Jean-Michel Hautbois
> > <jeanmichel.hautbois@yoseli.org> wrote:
> > > Add platform device support for the MCF54418 RNGB hardware with clock
> > > enabled at platform initialization.
> > >
> > > The imx-rngc driver now uses devm_clk_get_optional() to support both
> > > Coldfire (always-on clock) and i.MX platforms (managed clock).
> > >
> > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/char/hw_random/Kconfig
> > > +++ b/drivers/char/hw_random/Kconfig
> > > @@ -270,12 +270,13 @@ config HW_RANDOM_MXC_RNGA
> > >
> > >  config HW_RANDOM_IMX_RNGC
> > >
> > >         tristate "Freescale i.MX RNGC Random Number Generator"
> > >         depends on HAS_IOMEM
> > >
> > > -       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6=
UL ||
> > > COMPILE_TEST +       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SL=
L ||
> > > SOC_IMX6UL || M5441x || COMPILE_TEST
> > Is the same RNG present in other Coldfire SoCs?
>
> According to the RM, it is only present in MCF54416 and MCF54418.

I guess that is sufficient to make it depend on COLDFIRE?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

