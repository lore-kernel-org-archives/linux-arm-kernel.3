Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD316C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 03:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5SQzLZmnmAyoTu35635s72269K1LO99EjP1yPHjEts=; b=VLEDFiiYzLLObhs+JnZoGaeeVR
	YHmyz2gzThTY/ybbaelr9WbukcMmMOtQcf5aQgnXmvEyBZ68SKUwLdVDBLhWPZwSaCsD/YrkP3vez
	3fztJYYmJT37dxvfJ/bcUdrpfvd6ZOX4EGd6MhA6U7UcCb8FQGx2LwJ9vEu6htyOAlx8JVpFnmcYX
	9IgZjFFREqRX6T2348Xf71nNGqMKmx8Fy7Y7GYaVVWOxN+I9gQN8+dFX4wfrot/eHnTxyxCrenfwG
	hXvmoyygZtQc/TSPo9my66XKVJWKqzTe7iKso6K9xkccXPuoX7WQ7hPlVadcFTbdXmTXvFs0XWT2H
	gvWqRzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovDQ-00000006m4N-159O;
	Wed, 29 Jul 2026 03:44:20 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovDN-00000006m3R-3S8L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 03:44:19 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-81eff3ddba4so8881117b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 20:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785296657; cv=none;
        d=google.com; s=arc-20260327;
        b=nj9RQ18eDF93vAwHpezTaMF0PwZzyYG2hl1V53X/b6LMohEZQ8O+4tqgZc4bkKkMlz
         gqjscyHIGjoJN+1t1ZwXBNeFRYF9JuPdmA0+bwJPHZsPa8kQHhoUWDFrcgDc5U1nPYAC
         qYRn/E6XgtKsw2GurbE59zLz+Zms6jD+MZ5T0DTSNMBbRqI9+76CaeYEOQbgSRgq0iCP
         HCxTaeAV8rFAYycsZgRinYvNYHpWAUFlhhGpNMdf8K3XJn1hs0k0cQttlYpaKh81AXMG
         R9KS7zWjQwiQfT5k/dqPYjcDIYp2knFPjs5jLdMgrM77gWGjrgL1qURaSuiunwtlIlCq
         smjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q5SQzLZmnmAyoTu35635s72269K1LO99EjP1yPHjEts=;
        fh=y2B1fRItNuaDL+bn0BeMJTop1ekHs4LP5QDoLgfd3Lg=;
        b=WqBCL6XZqKPZf8Bz1qjUl/6Kc2OkAvp4LfdRaC1/TL/BUyfT1XpfuHBvUX2FR3bJm0
         bo15ivN6xETSziTqsh8wAwCoQC8IGvvpqCJshCSAlZj0Kltbyn7D766m1l5Z39Kkzx76
         gTYlDxfIzUeqNzrxYdbfKRA5N0ZdAeDrAGfrfz7EVxiGoAFJjjl3DtF2pw7VE0jZ+pCe
         tpIQSH1JqW2UUmyrfoBxT7K9MJNBFMwAbq8HPIt7hOOva5uR5gHPFxmBSykNtbssXkL6
         jPJjt1hTlCjwkMbwMP+i50vVpJOTmnckEmN/pwZcs9d+bo0tysoIJ0zqjf23NiTt0yhK
         X3oQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785296657; x=1785901457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5SQzLZmnmAyoTu35635s72269K1LO99EjP1yPHjEts=;
        b=CTnCtXdzef/jdfggN8bF2V4699tyq6rqNSvi8Dn6KfFpFlkNu0IqNHPHiZJnPU2uBb
         C1e5wXLKnrBbsCYtnW5SgMzwu7N3K137HvUQ9Ne11+gBdmx4308ReSrCCVRIBZQWns80
         PbFkl0O7oBcGySyL9tSiYWkLUx6SuOjajcBYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785296657; x=1785901457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5SQzLZmnmAyoTu35635s72269K1LO99EjP1yPHjEts=;
        b=eQZ9WFaL58jG9Z9hvfK6GiTKrMAxFoK795Ij7DwvxT+XpYWCGxoXnisrSbEmYwfI2O
         XU2jP4P51c0siCmg2KsGWwFbIi2Mu6wF8NXRpBSL8TQNYY6TnViL9GbJ2Q/v2SqezGLJ
         /WQxXMFTl9SVk0VoURWfaCFciE4KI1cQeEohqMA7jc5MbJGzjxkW77cYDkN/PhkRMuAi
         Yrz+D8rdJfUZBeK7Ffpf9UNGawpX13keQXhu4FQSfwWLzTH9FC+qYkOLI0892Kn1qKy9
         EeWqyPO9zQWjxFbg901dKwHsNpUzTLQDyiPILh6mfOYKfVVB/FZzgcpAFj5YYgj3KShj
         6SYA==
X-Forwarded-Encrypted: i=1; AHgh+RqffuUV9I9bPKenYSZukXAiN+sHDPUdFoBa1nwfHgtERLi57AQLJu5S1Qthd+liX+FTz0t8g+PMZ7RSCI15QqKY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7MTPTfasq76VOY7VablxbA3cbM23ZQ6ltUFFrL+Pc8WQpz1ZH
	upTNXYstoavWrDgbnCJilBJkte8N0fL0QrESLogPN1Z53pu934RrRo5iPnw6sXi2oio8leXl+f0
	fUa4bUYTmWMjBPebCym9s+hyoyGBNGvFMbXcyuxEW
X-Gm-Gg: AR+sD12abIKOwRhSI4yMSb8ZFmX29Z3rqcB6H90QEmsTMMAM/wNV8MkCIxMnS9hzXe6
	F7axVjGFTHvdgrXmuLub24c7BpDlLNaKo02IP+h5q+lb57B0mwFw+ShQO4Bdhc8g0Qw9UcZDHnX
	ftZ9wmHlh4J6elv8PDc/hpvjlhO5jeEGo7wyXhEaZi3kgbVMG0+dMxi5+SYx/exW4GkWbadBLH6
	QUure6GG1SZsofMByFvMAxDKR5SGUO6Io4lgtXaXr2cf6BXqhBkiZDm+Yhtw6a1r1NCB2lqSh8V
	aKhj9NsuLE3U9r50oOAHNzPJALGOZ0sC8jICEyYonepETuCL1bSvXGQB09taZ7c19Bw01Qr1fiQ
	=
X-Received: by 2002:a05:690c:3343:b0:808:f9bb:3832 with SMTP id
 00721157ae682-81f9912e26amr22006057b3.22.1785296656671; Tue, 28 Jul 2026
 20:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260728212438.54078-1-rosenp@gmail.com> <20260728212438.54078-3-rosenp@gmail.com>
In-Reply-To: <20260728212438.54078-3-rosenp@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Jul 2026 11:44:04 +0800
X-Gm-Features: AUfX_mySigGaf9N_bx5P2m2Z30yXuSp7TjHLme6C1EdwCx1nkTn3oRTu9esXu2Y
Message-ID: <CAGXv+5EVSc4=ug=GU6Gvdu0UatqM1DD48i-c3AEb4p0GwktRvg@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] Input: mtk-pmic-keys: Count available keys during
 probe instead of pre-counting
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_204418_037514_751DB658 
X-CRM114-Status: GOOD (  28.09  )
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

On Wed, Jul 29, 2026 at 5:25=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Replace the separate of_get_available_child_count() pre-count and
> validation step with a single pass through
> for_each_child_of_node_scoped().  Skip unavailable child nodes and
> bail if more than MTK_PMIC_MAX_KEY_COUNT available keys are found.

This actually fixes a small bug. The pre-count only gets the number
of available keys, but the subsequent for_each_child block doesn't
skip over the unavailable ones, so if an unavailable node is in
the middle of the tree, there could end up being a mismatch.

> Set nkeys after the loop so suspend/resume iterate only over
> initialized entries.  Use a local key variable in the loop for
> clarity.
>
> Add an irq > 0 guard to the suspend/resume wakeup paths so that
> uninitialized key entries are safely skipped.

You are trying to do too much in one patch. These other fixes should be
in separate patches.

And why not just modify the driver to keep "nkeys", so that it knows
how many entries are valid? No use in iterating over empty entries.


> Assisted-by: OpenCode:BigPickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 71 ++++++++++++--------------
>  1 file changed, 34 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keybo=
ard/mtk-pmic-keys.c
> index fd684ac16938..e2ced6e5165a 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -267,7 +267,7 @@ static int mtk_pmic_keys_suspend(struct device *dev)
>         int index;
>
>         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> -               if (keys->keys[index].wakeup) {
> +               if (keys->keys[index].irq > 0 && keys->keys[index].wakeup=
) {
>                         enable_irq_wake(keys->keys[index].irq);
>                         if (keys->keys[index].irq_r > 0)
>                                 enable_irq_wake(keys->keys[index].irq_r);
> @@ -283,7 +283,7 @@ static int mtk_pmic_keys_resume(struct device *dev)
>         int index;
>
>         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> -               if (keys->keys[index].wakeup) {
> +               if (keys->keys[index].irq > 0 && keys->keys[index].wakeup=
) {
>                         disable_irq_wake(keys->keys[index].irq);
>                         if (keys->keys[index].irq_r > 0)
>                                 disable_irq_wake(keys->keys[index].irq_r)=
;
> @@ -324,13 +324,13 @@ MODULE_DEVICE_TABLE(of, of_mtk_pmic_keys_match_tbl)=
;
>  static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  {
>         int error, index =3D 0;
> -       unsigned int keycount;
>         struct mt6397_chip *pmic_chip =3D dev_get_drvdata(pdev->dev.paren=
t);
>         struct device_node *node =3D pdev->dev.of_node;
>         static const char *const irqnames[] =3D { "powerkey", "homekey" }=
;
>         static const char *const irqnames_r[] =3D { "powerkey_r", "homeke=
y_r" };
>         struct mtk_pmic_keys *keys;
>         const struct mtk_pmic_regs *mtk_pmic_regs;
> +       struct mtk_pmic_keys_info *key;
>         struct input_dev *input_dev;
>
>         keys =3D devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
> @@ -353,45 +353,42 @@ static int mtk_pmic_keys_probe(struct platform_devi=
ce *pdev)
>         input_dev->id.product =3D 0x0001;
>         input_dev->id.version =3D 0x0001;
>
> -       keycount =3D of_get_available_child_count(node);
> -       if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
> -           keycount > ARRAY_SIZE(irqnames)) {
> -               dev_err(keys->dev, "too many keys defined (%d)\n", keycou=
nt);
> -               return -EINVAL;
> -       }
> -
>         for_each_child_of_node_scoped(node, child) {
> -               keys->keys[index].regs =3D &mtk_pmic_regs->keys_regs[inde=
x];
> -
> -               keys->keys[index].irq =3D
> -                       platform_get_irq_byname(pdev, irqnames[index]);
> -               if (keys->keys[index].irq < 0)
> -                       return keys->keys[index].irq;
> -
> -               if (mtk_pmic_regs->key_release_irq) {
> -                       keys->keys[index].irq_r =3D platform_get_irq_byna=
me(pdev,
> -                                                                        =
 irqnames_r[index]);
> -
> -                       if (keys->keys[index].irq_r < 0)
> -                               return keys->keys[index].irq_r;
> +               if (index >=3D MTK_PMIC_MAX_KEY_COUNT) {
> +                       dev_err(&pdev->dev, "too many keys defined\n");
> +                       return -EINVAL;
>                 }
>
> -               error =3D of_property_read_u32(child,
> -                       "linux,keycodes", &keys->keys[index].keycode);
> -               if (error) {
> -                       dev_err(keys->dev,
> -                               "failed to read key:%d linux,keycode prop=
erty: %d\n",
> -                               index, error);
> -                       return error;
> +               if (of_device_is_available(child)) {

Instead of re-indenting the whole block and making the diff huge and
unreadable, please make this skip over the remaining code when the
condition fails, i.e.:

                  if (!of_device_is_available(child))
                          continue;

Or better yet, just use for_each_available_child_of_node_scoped() { ... }
instead.

I normally suggest people read the API docs (either on docs.kernel.org
or the kernel-doc sections in the code) to find better suited constructs
to use.


Thanks
ChenYu

> +                       key =3D &keys->keys[index];
> +                       key->regs =3D &mtk_pmic_regs->keys_regs[index];
> +
> +                       key->irq =3D platform_get_irq_byname(pdev, irqnam=
es[index]);
> +                       if (key->irq < 0)
> +                               return key->irq;
> +
> +                       if (mtk_pmic_regs->key_release_irq) {
> +                               key->irq_r =3D platform_get_irq_byname(pd=
ev, irqnames_r[index]);
> +                               if (key->irq_r < 0)
> +                                       return key->irq_r;
> +                       }
> +
> +                       error =3D of_property_read_u32(child, "linux,keyc=
odes", &key->keycode);
> +                       if (error) {
> +                               dev_err(keys->dev,
> +                                       "failed to read key:%d linux,keyc=
ode property: %d\n",
> +                                       index, error);
> +                               return error;
> +                       }
> +
> +                       if (of_property_present(child, "wakeup-source"))
> +                               key->wakeup =3D true;
> +
> +                       error =3D mtk_pmic_key_setup(keys, key);
> +                       if (error)
> +                               return error;
>                 }
>
> -               if (of_property_read_bool(child, "wakeup-source"))
> -                       keys->keys[index].wakeup =3D true;
> -
> -               error =3D mtk_pmic_key_setup(keys, &keys->keys[index]);
> -               if (error)
> -                       return error;
> -
>                 index++;
>         }
>
> --
> 2.55.0
>
>

