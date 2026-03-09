Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E62EF371E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9/kcK7HCenaqmPZLEj+cxswmECBHG4Q51v27n6bUNA=; b=cXbUHUo64PilrHl7ixFQLQT0t+
	REixLbml9fsnt+ru/zPIcK7pZPlYR7TOE4jjawvSzr47Vem7AoLsVW/QTGDxVlSLlX0fz0TjPcV3K
	nUgE9Bm/Dq3Af9k7nX3eFUWzZMVARvwlGlMoi6BVJp5KIxAI9j1hdH8FFTK/bCNI73AAzK0v8EIF6
	3HLtmwidwbku7apsbf2ZiR0GhFcxz8eHKBtAjvO3gV1bHAiN2Xz7xeJOcXEK3xOVB4Urt4JEN5bGs
	Pm+gSmk6yRoGNWCxzL+av14N2G/xffrrwh/ZigIcpdZwDli3Zxjs0rD1hJmI7Ll+DxKjuY8eYgSe3
	7nKs+75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWWf-00000006vgq-1Dya;
	Mon, 09 Mar 2026 09:03:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWWe-00000006vgZ-3ATF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:03:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2786600CB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 09:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7E4C4AF0D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773047023;
	bh=NHqpSEZVsWbWgIja3kieVVuxwiNnL7EaRmas6HJUsWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rQ101iWkne4GQpFROza0W41V7NDreoF6+XeGG7jzew41PPHodNBGCEQSFkylBBJQJ
	 hDc8XJ99mE5qnngXrp1vm3YfpGgcKcxBG+BCbiQQy7lIGEV/ej8ER5JpbRJcpQUV5O
	 GD9znMOb31xlZcaGDM5ctl0lvO9/QKGkze9duLfAIcqd8AxYXvg6dt34D2jJyGLfbh
	 dmqEPhCAbEsk8E7iHQlmnyk6SuF9bIzsAIYWk1Uum7s8ny4tT4hcAvc12ZMFBe7rt+
	 d5zoXA531kIM8nAifg1diwPgQdU7bYuhUV4sYx13PsT1yxks47B7Mu80WhvpQomW9y
	 fLDYdQMJyQcag==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a439f9b43so14511061fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:03:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZCabRKz0ij5zLs13Z1/7Cjz3hoJ4CVHx/yDc28tXLHfHXUy+2OLVbIbNNmn8FWYdGXuX54suk5B/rxVQwjrBH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdf6R2/9boBfGQciwNmjDQY9NeKm1hyL6JgRdZMV4CiqCfzVB9
	p3zKTWmChlRnqOZ11IAxsE5R3/6VRkY5bK9HJNsIFTWiz93jw1sBfYFKXkb5mrlX8oKM6oRm9/K
	qML68HhWg1dYmmxRSD3x0MlRdbSPPVBXNIDjFsEP0Lg==
X-Received: by 2002:a05:651c:41c8:b0:387:15c9:379a with SMTP id
 38308e7fff4ca-38a40b5ff81mr28921681fa.26.1773047022054; Mon, 09 Mar 2026
 02:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com> <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
 <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
In-Reply-To: <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 9 Mar 2026 10:03:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me+oUX5xbNY7PX43cTH0e5ouu=Ex3TqhvWvoefmR7jYYQ@mail.gmail.com>
X-Gm-Features: AaiRm51GDQM7nWXlWiIub7pxCbmgBaQ0riecFovbemyWgkXzu2HGDohc6qR3JdA
Message-ID: <CAMRc=Me+oUX5xbNY7PX43cTH0e5ouu=Ex3TqhvWvoefmR7jYYQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Daniel Palmer <daniel@thingy.jp>, linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Romain Perier <romain.perier@gmail.com>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 9, 2026 at 2:27=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> On Sun, Mar 8, 2026 at 5:06=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
> >
> > On Sun, Mar 8, 2026 at 3:15=E2=80=AFAM Rosen Penev <rosenp@gmail.com> w=
rote:
> >
> > > Use a flexible array member to combine kzalloc and kcalloc.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > (...)
> > >  struct msc313_gpio {
> > >         void __iomem *base;
> > >         const struct msc313_gpio_data *gpio_data;
> >
> > Do you wanna add:
> >
> > const unsigned int saved_size;
> So in the code there's
>
> for (i =3D 0; i < gpio->gpio_data->num; i++)
>
> which is equivalent to match->num.
>
> __counted_by doesn't support pointers AFAIK.
> >

This is a regular flexible array of u8. It should work fine with
__counted_by and I too am in favor of using it as it has become
standard for flexible arrays.

Bart

