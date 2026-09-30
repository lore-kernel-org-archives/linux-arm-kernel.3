Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA5DCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgLNjcFeGNUMR6LneImuRXAc6L6Itov9WGhxY/Of5Fk=; b=sUP0mgmHTpkw9FWQUpU49ggigL
	yEnYlpNCm/G+mtZq6zEH8psYlcfN2M9pXDJvX0VSdNK+VFvv2ZXSPBMrUDr598pmPkPSwGKQ8C9yG
	ADpA5QaDlMICUFL+670i1u65CYyX49lLuuYcbHuLH8zD1ugBWrOPIAFWl6vtG+iT2HwicremkAQAV
	0AO7Db9Mrdy7MtfI2OgtqiiAhFgO9ACEA11/Rx4nSgH+pJo/lX6P9lTyPhpwMBBglXwRvBqj65Q/2
	HvP2zDzR9JJ+jL54sZzG+dJpy6caD6advBCQG9iRWPLh/wmp8sS2SVwTzCOgn2N01d8aWQS5h4mn5
	XDfHjdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuOl-000000068U7-0tNl;
	Wed, 30 Sep 2026 13:31:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuOk-000000068Tc-22YO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:31:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FA4D42CB8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFB21F0089D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775062;
	bh=DgLNjcFeGNUMR6LneImuRXAc6L6Itov9WGhxY/Of5Fk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D7p2nkR3qhmiuEq08pq2mE0/Ks/nhYF2CFMiAxJX8nUQfMloqhbLZUVo2Bs9BtjN3
	 iEoKbt2FAgpwwZKii4E+nfC9OdoP78DYhvgRKbKJLePgG+w4BQe5xz9DGSvOzwKu6B
	 tpNqezunsZOBK+Y2GtOxMav0/zcICTJaM0eTmU7Yd9lSn5YxIL+pFhtGnG5byTNqI4
	 qnsoffa39xDmZuDlvMp8qZU7b90+3mcNvEf2F1UA44ijKPgI6wo6HoxHOtr8xYbg02
	 A7XZ9u+op/EC16t1oWpDHhEjd5futLwZ62eY9x0rBGTiy6wUO2RBaGUIDvfyCnbl+E
	 qhySDJpEgc57w==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a77da28307so3776211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:31:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxf7BP2Gh9Lby83WMLYwpNKNh5wiOW/+IEnpCcGNdNaig5tSg00gtGdiDdVRchFyEV65ISBznToe7QKB+qJbSAt@lists.infradead.org
X-Gm-Message-State: AFq9FYJvEn7hcaW8YonE0rtOOwKZhHMvCz2NC25BY/23GUPquRMNCxrh
	dmO94GVfQ5A2GAlZbakc1ea0oDxIe3WsyKCnRH/P1TYYzTwLtmJFSr8PbgewM6OPo3Th2Sxdagg
	GQHGPgefx60LgfP3Qe/vR8wx16hV4PPM=
X-Received: by 2002:a05:651c:3241:b0:3a6:67d9:af17 with SMTP id
 38308e7fff4ca-3a779224357mr4581961fa.12.1790775060845; Wed, 30 Sep 2026
 06:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260918143846.30458-1-linux@fw-web.de> <20260918143846.30458-3-linux@fw-web.de>
In-Reply-To: <20260918143846.30458-3-linux@fw-web.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:30:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLk3w5q=bb=nzQicBjRd6xJAxr9WsKvauF-_x4eue8owbw@mail.gmail.com>
X-Gm-Features: AclHuK80elw9ImXmT4mImfPwVaF2TBSlxvLDtJVkK_HN16dU0cX72iILdS784_g
Message-ID: <CAD++jLk3w5q=bb=nzQicBjRd6xJAxr9WsKvauF-_x4eue8owbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
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

On Fri, Sep 18, 2026 at 4:39=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> GPIO hogs were tagged with name "?" in recent kernel versions (7.1+) due =
to
> commit d1d564ec4992 ("gpio: move hogs into GPIO core").
>
> 7.0 showed the unit-name which behaviour is restored by patch [1], but
> labeling the hog directly makes things easier.
>
> gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
>  gpio-0   (                    |tx-disable          ) in  lo
>  gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-2   (                    |los                 ) in  hi IRQ
>  gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE L=
OW
>  gpio-13  (                    |reset               ) in  hi IRQ ACTIVE L=
OW
>  gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE L=
OW
>  gpio-21  (                    |tx-disable          ) in  lo
>  gpio-63  (                    |?                   ) out hi
>  gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-70  (                    |los                 ) in  hi IRQ
>  gpio-79  (                    |?                   ) out lo
>  gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
>  gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW
>
> after the change:
>
> root@bpi-r4:~# cat /sys/kernel/debug/gpio
> gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
>  gpio-0   (                    |tx-disable          ) in  lo
>  gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-2   (                    |los                 ) in  hi IRQ
>  gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE L=
OW
>  gpio-13  (                    |reset               ) in  hi IRQ ACTIVE L=
OW
>  gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE L=
OW
>  gpio-21  (                    |tx-disable          ) in  lo
>  gpio-63  (                    |pcie3-cn14-hog      ) out hi
>  gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-70  (                    |los                 ) in  hi IRQ
>  gpio-79  (                    |pcie2-cn15-hog      ) out lo
>  gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
>  gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit=
/?id=3Dd54a489c8c4b627775445d54a6cbd32f209bda8f
> "gpiolib: use of_node_name if line-name is missing"
>
> Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

It's always good to use line-names on boards for tinkering
makerspaces prototyping etc.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

