Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E12C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 04:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNQXtzIynC28TDaE/Ql1n0+KoVl8k9chZuF6STvMMrI=; b=o5VMeNPdBNIS5mrphoJBTpylG8
	j2fY8VhICTsOa6ydSrq+afv7By09nF1DD1/6mmcZztVBaHNsmtD09mX+SWUiudZ5efd+TaRzJXM5J
	3ET1+Y8d06bRlVSkPbC83D1OL+X1UhxwlZdFN4wWZcltpnqtCnv42ORI49XgsKoU8Pia4UL18fk6I
	BLbcGRvdLZC8JxTZwQP9deHenD05IKn9Kj/2o/XjTYzHxB0fT4p5boPtVEmjTnVZGzCH/lE+QBTLt
	maRNCjS//8HjFo3WiEz2MFXPzAcf1X6yNdFItuFEB/g1sOs2uE9z2gC/LWpV8859iiu1gvDqDDdPC
	v6ONBR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIm7-00000009Vkj-0v69;
	Thu, 30 Jul 2026 04:53:43 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIm4-00000009Vk5-0sGw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 04:53:42 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-81ee41aaec1so25706417b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 21:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785387219; cv=none;
        d=google.com; s=arc-20260327;
        b=b0GU9vSWZTcM3cuH3+OC+6c7slWSrlTEMOFPYtCsChW+vtO2tjghRGPpT4sPjJt89V
         K3O+fGdZwm2oO/zEN1lCL9FtfHWysefYPzBoEpUqf6EgP/MpdKZZbJ9VgWXsfqd5Dh0R
         mTH7LbZRp5OYfOqcUnPnZ2w7wPRCNshbdMzCRm+A+PlYxtmPH+cs+Y3P7T2gC9k6nIgw
         ecy8Rb2LK16zjMtf2h0WfpcYmBMTHB9MKL4WAIDApzW00KDcwNOk9kWKmbecYG7MC0nP
         qdxC4fHQSbqle7BUDBoR8+uD+GwZLH6VIB3HRO+q0vJk54na6qoQO2jgBQzne+DwLFaZ
         DFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kNQXtzIynC28TDaE/Ql1n0+KoVl8k9chZuF6STvMMrI=;
        fh=bUsPyYtjukg6B89Dq7vUuUi0KGv+VNGyIWvUE6Jpea8=;
        b=M6HHphfJEGsBGqbSXsIYpHpOpumS77EDPtr0jPpZ52NYdho9aLGLRUN8JdQ7n92luE
         /DJWJkuc7Zib5JaMOWdOmagpcuPkSrns9KX9EUezL035bmz5zhQ8wdQsHc8HWRghB9Xm
         LZFhznXax1QjKw+aF7INPoZDFA+/38oiC2OGxT6hSB6S7gIatgTFKupA2G28K6q5pM/3
         5b00oF2r5SSRhbFSDu9GtAYdT2PuuCQ8LLwaef0VN70V+QarVBTtDXBC0+0UDAKBXo4W
         AnJ5TMc7rbfv5M0Q8Gu0YV3CKJaBRBqhj7X/yDWUKO63nzUPOKe9HDau7CprC069nJuD
         GTZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785387219; x=1785992019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kNQXtzIynC28TDaE/Ql1n0+KoVl8k9chZuF6STvMMrI=;
        b=QQ3eR7z3nhSwJbgnXd1DWXaa35LGJ74r++hpRpK9cHB6+36AM7j6YqIIyBju7ZUcQw
         WItA2nEpjJQ2wN/2HbJtcTbP7IB8gobEbfV/UDm/JeF6VsNS3RCx2Dz+QAHlBZIHdkZG
         hEuOJZNHlvHXztdqdi2Lt3KALwV6sJNu5sndI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387219; x=1785992019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNQXtzIynC28TDaE/Ql1n0+KoVl8k9chZuF6STvMMrI=;
        b=LQ3XCXv074Vx18rJP8RJb1BLPBxrkylRQ4FM5b1gcm0TlNMQNKtY61VEw7H2Z/Jy/B
         ApshMtY9WXhNl1GyBFvaJfE1/GU9yfT7KuueA3Fh/gC0kFSru9UjVvHIWzQeNj8pTs1K
         7RAzcvbvREzYFaYIUpwZSl9BUUMNRZtFUbhnC8EPD5b2MCgFlTE3iqmxZ/J1A2A1NYHp
         vpvDrgOvptbYZQeT5m+9OUeOiOllrTXazF33J/U2X8WqHVugvxBlXYq7/LcxV187KD5Z
         +eXCXhUU4r9WYiGxx7Jh92hzgxXdDNzsNS/Q7kDdPzCqgjwPP9KJHQGGkcYoYXds+d/x
         wpMA==
X-Forwarded-Encrypted: i=1; AHgh+RpvdxgABfonZL4Bt2aC0IIQELWL8mLtlSEZV4oO3edzkqEzYQ8DD4CYk2Gqas1r+3c7FnJKPSYaSRX7Y9+d69AK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2SPPWD/i8UZW0SQp6fM3EflCewHGz93DFLaaDxsK9xFiBxjTU
	KQBotIbVburBpzp8LlS4T9Mqs+mf9dUWMRoJqb0glMwZ4jfc/x64iFgsLJba/Jz88QUmfRRbJQr
	2vuGhAExwS+Lgo5d/tJPMRvDEqD8uXUsgZguiACe/
X-Gm-Gg: AR+sD13wD8Zhevw4Gk35eKGlJgm07+3B6MqZkUpIibxu5Num+WWcleeT+YN8nw+RB6V
	/A1goiqaMh+wO3aiikS4DTEGGnZx4Wdle9c6D00aZM4XBoRQpcrTWPwnWqk6sLAc9Q9ZCGK2B+K
	QZVI04nyuE8heYh5ujqAJDTOKgpzGjjTC2s9fRC1sY5yoGumu0Dp2i+SURt3CtM4bFJqgcS+iW5
	U4ryQlX56bm4IWTzMmE245eeDLqsbMpDV2YNlo8m8EcKAeuhbBrIxTozBedntjbLnTmV7q0frd0
	2D29CKL6DIHoD8YGEFkI/Kba0LwpBtS9RULHSaIVCQ9TJ7k4/9cPFZ2olVpuTiE6GUrLRSXT0od
	SQyK7XPG0FkQ=
X-Received: by 2002:a05:690c:c503:b0:81c:eca8:b31f with SMTP id
 00721157ae682-81fb8a840f3mr6908137b3.39.1785387218988; Wed, 29 Jul 2026
 21:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260728212438.54078-1-rosenp@gmail.com> <20260728212438.54078-3-rosenp@gmail.com>
 <CAGXv+5EVSc4=ug=GU6Gvdu0UatqM1DD48i-c3AEb4p0GwktRvg@mail.gmail.com> <CAKxU2N8VeE+xPGZ-41nqDCtk_LA_PvgzjrUbnOZ-5JmEb-uKHg@mail.gmail.com>
In-Reply-To: <CAKxU2N8VeE+xPGZ-41nqDCtk_LA_PvgzjrUbnOZ-5JmEb-uKHg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Jul 2026 12:53:28 +0800
X-Gm-Features: AUfX_mw6g8L8q-LQMW-CQgvcfpzwOR1hh-FNl8gdfMDgDPM6vfWXNYP6-KfvIvo
Message-ID: <CAGXv+5F+a_ZdbtX+ApHdOC0884EfUdkULVkaY=nipFX0JgCZNw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260729_215340_328230_77EAF5C6 
X-CRM114-Status: GOOD (  37.92  )
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

On Thu, Jul 30, 2026 at 2:34=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> On Tue, Jul 28, 2026 at 8:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Wed, Jul 29, 2026 at 5:25=E2=80=AFAM Rosen Penev <rosenp@gmail.com> =
wrote:
> > >
> > > Replace the separate of_get_available_child_count() pre-count and
> > > validation step with a single pass through
> > > for_each_child_of_node_scoped().  Skip unavailable child nodes and
> > > bail if more than MTK_PMIC_MAX_KEY_COUNT available keys are found.
> >
> > This actually fixes a small bug. The pre-count only gets the number
> > of available keys, but the subsequent for_each_child block doesn't
> > skip over the unavailable ones, so if an unavailable node is in
> > the middle of the tree, there could end up being a mismatch.
> >
> > > Set nkeys after the loop so suspend/resume iterate only over
> > > initialized entries.  Use a local key variable in the loop for
> > > clarity.
> > >
> > > Add an irq > 0 guard to the suspend/resume wakeup paths so that
> > > uninitialized key entries are safely skipped.
> >
> > You are trying to do too much in one patch. These other fixes should be
> > in separate patches.
> >
> > And why not just modify the driver to keep "nkeys", so that it knows
> > how many entries are valid? No use in iterating over empty entries.
> >
> >
> > > Assisted-by: OpenCode:BigPickle
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/input/keyboard/mtk-pmic-keys.c | 71 ++++++++++++------------=
--
> > >  1 file changed, 34 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/k=
eyboard/mtk-pmic-keys.c
> > > index fd684ac16938..e2ced6e5165a 100644
> > > --- a/drivers/input/keyboard/mtk-pmic-keys.c
> > > +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> > > @@ -267,7 +267,7 @@ static int mtk_pmic_keys_suspend(struct device *d=
ev)
> > >         int index;
> > >
> > >         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> > > -               if (keys->keys[index].wakeup) {
> > > +               if (keys->keys[index].irq > 0 && keys->keys[index].wa=
keup) {
> > >                         enable_irq_wake(keys->keys[index].irq);
> > >                         if (keys->keys[index].irq_r > 0)
> > >                                 enable_irq_wake(keys->keys[index].irq=
_r);
> > > @@ -283,7 +283,7 @@ static int mtk_pmic_keys_resume(struct device *de=
v)
> > >         int index;
> > >
> > >         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> > > -               if (keys->keys[index].wakeup) {
> > > +               if (keys->keys[index].irq > 0 && keys->keys[index].wa=
keup) {
> > >                         disable_irq_wake(keys->keys[index].irq);
> > >                         if (keys->keys[index].irq_r > 0)
> > >                                 disable_irq_wake(keys->keys[index].ir=
q_r);
> > > @@ -324,13 +324,13 @@ MODULE_DEVICE_TABLE(of, of_mtk_pmic_keys_match_=
tbl);
> > >  static int mtk_pmic_keys_probe(struct platform_device *pdev)
> > >  {
> > >         int error, index =3D 0;
> > > -       unsigned int keycount;
> > >         struct mt6397_chip *pmic_chip =3D dev_get_drvdata(pdev->dev.p=
arent);
> > >         struct device_node *node =3D pdev->dev.of_node;
> > >         static const char *const irqnames[] =3D { "powerkey", "homeke=
y" };
> > >         static const char *const irqnames_r[] =3D { "powerkey_r", "ho=
mekey_r" };
> > >         struct mtk_pmic_keys *keys;
> > >         const struct mtk_pmic_regs *mtk_pmic_regs;
> > > +       struct mtk_pmic_keys_info *key;
> > >         struct input_dev *input_dev;
> > >
> > >         keys =3D devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
> > > @@ -353,45 +353,42 @@ static int mtk_pmic_keys_probe(struct platform_=
device *pdev)
> > >         input_dev->id.product =3D 0x0001;
> > >         input_dev->id.version =3D 0x0001;
> > >
> > > -       keycount =3D of_get_available_child_count(node);
> > > -       if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
> > > -           keycount > ARRAY_SIZE(irqnames)) {
> > > -               dev_err(keys->dev, "too many keys defined (%d)\n", ke=
ycount);
> > > -               return -EINVAL;
> > > -       }
> > > -
> > >         for_each_child_of_node_scoped(node, child) {
> > > -               keys->keys[index].regs =3D &mtk_pmic_regs->keys_regs[=
index];
> > > -
> > > -               keys->keys[index].irq =3D
> > > -                       platform_get_irq_byname(pdev, irqnames[index]=
);
> > > -               if (keys->keys[index].irq < 0)
> > > -                       return keys->keys[index].irq;
> > > -
> > > -               if (mtk_pmic_regs->key_release_irq) {
> > > -                       keys->keys[index].irq_r =3D platform_get_irq_=
byname(pdev,
> > > -                                                                    =
     irqnames_r[index]);
> > > -
> > > -                       if (keys->keys[index].irq_r < 0)
> > > -                               return keys->keys[index].irq_r;
> > > +               if (index >=3D MTK_PMIC_MAX_KEY_COUNT) {
> > > +                       dev_err(&pdev->dev, "too many keys defined\n"=
);
> > > +                       return -EINVAL;
> > >                 }
> > >
> > > -               error =3D of_property_read_u32(child,
> > > -                       "linux,keycodes", &keys->keys[index].keycode)=
;
> > > -               if (error) {
> > > -                       dev_err(keys->dev,
> > > -                               "failed to read key:%d linux,keycode =
property: %d\n",
> > > -                               index, error);
> > > -                       return error;
> > > +               if (of_device_is_available(child)) {
> >
> > Instead of re-indenting the whole block and making the diff huge and
> > unreadable, please make this skip over the remaining code when the
> > condition fails, i.e.:
> >
> >                   if (!of_device_is_available(child))
> >                           continue;
> Yeah probably better.
> >
> > Or better yet, just use for_each_available_child_of_node_scoped() { ...=
 }
> > instead.
> In v1 this is exactly what I did and was told not to.

I see now that the interrupts are tied to each key in order, regardless
whether the key is enabled or not. for_each_available_child_of_node_scoped(=
)
is not the right thing to use indeed.

Could you add this bit of context to the commit message?


Thanks
ChenYu

> >
> > I normally suggest people read the API docs (either on docs.kernel.org
> > or the kernel-doc sections in the code) to find better suited construct=
s
> > to use.
> >
> >
> > Thanks
> > ChenYu
> >
> > > +                       key =3D &keys->keys[index];
> > > +                       key->regs =3D &mtk_pmic_regs->keys_regs[index=
];
> > > +
> > > +                       key->irq =3D platform_get_irq_byname(pdev, ir=
qnames[index]);
> > > +                       if (key->irq < 0)
> > > +                               return key->irq;
> > > +
> > > +                       if (mtk_pmic_regs->key_release_irq) {
> > > +                               key->irq_r =3D platform_get_irq_bynam=
e(pdev, irqnames_r[index]);
> > > +                               if (key->irq_r < 0)
> > > +                                       return key->irq_r;
> > > +                       }
> > > +
> > > +                       error =3D of_property_read_u32(child, "linux,=
keycodes", &key->keycode);
> > > +                       if (error) {
> > > +                               dev_err(keys->dev,
> > > +                                       "failed to read key:%d linux,=
keycode property: %d\n",
> > > +                                       index, error);
> > > +                               return error;
> > > +                       }
> > > +
> > > +                       if (of_property_present(child, "wakeup-source=
"))
> > > +                               key->wakeup =3D true;
> > > +
> > > +                       error =3D mtk_pmic_key_setup(keys, key);
> > > +                       if (error)
> > > +                               return error;
> > >                 }
> > >
> > > -               if (of_property_read_bool(child, "wakeup-source"))
> > > -                       keys->keys[index].wakeup =3D true;
> > > -
> > > -               error =3D mtk_pmic_key_setup(keys, &keys->keys[index]=
);
> > > -               if (error)
> > > -                       return error;
> > > -
> > >                 index++;
> > >         }
> > >
> > > --
> > > 2.55.0
> > >
> > >

