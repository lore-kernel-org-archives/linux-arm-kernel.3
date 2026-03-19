Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2AB1091916
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 20:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0AE6ezNpya7RR7FjT2PYnGrtSfyWo+dZi1jY1xEvZs=; b=XZuvht/MZ283ZNwgQEDykvPDr9
	3BPsjTfRcg7ProkOYnw9LUPTfTkv4ffuhPOLeB3BCCfh46+0a8LJlN5XiIMxV8R4meCJHNrXAAEEc
	v20q91Tuu6hET+o7lt+Dg5kEStex0WPTOVMXEcPHHWlmSpknKLtk/sNeVlI+VCF4Rx84kGKSjvnsD
	ECzrxN96ZGB5YndBk9J/I5DgNQJ9uwSh65JTzcGhZY4IXBDh/H5TO1mIs0vhSN1iN8BymAmdQV4g+
	XLDlSbAq6E2jRarJxlK+jOE7SVW9JvmIQWBLTj1Uq4LU/+Pd0t3Xar4RL5EMlj7dfeEPrwXk08V5G
	GWDjwe6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3KJc-0000000BYiy-23s4;
	Thu, 19 Mar 2026 20:50:00 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3KJa-0000000BYiY-1p0w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 20:49:59 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50917e02472so14672291cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773953397; x=1774558197; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P0AE6ezNpya7RR7FjT2PYnGrtSfyWo+dZi1jY1xEvZs=;
        b=tY0c9lM4JMutQ5mVMTUXhpEeHDWEAj6rdr7AeWQi6AodBAi5b6GIm0oq7g75Sfm2ya
         1nHiPn0ERncCBnqDll4FbBnZ23wCuw+cz+a0EyyRSa07yq7VKdPzurUzPxAGtd62zETe
         MDHIPVcEWF9VlbpkrLML620ofdWaFIFjPH7t7o3eq/wOFK3xT83ZE/qCrQ68ACSV9tQM
         ibS1jBOVqZXu3fTU1nESI/UwlsGr5Fd1t5oDNEnGRgh8hb9UdVcUKSZhcmqY1Vu+Ctyj
         4r1qMZzl/9/IpZZecC+1Awzx0baaO/oVbPYCEnWLNyzWdVZG6UVG3ObFaQZ+AezVjk51
         lI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773953397; x=1774558197;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0AE6ezNpya7RR7FjT2PYnGrtSfyWo+dZi1jY1xEvZs=;
        b=sL5MHp33igDkQxu1UhHeyFeUPYnZga3rxAFzeVu9COo40zeyHoG3w9MLo+SvUhBxWe
         yj0/iqpXCjTUs903rQi2CNK8SqcWnNTktY9KS7ppIo7Jry4MUTNUu+GSLo47sOVNjA2A
         hYJeqJx502sc9hjYAEfkFA1z/ZgodytG7QrCy6/bukBCluM71zHmbRLnTZ1bhTkvmrJ0
         ey1pnvRI6OMlWsIXCeY7gWiz0kTQDBAxIDfapHpvV9Evd42Asu2Uu8N6PttFNCOd/Wnc
         oNmSOU0vf9IUoJB1l9gLH3WxYazyRSNIXezJ8w8yZkAL5IbI9CEx6HGSHKDEX8acI5zR
         8YdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbdH+VqgPiT8RYq/+YD0BzsBph7tZ3DukknZCGHX2tkSCUKQ86RUZGaIxxj4qCVkxOffOUfGVKqDx5GsUgkOfS@lists.infradead.org
X-Gm-Message-State: AOJu0YwWTmxbuLikQ9Rc0F9eafcBc62WQ40YtcK4UYH6f1++7FXuaYWG
	z8BzyesoiDEw1+TVgKWipqiZRCIbIA/R3/7igQR2EjBmhtvrDUoUumgxF6VyPyuxRkc=
X-Gm-Gg: ATEYQzxIM46dbcs9SeAQ/ltGkeKtC6kjzt46Ko3aOJeFbgr8Sgl8a+UR9kxsrT9/1YR
	88FRA7ULsNIzIwnvkHN3oJ/Yrz2r5qImh9snEkydvJmgw0KgtAcz6PeKLXutEoFOMEiV83g6tlQ
	sUevGESNdiNVAe60MWIPRNsBR8Q6TjUn6id0DbkPfmAohOdSvA0WhMTWvpcJPvzB6dxS8EuMhvN
	y3Ym6Nm7UIILOPsT2CgQxO0jcwmGGAsVY64gJsgEbmtiQY6OljYnDR7SWj4fEOWZS9/1z8o6c/x
	vJ+iE1Ql2KZIQYeH8kLSEm7KQY13TmB1160ji0IwfWER4nxhchVf75NP1r1apqwSEStCQPP/uEt
	SttA+MYbhzLGMuOTFcrQz4ZFR2sY0foh+/3Cl3jhI22I/ZAFZGwyKSVHKuqoIzh1u6Gw6+7YGmS
	ZRH4TijAOY+oGxPclOKnfnEnP0OQrL
X-Received: by 2002:ac8:7f43:0:b0:509:481:536d with SMTP id d75a77b69052e-50b3753b698mr10051231cf.59.1773953397275;
        Thu, 19 Mar 2026 13:49:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d0671csm5413341cf.10.2026.03.19.13.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:49:56 -0700 (PDT)
Message-ID: <ffe1c9db59092ac196e9ad1fdbebe73b75d3fcb4.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Fix race between m2m job_abort and
 device_run
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Mar 2026 16:49:55 -0400
In-Reply-To: <20260306065951.837-1-ming.qian@oss.nxp.com>
References: <20260306065951.837-1-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-NtmVNV443a/7/iP6AJJn"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_134958_511060_7B81DB28 
X-CRM114-Status: GOOD (  18.13  )
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


--=-NtmVNV443a/7/iP6AJJn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 06 mars 2026 =C3=A0 14:59 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Fix kernel panic caused by race condition where v4l2_m2m_ctx_release()
> frees m2m_ctx while v4l2_m2m_try_run() is about to call device_run
> with the same context.
>=20
> Race sequence:
> =C2=A0 v4l2_m2m_try_run():=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 v4l2_m2m_ctx_release():
> =C2=A0=C2=A0=C2=A0 lock/unlock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m=
_cancel_job()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job_abort()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 v4l2_m2m_job_finish()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(m2m_ctx)=C2=A0 <-=
 frees ctx
> =C2=A0=C2=A0=C2=A0 device_run()=C2=A0 <- use-after-free crash at 0x538
>=20
> Crash trace:
> =C2=A0 Unable to handle kernel read from unreadable memory at virtual add=
ress
> =C2=A0 0000000000000538
> =C2=A0 v4l2_m2m_try_run+0x78/0x138
> =C2=A0 v4l2_m2m_device_run_work+0x14/0x20
>=20
> The amphion vpu driver does not rely on the m2m framework's device_run
> callback to perform encode/decode operations.
>=20
> Fix the race by preventing m2m framework job scheduling entirely:
> - Add job_ready callback returning 0 (no jobs ready for m2m framework)
> - Remove job_abort callback to avoid the race condition
>=20
> Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Ok, I guess that also reduce the overhead of scheduling jobs too.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.c | 9 +++------
> =C2=A01 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/pl=
atform/amphion/vpu_v4l2.c
> index 64fc88d89ccc..7cccc994fc50 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -447,17 +447,14 @@ static void vpu_m2m_device_run(void *priv)
> =C2=A0{
> =C2=A0}
> =C2=A0
> -static void vpu_m2m_job_abort(void *priv)
> +static int vpu_m2m_job_ready(void *priv)
> =C2=A0{
> -	struct vpu_inst *inst =3D priv;
> -	struct v4l2_m2m_ctx *m2m_ctx =3D inst->fh.m2m_ctx;
> -
> -	v4l2_m2m_job_finish(m2m_ctx->m2m_dev, m2m_ctx);
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct v4l2_m2m_ops vpu_m2m_ops =3D {
> =C2=A0	.device_run =3D vpu_m2m_device_run,
> -	.job_abort =3D vpu_m2m_job_abort
> +	.job_ready =3D vpu_m2m_job_ready,
> =C2=A0};
> =C2=A0
> =C2=A0static int vpu_vb2_queue_setup(struct vb2_queue *vq,
>=20
> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
> prerequisite-patch-id: 0000000000000000000000000000000000000000

Not sure why this line ...

Nicolas

--=-NtmVNV443a/7/iP6AJJn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxhcwAKCRDZQZRRKWBy
9HjYAP0S0YE21EwzVQU1/zKYJbvHM7WGRp6aud37nxGkL7LXVAD/QVLAcoFXLtH9
khW4FVX+kR4xvQStun2japJcuFbnQg0=
=Af7N
-----END PGP SIGNATURE-----

--=-NtmVNV443a/7/iP6AJJn--

