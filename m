Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379CDC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4s77mP+aXHVnwDrJa9wz0BjHNRnKSn8vcA3GIllhh7k=; b=wdK/3KrVlj7I48lGSqK5w3HBt9
	23CJJkcfAf8n/fkzpcJ46K2h9bMDKDl8BLMeD1/kXkjKBWdLFPgEoezWD9sAOmMnGTflEKU+b6Q2M
	m5IA1vUZgD/Zo+BDs/oeUBAN9YQUtZOWd1mfeFn1xjn2rUPyRhcHEIOaj3SDMGP89Sz45Eo2EiJa+
	sqD7wfu/qYicdkTltAdcKw1p10iFv/JuWI9YJo76NQa1BoaEfpAiWKBOuVFRwxTWzd9OqQw9lPIyg
	yLYBGLblYGWB/jk9heltFeRG1qKRtTgjXwPB8CJhEId/UwKlycFiuFF7vLe3Nd/DmO2ZNn8ZwFHVE
	aX3cRPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Qcd-00000006nki-1lmJ;
	Mon, 28 Apr 2025 15:42:19 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QX4-00000006mwM-3biP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 15:36:36 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6ecf0e07954so79002076d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 08:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745854593; x=1746459393; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4s77mP+aXHVnwDrJa9wz0BjHNRnKSn8vcA3GIllhh7k=;
        b=FiRz6GeRtJqHNyCJ1ylMm2kWFNWbS8G/eb2nXA1RxaiGxggFpjnxXSuiT+JpxOKXkr
         lV5SeQplmAU7fV0xnQnDkKycNBs/Gwkf43BByendp4+HYkWJzx+ilBmsQoo9Vs3IfhMI
         ikykuVjszitNiHJ8kdbXQkHmV3L+ThO56d11+cI52WMQ7V0C0LBRj/mEsCAP+qtZ7lsQ
         oekwUMAGDifqO0OgjKpFITaKtmCB+dJsGDfZN8/A94RcyDoIt4NiEK1857KYFGgkd9MQ
         gObajo+gZNAe3eKQ6JePu1f7iRxRrZdq/iMZDinu5RG+6Hkvxm/auGvZJEYqKWgCuDZD
         5gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745854593; x=1746459393;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4s77mP+aXHVnwDrJa9wz0BjHNRnKSn8vcA3GIllhh7k=;
        b=uLaBg5Rd/xtSLixp2Z7VJoOR/Z/pqhTXLidEp22MxF6bH+Oi2n5II8T22h+jwW1Zku
         LErloPeof6ZlwWqCnixkHpoRXduxk4VyIFiFXJ5tYehX5GiissFTWdwzK8oF6ooa8F2n
         Sw5K8YHIHtvWMLzsC7ecAJzlwENMh1IJuiFtJ2jC+l0ztG0TCvZji8WnniCDFt0AWi3h
         IRvc4TB2+io+Qpu3Vsx+LVtff55xeBMnqvAjI1wsBR7UBbjSyQQzYrfqpRHA51xgcxgb
         W24Zp9nZcK+XhPTvlK5Qc4DMwyvqToShUJo9FPLII+uRN3p8bKEyItY/vIYcQ389eQcC
         em6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhXG52qAN9+lojmVrFWQWW/xKFXoqPiozIY0pii5jJqyIDf6d/r+MS8/+TILRX81xzwq3DmlM21dLYD4QcyUN2@lists.infradead.org
X-Gm-Message-State: AOJu0YwOjkojPr7Hfj6Rf5drji6xyNX7j/zCM6dBwYriH6RyJROsSvON
	RQDwVwSYuhE8zBMgdOz3rcyZWfs3VvkAIXPhquace7JymbGKLiO9sUQgWUImz6A=
X-Gm-Gg: ASbGnctkluG9wfcMgUz0L7MTeoCR9iCF0HnX6XE7qIfZrBks5vqvfDHFdS81/zWWbyw
	+BlSzHboijdl4F2i7pTdnNARDlFQMe4CDvq0q54Q0CIHQwTi2Gxpb4EdNtmtjcWJz68PIfXRwzy
	7Ugn14hr/GCYM/4d+y9AGOaa4NIuxtbVKSg8AgWAq2088Czi1buKPQ07P4gsElq3kAkuUdyn5cI
	Ru41lxsqs9H6YridKaQoHJH4nkxuOfvD2D+AMOGvQTvIFqgW02OO9l4drB08780z8xuuB6jqye+
	8SbmK19azItqzBqPplKJ9Fay6ZM+VG32DqvCkO/sHCOjhw==
X-Google-Smtp-Source: AGHT+IFydyQgt8+hX6oHv7I3+R5vxYQo32+nBN0WWoJP83EwPy05Rm+1efR0rfQFgn/GZ1An5Oq7oA==
X-Received: by 2002:a05:6214:d4e:b0:6f4:c8cd:abcc with SMTP id 6a1803df08f44-6f4d1dc90b8mr178871376d6.0.1745854592768;
        Mon, 28 Apr 2025 08:36:32 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0aaf904sm62513926d6.101.2025.04.28.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:36:32 -0700 (PDT)
Message-ID: <833134215fcd22360cf8aceb61539c7c03dcaa02.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: amphion: Add H264 and HEVC profile and level
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@nxp.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>,  "hverkuil-cisco@xs4all.nl"	
 <hverkuil-cisco@xs4all.nl>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org"	
 <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
 "kernel@pengutronix.de"	 <kernel@pengutronix.de>, "festevam@gmail.com"
 <festevam@gmail.com>, "X.H. Bao"	 <xiahong.bao@nxp.com>, Eagle Zhou
 <eagle.zhou@nxp.com>, "imx@lists.linux.dev"	 <imx@lists.linux.dev>,
 "linux-media@vger.kernel.org"	 <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 28 Apr 2025 11:36:31 -0400
In-Reply-To: <AS8PR04MB824782B77E0253BF2C82823EE7862@AS8PR04MB8247.eurprd04.prod.outlook.com>
References: <20241210093337.3779686-1-ming.qian@oss.nxp.com>
	 <74eb0589ae54855db1d2024591d501989e30027a.camel@ndufresne.ca>
	 <a60b84d8-a179-4c33-aed0-1f2ad1857f7b@oss.nxp.com>
	 <caaa10071d063069a4f479862b38f304c89da21e.camel@ndufresne.ca>
	 <AS8PR04MB824782B77E0253BF2C82823EE7862@AS8PR04MB8247.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_083635_170600_A2C8125E 
X-CRM114-Status: GOOD (  43.38  )
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

Le dimanche 27 avril 2025 =C3=A0 01:44 +0000, Ming Qian a =C3=A9crit=C2=A0:
> Hi Nicolas,
>=20
> On 2025/4/26 3:53, Nicolas Dufresne wrote:
> > Le vendredi 25 avril 2025 =C3=A0 10:33 +0800, Ming Qian(OSS) a =C3=A9cr=
it=C2=A0:
> > >=20
> > > Hi Nicolas,
> > >=20
> > > On 2025/4/23 4:15, Nicolas Dufresne wrote:
> > > > Hi Ming,
> > > >=20
> > > > Le mardi 10 d=C3=A9cembre 2024 =C3=A0 18:33 +0900, Ming Qian a =C3=
=A9crit :
> > > > > From: Ming Qian <ming.qian@nxp.com>
> > > > >=20
> > > > > For format H264 and HEVC, the firmware can report the parsed prof=
ile idc
> > > > > and level idc to driver, the information may be useful.
> > > > > Implement the H264 and HEVC profile and level control to report t=
hem.
> > > > >=20
> > > > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > > > > ---
> > > > > v2
> > > > > -- add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASEL=
INE
> > > > >=20
> > > > > =C2=A0=C2=A0 drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 61 +++++++++++++
> > > > > =C2=A0=C2=A0 drivers/media/platform/amphion/vpu_defs.h=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> > > > > =C2=A0=C2=A0 drivers/media/platform/amphion/vpu_helpers.c | 93 ++=
++++++++++++++++++
> > > > > =C2=A0=C2=A0 drivers/media/platform/amphion/vpu_helpers.h |=C2=A0=
 5 ++
> > > > > =C2=A0=C2=A0 drivers/media/platform/amphion/vpu_malone.c=C2=A0 |=
=C2=A0 3 +-
> > > > > =C2=A0=C2=A0 5 files changed, 162 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/medi=
a/platform/amphion/vdec.c
> > > > > index ca8f7319503a..61d5598ee6a1 100644
> > > > > --- a/drivers/media/platform/amphion/vdec.c
> > > > > +++ b/drivers/media/platform/amphion/vdec.c
> > > > > @@ -232,6 +232,37 @@ static int vdec_ctrl_init(struct vpu_inst *i=
nst)
> > > > > =C2=A0=C2=A0=C2=A0			=C2=A0 V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY=
_ENABLE,
> > > > > =C2=A0=C2=A0=C2=A0			=C2=A0 0, 1, 1, 0);
> > > > > =C2=A0=C2=A0=20
> > > > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264=
_PROFILE,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PRO=
FILE_MULTIVIEW_HIGH,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_=
H264_PROFILE_BASELINE) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> > > >=20
> > > > You've added it here, but you will never report it, see my comment
> > > > below.
> > > Yes, you're right,
> > > firmware can't report the sps_constraint_set1_flag yet,
> > > so we need to request a firmware interface change to report the
> > > sps_constraint_set1_flag.
> > >=20
> > > If we remove PROFILE_CONSTRAINED_BASELINE here, then these streams wi=
ll
> > > failed to play with gstreamer.
> > > If we keep it here, then these stremas can be played, but driver will
> > > report wrong profile.
> > >=20
> > > Maybe we need to change the firmware interface firstly.
> >=20
> > Well, all software have bugs, even the firm ones. Just comment about
> > it.
> >=20
> > Perhaps you already said, but does Amphion really support ASO/FMO ?
> > Since if you don't really support it, you may just drop BASELINE and
> > always report CONSTRAINED_BASELINE. Accuracy will come with a firmware
> > update.
> >=20
>=20
> I'm not sure whether Amphion malone decoder can support ASO or not.
> But the firmware does not filter out this feature.
> And firmware do filter out the FMO, so FMO is not supported.
>=20
> The CONSTRAINED_BASELINE is subset of BASELINE, some streams maybe=20
> encoded with BASELINE profile, without enabling ASO or FMO. This is=20
> probably not uncommon. For these streams, I think we still need to=20
> support, so driver can't drop BASELINE profile.

In the past we had agreed that userspace should handle that, so that
drivers don't have to lie about it. That being said, for stateful it
means the firmware must not immediately reject it, and only fail when
it notices an unsupported feature. So in some ways, it have to have
some support for it. For ASO, it is detected while parsing VCL, can't
be seen in the SPS or PPS, so that makes it the hardest. A constrained
decoder, will imediatly ail if the mb offset of the first VCL is not 0.
An baseline decoder is suppose to accumulate until it see the start of
the next VCL (pic_num change mostly) and then reorder.

Short story, for stateful, I'm fine either way, so feel free to keep it
that way.

>=20
> By the way, amphion firmware doesn't check the sps_constraint_set1_flag=
=20
> to tell CONSTRAINED_BASELINE or BASELINE. I'll request a firmware change=
=20
> firstly.

This would be nice at least for accurate reporting, as it can help
debugging. Meanwhile, we should also support existing firmware.

Nicolas

>=20
> Regards,
> Ming
>=20
>=20
> > >=20
> > > >=20
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH)),
> > > >=20
> > > > Shall we advertise multiview and stereo ? My impression is that we =
lack
> > > > a mechanism to actually signal the stereo layout, or which view eac=
h
> > > > buffers came from. I'm thinking, you can can't test it, we should j=
ust
> > > > fail on these ?
> > > >=20
> > >=20
> > > You're right, they're not tested, I will remove them.
> > >=20
> > >=20
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PRO=
FILE_BASELINE);
> > > > > +
> > > > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264=
_LEVEL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEV=
EL_6_2,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEV=
EL_4_0);
> > > > > +
> > > > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC=
_PROFILE,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PRO=
FILE_MAIN_10,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_=
HEVC_PROFILE_MAIN) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PRO=
FILE_MAIN);
> > > > > +
> > > > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC=
_LEVEL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEV=
EL_6_2,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEV=
EL_4);
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0	ctrl =3D v4l2_ctrl_new_std(&inst->ctrl_handler=
, &vdec_ctrl_ops,
> > > > > =C2=A0=C2=A0=C2=A0				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1=
, 2);
> > > > > =C2=A0=C2=A0=C2=A0	if (ctrl)
> > > > > @@ -1166,6 +1197,35 @@ static void vdec_clear_slots(struct vpu_in=
st *inst)
> > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > =C2=A0=C2=A0 }
> > > > > =C2=A0=C2=A0=20
> > > > > +static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id,=
 u32 val)
> > > > > +{
> > > > > +	struct v4l2_ctrl *ctrl =3D v4l2_ctrl_find(&inst->ctrl_handler, =
id);
> > > > > +
> > > > > +	if (ctrl)
> > > > > +		v4l2_ctrl_s_ctrl(ctrl, val);
> > > > > +}
> > > > > +
> > > > > +static void vdec_update_v4l2_profile_level(struct vpu_inst *inst=
, struct vpu_dec_codec_info *hdr)
> > > > > +{
> > > > > +	switch (inst->out_format.pixfmt) {
> > > > > +	case V4L2_PIX_FMT_H264:
> > > > > +	case V4L2_PIX_FMT_H264_MVC:
> > > > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_profile(hdr=
->profile_idc));
> > > > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_level(hdr->=
level_idc));
> > > > > +		break;
> > > > > +	case V4L2_PIX_FMT_HEVC:
> > > > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_profile(hdr=
->profile_idc));
> > > > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_level(hdr->=
level_idc));
> > > > > +		break;
> > > > > +	default:
> > > > > +		return;
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > =C2=A0=C2=A0 static void vdec_event_seq_hdr(struct vpu_inst *inst=
, struct vpu_dec_codec_info *hdr)
> > > > > =C2=A0=C2=A0 {
> > > > > =C2=A0=C2=A0=C2=A0	struct vdec_t *vdec =3D inst->priv;
> > > > > @@ -1189,6 +1249,7 @@ static void vdec_event_seq_hdr(struct vpu_i=
nst *inst, struct vpu_dec_codec_info
> > > > > =C2=A0=C2=A0=C2=A0	vdec_init_crop(inst);
> > > > > =C2=A0=C2=A0=C2=A0	vdec_init_mbi(inst);
> > > > > =C2=A0=C2=A0=C2=A0	vdec_init_dcp(inst);
> > > > > +	vdec_update_v4l2_profile_level(inst, hdr);
> > > > > =C2=A0=C2=A0=C2=A0	if (!vdec->seq_hdr_found) {
> > > > > =C2=A0=C2=A0=C2=A0		vdec->seq_tag =3D vdec->codec_info.tag;
> > > > > =C2=A0=C2=A0=C2=A0		if (vdec->is_source_changed) {
> > > > > diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/=
media/platform/amphion/vpu_defs.h
> > > > > index 428d988cf2f7..606f9d61a265 100644
> > > > > --- a/drivers/media/platform/amphion/vpu_defs.h
> > > > > +++ b/drivers/media/platform/amphion/vpu_defs.h
> > > > > @@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
> > > > > =C2=A0=C2=A0=C2=A0	u32 decoded_height;
> > > > > =C2=A0=C2=A0=C2=A0	struct v4l2_fract frame_rate;
> > > > > =C2=A0=C2=A0=C2=A0	u32 dsp_asp_ratio;
> > > > > +	u32 profile_idc;
> > > > > =C2=A0=C2=A0=C2=A0	u32 level_idc;
> > > > > =C2=A0=C2=A0=C2=A0	u32 bit_depth_luma;
> > > > > =C2=A0=C2=A0=C2=A0	u32 bit_depth_chroma;
> > > > > diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drive=
rs/media/platform/amphion/vpu_helpers.c
> > > > > index d12310af9ebc..108b75ceb4ae 100644
> > > > > --- a/drivers/media/platform/amphion/vpu_helpers.c
> > > > > +++ b/drivers/media/platform/amphion/vpu_helpers.c
> > > > > @@ -509,3 +509,96 @@ const char *vpu_codec_state_name(enum vpu_co=
dec_state state)
> > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > =C2=A0=C2=A0=C2=A0	return "<unknown>";
> > > > > =C2=A0=C2=A0 }
> > > > > +
> > > > > +struct codec_id_mapping {
> > > > > +	u32 id;
> > > > > +	u32 v4l2_id;
> > > > > +};
> > > > > +
> > > > > +static struct codec_id_mapping h264_profiles[] =3D {
> > > > > +	{66,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
> > > > > +	{77,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
> > > > > +	{88,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
> > > > > +	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH},
> > > > > +	{118, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH},
> > > > > +	{128, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH}
> > > > > +};
> > > > > +
> > > > > +static struct codec_id_mapping h264_levels[] =3D {
> > > > > +	{10,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
> > > > > +	{9,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1B},
> > > > > +	{11,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
> > > > > +	{12,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
> > > > > +	{13,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
> > > > > +	{20,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
> > > > > +	{21,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
> > > > > +	{22,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
> > > > > +	{30,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
> > > > > +	{31,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
> > > > > +	{32,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
> > > > > +	{40,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
> > > > > +	{41,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
> > > > > +	{42,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
> > > > > +	{50,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
> > > > > +	{51,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
> > > > > +	{52,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
> > > > > +	{60,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
> > > > > +	{61,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
> > > > > +	{62,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
> > > > > +};
> > > > > +
> > > > > +static struct codec_id_mapping hevc_profiles[] =3D {
> > > > > +	{1,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
> > > > > +	{2,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
> > > > > +};
> > > > > +
> > > > > +static struct codec_id_mapping hevc_levels[] =3D {
> > > > > +	{30,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
> > > > > +	{60,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
> > > > > +	{63,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
> > > > > +	{90,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
> > > > > +	{93,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
> > > > > +	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
> > > > > +	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
> > > > > +	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
> > > > > +	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
> > > > > +	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
> > > > > +	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
> > > > > +	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
> > > > > +	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
> > > > > +};
> > > > > +
> > > > > +static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *arr=
ay, u32 array_sz)
> > > > > +{
> > > > > +	u32 i;
> > > > > +
> > > > > +	if (!array || !array_sz)
> > > > > +		return 0;
> > > > > +
> > > > > +	for (i =3D 0; i < array_sz; i++) {
> > > > > +		if (id =3D=3D array[i].id)
> > > > > +			return array[i].v4l2_id;
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +u32 vpu_get_h264_v4l2_profile(u32 idc)
> > > > > +{
> > > > > +	return vpu_find_v4l2_id(idc, h264_profiles, ARRAY_SIZE(h264_pro=
files));
> > > > > +}
> > > > > +
> > > > > +u32 vpu_get_h264_v4l2_level(u32 idc)
> > > > > +{
> > > > > +	return vpu_find_v4l2_id(idc, h264_levels, ARRAY_SIZE(h264_level=
s));
> > > > > +}
> > > > > +
> > > > > +u32 vpu_get_hevc_v4l2_profile(u32 idc)
> > > > > +{
> > > > > +	return vpu_find_v4l2_id(idc, hevc_profiles, ARRAY_SIZE(hevc_pro=
files));
> > > > > +}
> > > > > +
> > > > > +u32 vpu_get_hevc_v4l2_level(u32 idc)
> > > > > +{
> > > > > +	return vpu_find_v4l2_id(idc, hevc_levels, ARRAY_SIZE(hevc_level=
s));
> > > > > +}
> > > > > diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drive=
rs/media/platform/amphion/vpu_helpers.h
> > > > > index 0eaddb07190d..dc5fb1ca2d33 100644
> > > > > --- a/drivers/media/platform/amphion/vpu_helpers.h
> > > > > +++ b/drivers/media/platform/amphion/vpu_helpers.h
> > > > > @@ -70,4 +70,9 @@ int vpu_color_get_default(u32 primaries, u32 *p=
transfers, u32 *pmatrix, u32 *pfu
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0 int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 =
cnt, u32 src);
> > > > > =C2=A0=C2=A0 int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 =
cnt, u32 dst);
> > > > > +
> > > > > +u32 vpu_get_h264_v4l2_profile(u32 idc);
> > > > > +u32 vpu_get_h264_v4l2_level(u32 idc);
> > > > > +u32 vpu_get_hevc_v4l2_profile(u32 idc);
> > > > > +u32 vpu_get_hevc_v4l2_level(u32 idc);
> > > > > =C2=A0=C2=A0 #endif
> > > > > diff --git a/drivers/media/platform/amphion/vpu_malone.c b/driver=
s/media/platform/amphion/vpu_malone.c
> > > > > index 4769c053c6c2..5c6b2a841b6f 100644
> > > > > --- a/drivers/media/platform/amphion/vpu_malone.c
> > > > > +++ b/drivers/media/platform/amphion/vpu_malone.c
> > > > > @@ -889,7 +889,8 @@ static void vpu_malone_unpack_seq_hdr(struct =
vpu_rpc_event *pkt,
> > > > > =C2=A0=C2=A0=C2=A0	info->frame_rate.numerator =3D 1000;
> > > > > =C2=A0=C2=A0=C2=A0	info->frame_rate.denominator =3D pkt->data[8];
> > > > > =C2=A0=C2=A0=C2=A0	info->dsp_asp_ratio =3D pkt->data[9];
> > > > > -	info->level_idc =3D pkt->data[10];
> > > > > +	info->profile_idc =3D (pkt->data[10] >> 8) & 0xff;
> > > >=20
> > > > The data should normally also include the sps_constraint_set1_flag,
> > > > which differentiate baseline from constrained-baseline. I would als=
o be
> > > > very surprised if the decoders supports ASO/FMO.
> > > >=20
> > > > Nicolas
> > > >=20
> > >=20
> > > As mentioned above, I'll try to request a firmware change to report
> > > sps_constraint_set1_flag, then driver can report
> > > PROFILE_CONSTRAINED_BASELINE correctly.
> >=20
> > Ack.
> >=20
> > regards,
> > Nicolas
> >=20
> > >=20
> > > Regards,
> > > Ming
> > >=20
> > > > > +	info->level_idc =3D pkt->data[10] & 0xff;
> > > > > =C2=A0=C2=A0=C2=A0	info->bit_depth_luma =3D pkt->data[13];
> > > > > =C2=A0=C2=A0=C2=A0	info->bit_depth_chroma =3D pkt->data[14];
> > > > > =C2=A0=C2=A0=C2=A0	info->chroma_fmt =3D pkt->data[15];

