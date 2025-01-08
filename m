Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA919E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 19:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrTGXGCBiyGP6a+D4EJggND3etK0dx/lyg/0RMVHQ5Q=; b=sfJhBI/ixQJWJdZX+V4fLl0JOp
	tM5p3cM8FbBj1S7dlj5f5u6v896sJ+FPbWfoG5OE/KnUgDE1PwFbJvVjXsp/auxpz79E5Tzjy2sUA
	hxNq2HhbG6z7PBGK62paZ0OUVgrSbZhGr1oxrMoP5beZkMNLGShlBmUw32ajsOCsNaBI6anMbb7Lh
	oXR+ORXQjuV3V4ADbifQBmR4UVFNMHXj7ZO7ia4N21enAWDgK7cDYZifVrTlLJdp7MTPncxhr34Am
	QcTBQ71uDDfZQ7njz8KxVZRl4xcg2XbQqTFz9CTaX3H4qi+2WxQtbl2LBpYEB2Ws03KyqosRv8gGk
	EY5Bt4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVbjE-00000009eiY-14WJ;
	Wed, 08 Jan 2025 19:28:32 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVbhz-00000009eUD-0bCr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 19:27:16 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-46783d44db0so607801cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 11:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736364434; x=1736969234; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SrTGXGCBiyGP6a+D4EJggND3etK0dx/lyg/0RMVHQ5Q=;
        b=YJ4xM0/5i4bIircuiIbDuLoyReWkBxRxmhj/T3MNRUoIge1FdD3nFk9V1tnKxbT+lM
         V8R+k1RAxXji/FsnhlZQTpejx2lL8Bb6q4M5nIre1CUNv8Ndcb38onOgTFwm1XusRaAV
         8hOMQz40igMLcb6OFj2+BZgbOZWgUvwwUVIBBetittjOxzQouhfvRenGAgtvvodo2aFL
         JGcNiyEef7bCfyLOSJ2p9+bdx8OqKwdOPf5DMtyRWm2/yD63qMnksoAFW0m/ZFeMn7mr
         bcF6FiyT+Q74eyAsIOOz8nAZd96/d/cfXVzA3mS5Zjm/HqOS9NEWcPiQodziK3OTMG5k
         oUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736364434; x=1736969234;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SrTGXGCBiyGP6a+D4EJggND3etK0dx/lyg/0RMVHQ5Q=;
        b=CNmH2Ah89wIZewQmKXyZCduR3hKcXv+PAoJDvbz6RerekeqiXXbisHlHEXsjlPK2gn
         L+ut4BfBDDGCTkX4kv6ItTZeY792hRwsivoErVFQ0xTCKgAfYmQIHjoRX3whQjguzvhn
         7lvp6JpTTSp3vY8I7dLxN7JY1lbZLoxarER+18spHKOUD8g7OFpL0XbOrr/BlcXuYj6o
         mC/+us6JGeCi7Eesz7LDFXLqM7P6AeU76su+Eq6dtf7dqNidFCqkhMiNTtBXThsJz79P
         xBwBqmHNjMaQdZJKgHUtyEyo+sPpCfVfSnwDhuiL6/ulIGazTNKAJkZcpAOz5vHmrITP
         xECg==
X-Forwarded-Encrypted: i=1; AJvYcCURdku6JzShXQCXAb98+Of5/ul9lA9Sqw1Tcrc8pC/TZd5PqJj3HIP03qFYhbPRrrTOCW8SycjeyMwInS3Iq1CI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+N4xqNeIlbe/ZbCNQQ0xIAB85D5BHLelltlGSTqMdySXNFIEJ
	GrT9s5KTYPBY21bqNiPYsufw+tT55es1JuqV/hqhIb0neN7At2fjI3rCDim0Gks=
X-Gm-Gg: ASbGncv2WKw2zqdLIxSm6S/tSgCMcx2EWYILsxkKEoXGf2xj72cvMjj9zdLzjTmx2xN
	5iZOnsLctpJ7adLdqw5GZJ2xYkrrNPN5kEc+7TDtDYH77vCWKSUVfIxZDzhzGM/D3t8eQiVgeRk
	PL4FNLVeh3aS6a38vw6EjQOyGsWFBJC41VXM7UD0yxZPQQZ7YrtW4x8K+vjVyRoXyeH3YZGTS1V
	UCeUdbYq9tqefL9bw2obgMlWtB/GFfF/z0HEPogKp9uXF1YyJDXJqJ/wg==
X-Google-Smtp-Source: AGHT+IEVsh5b+f9rl+imumXRYarnxs0UAANtEbjwwx8u4RslGUqLSeYw1okTg4zAdTKMfolaIUZn7Q==
X-Received: by 2002:ac8:5a48:0:b0:467:5712:a69a with SMTP id d75a77b69052e-46c7102fcb6mr57216581cf.29.1736364434132;
        Wed, 08 Jan 2025 11:27:14 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6a61cfsm199597601cf.44.2025.01.08.11.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:27:13 -0800 (PST)
Message-ID: <052597884ce9e32bd68203081f8b28a957eb5255.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: amphion: Support display delay for Hevc
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Jan 2025 14:27:12 -0500
In-Reply-To: <6fcdd612-0f1e-42bd-b171-6f1d70790ffd@oss.nxp.com>
References: <20241219015146.706482-1-ming.qian@oss.nxp.com>
	 <86d9eb915432c6b070f7c7f524973e9a363de76e.camel@ndufresne.ca>
	 <6fcdd612-0f1e-42bd-b171-6f1d70790ffd@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_112715_185445_B485ACED 
X-CRM114-Status: GOOD (  29.96  )
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

Le mardi 07 janvier 2025 =C3=A0 09:29 +0800, Ming Qian(OSS) a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
>=20
> On 2025/1/7 6:16, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > nit: use capital HEVC in the subject
> >=20
>=20
> I'll fix it in the v2 patch
>=20
> > Le jeudi 19 d=C3=A9cembre 2024 =C3=A0 10:51 +0900, Ming Qian a =C3=A9cr=
it :
> > > The amphion decoder firmware v1.9.0 supports display delay 0 for
> > > hevc format, then driver can enable this feature.
> >=20
> > nit: HEVC
> >=20
> > I think this added "feature" hides a bug you haven't fixed in this patc=
h.
> >=20
> >=20
> >          v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
> >                            V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE=
,
> >                            0, 1, 1, 0);
> >=20
> > With the control registered this way, 0 is the default, and the range o=
f 0-1.
> > But from your commit message, this is only supported from firmware 1.9.=
0 and up.
> > I think the patch should basically adjust the min and def values accord=
ing to
> > the detected firmware version.
> >=20
> > This might actually be more complex, aka per CODEC, and for that you ma=
y want to
> > use v4l2_ctrl_config structure.
> >=20
> > Nicolas
> >=20
>=20
> Thanks for the tip.
> By the way, how to define different ctrl values for each CODEC format?
> Is it reasonable to new a ctrl after set capture format?
> Or can we change the min/max value after set capture format?

Very good question, I clearly didn't think through my reply. Seems fine to =
leave
it that way. Per-codec, would mean having multiple CID, which is not your f=
ault
it has been combined.

Nicolas

>=20
> Thanks,
> Ming
>=20
> >=20
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > >   drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++---
> > >   1 file changed, 11 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/me=
dia/platform/amphion/vpu_malone.c
> > > index 5c6b2a841b6f..8f4aa48b2d65 100644
> > > --- a/drivers/media/platform/amphion/vpu_malone.c
> > > +++ b/drivers/media/platform/amphion/vpu_malone.c
> > > @@ -332,6 +332,8 @@ struct vpu_dec_ctrl {
> > >   	u32 buf_addr[VID_API_NUM_STREAMS];
> > >   };
> > >  =20
> > > +static const struct malone_padding_scode *get_padding_scode(u32 type=
, u32 fmt);
> > > +
> > >   u32 vpu_malone_get_data_size(void)
> > >   {
> > >   	return sizeof(struct vpu_dec_ctrl);
> > > @@ -654,8 +656,10 @@ static int vpu_malone_set_params(struct vpu_shar=
ed_addr *shared,
> > >   		hc->jpg[instance].jpg_mjpeg_interlaced =3D 0;
> > >   	}
> > >  =20
> > > -	hc->codec_param[instance].disp_imm =3D params->display_delay_enable=
 ? 1 : 0;
> > > -	if (malone_format !=3D MALONE_FMT_AVC)
> > > +	if (params->display_delay_enable &&
> > > +	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format)=
)
> > > +		hc->codec_param[instance].disp_imm =3D 1;
> > > +	else
> > >   		hc->codec_param[instance].disp_imm =3D 0;
> > >   	hc->codec_param[instance].dbglog_enable =3D 0;
> > >   	iface->dbglog_desc.level =3D 0;
> > > @@ -1024,6 +1028,7 @@ static const struct malone_padding_scode paddin=
g_scodes[] =3D {
> > >   	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
> > >   	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x=
0}},
> > >   	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x=
0}},
> > > +	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x2=
0}},
> > >   };
> > >  =20
> > >   static const struct malone_padding_scode padding_scode_dft =3D {0x0=
, 0x0};
> > > @@ -1058,8 +1063,11 @@ static int vpu_malone_add_padding_scode(struct=
 vpu_buffer *stream_buffer,
> > >   	int ret;
> > >  =20
> > >   	ps =3D get_padding_scode(scode_type, pixelformat);
> > > -	if (!ps)
> > > +	if (!ps) {
> > > +		if (scode_type =3D=3D SCODE_PADDING_BUFFLUSH)
> > > +			return 0;
> > >   		return -EINVAL;
> > > +	}
> > >  =20
> > >   	wptr =3D readl(&str_buf->wptr);
> > >   	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + str=
eam_buffer->length)
> >=20


