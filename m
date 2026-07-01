Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9473AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=; b=Rypbd6p11p4OhzdXqepduaBWlq
	HX5TSLev5QTdGC6t08LjBjCq7G7VhTxFayh2AeP6u9mVLR4nu+6osurjsN80+9Wx0i/bd5Av80EWh
	MMgb2BXAub/ZWXDywH79ztXEFN8HY/Qca2Bx42V++dz1ryscDxzjzlfmwQkthEDg5c+Q/kKQLTEbM
	seVi10aJKi5PSLISHk5bDeVInwWkQo1Nppcx0CCUZPC6E79e7OLIJi3vQqjnuRC5+HWZpD5yJpJT2
	Up9Bmy19GrPbW7mITBNilO6cxCue21yR8GPRzbRE68FXiT9gRIcrrW2OeHosnvOfja92n5kP2oKKM
	whVzkFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werlS-00000001GdD-1CqY;
	Wed, 01 Jul 2026 10:01:54 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werlO-00000001Gbw-3cZt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:01:52 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c126f9c9567so57318966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782900107; cv=none;
        d=google.com; s=arc-20260327;
        b=DY9S48nShUN45+DDst/Xg7MDF/wB1694clUA8QQnVUEw7PJOsTL6R32/NhECr6pp8E
         DIAwq8P0W3HdDLuMCTPzggjxI62g6t2OcZ9vXr62EDIum1Lt59/GfTkqlguCflpgCs1U
         sE4XUtRSd0nWHigy3x8vM7BocebxAHPd9leQBkWV8QiOhfe0RyzG9axIMHHviVBmOZuS
         gJdZqjz3KADKlH4RhUnnD2Mhsw/+xEzs8hF7auXhsMKjQZGQhUbILvqF/y/18i0igF0k
         2d+k2U95loRAmALHoZGPWXg4xi+3PM99TSPn3xPrNbvPzf91wuMYsg/Ay8iXzS0yQylr
         LZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
        fh=YKpUyMU8wW1yWuag6steHJY5AmkcbGfASYxR1NiK818=;
        b=JAlBaqOOpxqeq8iUUvajHyLlcyJmixiRHSE2PDXUkJuTiqeU91RuDLCvrm958j4D7/
         0tCXR5oB2XXG07J7EbcLUqif4aIupU8R14fwQHNESpwfyrQMcPRqyw3d+/Niz+W13Y5n
         1qTWE3L2edHZg2rjmpkK1RIcoZQUBueVqICkwHwHSTsaE4NN/LIPuAnKkkZltKOjwdsF
         LEx8QYPWbQsHCt/GXgv6r6kEWLNgbOAN+Quig+HWyfqFsutQ6WgynbiPeX+1ZWE4p1S7
         nJjoolZxufj1HJW+yHDFNRYwxVcPEt4JI12o8volTlZ34+otegFX3edjgXJBLgmW/1mL
         PyQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900107; x=1783504907; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
        b=EbRW/Op/ubTaTj5MLkx+Y9Nd7+KzI1qQNh8k4eF6Z4KrA6YNyeAHAVNyR0cWUtu+PC
         VW/DV5pAqWjF0mbHwb+LrgfYUuN1bzMbUJy81CKtSsy3mNYncr2Qyi/WRNeFLjVOD16r
         yNSMCEFRZ1HSdKkyH52yG4HXAcm4oAyEqdW9MTKkywlIMX5NjGC6adngfgXWaUGl8/u1
         KzhpO7M5hdAW+0HcSqUyZY6sX7Rai9mYki4C7ms6ZXcnveSWz3JpLD/n6ZKQYagsMTtd
         Azeu97sAeU9zvv8AOI8njKHvdua250iXtx4CuzI+GtCtiX14PTVl2wCIP4Yv40rUXv2O
         g9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900107; x=1783504907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
        b=ke4Rf2zf0kVvXHzzoK1x2kpoV845pvivlqbJ2kZ4kH2Rvce2qOA7c6XFBROFKqiZDk
         pioXNDqASOiIbm4KU4otaDbv3YxvQaef4x7GNo1Fl2Bctptf2CF+5hYxRFcqdqfL+YkP
         SE8gcy6Db3roUJypa6cYUf73OGyN2aammhw7rNPmC016CIbov41Xo03+WcVYWcTkGIix
         mBcoI4CpuJeBCGgWZNxItMz97pBxudIlGPQ1+1fRy8XQt3wJBBIeaw/4t1DH6Upb56oA
         QEKMImAtOLJwLoHB/CkPv1HcfxQRz6a7YDX2Ow0xrzy45vOaXa19aKwXYfBd33zeDD9V
         uAJw==
X-Forwarded-Encrypted: i=1; AHgh+RqARP+khHzhj7HJoA36q2/8yIgu37r3bC13JhKUTKNgEIrwG0MZ0VAieAabk8V7d7Qj+82YSg6UYGbt3EjDHtju@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl9G9M12lZa/tclCvVQY9cxzzuGop176W/sU41+vzz10ULIlRw
	6yKlPI3WVPaXyUNECfKojCPHu/exo3bj8EZCJNlZ9qPkbhw4bvW1jhdUGPW3GNMT3uqxdUVukrw
	VqdKNcftxfi+/wgPJXnxvIg0NmXXHVek=
X-Gm-Gg: AfdE7cnbZEHoH9cqyaKo4cgekayFfMi/wVAwGYefyMWqnjIkFTSK2ium4D3Yd1Siz73
	gIn0q7Eph//15OyVqOqNjyD38tMntAownH5lYWIaj4JJzk54q084Xl2vdxV0yR+yp+gs61wOGLK
	3mDWXdhlnmjssJNWC5VAhs7Rc/3AwOBcNSmKT9QE+lfKMIc/O9upHoyPtYcV6HrZYrtcwz71Su/
	td4ePvP9hTTlv0yzg2fC8JCCN5fmFwlurC5MQmMy0FSXJxnPeZnQefHxPR7hz939zbWZTiIybMf
	xUHtLCRLJieYwzMT9XzXiE+sWX+L58slwSh5LcrVEmRmYo1FkibekHm74oz6BU7HnN8IxtaPLL5
	g7QP2TTHQQ8ekSkRE4Rbd0pV7CJgDUWukgr95GQ6RGv57FjJVKFEdwnoMrQ==
X-Received: by 2002:a17:906:b792:b0:c12:7eeb:d2d5 with SMTP id
 a640c23a62f3a-c12aa1affdamr33696466b.33.1782900106941; Wed, 01 Jul 2026
 03:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com> <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com> <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org> <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
 <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
In-Reply-To: <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jul 2026 13:01:10 +0300
X-Gm-Features: AVVi8CfOApAIask00J9b0BLe88oz7fAW8fQFHDlsxs93vuIf3dHnb0iovhmAtW4
Message-ID: <CAHp75VeTp4eYQ4QBoeH2VyVhUivxNn1CaC9jskmeg-1zTAOYLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip() accessor
To: Michael Walle <mwalle@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"afaerber@suse.com" <afaerber@suse.com>, "wbg@kernel.org" <wbg@kernel.org>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, "lars@metafoo.de" <lars@metafoo.de>, 
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>, 
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>, 
	"dlechner@baylibre.com" <dlechner@baylibre.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_030150_920418_D37D3999 
X-CRM114-Status: GOOD (  22.27  )
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

On Wed, Jul 1, 2026 at 11:44=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
> On Fri Jun 19, 2026 at 11:08 PM CEST, Linus Walleij wrote:
> > On Mon, Jun 8, 2026 at 4:41=E2=80=AFPM Michael Walle <mwalle@kernel.org=
> wrote:
> >
> >> >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot ret=
rieve the
> >> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these requi=
rements in our
> >> >>> map() function.
> >>
> >> Why is gpiochip_irq_reqres() called in the first place? Isn't that
> >> only called if the irq handling is set up via gc->irq.chip and not
> >> via gpiochip_irqchip_add_domain() like in gpio-regmap?
> >
> > Not really, the gpiochip_irq_reqres() is called to mark that a
> > GPIO line is used for IRQ, so the gpiolib cannot turn this
> > GPIO into an output line, gpiod_direction_out() will fail
> > on lines used for IRQ. So it's a failsafe.
> >
> > You can live without it of course, but then you don't get
> > this failsafe.
>
> Thanks for the explanation! So did I make a mistake years ago by
> adding the gpiochip_irqchip_add_domain(), see commit 6a45b0e2589f
> ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
>
> As Yu-Chun found, gpiochip_irq_reqres() expect the irq chip data
> to be a gpio_chip, which isn't the case (in general) for an
> externally allocated domain, is it?

So the whole issue comes from the fact that the IRQ chip is not marked
as immutable. For immutable IRQ chips (which all GPIO provides should
have) there is no such issue to begin with, id est there is no
gpiochip_irq_reqres() callback assigned (and respective _relres).


--
With Best Regards,
Andy Shevchenko

