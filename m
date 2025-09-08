Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C554ACA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 05:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WghS31MiwYpivW711VFPt8EhJLI8G/psFT7p1MbEpbQ=; b=VGifRETpvFbf+u
	qo6RsdcTFZOeBopFRefXGmIElSDu60WvUFkm7i4qWdMUL0qw5uaIqhgBO0YmZHWFH7RTD76e6/BQp
	xavzmV0gge0Cai/3aKBeZ+j03CqbrTFFzB639voX8TUKnQ/Kp8dUKRbuwEOONhKzwNsrd281yQ7K7
	X5tD3NqN9VCilHJ4Nmu55u8QdueVpbHdbklsTH4WLosaIQIFcFRwDvAmJzmVytuvbGr9ySF0EDBNL
	ReI6QApdmUi5q9MQ8aq/2OSUdeWT2WV/LBi/axXFA9VtYrNA2iQfMIxylVHh8Zd20UEDmabR9Ln4W
	1PkyVA4PrYzIqo205bxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUrt-0000000Epig-1WRG;
	Mon, 08 Sep 2025 05:56:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUp6-0000000EpKS-43vZ;
	Mon, 08 Sep 2025 05:53:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E179601A4;
	Mon,  8 Sep 2025 05:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E6EC4CEF9;
	Mon,  8 Sep 2025 05:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757310831;
	bh=ZqrX17bonRAwjOTuMiYVq+TPaLNTG6ggeRB6AoUMNaU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=gAzQLqNvEwFvLyv+u+YkhomHi0XARpr8yUzeYEVBLuTOyUVr7jrj3wJnt6zLMmjd/
	 ngYVzt+Uq+ULc6DUl7JbPvS+AE72YHdL2r+g3Dqk3KAWWb/IZJhxyBJlxpwyhh+uZG
	 bAUU78kS233inPdjrHCsFq726T/hdrKUVTTrymfWJ9/XWSeLCmsU0f9z6GH3NsopyB
	 SeHuxgPIofBW3IINC25vd97iYZVEXVXPFRBd2f8TAoZ4A8d7V9Q+Op2IPxZmNbPGSc
	 wai6i+VmRw0i9UrbxEvkq6Sw6p8BuuXFCk9xjLHxUW8h92qjjJNRLmCVMtspx8cbqD
	 fzbdzS+CcF8mA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-336dc57f562so35385501fa.1;
        Sun, 07 Sep 2025 22:53:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWG3EGuxofnhvkdfYdsN4/mCT4z3oK85UZgEuoHolL3Ip29Q/9yzj7nP042h1vtMkz9ujjXymxTF5SRnHjfP10=@lists.infradead.org, AJvYcCXGYWEQw7Zh7DemitwFo9ABh21m1tAlWufm4Mrbam4LtEaH8q7eTYT+PxM4V0vrPZZ2dndfIEbFd7+DQE4UCbvf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1h4mLS0/WOKNE9/ZA7+4HaNeILfKXnTk9ghWRKnCCi4HYfqec
	pAVVkln3UxvAslByfCFYDJwggAMBz66V8ZQYz4hSNwMIuFirJXQ5ylMOokBJBMCbUV4Rqdw9uEh
	dT8rhrWNR5WSOSXlW8X0PtaTIkGjp0zY=
X-Google-Smtp-Source: AGHT+IFoIRqBP+beoRTtdEhddDMBEkPHoidtmb9upgIqwtKQKv7AfSn8jlVDO+Lv30NWUzvwXcrdYgDkKWvsvnC3um8=
X-Received: by 2002:a05:651c:1117:10b0:336:cf86:d405 with SMTP id
 38308e7fff4ca-33bb00c67dcmr14316821fa.18.1757310830040; Sun, 07 Sep 2025
 22:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru> <6789547.RUnXabflUD@phil>
In-Reply-To: <6789547.RUnXabflUD@phil>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 8 Sep 2025 13:53:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v67ihFehEwSc-rX=U-KJdvao_588G8iVEoSXuJ_-gnd50w@mail.gmail.com>
X-Gm-Features: Ac12FXyVWZLt2noIJdj4yJ6V9YrgLg44Go_24vJRtuEdKpX8GT8MNMLbwaZezyo
Message-ID: <CAGb2v67ihFehEwSc-rX=U-KJdvao_588G8iVEoSXuJ_-gnd50w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: fix NULL ptr deref in rockchip_pinctrl_parse_groups()
To: Heiko Stuebner <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Sep 8, 2025 at 1:32=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wro=
te:
>
> Am Mittwoch, 3. September 2025, 21:48:54 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Sergey Shtylyov:
> > In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that th=
e
> > "rockchip,pins" property will always be present in the DT node it parse=
s
> > and so doesn't check the result of of_get_property() for NULL. If the D=
T
> > passed to the kernel happens to have such property missing, then we wil=
l
> > get a kernel oops when the pointer is dereferenced in the *for* loop ju=
st
> > a few lines after the call.  I think it's better to play safe by checki=
ng
> > the list variable for NULL (and reporting error if so), like we check t=
he
> > size variable for validity further down...
> >
> > Found by Linux Verification Center (linuxtesting.org) with the Svace st=
atic
> > analysis tool.
> >
> > Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>
> Assuming that the DT is our friend, really is a bad assumption :-) .

If this is invalid, perhaps you should make the "rockchip,pins" property
required in the binding?

> While I can't imagine what 12-year-ago-me was thinking then, simply
> checking the return value really is the better way

I think some of us have thought that guarding against incorrect DTs
is not what the kernel is supposed to do.

ChenYu

> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
>
> >
> > ---
> > The patch is against the master branch of Linus Torvalds' linux.git rep=
o.
> >
> >  drivers/pinctrl/pinctrl-rockchip.c |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > Index: linux/drivers/pinctrl/pinctrl-rockchip.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- linux.orig/drivers/pinctrl/pinctrl-rockchip.c
> > +++ linux/drivers/pinctrl/pinctrl-rockchip.c
> > @@ -3488,7 +3488,9 @@ static int rockchip_pinctrl_parse_groups
> >        * do sanity check and calculate pins number
> >        */
> >       list =3D of_get_property(np, "rockchip,pins", &size);
> > -     /* we do not check return since it's safe node passed down */
> > +     if (!list)
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "%pOF: no rockchip,pins property\n",=
 np);
> >       size /=3D sizeof(*list);
> >       if (!size || size % 4)
> >               return dev_err_probe(dev, -EINVAL,
> >
>
>
>
>
>

