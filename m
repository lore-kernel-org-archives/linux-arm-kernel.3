Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2C3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eua2YAPyWNoI872YUJ3VdyRPkVf1aMyuVYL342nj/u8=; b=zT9rKFrG03oa2HnJH61vZbMYVT
	o/pzDZbavL15YP2krSTfRGgsPm3D7AOhC23Vkefo79FrAsMDYEjvUfYV4ztCAz76QYqobErBJSRf6
	SQe3+v6Jd0rq91ttr9BgjcuTbVM1HFfHipwE7PcsYGzmpY7/hzhAmIJQgBPRJIhzSYuK2TXfV6VRG
	ISwlbO5RfMNLbA7zcgCodmX0R5Eb3ej5Bc7bHgxmj1Yd0wCV0h6Z491slTqxmjOY2QvFFEW9eNEuN
	L7dhC5roqvdbVrOoNhrWgKNAlWyeMlnRaEry1Zx5qqzmQ5thG2kMfWWItNHPb65Q4ZcbWHji+kVbA
	gpRV05iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsIR-00000004xk9-3UTC;
	Tue, 09 Sep 2025 06:57:43 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvpNF-000000043PV-2YDW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 03:50:31 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55f6186cc17so4630522e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 20:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757389827; x=1757994627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eua2YAPyWNoI872YUJ3VdyRPkVf1aMyuVYL342nj/u8=;
        b=IGeGVPcWHYGgtKdkIK9zMt/d3rBc5W8r+7K1NPXvUABSt+MSSR1UGzKfmL6CVpjJnG
         eyrgCdgjip2/dktKUY3suXeAbMWgOlFcpnyCMgZ9Ufh7v1KnNz1V1GdUGlWm3BG1+Daw
         OJQJsyRURHc6eNLC8YzrIjePa3vrLYICZtzb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757389827; x=1757994627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eua2YAPyWNoI872YUJ3VdyRPkVf1aMyuVYL342nj/u8=;
        b=Qqe4aEmuUgRkOwb7B/b/gLh7KWq4XTLrBkIm2XG15HgIx6S2bRpCmf3+hCwV0iJ8ye
         2oPCzszKYcBYIsnGdU7s+z2P2qQuu+dwTf9caukwyuLKxtI1QUeQuJpf4xB/2ro6BUYg
         WbtFRpD6eXYxJ51mj5b8Wi1x8T1LIzs0h/B56OCaOVth/AB25PwPCQtXZgiqGjU1Qfe3
         bTjbL/QdqzkUKIkF2JitqEvUwFk4q2dxgZNDiSDFzlTIZZQ1+EY/qah8oXIyFQBUCSmq
         pKthGb/MQ+COVonTkN0XsIkQs4iuEEy3h40ii+AZUTV6ZmZvJ6niWfZjfOEsg9KW8iko
         UhXg==
X-Forwarded-Encrypted: i=1; AJvYcCXlXfDxj7xkvZpA/+pho0xoVkbrNkJ3IHBDzqeElYOxYmjmn9F25U6gul8paJ3yaRp01WHDzQD18dk/jH4mhxhN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu14h7req5xhGKvYht6Ipo6ZftYfnliiVyEMbqbbs0duatHEJ3
	EddVurIkgBpyjYmOoJFNq26IMryYFGpMCHFOHH8NK7Lm32GDAtNLr+76wdBVP5y6F+Vx038ehYP
	KjknQy7Kv82PRItiytV1MD1rd4KUzVUkri639uPot
X-Gm-Gg: ASbGncsN6OHW0s6nuHaxc074w6LBD2JBmssNmxTehUXqpdmlHW0v9iA51trUIP1422X
	ENl64z03BVyzoiCZ44XQMC1k6jukuMaA4YDOeekZKLl0eGXH/jIqGGyRwOq8GITmgTEkVDHc5qh
	rtHaxji/63SNqENjfxrn1bWqD9a2QSU7TT9u+uX2jTjnfZVADoRrxlnmE/MM8FDa6TZLFhzG0dg
	RGrIgsq+8SoJ4zdpJmXANgqik5+/Yc0G556RHYxFYgDSNOq
X-Google-Smtp-Source: AGHT+IGj8MbtzCVC3eleE1z+3A7HLn2+wwQE3Dbn34sAVj1F0T1xg3I1Y5OtFtL3Vq/iIqiBfRs27XObu4ME5Ad0K9g=
X-Received: by 2002:a05:651c:e10:b0:335:2d39:efe8 with SMTP id
 38308e7fff4ca-33b5840d79bmr17650591fa.44.1757389827313; Mon, 08 Sep 2025
 20:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250906082652.16864-1-leilk.liu@mediatek.com> <zddsit53dwqo27buoxaolgpzvvvd6uvwcyzughv7qfvwg64ces@yrlrur5dkf45>
In-Reply-To: <zddsit53dwqo27buoxaolgpzvvvd6uvwcyzughv7qfvwg64ces@yrlrur5dkf45>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Sep 2025 11:50:15 +0800
X-Gm-Features: Ac12FXwAUz9S8d-8r_TaFcUSUGZ-l28LM65axRib-fNazk4pPZoYccYUgggaCpc
Message-ID: <CAGXv+5HZcZ8uVZQbT83QnWd1M6p7fXvKU-0gOfc794BxqOmw1g@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, 
	Wolfram Sang <wsa@kernel.org>, Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_205029_692347_156BB643 
X-CRM114-Status: GOOD (  24.75  )
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

On Tue, Sep 9, 2025 at 6:17=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi Leilk,
>
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-m=
t65xx.c
> > index ab456c3717db..dee40704825c 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -1243,6 +1243,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *a=
dap,
> >  {
> >       int ret;
> >       int left_num =3D num;
> > +     bool write_then_read_en =3D false;
> >       struct mtk_i2c *i2c =3D i2c_get_adapdata(adap);
> >
> >       ret =3D clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> > @@ -1256,6 +1257,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *a=
dap,
> >               if (!(msgs[0].flags & I2C_M_RD) && (msgs[1].flags & I2C_M=
_RD) &&
> >                   msgs[0].addr =3D=3D msgs[1].addr) {
> >                       i2c->auto_restart =3D 0;
> > +                     write_then_read_en =3D true;
> >               }
> >       }
> >
> > @@ -1280,12 +1282,10 @@ static int mtk_i2c_transfer(struct i2c_adapter =
*adap,
> >               else
> >                       i2c->op =3D I2C_MASTER_WR;
> >
> > -             if (!i2c->auto_restart) {
> > -                     if (num > 1) {
> > -                             /* combined two messages into one transac=
tion */
> > -                             i2c->op =3D I2C_MASTER_WRRD;
> > -                             left_num--;
> > -                     }
> > +             if (write_then_read_en) {
> > +                     /* combined two messages into one transaction */
> > +                     i2c->op =3D I2C_MASTER_WRRD;
>
> i2c doesn't change for the whole loop so that it can be set only
> once outside the loop instead of setting it everytime.
>
> Something like this:
>
>         if (i2c->op =3D=3D I2C_MASTER_WRRD)
>                 left_num--;
>         else if (msgs->flags & I2C_M_RD)
>                 ...
>         else
>
> looks cleaner to me and we save the extra flag. Am I missing
> anything?

It looks correct to me, though I think it requires a comment explaining
that "in the WRRD case there are only two messages that get processed
together, and the while loop doesn't actually iterate", and reference
the block where the WRRD op is set.

Otherwise someone is going to look at this snippet and think there's
some corner case where all messages (# of messages > 2) get handled
using the WRRD op.

So maybe it looks cleaner, but it requires more context to understand.
Whereas in the original patch, the extra variable sort of gives that
context. In this case I prefer the context being more visible, since
the original corner case this issue fixes is also from missing context
and assumptions.


ChenYu

> Andi
>
> > +                     left_num--;
> >               }
> >
> >               /* always use DMA mode. */
> > @@ -1293,7 +1293,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *=
adap,
> >               if (ret < 0)
> >                       goto err_exit;
> >
> > -             msgs++;
> > +             if (i2c->op =3D=3D I2C_MASTER_WRRD)
> > +                     msgs +=3D 2;
> > +             else
> > +                     msgs++;
> >       }
> >       /* the return value is number of executed messages */
> >       ret =3D num;
> > --
> > 2.46.0
> >

