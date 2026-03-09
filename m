Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4916EA8542
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 01:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmrXqlRa6XqcxgRZeLfPo4HT+SM6fCIjFFPpzWuCXEI=; b=dNoqkpoB2tf7QqluCAFABIPFOY
	ERy3NRjbWi39x8uIRE61xsEx53hkv+6nBRqtR8FlLCfimwHkfbsS8UzSoe29pADsIf/uD3Zm3XVoJ
	BzzPfqvGOJjzHcOOhcq5p7ojbj0ZGcgUcM7BUQYbozXx09z+QnjlXKFoZ970w4PsDLTe57QeVtnsE
	B9EtEDLx591X2et7zBs/yD7SBmjb8CbgY/oDzFgHDNAHzP9zShi7WzbdVr98afjGecsBvlUxVKKLM
	DcNizrAMmfttNfHS/YKr5cnjY0BAp0JOiglKKbWCJ4fEDC5BM8lUuoRHES/8BmD5BpkMruvju671e
	nWTu5ztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzPPF-00000006W9J-3Uzo;
	Mon, 09 Mar 2026 01:27:38 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzPPC-00000006W8s-3Vl8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 01:27:36 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-660f1a1e977so5578543a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 18:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773019653; cv=none;
        d=google.com; s=arc-20240605;
        b=BAdrREpM3MMOdiLZoAkJhQ8Gcp4heauGnR38F4adoLkRjeoVjHF0xkwBf3qzNlAPHC
         JrUCPuF2h//YBGWYGRdKPUDEHJGhOi7cdCLIpSqSMvw2k7rJpOue/Hfth8WYq6Yvx4hB
         vc70EXvUYdasStuhPPxF8Pv0pxU3NM63YDI+IxNmkjo7CKnlTKw69vKRCF1ZJ8ZFCRkL
         j64a1HdlPu6cMpXRINcpWPJ25CeHuqX2fzM41S9s+tzm3vZUIiZtPn15ZQah+EwFduh9
         jDFoafrPxSGr1L6MgyQhML3OsT5/03tSsM3Toxapggr7Kp1n+V4ILxG08gv1pFH5etq7
         m5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AmrXqlRa6XqcxgRZeLfPo4HT+SM6fCIjFFPpzWuCXEI=;
        fh=MQf5tLSPN8SXJDOOqAz7GfSy2ujMQe+luTfMz6+jdC0=;
        b=jk8ao8J+BaxvWED8rUzIzTvHBZlf0vCGrSaoYwmYrCySDRPpUkYEtqUaJe1RdKXcGQ
         MvN51U0Gf5eiFFm08nzLCV5epZw+N0p7uDFyVgxXcT2Q+ZzNrbHBhc62AB12e7bFhoSV
         0ZQLCV0EFmG5CYyUOV/1N2ON7LJBhUIEBkQKnw0Lra+2qB//a/nxxJOPGP6ykms+wyua
         42IUyAJlFtBx4Xk//gwX9zTPXr3jZ5efpKjLX02nbQs/8v47coB8PqVfKEkoOHdtYj7a
         jIi0NvJD3bM4CF4WRxuw4zAbygf5btLeDvlRyF6hvFa5Yf4k6LnakzzuLcyHg/+FrV5t
         3P1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773019653; x=1773624453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmrXqlRa6XqcxgRZeLfPo4HT+SM6fCIjFFPpzWuCXEI=;
        b=QVyNf5WbjD1cu+VHMuA1knc/P0IW6uYKCJq10S36TwbmOxpPSSDdN9YfWFDGs7Uft2
         p+OgYUNwP3HNKjlIiqAzzeyU/DGA+oMOHzu5mgqBAOLySKB3cfRfwz/iElWAEcwDK9oT
         BgPyj0/u58fq7Rv1tRJ8fCllfWKOcBcuDZrUWHpLv+1nfTevgS4prDJpAwRyw0Umt04z
         BKvdIt/IdWT+1I1n6cKKs9F111rFExHbRvBI9gOGRHtIrf+4yYE6xrDgTIjTxWh6H4a3
         K7WZ7g7BEz+K5z3EWmzOQY3zFYUC8oS35kFr2+iBf3OKQxHX9dPwAs16s9IG375DF0Qp
         pGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773019653; x=1773624453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AmrXqlRa6XqcxgRZeLfPo4HT+SM6fCIjFFPpzWuCXEI=;
        b=RNJm9W6Eb3PQLYoBNMnP/9Rm0CsyTZS3IhZ8I0pDsX24ZwZqXm/63ltsu8DL8ctgKd
         SjQY+n9KDcHbBUjZeQCmtl5v8o2ut2AS/8Nha7uFi+lV9EAmo8bSv9ftoljr74rTkFls
         XJeSfuoJG7tBA/ghev+tOlwET7sEVNPP9O7xGBoHvAI0iFD00vMozK951L717FvYm9Yv
         fTLD/QG3lOaRuS+kdbjnbASBg2mBWKGOVQFciAgzgISimgkE9k7Se+jcGlvUcLNYiau4
         QM0j6gku8shdT4rWWxFSWgJjBuU0BTfuqtrJGI5fYmajhjCrW1pZIXpKydf4ErbJs/cU
         uEfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyBSq4loCuQ61qatCwCPD9mS5DjhZgmb7MFamGyhVQD23kLqXLToknjcf1E2nJEcXFaivLdrb87ispkc9cHiCG@lists.infradead.org
X-Gm-Message-State: AOJu0YyFkO+2C6Fc/Kz3nlC1wAmFzTNxxW17akpK0xui+EFMJHf4gmVy
	Vf6FrY+W7cpROpxs4WvYv+KfriG674yB001M1FoGZE4sGF6XOE05uIZyy1cH9OhrzjuvpxcFpU3
	PnjDvpK4TCsd1I8qW94rx4pX8REUrE0I=
X-Gm-Gg: ATEYQzxT5u7K3paxV/g1LORFmj5bUhYkl0lMIiV0idG122iJMEHmc70819vjUwVPDz2
	nG0VMw/B497DTJcN/EMLEx1apRLOWR45df9s2G+R9W8sCTF3Fw1IHtbRK2vjE+QbvhM3yCqwgxH
	yqmvejDkXO6sbGV4VT30ywv6/k3C74Pw1g498xkJKZh2PU4WITMIx+Z75Ds5VKDrEtBwF+DzCsq
	UXX36qlOCJdWHMfWNkW3XIK59bEDndz3VnslVDEMBxgWE19Zr/yVZyGQKaKTMCRWSkhOcaKnmv4
	AZXIeLv8a0XmjQMbygKpyg3Ppd10YMUEB1+UJLWciIhtOcW5FVBY9go1R68LwsvLVZFuOaa5Txl
	StqmrG18GfsblGGjS
X-Received: by 2002:a17:907:a03:b0:b88:5bbc:3658 with SMTP id
 a640c23a62f3a-b942e02cf9dmr525408666b.52.1773019652375; Sun, 08 Mar 2026
 18:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com> <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
In-Reply-To: <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 8 Mar 2026 18:27:21 -0700
X-Gm-Features: AaiRm51DHUN2l4LTGqNpI9x37mFL5UP6Qa3rL8znqPALUSc2sV8jWzO7K995iBA
Message-ID: <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Romain Perier <romain.perier@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_182734_917102_7370B4FB 
X-CRM114-Status: GOOD (  13.92  )
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

On Sun, Mar 8, 2026 at 5:06=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Sun, Mar 8, 2026 at 3:15=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> > Use a flexible array member to combine kzalloc and kcalloc.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> (...)
> >  struct msc313_gpio {
> >         void __iomem *base;
> >         const struct msc313_gpio_data *gpio_data;
>
> Do you wanna add:
>
> const unsigned int saved_size;
So in the code there's

for (i =3D 0; i < gpio->gpio_data->num; i++)

which is equivalent to match->num.

__counted_by doesn't support pointers AFAIK.
>
> > -       u8 *saved;
> > +       u8 saved[];
>
> u8 saved[] __counted_by(saved_size);
>
> >  static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset=
, int value)
> > @@ -631,16 +631,12 @@ static int msc313_gpio_probe(struct platform_devi=
ce *pdev)
> >         if (!parent_domain)
> >                 return -ENODEV;
> >
> > -       gpio =3D devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> > +       gpio =3D devm_kzalloc(dev, struct_size(gpio, saved, match_data-=
>num), GFP_KERNEL);
> >         if (!gpio)
> >                 return -ENOMEM;
>
> gpio->saved_size =3D match_data->num;
>
> I know it takes some bytes more but it feels way safer.
>
> Yours,
> Linus Walleij

