Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E27C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9u1inJLOLfQh6u+GzwXvGD1x0ZTwyyXPt4wVXYzgNE=; b=y6WcHLmSy8hkdUwu7eMnKb95XH
	O2p47lOPvO+14IfieolaIIQEzz0EmrmgKCo1vTOvBSGcVEP4Y5bpeDmso9yGO5nYp63oFMQCravtl
	Cfe/U0l3n04Uzudzrjs+7sGWyyg4+gKXdjUXMXfO0nQUyjRmsGKOW01yq1Qn+e1I2d4QRAHm1vJSo
	YelQAHl7SVtc3QbyrVFWE/bmJkTSMHmPYqyVGVgm3rQmCAifmklKRM1k6Ro+JgwFe0SUSJE0TtpqJ
	hOKZ9a62ws7cvIAHAKAqQqmUUiu48BXWwk4UIkIOycZ238DmFUSAPKEVitX1kHsDgpJD4EPC6i2rE
	/BWJaXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jr5-00000008Pqi-2mNg;
	Tue, 22 Apr 2025 20:04:31 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JpC-00000008PdM-36v2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 20:02:36 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c560c55bc1so564787385a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745352153; x=1745956953; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9u1inJLOLfQh6u+GzwXvGD1x0ZTwyyXPt4wVXYzgNE=;
        b=OzPtQj2dQXS/He1jSdstCKrNGAYz1ooG5EJRB0RNnDkPlRoQ/zBn0HRw3rqqvBWyvN
         xFY41wwVpeZUA/rfb4LLVySxijc6yl8D2OR7wjyvzSXKJH/olTyAeA8xdrCpOtnp4gA8
         YxJXGu9ANUoO2WMF39CUPGUiFiwQVa6xhTa+hcSeaxJ7l6vJCLr+XU1G+UYmNutDN2Ex
         L9NYqQuvNB2ls31QWZ1r+p0rzzQ4g8ctxsX9BZ4aj7CMqPtZZt2G6QbmD4ecRYmrYu4n
         IWI7q1ed7Ky85fQu5DgjQ8MOUhduRU5p/G9vBL3SwaQHM4DXffHrC6altDn+9hwpH3rg
         XHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745352153; x=1745956953;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9u1inJLOLfQh6u+GzwXvGD1x0ZTwyyXPt4wVXYzgNE=;
        b=NAJQAf+iIM2y8xuvW1TASXow4T1vCvXiFWzQwKVJRtxyAE07/YBcVufp5geJE9l6O0
         8P8LF6hDBH5VP+4qQ73AMCVBJ2+ADKqI35Ecc+G+zaZP8d4PTOm1ttFX9cHXtZaW0eGD
         aFrhljkGPKo6AxRT+KxhjNwVxO1uV8A8h7yGFF0OuGKVLovLPL6jRxH0+ZtkOvXIJs6a
         On5YqkVn4I4gvpQz2CCg3owIFWs3q+IuajSjP8dRtNtSvFIDdGDyHt2pNyrRlZf6znKY
         5zO/LfVwoyzGJfpkjvUl1F8I2F8lXFrKnN1PnslrVHyF0zIfvKLhriOaso95A178AINH
         +2VA==
X-Forwarded-Encrypted: i=1; AJvYcCUPXJ3QAg7ECs2dYw4JDgNLQ5p/sGIv1BnpN/xSsdiVWaLDPG/yFLKeln/9bXZinM5vLTtJHq+qv8g3GLDZfrlw@lists.infradead.org
X-Gm-Message-State: AOJu0YzHVPvfh+sKPtmYkZ5GVSHmozza/Z7+whmAFCTzPNX8fAnasLQl
	SjZ3qV6KnXdp1U5/BCybVQX3PU66mtfxHSaQDHoI1U56aXBfTAMfE9oE6jR5iNi7ytxSeyBJ9k7
	F3r8=
X-Gm-Gg: ASbGnctpHj1GUsO9/U9XdbTc2GWV23YIezlX7tjlClEu8Pe2I7ksaVffD+FlTGiyYg+
	2IJBe+q9x560DHP5/ckmwTRpK3cIQzS/Zl8DMh0h6ATVLf3HY9hteYeErfh6lrzKF1k4t0vsr5o
	f/JUj2zk7LSr11ZpIMlohzh8LgtGLI65d/pk568rsjFCa9roPv8oGjMOdl82y3RW3LFDxqgC0kI
	HmtR12cv9JRXxla8R1TNqjdFSUNrB3qqLqW9WepPQwkd1+UE3QmeHgvmekv4L8SmzYsCIhJPMTA
	IKExlrWBl4dMl/Y0KGxV0ndB0tCcM+qMklaaLFK0nwwQjA==
X-Google-Smtp-Source: AGHT+IEyfUity8IZHL89fVip+YlKPkQeYXQ/cc/i4hOtn80oieQH71fbgk3bqPItSdc1oVh2sxqqRw==
X-Received: by 2002:a05:620a:45a6:b0:7c5:5d4b:e62a with SMTP id af79cd13be357-7c92805f2f4mr3022695985a.54.1745352153635;
        Tue, 22 Apr 2025 13:02:33 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8f3c5sm593665885a.37.2025.04.22.13.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:02:32 -0700 (PDT)
Message-ID: <5f215b62927438061eb004694847705406a6814c.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/3] media: verisilicon: add WebP decoding support
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
Date: Tue, 22 Apr 2025 16:02:31 -0400
In-Reply-To: <20241121131904.261230-3-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
	 <20241121131904.261230-3-hugues.fruchet@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_130234_782026_CDEEB954 
X-CRM114-Status: GOOD (  16.93  )
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
> Add WebP picture decoding support to VP8 stateless decoder.

This is a bit short. I believe I've asked to explain why its fine to
bump the NV12 max width/height to 4K here or in the code. Also, will
need a simple port once the PIX_FMT is changed.

Nicolas

>=20
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
> =C2=A0.../media/platform/verisilicon/hantro_g1_regs.h |=C2=A0 1 +
> =C2=A0.../platform/verisilicon/hantro_g1_vp8_dec.c=C2=A0=C2=A0=C2=A0 | 14=
 ++++++++++++++
> =C2=A0.../media/platform/verisilicon/hantro_v4l2.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 ++
> =C2=A0.../platform/verisilicon/stm32mp25_vpu_hw.c=C2=A0=C2=A0=C2=A0=C2=A0=
 | 17
> +++++++++++++++--
> =C2=A04 files changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> index c623b3b0be18..e7d4db788e57 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> @@ -232,6 +232,7 @@
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_DEC_CTRL7_DCT7_START_BIT(x)	=
	(((x) &
> 0x3f) << 0)
> =C2=A0#define
> G1_REG_ADDR_STR					0x030
> =C2=A0#define
> G1_REG_ADDR_DST					0x034
> +#define G1_REG_ADDR_DST_CHROMA				0x038
> =C2=A0#define G1_REG_ADDR_REF(i)				(0x038 +
> ((i) * 0x4))
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_ADDR_REF_FIELD_E			BIT(1)
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_ADDR_REF_TOPC_E			BIT(0)
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> index 851eb67f19f5..c83ee6f5edc8 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> @@ -307,6 +307,12 @@ static void cfg_parts(struct hantro_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0
> G1_REG_DEC_CTRL3_STREAM_LEN(dct_part_total_len),
> =C2=A0			=C2=A0=C2=A0 G1_REG_DEC_CTRL3);
> =C2=A0
> +	if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_WEBP_FRAME)
> +		vdpu_write_relaxed(vpu,
> +				=C2=A0=C2=A0 G1_REG_DEC_CTRL3_STREAM_LEN_EXT
> +					(dct_part_total_len >> 24),
> +				=C2=A0=C2=A0 G1_REG_DEC_CTRL3);
> +
> =C2=A0	/* DCT partitions base address */
> =C2=A0	for (i =3D 0; i < hdr->num_dct_parts; i++) {
> =C2=A0		u32 byte_offset =3D dct_part_offset +
> dct_size_part_size + count;
> @@ -427,6 +433,12 @@ static void cfg_buffers(struct hantro_ctx *ctx,
> =C2=A0
> =C2=A0	dst_dma =3D hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
> =C2=A0	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
> +
> +	if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_WEBP_FRAME)
> +		vdpu_write_relaxed(vpu, dst_dma +
> +				=C2=A0=C2=A0 ctx-
> >dst_fmt.plane_fmt[0].bytesperline *
> +				=C2=A0=C2=A0 ctx->dst_fmt.height,
> +				=C2=A0=C2=A0 G1_REG_ADDR_DST_CHROMA);
> =C2=A0}
> =C2=A0
> =C2=A0int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> @@ -471,6 +483,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> =C2=A0		reg |=3D G1_REG_DEC_CTRL0_SKIP_MODE;
> =C2=A0	if (hdr->lf.level =3D=3D 0)
> =C2=A0		reg |=3D G1_REG_DEC_CTRL0_FILTERING_DIS;
> +	if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_WEBP_FRAME)
> +		reg |=3D G1_REG_DEC_CTRL0_WEBP_E;
> =C2=A0	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
> =C2=A0
> =C2=A0	/* Frame dimensions */
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index 2513adfbd825..7075b2ba1ec2 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -470,6 +470,7 @@ hantro_update_requires_request(struct hantro_ctx
> *ctx, u32 fourcc)
> =C2=A0		break;
> =C2=A0	case V4L2_PIX_FMT_MPEG2_SLICE:
> =C2=A0	case V4L2_PIX_FMT_VP8_FRAME:
> +	case V4L2_PIX_FMT_WEBP_FRAME:
> =C2=A0	case V4L2_PIX_FMT_H264_SLICE:
> =C2=A0	case V4L2_PIX_FMT_HEVC_SLICE:
> =C2=A0	case V4L2_PIX_FMT_VP9_FRAME:
> @@ -492,6 +493,7 @@ hantro_update_requires_hold_capture_buf(struct
> hantro_ctx *ctx, u32 fourcc)
> =C2=A0	case V4L2_PIX_FMT_JPEG:
> =C2=A0	case V4L2_PIX_FMT_MPEG2_SLICE:
> =C2=A0	case V4L2_PIX_FMT_VP8_FRAME:
> +	case V4L2_PIX_FMT_WEBP_FRAME:
> =C2=A0	case V4L2_PIX_FMT_HEVC_SLICE:
> =C2=A0	case V4L2_PIX_FMT_VP9_FRAME:
> =C2=A0		vq->subsystem_flags &=3D
> ~(VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
> diff --git a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> index 833821120b20..c291b1560e20 100644
> --- a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> @@ -22,10 +22,10 @@ static const struct hantro_fmt
> stm32mp25_vdec_fmts[] =3D {
> =C2=A0		.codec_mode =3D HANTRO_MODE_NONE,
> =C2=A0		.frmsize =3D {
> =C2=A0			.min_width =3D FMT_MIN_WIDTH,
> -			.max_width =3D FMT_FHD_WIDTH,
> +			.max_width =3D FMT_4K_WIDTH,
> =C2=A0			.step_width =3D MB_DIM,
> =C2=A0			.min_height =3D FMT_MIN_HEIGHT,
> -			.max_height =3D FMT_FHD_HEIGHT,
> +			.max_height =3D FMT_4K_HEIGHT,
> =C2=A0			.step_height =3D MB_DIM,
> =C2=A0		},
> =C2=A0	},
> @@ -42,6 +42,19 @@ static const struct hantro_fmt
> stm32mp25_vdec_fmts[] =3D {
> =C2=A0			.step_height =3D MB_DIM,
> =C2=A0		},
> =C2=A0	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_WEBP_FRAME,
> +		.codec_mode =3D HANTRO_MODE_VP8_DEC,
> +		.max_depth =3D 2,
> +		.frmsize =3D {
> +			.min_width =3D FMT_MIN_WIDTH,
> +			.max_width =3D FMT_4K_WIDTH,
> +			.step_width =3D MB_DIM,
> +			.min_height =3D FMT_MIN_HEIGHT,
> +			.max_height =3D FMT_4K_HEIGHT,
> +			.step_height =3D MB_DIM,
> +		},
> +	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> =C2=A0		.codec_mode =3D HANTRO_MODE_H264_DEC,

