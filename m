Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1CAC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEkdeq10zZmR1kctz1fIkkTbV43ha873suiUEwLT1nI=; b=EfUc+DJEYPR40ep50S2p2PI7nG
	3od/w9W8FIZtIDTVM1LCXfWGxWlnTw1O4y+jC1W5xcUYHRS3N9mtq1M+ogpvtBaTFpYYBWNaMa+FC
	82c+kkewqpknuioOkhlDyifLUxgEpxBLYb3GyJbfCRM5Tpp4OPJ9O/Cw8Cqp+fkUKTvsTecTLbzTb
	fM4+MCQ8uY89Tm9hPbzRtsaIvdPvM+ZHbZ7GaoA8/qlgeQGhY9aL9nDd3fNc1W2dWi82UWyIEl2h5
	pIfBVsDVIHjttUnrAS3ZKh/7MZqz8ObNgC6i5qDtqS0IEvuhKxM6ob4jhWxU/kK3/A3+S8Gl7DtpV
	ke2mr7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp971-00000008ooA-0C8r;
	Wed, 29 Jul 2026 18:34:39 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp96v-00000008om2-0xmp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 18:34:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so1284052a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 11:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785350071; cv=none;
        d=google.com; s=arc-20260327;
        b=cSCEIMFsAxLhaxUXtMxCN/862DPjE72KhQz7HwKUS1sVwlCIr4urLlColNUW2PCDZI
         623rA1l0kb1O4Ok26L5SAA0bl+KrDhe+GPGTCKpuG65KP6nGo4Y8z2HcspzmiaiZSZHg
         XRVqpqCAeopcf5oJYgGV4pq1dryE+K7N5AZ7mYnzpyyW4xTElB4pqcuEnQF2CpQ5Sr44
         IgGuLmDl/B1MYOSU+8QWVeDaLDZ81/4zQO7oQszwOXg2WURrYczxpfNk7yywpLe0dGLb
         RZcFwly1Gbrq13934Pob8aYe+RIVzr4djuV25x+Uzn5uONhjwNprMR49IFJnsFFbe3kw
         ++/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEkdeq10zZmR1kctz1fIkkTbV43ha873suiUEwLT1nI=;
        fh=nnQKaEmPlIRc5nHjLnkeLt42BOIVracmr7CFdpUsgW0=;
        b=W6HihIUPSr9y3XmvZJz0GJBsjr1HNYFy6C5XYiFynMyL68gb9pWHQlq/qzusJFZXSl
         BWvnUftLvPy9gtdGt4MVVTg3p61EcUM5cweOQMT4fRyTUWFLg/I0aH4QD+JZrBLeg9Hm
         jR86kWC+FvXoRmvSae8Z8cmkEeSZK1uNKoQCeL/IK3wVa2wMFmLMwFzOCtjVod/CJ8rK
         +OdZ8U8LV92RBLHcA6X+NdCSbakiAGmtUwObZJx6QXdcOtbFqQMacimsxhcfGQxLQ3FV
         DasfRuxEyYzDp+heimHl4Foix8NznOBA+A6WXdEIzkQl0Nrhh1+xsy+iANd2jteveoc0
         4+sw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785350071; x=1785954871; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEkdeq10zZmR1kctz1fIkkTbV43ha873suiUEwLT1nI=;
        b=q9xyd76YWimo8N3cNois6PlZKiwPKInWUDiiQ2WIzmD8xRacPnu12ylbz4iN8UM28i
         ESx3OR/+5xy3XITgsYTRnLGjiI96BWFOWgtpcTluz3NrVXmj5F0iJxNWE1pkEILFlyQ4
         ZUnJNzwbTux28JOozrdafXdPXn+D2+a5tXKUe9VCBSIDo3ggz+McvggndMwS9aYWHLMx
         AeUqhBoMCTDuWmfsUPN0Tu2Sq+EGa1ANJAepYMcbNo0z2GiqrNE5wNHs5dEJ8da9XbbR
         u26GwqwZNV7z+0EBrBrBRVxe1DcGNg+A8s4iOKCHHAEeJqSz4BAFBtEfavtsL3yMQz4A
         HKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785350071; x=1785954871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEkdeq10zZmR1kctz1fIkkTbV43ha873suiUEwLT1nI=;
        b=V6qO+6dcjFOIn9QW42Y/HtW37M6l0qAZ/TayMV8ZT4L8ghswrZWjwmwod3voOoe6HP
         FzwvfwYgva6V0+sAUj4hrm6Rz/cmJN5ESDMbDrs/dVTFasm1CLFUzlp0u76q+30e23Ku
         33J9fdeG4yMgXmF7dKgaR+TjNf2H8h78zoQAxc6MY4WKoti30QLXYh6fAGBwJ1ij7pL1
         WnH/we5pyOM2eT3l3dmJk4LI0RiWedLSmhi94LcQzS9VA9tniLEdu66TEsWQ6aWuAIXw
         fkEZWH7Y+PxtWypv78BTtBOSDvkLCadxhJfk2k4cKo3NTjfPGkpUjXUJcnyRXCK0rwYj
         nAkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqr51Ni+84RoRMXm5CUihSJSF92Cwo8WYFmNjrZfgVcbMRvCU1YegVgukEuXrOu/TGo8Zul+rFZ5hk4rCunhSyE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo3EIey4H9KG/OxFBErqvXAy3AN9d/qvfyufoEAkCDOMCSevls
	tuCH3aZ/fOmux5r1wvgsoxBxf5fxbkxdfTNL6meHYfTBR647v0JVM/Ki0L6teZ7z0I7ukQwqjlt
	DI8rt8qFdwyOfGiZkr/CzdeF9+A97CFk=
X-Gm-Gg: AR+sD11/HsnrV7QqdV5/tsSeVMIbyW2HI7H8xRZrYM/WPSwTRuIq/ukLZNgGxLUiQEP
	gKL1IPm1GcA/SJs9jnG0y1F31GYmyNPoJE+UGqAvD4/N1H80eRlE89wxsjg84Hs6UHOHt5q7smX
	+kf8reZh4luGg33e6JuVdo5MB37MpLYshAd5w0cHpM8cngKdBhvM7IxIbx+N6bxNCIAFWrCHUmX
	qlNRSwzvPQe1k+BT1IrmJ47VATICPVtAZSRDqyiJ04zUQT9yvAWprbndSTikW6IYQPyp7w5oHtW
	5muabx+9k0FCxfr1Fxl2bfYYDq/LdjreH/dvh3dCrdykMT78qlSTyXTOi4tz1Jsr6I5LzUtYQXf
	B7kt+sjkMz0JXqsTqb5imeM4k4J9D+qrUMjj/wc6EnFIWZNmedniYgbjn1OFkUf90lrIVREeQFW
	eabf1/IzLD0H7vqEDJ0DIRNGOlklaXrxVvzAaJtzeRBGcbMrQvfnr2NTw=
X-Received: by 2002:a05:6402:2345:b0:698:50ea:2d97 with SMTP id
 4fb4d7f45d1cf-6a034ab91cfmr4406703a12.20.1785350070955; Wed, 29 Jul 2026
 11:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260728212438.54078-1-rosenp@gmail.com> <20260728212438.54078-3-rosenp@gmail.com>
 <CAGXv+5EVSc4=ug=GU6Gvdu0UatqM1DD48i-c3AEb4p0GwktRvg@mail.gmail.com>
In-Reply-To: <CAGXv+5EVSc4=ug=GU6Gvdu0UatqM1DD48i-c3AEb4p0GwktRvg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 11:34:17 -0700
X-Gm-Features: AUfX_mxHHY_oKlFmxwUp_dDYkgE3HyOB09yEzi4_yjeUnpEenThghULANdcA5Us
Message-ID: <CAKxU2N8VeE+xPGZ-41nqDCtk_LA_PvgzjrUbnOZ-5JmEb-uKHg@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] Input: mtk-pmic-keys: Count available keys during
 probe instead of pre-counting
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_113433_377489_12C0F847 
X-CRM114-Status: GOOD (  34.18  )
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

On Tue, Jul 28, 2026 at 8:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Jul 29, 2026 at 5:25=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wr=
ote:
> >
> > Replace the separate of_get_available_child_count() pre-count and
> > validation step with a single pass through
> > for_each_child_of_node_scoped().  Skip unavailable child nodes and
> > bail if more than MTK_PMIC_MAX_KEY_COUNT available keys are found.
>
> This actually fixes a small bug. The pre-count only gets the number
> of available keys, but the subsequent for_each_child block doesn't
> skip over the unavailable ones, so if an unavailable node is in
> the middle of the tree, there could end up being a mismatch.
>
> > Set nkeys after the loop so suspend/resume iterate only over
> > initialized entries.  Use a local key variable in the loop for
> > clarity.
> >
> > Add an irq > 0 guard to the suspend/resume wakeup paths so that
> > uninitialized key entries are safely skipped.
>
> You are trying to do too much in one patch. These other fixes should be
> in separate patches.
>
> And why not just modify the driver to keep "nkeys", so that it knows
> how many entries are valid? No use in iterating over empty entries.
>
>
> > Assisted-by: OpenCode:BigPickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/input/keyboard/mtk-pmic-keys.c | 71 ++++++++++++--------------
> >  1 file changed, 34 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/key=
board/mtk-pmic-keys.c
> > index fd684ac16938..e2ced6e5165a 100644
> > --- a/drivers/input/keyboard/mtk-pmic-keys.c
> > +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> > @@ -267,7 +267,7 @@ static int mtk_pmic_keys_suspend(struct device *dev=
)
> >         int index;
> >
> >         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> > -               if (keys->keys[index].wakeup) {
> > +               if (keys->keys[index].irq > 0 && keys->keys[index].wake=
up) {
> >                         enable_irq_wake(keys->keys[index].irq);
> >                         if (keys->keys[index].irq_r > 0)
> >                                 enable_irq_wake(keys->keys[index].irq_r=
);
> > @@ -283,7 +283,7 @@ static int mtk_pmic_keys_resume(struct device *dev)
> >         int index;
> >
> >         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> > -               if (keys->keys[index].wakeup) {
> > +               if (keys->keys[index].irq > 0 && keys->keys[index].wake=
up) {
> >                         disable_irq_wake(keys->keys[index].irq);
> >                         if (keys->keys[index].irq_r > 0)
> >                                 disable_irq_wake(keys->keys[index].irq_=
r);
> > @@ -324,13 +324,13 @@ MODULE_DEVICE_TABLE(of, of_mtk_pmic_keys_match_tb=
l);
> >  static int mtk_pmic_keys_probe(struct platform_device *pdev)
> >  {
> >         int error, index =3D 0;
> > -       unsigned int keycount;
> >         struct mt6397_chip *pmic_chip =3D dev_get_drvdata(pdev->dev.par=
ent);
> >         struct device_node *node =3D pdev->dev.of_node;
> >         static const char *const irqnames[] =3D { "powerkey", "homekey"=
 };
> >         static const char *const irqnames_r[] =3D { "powerkey_r", "home=
key_r" };
> >         struct mtk_pmic_keys *keys;
> >         const struct mtk_pmic_regs *mtk_pmic_regs;
> > +       struct mtk_pmic_keys_info *key;
> >         struct input_dev *input_dev;
> >
> >         keys =3D devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
> > @@ -353,45 +353,42 @@ static int mtk_pmic_keys_probe(struct platform_de=
vice *pdev)
> >         input_dev->id.product =3D 0x0001;
> >         input_dev->id.version =3D 0x0001;
> >
> > -       keycount =3D of_get_available_child_count(node);
> > -       if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
> > -           keycount > ARRAY_SIZE(irqnames)) {
> > -               dev_err(keys->dev, "too many keys defined (%d)\n", keyc=
ount);
> > -               return -EINVAL;
> > -       }
> > -
> >         for_each_child_of_node_scoped(node, child) {
> > -               keys->keys[index].regs =3D &mtk_pmic_regs->keys_regs[in=
dex];
> > -
> > -               keys->keys[index].irq =3D
> > -                       platform_get_irq_byname(pdev, irqnames[index]);
> > -               if (keys->keys[index].irq < 0)
> > -                       return keys->keys[index].irq;
> > -
> > -               if (mtk_pmic_regs->key_release_irq) {
> > -                       keys->keys[index].irq_r =3D platform_get_irq_by=
name(pdev,
> > -                                                                      =
   irqnames_r[index]);
> > -
> > -                       if (keys->keys[index].irq_r < 0)
> > -                               return keys->keys[index].irq_r;
> > +               if (index >=3D MTK_PMIC_MAX_KEY_COUNT) {
> > +                       dev_err(&pdev->dev, "too many keys defined\n");
> > +                       return -EINVAL;
> >                 }
> >
> > -               error =3D of_property_read_u32(child,
> > -                       "linux,keycodes", &keys->keys[index].keycode);
> > -               if (error) {
> > -                       dev_err(keys->dev,
> > -                               "failed to read key:%d linux,keycode pr=
operty: %d\n",
> > -                               index, error);
> > -                       return error;
> > +               if (of_device_is_available(child)) {
>
> Instead of re-indenting the whole block and making the diff huge and
> unreadable, please make this skip over the remaining code when the
> condition fails, i.e.:
>
>                   if (!of_device_is_available(child))
>                           continue;
Yeah probably better.
>
> Or better yet, just use for_each_available_child_of_node_scoped() { ... }
> instead.
In v1 this is exactly what I did and was told not to.
>
> I normally suggest people read the API docs (either on docs.kernel.org
> or the kernel-doc sections in the code) to find better suited constructs
> to use.
>
>
> Thanks
> ChenYu
>
> > +                       key =3D &keys->keys[index];
> > +                       key->regs =3D &mtk_pmic_regs->keys_regs[index];
> > +
> > +                       key->irq =3D platform_get_irq_byname(pdev, irqn=
ames[index]);
> > +                       if (key->irq < 0)
> > +                               return key->irq;
> > +
> > +                       if (mtk_pmic_regs->key_release_irq) {
> > +                               key->irq_r =3D platform_get_irq_byname(=
pdev, irqnames_r[index]);
> > +                               if (key->irq_r < 0)
> > +                                       return key->irq_r;
> > +                       }
> > +
> > +                       error =3D of_property_read_u32(child, "linux,ke=
ycodes", &key->keycode);
> > +                       if (error) {
> > +                               dev_err(keys->dev,
> > +                                       "failed to read key:%d linux,ke=
ycode property: %d\n",
> > +                                       index, error);
> > +                               return error;
> > +                       }
> > +
> > +                       if (of_property_present(child, "wakeup-source")=
)
> > +                               key->wakeup =3D true;
> > +
> > +                       error =3D mtk_pmic_key_setup(keys, key);
> > +                       if (error)
> > +                               return error;
> >                 }
> >
> > -               if (of_property_read_bool(child, "wakeup-source"))
> > -                       keys->keys[index].wakeup =3D true;
> > -
> > -               error =3D mtk_pmic_key_setup(keys, &keys->keys[index]);
> > -               if (error)
> > -                       return error;
> > -
> >                 index++;
> >         }
> >
> > --
> > 2.55.0
> >
> >

