Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52074CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=; b=EdhnwHGRCDEdK9FE19PZorQJfG
	lwB9ecDgjQSukdBnwayQ6d28ByjR/T73SqerUZpdej5Dk6eaiReBiKBwzy3rHIcpU6xAfzVYzeksV
	PriblCzEhp5OMcFeuE/sde9sq7T4Zv0G6r/ACudD5C5si3yqE5vcvURDr7XI/coZzWhSZSes5MJ3R
	/EtZz07pfwFuc2GuQ0EH5DL58jfxRra2vCHrRPWCui3FFxZ8V4kpOq8cuCAWTqgg1GP+gWfJqDnI0
	idyM0otw4e65b1ysEyVTUygK0Z8nnEOA2ZBUF1Qd4I7aySLdnIb8k3HsCw6dvMdUoIubvYFNFPZIH
	HMIYWgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbt1-00000001Xp6-2J2G;
	Thu, 11 Sep 2025 07:38:31 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbsx-00000001XmW-20sQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:38:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f6f434c96so385362e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757576305; x=1758181105; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=;
        b=W4shUZxtZ7WJQ3C1jj/eNuDU7Np3X77r/sqUgNNuCnZo6z9y6mouWj7iO7PDUJKuys
         R2Wtx4Ilk15ymee4Apt4JxhS9yJySKYfpu8DGcAoNRVIUUAe2ob9JbhvvB6YC9RojM+R
         kNjyVHTsrMaZ0rrPLhRkdqxlP5bJ02sZqQQ7MbtjnlPR0/TgT4tzzsDh4hWonyHlHVcf
         QxRsAGjgXym80lFcWXyNFer182qzWr06ZLGPggFE8og4huytMUeE9e9mj5ZNy9esCfDa
         6n1xIiLebLFZi6QcvQJ2UVhhNcFFYrlUqG4ba+hhkFWqBTdGFZnlRBEQ2XJBN3AceGT0
         kXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757576305; x=1758181105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=;
        b=lP3Q5j4wTDnpA61839IvJyo5ev/NJTODC85LOJVzKrUovuKr+7KvVu82XCMl+6AolB
         iYh6+8IVew5RlKKgeod75nhd5BE4dRxhnVzJBoCrLJJ06lZ9u/ftp4H2p0EhX/WcTg7w
         aVunenoeb+PwYcRR3RvrIFgZlrYXPwHO9WwOF/1xvtYi3LKExqD0ZWvVOEkURpqPQp/n
         6UtZ67o9tSdBdy/k+ojPfllHDM1PMI/rME3z62AQDFxLwCmnp3k0KsGRPsqWIrTanuY2
         RD4bpDQQrsNfPd7B21wtMFaiAP9yyqjBw6jZl0sWJiWye/HvwYWZiqdJqTJpz9n0gyEG
         iyBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKIrfSkhsfe75/Gw6MADeiqBLdpC8NOpUnNfVylgyGiyJ2H3QAS3/kS22MNcLFlq3e5VtprF+cbwHLoQBxtCW5@lists.infradead.org
X-Gm-Message-State: AOJu0YyLdfrXYxeFH/hHVoBOQu3A/4IvSu4MBkKO+IQU/8eWkWj3DXA6
	JFHoChclzT07L0Abk81juliD0K9ESi7/oPugnMQiNibvnOksaiiCWsS8XQZOu2RGs7OvC6dB3Wr
	+TIZKpKeOS+usV2XYNZJGCw1ob7C29Uj3uoOz+lhMcg==
X-Gm-Gg: ASbGncucBOepZlKkxx+jt+J8slIO+NlGsqvR0WnCBkB4t/zunV20cGkBuP4mEtB3ipx
	qK/0U9/QfERhAoT79312KaMg/z8JDfEIJTQRF46djjNz9+Lr5+fsf8k+ayZcZBPptGTVFZDE7ew
	qu+7zbeDOoXshrwJ2dKYi8pfBfk2VtNUxiZjhyy3uaL/2WOqVNXoHjkEhQZdeYxPesUe2bt+ZaG
	rDyVqaSaCi/qsM0Ar/bH4fjYU4EcUawaWSvfeg=
X-Google-Smtp-Source: AGHT+IGFKCUUrJkt+A6v+xuc1LQXhwUm4KpMBhnA0hSfXgMQG+z+UHy3svEwymKETUJXd9ilc9E5haoHU8vK2eJzapg=
X-Received: by 2002:a05:6512:b17:b0:55f:498f:f08e with SMTP id
 2adb3069b0e04-562614ff71emr7447870e87.24.1757576305171; Thu, 11 Sep 2025
 00:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org> <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
In-Reply-To: <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:38:12 +0200
X-Gm-Features: Ac12FXwiBbcmTD8LlFccmOHZdwwoOfYFi61pHLgjut8Pxa8sFHcycGYwle9xiUk
Message-ID: <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_003827_646825_5BBBDC3D 
X-CRM114-Status: GOOD (  24.68  )
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

On Wed, Sep 10, 2025 at 11:32=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Sep 10, 2025 at 9:12=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > Here's the final part of the generic GPIO chip conversions. Once all th=
e
> > existing users are switched to the new API, the final patch in the
> > series removes bgpio_init(), moves the gpio-mmio fields out of struct
> > gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> > the new situation.
> >
> > Down the line we could probably improve gpio-mmio.c by using lock guard=
s
> > and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" o=
r
> > something similar but this series is already big as is so I'm leaving
> > that for the future.
> >
> > Tested in qemu on vexpress-a9.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The patch set is a beauty, hands down.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I especially like where you caught local spinlocks being
> (ab)used instead of the generic irqchip ones.
>
> I don't know about merging patch 15/15 into just the GPIO
> tree, that can make things fail in other subsystems depending
> on merge order into Torvalds tree or linux-next if your tree is
> merged first.
>
> I would merge the first 14 and keep the last for the later part
> of the merge window when all other trees with conversions
> are merged.
>
> (You probably already thought of this.)
>
> Yours,
> Linus Walleij

I already have both pinctrl and mfd changes in my tree from Lee's and
your immutable branches. I pushed this into gpio/devel and it built
just fine.

Bart

