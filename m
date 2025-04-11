Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA230C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sah0SVBmFLpz4h/jlec344lM1AesPXbeFTOSULVxmM4=; b=X0LrQfKcSrYETi68RJ98nLn8ci
	UmRXqNyioCQwKdaj1jLTkkT6r/XFEc2RCjndwPyA99DqQ6g2Lxh9XN9r//tvFnr0aTRzvaCKYTGTI
	FdWQIBDGjVYNHkh+TSly19COvLr1P8zEpcRkuSwFf5WdkIwDad0FU9MtyEAtVysTUArQp3lXcHeMQ
	0KN6liR3SftH3wEeNY4XRiiceID/awTJIO+pe6e1URPwQonNMtCjzqPQgqejcdaSsPFO2hFgT39jG
	IhL+3J56aQxrY7mg/wht2XAWXvfNYEGiP/kMCBTcvdAxhQQ6YwaoJu+wR+20uYG1qdZmWG04ZtDuu
	y5Z6YncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EhG-0000000DyST-3bKs;
	Fri, 11 Apr 2025 13:45:30 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EKr-0000000DtZ4-12JZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:22:23 +0000
Received: by mail-lf1-x142.google.com with SMTP id 2adb3069b0e04-54991d85f99so3185142e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744377739; x=1744982539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sah0SVBmFLpz4h/jlec344lM1AesPXbeFTOSULVxmM4=;
        b=ksNsz5vBDLBtJXCEe11W4tjNhIb0tCYfkana3zA8smDWYZEWJyB+0x4mpQOgUlFGOx
         YsHgLjoLEabXcqstCklQd4CC7aG+qPtBwTwBZbr8WD7vGxGORXx61Jdwxe3NNZWR8eEW
         HiGT85uNmGkLxBvYGTB1VR5uv2BFzlAsuhybXZyx7ys5kcCtgRNOzq4lf5VnOy3KIbDF
         hCRG8AXJQEkotoI+Pmkjk30uW9qGjary1daYrCrA7UOHzm8C5Rtk0vOoqDUVjs44pl0I
         obncetTGElDLjFdved7qn/vtFFeNXtFy23M+fzyLs+Hmhke6IXlXsd1Dv95b0SYHGqKm
         ZwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377739; x=1744982539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sah0SVBmFLpz4h/jlec344lM1AesPXbeFTOSULVxmM4=;
        b=qxR2e9ib0nn91KUZynCk01qoQptqVV4CipH7CtQlysNoSd1oaR4cFUmE6VVAfCSDQY
         ZCjmeF0zigqC4qSrk9kzF6rYCu8JNnVp9yCzMRz8EOpnEY39xx9vujmekPq37TLLNarb
         kuMFsqaJEH+ZsmiDVZy7ncwyWohv4A/ej06xbEjwHnf2jrP9q9CMdTs9BqPTXmuJqZce
         koy3cCT5JxbdA1Uw6+jyCTM9yB9mfZzKDiyqa6MObPG6k7uaEJbXir55MAv0Ze6T2uE4
         1QQzKq687smCqr02KSXpnXevP/mi0XCT06G1pP+jUCyuGPM71+Fhh+s/YG34PyDGVqvr
         lofw==
X-Forwarded-Encrypted: i=1; AJvYcCU2WHD4oYkN7F4JPpAhUrFwPG/3V2KimlbtMcug5Khp+lnKd4Vz2Mcv5BaH5trh+eCDGyNVvSOkToS7qw++36VV@lists.infradead.org
X-Gm-Message-State: AOJu0YxIYALWjdQxbx190XWVUwEnLNiZyzuzivLOqbzxCZ+DiQDcJXQ7
	1U6eIk2eAB99DCdXLGI2BtXVQ4lPoenAilsVUNSOVpV4yFSVAdu8WIPqVXkaREOZ4m48TT91+OW
	y/J1U41Gvzy3qAZA3l6Gjb9/pVy8=
X-Gm-Gg: ASbGncvgP3xkstYZfhqYsKuDLIVcB0pLiHLCCvbDOmpk8nAjVm2rHP3g4RV04zd3f6M
	t8gJQit29caIjsNyhzNH9NB4DgBwyuQpRz2K5CdFnCx+IWDbfY9mcTLXKoPv7VToda8gJ/2949H
	JINQfG6Z5+LlzpQG9wCOwagQ==
X-Google-Smtp-Source: AGHT+IHw+lifGU70y9Vd72DyBga7i8AjGwQnPrs/Ioo3jLXofjG+CAq6Y1GhP4WwWrG6KrV6FXm0JU1muYB3vRAji0U=
X-Received: by 2002:a05:651c:312a:b0:30d:c4c3:eafa with SMTP id
 38308e7fff4ca-31048972d82mr10675451fa.7.1744377738559; Fri, 11 Apr 2025
 06:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250405113020.80387-1-bsdhenrymartin@gmail.com> <2025041119-debit-cosmic-f41c@gregkh>
In-Reply-To: <2025041119-debit-cosmic-f41c@gregkh>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Fri, 11 Apr 2025 21:22:07 +0800
X-Gm-Features: ATxdqUGEZYsaCXX5XdyoJ9leRiLY8Ans_fSIobpjEITgHPNCVrlUjQY0Xk24xqI
Message-ID: <CAEnQdOoikipXfvBUcfmFUp8As4+K58Bb=oeFKmEH8x_nqkTX_g@mail.gmail.com>
Subject: Re: [PATCH v2] usb/gadget: Add NULL check in ast_vhub_init_dev()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_062221_282631_70774853 
X-CRM114-Status: GOOD (  18.79  )
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

Hi Greg,

Thanks for the review.

This patch was made against v6.14. I=E2=80=99ll rebase it onto v6.15-rc1 an=
d send a v3
shortly.

Best regards,
Henry

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2025=E5=B9=B44=E6=9C=8811=E6=
=97=A5=E5=91=A8=E4=BA=94 21:06=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Apr 05, 2025 at 07:30:20PM +0800, Henry Martin wrote:
> > devm_kasprintf() returns NULL when memory allocation fails. Currently,
> > ast_vhub_init_dev() does not check for this case, which results in a
> > NULL pointer dereference.
> >
> > Add NULL check after devm_kasprintf() to prevent this issue.
> >
> > Cc: stable@vger.kernel.org    # v4.18
> > Fixes: 7ecca2a4080c ("usb/gadget: Add driver for Aspeed SoC virtual hub=
")
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > ---
> > V1 -> V2: Add Cc: stable label and correct commit message.
> >
> >  drivers/usb/gadget/udc/aspeed-vhub/dev.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gad=
get/udc/aspeed-vhub/dev.c
> > index 573109ca5b79..5b7d41a990d7 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> > @@ -548,6 +548,8 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsign=
ed int idx)
> >       d->vhub =3D vhub;
> >       d->index =3D idx;
> >       d->name =3D devm_kasprintf(parent, GFP_KERNEL, "port%d", idx+1);
> > +     if (!d->name)
> > +             return -ENOMEM;
> >       d->regs =3D vhub->regs + 0x100 + 0x10 * idx;
> >
> >       ast_vhub_init_ep0(vhub, &d->ep0, d);
> > --
> > 2.34.1
> >
>
> What kernel version did you make this against?  It does not apply to
> 6.15-rc1 for me :(
>
> thanks,
>
> greg k-h

