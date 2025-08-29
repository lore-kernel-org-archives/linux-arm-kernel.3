Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD85CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Nn2QZqBEULdZ0VrKD8SCB1v1paB+n/b0AG9QGhllqo=; b=d+s0TChBLlqkFmR0kfKCcqsUb5
	ICu+CL9b0RmvJCZYDA/8V5teZMbyVvYK912WzbbVKEEB0IePLxUKznzU6nzgKXB3O45Ic4rVx9gz/
	TOH5wiAqezik0KcubATRQ26oPGpnbvTrtrmNGLGQ0Tn/V8KnRsTSOo1v0ULHdt+W2DYIRouG6MQxr
	M0WlNoRIu+/1h9JfdWZ/Tw+C/rIUGbaGry2L6gIkECahNdoGIsa89Jd9LGY0PHCneq5cBenlCv2G6
	pdO3xfC/l+ry4cxFxkWc63+Zom383zrUwEyTmtykSJhiKNOYT64TgWE/X2MN29kfQaqF0fSN+CCu2
	v2pMoLVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9o1-00000007Bno-3ioY;
	Sat, 30 Aug 2025 00:50:57 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Aa-00000006fca-2WJC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 18:49:54 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7f861f89313so227920785a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 11:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756493391; x=1757098191; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Nn2QZqBEULdZ0VrKD8SCB1v1paB+n/b0AG9QGhllqo=;
        b=yctdqYIplC9yact5Foh8aO5x+Z58r8sMekMgDj4fV4ruYsScaGEl5FVS0D1AMxz8cy
         XAnX4J5S0Q316ZZn5bkTpumBhUSFQdMlaC1LSvT78C0MIvcZceYLXc4IOtPiTHk2SNlA
         pX1Q86y/GXYod94LRWbgAE1w9AdDYPrItMWZmRNocXudqTcY1Gsz6eToCGKN5nb6tXJC
         usHsuft4+ascLidolLI5qJNdMWfBpu0UftHIzaoOG6ru19XdRCqfigqprgqeYyvSCkRk
         K3i0dWivmRbd9Zkxd0lKMKhhfKlhKy2j4Fvl5xcEUwix10iUnWCvzmI4Pol7LlN/Uq0R
         1J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756493391; x=1757098191;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Nn2QZqBEULdZ0VrKD8SCB1v1paB+n/b0AG9QGhllqo=;
        b=LYWOzdXl/jCqyPpCsngw1+zzJL4/jlAQSruerbhiYqGLPiTekYPtghJu2UIFgX4V7N
         yHAoLZ6NaYRRXaOr8t9ff6nqPNOq0dBA7RSBbz1BSETa5o4fJ+xvgOMW4Qjvq6tVjM4b
         s7xl6jRyzUNPCZTHnJ1Vs4NBJQ3cP8HsPu2pxjbe/wVfHHqREEy0UBD7BAfDWAY9KPCS
         l63y8avr/NI20aKAiUlFjVzdghXHGVkplXmiC+OAKuU/H2+JySdqqtG2BxVG4P76z9uZ
         tu7xDiASNPPi9PHpHU+3k+3J6fx2Os7auBU34ZgQ8LWvcy/j6t5OS4QG87sshjVb3RXW
         /K4w==
X-Forwarded-Encrypted: i=1; AJvYcCXukNStn0Y4elhZGNmI/K0OvoweQntuFc65etG3YL+pCzegRHPboYGkt5EETj7gh6f3lldYbrCaeuo2iCxfSnYn@lists.infradead.org
X-Gm-Message-State: AOJu0YwM8ZCG6mJ+NyiJqsD2yLClkFDSXuInzokQWF+shveNoqJPN3OD
	ueHlbcJygjTVC2ZPeE5JoJVFgEawrtTVwJrIkOcN8uM3OTwqvopJxLnoj7UGsCiAPyg=
X-Gm-Gg: ASbGncvRftDI0h2my9VhCErWFgZi9VaaEBypzWDzvz7uo3ZmAtitywpnHp+avSdyT3N
	BxoYw4CkM27VrV4+PbA7cA2nPcsyxGg4I4XM9mJjBYvJkV951/ldHmFUd4KeQb5wVHAmhnKCpDA
	ssSAzXQPEtfkfkgzK0xYof8g48zu4weT6CPmzauNCSXp8Ft7mhs6jU+s6T1vl1GhdnOmtNGWP6Z
	CGbyFbILMpZ1ooLuHPdHUISMKlk1piH9cwQcml7xkCWCA3MQZrKT2wUV5bn9fEKljvtkRXDZrtT
	ng2T4eGUnsVQHkZa0CJpp0miTEJHiwHAUABwfZYrj3JphM8wvXhzSMXxMnLIn2tD383SSUICLWZ
	CjdiZhmNNKVFHcVaJ9l30LpPQmExC04Pz3xIADQ==
X-Google-Smtp-Source: AGHT+IFF4atVHdhmNaYBglzT5H5NmjrqYD114uUbppJKPp9HhceW11yaoBubIq39XRYoVHnaxgxYcA==
X-Received: by 2002:a05:620a:aa1a:b0:7e6:5f1c:4d7f with SMTP id af79cd13be357-7ea1107fb69mr3513677685a.65.1756493390631;
        Fri, 29 Aug 2025 11:49:50 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc151f2a12sm227700585a.49.2025.08.29.11.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 11:49:49 -0700 (PDT)
Message-ID: <d76038453bfd06ea9d0c90e7583078abc85ce280.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: use = { } instead of memset()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Qianfeng Rong <rongqianfeng@vivo.com>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil@kernel.org>,  Andrzej Pietrasiewicz
 <andrzejtp2010@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Date: Fri, 29 Aug 2025 14:49:47 -0400
In-Reply-To: <20250803135514.118892-1-rongqianfeng@vivo.com>
References: <20250803135514.118892-1-rongqianfeng@vivo.com>
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
	protocol="application/pgp-signature"; boundary="=-xig5edR/x3ap943HT9k2"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_114952_896181_4FE7C589 
X-CRM114-Status: GOOD (  22.36  )
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


--=-xig5edR/x3ap943HT9k2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le dimanche 03 ao=C3=BBt 2025 =C3=A0 21:55 +0800, Qianfeng Rong a =C3=A9cri=
t=C2=A0:
> Based on testing and recommendations by David Lechner et al. [1][2],
> using =3D { } to initialize a structure or array is the preferred way
> to do this in the kernel.
>=20
> This patch converts memset() to =3D { }, thereby:
> - Eliminating the risk of sizeof() mismatches.
> - Simplifying the code.

Last month, Irui Wang sent an actual fix [0] for uninitialized data in this
driver. Your patch seems to be related, yet the previous fix is not covered=
 and
this is not marked as a V2. Since this refactoring collide with an actual f=
ix
that I'm waiting for a V2, I'd rather not take it and wait.

Any chances you can respin this with a second patches covering Irui's fix ?

cheers,
Nicolas


[0] https://patchwork.linuxtv.org/project/linux-media/patch/20250715081547.=
18076-1-irui.wang@mediatek.com/

>=20
> [1]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/
> [2]: https://lore.kernel.org/lkml/20250614151844.50524610@jic23-huawei/
>=20
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 +--
> =C2=A0.../mediatek/vcodec/decoder/vdec_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++--------
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 ++----
> =C2=A0.../mediatek/vcodec/encoder/venc_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++----------
> =C2=A04 files changed, 12 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_if.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> index eb3354192853..80554b2c26c0 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> @@ -548,10 +548,9 @@ static bool vp9_wait_dec_end(struct vdec_vp9_inst *i=
nst)
> =C2=A0static struct vdec_vp9_inst *vp9_alloc_inst(struct mtk_vcodec_dec_c=
tx *ctx)
> =C2=A0{
> =C2=A0	int result;
> -	struct mtk_vcodec_mem mem;
> +	struct mtk_vcodec_mem mem =3D { };
> =C2=A0	struct vdec_vp9_inst *inst;
> =C2=A0
> -	memset(&mem, 0, sizeof(mem));
> =C2=A0	mem.size =3D sizeof(struct vdec_vp9_inst);
> =C2=A0	result =3D mtk_vcodec_mem_alloc(ctx, &mem);
> =C2=A0	if (result)
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 145958206e38..d5e943f81c15 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -181,12 +181,11 @@ static int vcodec_vpu_send_msg(struct vdec_vpu_inst
> *vpu, void *msg, int len)
> =C2=A0
> =C2=A0static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned i=
nt msg_id)
> =C2=A0{
> -	struct vdec_ap_ipi_cmd msg;
> +	struct vdec_ap_ipi_cmd msg =3D { };
> =C2=A0	int err =3D 0;
> =C2=A0
> =C2=A0	mtk_vdec_debug(vpu->ctx, "+ id=3D%X", msg_id);
> =C2=A0
> -	memset(&msg, 0, sizeof(msg));
> =C2=A0	msg.msg_id =3D msg_id;
> =C2=A0	if (vpu->fw_abi_version < 2)
> =C2=A0		msg.vpu_inst_addr =3D vpu->inst_addr;
> @@ -201,7 +200,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *v=
pu,
> unsigned int msg_id)
> =C2=A0
> =C2=A0int vpu_dec_init(struct vdec_vpu_inst *vpu)
> =C2=A0{
> -	struct vdec_ap_ipi_init msg;
> +	struct vdec_ap_ipi_init msg =3D { };
> =C2=A0	int err;
> =C2=A0
> =C2=A0	init_waitqueue_head(&vpu->wq);
> @@ -225,7 +224,6 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	memset(&msg, 0, sizeof(msg));
> =C2=A0	msg.msg_id =3D AP_IPIMSG_DEC_INIT;
> =C2=A0	msg.ap_inst_addr =3D (unsigned long)vpu;
> =C2=A0	msg.codec_type =3D vpu->codec_type;
> @@ -245,7 +243,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
> =C2=A0
> =C2=A0int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsign=
ed int
> len)
> =C2=A0{
> -	struct vdec_ap_ipi_dec_start msg;
> +	struct vdec_ap_ipi_dec_start msg =3D { };
> =C2=A0	int i;
> =C2=A0	int err =3D 0;
> =C2=A0
> @@ -254,7 +252,6 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t
> *data, unsigned int len)
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	memset(&msg, 0, sizeof(msg));
> =C2=A0	msg.msg_id =3D AP_IPIMSG_DEC_START;
> =C2=A0	if (vpu->fw_abi_version < 2)
> =C2=A0		msg.vpu_inst_addr =3D vpu->inst_addr;
> @@ -273,7 +270,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t
> *data, unsigned int len)
> =C2=A0int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int len, unsigned int par=
am_type)
> =C2=A0{
> -	struct vdec_ap_ipi_get_param msg;
> +	struct vdec_ap_ipi_get_param msg =3D { };
> =C2=A0	int err;
> =C2=A0
> =C2=A0	if (len > ARRAY_SIZE(msg.data)) {
> @@ -281,7 +278,6 @@ int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint=
32_t
> *data,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	memset(&msg, 0, sizeof(msg));
> =C2=A0	msg.msg_id =3D AP_IPIMSG_DEC_GET_PARAM;
> =C2=A0	msg.inst_id =3D vpu->inst_id;
> =C2=A0	memcpy(msg.data, data, sizeof(unsigned int) * len);
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c.c
> b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index a01dc25a7699..bc6435a7543f 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -1064,7 +1064,7 @@ static int mtk_venc_encode_header(void *priv)
> =C2=A0
> =C2=A0static int mtk_venc_param_change(struct mtk_vcodec_enc_ctx *ctx)
> =C2=A0{
> -	struct venc_enc_param enc_prm;
> +	struct venc_enc_param enc_prm =3D { };
> =C2=A0	struct vb2_v4l2_buffer *vb2_v4l2 =3D v4l2_m2m_next_src_buf(ctx-
> >m2m_ctx);
> =C2=A0	struct mtk_video_enc_buf *mtk_buf;
> =C2=A0	int ret =3D 0;
> @@ -1075,7 +1075,6 @@ static int mtk_venc_param_change(struct
> mtk_vcodec_enc_ctx *ctx)
> =C2=A0
> =C2=A0	mtk_buf =3D container_of(vb2_v4l2, struct mtk_video_enc_buf,
> m2m_buf.vb);
> =C2=A0
> -	memset(&enc_prm, 0, sizeof(enc_prm));
> =C2=A0	if (mtk_buf->param_change =3D=3D MTK_ENCODE_PARAM_NONE)
> =C2=A0		return 0;
> =C2=A0
> @@ -1138,7 +1137,7 @@ static void mtk_venc_worker(struct work_struct *wor=
k)
> =C2=A0	struct mtk_vcodec_enc_ctx *ctx =3D container_of(work, struct
> mtk_vcodec_enc_ctx,
> =C2=A0				=C2=A0=C2=A0=C2=A0 encode_work);
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> -	struct venc_frm_buf frm_buf;
> +	struct venc_frm_buf frm_buf =3D { };
> =C2=A0	struct mtk_vcodec_mem bs_buf;
> =C2=A0	struct venc_done_result enc_result;
> =C2=A0	int ret, i;
> @@ -1168,7 +1167,6 @@ static void mtk_venc_worker(struct work_struct *wor=
k)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> -	memset(&frm_buf, 0, sizeof(frm_buf));
> =C2=A0	for (i =3D 0; i < src_buf->vb2_buf.num_planes ; i++) {
> =C2=A0		frm_buf.fb_addr[i].dma_addr =3D
> =C2=A0				vb2_dma_contig_plane_dma_addr(&src_buf-
> >vb2_buf, i);
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> index 51bb7ee141b9..55627b71348d 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> @@ -132,7 +132,7 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu=
,
> void *msg,
> =C2=A0int vpu_enc_init(struct venc_vpu_inst *vpu)
> =C2=A0{
> =C2=A0	int status;
> -	struct venc_ap_ipi_msg_init out;
> +	struct venc_ap_ipi_msg_init out =3D { };
> =C2=A0
> =C2=A0	init_waitqueue_head(&vpu->wq_hd);
> =C2=A0	vpu->signaled =3D 0;
> @@ -148,7 +148,6 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	memset(&out, 0, sizeof(out));
> =C2=A0	out.msg_id =3D AP_IPIMSG_ENC_INIT;
> =C2=A0	out.venc_inst =3D (unsigned long)vpu;
> =C2=A0	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
> @@ -191,11 +190,10 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
> =C2=A0	size_t msg_size =3D is_ext ?
> =C2=A0		sizeof(struct venc_ap_ipi_msg_set_param_ext) :
> =C2=A0		sizeof(struct venc_ap_ipi_msg_set_param);
> -	struct venc_ap_ipi_msg_set_param_ext out;
> +	struct venc_ap_ipi_msg_set_param_ext out =3D { };
> =C2=A0
> =C2=A0	mtk_venc_debug(vpu->ctx, "id %d ->", id);
> =C2=A0
> -	memset(&out, 0, sizeof(out));
> =C2=A0	out.base.msg_id =3D AP_IPIMSG_ENC_SET_PARAM;
> =C2=A0	out.base.vpu_inst_addr =3D vpu->inst_addr;
> =C2=A0	out.base.param_id =3D id;
> @@ -258,11 +256,10 @@ static int vpu_enc_encode_32bits(struct venc_vpu_in=
st
> *vpu,
> =C2=A0	size_t msg_size =3D is_ext ?
> =C2=A0		sizeof(struct venc_ap_ipi_msg_enc_ext) :
> =C2=A0		sizeof(struct venc_ap_ipi_msg_enc);
> -	struct venc_ap_ipi_msg_enc_ext out;
> +	struct venc_ap_ipi_msg_enc_ext out =3D { };
> =C2=A0
> =C2=A0	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
> =C2=A0
> -	memset(&out, 0, sizeof(out));
> =C2=A0	out.base.msg_id =3D AP_IPIMSG_ENC_ENCODE;
> =C2=A0	out.base.vpu_inst_addr =3D vpu->inst_addr;
> =C2=A0	out.base.bs_mode =3D bs_mode;
> @@ -302,12 +299,11 @@ static int vpu_enc_encode_34bits(struct venc_vpu_in=
st
> *vpu,
> =C2=A0				 struct mtk_vcodec_mem *bs_buf,
> =C2=A0				 struct venc_frame_info *frame_info)
> =C2=A0{
> -	struct venc_ap_ipi_msg_enc_ext_34 out;
> +	struct venc_ap_ipi_msg_enc_ext_34 out =3D { };
> =C2=A0	size_t msg_size =3D sizeof(struct venc_ap_ipi_msg_enc_ext_34);
> =C2=A0
> =C2=A0	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
> =C2=A0
> -	memset(&out, 0, sizeof(out));
> =C2=A0	out.msg_id =3D AP_IPIMSG_ENC_ENCODE;
> =C2=A0	out.vpu_inst_addr =3D vpu->inst_addr;
> =C2=A0	out.bs_mode =3D bs_mode;
> @@ -367,9 +363,8 @@ int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigne=
d int
> bs_mode,
> =C2=A0
> =C2=A0int vpu_enc_deinit(struct venc_vpu_inst *vpu)
> =C2=A0{
> -	struct venc_ap_ipi_msg_deinit out;
> +	struct venc_ap_ipi_msg_deinit out =3D { };
> =C2=A0
> -	memset(&out, 0, sizeof(out));
> =C2=A0	out.msg_id =3D AP_IPIMSG_ENC_DEINIT;
> =C2=A0	out.vpu_inst_addr =3D vpu->inst_addr;
> =C2=A0	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {

--=-xig5edR/x3ap943HT9k2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLH2SwAKCRDZQZRRKWBy
9PWCAP0f1LmgksUyx6vPfKgnmSguVVzWU8MFLBRY7MOiMUd/iwD7BSsl2QkA8Wmk
z0Yo33ECEf32b/vaR8jSGT2efz6WqAI=
=KG+R
-----END PGP SIGNATURE-----

--=-xig5edR/x3ap943HT9k2--

