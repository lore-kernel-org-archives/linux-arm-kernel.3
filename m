Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95D6C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYsIXJ0VH1fBZwKk67xkFa5qHHB2W1M/DHJM5j7x72w=; b=HqMcbW5RW7oLi6j/0QvH6YaETn
	3PAZvlsglwAAncwtdJf0Gxf3Gs3PyiCqLDbCf8FOCYmOrtpoK0sa7ZpmyPxLnyZ0x1n+fv+qzfMca
	CdPoiFhhs1uIwm17jAwhyU9PzQxVNJKHinBZ36quQ8AaXPopE14kK5yHDgs+PLYs2quLVWYQkmTja
	yIFmVdDWqGoToPE5lAZdJ+38/FKjKNIGmi+rzYJFwZvf+518RwEBHu38h/YdUUcFJpO5hkgQlYyw9
	oclcEoqYcd/KXWtSxXZYU3z2zxgrNUyZOnMV1hu7n+M1okbK+8IEirvBHHEy8EER5FUAOlj6II2z+
	DGv3IfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ji7-00000008P1d-3uiN;
	Tue, 22 Apr 2025 19:55:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JgG-00000008OtM-2CVt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 19:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=rYsIXJ0VH1fBZwKk67xkFa5qHHB2W1M/DHJM5j7x72w=; b=p9Dd8Mdv7/dzIWJ46RBq1pMLeN
	a9Bw11lgTD2pgQDnoEVjkhm7CN3TP/AgoGzCB3oxxv8Hkap1uAHK33cfs6mniq3Uwe4pw3TkwG4K6
	JhlLH817A44CqS06IPrAPkkPNeHyy4ExnjUAPX1q/JA/40stM3YchmzKxjZyMBd5psXu7dJA1DJJN
	yWXb4jgx4SPngYGvPYf7yHCF7CsVEV7qNrG1X1I33UdnWpaDj1GTBjzk2PwuZR8ZhVej5Wg+uZNe5
	I1+3UIc7UHlZb4yyOyoqqK3eb0eJMNemg71gmR9o1bVCWIJbV5AV5SkSS8c7Ev/yORexFR2Sd3mEg
	W2MGdN6A==;
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7JgC-0000000BIty-2yo5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 19:53:19 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6e8ffa00555so47901446d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 12:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745351594; x=1745956394; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYsIXJ0VH1fBZwKk67xkFa5qHHB2W1M/DHJM5j7x72w=;
        b=tzq+mRS8JSCQ093ZRDHmaaUSYT8iH28skb9U4P0UteRDGRLT27MYDWA+00mOZjenyo
         NfRYEQqGQ2YNHr1gyiwBg6UsfttCB8UBNdFEa2l+SxvA2m+OJUTJDKB4dXuufuPlUbYP
         BgwqaiUTP+3iBIqBnvCxDFDFIDxMualLh9KHybK+tolAmNEBS6oVNatjlUzYlA+Qbp0b
         b601U4vQPchRtbVvfENtR4iRdUPLwXETq6L1mBTq9zQrgdcFsLKtnvtULanNMkJ1/euO
         wOzRddUr92z3YMyVlqSiy8JkTn5t08kxcAKGTFF3UekirHCXxMlMOeuigCYhrU3MgyC9
         G9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351594; x=1745956394;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rYsIXJ0VH1fBZwKk67xkFa5qHHB2W1M/DHJM5j7x72w=;
        b=Pp1UGHUO/33Ie9Kd2xjvYL5JcTnGo/cwMqQKMi8la3Cuew9GUihY+sfw8CqC0jfcAp
         QDrb6AdN/T/HpZwAjAssg6ObDlWOJVe7TmtNDtIG0UdatMqBuJJ4hChSjf9dLzQ11W2U
         sp3vLFPmRtssZvD1V0Dn/olQ4v9Ggo7zlz0KqYzScVkoNPpC2boaxhTF969CdBmSlSXs
         GXcSvWt16Fd9h5qltNBzX9Et9NoHYqnmngpVYZs/3ACWPsNk8SC1TxjFAitRU0KD4BJr
         3WvAozEjiBuUo+DFxHZMhm6n645W8LxrVdrjyg0fN3AXm9OM0EmnIsEVyP3X+mhsWuB5
         ZHoA==
X-Forwarded-Encrypted: i=1; AJvYcCW8n4dxDLoFRR4k6kA4vsU0QeLW2H8FHyK27y9YGMxAwHWwfHDWbesEGz0+MKj4pJBtQhFxSfDTbQcZsjeuxIPB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8nJ2WvCh/aCqN5figKu1vYVeKeKNHO3hTkkZsdeG+J3O/CcsK
	2G8H5CPsEJqAvznKbhYJsBKGOaDu5UgymLVLj5cgMen4WbYTrP6vZ7wniP8DgAg=
X-Gm-Gg: ASbGncszS5fFe7biFT4h6dYUzVCRz0mLoWnW0gqL9fci/kBYyZgycbzjU7oC+4PybOb
	C8WhyuTNgpowe+B5qj6VdXNDKOKpSvFG1tmqdAan5syAQLlf6tHkgoIzWNN8Bxeq0duvAmyfZFB
	L3G/5/vIb24VW8AzX9Knxeya+ivB/sBQ8nf9kvz2Bd47ctWwgc3Rd5grXDd2RcNIVH6Je0MAbAg
	3KezRFwlsb0OEJc2u3pt2DxLZyncSlUSAep8G3dLnaJlAsc7IMaKA1sEnM5acW9TBtwq/zXta58
	WLQz22zXWfJZxcb6sozKAF+SVwkstTYKGQ1Fn+ephB04Xw==
X-Google-Smtp-Source: AGHT+IFx37IZxz2XZRa4HUxytJgkJVsEXuyDvydowgtq1jU/C5yFgExdGRxaZiK2dG6HIZZz2N702A==
X-Received: by 2002:a05:6214:21e7:b0:6e8:f4e2:26ef with SMTP id 6a1803df08f44-6f2c4656c2cmr318324046d6.31.1745351593565;
        Tue, 22 Apr 2025 12:53:13 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcfd0sm61261036d6.82.2025.04.22.12.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:53:12 -0700 (PDT)
Message-ID: <419ba5e518be4a35ed0277f749ca9a317f6bff5c.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/3] media: uapi: add WebP uAPI
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
Date: Tue, 22 Apr 2025 15:53:11 -0400
In-Reply-To: <20241121131904.261230-2-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
	 <20241121131904.261230-2-hugues.fruchet@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_205317_128891_147CFB6F 
X-CRM114-Status: GOOD (  21.01  )
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

sorry for the late come back.

Le jeudi 21 novembre 2024 =C3=A0 14:19 +0100, Hugues Fruchet a =C3=A9crit=
=C2=A0:
> This patch adds the WebP picture decoding kernel uAPI.
>=20
> This design is based on currently available VP8 API implementation and
> aims to support the development of WebP stateless video codecs
> on Linux.

Should mention that this new pix fmt is added to make it possible to
support both intra-only and VP8 with reference, while advertising
different frame sizes.

>=20
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
> =C2=A0.../userspace-api/media/v4l/biblio.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++++
> =C2=A0.../media/v4l/pixfmt-compressed.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++++++++++
> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 +
> =C2=A04 files changed, 28 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documenta=
tion/userspace-api/media/v4l/biblio.rst
> index 35674eeae20d..df3e963fc54f 100644
> --- a/Documentation/userspace-api/media/v4l/biblio.rst
> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> @@ -447,3 +447,12 @@ AV1
> =C2=A0:title:=C2=A0=C2=A0=C2=A0=C2=A0 AV1 Bitstream & Decoding Process Sp=
ecification
> =C2=A0
> =C2=A0:author:=C2=A0=C2=A0=C2=A0 Peter de Rivaz, Argon Design Ltd, Jack H=
aughton, Argon Design Ltd
> +
> +.. _webp:
> +
> +WEBP
> +=3D=3D=3D=3D
> +
> +:title:=C2=A0=C2=A0=C2=A0=C2=A0 WEBP picture Bitstream & Decoding Proces=
s Specification
> +
> +:author:=C2=A0=C2=A0=C2=A0 Google (https://developers.google.com/speed/w=
ebp)
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index 806ed73ac474..08a989511e7d 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -169,6 +169,23 @@ Compressed Formats
> =C2=A0	this pixel format. The output buffer must contain the appropriate =
number
> =C2=A0	of macroblocks to decode a full corresponding frame to the matchin=
g
> =C2=A0	capture buffer.
> +=C2=A0=C2=A0=C2=A0 * .. _V4L2-PIX-FMT-WEBP-FRAME:
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``V4L2_PIX_FMT_WEBP_FRAME``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 'WEBP'

After plenty of thinking, WebP is a container the support 2 codecs. We
should not name this WebP, but instead VP8_INTRA_FRAME. Meaning, intra
only VP8 decoder.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - WEBP VP8 parsed frame, excluding WEBP R=
IFF header, keeping only the VP8
> +	bitstream including the frame header, as extracted from the container.

This comment will then not be needed, since VP8_INTRA will make it
clear.

regards,
Nicolas

> +	This format is adapted for stateless video decoders that implement a
> +	WEBP pipeline with the :ref:`stateless_decoder`.
> +	Metadata associated with the frame to decode is required to be passed
> +	through the ``V4L2_CID_STATELESS_VP8_FRAME`` control.
> +	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp8>`.
> +	Because of key frames only bitstream, ``V4L2_VP8_FRAME_FLAG_KEY_FRAME``
> +	flag must be set, see :ref:`Frame Flags <vp8_frame_flags>`.
> +	Exactly one output and one capture buffer must be provided for use with
> +	this pixel format. The output buffer must contain the appropriate numbe=
r
> +	of macroblocks to decode a full corresponding frame to the matching
> +	capture buffer.
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 * .. _V4L2-PIX-FMT-VP9:
> =C2=A0
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 0304daa8471d..e2ff03d0d773 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1501,6 +1501,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
> =C2=A0		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr =3D "VC-1 (SMPTE 412M Annex =
L)"; break;
> =C2=A0		case V4L2_PIX_FMT_VP8:		descr =3D "VP8"; break;
> =C2=A0		case V4L2_PIX_FMT_VP8_FRAME:=C2=A0=C2=A0=C2=A0 descr =3D "VP8 Fra=
me"; break;
> +		case V4L2_PIX_FMT_WEBP_FRAME:=C2=A0=C2=A0=C2=A0 descr =3D "WEBP VP8 Fr=
ame"; break;
> =C2=A0		case V4L2_PIX_FMT_VP9:		descr =3D "VP9"; break;
> =C2=A0		case V4L2_PIX_FMT_VP9_FRAME:=C2=A0=C2=A0=C2=A0 descr =3D "VP9 Fra=
me"; break;
> =C2=A0		case V4L2_PIX_FMT_HEVC:		descr =3D "HEVC"; break; /* aka H.265 */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index e7c4dce39007..09fff269e852 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -757,6 +757,7 @@ struct v4l2_pix_format {
> =C2=A0#define V4L2_PIX_FMT_VC1_ANNEX_L v4l2_fourcc('V', 'C', '1', 'L') /*=
 SMPTE 421M Annex L compliant stream */
> =C2=A0#define V4L2_PIX_FMT_VP8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc(=
'V', 'P', '8', '0') /* VP8 */
> =C2=A0#define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* V=
P8 parsed frame */
> +#define V4L2_PIX_FMT_WEBP_FRAME v4l2_fourcc('W', 'B', 'P', 'F') /* WEBP =
VP8 parsed frame */
> =C2=A0#define V4L2_PIX_FMT_VP9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc(=
'V', 'P', '9', '0') /* VP9 */
> =C2=A0#define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* V=
P9 parsed frame */
> =C2=A0#define V4L2_PIX_FMT_HEVC=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('H', =
'E', 'V', 'C') /* HEVC aka H.265 */

