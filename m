Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA31ECA5FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFflTVwPFgB5wC1sBWWWQyP2hcLqKZXoXqnWK6jB09I=; b=GB1B5nKiPsbJNRLQnshj1/HbxV
	ZbfTPJh79x4qST2VS+QDJTLXac6MH+DKsSqPViZkFVcyjrk9ZD6NKMwITYEYH6ONKCSzl6DTZeGID
	lrKakC/d3CNnKw22r0ymM6NiSVT0o9LVS3HMY6kCajyMsZN27VY8bzJDp654/lMIyqojZlnZ/RqFO
	dse+xVPTAQ5mNaRgPulRAdZK1uDnB90FXBpjGZLjXR1fuaeO3iLUvJ7bhvclWvlFhXftKM5rhPrIK
	iR94Lrb+n9OFSU/eM+tJ/Cei9Qt6B/35H5Sll1kTzOOpaPqQ0c+Pqc8kcRVbK6C0m4TiN9r8C/62a
	4Uy9eu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFb8-00000008yih-3UQq;
	Thu, 01 Oct 2026 12:09:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFY0-00000008ro0-42mk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:06:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A90A243C0A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 12:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914731F000FF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856360;
	bh=oFflTVwPFgB5wC1sBWWWQyP2hcLqKZXoXqnWK6jB09I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NyX5P91vzbFhZN0U9vod7AAB3LWbMk0HZEqkXoUBF5HXDkw5sYemUmd/UbuefNcOq
	 gCKRb67oKrelFaOIFra81n5va1cR3oPq7hmPFx5OO0YotIiw5P5ZgSkukv73b8uy+j
	 oP+gTucqufGnSIYUgz/4YzNXHCquafhqk1uPW9ghF7kEcy4yVrqTmtjmNg551p8jgz
	 GUbE+mxI1I94RMkSzSnNGUSYpcAY+24Qwjh8P3kViddZyWTgLlKyB0duYyuS45Phk5
	 p6pwpWdq6ieSVtlszgIWoy9qFdLq717gPQcNbweqMVM2ywOeleHmqYNyS5TaWr6RII
	 xIf/J6vx6jHnQ==
Received: by mail-oa2-f20.google.com with SMTP id 586e51a60fabf-4788fe5736eso4390545fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 05:06:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVPBB0bG5Etk1U5BE3T+H5KkRMM96lcV9qLloanyX+2Th9GCllbS6xQf6Rq8DxZNDenO3/hknhHMNv7Kfxxt97@lists.infradead.org
X-Gm-Message-State: AFuF++nEGHRLokybqRymzdOThEC4rPjiUsOzMRIWw5HKA8zYzyt+xZoR
	Mj8YDDkrwz8ujiwjEerDZegbU46Fu68mA4XIw6H/Pc4oInYH8iHKEgMXvXx3spHG4kymTy3oGtt
	7Rx2tvMkXIHD90AeiNub9EJc4RZY1lO8=
X-Received: by 2002:a05:6870:3226:b0:448:89e3:4c58 with SMTP id
 586e51a60fabf-49ddd47f26fmr4458014fac.18.1790856359785; Thu, 01 Oct 2026
 05:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260929203634.32998-1-pmazzini@gmail.com>
In-Reply-To: <20260929203634.32998-1-pmazzini@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 14:05:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJidyettiPkFAh9BNaPVKMxyJzgNnaH8qfMc9=HutaQQ@mail.gmail.com>
X-Gm-Features: AclHuK_kjtaxNY-Iy7s6smCT08kvmYV1w1aOxLf8dIwxCcC_POGl6GaEEQo_Grk
Message-ID: <CAD++jLkJidyettiPkFAh9BNaPVKMxyJzgNnaH8qfMc9=HutaQQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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

On Tue, Sep 29, 2026 at 10:37=E2=80=AFPM Pablo Mazzini <pmazzini@gmail.com>=
 wrote:

> prepare_function_table() assumes the first pin is in bank 0. On the
> A523, which has no PA pins, every IRQ bank is numbered one too high:
> the last bank writes past the end of irq_array,

Why don't you add a patch to protect against that?

Something like this (completely untested, not even compiled)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 31cd142ce0f7..c0c90d9e3215 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1632,9 +1632,10 @@ int sunxi_pinctrl_init_with_flags(struct
platform_device *pdev,
        else
                pctl->pow_mod_sel_offset =3D PIO_POW_MOD_SEL_REG;

+       pctl->irqs =3D IRQ_PER_BANK * pctl->desc->irq_banks;
        pctl->irq_array =3D devm_kcalloc(&pdev->dev,
-                                      IRQ_PER_BANK * pctl->desc->irq_banks=
,
-                                      sizeof(*pctl->irq_array),
+                                      pctl->irqs,
+                                      sizeof(unsigned int),
                                       GFP_KERNEL);
        if (!pctl->irq_array)
                return -ENOMEM;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 8bd00c6ff628..9e0ed9c0c1ee 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -176,7 +176,8 @@ struct sunxi_pinctrl {
        struct sunxi_pinctrl_group      *groups;
        unsigned                        ngroups;
        int                             *irq;
-       unsigned                        *irq_array;
+       unsigned                        irq_array[] __counted_by(irqs);
+       unsigned                        irqs;
        raw_spinlock_t                  lock;
        /*
         * Output latch shadow, one word per bank.  Seeded lockless at


> and interrupts are
> looked up at the wrong offsets.
>
> Count the IRQ banks from the first bank that has interrupts.
(...)
>         irq_bank =3D 0;
> -       last_bank =3D 0;
> +       last_bank =3D -1;
>         for (i =3D 0; i < npins; i++) {
>                 struct sunxi_desc_pin *pin =3D &pins[i];
>                 int bank =3D (pin->pin.number - pin_base) / PINS_PER_BANK=
;
> @@ -221,16 +221,14 @@ static int prepare_function_table(struct device *de=
v, struct device_node *pnode,
>                 func[1].muxval =3D 1;
>
>                 if (irq_mux) {
> -                       if (bank > last_bank)
> +                       if (last_bank >=3D 0 && bank > last_bank)
>                                 irq_bank++;
>                         func[lastfunc].muxval =3D irq_mux;
>                         func[lastfunc].irqbank =3D irq_bank;
>                         func[lastfunc].irqnum =3D pin->pin.number % PINS_=
PER_BANK;
>                         func[lastfunc].name =3D "irq";
> -               }
> -
> -               if (bank > last_bank)
>                         last_bank =3D bank;
> +               }

This looks reasonable.

Yours,
Linus Walleij

