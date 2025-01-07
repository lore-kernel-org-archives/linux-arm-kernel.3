Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8859DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fc9TAWTYLPXygf26AxVFot53JgJe8sMA4p9Ceubb2BA=; b=VI5F/ijZyNoAdgBGRH6XAJM1js
	tDcwCNGWY50cD+xB/uAJkKouPMi4fzV9BSZw4C+hFsFLz7fQJeHX+x/naLu/QMPwuNRXTM0PQq9vh
	6GyQMcGlgAvJTtpTbIt6vRYlx6xfiiJhVYHgE/IKNSn9nFOPTiWr/5P5gm9E+1xKMyPX/KyW7/EuE
	5Kxr/EJx5Fcjy+jHCuXcpcYvg4ONh31sBTGVQlYrGHjmmGxFmLg8+xcCqQlxaTcXddksxGVdSuKlr
	QNgQwbhuX1RHZcilLIaEsqAWlWFS53dvH4oA+WSm/b1lQ2I3IHMmMn+JNB0pKKBKt5XcBYyLyeYCX
	umcnk07w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCoq-00000005ijh-49H6;
	Tue, 07 Jan 2025 16:52:41 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCSF-00000005dU0-0L3y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:29:24 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso21572301276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 08:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736267357; x=1736872157; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fc9TAWTYLPXygf26AxVFot53JgJe8sMA4p9Ceubb2BA=;
        b=Z7Ohb0D+gvU/FFFTaEYFxbNFpd12GDGuuiR60luB9s41lXeMwp9rfJKFYFupKVJhAk
         BVZbUVIwNrcqZix9MNOOs8XPhF5hXDjLKhFdzNA4dRzvbUdl7VfevVcczSepEAYAXAue
         HWJtEYgPTpqDSiAVsd9aQPYNq5HL5o9kSkwmpj+RPOz1kJuGrJZkLcbybR9CdTWFVsKU
         yOZoHq3415TDitE1dsHDwuet9ipmne61fMoApwq8fUfUi15wjXtIaMx+borGsJoInKY9
         AHvSLi+YFZGhp8wbEbgEnAvn2CQUzneRBtAVUtv3eaNPrl9taiKw/W13yU4AbEn+C6hS
         Mizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736267357; x=1736872157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fc9TAWTYLPXygf26AxVFot53JgJe8sMA4p9Ceubb2BA=;
        b=Rqx5UwT/REbwieN1jFga7eSO2kvr6LizHcV3zSa4yJKA93wdXstRYkwbdp5AkYEGs+
         QjvI/pEMPjGBK3qAPhg3cHSZz09PmhKyCTE3rpRdB4jwZiVszgparDL0znSKt4lfuNr0
         R+Y9cikcY00iofQKTCAo8sWxTW41MPNoTQCnkFp93QJ5eLwMPQm0uxV1kSysZUL48dfk
         BaluoWCpYIAMIkI30n79eYhnj9LHV0CGfXEhjCAuuzSvUWMxAgYLDiXXSbnWcryAVx7N
         JzFTT+BaJ5O8gpH7pqovEZzQfEJSrJ980AQbCAJILMQobVYXp+0I3Tv8c/Bv+c2hFpIt
         sLMA==
X-Forwarded-Encrypted: i=1; AJvYcCWGrkQY73hPhOUxXnHQfIMeDd743JiYn/YyVreGp4pz3uO+MSvwTGivd3en5R7tgeh6IzZG9z6HlWTcgUessWiE@lists.infradead.org
X-Gm-Message-State: AOJu0YwY6Ir3A4aP5bVxY6QnsLXxd1WTCoNFDnox2SmN8yw6qobHO+9Q
	1HQaHJLOqacaYu3bfBWT2ZcLcKvJ0Zcy10yP7seRedgtCFKfMD3gXhUI9ZQFRGHxrXJeGM/ipOD
	GR4P15wipminsGIHqD7FeqyYHX0e0qak3r7DqWw==
X-Gm-Gg: ASbGncvem47lVOyCm4LZju9w3vOd1utry9PYLuHGvihDsQS5MQRhKyws5mm0mqjT+MB
	F3cbQi1VO7jS3a1Rpkk3Q6UdP0CrWPri/nNZkx9+rSHhygb+9hDJA08Rzm7/5FE9pjkxVOw==
X-Google-Smtp-Source: AGHT+IHE9JCAToCSl3COyvQMx5Y1P1UpkdQ9O+c29S+dQDMjILkfPa180zWfWuIGALyqsVOAyrBZX1J+I8N/WVKwvWM=
X-Received: by 2002:a05:690c:6711:b0:6e3:15ad:a560 with SMTP id
 00721157ae682-6f3f8110608mr487206047b3.12.1736267354719; Tue, 07 Jan 2025
 08:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
 <20241220-media-rpi-hevc-dec-v1-3-0ebcc04ed42e@raspberrypi.com>
 <d2f047cd-5c50-454f-95be-601edb79466d@collabora.com> <CAPY8ntBNse4Dq9E49QO3ipDbb+uMipe+MuLxW_Jpszu9gQgpww@mail.gmail.com>
 <cfa4e4ebd9015a291e513fc22ec70821976e56ce.camel@ndufresne.ca>
In-Reply-To: <cfa4e4ebd9015a291e513fc22ec70821976e56ce.camel@ndufresne.ca>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 7 Jan 2025 16:28:54 +0000
Message-ID: <CAPY8ntAxkdyngsCFfYNGNv6ObJU1PCMPvr_61R14a2H+dbZm2Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Robert Mader <robert.mader@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082919_168083_08ABB30D 
X-CRM114-Status: GOOD (  35.24  )
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

On Mon, 6 Jan 2025 at 20:52, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Le jeudi 02 janvier 2025 =C3=A0 12:52 +0000, Dave Stevenson a =C3=A9crit =
:
> > Hi Robert
> >
> > Resending this reply as replying from my phone before the Christmas
> > break sent it as HTML :-(
> >
> > On Sat, 21 Dec 2024 at 17:38, Robert Mader <robert.mader@collabora.com>=
 wrote:
> > >
> > > Hi, thanks for the patch.
> > >
> > > On 20.12.24 17:21, Dave Stevenson wrote:
> > >
> > > Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
> > > to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> > >  include/uapi/linux/videodev2.h       | 5 +++++
> > >  2 files changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> > > index 0304daa8471d..e510e375a871 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1377,7 +1377,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdes=
c *fmt)
> > >   case V4L2_PIX_FMT_NV16M: descr =3D "Y/UV 4:2:2 (N-C)"; break;
> > >   case V4L2_PIX_FMT_NV61M: descr =3D "Y/VU 4:2:2 (N-C)"; break;
> > >   case V4L2_PIX_FMT_NV12MT: descr =3D "Y/UV 4:2:0 (64x32 MB, N-C)"; b=
reak;
> > > + case V4L2_PIX_FMT_NV12MT_COL128: descr =3D "Y/CbCr 4:2:0 (128b cols=
)"; break;
> > >   case V4L2_PIX_FMT_NV12MT_16X16: descr =3D "Y/UV 4:2:0 (16x16 MB, N-=
C)"; break;
> > > + case V4L2_PIX_FMT_NV12MT_10_COL128: descr =3D "10-bit Y/CbCr 4:2:0 =
(128b cols)"; break;
> > >   case V4L2_PIX_FMT_P012M: descr =3D "12-bit Y/UV 4:2:0 (N-C)"; break=
;
> > >   case V4L2_PIX_FMT_YUV420M: descr =3D "Planar YUV 4:2:0 (N-C)"; brea=
k;
> > >   case V4L2_PIX_FMT_YVU420M: descr =3D "Planar YVU 4:2:0 (N-C)"; brea=
k;
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index e7c4dce39007..f8f97aa6a616 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -687,6 +687,11 @@ struct v4l2_pix_format {
> > >  #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /*=
 12  Y/CbCr 4:2:0 16x16 tiles */
> > >  #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2'=
) /* Y/CbCr 4:2:0 8x128 tiles */
> > >  #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', =
'2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> > > +#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /=
* 12  Y/CbCr 4:2:0 128 pixel wide column */
> > > +#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0'=
)
> > >
> > > Should these be upper-case Cs instead? So they compatible with the pr=
eviously used downstream values?
> >
> > No, this is deliberate.
> >
> > Downstream was using a single planar format, with extra complexity for
> > determining the chroma offset per column, and weird handling required
> > on bytesperline.
> > Having had discussions, switching to a multiplanar format (hence MT in
> > the name) removes those complexities and means we don't need to do
> > anything weird in the v4l2 format definitions.
> >
> > Reusing NC12 and NC30 fourccs will give us grief over backwards
> > compatibility, hence lower case for the new version.
> >
> > I have a patch on [1] that adds back in NC12 and NC30 for downstream
> > just so we don't break existing users, but see no point in upstreaming
> > that.
>
> Yes, I think its fair to avoid incompatibility there. Are there matching =
Mesa
> patches coming, since without that we are back to square one, where the f=
ormat
> remains unusable. NC12 have a matching (mainline) DRM_FORMAT_NV12
> DRM_FORMAT_MOD_BROADCOM_SAND128 pair. I believe a new modifier is needed =
and
> will serve both Nc12/30.

The current DRM_FORMAT_MOD_BROADCOM_SAND128 taking the column height
as the parameter is apparently contrary to how DRM modifiers are meant
to be used. You're not allowed to have a genuine runtime parameter in
there, and all potential values for parameters have to be listed out
in the in_formats blob.

I have a patch on [1] to add DRM_FORMAT_MOD_BROADCOM_SAND128(0) as a
modifier which then takes the height passed in to addFB2 to be the
column height. With luma and chroma now in independent buffers via the
multi-planar API, that solves the problem, and we don't need a new
modifier. I will submit that to dri-devel in the next week or so.

I've pinged Igalia to sort the equivalent Mesa patch for me.

 Dave

[1] https://github.com/6by9/linux/commits/rpi-6.12.y-hevc_dec patch
"drm/vc4: Add algorithmic handling for SAND". I can't give a hash as I
rebase that branch.


> Nicolas
>
> >
> > > P.S.: Coincidentally Gstreamer just landed support for NC12 in https:=
//gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7355 and ther=
e is also a link to experimental NC30 patches. So happy to see this series =
appear upstream :)
> >
> > Ooh, nice. I'll give it a test when I'm back in the office.
> >
> > Dave
> >
> > [1] https://github.com/6by9/linux/commits/rpi-6.12.y-hevc_dec/
> >
> > > + /* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
> > > + * a 128 bytes / 96 pixel wide column */
> > > +
> > >
> > >  /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm=
 */
> > >  #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  =
BGBG.. GRGR.. */
> > >
> >
>

