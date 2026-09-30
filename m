Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D13CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRcKtZdHFiy0cgyAQBIRvb56t4wOCvKeqqa65x2mOhk=; b=hegFgqQihLCmGT0+hD6K7yJXGF
	RTgKUzA2q6dSsUaSjicPi8P4qgZkkobuEv9JpmJd9dVPP2Uonk3X9iQxry9+a2AxrOcyh48EbUIMP
	TjHiNvqbAksETQ4JuLl/PWKPRIPkq/pJ+DNUDHSyc5VUyP5gPDXquTbzBB5bX5s8AX6qWzFRqugdW
	Q+h5q/gxdiGPa/Wa3sJjvZ4AJgES7RUMYpfJOchFRRQDttSsY4ZqxaaYy+uysTukrrXTNF6y9vOwx
	Ur6ehhfl/V/BPwf3rZUjorKgn7etCxi6wE8VVlJDO/2PfAldqu7rThelPJtetlrJ59s/A3eluBAVo
	7Oid+xCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpVa-00000005Opx-2JLc;
	Wed, 30 Sep 2026 08:17:46 +0000
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpVY-00000005Op5-1voD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:17:45 +0000
Received: by mail-yx2-x0c.google.com with SMTP id 956f58d0204a3-6767e5ae3ceso187430d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 01:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790756263; cv=none;
        d=google.com; s=arc-20260327;
        b=VWoAA0MaRGkgXQO/YH8j0l11UgigBD/Q1EOFjd+JaMDOREZmB8i37kdoXLKFBHfCBK
         XTwkH4/dvNLe34pFwR9ex+8Zw7wWif57WeU8jiqMTiWOxG9lRWowBdbZ/YOSpLBCaXSM
         4nNDmKWnrWy2nv4UY3EiNOZCKJhnAgSeq+JmJekbArfxhJQ+r7HCeDbjM7pWJhxvzVFU
         xf8mpYdTvfRITxkbvnl7BWCIGl6pPMOxk4KcRTi0OOqcTp2SzSEZD+eFNipd9d3Ua1Wf
         Bn7/N/QZ7cDhSutFsuzYd+f/MIztj7hyoG840P+g0LdMePa3PZqx/Lalu4zGgSv0Tc/n
         5tTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mRcKtZdHFiy0cgyAQBIRvb56t4wOCvKeqqa65x2mOhk=;
        fh=LN53qmqwqVBQWDIB5ggQMNkEJvU6Nv+KaWN1sAFH8CU=;
        b=F+sD/n2vLGo9Zqjgf4cUNU3yW0XdvcwY+rXlcTCkcp3kd6qkG7r5AOnN1c1C/f6Ok3
         lFlahPAeAzvIX/dLt0fYv/t+nwsefZyIFvx4yWs9OfMepAay1EDWCQiKGLp9Xl2Z4o47
         TdriRYIWXgbcAvpM4C0lQlViwZ3EHvXQDU3bZRctuD8ovEtnleQXY5YFt6/wu8UMpq94
         74O3fFq6LSHRjpBSK2ANW7A1ebGiJnCibL9A9WzHt8gs140+/IkS7rdJKu8VixN+0y/d
         7X5m3vWYkoUeU1oGiQfKYqd+MkLQpf10lG6sHattP4batG+r4xh6SsxZyfq0Os0hA75T
         k5fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790756263; x=1791361063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mRcKtZdHFiy0cgyAQBIRvb56t4wOCvKeqqa65x2mOhk=;
        b=AbPh1PvpT6ZZ2+IigBswycDC2s0OY/4au/Zq1I4fmwGErxdmjbkAG8F7i12Mhgw9il
         wr7XUIKoRmWphVbcm7MAVZMmR6y1PZC+SYls9Y9groMkgLXjkcrPHYMbgoFFuia5ZHyG
         GF6vxJB5PH2XChF8EMLe0pTSs1VkwO+rhh7w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756263; x=1791361063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRcKtZdHFiy0cgyAQBIRvb56t4wOCvKeqqa65x2mOhk=;
        b=SyERQG7j1V1mqZXw7o6/oppLHKbiqef0CgjWYg5q6saxeIt8a9CiT7S25e+XO1eC7/
         FKUgwgPemWW1DL/N63wmQOXXyAH4IJVWcII1PAF7FvQihnkHl5nShO8eFDoj1hjzExsy
         WiO6DZAtV08pxk9dnnnY/tIdG5K1fY60oks6RdZxPKrCr3mOfNtDI/71/I83J7MY2KNS
         sbegNiUUP1qjDDeDP8Fcdygj3Vkww5A5GnQB3v7L2PDEkgln8Nkks/RfBHbaPribZXRs
         rvyLErlfqZpLCEORKdjGXu7sBEF9942okg2t7djkm1gmk9P6eWAfja1DM8vTaBoMMif3
         qDxg==
X-Forwarded-Encrypted: i=1; AKwUvBzqJ4aTVaWzeXgerC3Ya0prH+mSNElCj38gsDUHkaU2hHkdKjcs7QE6w5KXS1CWEDf1TyitV7LphSUk7GNfqDXL@lists.infradead.org
X-Gm-Message-State: AFq9FYKGevKmhyhFYlLfUl4Sn0/c2ezEKOk5CToTMA/F/EfUhZaUycwR
	GFuu6rkA6hjeb83t0DCWhvqOVft6fJMiK9gBptUnjwf1Z5xH4Pmg+7mnTud8cxlDrtpFIgqj/02
	YWbkuoZJAnI5JgKNViNCz3+lUrvwzg+D6z+de1zgt
X-Gm-Gg: AYBFou3Z7Az09G7UAoDXPyp2heKQ6EI1teV1c3g9eizXduGP5B1hBNPGk+gKYq34j+N
	Y9yi/blzcTBj/oAQiChWpq7SiPWoBBUayzZEpzDKRVEKO9i7teSt2q0l4JKkQApFKX92eqaxkkA
	Od6gBie2J4TUTOCKsMml9TevoH60dCp097R8kb1eK8uiuJ+pYoLIK6QN3/iZEl9wBzTzL9FwO1G
	1/DsdgQSAvqhYDy2TbPoO6awXXPa8siEGQAqCwAij0sOc0KF/fMI+7M15a+iwAKzQ7+wAKrJ0HG
	2arFK3Iiato0Zo2zvnVm6vcyqUVizn6gWzi0KWL5msvUNZC4oVRPSUrhM6RCKdMUih1U12xLcmD
	zPphMHxkMiEgCfbPSs5l3fgMcmDZwsfE=
X-Received: by 2002:a05:690e:138e:b0:676:88ca:2799 with SMTP id
 956f58d0204a3-67688ca33c7mr12124d50.0.1790756263029; Wed, 30 Sep 2026
 01:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
In-Reply-To: <20260930080609.dnK1-Uta@linutronix.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Sep 2026 16:17:31 +0800
X-Gm-Features: AclHuK94rH4mX8n1W8Ppf4V2xglhOfwH81bL1d3SpkI1GiY_ngCECHUlOisIdXY
Message-ID: <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_011744_584984_77033142 
X-CRM114-Status: GOOD (  46.57  )
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

On Wed, Sep 30, 2026 at 4:06=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-09-29 12:57:51 [-0500], Ryan Brue wrote:
> > The EINT irq_chip emulates both-edge interrupts by reading the pin's
> > level through mtk_gpio_get() and the pinctrl regmap. It does so from it=
s
> > unmask and set_type callbacks, under the raw irq_desc lock, and from th=
e
> > chained handler, in hard interrupt context. The regmap comes from sysco=
n
> > and locks with a spinlock_t, which may sleep on PREEMPT_RT. With
> > CONFIG_PROVE_LOCKING, the first request of a both-edge EINT prints
> > "[ BUG: Invalid wait context ]" and turns lockdep off for the rest of
> > the boot.
>
> This duplicates syscon node and creates a new one with the
> .use_raw_spinlock=3Dtrue attribute. Now, syscon is always low-level acces=
s
> with MMIO access, right?
>
> I've been wondering if we could make drivers/mfd/syscon.c use the
> raw_spintlock_t instead making this sort of change for every driver that
> has this "requirement".
>
> If this is all MMIO reads/ writes then it should work. I'm not sure why
> we have the lock to begin with. Probably due to the cache/ async writes.
> Cache wise just the flat-cache works since the other (like rbtree)
> allocates memory on write under the lock. So this does not work.
> What I am bit worried about are the bulk_write and multi_reg_write where
> multiple writes happen under the lock.

AFAIK the lock is primarily there to serialize concurrent MMIO access,
especially read-modify-write patterns in regmap_*_bits().

> > Create the regmap for the "mediatek,pctl-regmap" nodes here instead,
> > with use_raw_spinlock set, and register it with syscon so that other
> > users of a node, such as the ethernet on MT2701 and MT7623, share its
> > lock. If the node already has a syscon regmap, keep using it. Select
> > REGMAP_MMIO, which the driver now uses directly.
> >
> > Fixes: 3221f40b7631 ("pinctrl: mediatek: emulate GPIO interrupt on both=
-edges")
> > Assisted-by: LLM
> > Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> > ---
> > Found on the Amazon Fire HD 10 (2017), an MT8173 tablet that is not
> > upstream yet, where usb_extcon_probe() requests the USB ID pin's
> > both-edge EINT. With this patch lockdep stays on through boot, CPU
> > hotplug, suspend to RAM, and lid open/close edges on the hall sensor's
> > both-edge EINT. Only MT8173 was tested. Nothing else uses the node
> > there, so the -EEXIST fallback was not exercised.
> >
> > checkpatch warns that the regmap_config should be const. It is copied
> > per node to set name and max_register, as syscon does.
> > ---
> >  drivers/pinctrl/mediatek/Kconfig              |  1 +
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 59 +++++++++++++++++++=
+++++++-
> >  2 files changed, 58 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediate=
k/Kconfig
> > index 30ef3dc5dfb1..764256901d6a 100644
> > --- a/drivers/pinctrl/mediatek/Kconfig
> > +++ b/drivers/pinctrl/mediatek/Kconfig
> > @@ -17,6 +17,7 @@ config PINCTRL_MTK
> >       select GENERIC_PINCONF
> >       select GPIOLIB
> >       select EINT_MTK
> > +     select REGMAP_MMIO
> >
> >  config PINCTRL_MTK_V2
> >       tristate
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pi=
nctrl/mediatek/pinctrl-mtk-common.c
> > index 1a977acd6883..65b1e3096183 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/gpio/driver.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/pinctrl/machine.h>
> > @@ -1057,6 +1058,60 @@ static int mtk_eint_init(struct mtk_pinctrl *pct=
l, struct platform_device *pdev)
> >       return mtk_eint_do_init(pctl->eint, NULL);
> >  }
> >
> > +static const struct regmap_config mtk_pctrl_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .use_raw_spinlock =3D true,
> > +};
> > +
> > +/*
> > + * The EINT irq_chip reads a pin's level through this regmap from call=
backs
> > + * that run under the raw irq_desc lock, so the regmap has to use a ra=
w
> > + * spinlock too, which syscon's own does not. Register one with syscon=
 for the
> > + * node instead, so that any other user of the node shares its lock.
> > + */
> > +static struct regmap *mtk_pctrl_syscon_regmap(struct device_node *np)
> > +{
> > +     struct regmap_config config =3D mtk_pctrl_regmap_config;
> > +     struct regmap *regmap;
> > +     struct resource res;
> > +     void __iomem *base;
> > +     int ret;
> > +
> > +     ret =3D of_address_to_resource(np, 0, &res);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     base =3D ioremap(res.start, resource_size(&res));
> > +     if (!base)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     config.name =3D kasprintf(GFP_KERNEL, "%pOFn@%pa", np, &res.start=
);
> > +     if (!config.name) {
> > +             iounmap(base);
> > +             return ERR_PTR(-ENOMEM);
> > +     }
> > +
> > +     config.max_register =3D resource_size(&res) - config.reg_stride;
> > +     regmap =3D regmap_init_mmio(NULL, base, &config);
> > +     kfree(config.name);
> > +     if (IS_ERR(regmap)) {
> > +             iounmap(base);
> > +             return regmap;
> > +     }
> > +
> > +     ret =3D of_syscon_register_regmap(np, regmap);
> > +     if (ret) {
> > +             regmap_exit(regmap);
> > +             iounmap(base);
> > +             /* An earlier probe, or another user of the node, got the=
re first. */
> > +             return ret =3D=3D -EEXIST ? syscon_node_to_regmap(np) : E=
RR_PTR(ret);
> > +     }
> > +
> > +     return regmap;
> > +}

This defeats the purpose of having a phandle to a syscon node. Now you
have two regmaps that don't share locking, so both could end up touching
the same register in a read-modify-write operation and overwrite one or
the other.

The syscon node is the provider of the regmap. You need to fix it there,
not duplicate it in the consumer.


ChenYu

> > +
> >  /* This is used as a common probe function */
> >  int mtk_pctrl_init(struct platform_device *pdev,
> >               const struct mtk_pinctrl_devdata *data,
> > @@ -1076,7 +1131,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
> >
> >       node =3D of_parse_phandle(np, "mediatek,pctl-regmap", 0);
> >       if (node) {
> > -             pctl->regmap1 =3D syscon_node_to_regmap(node);
> > +             pctl->regmap1 =3D mtk_pctrl_syscon_regmap(node);
> >               of_node_put(node);
> >               if (IS_ERR(pctl->regmap1))
> >                       return PTR_ERR(pctl->regmap1);
> > @@ -1089,7 +1144,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
> >       /* Only 8135 has two base addr, other SoCs have only one. */
> >       node =3D of_parse_phandle(np, "mediatek,pctl-regmap", 1);
> >       if (node) {
> > -             pctl->regmap2 =3D syscon_node_to_regmap(node);
> > +             pctl->regmap2 =3D mtk_pctrl_syscon_regmap(node);
> >               of_node_put(node);
> >               if (IS_ERR(pctl->regmap2))
> >                       return PTR_ERR(pctl->regmap2);
> >
> > ---
> > base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> > change-id: 20260925-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-154d6=
225b977
> >
> > Best regards,
>
> Sebastian
>

