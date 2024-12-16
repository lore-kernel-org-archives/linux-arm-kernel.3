Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42C1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 17:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wVUpdjhtUfTkIrm/Ajy/egHruPj7fFBY3Cj6//7WXk=; b=YXg4ZKgejoud775wSMZzqsJRJ+
	QcVHOZcTQVXJXrAbBMW4pIrjEgLbiXFvEn5iVt3uP+jSLHnVOjA0kG79pvXTaZXf9valpV+ImnCE8
	qgaD8ST87+czPJMfk/67jfIL7Urw5DWKrbXzVaYz0qbu5X7GB2wSZy6fzRBkH0LFPhTcLRGrb4DCR
	AmCtH8s1fv0nEv+dvjdbB8kBME3eA/32zAJxD2M3JQrOp7gJ65D0zT6mrRw/mdv+0MxG6tupaMCwV
	NNvYtMmtM+31H6cnPvb5ghm0Ug4m388xM71s/uV1T02d726oxpr31WNhYBM8cRx4l6ujGu5UZ2hgY
	/nxr7m9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNF5p-0000000Anud-0mbu;
	Mon, 16 Dec 2024 17:41:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNF4i-0000000AnkC-17eH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD06AA4196E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 17:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AB0C4CEE2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 17:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734370807;
	bh=qtDrFiZY7xBWFp6O/QCCjAuUsx6f3Ea8LGZhHYyt7tc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nO5f24guSPJCVa+9rCNSf0wEXAafx+b/oVtXkmeq3u4w6fWmVbFOcAFMNtiGzEoCh
	 Bntwkt3zcKJuJYuoJSnDUwdEqDC13WIwxnbyNftelC9B7sXZiIB9CxWweOiGjaTAkk
	 wzNhrrvj0NNkGHjdEs5F34ZpIQXUHtRMxRynG+qn1lgAf+8KyWy5DmMUgorjKGFz5w
	 XfkC54sNbP4FwhXvuTXVUYp4K5hjxD6ENYQ+kKEUhUapmtC0ZqKL84h4ndiJ+ldUf/
	 0bnpktBLxyiDJDa8igjlYG1lU8j6NnbwYSsDKK+iCbcp7rcW0eGMmRPNtewmZ4/ocI
	 FVT1s7Og0O38g==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3a1cfeb711so2846336276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:40:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtPSzM/9mfGUjjjl+8ecvdlhkVtd42aYcuu6toS/lhR4zQbakdxUKFR5t3SVYE4cXz6uGT2qM/56y4XbGvm8rK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3z6d8dQvZE42Z4wJC4LtPO2S8R8+qR7tbM50Nk75kzjxswEqw
	oNCgHceLeJMVWmJKvQe6RPp2rjezH5L/EcLvR8HpKLmadDVGguMZbUme3sSxYmOMjekUmtCes5G
	xTbWJoEjteommZBLXu+gjYabONA==
X-Google-Smtp-Source: AGHT+IGQS3Vs33oblkXxnd78UZgfeUEeHd1e/4e87KRInkXttx2wPk1IBtUqJABbOUTemRiw0riLvAe0o7UmZ68pxM8=
X-Received: by 2002:a05:6902:2081:b0:e4a:9ab:6ac7 with SMTP id
 3f1490d57ef6-e4a09ab70c3mr6470987276.41.1734370806182; Mon, 16 Dec 2024
 09:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20241211-syscon-fixes-v1-3-b5ac8c219e96@kernel.org> <20241215203344.46158-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20241215203344.46158-1-john.madieu.xa@bp.renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Dec 2024 11:39:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+DEWibue5DVB=gSNB7cvaE85rV5XPf8HPqQDz0DgjCXw@mail.gmail.com>
Message-ID: <CAL_Jsq+DEWibue5DVB=gSNB7cvaE85rV5XPf8HPqQDz0DgjCXw@mail.gmail.com>
Subject: Re: [PATCH 3/3] mfd: syscon: Allow syscon nodes without a "syscon" compatible
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: arnd@arndb.de, heiko@sntech.de, krzysztof.kozlowski@linaro.org, 
	lee@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, liviu.dudau@arm.com, lpieralisi@kernel.org, 
	pankaj.dubey@samsung.com, peter.griffin@linaro.org, sudeep.holla@arm.com, 
	willmcvicker@google.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_094008_437649_EE7187D4 
X-CRM114-Status: GOOD (  17.99  )
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

On Sun, Dec 15, 2024 at 2:34=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
>
> Hi Rob,
>
> On Wed, 11 Dec 2024 14:57:14 -0600 Rob Herring wrote:
> > diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> > index bfb1f69fcff1..e6df2825c14d 100644
> > --- a/drivers/mfd/syscon.c
> > +++ b/drivers/mfd/syscon.c
> > @@ -171,8 +171,10 @@ static struct regmap *device_node_get_regmap(struc=
t device_node *np,
> >                       break;
> >               }
> >
> > -     if (!syscon)
> > +     if (!syscon && of_device_is_compatible(np, "syscon"))
> >               syscon =3D of_syscon_register(np, check_res);
> > +     else
> > +             syscon =3D ERR_PTR(-EINVAL);
>
> The current modification will make device_node_get_regmap() return -EINVA=
L even
> for syscons that were already found in the syscon_list, which I believe i=
s not
> the intended behavior.

Yes, it is. Doesn't Will's fix work for you?

>
> I suggest modifying it this way to maintain lookup functionality for regi=
stered
> syscons while implementing your intended changes:
>
> static struct regmap *device_node_get_regmap(struct device_node *np,
>                                              bool check_res)
> {
>         struct syscon *entry, *syscon =3D NULL;
>         struct regmap *regmap;
>
>         mutex_lock(&syscon_list_lock);
>
>         list_for_each_entry(entry, &syscon_list, list)
>                 if (entry->np =3D=3D np) {
>                         syscon =3D entry;
>                         break;
>                 }
>
>         if (syscon) {
>                 regmap =3D syscon->regmap;
>                 mut ix_unlock(&syscon_list_lock);
>                 return regmap;
>         }
>
>         if (of_device_is_compatible(np, "syscon")) {
>                 syscon =3D of_syscon_register(np, check_res);
>                 mutex_unlock(&syscon_list_lock);
>                 if (IS_ERR(syscon))
>                         return ERR_CAST(syscon);
>                 return syscon->regmap;
>         }
>
>         mutex_unlock(&syscon_list_lock);

3 unlock calls is a sign the code structure could be improved. A goto
or a guard() for example. However, I think this is the same logic as
what Will suggested.

Rob

