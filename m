Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103E8C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMxifAIqWO9udZ2NZ9E8Ene5GRXydyVi9Idk6pBIlxA=; b=GO/Z7OGxYZ3mUHfnS8hj5MpmVP
	7LcUK6MgpuSLbg+EVUFlDG4QO+wrFH35fYWTnQQeIApYS1CQfSa+ufdZJ5n0Fam3fnFVSTNi5OB0g
	YiG6XNkTotornOKXuql81NuCF3CkZqvmy1cdGbV1rJjaWVy+rNTRTX1wMPYC465ZV0zhaKclw+Q/D
	vsr+4dvmGBZAJMMt6CK/hfRIoiawmxZQn7rAuSsvIFpeH6pO48Y/pdcNilQUGbJGJttINJ/R6/GIU
	tO9raCy77tS+Uvb2TVHoO6zFS3Eb2sH8GFi0WYIIHu1I9Y7Ymtfss3/DsNVxTmBxO3OsYtjJSWgO1
	IoJisRkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug0x8-0000000CiWB-1fyF;
	Sun, 27 Jul 2025 12:58:10 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug0ub-0000000CiMy-1gCD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 12:55:34 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso6732192a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1753620931; x=1754225731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMxifAIqWO9udZ2NZ9E8Ene5GRXydyVi9Idk6pBIlxA=;
        b=RGkW0Fj+nVD6vEUkCaNXo3bWFyD8LkOXe3VgfV5SkmGDMCCuAg7PTyXg/Hryd0JHzs
         9wu7387oewnVjTw0R6I8m3vXcz264WjUySQ4IVk+SYOcr6gt1oeSP3NgCDnP1Sk7g6Mh
         RM8qRvK1AHjTASn2kCjFVLPVa1Z+O5COGuH4hnnhGT7dqQ76uXAEmgQVlz9Kzok3jajk
         fEp4t4pSZl80XDlWkztIeEKLTazk+84XY5Y1yMTCQouICU26e2DFRpUlMObzpCXGuGSb
         VeDlE4PHez60AXDN29mcugeT1aQVun4QzBWZXEY/L0SK0jHTcafN4lznm5UGbGPpNl0U
         TfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753620931; x=1754225731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMxifAIqWO9udZ2NZ9E8Ene5GRXydyVi9Idk6pBIlxA=;
        b=ZBeQd5ibG+GtQ+D6D2dpTkkAHn5KENhshr2Xs2y7cdyQww9ubkTJoFyxDyQ7mfMAUt
         ExsRaGSmQzdy2etoWsOvAE2YMpltmry6OmEtOe6hv7M9ifqjI/AAqAKzek1mkwONzuVH
         7MjLklk+9brtHG2bvCZFH6Bn1KiYU390s3XZAsVojK7TvI0i5qAl22pM4KEzndANUIXJ
         Yl1n4yNjH7VTbJzVSWAx8R2SYc+UBVAP7KTGPNMyunZodmgbARvMGHoEH5S5XPsQX+ZN
         u2JmOeGYLZiASfoE/+iqJkrCp4nodTOwgA/zOt0AVFdEI13mytwPy1amcV9t/3EsTWik
         qHiw==
X-Forwarded-Encrypted: i=1; AJvYcCXevhVIYFP/fOxrCMMiU+gD1XDbGxEXkMR1UDaDWVXQfSlDQB22+Wk16GO7zfj3areD9vcfzYbejjd8Zmd+Stxh@lists.infradead.org
X-Gm-Message-State: AOJu0YwLMT4jd5bNRWNlVzdhy2icFgSW5R2W22FAQVDl8oKlGABWUQ5B
	R5aYPgYdZRMSKIqNvXWieq+ziKTVT4a08XWZ+MtnTzsvgLmqOXQt7XRejnNx5ZVzUHFI7SpAcYy
	M0bIcKCQ9+vjK0bhGvG68k5K/U93viX23CEHwkBdA+A==
X-Gm-Gg: ASbGnctkduZnYoi9Ts5NW+Oy3zC9oxmdJhyP8EZIYpDJaKU8id7cxSLDpIH8XalucEK
	94B1UfQpLC76fka8gKkTxFVlLY/OaQep8VqTa8Gl/RjEu36aXS7YSuQ2i07B5ArHeFEl8QNBU+J
	RrPCYmabWv1sVji+EH0aj/kqr8HHrbohuf+AxvM6TujPE91K3oMsfRmPNiNX1YDnvFCMdilbh8j
	elLUg==
X-Google-Smtp-Source: AGHT+IFVYv/O72cHjaH5k5VUlfobYK4W+S80N+a/c4/0HwzwQr74guF3QvQjE4eDoMLi3m7pid4RHeYV0xM1EOGkTOc=
X-Received: by 2002:a17:907:3d12:b0:ae6:eff6:165c with SMTP id
 a640c23a62f3a-af619601218mr939373066b.48.1753620930791; Sun, 27 Jul 2025
 05:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250702183856.1727275-5-robert.marko@sartura.hr>
 <175325995961.1695705.8338983998485530536.b4-ty@kernel.org> <20250724100442.GX11056@google.com>
In-Reply-To: <20250724100442.GX11056@google.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Sun, 27 Jul 2025 14:55:19 +0200
X-Gm-Features: Ac12FXzmHtBtU7jmLL2NxVGb2Ntptau88LQnJUIPvAdvZ644oi9yAP7lpOAawqY
Message-ID: <CA+HBbNGscSseYHT36FqazfH_BXZi9zKdbPkroJGby7Vd+=ZJSA@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 04/10] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
To: Lee Jones <lee@kernel.org>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	andi.shyti@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, arnd@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	o.rempel@pengutronix.de, daniel.machon@microchip.com, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_055533_452769_C0C62944 
X-CRM114-Status: GOOD (  12.41  )
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

On Thu, Jul 24, 2025 at 12:04=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 23 Jul 2025, Lee Jones wrote:
>
> > On Wed, 02 Jul 2025 20:36:02 +0200, Robert Marko wrote:
> > > LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHI=
P to
> > > avoid needing to update depends in future if other Microchip SoC-s us=
e it
> > > as well.
> > >
> > >
> >
> > Applied, thanks!
> >
> > [04/10] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
> >         commit: ef37a1e2485724f5287db1584d8aba48e8ba3f41
>
> Reverted as it caused issues in -next.
>
> https://lore.kernel.org/all/20250724115409.030d0d08@canb.auug.org.au/

Hi Lee,
This patch depends on the first 3 patches in the series, which have
not yet been merged.

Regards,
Robert
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

