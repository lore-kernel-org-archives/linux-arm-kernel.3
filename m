Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DCFCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=; b=gYAeWSWUdRAzWrdDB0AterYxPK
	BcdurBjIidn/R7D7QCRKcEPXRTBO6I9X0Bv7g5WijO5eNIbsi/nFNSFiT0MvsOOj6Oe6JeU+LS8Pw
	oEHAK1CWA36UvWosAMHGCA0tm2kvXjF/OkTIWq22kMq9iBUCXIUn86a2ICogft4gvbCv0ufWNHyXj
	vnsjHdvthh1CMHJCGbM2CG8GFfT2wi0F2M0Ke7VpxP8CprdezZQnS4TYRogkQMDgXRxTJkWmANfWX
	ovEUFjpEcA4qHG2zaWqB3wdu4IdzIGD+5HlZHJeFy/nb5KDtlAOTr6jPwegGMOZ/y9AKRcDUzNtrK
	RT490Ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJvq-00000001Xji-1hyt;
	Tue, 19 May 2026 12:52:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJvn-00000001Xi7-2D0K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:52:21 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bcd0111ea98so542512966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 05:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779195137; cv=none;
        d=google.com; s=arc-20240605;
        b=B2L4GqjikDfzhJKXzFjpXy0Pq1gO5iiVE9TZdKdJDsdzDp9UG0fkgMI8eJizMOEfPq
         Wtnow6GwpZSGiL9d5Yi+rw5VcaxPOXUmLVUKpZGHCM3PFrx9h61nGw8KKBAnZy0yFwTC
         Iw6Ch1FReNyL0JQUPPtfk5tOGvNMxkJeS65V79+cgu2cHppUtDAdINBqG54VOBQTyOUm
         xE3wVw4cZq+JuTtRlqhu9KI4tBY/kaJYmdWMO/JfAKkhQN7UBMuO20HP4G/YPHPylH0l
         5H8JLeU4vDqDIuif8weOEGz9hSiKUkNPs7O7irCdJzrhHeh/QoDZN/gQdBhiU6ehfnca
         Gwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        fh=+sCHxN/rhAnWCOgCKJGmTtCFuTqfdBxkUfGXxtOlkzY=;
        b=fw8bmNywvBCuytKPJ+w2k9eV2+isFlcuMEw/HjR1y71SQsRcaTo/pNmf9I3My7ZDAt
         TgIHSRTV8m94gzV5OniSqm2PUgCW/3XNwmFCMLJZxKzTr2V3QUTa+bYJr54wzvjt8CZJ
         LM3+D77YCKHTme9+Ru3BYTdczLSZEsIDYzus+5dJtLDwjbbBESOfXybKlgnBxlgi0I/Z
         RXzsIfLTQVi+Ya/40208ySQe7dkrea/mdT4B8ae3X06xKwO5LYI0SQiL/hNb3PBg1GRH
         L/v4FgQRn0L+i3eIdqKkuEp+NXpcHeYBcjhrY/Gu7+tOidiBcG5Rhgc52OGCneMaBiIc
         MSbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195137; x=1779799937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        b=MSCzsuhix0bX/rczClB5NCAP/8rj6RmhYrKJKSH3fwVJ9fpzWKCAKDXSbhA0x61cQA
         S9O57t9qodtG4QpG5/vY8d+8w+lSa63PxskEEMUWyujeaIXVtSO1Rwy+nuIMTMT5ps/q
         vUSZk7nTZwB4Bc4SF2oQP0YNX+nB4dFE+7GuEAM3uSlZHN4oilKdYNWR4pOc1+UlQnpi
         aohw4dSR2So0tG1kAKJuGNpPpU7QVBa7C+fiZ+raDE3vsi46StOm7hmrX/r1oS+dVThc
         N8uhBU2jN6HS73lqOpo1jAY4vH5UY9E0VoohnTQ01mIh57odTth6t1Cpbg3zqbzEPg/W
         QZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195137; x=1779799937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        b=Iqe0mzq+0QKtnStBSvr8BrZXF2TFQTuqU7x5yO2XhFE9ZD6D1YdXxu7IluCN7PHm9Q
         5wfzICwIaQJN5cifDauHa6QgBvP/XgX8kww2NDWQC+5BPtwi30/LmghUdFzOF5uiHpma
         MghQFgQTc9epU1AGG+gZ+qAMR7cvZXJss34wrsk1X7IE4wsPWov9Nc+Wav+QXloEJrYU
         5b1CjuTYLb6kK+00sRb4I7o4nIREahrh9ab8o0C43UJZUpzTHO79+jkWJ27eMKCjwNeo
         Bl9u3VpSn9hRH6VC4QoSvd/KqjCNXivKB5YODtHJCmGl7hQkfX4krfaLUCmRUUFKkO4K
         LvwA==
X-Forwarded-Encrypted: i=1; AFNElJ/TEEiYSnmwSh9ie5DMTtU+IfRpacxSVuq4MItITGGpEBV2qZNY4pnpbRUZyqNJjkEIs3pYK6nTVKOU7BMs+360@lists.infradead.org
X-Gm-Message-State: AOJu0Yzda8o1zCT8t4LAB4AIp6otTSAurbLxw/TRWjSzEZSQ4DvBSOph
	YRBGkTT7EtvWums8seG8hBf4+jNOimT3icQ48JHCyXZeOy3oSvpMHRT+jIdAXqXGGbF+MH1EfOQ
	AfWdFb/gdRsmn0CYpXzY5qipwqPfqTJc=
X-Gm-Gg: Acq92OHDaqGO5cd8KpPjbHbK7CU+2Fp4RN9hreHLis9FIU/XXXG0QMGuP2RrZnETsi9
	vP4N3QHxEjm1cJHQWsIdnzZ11X9y8yM2ieySPpNQ/FPQmL1naAAdwcZknYJS+9E2w+fuzl3vxmK
	XxaT45662VjeOztmJKQeouJoEOs+l0ez49mk5nqdCf+mY4dXvVNEPbKWIDdmQlKVfoCP3RPFoQj
	ZKVqU9xqJuDQ1C8/+W+WWqoVvvLskRQiHtYCHf9itPvUcFgzHLC0xnxIOnMTtCJFuGlu2VxEiOz
	PA21mg==
X-Received: by 2002:a17:907:971b:b0:bd8:61ff:f916 with SMTP id
 a640c23a62f3a-bd86200058amr420267566b.44.1779195136644; Tue, 19 May 2026
 05:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260321065408.209723-1-linux.amoon@gmail.com> <49260ed9ce09b0684ed72787b5635e2c26059297.camel@ndufresne.ca>
In-Reply-To: <49260ed9ce09b0684ed72787b5635e2c26059297.camel@ndufresne.ca>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 19 May 2026 18:21:58 +0530
X-Gm-Features: AVHnY4JJCSZj_mhTfm6UH5xrsKXtX_jQr95CpJqy1MIGyRQBSz4PwDNhz0eVEgg
Message-ID: <CANAwSgRf-pPwsqfXTALrnYV2e7K9bkbOzNrrFjB5pA0QjT1hhg@mail.gmail.com>
Subject: Re: [PATCH v2] media: meson: vdec: Fix memory leak in error path of vdec_open
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan <mjourdan@baylibre.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_055219_596943_F2264C7D 
X-CRM114-Status: GOOD (  28.12  )
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

Hi Nicolas.

Thanks for your review comments
On Fri, 8 May 2026 at 23:28, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Hi,
>
> sorry I missed your patch, catching up now.
>
>
> Le samedi 21 mars 2026 =C3=A0 12:24 +0530, Anand Moon a =C3=A9crit :
> > The vdec_open and vdec_close functions in the Meson VDEC driver failed
> > to release several resources, leading to memory leaks and potential
> > use-after-free scenarios.
> >
> > This patch addresses:
> > - Missing v4l2_ctrl_handler_free() in both the close path and error
> >   exit of the open path, preventing control memory leaks.
> > - A leak of the M2M context if vdec_init_ctrls() failed.
> >
> > The error labels in vdec_open() have been reordered to ensure a proper
> > Last-In-First-Out (LIFO) teardown of all initialized resources.
> >
> > This was identified via kmemleak:
> > unreferenced object 0xffff0000205d6878 (size 8):
> >   comm "v4l_id", pid 5289, jiffies 4294938580
> >   hex dump (first 8 bytes):
> >     40 d2 49 18 00 00 ff ff                          @.I.....
> >   backtrace (crc d3204599):
> >     kmemleak_alloc+0xc8/0xf0
> >     __kvmalloc_node_noprof+0x60c/0x850
> >     v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
> >     vdec_open+0x1f4/0x788 [meson_vdec]
> >     v4l2_open+0x144/0x460 [videodev]
> >     chrdev_open+0x1ac/0x500
> >     do_dentry_open+0x3f0/0xfe8
> >     vfs_open+0x68/0x320
> >     do_open+0x2d8/0x9a8
> >     path_openat+0x1d0/0x4f0
> >     do_filp_open+0x190/0x380
> >     do_sys_openat2+0xf8/0x1b0
> >     __arm64_sys_openat+0x13c/0x1e8
> >     invoke_syscall+0xdc/0x268
> >     el0_svc_common.constprop.0+0x178/0x258
> >     do_el0_svc+0x4c/0x70
> >
> > Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> > Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gma=
il.com/
> >    tried to address the issue reported by Nicolas
> >    improve the commit message.
> > ---
> >  drivers/staging/media/meson/vdec/vdec.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c
> > b/drivers/staging/media/meson/vdec/vdec.c
> > index 4b77ec1af5a76..3a5e4ebe0b34c 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -877,7 +877,7 @@ static int vdec_open(struct file *file)
> >       if (IS_ERR(sess->m2m_dev)) {
> >               dev_err(dev, "Fail to v4l2_m2m_init\n");
> >               ret =3D PTR_ERR(sess->m2m_dev);
> > -             goto err_free_sess;
> > +             goto err_m2m_release;
>
> If m2m_dev creation failed, why do you want to call v4l2_m2m_release() ?
>
I don=E2=80=99t recall the exact details, but the current handling appears =
incorrect.
I=E2=80=99ve prepared the following fix to resolve the issue, based on
sashiko=E2=80=99s suggestion.

[1] https://sashiko.dev/#/patchset/20260321065408.209723-1-linux.amoon%40gm=
ail.com

-----8<----------8<--------
$ git diff drivers/staging/media/meson/vdec/vdec.c
diff --git a/drivers/staging/media/meson/vdec/vdec.c
b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..a039d925c0fe 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -889,7 +889,7 @@ static int vdec_open(struct file *file)

        ret =3D vdec_init_ctrls(sess);
        if (ret)
-               goto err_m2m_release;
+               goto err_m2m_ctx_release;

        sess->pixfmt_cap =3D formats[0].pixfmts_cap[0];
        sess->fmt_out =3D &formats[0];
@@ -913,6 +913,8 @@ static int vdec_open(struct file *file)

        return 0;

+err_m2m_ctx_release:
+       v4l2_m2m_ctx_release(sess->m2m_ctx);
 err_m2m_release:
        v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
-----8<----------8<--------

Thanks
-Anand

