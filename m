Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA35F532E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFYRVrG/zXzLAZQPA+I4Qd5czvKYpC40unjGxYVlu9I=; b=IvVsRGIXWhamMI9/3EnVTU/KMX
	vyXLFSxJMC9uaH1GWrpys0SualpJNASj2QOn2QC7k47fmJTtDgvLITHxRAhOBBuHSz41pZmjk5U7x
	hxoBzfWDW+SMlSvCJjJNtMohp5A5+KFFWw303pVR4R8ahmGF+hsx10nE9mdJc+Pqz6weCzXyqfSYq
	0x7pGkms7eDarnH2rBVtV1IK75Xcx0TxksZ8NJIAaX8DLrxtt2AnpM3j23qJAvFrmjViK/D6FUgum
	nE2ECHM6aXTmfMeQ4mfhs4klLmgNPPFWbQNz96Clw7TnnsHC1E/lgBmSl0Nw8aniajNe8ugyaY9Lj
	bNOuQoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wdE-00000000w1x-1DAI;
	Tue, 24 Mar 2026 07:56:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wdB-00000000w1A-1H5p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:56:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48541edecf9so7966445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 00:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774339011; x=1774943811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFYRVrG/zXzLAZQPA+I4Qd5czvKYpC40unjGxYVlu9I=;
        b=S/ZOD6q2Luo0rBboR8oGj5vcP6Cfno8/VjrVmjbAKEiFt2nH+BuHLnsF7Vu5oUchh8
         xT2hufnv+7g0aLqJg6LbzYJnYViPKy5K++oPIkpTUFCulVs77vVSJ7BSgria/u4mpJ3i
         9O4nphuqGqMkDCdCHRFCQBMY2ss3kxeVaRe6RpkI5c/St7g9bRvGeKyw19KaePWVDDa1
         /p5DWs2bRy/bF+dOySlf2TvYPzAw6sCTEP7xrn2OtD3F65TRAz5+c0OQuQhwp7IA4ucA
         7nhLI6WBeJmRw6NU17Twbd3+jGXsKov95yqDxP8Tp168aMb4s3Of/I8WPHm6L45jfwKL
         8WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339011; x=1774943811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFYRVrG/zXzLAZQPA+I4Qd5czvKYpC40unjGxYVlu9I=;
        b=qwiJQQEAKwygTlwE5V9dLG8uuOmykxaJjqaVOw+JXfSqp+DqdXVl15K7XsZgvcL7NK
         EVmohHDFyGPLulDhDfOHwXxOW5ZYUXyXKbtcR9QlEnALKnt/NZdxttD5vjK99/ApIWSx
         vQuKW0RB5az2uDPVxGHm3b08uTX/oVtEAH7k8u01yMxi43Qz+ueq/zOJxhyo1o6BvSwY
         uNX1UfCrCumZAqL4srb94GsExVmywq7RurjHMyfJ96fraMx9lLCISWdrcCkRrSZ68PTV
         TfLwhYHe/C8tt2BTenpEgRve8DvyydeoYB7iTqCyQqZ4W5KaXzVuaD9e3rIbEk5d2ind
         KKhg==
X-Forwarded-Encrypted: i=1; AJvYcCUMegmuh/d0br68LTzjFzUx2o5bm32gwRlP5z6Bmv1zVnC1xUjRx+heCMnSPOQUlHP6S+rEegg+pm7T11Uy7/9t@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8+n8sbAdClyAsomShY6ECJ1UOdKhWxAgEToq7RIlLnfrE8eMQ
	VmOTImbKf3aKsoadnWflP+TmKiPi8rGtV2Jro7+T/D4u2L9o0FrcDDdc
X-Gm-Gg: ATEYQzwoUsA783AE5HmQL1pqr2M+n2F5kYhHLVkSou5Vwp45aqcYVhwWa1tNkYkPEEc
	HhxWHkaBijprAvJRozIA6G9qNJRYs801/uIi0UEwPxfnAWIZTSVGWB3sWVMRFzEZ1tyDexhp3KM
	FNth3oa4UvEaH+FiS3GFe+YfumyKtPERXerYFTAtRBZtpiekeXNj1j1e7wZFV4qEMEEIkpavOyn
	hNPnE0aCWVBE6IvOZQCoASgrHo6C3xB6MVJiApFzFXEdI3pn6zzMJz1T9AIGzh0TIjOvIT7uN8M
	lc8y+4gm55x/C5InllGXzzfJUxaQ086H2yv0l8oVtepSHbVRELQqNAqAa8FopZmK8JX2ixmQqfb
	2+kmqblGgAYVHv3yLo098jAsdU2iFrpIpM+gwzFPajcfjCZ2CKy9Uji30Kj5HgwOxQPrhZhyO/z
	iyoCQmQ8jsvBc0JuEcoFi9la6LOgNjWX2gLLXhL4miF+HR1F1RhMtv0HW7yT0SBm6NlFzJ4pGNf
	XOK6I7aWpY=
X-Received: by 2002:a05:600c:4707:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-486fee231cdmr200567305e9.21.1774339011116;
        Tue, 24 Mar 2026 00:56:51 -0700 (PDT)
Received: from jernej-laptop.localnet (31.red-83-50-72.dynamicip.rima-tde.net. [83.50.72.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487110dd718sm12885685e9.29.2026.03.24.00.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:56:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn,
 nicolas.dufresne@collabora.com
Subject: Re: [PATCH] media: cedrus: validate H.264 reference list indices
Date: Tue, 24 Mar 2026 08:56:46 +0100
Message-ID: <5056688.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
References: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_005653_361496_C97AB72E 
X-CRM114-Status: GOOD (  20.76  )
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

CC: Nicolas

Dne torek, 24. marec 2026 ob 03:04:31 Srednjeevropski standardni =C4=8Das j=
e Pengpeng Hou napisal(a):
> Cedrus validates HEVC slice reference lists in cedrus_try_ctrl(), but
> the H.264 path still consumes ref_pic_list0/ref_pic_list1 indices
> straight from the stateless slice control. Those indices are later
> used to index the fixed-size decode_params->dpb[] array in
> _cedrus_write_ref_list().
>=20
> Reject H.264 slice controls whose active reference counts or
> reference indices exceed V4L2_H264_NUM_DPB_ENTRIES before the driver
> reaches the DPB lookup. This keeps the validation next to the existing
> Cedrus stateless control checks and avoids driver-specific
> out-of-bounds reads from malformed userspace control payloads.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

This has same issue as doing it in common code, e.g. it would break
userspace.

One improvement would be to skip all indices which have value higher
or equal to V4L2_H264_NUM_DPB_ENTRIES here:

https://elixir.bootlin.com/linux/v6.19.9/source/drivers/staging/media/sunxi=
/cedrus/cedrus_h264.c#L212

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 23 +++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index d68da1eaa7aa..905084c097a9 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -42,6 +42,29 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  		if (sps->bit_depth_luma_minus8 !=3D 0)
>  			/* Only 8-bit is supported */
>  			return -EINVAL;
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SLICE_PARAMS) {
> +		const struct v4l2_ctrl_h264_slice_params *slice =3D ctrl->p_new.p_h264=
_slice_params;
> +		unsigned int i;
> +
> +		if (slice->num_ref_idx_l0_active_minus1 >=3D
> +		    V4L2_H264_NUM_DPB_ENTRIES)
> +			return -EINVAL;
> +
> +		for (i =3D 0; i <=3D slice->num_ref_idx_l0_active_minus1; i++)
> +			if (slice->ref_pic_list0[i].index >=3D
> +			    V4L2_H264_NUM_DPB_ENTRIES)
> +				return -EINVAL;
> +
> +		if (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B) {
> +			if (slice->num_ref_idx_l1_active_minus1 >=3D
> +			    V4L2_H264_NUM_DPB_ENTRIES)
> +				return -EINVAL;
> +
> +			for (i =3D 0; i <=3D slice->num_ref_idx_l1_active_minus1; i++)
> +				if (slice->ref_pic_list1[i].index >=3D
> +				    V4L2_H264_NUM_DPB_ENTRIES)
> +					return -EINVAL;
> +		}
>  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
>  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
>  		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_c=
tx, hdl);
>=20





