Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A671C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2R/IkUgsNUQZyYj/hsSGzxvJ2UNWF/IZAubjoxHQl0=; b=LnCUYj3gG53798zzQow/g+t2Fg
	ofxH9yx8p1UEQq8HNX+HzwWe3Woq02hD2Q0W42loKtS/Wt7830dNZoAMiWQnBoC14keqvag2zGfKj
	Jwb+tbAbfUBadIFVQwt5AYFGCxNhaMv07VcjFW8x5VEMPOhlSKqIVX1IkLYhW1xDxMAnOR+aTNxK3
	CfHt/4h0VgS68GlfbypXVyoduma5tM/MqjlYfHjnHmZwWqQNAkH7cnWY66jwCP4ZQklkG96fYii9V
	GKr3JEhilUCpfKBbxAEwhq5FuJftykudHw6lZPXuwb//rgTYCKcgo5wQNVW8U8+tDKkQ8MHfkFM3c
	UJOoRPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ea7-0000000DxE4-05tF;
	Fri, 11 Apr 2025 13:38:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ET1-0000000DvqI-2LXN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 13:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T2R/IkUgsNUQZyYj/hsSGzxvJ2UNWF/IZAubjoxHQl0=; b=P3NJHPM4qfEJetiqZVVaUVt6IA
	0zVwbOqwEb9/VlUB0d7mpnuYL2N0kQ9dtFsmdf8xm4dDW5lDWHyoC2y3+fscAP+051eJhksaakBjo
	h//GC6jT678B7y7FZCjLI7a3nf7Kr0/Xn//Azal+gqKB3jI0YdHEhjpErduNM4hm9yT0tsB0Rhwc0
	p9cm0LQEQgNzgbnwqFCnKWRYuNOCwxr/hIiGTEfJsYtPwZ/n+Yn284fBs2l+SmNdTzlb7t/iqXYsr
	lXDbWj/SFB/D55jzlD3BdjCzpqalNR/8YbR6mcmBzfHJ7cIzjbWBly7qedWyV49FdJBTCsjFPto8Q
	pfuJ0Ipw==;
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3ESx-000000091RP-0ZCr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:30:46 +0000
Received: by mail-lj1-x241.google.com with SMTP id 38308e7fff4ca-310447fe59aso14804441fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744378239; x=1744983039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2R/IkUgsNUQZyYj/hsSGzxvJ2UNWF/IZAubjoxHQl0=;
        b=GWYOVA5tCW4Bsf3hqsLJVYLWnzHzaC3FnNxbewDsBYrytxA3p2hjtCSitlzzUnpeBl
         ErmVshWDm/m7S5zAjB3oyLI+1CnNs4BiWYROeeYt3Zzu/oHftilQHmNlwn3rvC9RB9JH
         jCknXU11UqUlE38cD96DIR+BawEldDVnR0Xbb9SeYvpwYzk4znro1mPYSLxER7v7Icvj
         x+cGka9UE3apyuvGtZmxYiAXCU9Xu5L8qRgSKysTwmxqG30SUk/iMv+CKvdTDcEOr2/s
         yhSH9FbPDI2Ao3KSppf+gSnlPppYVSVbnm862Qo5MjH8Z+4FAabpEWP6VjePsVeWeNQz
         X+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378239; x=1744983039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2R/IkUgsNUQZyYj/hsSGzxvJ2UNWF/IZAubjoxHQl0=;
        b=IyMpm+WwcIC/qpIwmxdIhEiy+wNXWAHiA/ECXw5MJqLMNHHTPznoEuIgeTTkLy0haL
         eSZVHY+fCjCXoHU4k7UE58ETG0gLpO/G31dTgJlrQSUoQtAEvOFovcnMcZVF+eXgHl2e
         5ApWx8tqX/LmB71EbAUZwRU3V9NGZ1KsLtkUudGoQkCq3MChD2lbnR10fIYqcwEgGnWz
         YUDJoa7bS95BFUqwK1vZ7sindywGMPw/2BmsrE11dAelit5iYHd6u//2hhaiFComMjYJ
         lVs+perBPeT4h+6+0oLYV0MpbEUzZPnaYVlKVrw0HQVURopaR8g7pjlOqMo4hnbokA1I
         pd1A==
X-Forwarded-Encrypted: i=1; AJvYcCXaJjlvAmTIgwOZ87Ysj8go41Mb2S+9CphjKGOUzVzcbG6Zl8FTk1uLpaLMCDnNusDWUsXQ/Isdj4k0UVGRQ2C6@lists.infradead.org
X-Gm-Message-State: AOJu0YwhsDrSpfodni5hXD3D/iihOC30+yZ0Q9/Kj7R7eljgC4tEENI9
	zUsW7ajbBmBMf7h6kvqTJX5nC53G/Q0owvo8LatsUGgr0rs/7A4N89arcPUY0XxO+SH5EywOUWS
	BKkoCdDZt6qvoy0KX1NHF6EkVIGQ=
X-Gm-Gg: ASbGncvfN96nTFQeyidfORJBzzLtXFSmiXhW8a6UlkyO7dSV568b2Fd2YJjewm0I6jc
	a/2FeiqfOPSP73MAEucnjbUtQfZ9XvXxQK2l527j8SrgiH2A5Nx8m4SpOkQcVILaVI4kg2QQOJq
	FIH6A28WQoqQ88hY+vdXft
X-Google-Smtp-Source: AGHT+IG1lqVlN04eQ+Cdjd0vIhu0KNn3WIjR2MqivG0AARDZu5eY1L6Hi/Vnc2KqgBWl1QD8jRqYqg+Y0ThYnZbHxqc=
X-Received: by 2002:a2e:a545:0:b0:30b:a92e:8b42 with SMTP id
 38308e7fff4ca-31049a930d6mr9258461fa.26.1744378237355; Fri, 11 Apr 2025
 06:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250405113020.80387-1-bsdhenrymartin@gmail.com> <2025041119-debit-cosmic-f41c@gregkh>
In-Reply-To: <2025041119-debit-cosmic-f41c@gregkh>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Fri, 11 Apr 2025 21:30:26 +0800
X-Gm-Features: ATxdqUFFH3sTnc2x3CM9EZtpM34AzSWHqdFLolBE3C_g_Sf3mnv8aMarh0qkivM
Message-ID: <CAEnQdOqmq3wwn3FLNq2wiq6MuM9ZMgcs6vcmwpVVgwzY=zeceg@mail.gmail.com>
Subject: Re: [PATCH v2] usb/gadget: Add NULL check in ast_vhub_init_dev()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_143043_350378_EE65C630 
X-CRM114-Status: GOOD (  18.56  )
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

> What kernel version did you make this against?  It does not apply to
> 6.15-rc1 for me :(

Apologies for the noise.

I just rebased onto v6.15-rc1 and noticed that this issue has already been
fixed upstream.
Thanks again for taking the time to review =E2=80=94 I'll drop this patch.

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

