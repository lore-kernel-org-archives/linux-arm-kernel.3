Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD5AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJcCBxZrPcF1HtINZMO6IVGAMykP+k9zuguph0IARao=; b=AYrgd9nd2J22jnPizASKAB+hvS
	OMLIm+fH5tu097Pl34ryL2ez9ULjn4Mf/IvAAXC6zykM4LXGQzgTIDR4qk/PTKvOlF52T6Jq6KBAS
	9gwwNO6CjkmiKlbJADBxtyh2dujL+FEIpLbrsfiKaS+EbGvLKCoR8SBBD5IUzDUb6RTAXiB6bp08m
	fFM0mF+SxRfUQIHtWgTysuYVNTMQpYL5fHJxgmy9UZOcAUqSJHe9UzInptiPI87Zx2qUNvEX6u1OQ
	1sWCTPCLWV7MILkLP1NdniBxiAtiFWNyjYDoc9X2ACofM6Mf53WH3vtAr/e2IYKFsGwlBqrFubY3v
	BQ0mFG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnq6e-00000009Ua7-0aWn;
	Fri, 28 Feb 2025 02:28:04 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnq4q-00000009UJB-2tZ6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 02:26:14 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e89bce647fso10794116d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 18:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1740709571; x=1741314371; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VJcCBxZrPcF1HtINZMO6IVGAMykP+k9zuguph0IARao=;
        b=Scf1icO5+GgVo9kpPJ/ZHo+57MWh7As3k3WwgXbbIKnGQMJx95wrkFFEV4ypTpREtd
         VVGVnGPyVtP9XKs0Z2tmu8H3OLIqBY2URenn6eEIo/7LIBH6aFA+Bk8AzTpZMClq1SGZ
         1Nt5Lq16V7efXs4g9Ao65R6sz+09JLSxf0rKLciWdAJaLX99wYmGOnS5VNg0KXnHg+Lm
         LBRBml2Ale3IzfsNUUEv/iJVD58JLhbKl0Zt6HY/CjF7TlHSSCQFPPMaP0sdoWJQkaye
         UE8Z4WcGsunfzAeQd3sqSvplLsTcYhbJQwsgeuHRJJyngJUz043DbHl5lQjENb1fSGHh
         s4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740709571; x=1741314371;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VJcCBxZrPcF1HtINZMO6IVGAMykP+k9zuguph0IARao=;
        b=T3qDebOwjqqscs0OWWDlVJsquvnhBcQ05YrZ8ugmyne4xknnUIZmMueIwlrM4YqpYI
         MWTWoDdgRjgD+vi4Xb8xPIOmm+ci+sTUdk7405Bb4WgOaskrLhK6HdwXqITkioe2Q69Z
         9kl7JLCfYKov4+IjqPF+rS1rZWihoo3HVLu4w3ZLMMwUo5C+KOYBJjkKa1R9kKYaQH9N
         NxKKfjDrk/RRyCRv614TYH+fQm/tFypH6IOhkItIEPg93JYhH7dqE37HXXDmv/xTrDB3
         eHIoL0wUlhHiiAtnwvldeHHvwX2m3jZFM8BLfSOJwBmTn11DAx0vweRnFApwMrausFNH
         GP5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1fOZHg9lCBor1534bFmu4Ers0pJqYRW5OENr7fwdw8IZGzrrl0Jp8aEuOIBN0XdO3pLb/Il9LAqVvVEyQjLJ5@lists.infradead.org
X-Gm-Message-State: AOJu0YwnamBHDIsmsUYPga4mxvBy9q14rMQ0ubqta/Td7K7B8Meh14mz
	lppoKWfP0NA5If+kz6AWKzdyekInqDd5UKQn8/rtQIvuwBG/86803Y4r/fzn5DH7ETZ1PIZD3V9
	2qd0=
X-Gm-Gg: ASbGncsx+w7r1HFMCDRKeMByyj29RJcf3guKbi4nw6xnXgm65IPDf35eh6k5O8RItBg
	68E/Ut6UBq/2OOms9M3RyyDTasnpycKnkhJbJbdaSBPBTbm4689njE7N54TbdZHDisUIWA1Zitm
	Vz7Bl/UF4UXBeOsFdvLHAg6QclahN89+uxdKxKplQSSSDb1CP8xUAysRDHLWsnQOSJbNofrLDs0
	NRmez0h+14qT5GczC5VIZ0Qvroaw8J95zO4DGZkwVeauxBaQhcZa7eP/icjrG9KMvzYE4Wdex51
	FHhKHA3xm9N/MyOkJDOXOJHkYzofOUo=
X-Google-Smtp-Source: AGHT+IGUs//lkbvx/dTZ6S1dXtcIeqOusIiHyVcn8w8wYwcYyF0soDMXcDq4Vyroqi8kUxCmEF+Ucw==
X-Received: by 2002:a05:6214:2b0b:b0:6e6:6225:a910 with SMTP id 6a1803df08f44-6e8a0c9f160mr30820726d6.14.1740709570881;
        Thu, 27 Feb 2025 18:26:10 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976da38csm16657186d6.108.2025.02.27.18.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:26:09 -0800 (PST)
Message-ID: <fb0e0c207cd6c2cad39c2a38398080d93db4000b.camel@ndufresne.ca>
Subject: Re: [Patch v2] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Aakarsh Jain <aakarsh.jain@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org, 
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com, 
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com
Date: Thu, 27 Feb 2025 21:26:07 -0500
In-Reply-To: <20250226102251.9040-1-aakarsh.jain@samsung.com>
References: <CGME20250226102749epcas5p35afe43774ad2917b846c921dc593a5ef@epcas5p3.samsung.com>
	 <20250226102251.9040-1-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_182612_984885_D9AD42F4 
X-CRM114-Status: GOOD (  14.70  )
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

Le mercredi 26 f=C3=A9vrier 2025 =C3=A0 15:52 +0530, Aakarsh Jain a =C3=A9c=
rit=C2=A0:
> There is a possibility of getting page fault if the overall
> buffer size is not aligned to 256bytes. Since MFC does read
> operation only and it won't corrupt the data values even if
> it reads the extra bytes.
> Corrected luma and chroma plane sizes for V4L2_PIX_FMT_NV12M
> and V4L2_PIX_FMT_NV21M pixel format.
>=20
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
> changelog:
> v1->v2
> Patch link: https://patchwork.kernel.org/project/linux-media/patch/202408=
06115714.29828-1-aakarsh.jain@samsung.com/
> Removed duplicate code and aligned luma and chroma size
> to multiple of 256bytes as suggested by Hans.
> =C2=A0drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/dr=
ivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> index 73f7af674c01..0c636090d723 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> @@ -549,8 +549,9 @@ static void s5p_mfc_enc_calc_src_size_v6(struct s5p_m=
fc_ctx *ctx)
> =C2=A0		case V4L2_PIX_FMT_NV21M:
> =C2=A0			ctx->stride[0] =3D ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V=
6);
> =C2=A0			ctx->stride[1] =3D ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V=
6);
> -			ctx->luma_size =3D ctx->stride[0] * ALIGN(ctx->img_height, 16);
> -			ctx->chroma_size =3D=C2=A0 ctx->stride[0] * ALIGN(ctx->img_height / 2=
, 16);
> +			ctx->luma_size =3D ALIGN(ctx->stride[0] * ALIGN(ctx->img_height, 16),=
 256);
> +			ctx->chroma_size =3D ALIGN(ctx->stride[0] * ALIGN(ctx->img_height / 2=
, 16),
> +					256);

An eventual port to v4l2-common helpers instead of open coding this
would be nice, though I see nothing wrong to report with this code, so:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

regards,
Nicolas

> =C2=A0			break;
> =C2=A0		case V4L2_PIX_FMT_YUV420M:
> =C2=A0		case V4L2_PIX_FMT_YVU420M:


