Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA69CEFD04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 20:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGgADW9nZD17Da1M/Fe+ypFmIKBVR0gBMWrtY6svF8g=; b=NIaDl65z6dwPd4WUKy/wqCj4VL
	x1bm9OyXW3XFjPyoFm3vIJJzc7P8y2FjNakuTTU+mvuyiSbFwmG6QQj+YZLaNjDy8AbyouJRBxRjt
	z9saiyzIoChQ6G3EJ/fytRkwduA17Ivxf5UVKDYgUGLGl4aEonJ74rvAbGHiD57sKlfDJFhCs8SLr
	4SnDkK1HQBYD+R85otly9QwyLLdMoudWDV/DGGzokn7hGOiiF9YnMo8b4U1kLy2IYp3OKZP0wbUlz
	pjM5iO2YQ6L0TR0zyYH2ARXOookcFO048TjfyA78BNKWhMtibsfOFmDhDUTYgOrAod3T+3OfXUw1Z
	mEvRGjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDQe-0000000Do26-20gg;
	Tue, 06 Jan 2026 20:13:20 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDQa-0000000Do1j-3XAb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 20:13:18 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b22b1d3e7fso130348385a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 12:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767730395; x=1768335195; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zGgADW9nZD17Da1M/Fe+ypFmIKBVR0gBMWrtY6svF8g=;
        b=CfWCj+hXojbIBS6DMjjSZGV8+2Hhf+JQCbWMqR4PyCmRz6xwjM6ETeDuJyNXwfzRU7
         7wfvYnHPSpgD+TuWloe85OJUwrc2ZHDOmEu65kADyx1s+W/1fE6uOXgySuyXHyP5stFr
         BgIXMS/Phzi2riMXEs3x+UHst25yLo8+fcptW5lt+uaudWFi4kKKoJMgPCgcdIDFZ1vt
         UEDIW2Y6A/0YNwrqJs8KENFmzT5w6BByWRHRRz9Nx3JbKD1n5t4dQYQ459OEz+PKl8gX
         0P/vQeUUL8SKMG17YZeweX3uvhba69QfA5vSwRmO5mtviIBiOM5YTh5UJOoev3IHOpMQ
         fDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767730395; x=1768335195;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGgADW9nZD17Da1M/Fe+ypFmIKBVR0gBMWrtY6svF8g=;
        b=Wy6Dbt7dhwFLDxEoMIyvygwLdKxyzxkAS3w5vYLJ2eyVEl1JGulnhrV339LQBGfuD+
         wofgOwccr1B+bBteZKYihmezLUafyZ6nQQK255qhRT4Rkj8BV7NWfn5z3XFLLwE18HaC
         cpEwW12ilnqJSFTirwrr1Su5pdjUTpXOTyWphEELRJ0FYJrTaxqjnCRzyvXCDYrcshPL
         94pXiFPhTs6vAOh8aPfCePpCCTDHVi0embzEIKWCDCBhLfxfzvfKY0wTA/U3u8VKn8Ng
         YJIHh98HMJ609VS5DBPTrDHjjulXrNa+ERr/21IbcOv2x/kclYgr/zjIGTzPh+CRZPAc
         P5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWTuYLBk/GSgtjVnw57C9byoq6TlhYT9G9AdQ5t63spGLtxXJP8bguhk4IhSkYbFvqxnskcW4FC88DqTtzjaQw+@lists.infradead.org
X-Gm-Message-State: AOJu0YzTC0ahWpZAzSTlC4/XAbtpCELIt12NoK1hFH/0yxqZfPN29xcY
	r9jic9f5MUM86OsNfIj10TrmrVj9KaLtL4OtVojbHfoRTQPQOcw8Z4Z0bhQEuALfqyA=
X-Gm-Gg: AY/fxX749TkE++opbKCX5Kya/kPix4F4lmrnHxM1HouGwrsxUJMQnNQZKOA+RV4sTTV
	IekXEF/hRyEccrJJtyQiexskOHa6e6vuJ3m9SqdcCShYpPlPcuQiY99Xk1AyKOBRmL9LGCZF2pd
	vNIdChzjpNqWhs6NH/9dPF+wxILrpbWitZvQJm2+Y1ym4y1BAhVz3/l9E/LxFOQyKW0SzbWKmqE
	5NLXYiBCqlvS0txBOUEukooAngUkObpFV2Xm1e9VMuxYk8VDI6l/xvTP6LQeEe2RmDL39HK8FfQ
	qJ4nRVhuJDAg5P924I6VEU5BNX7VyfssYw7QAjiynEYn35+3SyG+FupejKWUQi1LhVjXmVzwn4d
	MixUP0h6aRWA51J5VEeLfTm41qnhtQLKDfEoIbKVtWK27vSWeP1v2CyIADVVBIxLuRAcnZp/Qom
	xYUyDRDUkfmEQUrKfM
X-Google-Smtp-Source: AGHT+IH/wLE7DdiFM+Bb8jYRFbO6Or+cMF7NwB8CGndt9QUJmgsJUJfLZ+U7BiCGgvq+Cm5fvn3UeQ==
X-Received: by 2002:a05:620a:29cc:b0:8b2:e1bc:f2a2 with SMTP id af79cd13be357-8c3893eb72bmr8510985a.54.1767730394771;
        Tue, 06 Jan 2026 12:13:14 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm232070985a.33.2026.01.06.12.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:13:13 -0800 (PST)
Message-ID: <5ae7ea006e78377c22181b7455aea280214b8471.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Use kmalloc instead of vmalloc
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 06 Jan 2026 15:13:12 -0500
In-Reply-To: <20251222084912.747-1-ming.qian@oss.nxp.com>
References: <20251222084912.747-1-ming.qian@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FYyUlJPAcllBQWTM48ij"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_121317_167527_0ECFEE73 
X-CRM114-Status: GOOD (  21.10  )
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


--=-FYyUlJPAcllBQWTM48ij
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le lundi 22 d=C3=A9cembre 2025 =C3=A0 16:49 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Replace vmalloc/vfree with kmalloc/kfree for allocating small
> driver structures (vpu_inst, vdec_t, venc_t, vpu_cmd_t, and
> frame objects).
>=20
> vmalloc() is designed for large memory allocations and incurs
> unnecessary overhead for small objects due to virtual memory
> mapping. kmalloc() is more appropriate as it allocates physically
> contiguous memory with lower overhead.
>=20
> ftrace measurements of vpu_alloc_cmd() show significant improvement:
>=20
> =C2=A0 Before (vmalloc):=C2=A0 35-72 us=C2=A0=C2=A0 (avg ~45.7 us)
> =C2=A0 After (kmalloc):=C2=A0=C2=A0 11-26 us=C2=A0=C2=A0 (avg ~16.8 us)
>=20
> This reduces allocation time by approximately 63%.
>=20
> No functional changes are intended.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Looks good to me.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0 | 16 =
+++++++---------
> =C2=A0drivers/media/platform/amphion/venc.c=C2=A0=C2=A0=C2=A0=C2=A0 | 20 =
+++++++++-----------
> =C2=A0drivers/media/platform/amphion/vpu_cmds.c | 15 +++++++--------
> =C2=A0drivers/media/platform/amphion/vpu_core.c | 11 ++++-------
> =C2=A04 files changed, 27 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c
> b/drivers/media/platform/amphion/vdec.c
> index c0d2aabb9e0e..7a1c58cac02d 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -9,7 +9,6 @@
> =C2=A0#include <linux/list.h>
> =C2=A0#include <linux/kernel.h>
> =C2=A0#include <linux/module.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include <linux/videodev2.h>
> =C2=A0#include <media/v4l2-device.h>
> =C2=A0#include <media/v4l2-event.h>
> @@ -17,7 +16,6 @@
> =C2=A0#include <media/v4l2-ioctl.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0#include <media/videobuf2-dma-contig.h>
> -#include <media/videobuf2-vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_core.h"
> @@ -1642,9 +1640,9 @@ static void vdec_cleanup(struct vpu_inst *inst)
> =C2=A0		vdec->slots =3D NULL;
> =C2=A0		vdec->slot_count =3D 0;
> =C2=A0	}
> -	vfree(vdec);
> +	kfree(vdec);
> =C2=A0	inst->priv =3D NULL;
> -	vfree(inst);
> +	kfree(inst);
> =C2=A0}
> =C2=A0
> =C2=A0static void vdec_init_params(struct vdec_t *vdec)
> @@ -1909,13 +1907,13 @@ static int vdec_open(struct file *file)
> =C2=A0	struct vdec_t *vdec;
> =C2=A0	int ret;
> =C2=A0
> -	inst =3D vzalloc(sizeof(*inst));
> +	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> =C2=A0	if (!inst)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	vdec =3D vzalloc(sizeof(*vdec));
> +	vdec =3D kzalloc(sizeof(*vdec), GFP_KERNEL);
> =C2=A0	if (!vdec) {
> -		vfree(inst);
> +		kfree(inst);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> @@ -1923,8 +1921,8 @@ static int vdec_open(struct file *file)
> =C2=A0				=C2=A0=C2=A0=C2=A0 sizeof(*vdec->slots),
> =C2=A0				=C2=A0=C2=A0=C2=A0 GFP_KERNEL | __GFP_ZERO);
> =C2=A0	if (!vdec->slots) {
> -		vfree(vdec);
> -		vfree(inst);
> +		kfree(vdec);
> +		kfree(inst);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0	vdec->slot_count =3D VDEC_SLOT_CNT_DFT;
> diff --git a/drivers/media/platform/amphion/venc.c
> b/drivers/media/platform/amphion/venc.c
> index aced76401b69..9e5cbc2b0d3f 100644
> --- a/drivers/media/platform/amphion/venc.c
> +++ b/drivers/media/platform/amphion/venc.c
> @@ -13,14 +13,12 @@
> =C2=A0#include <linux/videodev2.h>
> =C2=A0#include <linux/ktime.h>
> =C2=A0#include <linux/rational.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include <media/v4l2-device.h>
> =C2=A0#include <media/v4l2-event.h>
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/v4l2-ioctl.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0#include <media/videobuf2-dma-contig.h>
> -#include <media/videobuf2-vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_core.h"
> @@ -844,7 +842,7 @@ static int venc_get_encoded_frames(struct vpu_inst *i=
nst)
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_dst_buf_remove(i=
nst-
> >fh.m2m_ctx)))
> =C2=A0			break;
> =C2=A0		list_del_init(&frame->list);
> -		vfree(frame);
> +		kfree(frame);
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -860,7 +858,7 @@ static int venc_frame_encoded(struct vpu_inst *inst, =
void
> *arg)
> =C2=A0	if (!info)
> =C2=A0		return -EINVAL;
> =C2=A0	venc =3D inst->priv;
> -	frame =3D vzalloc(sizeof(*frame));
> +	frame =3D kzalloc(sizeof(*frame), GFP_KERNEL);
> =C2=A0	if (!frame)
> =C2=A0		return -ENOMEM;
> =C2=A0
> @@ -912,9 +910,9 @@ static void venc_cleanup(struct vpu_inst *inst)
> =C2=A0		return;
> =C2=A0
> =C2=A0	venc =3D inst->priv;
> -	vfree(venc);
> +	kfree(venc);
> =C2=A0	inst->priv =3D NULL;
> -	vfree(inst);
> +	kfree(inst);
> =C2=A0}
> =C2=A0
> =C2=A0static int venc_start_session(struct vpu_inst *inst, u32 type)
> @@ -1067,7 +1065,7 @@ static void venc_cleanup_frames(struct venc_t *venc=
)
> =C2=A0
> =C2=A0	list_for_each_entry_safe(frame, tmp, &venc->frames, list) {
> =C2=A0		list_del_init(&frame->list);
> -		vfree(frame);
> +		kfree(frame);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -1151,7 +1149,7 @@ static int venc_process_capture(struct vpu_inst *in=
st,
> struct vb2_buffer *vb)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	list_del_init(&frame->list);
> -	vfree(frame);
> +	kfree(frame);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -1309,13 +1307,13 @@ static int venc_open(struct file *file)
> =C2=A0	struct venc_t *venc;
> =C2=A0	int ret;
> =C2=A0
> -	inst =3D vzalloc(sizeof(*inst));
> +	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> =C2=A0	if (!inst)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	venc =3D vzalloc(sizeof(*venc));
> +	venc =3D kzalloc(sizeof(*venc), GFP_KERNEL);
> =C2=A0	if (!venc) {
> -		vfree(inst);
> +		kfree(inst);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/media/platform/amphion/vpu_cmds.c
> b/drivers/media/platform/amphion/vpu_cmds.c
> index 5695f5c1cb3e..ab69412e0aa7 100644
> --- a/drivers/media/platform/amphion/vpu_cmds.c
> +++ b/drivers/media/platform/amphion/vpu_cmds.c
> @@ -13,7 +13,6 @@
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/delay.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_cmds.h"
> @@ -84,13 +83,13 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_ins=
t
> *inst, u32 id, void *data
> =C2=A0	int i;
> =C2=A0	int ret;
> =C2=A0
> -	cmd =3D vzalloc(sizeof(*cmd));
> +	cmd =3D kzalloc(sizeof(*cmd), GFP_KERNEL);
> =C2=A0	if (!cmd)
> =C2=A0		return NULL;
> =C2=A0
> -	cmd->pkt =3D vzalloc(sizeof(*cmd->pkt));
> +	cmd->pkt =3D kzalloc(sizeof(*cmd->pkt), GFP_KERNEL);
> =C2=A0	if (!cmd->pkt) {
> -		vfree(cmd);
> +		kfree(cmd);
> =C2=A0		return NULL;
> =C2=A0	}
> =C2=A0
> @@ -98,8 +97,8 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst
> *inst, u32 id, void *data
> =C2=A0	ret =3D vpu_iface_pack_cmd(inst->core, cmd->pkt, inst->id, id, dat=
a);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(inst->dev, "iface pack cmd %s fail\n",
> vpu_id_name(id));
> -		vfree(cmd->pkt);
> -		vfree(cmd);
> +		kfree(cmd->pkt);
> +		kfree(cmd);
> =C2=A0		return NULL;
> =C2=A0	}
> =C2=A0	for (i =3D 0; i < ARRAY_SIZE(vpu_cmd_requests); i++) {
> @@ -118,8 +117,8 @@ static void vpu_free_cmd(struct vpu_cmd_t *cmd)
> =C2=A0		return;
> =C2=A0	if (cmd->last_response_cmd)
> =C2=A0		atomic_long_set(cmd->last_response_cmd, cmd->key);
> -	vfree(cmd->pkt);
> -	vfree(cmd);
> +	kfree(cmd->pkt);
> +	kfree(cmd);
> =C2=A0}
> =C2=A0
> =C2=A0static int vpu_session_process_cmd(struct vpu_inst *inst, struct vp=
u_cmd_t
> *cmd)
> diff --git a/drivers/media/platform/amphion/vpu_core.c
> b/drivers/media/platform/amphion/vpu_core.c
> index 168f0514851e..85cc4a14f8ed 100644
> --- a/drivers/media/platform/amphion/vpu_core.c
> +++ b/drivers/media/platform/amphion/vpu_core.c
> @@ -17,7 +17,6 @@
> =C2=A0#include <linux/pm_runtime.h>
> =C2=A0#include <linux/pm_domain.h>
> =C2=A0#include <linux/firmware.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_core.h"
> @@ -265,7 +264,7 @@ static int vpu_core_register(struct device *dev, stru=
ct
> vpu_core *core)
> =C2=A0	INIT_WORK(&core->msg_work, vpu_msg_run_work);
> =C2=A0	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
> =C2=A0	buffer_size =3D roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
> -	core->msg_buffer =3D vzalloc(buffer_size);
> +	core->msg_buffer =3D kzalloc(buffer_size, GFP_KERNEL);
> =C2=A0	if (!core->msg_buffer) {
> =C2=A0		dev_err(core->dev, "failed allocate buffer for fifo\n");
> =C2=A0		ret =3D -ENOMEM;
> @@ -282,10 +281,8 @@ static int vpu_core_register(struct device *dev, str=
uct
> vpu_core *core)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0error:
> -	if (core->msg_buffer) {
> -		vfree(core->msg_buffer);
> -		core->msg_buffer =3D NULL;
> -	}
> +	kfree(core->msg_buffer);
> +	core->msg_buffer =3D NULL;
> =C2=A0	if (core->workqueue) {
> =C2=A0		destroy_workqueue(core->workqueue);
> =C2=A0		core->workqueue =3D NULL;
> @@ -308,7 +305,7 @@ static int vpu_core_unregister(struct device *dev, st=
ruct
> vpu_core *core)
> =C2=A0
> =C2=A0	vpu_core_put_vpu(core);
> =C2=A0	core->vpu =3D NULL;
> -	vfree(core->msg_buffer);
> +	kfree(core->msg_buffer);
> =C2=A0	core->msg_buffer =3D NULL;
> =C2=A0
> =C2=A0	if (core->workqueue) {
>=20
> base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce

--=-FYyUlJPAcllBQWTM48ij
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV1s2AAKCRDZQZRRKWBy
9MQyAQDxpxzr9kihozUH+t2YsCS8uiqoV1YKptAS4KpREXxtcAEAiT1yqKfjFLoF
EuHuBeiiTmRL6/5CkzLEg5xRbhEOxAE=
=1XYq
-----END PGP SIGNATURE-----

--=-FYyUlJPAcllBQWTM48ij--

