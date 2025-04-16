Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D85C369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/aqoPDk4qPcIGtIJdWVdsmpBx0xCpuPY/P1kNqi40U=; b=j+Ux2NdTUNRdDs5nEPZaY1LSPN
	tnZqwuE0Q7jL389xcM/rDXLaUIVJg+XfF3L5OvCODITHw+X0YTYc/2gp2TLHReN3OMMV3xKu9YndJ
	9ZJ0HaSSbn/mZJAD6Y0ArEBCihxLhhLUKjKkBgQhvwyVp4ld9Pj5Ivs/CJldQHRjdEMS9IkifJ4+S
	9kyFVHSWwEds3m5BYZM2KoA8109SsvdEpHYQ6SVeBBTTh4l39g3SkZmFNaNoW5s6hP/v94j/M9H9C
	NsiPhBC9S///VuX2dVkrmPyg6QqWateQVK40Nad6MnjwC4hEJbE6mu/jxgG2BzfveuE3vr0BXPwVJ
	Kc/ezN2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502o-000000098im-465k;
	Wed, 16 Apr 2025 10:31:03 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yEr-00000008qIL-0sx8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:35:22 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso5364851fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792519; x=1745397319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/aqoPDk4qPcIGtIJdWVdsmpBx0xCpuPY/P1kNqi40U=;
        b=xXFvY7I61I8aO/8euUmSEJX6cCnr/R3PhGHkepIe0a1Huq4XD93yHXzUZ4cfakXQjz
         8VVorsVxJLApBGsVpjTrLJqGcRVO+Z/q2lgGgSp7XVPI05Y26fgvTiHkGFrVSX0MMgDN
         yc8RG3Iu4w33ifzk9bdbTJ+SxR4635kOIpPCNADb5Fnrb9YZ0P7Dapl/BbB8eRLDuGBT
         JBUQXTWCxQb3MWbwpVRZK+xB2x8YiWUKm4egjNt1hlW5ruidU8aH+7IqvoQh9PPVhOI5
         R1n3o08Drk1WYUO0swPPiErebnz0puwqJNfloSm/EVugAXkuRytOlRrWq1cmOsFkYlr7
         0Htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792519; x=1745397319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/aqoPDk4qPcIGtIJdWVdsmpBx0xCpuPY/P1kNqi40U=;
        b=J33S3GuBiImNXA4rsG4JWo+JU3XVfUdLa6bt1eWZQ2XCTsezebqzA8jyOV0pUfMeck
         LPRMbkuhIfDuJi9w4tV1cTd8Oh5SXH4BV8B9ZMV1MvoVGS1F7qb6SkrMCRlURua8WpLA
         iS5rzogXqUJMfRPAhgCOqmVKWTGi/jROSaPniGXiNyKT62B5kfaM8OswweC2CW6KjO5M
         6xC/N5DFIC0EYp6eX7cyXddaI1fU7YM8nGXhk2fLNBT6+JZD4I0D1GsGj1t1QTBjY4L0
         0J9MsiSgLBd4KwKZVRJddcdSa5VTqJbGOAzKs2ikXeZvjCwMiRkVqsAS22ZSMvljukKu
         8Iqw==
X-Forwarded-Encrypted: i=1; AJvYcCXEqapwvbR/vxD9wToSXS8/eSLpH210OrDU56l7gY5h4V4jRDOM+Ttx+3LknXwnWWztcw9bmpwyDpkDnOBowSG+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzq3Cc0FAL5Qm9m5f7oCY3Zq4TgyIRygPldUvzzqpvknPpZvnR
	6S2KBqpM3zXvhHT2qI6vqxlBtxHlhzTfp5ujSALzaNDGuc7EWOSD1zAGUwZ8LBfavQF+B8NJi9G
	hIe5dvwIyUEjzoIHcjOZi2weh4kmovlMgEjPIAQ==
X-Gm-Gg: ASbGncty/v/tOCxlcDZYB0VKwmMpvFF7i9SdFmUMf2o8mfiM9bJRIZdPeENldwtqxGJ
	fA1JMMX7iltu1euS183SBkYPLvZdmkJ3SV+whhYhAqWSZGO4nh9w+uch37+iDn4ZZysVVTV0Th8
	87XvWc78Qb3DSbHz4rheNOfQ==
X-Google-Smtp-Source: AGHT+IEk01/SrahZkX/WwPGiS0BGB/c9p/43YKQ+5wZUlyCgsVLcawfd7xSjA1Eg9Ofa6Sx5qYOZluvwYSJlMTRuqyY=
X-Received: by 2002:a2e:9e0f:0:b0:30c:799:8418 with SMTP id
 38308e7fff4ca-3107f69607cmr2192731fa.4.1744792518989; Wed, 16 Apr 2025
 01:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com> <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
 <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
In-Reply-To: <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:35:06 +0200
X-Gm-Features: ATxdqUHN29Cyzw5aGGyEp2xHZ9Bkh3-8G0lN_prliWzQGyvEc34B3QIRU94x59o
Message-ID: <CACRpkdZqyTphs0k6k2tOXwYzT_K=Jbt7h1CZX1Rh-2LDjWhxcQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, brgl@bgdev.pl, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_013521_263133_9EF8DC2D 
X-CRM114-Status: GOOD (  11.61  )
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

On Mon, Apr 14, 2025 at 2:11=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.com=
> wrote:
> On Mon, Apr 14, 2025 at 4:24=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:

> > Seeing the __irq_startup() code, my proposal would be to turn the retur=
n
> > value to a signed int, but I haven't exhaustively checked codepaths.
>
> Good catch! I agree that using a signed int could be a better option.
>
> Dear Linus and Bartosz, could you please share your thoughts? If
> you=E2=80=99re on board with the change, I=E2=80=99ll go ahead and send a=
 new patch.

Yeah that would be great, thanks!

Thanks for noticing this as well Theo, I think your team is the
most important user of this code right now.

Yours,
Linus Walleij

