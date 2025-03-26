Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F381FC3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 20:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xizmRrUy/BwEbc5ygOnCziYgTJp+/wXS4T9DQi0oG8o=; b=ZhzuX5z7nxHjdFyZQJuLF1gz0q
	m+YbSSqPRuak94NrCaQwDJQrxi4NPp6REsKCC2EPGgRV46S2SQsAjrw35AVum5acHHnaOuzjYz0mc
	RezOCmlYBKT3V3xB3GqdvyTtfWxe6mdwpkzT8nVh1hj2vypEyM7dojChb+0LanCLgy2o6bsP6tkMi
	toNMMZM5FccNFC3xcHdM2CLh3+7zc/f9VUltGLwvaFH9yRyQaekgz17yzn6MRRwqFVoLDnrriCcgS
	3s2/a1fIfwmfFBOl/PtxqBKrt3tLTcEWNYk/fni6y31fHsp1LzV0tPpbU8Qcsvi5TFHPl79izxT/6
	2ZgCHx0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXhA-00000009adr-1iVt;
	Wed, 26 Mar 2025 20:49:52 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXfR-00000009aMx-0UYP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 20:48:06 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c546334bdeso24845285a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743022083; x=1743626883; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xizmRrUy/BwEbc5ygOnCziYgTJp+/wXS4T9DQi0oG8o=;
        b=QM5Zy4uCUdsXo7Aszgjzn2B1Cd57ivWdhIwfBV3fStVDIyhbimrwm5VVsIvv5iIza8
         VuFSAXiPQh03+LjSD6zRYXehWX6bzBtrqQsxdqeWSJQ1qsW5paMtN7JluUAS4cVbN+3o
         rlrKGgklebifPFAcUW4rvtQY3SFKC2ZDyBTiAuKtKD+K5sjU1Nhv51Ms2NViGuE539k6
         xbtjcbC5qViux0OvJopuwDyhqe2e8RRk4/RZe6m+EkW5GatQaWVdWAwpDzWbjf1NisU+
         N3Dmt0jeq1V9E/djnLa7VE2rTEDLOyVnZDTyN5/WCsmJFJXxQW5Gd3lMVAqamt3D42eU
         k5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743022083; x=1743626883;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xizmRrUy/BwEbc5ygOnCziYgTJp+/wXS4T9DQi0oG8o=;
        b=ZqB/nfRTaoFxiDbJWbKMPoGT1sTReKZIAhZ7gqShMhbGWZ4UdYfeuPNYTku+yUT7iI
         ySpppp6rK5/9FiQ0eSa1VVq33YpTmV4awlLF5Vws9eBmCJljDtouCgCg8ymoHWFbNx29
         cF54SMI471fx3KZI4EjE1Fs2pHaNc/KISuuTmFAK4nbTyOD11Wjum1ZRxlFemhT8xqIP
         IVn1JngluujfEROi16+5boqOxghWPLb+UTVf/9WMCWQdLNoDhuhesMiiQD8rIKF7v1N1
         54joRjXb40Z8afT4cHv2PJNkqi0XRiJVcdrW/wxZhiBb1oUPUavwVEH9nNToDN1Zq9Hy
         bqOw==
X-Forwarded-Encrypted: i=1; AJvYcCXm/EYDJx+qN+qjMb0QyuYvPQ1Y/mGjWjlYwpnjrt0l5y45vms23fjpZ+up7Ld/pexwX3upiEDFns3fGvksfduu@lists.infradead.org
X-Gm-Message-State: AOJu0YyHasgRgRjKNQzHVZUN4N6i2Vm9yvh8O7IMQB6224jdOj9elQKR
	0ist4oel0dMDEImf+4wXHVDa9UlkmZzjpEqIiwQHnTLcovpOGYpJj1w4/mZ+aTM=
X-Gm-Gg: ASbGncsqfLBWag4dtTdmvFbvAkudzm401pqKg8Ot1Bpquzdc6OwSUJkF1/sXPOcwyXl
	WDIpOmPuLRDA2qU1sPDfH4YHIm0RwZRgQiKCC2Vwg2DpR0FIcahGPXsXbqiIOKBRUG4jEZiePOz
	FtmFuQBeFpPoTgJNJfL+eZZuiBMOb2+V8JE9xoKZ9+P+2PMXjnhZSvvgEAnnQIpMIPjmgCubKPE
	E6QrbXLczrWeXTWOGQq8YKz/PGKSQqNIABmOQCc8xvUor8strC6R8ElmaEx3h6Sr0730r1ur7hn
	B5Ln+PSl7EsvshbDIHPxxgyu8Q6cRlZ/kom5NrCh9IvlZ58OdQ==
X-Google-Smtp-Source: AGHT+IGMCWLDibsmVi5EcOxTULZGbG+WtX8/19nsRNAN+Bh0W6Son3SwU9gdOK6uViYv86bCBZjgzw==
X-Received: by 2002:a05:620a:4247:b0:7c5:6396:f161 with SMTP id af79cd13be357-7c5eda82f01mr176278785a.49.1743022083288;
        Wed, 26 Mar 2025 13:48:03 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b9348e23sm806915085a.78.2025.03.26.13.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:48:02 -0700 (PDT)
Message-ID: <c61a522d82bd9375e73d6f9c57f8ca4b0de258e0.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/2] media: amphion: Reduce decoding latency for HEVC
 decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 26 Mar 2025 16:48:01 -0400
In-Reply-To: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
References: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_134805_285995_6B11DD8C 
X-CRM114-Status: GOOD (  21.29  )
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

Le mercredi 05 mars 2025 =C3=A0 14:26 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The amphion decoder firmware supports a low latency flush mode for the
> HEVC format since v1.9.0. This feature, which is enabled when the
> display delay is set to 0, can help to reduce the decoding latency by
> appending some padding data to every frame.

Just curiosity, does it stay spec compliant or not ? Perhaps share some
compliance (fluster) results ?

>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v3
> - Improve commit message as recommended
> v2
> - Improve commit message
> - Add firmware version check
>=20
> =C2=A0drivers/media/platform/amphion/vpu_malone.c | 22 ++++++++++++++++++=
---
> =C2=A01 file changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index 5c6b2a841b6f..1d9e10d9bec1 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -68,6 +68,9 @@
> =C2=A0
> =C2=A0#define MALONE_DEC_FMT_RV_MASK			BIT(21)
> =C2=A0
> +#define MALONE_VERSION_MASK			0xFFFFF
> +#define MALONE_MIN_VERSION_HEVC_BUFFLUSH	(((1 << 16) | (9 << 8) | 0) & M=
ALONE_VERSION_MASK)

Just a suggestion, could also use an inline function.

#define MALONE_VERSION(maj, min, inc)   (((maj) << 16) | ((min) << 16) | (i=
nc)) & MALONE_VERSION_MASK)
#define CHECK_VERSION(iface, maj, min)	((iface->fw_version & MALONE_VERSION=
_MASK) >=3D MALONE_VERSION(maj, min, 0))

> +
> =C2=A0enum vpu_malone_stream_input_mode {
> =C2=A0	INVALID_MODE =3D 0,
> =C2=A0	FRAME_LVL,
> @@ -332,6 +335,8 @@ struct vpu_dec_ctrl {
> =C2=A0	u32 buf_addr[VID_API_NUM_STREAMS];
> =C2=A0};
> =C2=A0
> +static const struct malone_padding_scode *get_padding_scode(u32 type, u3=
2 fmt);
> +
> =C2=A0u32 vpu_malone_get_data_size(void)
> =C2=A0{
> =C2=A0	return sizeof(struct vpu_dec_ctrl);
> @@ -654,9 +659,16 @@ static int vpu_malone_set_params(struct vpu_shared_a=
ddr *shared,
> =C2=A0		hc->jpg[instance].jpg_mjpeg_interlaced =3D 0;
> =C2=A0	}
> =C2=A0
> -	hc->codec_param[instance].disp_imm =3D params->display_delay_enable ? 1=
 : 0;
> -	if (malone_format !=3D MALONE_FMT_AVC)
> +	if (params->display_delay_enable &&
> +	=C2=A0=C2=A0=C2=A0 get_padding_scode(SCODE_PADDING_BUFFLUSH, params->co=
dec_format))
> +		hc->codec_param[instance].disp_imm =3D 1;
> +	else
> =C2=A0		hc->codec_param[instance].disp_imm =3D 0;
> +
> +	if (params->codec_format =3D=3D V4L2_PIX_FMT_HEVC &&
> +	=C2=A0=C2=A0=C2=A0 (iface->fw_version & MALONE_VERSION_MASK) < MALONE_M=
IN_VERSION_HEVC_BUFFLUSH)

So if could be:
	    !CHECK_VERSION(iface, 1, 9)

There might be even better ways, this is not a hard request from me
though.

> +		hc->codec_param[instance].disp_imm =3D 0;
> +
> =C2=A0	hc->codec_param[instance].dbglog_enable =3D 0;
> =C2=A0	iface->dbglog_desc.level =3D 0;
> =C2=A0
> @@ -1024,6 +1036,7 @@ static const struct malone_padding_scode padding_sc=
odes[] =3D {
> =C2=A0	{SCODE_PADDING_EOS,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_PIX_FMT_JPE=
G,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {0x0, 0x0}},
> =C2=A0	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {0x15010000, 0x0}},
> =C2=A0	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,=C2=A0=C2=A0=C2=A0 =
{0x15010000, 0x0}},
> +	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 {0x3e010000, 0x20}},
> =C2=A0};
> =C2=A0
> =C2=A0static const struct malone_padding_scode padding_scode_dft =3D {0x0=
, 0x0};
> @@ -1058,8 +1071,11 @@ static int vpu_malone_add_padding_scode(struct vpu=
_buffer *stream_buffer,
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	ps =3D get_padding_scode(scode_type, pixelformat);
> -	if (!ps)
> +	if (!ps) {
> +		if (scode_type =3D=3D SCODE_PADDING_BUFFLUSH)
> +			return 0;
> =C2=A0		return -EINVAL;
> +	}
> =C2=A0
> =C2=A0	wptr =3D readl(&str_buf->wptr);
> =C2=A0	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + str=
eam_buffer->length)

With or without the adjustments.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com


