Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96537C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 00:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tJ/LGm3zCfGJYAHdJASmu5UYMKzr02LeQDnrI/CL8g=; b=DEu9tLD+hDlE2vlks/DtZFzvBJ
	rHfOnoxm8Zidd/Ibtt/c7b8r1Xw3/rXcTuctHJIIAj5i9vqOm6g0XCVfi5VLqJGoew53Bl4uDD+ZP
	CeDiwXomCJg73w7oLLmcRVVqT3zfino3OVphe2CTeWvO/D/GVVSVaJK9hFQLdzAz+j/hZutoHd5lK
	CFB1SSkAWl5oQSnMrb009iFNrbIUcB9gx+nhYqIjzY95pKI+i0oXnZDyNPB2pAArPyjh6YYxdkugF
	Kj0N5s4bTT3jhwsBGGQi7PRQIScoztRD6NuoGGDxBfiCUam+Og9sdbF1T9EhCkZ6mjPm2APFLtX+T
	h5uWQjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9gr-0000000G7Fz-1Pno;
	Thu, 16 Jul 2026 00:11:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9gn-0000000G7FC-1kRk;
	Thu, 16 Jul 2026 00:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784160651;
	bh=L6wzWtyvgyok8KVvz9Zy5mkqvkgLWLzGSf4BynH8hsA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qej1PAxXwUEHHwB2sL10F5Sk0AxcW/t6ZkTX+1ZWRNw44sbZaLF7zVlgWxlvFI3aB
	 0XjSSxu6aWkYFRbBWLPDBNTDiY6VAPejanoggfArp4UTaJLIEdzyzPJFBogLDDKqAD
	 vUesX3/OkQ7aP5tMThMrCdAlBaAIH9WTnU/Tfijzr5ex8gqViZyWnjLZfAiA9oFiVS
	 NVrCuUWNpOJ1Gf1RHK8seDoi65iawP4uwT1nhQeoI+7CMzQeQj057weCH+QJ20eucZ
	 xfuFzhnTBkVsI7LMT5MY2kpQznkEXpgHddc6iDFKf7AWnOeT/NQgnqIheQFCKHdOZg
	 zwbLgy64vdycA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19CF517E0D7E;
	Thu, 16 Jul 2026 02:10:49 +0200 (CEST)
Message-ID: <c0aa1f673f13704e05fd564904c5cf28a2dba9e6.camel@collabora.com>
Subject: Re: [PATCH] media: mtk-jpeg: only init/cancel work for multi-core
 variants
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Bin Liu <bin.liu@mediatek.com>,
  Mauro Carvalho Chehab	 <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Fan Wu <fanwu01@zju.edu.cn>,
 Hans Verkuil	 <hverkuil+cisco@kernel.org>, irui wang
 <irui.wang@mediatek.com>, kyrie wu	 <kyrie.wu@mediatek.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Wed, 15 Jul 2026 20:10:47 -0400
In-Reply-To: <20260601073218.1281840-1-zhengxingda@iscas.ac.cn>
References: <20260601073218.1281840-1-zhengxingda@iscas.ac.cn>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-WdvxyDtEJGKYSORbsIFW"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_171058_057548_CAE83482 
X-CRM114-Status: GOOD (  17.27  )
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


--=-WdvxyDtEJGKYSORbsIFW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 01 juin 2026 =C3=A0 15:32 +0800, Icenowy Zheng a =C3=A9crit=C2=A0:
> Single-core variants of this hardware do not use the work at all, and
> the worker function is set to NULL, which leads to warnings when
> cancelling the work in release callback.
>=20
> Skip the work init/cancel code when the JPEG hardware isn't multi-core.

Thanks for sending this patch, thought this specific issue has alrady been =
fixed
upstream, see commit b1845a227fda37b2fe5327df3ca0015d7e290235

Nicolas

>=20
> Cc: stable@vger.kernel.org
> Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path=
 due
> to uncancelled work")
> Fixes: d40e95274925 ("media: mtk-jpeg: reconstructs the initialization mo=
de of
> worker")
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 8c684756d5fc2..83e54a7ef49c0 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1160,7 +1160,8 @@ static int mtk_jpeg_open(struct file *file)
> =C2=A0		goto free;
> =C2=A0	}
> =C2=A0
> -	INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
> +	if (jpeg->variant->multi_core)
> +		INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
> =C2=A0	INIT_LIST_HEAD(&ctx->dst_done_queue);
> =C2=A0	spin_lock_init(&ctx->done_queue_lock);
> =C2=A0	v4l2_fh_init(&ctx->fh, vfd);
> @@ -1202,7 +1203,8 @@ static int mtk_jpeg_release(struct file *file)
> =C2=A0	struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D mtk_jpeg_file_to_ctx(file);
> =C2=A0
> -	cancel_work_sync(&ctx->jpeg_work);
> +	if (jpeg->variant->multi_core)
> +		cancel_work_sync(&ctx->jpeg_work);
> =C2=A0	mutex_lock(&jpeg->lock);
> =C2=A0	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);

--=-WdvxyDtEJGKYSORbsIFW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalghiAAKCRDZQZRRKWBy
9Ho1AQCHwVea3BvJBHkB/HKCykfk5eoLVVPni4hAFnB/JkpttQEAsS7hLarWfHxC
6c0nnvMsKvuEjLpd/7icUUQYJzRJKAA=
=/DUp
-----END PGP SIGNATURE-----

--=-WdvxyDtEJGKYSORbsIFW--

