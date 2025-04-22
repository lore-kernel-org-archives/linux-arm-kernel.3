Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62B3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wi0XCQ0wIgKNjQqJTUBlgswWdaLbIuH1pbfLDZVamA8=; b=suKEA9zASerKN0asxYtGFV7ALr
	EfdbHwaRub3jdnnf5LSeP8KiRS856fFji1Cwr9PxW5TgQMXRc2LcasKI7WbCrOgIXyiO85Yf+TMNG
	EVnG8SpA5lySUonwZvwchOcu0Usk0o/I6ysQXKQeYMVwbZlGzeI/Re9bWvqFF/jv1GI132WDY/kkq
	iZC0pwxYzAyj4mp0mkvMugqzGAz0Jho4XsCsVaB5XeFgRf4XcSY+uRCjkGAwQdcuUhv3JBykOfGF/
	EtEnriV5NfGguLF9DMr37nzc1ZYVpGFDT6Q3e4gc3xzyW7hXRQ1dP1MzeH2ukbqZyFvLjXrZL0lHt
	P061AFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jmk-00000008PRK-1hWU;
	Tue, 22 Apr 2025 20:00:02 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jks-00000008PFg-0R9Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 19:58:07 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e8ec399427so46937936d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 12:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745351885; x=1745956685; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi0XCQ0wIgKNjQqJTUBlgswWdaLbIuH1pbfLDZVamA8=;
        b=o1Bgzm7tzgq1jFBzByTVs6oIazL+2xz1o50T/vcK87Sj2wj7kqGqVB+mb1gQTBmfne
         J3nllztS/PGiTTK6Lwugx+2OIKfXJOjuUjAiNd/fkrmV6ywMIUTPf9R2DNxgf+hbf8Y7
         ZPn8b+X2BG29wUZO0D11mCRcvvnBXiaigzFHLRtgaA9Ig3OtKLRURGzdBTUMK336h4aa
         Dh2hGJbVLCBxL0L0eDsbCPPOMYwIAInuC1nm+rt7M2LKrruu+SJGm1jBxNjCckTHFcUo
         mmGhM++qEh23BXkT2QGnxwhnArivfPtVtxFevrORdsuYl/t/RZW7qC40f+GcGcr7ZZiy
         WS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351885; x=1745956685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wi0XCQ0wIgKNjQqJTUBlgswWdaLbIuH1pbfLDZVamA8=;
        b=mOV1GBB9oXqeThK3BF/SOubhTYtRzDgsnd/rJ2DOabh1RWJbh5xIgBW+JnTBvKVQQA
         ENLqtjoJs0uj0VZ/hxn2NrnvC2LKvpZusvBEEiLqZJj6cG9VzSmhn41yi9BtQX7Mhst9
         aXYPAzOQKY1oRpBXEQBgePNrG25NliSI2dnlJVgTfvU1ZmqhxAFn/9vugryyPHNRcgZj
         Guo59rQmU4DlSZdHRf2gsXKtOlCGN21FCgjh8whMWRJSIdjsJqQxP5+01dbXi+0pOcZc
         HUAg9lTMZArY8Qi1w/g1daPBcFM9RVXLDoDI4S4Z8YV2+rlkpWNm5teRvSD12RvTLX3v
         Jxjg==
X-Forwarded-Encrypted: i=1; AJvYcCUKREzBXhHjusYmFD0V/SuhpDO4myw9S21OsqiXqoVO3U7nCuN3yAJdgT53Vnrg/AET/GiBzW1YCPJ1pygjkUzz@lists.infradead.org
X-Gm-Message-State: AOJu0YwD+a/fnRlHDwkKDjXEoRq3AVMHj+aAjgTNIE8f8oNRwpCYgdfH
	Eeo+3GJq2XjrgnUUCvCgD9tMD0bvZRHSsJGohfayHcf2/RNJtatQjxyfqsa9c5Q=
X-Gm-Gg: ASbGnctenWm0XZ4dOxrjc/h345ia2js0Q/jzaVlHK2AtmkA74taGADgjbr9Ha+dsc4C
	DdmsoVtttCNozImgsUfYK4hiqUcSmktMqAHcOMSziNuEx5KuQ/qPkFOlOmS3kSgcGETF8MLqCWW
	EMX5Pu1S8fQbgwiBvjfnWrUQ4TvV+ibH1EDPXyB9YEHrDDMKGpiJpEoMR3agO86Tdj0pJIGW4Wc
	4oeSV2DB9VZaqDUCitOCi2RPA22iU/4JtkkIpXiQLfivekZw15jTQFTC+LHbmMrVzTC7BJigpe6
	fDg2+LB+Jul+IJRWjme9BpmKqXji2dZlilGj2FuiZoEMKQ==
X-Google-Smtp-Source: AGHT+IF7avo9uEX7A3mW4T8l6RGnGWjnOiUes3AEZlicK2QwGeYThk0IGDXmi5oRWeE+79xJPQKX3w==
X-Received: by 2002:a05:6214:19c8:b0:6e8:fad9:c688 with SMTP id 6a1803df08f44-6f2c4552a03mr278764626d6.16.1745351884909;
        Tue, 22 Apr 2025 12:58:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1433sm61506056d6.19.2025.04.22.12.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:58:04 -0700 (PDT)
Message-ID: <529a9804d5b14322b2be78ea6f98677db9c23c33.camel@ndufresne.ca>
Subject: Re: [PATCH v3 3/3] media: verisilicon: postproc: 4K support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Erling Ljunggren <hljunggr@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Jean-Michel Hautbois
 <jeanmichel.hautbois@ideasonboard.com>,  Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 15:58:02 -0400
In-Reply-To: <20241121131904.261230-4-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
	 <20241121131904.261230-4-hugues.fruchet@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_125806_141701_806BCAA4 
X-CRM114-Status: GOOD (  15.06  )
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

Le jeudi 21 novembre 2024 =C3=A0 14:19 +0100, Hugues Fruchet a =C3=A9crit=
=C2=A0:
> Support input larger than 4096x2048 using extended input width/height
> fields of swreg92.
> This is needed to decode large WebP or JPEG pictures.
>=20
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0drivers/media/platform/verisilicon/hantro_g1_regs.h=C2=A0 | 2 +-
> =C2=A0drivers/media/platform/verisilicon/hantro_postproc.c | 6 +++++-
> =C2=A03 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 811260dc3c77..d1337f7742e4 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -321,6 +321,8 @@ struct hantro_postproc_regs {
> =C2=A0	struct hantro_reg output_fmt;
> =C2=A0	struct hantro_reg orig_width;
> =C2=A0	struct hantro_reg display_width;
> +	struct hantro_reg input_width_ext;
> +	struct hantro_reg input_height_ext;
> =C2=A0};
> =C2=A0
> =C2=A0struct hantro_vp9_decoded_buffer_info {
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/driver=
s/media/platform/verisilicon/hantro_g1_regs.h
> index e7d4db788e57..f6e5bbeb1914 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> @@ -351,7 +351,7 @@
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_PP_CONTROL_OUT_WIDTH(v) (((v=
) << 4) & GENMASK(14, 4))
> =C2=A0#define G1_REG_PP_MASK1_ORIG_WIDTH	G1_SWREG(88)
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_PP_ORIG_WIDTH(v)	(((v) << 23=
) & GENMASK(31, 23))
> -#define G1_REG_PP_DISPLAY_WIDTH		G1_SWREG(92)
> +#define G1_REG_PP_DISPLAY_WIDTH_IN_EXT	G1_SWREG(92)
> =C2=A0#define G1_REG_PP_FUSE			G1_SWREG(99)
> =C2=A0
> =C2=A0#endif /* HANTRO_G1_REGS_H_ */
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drive=
rs/media/platform/verisilicon/hantro_postproc.c
> index 232c93eea7ee..84c8e287470d 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -49,7 +49,9 @@ static const struct hantro_postproc_regs hantro_g1_post=
proc_regs =3D {
> =C2=A0	.input_fmt =3D {G1_REG_PP_CONTROL, 29, 0x7},
> =C2=A0	.output_fmt =3D {G1_REG_PP_CONTROL, 26, 0x7},
> =C2=A0	.orig_width =3D {G1_REG_PP_MASK1_ORIG_WIDTH, 23, 0x1ff},
> -	.display_width =3D {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
> +	.display_width =3D {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 0, 0xfff},
> +	.input_width_ext =3D {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 26, 0x7},
> +	.input_height_ext =3D {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 29, 0x7},
> =C2=A0};
> =C2=A0
> =C2=A0bool hantro_needs_postproc(const struct hantro_ctx *ctx,
> @@ -103,6 +105,8 @@ static void hantro_postproc_g1_enable(struct hantro_c=
tx *ctx)
> =C2=A0	HANTRO_PP_REG_WRITE(vpu, output_height, ctx->dst_fmt.heighat);
> =C2=A0	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width))=
;
> =C2=A0	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
> +	HANTRO_PP_REG_WRITE(vpu, input_width_ext, MB_WIDTH(ctx->dst_fmt.width) =
>> 9);
> +	HANTRO_PP_REG_WRITE(vpu, input_height_ext, MB_HEIGHT(ctx->dst_fmt.heigh=
t >> 8));
> =C2=A0}
> =C2=A0
> =C2=A0static int down_scale_factor(struct hantro_ctx *ctx)

