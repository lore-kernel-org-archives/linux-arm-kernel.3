Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98E1C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhmKnF0oiTEPkeisoeZbaGPYtFNcuzXscDMztyaRd+w=; b=dICjBMQ9J7ChA9R9iG5FWWO8uE
	eKzwrGlQB1qf2ba5UXRlh2/e9imV0pBEvX85Hmmp6jyMWR7zjmPaQ7NvPVGimnAmztkWD8J4XSy8p
	IBiNObLcr1XfJSgVi7I4GXd75B3oEKG0TSHJyebnhEtZj799gPDev3VtATiwQMcfStVYl7frFkzjY
	KCdNM5p9LAZ0ozTfNE5cVcnoRiNg4nxDxBUJijImNHJiBtx2+zDI6EtWXh9q63FtwaVv9c4h+Wbkb
	Jm/cNvdKP4slXwH8Nq6+7ahGRIrUKGXNP88Vz4NcuBhrlrrYl9RznNlgxFWrLSJyzw57F8h5OqJu/
	nOpxTZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00Br-00000006XlU-4B8G;
	Wed, 02 Apr 2025 15:39:43 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u009n-00000006XU6-0KKW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:37:36 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c592764e24so112246285a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 08:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608254; x=1744213054; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhmKnF0oiTEPkeisoeZbaGPYtFNcuzXscDMztyaRd+w=;
        b=baWgjhioyYbvVnsKaV5Tb1ckcOcdebwJ8VITaTa2jYxIO2h/Wpo2iGCG74B2WEHaJo
         cJXWYXfxSAILRuxuTz698ceiPjjqxHtbpvyqUALAxKg1ALrS+MFB9CUP29sryVupcbN0
         pj/eOa+f7BD3WgN6M2h3JCkpMokQtC3JyRElxRtM5GtUwTZ/VobDJ/4oEANFjDGMnXuG
         F0VeTOr5ZyJJL+3mmlOzcDeHGoNZOTFiiq4kjLwLBPs7ZDjr2LkY1bPwa5yOmvRGyet5
         xnxBx+HTYtUsXFC99MioW1zWQsH/TMLd8dOp59PXQbj5EwjP0XUT/fMUs7HPp0aInqlC
         6NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608254; x=1744213054;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhmKnF0oiTEPkeisoeZbaGPYtFNcuzXscDMztyaRd+w=;
        b=Jgs/fPoAgbftTeLWXZGNPmthiC/qeLJhdwhT3vNn90IAV4YGwaKdDpodgVMlB8UmiJ
         83myfdW6PD6iwTSfj5wpaxp9hZkrv2R6XHPOw/92QU/cmzBjJ4oNwUAR8CNTeVy9y5Ji
         i+vDRI0beD02FO/JOy5QtG75rknMgeyEIx6lt0JSc7G6I3CxSVtUhF1GHzXkZ4nw6TEd
         fclR2id1cIa6mO07THNfCeTKRGiKL20aE3DR8ZBjsiFdZKVii+owzO/cmJy/VVcPECHv
         TtsssnLqkSmy91JD0w9CSTzg1Nj/WcokRm2G7204n3x9Y04X+VTK8lSb/0kDBJtz4Ign
         uZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwR8kAFsc9woOyJUhP9A9w4+ftfek7HspyDkffJKhui1RuJIIGEk4gOSomd1a1tRDwbAMPkOR7yiVjpzyZlnK6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3ejmS9VlpCnN6487CmkkYpgZHonDl40E0vbJuyMXOwwbschEZ
	1zXEVWyockU0vUWjQkypCiLHKBsSDRDzS+bamt2PdY8uT2lwxkpl3ki5b0SqF5w=
X-Gm-Gg: ASbGncuJvVWfOuLkKSKPwmsjWJWdHBNB2ZyyNr3jQJkz2KRoJ1AQ9ueApkl8RlMoHu8
	N3HeONDLEdncyHzmema+fDE03dDPo9OvaUZZOItQo1t1d/eP/XS8cRkDqbp5IYBJcvzYhIZGTO+
	h0lYbqycPMTEGEHFvceDtWeKqElC5A+YeNq9bp7Hl+nbGGJXsrhGn18TWjjzu1cA2b99qfh94LM
	XILhkwmzb4vt++oIUx2Hh5i2z0N9cs6X+e8OdGSjxWrXltTSqsgomdGD/YkFh4pjqvQZ6lnHXfZ
	hi+RDL0bpg9gdp4sIKNCDI2ZdMfp1iADo0yhm3w1cT4Yk1BDmQ==
X-Google-Smtp-Source: AGHT+IGt12U4LeoNV08d0rSucCuL30UKo3Q/u+eYpiDfdZNZWOV5NQwkfWw/ZI52IiTuX89vZtkt/g==
X-Received: by 2002:a05:620a:d89:b0:7c5:9452:4a60 with SMTP id af79cd13be357-7c76c970550mr2456785a.5.1743608253843;
        Wed, 02 Apr 2025 08:37:33 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f77804a9sm796103585a.112.2025.04.02.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:37:33 -0700 (PDT)
Message-ID: <cfc905988dda23078b5086f3eb0975863bbb6c2d.camel@ndufresne.ca>
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
Date: Wed, 02 Apr 2025 11:37:32 -0400
In-Reply-To: <20250318110556.903-1-linmq006@gmail.com>
References: <20250318110556.903-1-linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_083735_125850_CABBB227 
X-CRM114-Status: GOOD (  15.45  )
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

Hi,

Le mardi 18 mars 2025 =C3=A0 19:05 +0800, Miaoqian Lin a =C3=A9crit=C2=A0:
> scp_get() returns a reference that needs to be released with scp_put().
> Add missing scp_put() before returning error in mtk_vcodec_fw_scp_init().
>=20
> Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference=
 in SCP")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> =C2=A0.../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> index ff23b225db70..11ab3bc60217 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> @@ -71,7 +71,6 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv=
, enum mtk_vcodec_fw_use
> =C2=A0		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_us=
e);
> =C2=A0		return ERR_PTR(-EINVAL);
> =C2=A0	}
> -

Might sound nit-picky, but don't do style fixes in patches intended for
backports. It increases the chance of conflicts.

> =C2=A0	scp =3D scp_get(plat_dev);
> =C2=A0	if (!scp) {
> =C2=A0		dev_err(&plat_dev->dev, "could not get vdec scp handle");
> @@ -79,8 +78,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *pri=
v, enum mtk_vcodec_fw_use
> =C2=A0	}
> =C2=A0
> =C2=A0	fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> -	if (!fw)
> +	if (!fw) {
> +		scp_put(scp);
> =C2=A0		return ERR_PTR(-ENOMEM);
> +	}

With the above style change removed:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@colllabora.com>

> =C2=A0	fw->type =3D SCP;
> =C2=A0	fw->ops =3D &mtk_vcodec_rproc_msg;
> =C2=A0	fw->scp =3D scp;

