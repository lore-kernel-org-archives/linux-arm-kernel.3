Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F8FD2D105
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYgsGgBKZshEd3LQPmk39JcNw7m/fhIkjkE+xKR+bec=; b=KVwho7Uy56r7BJuXd88GlJ0Urm
	CcNZtrob2oOA+ncl4xxVygGuy9CHm6HeII8Sh3wWxCZmdihzUi7bxdkMRTEeKLAQEPn4KaWBnnp3t
	SmpQs3b56ovCili0SLjI6Btt8hQYYP+9O0NYIOVknPNoSbGDX37B9ElRZTZYhz/AkVPqt4xmQUR4K
	iMzMwhEDdvSWugmbwqcxcJSPku/rd4Vy4Ng7ypGigeV/J9BR5i9n1wVxC24hA628yIQNAdJMOpBGX
	RccxzVTBlMiJ2SfGLZzlTaMtPxnG1zroZIzD3L/NwFzoiYWdzUu/Yv3ZqLexZK8VTEs07wP6/99yA
	g9Fazy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfetw-00000007Bhy-2zqQ;
	Tue, 13 Jan 2026 13:57:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfetu-00000007BhC-2SDg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 13:57:39 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso15919410a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 05:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768312655; x=1768917455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYgsGgBKZshEd3LQPmk39JcNw7m/fhIkjkE+xKR+bec=;
        b=zDVe0mnFYN2EOI74NOXJzHULi83DV4RUd8/koGErEUedYeh7IYtVxpB6k16qxwKn0d
         aYUVWxIaz9IvqHl6epQBjWN/NMmW9v10pJIbtMrBxolgP+TgrwqivUbuCUFtjHEIG6Ex
         iEWrIXjlyWiIdyBWk1z5eoaqFYhLzVQA1i1qLkaUCjUDFM/fuaBLH2eQacGxcMiWfKHm
         YK6ptf8ZaaDt8dDOQuJ1E4DsJAMGiTF3qCNSogAIPQMarOvAKgs0oF6pro8R+625IqyK
         AXYAKgkcb0Tr5X2yzY/MIG5t35l5D+a5ZB4uJkT7ysTLras1gTSpcwFTf0dx9tk59Zsl
         5J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312655; x=1768917455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZYgsGgBKZshEd3LQPmk39JcNw7m/fhIkjkE+xKR+bec=;
        b=aEwtILcPMM+PYAmAbnnfyiOEzIvIugMX2smPy8527UrVABE05us0jPtsY0Y+A2E9iP
         f3ljV+34pBRHrdGTeZop3bbY6CIpbcVl5qoGOFl7vIYkTrVdtOkZcbFLmR27A/NfHuDm
         UvvRSBhwu17DC6qxRNoxXrt2Y9SiTqteU/BBoRPlJw9mL4wyynErAAVYTHD8X1WfpUC+
         DT+U+TcYJwUShBSzVU6gTiAzTjUlXgoh0z2eMyVBGc04su+sbEn0yMsT0nGC/pHG8tyf
         igTlRoa7tXPaLM3SBsBYQGoTbXufPNgO2Q6ww8DTWMfyuOv/3QtkIAreLQCXbGhQZO8D
         YLWA==
X-Forwarded-Encrypted: i=1; AJvYcCWgjGKyyx8/FlykcEZy8RWxZJrM/6PXTohT7mQJJJpPe+fbmEbdonjCeV3RmVWhfLJZypSlLFFIVN9Q8Tf0pupW@lists.infradead.org
X-Gm-Message-State: AOJu0YzgK/ObqL7RcixTxcXJvBBzDiTSONUnczcj8ZVA35+fQvxgvx95
	pBHDJHSS6J5iCxIZErWuiSomfT7YHfplOwzix27MZ4kb4QTWGLu5aozuqc91ZTaoQBaF9fJHbcY
	0Qlt71BoMMvHcGKRB0GlMGTCYogDIKd47XboBAbLyMw==
X-Gm-Gg: AY/fxX4gCh6vtXD+hMpdXbddvnDaIzkF8kurFmyKn11bOCmQkKw4JE4yVsRkwlrng4Z
	p9/xOndiXx1tJd3UhZrdl8mV8+8aj6zWPzt4pA5kgPSL/yujsNOcTikprHcxGLiJ235ZTbr3BBo
	ZYjqTiqUrcjSBr9qGYSmvLcyy1CXBuzMzWhfl4V6M8ljhphmKTWnAh20oH0rT8WY4xqba2GPHCR
	W3l457TyLE6GfTRY5M2FwhvdJ9DkCXTFn/r8p/9eQE34TXj1Bx10pTV7w2gy2L2H7hVTYXpoxGF
	kFN6cP0VRxwGMRcQCItycF6zbbelJRMxv8edE9EjWO1OWEp5SQ==
X-Google-Smtp-Source: AGHT+IHC69qajNN2R0Oc5VosMApQk8dB2K8/wIPuNuXO4ULHt0+4HajErsuy6Dkjt1+pDa9ixvBw3NRLu/Pa+AU8sC0=
X-Received: by 2002:a05:6402:1e8c:b0:640:e75a:f95d with SMTP id
 4fb4d7f45d1cf-65097dfbd5bmr20646641a12.15.1768312655296; Tue, 13 Jan 2026
 05:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-13-robert.marko@sartura.hr> <2cdac084-4924-4ca2-85d6-2e6d9bf284aa@tuxon.dev>
In-Reply-To: <2cdac084-4924-4ca2-85d6-2e6d9bf284aa@tuxon.dev>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 13 Jan 2026 14:57:24 +0100
X-Gm-Features: AZwV_Qh0sAc6Pa2O_93Ow3lA3FmFDgK6_SoYiCOhp74HuwfyLgAjJuCjbp6xbBo
Message-ID: <CA+HBbNH4q8o-4Jb=hu7JgE4emxFxktFSLHdfY4J6gCDbYTpWUA@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] arm64: dts: microchip: add LAN969x clock header file
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.org, lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_055738_647382_A05F9532 
X-CRM114-Status: GOOD (  17.86  )
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

On Sun, Jan 11, 2026 at 3:42=E2=80=AFPM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
>
>
> On 12/29/25 20:37, Robert Marko wrote:
> > LAN969x uses hardware clock indexes, so document theses in a header to =
make
> > them humanly readable.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v4:
> > * Move clock indexes from dt-bindings to a DTS header
> >
> > Changes in v2:
> > * Rename file to microchip,lan9691.h
> >
> >   arch/arm64/boot/dts/microchip/clk-lan9691.h | 24 ++++++++++++++++++++=
+
> >   1 file changed, 24 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
> >
> > diff --git a/arch/arm64/boot/dts/microchip/clk-lan9691.h b/arch/arm64/b=
oot/dts/microchip/clk-lan9691.h
> > new file mode 100644
> > index 000000000000..f0006a603747
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/microchip/clk-lan9691.h
> > @@ -0,0 +1,24 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>
> Shouldn't this use the same license as the dtsi including it?

Yes, its a mistake on my side, will fix it in v5.

Regards,
Robert
>
> > +
> > +#ifndef _DTS_CLK_LAN9691_H
> > +#define _DTS_CLK_LAN9691_H
> > +
> > +#define GCK_ID_QSPI0         0
> > +#define GCK_ID_QSPI2         1
> > +#define GCK_ID_SDMMC0                2
> > +#define GCK_ID_SDMMC1                3
> > +#define GCK_ID_MCAN0         4
> > +#define GCK_ID_MCAN1         5
> > +#define GCK_ID_FLEXCOM0              6
> > +#define GCK_ID_FLEXCOM1              7
> > +#define GCK_ID_FLEXCOM2              8
> > +#define GCK_ID_FLEXCOM3              9
> > +#define GCK_ID_TIMER         10
> > +#define GCK_ID_USB_REFCLK    11
> > +
> > +/* Gate clocks */
> > +#define GCK_GATE_USB_DRD     12
> > +#define GCK_GATE_MCRAMC              13
> > +#define GCK_GATE_HMATRIX     14
> > +
> > +#endif
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

