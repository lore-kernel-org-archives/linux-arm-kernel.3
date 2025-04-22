Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6986C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZRNUBKg8hwCgXEyYs/1skOhVgOq5no2ClQkvRkjKGA=; b=P2dR6aHC11cgWWT7Var5WCIHzo
	yvxAFYO6Xmx/iRyh4sDt7Ro2/ZiZ3FhRMiRuGd6GhMWzuVhqkt+x58Tm35p0QB4p8qtKrCe2zlLk1
	blPMV7X5mt/SqKCbQUgyQfYltepwIiGEjXi1gyAM9fsaUjzJIL3wSmhZsGoYnMSAAFXesDs5YUmik
	IFfHemPRyL1zCXi2XF8LRr/bwK7EOWFI7WujZXFIX5OZWiYphptv3/7ZDgAJyFePEKSGD/lav3W5c
	PzhWFtd8Y6i+qzexrG2P9K0jL160zBdnvRk1JVlosNwl42V3WEFeW49apxuNgT/AWOJigSvPDYI52
	Mycs+qqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JdD-00000008OUo-3LzI;
	Tue, 22 Apr 2025 19:50:11 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ja9-00000008LSF-2YN1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 19:47:03 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c559b3eb0bso323959385a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745351220; x=1745956020; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AZRNUBKg8hwCgXEyYs/1skOhVgOq5no2ClQkvRkjKGA=;
        b=2j7fFrs29UQVPMeMKXazVgW3qAs/BKbcU2eBNR2LTbDJTVsRyuKvnNv5SYPHmWtH06
         qYghDCeoQMh+R4KZmO7IrhnJipUvIfk5xK2V1M4Io44PoX2dmQk8qr6n2bmgDmu+ABsu
         xG44FanvOz2yAOXr1E8jVc1cwslI/aNpDWaoxl0QVlTpAwb5cntjtpH3vcte9mtluyV7
         IgkXGM2kCGTFzQYTfzUGl5N5XPgCb2b4rly/26D8UR4PNNrcPrE2c0p/ZFkKtsYYBkiD
         r8LCYlOtrE6eaXHYNQo/ANNRcGHpg/2rCD1fSVh9+MccEdkAFw6wcaPGZsOIq4mqq/t6
         V2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351220; x=1745956020;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZRNUBKg8hwCgXEyYs/1skOhVgOq5no2ClQkvRkjKGA=;
        b=qRlSAV+yOF82zGLGxLPgVtcTWTd9e/u/PDkz1Ctvt7EXRN5/i+R06s4uTtqyq/nQkp
         Uj0bPbKS/QIyjkzRycwrnLbwxJyk9XNQFkSnl38FmUzzQU8QRRmFKp+u9tLIt2LWyg1q
         QRw5wZ0bP1n5nCotxPLRbMDMeFzFxdnaXn7nAbN69KoGZMgaoo9GhuTapg8esr4b5xGZ
         5hUiHSRPBM2q1pFRyO2HeLnZzr3F3sWWoeVXB7OvmtEtPyQd0PTye1bwz/AvyOs2bHQU
         CVuZTomXXTCjYsCUkhQZGbT2fxdYx9qRK0T9KoVtaIxFlnWlJGz6qLarBXLWb8u4brop
         52MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoKNJqw21V6CDHW4rxu7+6Zk5kpb/q5GshVbnN9qcGHIPA7YKRFF0zPFKDLuawVp9XXKknr7M1GzqT4pCLYFzt@lists.infradead.org
X-Gm-Message-State: AOJu0YyOLAMGMMw74d+oJ0jJVbCAa0Ie9b4I/KQaII6uUbnZ3JkyEdA8
	+LYEjFIcq1oFfSPnrdtjpkyz9MV9ZqqEvq/540EEzmzhqHjSE58MrdACyTU34f8=
X-Gm-Gg: ASbGncvZg4Z3+kFtH9DyWld+w3sBZrnRcmdZKYoXuYBQVZaRnQ627mjQu0auvTdVV9L
	mJOs7/AxTFFS5UkIcabWCyAicWb1+lWvj2Xj68OW9um+0XLNhz+5EiNUD71f+lIQKKcIkorrUpE
	gM00qrb6gerwYM6FUTK89mcmIcWs+LvpoBB3yIUxElLl9GB8qLNHh4wbDuiSTjU1ePhr1OHSq1p
	JKo3xC0GjQmNcqqBJVG0fjqvGz8WH7ZUivL2L4Ze0IS5zHlvVomeB0q61QFo1FgrVtGU2ePYnRv
	DdaicKt6lS/k0F5xDx3lgf7nYByh9tcn7SvVhD9yYmpg86gQwTD/Fu3m
X-Google-Smtp-Source: AGHT+IFgS/Q0V6U15helS9ADvq78s/nB3ALXSasniZ8+SnkCEwwfFJHhc6L1EiB4G7ySAUTvyb76hA==
X-Received: by 2002:a05:620a:4510:b0:7c5:54d8:3d43 with SMTP id af79cd13be357-7c928053ba5mr2594224685a.58.1745351219854;
        Tue, 22 Apr 2025 12:46:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e6absm593612885a.19.2025.04.22.12.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:46:59 -0700 (PDT)
Message-ID: <39053a9e0767289cf822beb350819d366994dd0a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Start decoding job when both queue are
 on
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 ming.qian@oss.nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 15:46:57 -0400
In-Reply-To: <20240719075007.384342-1-ming.qian@nxp.com>
References: <20240719075007.384342-1-ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_124701_848574_C80A2685 
X-CRM114-Status: GOOD (  25.66  )
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

Le vendredi 19 juillet 2024 =C3=A0 16:50 +0900, Ming Qian a =C3=A9crit=C2=
=A0:
> Start the decoding job when both queue are on, except the for the
> initialization sequence.
>=20
> Especially when seeking, the capture streamon may be called after output
> streamon, driver will start to decode job immediately after output
> streamo, if seek to a new resolution, then the source change flow may be
> mixed with the seek, it will cause confusion, then may led to pipeline
> hang.
>=20
> When both output and capture queue are on, it's ready to start the
> decoding job, and it can avoid the above potential problem.

This commit message needs some work and I'm unsure I understand its
meaning. After reading the change, I am under the impression that you
simply say that once the seq_hdr is found, the driver should keep
delaying the processing of output buffer until the capture queue is
ready ?

>=20
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
> =C2=A0drivers/media/platform/amphion/vdec.c | 18 +++++++++++++++++-
> =C2=A01 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index 6a38a0fa0e2d..ca8f7319503a 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -1363,6 +1363,12 @@ static int vdec_process_output(struct vpu_inst *in=
st, struct vb2_buffer *vb)
> =C2=A0	if (inst->state =3D=3D VPU_CODEC_STATE_STARTED)
> =C2=A0		vdec_update_state(inst, VPU_CODEC_STATE_ACTIVE, 0);
> =C2=A0
> +	if (vdec->seq_hdr_found &&
> +	=C2=A0=C2=A0=C2=A0 !vb2_start_streaming_called((v4l2_m2m_get_dst_vq(ins=
t->fh.m2m_ctx)))) {
> +		vpu_trace(inst->dev, "[%d] capture is not ready, pend input frame\n", =
inst->id);
> +		return -EINVAL;

I got really confused by this error return value. Its clearly not an
error, but just a delay. I think before we add more on top, you should
turn all these function for which the return value is unused to void.
And use a plain "return;" here. That applies to all similar ops.

> +	}
> +
> =C2=A0	ret =3D vpu_iface_get_stream_buffer_desc(inst, &desc);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> @@ -1555,6 +1561,16 @@ static int vdec_start(struct vpu_inst *inst)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static void vdec_enqueue_pending_frames(struct vpu_inst *inst)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < v4l2_m2m_num_src_bufs_ready(inst->fh.m2m_ctx); i++) {
> +		if (vpu_process_output_buffer(inst))
> +			break;

How well does this work ? Previous you made good care of interleaving
the processing output and capture, which I could imaging prevents the
hardware from starving ?

> +	}
> +}
> +
> =C2=A0static int vdec_start_session(struct vpu_inst *inst, u32 type)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> @@ -1573,10 +1589,10 @@ static int vdec_start_session(struct vpu_inst *in=
st, u32 type)
> =C2=A0	if (V4L2_TYPE_IS_OUTPUT(type)) {
> =C2=A0		vdec_update_state(inst, vdec->state, 1);
> =C2=A0		vdec->eos_received =3D 0;
> -		vpu_process_output_buffer(inst);
> =C2=A0	} else {
> =C2=A0		vdec_cmd_start(inst);
> =C2=A0	}
> +	vdec_enqueue_pending_frames(inst);

Was this intentional to reverse the STREAMON(CAPTURE) call flow to:

  - process_capture() (inside vdec_cmd_start())
  - proces_output() x n

Nicolas

> =C2=A0	if (inst->state =3D=3D VPU_CODEC_STATE_ACTIVE)
> =C2=A0		vdec_response_fs_request(inst, false);
> =C2=A0


