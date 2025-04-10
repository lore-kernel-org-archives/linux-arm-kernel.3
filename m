Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA9BC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgi++iF3Fg7nMYQ18+rntnQ648+qoZ6drbTj0Fi+Lc0=; b=lzh3KG6bVDm0FoZtii478tdkP7
	vWNzqQGoGowZqMdZkM1MgGyAn1fOcam3Mln2GQk6tSER9hoS0MBzyqzQjv/jwqJcmMTxikXWRRAqQ
	+AK56yZw5p/eDrjXdg8DJU0iTF2BvfBEJ5en6cKK4oRR+w734W9CGvXuVTxs/INgTXq0Ts7OitXsd
	DO8orMlaNh+UsXXqUW7WO8KquH+lOMSfR9pdIW4kmI/LbplQ/diKIGXPRAIvP6SUd8H2T+4YFPHUq
	ly6n8S483y8wbPdXv2TLqg5z5/epgXv5KLDCmHlx64EsdpP7aDR2e7hpZqKX8/Dro4UQjU/haOMJl
	Uc2EKnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mLC-00000009YXN-2Txr;
	Thu, 10 Apr 2025 07:28:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lc2-00000009PCd-41Ti
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:42:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso4902055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267329; x=1744872129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgi++iF3Fg7nMYQ18+rntnQ648+qoZ6drbTj0Fi+Lc0=;
        b=LIc3bP2u/nIoVRDcOD2UTIMLiy57aMH+FpdFmtaysCsudmqVgr148RNVj/De0eizjp
         7XeUvIUaW5KH8kB4d3YVgBpZnkJE1sTuGbDTFzRK5IObJejpM6FF68oD/Dihl6NGGJgQ
         RgGq98SmbG2zMkDluuyiJDmyh+wcE8J7qv7pzXld1QhbVPxBLcGs0l4qr6/qqKFaidCL
         lSm7uxdGISXW/7oVf1HpiUW9xGXg/GjqBHKVGvMaauhJsm7UqwE36R+7Rf4VJCpgx06Y
         N3GOjXVRTMEukFw9nxEPgS8pEGajKMGjJ43IIoAvCl8LAgyb+3isrKbxH8DKS54houxF
         DJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267329; x=1744872129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgi++iF3Fg7nMYQ18+rntnQ648+qoZ6drbTj0Fi+Lc0=;
        b=EfP4YYQjXkwTclHCT+1NGSqNnDXDt6qa7m0yWVkPmKkL0lE4gtL5cLLlgBifWl7TQS
         LI2HsZ99En8+s23KixfyptkbtT96JlFEXLLq2MLmKjIMInTr6CUEDNW7CkJv5+NkB32c
         5VvtIyaOL9ZO8N7u3CgSL1r1ObrqnwXu1UW1Su8c4c6tP+36iadyCShrB1ti5tdNHf2m
         kTvys7G6lhfZuy8hq7NhhxxmCFPK2FNvb0i7QJhxN0iqFVzV4e2VgVO2Z4OcurVcm9/S
         hKF39jyFSaVC8O/Vtt793zyMIArD+l4iMuMcaznc1ROBHrRthhFdVoms18SHxIjWmmm3
         hKcg==
X-Forwarded-Encrypted: i=1; AJvYcCVk30Ex5DNUHy1YXOW5LCbLNXmsFUqQ9oYWBE4ewZeXcBeb2E6MKRp7CVeysjQ5/ZMWLaE4lGl5HXJ5orAvFcvz@lists.infradead.org
X-Gm-Message-State: AOJu0YyiM7rxcxikXJS4rz3iCgTEFD3utyBo04YMRvW1mE+CpPLOCkxt
	j9m9kGhySiNLLuU+NjI0QCk+VRmx6VhbayAYxjELxvzYlMCPArKY
X-Gm-Gg: ASbGnct6l4aK+FhQPDRJ83KAsgzZskwAbT5oomygYdqaWosNJmW4v3MxCt4C4XfrNVt
	YSihrlh/rBM/baZjfp3aIGT2eH7Eb8XP3RBhRRJQUASO+VaXdplPkM7Sl1VVERNdccepn5PbasO
	u4UuJuwY4xIOVepw25vxSNnU0BHsGb0m1rA+sKSDnXiadzz0lPWj3h08fdyXmNzgQyF3Qj4Jtu7
	Qd3l2TpeJn3nhapxrYLD9/AmnHPslDIIF5YcZ0YFG2sHbYYSI3CjTswVjQvQawUJBbD+Fp2ljgq
	crqWB/spuY3xz/CjU0KLTZ4EpKymUujDBKHBa2+iJESJnlaKMaqBFSJXgaGkg++EqlJNTy5+GmS
	0ZFb/nNV5ru0MtWCJ
X-Google-Smtp-Source: AGHT+IE3nWAVRE6ucb7+Uzjsl4IRZ7guyI39ocIlY0+wxgPZqYZO8ZgYVGT3E9SnVfCkjxK0FKGnEg==
X-Received: by 2002:a05:600c:1909:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43f2d798f09mr12514035e9.7.1744267328446;
        Wed, 09 Apr 2025 23:42:08 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a273fsm39895635e9.9.2025.04.09.23.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:42:08 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
 Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] crypto: sun8i-ce-hash - Refine exception handling in
 sun8i_ce_hash_run()
Date: Thu, 10 Apr 2025 08:42:05 +0200
Message-ID: <2774682.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250409133610.59d42bec@donnerap.manchester.arm.com>
References: <3727de04-7993-4b81-80c0-adb40b847307@web.de>
 <20250409133610.59d42bec@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_234211_002753_002B409C 
X-CRM114-Status: GOOD (  24.03  )
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

Dne sreda, 9. april 2025 ob 14:36:10 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> On Wed, 9 Apr 2025 13:43:39 +0200
> Markus Elfring <Markus.Elfring@web.de> wrote:
>=20
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 9 Apr 2025 13:26:55 +0200
> >=20
> > Two if branches contained duplicate source code.
> > Thus avoid the specification of repeated error code assignments by using
> > additional labels instead.
>=20
> Is that really useful? I think the current code reads easier, with the
> usual pattern of setting the error code and the goto'ing out.
> Now there is one rather opaque label it goes to, so a reader doesn't see
> the error code immediately. And it really just saves one line per case
> here. Plus the added danger that future changes might break this again.
>=20
> And then there is the oddity that it jumps *into* an "if" branch, which
> looks odd, I think typically we goto the end of the function, outside of
> any other statements.

I'm not a fan of this patch either. As Andre said, current code is easier to
read and such optimizations are more for compiler to make than us.

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
> > This issue was transformed by using the Coccinelle software.
> >=20
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/driver=
s/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> > index ba13fb75c05d..7d31e190bb6a 100644
> > --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> > +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> > @@ -399,14 +399,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engin=
e, void *breq)
> >  	}
> >  	if (len > 0) {
> >  		dev_err(ce->dev, "remaining len %d\n", len);
> > -		err =3D -EINVAL;
> > -		goto err_unmap_src;
> > +		goto e_inval_src;
> >  	}
> >  	addr_res =3D dma_map_single(ce->dev, result, digestsize, DMA_FROM_DEV=
ICE);
> >  	cet->t_dst[0].addr =3D desc_addr_val_le32(ce, addr_res);
> >  	cet->t_dst[0].len =3D cpu_to_le32(digestsize / 4);
> >  	if (dma_mapping_error(ce->dev, addr_res)) {
> >  		dev_err(ce->dev, "DMA map dest\n");
> > +e_inval_src:
> >  		err =3D -EINVAL;
> >  		goto err_unmap_src;
> >  	}
> > @@ -428,16 +428,15 @@ int sun8i_ce_hash_run(struct crypto_engine *engin=
e, void *breq)
> >  		j =3D hash_pad(bf, 2 * bs, j, byte_count, false, bs);
> >  		break;
> >  	}
> > -	if (!j) {
> > -		err =3D -EINVAL;
> > -		goto err_unmap_result;
> > -	}
> > +	if (!j)
> > +		goto e_inval_result;
> >=20
> >  	addr_pad =3D dma_map_single(ce->dev, buf, j * 4, DMA_TO_DEVICE);
> >  	cet->t_src[i].addr =3D desc_addr_val_le32(ce, addr_pad);
> >  	cet->t_src[i].len =3D cpu_to_le32(j);
> >  	if (dma_mapping_error(ce->dev, addr_pad)) {
> >  		dev_err(ce->dev, "DMA error on padding SG\n");
> > +e_inval_result:
> >  		err =3D -EINVAL;
> >  		goto err_unmap_result;
> >  	}
> > --
> > 2.49.0
> >=20
>=20
>=20





