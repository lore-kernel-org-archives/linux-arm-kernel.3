Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24DEFCC9DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYLXkZee8AOhu6gc4XsxestgweNg0g6c2mI6cIoJIg4=; b=rkOByvOg2jwkll1wFCwP6XQBZE
	M3aa+wuITtZeJWeShmPmM5Q+hv5ct1N8Lpt0MnSTS1JCpmI3Q0G0Gy535J+njmyed504ooCPoWCJE
	dTVDyfeBUMPJ1DK7gOGG9J6T0Qw06O8ixmvOlrWfaiamvMLFRWPQTlfD/M0CugdPgmInomsaxuzxt
	amgLG8zZneQ1bMnpWaapZJM/OUuBRbpPahaDMu7daaZv34xubNfQW54G5mTrzphhsG1sFytbW8ylk
	XYd563c5/PdOjVEAL1B+lMg1yedInwkSAKEQxxBaV3/dUqSF0h2PtxpEhrlLkS7A94bSVCRz2fo6v
	S4JFv9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsof-000000090ER-47Gi;
	Tue, 10 Mar 2026 08:51:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsod-000000090Dq-39NM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 08:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE79241A5A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE872C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773132706;
	bh=vVoj3FLi83VXmJyuCRq2Dd+bxXjKaU+NntpFAWe/BT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zct30tSL3h4O0vrlc0FGEfY06o2E9w0S4RpZ3oU4xghwLQTLssYmSSmsIOaAXXJed
	 GKp04zVWjV/rboXJu0znMzuHIhNcjAAHCPTqfjdOHx5SJOogCMDfFiXwQaeV6zNlj8
	 DZyLtTSXYgnjg+zrA9J5y5CyI2Tucq5+RKbfV0zVr7P7ZZHdlQKSI3dR4wndWrXYh8
	 4W4NSylgs6Xj1JcmztWDqzx7kskIHyPe4fUKskMhME8+fhxxKMlUrWlrpJ01IelZQ8
	 G0RZjP94IHthM+0mqwwd46gxPz/r4ZLGHNMhvCgMMgoFvulyrcuC3K43Rc2UQmbtts
	 hLwezImpohRfA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a140efd2d5so4095380e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 01:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUg89m+QExPzHLNBM6ldHeTdXrVc11cjBLJui25B8713ykAie4yXGmb/KCTucDm6NPhb2Oco+5QlVDnsLXnIQz9@lists.infradead.org
X-Gm-Message-State: AOJu0YzHvklxdT5f6YXQB+hMbpPZXLnrgzzaaIWAHisnl/05Dmg7yIIC
	YeGPO0wtDyIgUcZHC/YDMg8bWL/JSQgJpuHYseGi4Wy3JlVDCMQL91ZZVnE5jZColH3oocGUj9n
	gCtPfnMiYxsrXDaB2I0erGdSq4RxwBfEbuMIk0vroqg==
X-Received: by 2002:a05:6512:304f:b0:5a1:3e8d:aa27 with SMTP id
 2adb3069b0e04-5a13e8dad62mr4744483e87.36.1773132705315; Tue, 10 Mar 2026
 01:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com> <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
 <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
 <CAMRc=Me+oUX5xbNY7PX43cTH0e5ouu=Ex3TqhvWvoefmR7jYYQ@mail.gmail.com> <CAKxU2N8_V7U11X18Ja+=tdYPWT6jnmM7bYt+5GHgeXAXOJ5cng@mail.gmail.com>
In-Reply-To: <CAKxU2N8_V7U11X18Ja+=tdYPWT6jnmM7bYt+5GHgeXAXOJ5cng@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 09:51:33 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md3uAPzndudyvpFiLki8fkYHgAtumtaauXMkXwU4vANBA@mail.gmail.com>
X-Gm-Features: AaiRm52QyqGRA5XZTuwTzrHYnzWWeX8i1qdpXgK_Fun3PV5g-eaSB6k0RbEVzRo
Message-ID: <CAMRc=Md3uAPzndudyvpFiLki8fkYHgAtumtaauXMkXwU4vANBA@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Daniel Palmer <daniel@thingy.jp>, linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Romain Perier <romain.perier@gmail.com>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_015147_830088_4DF2E0DF 
X-CRM114-Status: GOOD (  16.90  )
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

On Mon, Mar 9, 2026 at 11:00=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> On Mon, Mar 9, 2026 at 2:03=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> >
> > On Mon, Mar 9, 2026 at 2:27=E2=80=AFAM Rosen Penev <rosenp@gmail.com> w=
rote:
> > >
> > > On Sun, Mar 8, 2026 at 5:06=E2=80=AFPM Linus Walleij <linusw@kernel.o=
rg> wrote:
> > > >
> > > > On Sun, Mar 8, 2026 at 3:15=E2=80=AFAM Rosen Penev <rosenp@gmail.co=
m> wrote:
> > > >
> > > > > Use a flexible array member to combine kzalloc and kcalloc.
> > > > >
> > > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > (...)
> > > > >  struct msc313_gpio {
> > > > >         void __iomem *base;
> > > > >         const struct msc313_gpio_data *gpio_data;
> > > >
> > > > Do you wanna add:
> > > >
> > > > const unsigned int saved_size;
> > > So in the code there's
> > >
> > > for (i =3D 0; i < gpio->gpio_data->num; i++)
> > >
> > > which is equivalent to match->num.
> > >
> > > __counted_by doesn't support pointers AFAIK.
> > > >
> >
> > This is a regular flexible array of u8. It should work fine with
> > __counted_by and I too am in favor of using it as it has become
> > standard for flexible arrays.
> That requires adding an extra variable in the struct.

That's ok, it's negligible and provides tangible advantages.

Please do the same for your other patches.

Bart

