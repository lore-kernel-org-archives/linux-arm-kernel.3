Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A85FCC066
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOnT09156mz9ztAxUhNe8PpOupeAedlDQCuib5+icu0=; b=4o6b1X1ZxvzS/PbdVDoSgYhQ9G
	ikU43KVJUmNjgqFyBkXEYvN+6srYNnmhxhk5xIr2nJsgavhk+fcWfYkhQLslFRI8KxmBbX8UJlf7T
	nJWcG67axiPrijgjbjpZUrLYIkFZkCW1Fj7/DXeB5tEDOb4wuJTk7zT/110qK/y6B9IKCVgeLFuFC
	+slYz5XYU29eZwBJHAkTVUJWKkg9/pGrPKw0KpQymjs4yg1PNblpUq79UwDgnhsdtxM6aPvWv3XuT
	9H/e7VR6ZYjtUN1uTUoYV8JYvZKnAaP/COYIvK5hEU2ZUPPioV6iXdpkg2SktLeZRkbIVm+XX8SC7
	iCQQhLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyanZ-00000004Oov-3WZY;
	Fri, 06 Mar 2026 19:25:21 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyanW-00000004OoF-1yYO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:25:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b9434f706a2so95347966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:25:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772825116; cv=none;
        d=google.com; s=arc-20240605;
        b=d/ao3ZvX4ug/tDWCLhOOgMucZqznTo14WUqkoCiXefMxfu2u6sRpLEXcsfzRYaj7BE
         kBaO+CWhSD96zUZEZLt0LMiiMmeKR600RKVNFifFEs0jyKjFc15Gu2Uy7VZDKANvdAbF
         8zAel275pFy/kraX8nQ0D53rucL+jg1GWhx/RtW0UOFSzBgy+eqrXQBlkFW2tWR7IpsR
         llVyZH1hiXNJr6l7h4IkJSQjzH/rY6XHi0UniPfKWpEI3zEtKvDqsXlVrTnxgMFpAVtm
         nUbLB+9usqmrjw00x3Trr4pxTcV7QNnb5i2jA87mf0eAY5LMsvHBiBgz8KjU6kVUuDjB
         4XrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOnT09156mz9ztAxUhNe8PpOupeAedlDQCuib5+icu0=;
        fh=qeDk+pRClekzMc2gTc0FsoGfE24K3otJIg2MJBzuYt4=;
        b=hKz58hcxpcFI1iL3DhgkoLR9QJ1ZDHBzA+h8rDWQEHE6WWVYh8OoB4sbFrHVK4Vk6D
         fW2FP1KRxnwftrtNUr6MhLGCwMLeHQzIG/E5/T8r/VNEGJHJxEjx7Aj2ZV+OnovRJAzy
         tiB/zCLL8iBNANqh8xtvF4WUolhnVDWI57bzjn2W9VY4vIrSZwuBKhQawYl7cz+3raLU
         DiCUOdQs/YArYKaJmClx0iLtZuQ5oRwD4F91GsaPe+uMZMapqoMTTKSAyyYFflNUKmO9
         2utPF8ANrjAf6e1njVVqCMokSemnd3/WqTANZo/glSu1JbJp5GwbogHhkIOOikPGN7xT
         5PdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772825116; x=1773429916; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOnT09156mz9ztAxUhNe8PpOupeAedlDQCuib5+icu0=;
        b=ngmS6mZ2g8tP5RFAD4F/KYAd3exBHsPI9QpiGWeoQvLSDjAJXObsGJQx3jtKP12yLK
         onlhv5ufn6BcYYiWaE4S1BfcclvpSqcJWFnH7WmOqLa/AayyWLNIQtJxf/NhPRb97rag
         mKowK2c5uRgG8jse9fGaQC3GdDfuNmZbkmzPjH+QIT8gkLgwVcld3Yj1rCxVsk25SdgK
         4qtM34ilqbhG6RTU/HSG3hDKTB4uf1ypVA9QKJOVAhHFjLvCj92wARpMlY4UY8RR1+9t
         UAPUYVS88j5Tfd5RRnh+XPA2mPF99nMqU3MIZTCQwouHPgtgwZlGQYgdDh289lhVqCr9
         MYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772825116; x=1773429916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uOnT09156mz9ztAxUhNe8PpOupeAedlDQCuib5+icu0=;
        b=etXNECeraNWMpzj+12+/uk80D5dIhwbJF1Um5t9WopdZGzrsgbbs2RfCodwGlBv1E8
         k0ctv+djDhwxbAEEyExJnMiO58pXgh5PivFj5ahjCEzPybP3rP5I2qFkwvhnLnqEHB89
         nGq0sxdx6WTWM4dd/osUaPG1cgpU4IGD+97xfDv3TNPXhlxoPpnohLppfzewvk2y1gj0
         YcngZHFOm2gN2L10j0Kdauk4qd3EODOh7+tj8yX2ai1WM+UyeGFI72PT4OBSAZxyZyxm
         a7pQYt6MAjYt+ehpa2CUg9pPZ3Gyj+JQNNkWxcCBbxPgCTy/eb7nHrYFGEWDNUYKbReP
         Ut9A==
X-Forwarded-Encrypted: i=1; AJvYcCVHhmhChZSsm61WeAn0wmJN/75/eDXGH6qhXlLxRA2PUjk85qlDGJGGGdACH6e3ptnvH5juxOyADo7Ys07LofQb@lists.infradead.org
X-Gm-Message-State: AOJu0YwsMOo40gdDPw2SzVGhFpmDIGB25soj0rEZrMinQShPrrEZ8PBl
	JyZVk8Mq9DcCWPaMorypTUqKUAMOJ7efXYCFOp30KDJad89n/gqcjbf9BpJ81lcNAQXXiwE5As5
	ArjdgLeNkL+fsqlHYEUdtjvzOJUqABgAlxvdL
X-Gm-Gg: ATEYQzwDGbuRG8LShprGXWFjibqrW1CwEiYSMGJfXI8MpNWCBLth5EWlkhjV/sjOSSI
	gi5qdwJa97OLKh0fGJMHJIAefy5rZNFhktbnOwvLsIf/ZInaglx9y9lOczssf0LJvc/r8q18NlJ
	vtPFXzqcogP7PhNVMlJPQbd9UXx84PARew0u5pDOgk1XBm/lgej2ha12cQpSAyugSgn0FYtTxu0
	5A/Itv4o+gyOkHSCSPZhAi9ozaW6gmNvtJkeKSTx6hL6mKcdF5JCC06z93ssa/QBK6Qkyd2jlvq
	TmeVlZFVWNL9zwE1ktjvV00EPr8NBJKzIzafIaORCP2LD3XYQz9BiLIZ/TEFTz9jsG93jGBU95A
	1syLksg==
X-Received: by 2002:a17:907:e8e:b0:b94:1f00:1ffc with SMTP id
 a640c23a62f3a-b942dfaa0c5mr185959666b.35.1772825115820; Fri, 06 Mar 2026
 11:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20260304232014.164408-1-rosenp@gmail.com> <9dbf5b85-66ec-4d3f-99d6-17cc74a8f912@embeddedor.com>
In-Reply-To: <9dbf5b85-66ec-4d3f-99d6-17cc74a8f912@embeddedor.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 6 Mar 2026 11:25:04 -0800
X-Gm-Features: AaiRm52RG8EIUK4taryf8i0vskX73hh0iig_Nc3FNuaefwD5gTxikZtojl4SYPM
Message-ID: <CAKxU2N9q8c3jE3Ao46BsGERb73jEsBVjWnBFVf=B78=0TNbrxg@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-dvfsrc: use flex array
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_112518_543211_9A2F3D89 
X-CRM114-Status: GOOD (  18.45  )
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

On Fri, Mar 6, 2026 at 11:21=E2=80=AFAM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 3/5/26 08:20, Rosen Penev wrote:
> > Simplifies allocation from kzalloc + kcaloc to one allocation.
> >
> > Allows extra runtime analysis with __counted_by.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   drivers/soc/mediatek/mtk-dvfsrc.c | 18 ++++++------------
> >   1 file changed, 6 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/m=
tk-dvfsrc.c
> > index 548a28f50242..48b1fcf3e101 100644
> > --- a/drivers/soc/mediatek/mtk-dvfsrc.c
> > +++ b/drivers/soc/mediatek/mtk-dvfsrc.c
> > @@ -71,8 +71,8 @@ struct dvfsrc_opp {
> >   };
> >
> >   struct dvfsrc_opp_desc {
> > -     const struct dvfsrc_opp *opps;
> >       u32 num_opp;
> > +     struct dvfsrc_opp opps[] __counted_by(num_opp);
> >   };
> >
> >   struct dvfsrc_soc_data;
> > @@ -489,7 +489,6 @@ static u32 dvfsrc_get_opp_gear(struct mtk_dvfsrc *d=
vfsrc, u8 level)
> >
> >   static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
> >   {
> > -     struct dvfsrc_opp *dvfsrc_opps;
> >       struct dvfsrc_opp_desc *desc;
> >       u32 num_opps, gear_info;
> >       u8 num_vcore, num_dram;
> > @@ -520,24 +519,19 @@ static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsr=
c *dvfsrc)
> >                num_opps, num_vcore, num_dram, num_emi);
> >
> >       /* Allocate everything now as anything else after that cannot fai=
l */
> > -     desc =3D devm_kzalloc(dvfsrc->dev, sizeof(*desc), GFP_KERNEL);
> > +     desc =3D devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_op=
s + 1), GFP_KERNEL);
>
> Mmhh... You should really consider building your code before submitting a=
ny patches.
This one specifically I failed at the make parameters.

This patch should be rescinded. Not correct.
>
> -Gustavo
>
> >       if (!desc)
> >               return -ENOMEM;
> >
> > -     dvfsrc_opps =3D devm_kcalloc(dvfsrc->dev, num_opps + 1,
> > -                                sizeof(*dvfsrc_opps), GFP_KERNEL);
> > -     if (!dvfsrc_opps)
> > -             return -ENOMEM;
> > +     desc->num_opp =3D num_opps + 1;
> >
> >       /* Read the OPP table gear indices */
> >       for (i =3D 0; i <=3D num_opps; i++) {
> >               gear_info =3D dvfsrc_get_opp_gear(dvfsrc, num_opps - i);
> > -             dvfsrc_opps[i].vcore_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INF=
O_VCORE, gear_info);
> > -             dvfsrc_opps[i].dram_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INFO=
_DRAM, gear_info);
> > -             dvfsrc_opps[i].emi_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INFO_=
EMI, gear_info);
> > +             desc->opps[i].vcore_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INFO=
_VCORE, gear_info);
> > +             desc->opps[i].dram_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INFO_=
DRAM, gear_info);
> > +             desc->opps[i].emi_opp =3D FIELD_GET(DVFSRC_V4_GEAR_INFO_E=
MI, gear_info);
> >       };
> > -     desc->num_opp =3D num_opps + 1;
> > -     desc->opps =3D dvfsrc_opps;
> >
> >       /* Assign to main structure now that everything is done! */
> >       dvfsrc->curr_opps =3D desc;
>

