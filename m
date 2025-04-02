Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6747C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSL4oRGEAPHD9iSzx4FRIOJD2xPfGaZhPkphkR7+6y0=; b=VFLcoN5lkB2Ig0rnqw3IdMSHun
	/SwoHWkTPz9r12rgLBbT9957Px8sLtJyXwWdq5JsvZB5rYhdtG0XKDQiPXQcJQLK47HVBbUPrtZSG
	pbuKxYqw+st98++YjTYWPYkRkwtUeUbZjE5UAIFzIjefEJ82dTJf0O24OmqPLZVIZrXaBzxrEfL8J
	Ksw3Mr80V4RvqF05yBPgzxLv/t26hJyNXoGbt8RhH5fdeyouBhjM8N4OVO8W0mhi09quFpIkD78RH
	mHbgKcrsx34LST5mh/tfK0W9JKM4Kb5pz47Mz7h1nxWYeawreF6fcz7WHO914e2TkRR5/E/rTLMXM
	R9H9Gsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00EX-00000006YGz-0XsK;
	Wed, 02 Apr 2025 15:42:29 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00Cl-00000006Y0O-1AsW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:40:40 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e8fce04655so65319696d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608438; x=1744213238; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSL4oRGEAPHD9iSzx4FRIOJD2xPfGaZhPkphkR7+6y0=;
        b=Q1Q9rQ7o0qLLLWOCD+bbN4yKOQlGr0+xKNXAF1xk2lYt8LV0p06CrT5u400UBPge3y
         eie8S6KETXFLN5YVCo1KRY65+V1mqFQ0yezQGNBM1dWsGteziBgSprK7tPCbxEJBz5PL
         wi+S/NinPa0wHxOBy+ZJPUuGrycvP0uHLNLmRk/G74rlQHU/5Dx61H++xMexdeBustDF
         1YvAN7xVBSMG8alsbVZqCzLwZGczm2MAeAIbOvaaAF4MMMubUUcbLIUIzrvx1lI4lfel
         9adke+lHnyq63Ygtu5GUUVHcs99ZcG+gPozdjR1EzKbzUHCqsRxNYVeGxYntaFmEonOK
         nkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608438; x=1744213238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSL4oRGEAPHD9iSzx4FRIOJD2xPfGaZhPkphkR7+6y0=;
        b=HPGfZ/d7nlCzoopVm7LelSfZF7XQd1XXOnwB5ksdGigXMlFWTPIYnYUkwWBXRSQ47p
         kMmyagP3IDQONrrdQSBqY8vkoEAXNUaSnWdFVwSdhiIzTi8QxKAue1YCNcnSXVMtpf6M
         EZEYKnYGoZksjWW4DI/a1kD4sPl91yuRdztVouSuqvPKlP5Le5MaHSQ/gBMZ5ux7nTjF
         NNHkl4gdu6s4WYM5CeRdmkgjXFSFjJHchke7zKoWoIRp0ZVK9VOPMOMvlRWxbfCbVTgG
         pWq6/R1f78iJ77FlE5kZl11HLo1UxN7GrHesp3jsBUsIko9fBFjye+sP1u248/GQryqK
         GVhw==
X-Forwarded-Encrypted: i=1; AJvYcCXiKluSFwJd6NLpEEhkXFsd8+q/gycclXCPqCEDV6z9eyDRLZDsxTegqESJGXzeZv7WlXC2oP4/AwZ4i8F04c7P@lists.infradead.org
X-Gm-Message-State: AOJu0YxFSG3ezGZh0j9toQcgxJF6hPLS2UKzTWARt8tOlJGba1jrS6W8
	qnpFexajKbOBA84ZbmdcKoOx93QwO30hardbl0ISFa9jFEuL1PA1y0De2BYIxYY=
X-Gm-Gg: ASbGncviWO1Oj/o9IkFHtWkYwy63gVpTyzyAnTr5zr7Dfn6W08gqdTZOwevkft5lqjj
	38u9MF3COt8LSm/y4r9uBqF+tyckEU1Kif1wONaTsO8kAG4l/vNW5bmK6nf36BQU7GND0xsAZAl
	wXHihd8OuRsa/Q8brdYJpR3n7s5TxuJZIAFwqwrKxhFxU0HXaQNlLbv2XS0ZQE5SjBnreK6KNlX
	MC3Pc4U6J/gPyM/qKVgElk55v+ePMrvsx0S42/kZFAEibJtnPYH1c7VttPqP1EJdn+L29uHiJlB
	VJaSjC499NQpPS23KpF1QDGPWQCncguGeQ5oY80nBSYJU/vLlQ==
X-Google-Smtp-Source: AGHT+IF4Dz/stCS5BEC5GFlEUNzvWwaks8m+IIa7woNJtCMmFQbWLxjNz8YenZdUROs678sB7aZKEw==
X-Received: by 2002:a05:6214:b62:b0:6d8:9ead:c665 with SMTP id 6a1803df08f44-6ef02c92ed5mr46211356d6.27.1743608437967;
        Wed, 02 Apr 2025 08:40:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec965a1desm75344486d6.60.2025.04.02.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:40:37 -0700 (PDT)
Message-ID: <14a86f60d026411eb7e4546b8a4879a90f247843.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-vcodec: Fix reference count leak in
 mtk_vcodec_fw_scp_init
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Miaoqian Lin <linmq006@gmail.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fullway Wang <fullwaywang@outlook.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 02 Apr 2025 11:40:36 -0400
In-Reply-To: <cfc905988dda23078b5086f3eb0975863bbb6c2d.camel@ndufresne.ca>
References: <20250318110556.903-1-linmq006@gmail.com>
	 <cfc905988dda23078b5086f3eb0975863bbb6c2d.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_084039_317451_53DB4CE8 
X-CRM114-Status: GOOD (  18.84  )
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

Le mercredi 02 avril 2025 =C3=A0 11:37 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le mardi 18 mars 2025 =C3=A0 19:05 +0800, Miaoqian Lin a =C3=A9crit=C2=A0=
:
> > scp_get() returns a reference that needs to be released with scp_put().
> > Add missing scp_put() before returning error in mtk_vcodec_fw_scp_init(=
).
> >=20
> > Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deferen=
ce in SCP")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> > ---
> > =C2=A0.../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
> > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_f=
w_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> > index ff23b225db70..11ab3bc60217 100644
> > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> > @@ -71,7 +71,6 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *pr=
iv, enum mtk_vcodec_fw_use
> > =C2=A0		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_=
use);
> > =C2=A0		return ERR_PTR(-EINVAL);
> > =C2=A0	}
> > -
>=20
> Might sound nit-picky, but don't do style fixes in patches intended for
> backports. It increases the chance of conflicts.
>=20
> > =C2=A0	scp =3D scp_get(plat_dev);
> > =C2=A0	if (!scp) {
> > =C2=A0		dev_err(&plat_dev->dev, "could not get vdec scp handle");
> > @@ -79,8 +78,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *p=
riv, enum mtk_vcodec_fw_use
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> > -	if (!fw)
> > +	if (!fw) {
> > +		scp_put(scp);
> > =C2=A0		return ERR_PTR(-ENOMEM);
> > +	}
>=20
> With the above style change removed:
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@colllabora.com>

Sorry for the noise, I see that Hans fixed and merged it already.

Nicolas

>=20
> > =C2=A0	fw->type =3D SCP;
> > =C2=A0	fw->ops =3D &mtk_vcodec_rproc_msg;
> > =C2=A0	fw->scp =3D scp;

