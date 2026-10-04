Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7F7CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 11:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhuCTwJXESFC7GXHK/sAbi8kSiySbX6q8d3D6uLo3NQ=; b=yPLEKCsxaDhzj9kIeCQCEV1pTZ
	DtnJAaIU3rnchP+/xNi4Vr43fUTKrZF5GwtLbp39cZU3KiKN351Ftzheh2zkhZ0Yv23hiR6Uh0ZCz
	7diSrx/ggShWcVg8fXkoBYcOKBH/lgTamKLuuvKmewmbUXYmf+G64evKy4Xmk7hp2kDEfdSn8ssBq
	6k1Nngve8YIH1rXqJ6XW7I7IwmKsAeAOxF+ga6C+uSxQVblMXLGfw8MuIVZ1B3H2HyhiJ0MaCLA6x
	s1mAOE6EAdcb6qwISqbLM4gKDZ4/CXQRbNCOHMd39A2yuHdaUNiChaDRRidmTJB5NABt3AkhsNwu/
	lvLWI+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKNy-0000000Ek9N-1VnY;
	Sun, 04 Oct 2026 11:28:06 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKNw-0000000Ek8h-0aN2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 11:28:05 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a024e16179so5198255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 04:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1791113282; x=1791718082; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhuCTwJXESFC7GXHK/sAbi8kSiySbX6q8d3D6uLo3NQ=;
        b=VQzfF5Azn5hh6mnPYl1JkkUHOk3K2Jt+S9YyJAEe0Ci8ctd6HLRpOb9vfao0mNoedY
         Y8/07toRhoXTJBTYrtCD1gXHhhtpsBAR2P5wx7RTgHbwzJV2saej0yqOO6twxrTEHLHC
         dPc2b685BdAQGN7iizkhZVoK7Jp/QkRbPSnuBP67i13Zcje8rJq+frEiwf+XiJ+Xyx8k
         02zlJ/xn754HfIxSxjmoVnFztC3k06+hw/agL+3QU9lwx8vsgRjagwWa1lSYCzxNGk6V
         Lxe70GFZ0sk6+ze3UEqfvsxMRM53Ch+5QRxNjIBVeEV2iwy70zdcsrdSUsmrmFS3NFf4
         CwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791113282; x=1791718082;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhuCTwJXESFC7GXHK/sAbi8kSiySbX6q8d3D6uLo3NQ=;
        b=eIgIQdnSfsI29fG8Q5GVmXU2cUAoTDaiFj/hsn7cfSYVFv3VbBSSTF3FrV0AlGqPMA
         P7LKm6lqPWXy3kB6MAQO7m1j8meB5MEPHER7W4l6nLNqoZmSUHOL9qBiIraUG7CdyP0c
         7VdcL/dVctZarLuwThA4NFyF6F7r0B8E2givWULDLwbwktKmCEIA74LMC9ScF/6wKsrJ
         DxuKnKdF80V5j7i0CHVvTFgquDvOhpj0O1+1J+JhYIteeohqQSXdN0GtiQjZ4lpEdGEX
         feme+51wjtIzNgbibVdlQB69g9I28jPVliEW6uBd+3g/TRCWTKdOwdGlOvlsO8v3sIRN
         5jyw==
X-Forwarded-Encrypted: i=1; AKwUvBxNltSPl852TPzz4nEwPZHlia1fItYOCk4+XzvcokO1A/jUo1mf7tPzwJ2d3mXbuoV8LoMigr1PmxnFWcXxGqj0@lists.infradead.org
X-Gm-Message-State: AFuF++lRxuQrDXKcRCVlhf8nHSkFO8IHEwVZmZWXz4kQRE7RMvkeAKTd
	1DueDpiE3NQTCfqO3oXdzSdfXkd+/iro3HRIWh4XDDy+kLJ4jyRVLAjRuIbkndDfPTk=
X-Gm-Gg: AYBFou21IS8q/m2lnJAuw+kLTYHsuvBDt/ZIxmzf5S7pSYP1BKZuadSYSIFPaN9pUoQ
	yrBSEGA6EKjmQYguEa/RkU7jm3DLILcyQYyGfwcofGqikva8iBjsY18O1BJo5vakcIKusAq96ZD
	GrRQgeuOpqdM7NhqVH00k2rnaONHtrVg0af9suAEaOMlFLGlKSskoeHcV4LzqQnLPO7nkv2u0cD
	ypMnBtRuY23425yVUScspGSMLHnhlMXU231q1dy/o2CXIpol2IPNk1cePsZwnLlZnVewsGBnfDB
	9iGnl7zHqjrDktfyZAnEqDD2VgH2gn8R5FaNIGgli2aniZLdrp3YoyObrJEZbr18HkHSE3zabr7
	/KbYjfT1ck2w4KGSd/h1GxY01AUyE971+hZ+2elvvnVW/6PZZkroQGldaseQsKjBoQeT2EL2WDC
	qDu+tamGo4xIrF2nUYEol8MT3r731dDhNHEaDNk9F3/Q4me6FsXwUVgCZp1sRZtx4VjE1plELTo
	66bfSTW9Rjzx/I7d55jdKG+jSIcOpzfjGM5sfyMxzwI+VqzUM20qVl+WWfgq8YyKGuIIA5Nf0nM
	KXq5jKXOfsZaC7hR1V0OJtXxHe5ZvL7DUrTWxPGm
X-Received: by 2002:a05:600c:8717:b0:4a0:2867:d8a9 with SMTP id 5b1f17b1804b1-4a02867da4cmr125457755e9.30.1791113282016;
        Sun, 04 Oct 2026 04:28:02 -0700 (PDT)
Received: from ?IPv6:2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f? (2001-1aeb-400-6f00-73f4-bfe7-a3e6-c16f.ip6.tmcz.cz. [2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16d6295f9sm129342815e9.14.2026.10.04.04.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:28:01 -0700 (PDT)
Message-ID: <0afab6a00aaa0bd7d9085a2573bd3133252a07c7.camel@ndufresne.ca>
Subject: Re: [PATCH v3] media: mediatek: jpeg: retry HW selection after
 successful wait
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, bin.liu@mediatek.com, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>,  Irui Wang <irui.wang@mediatek.com>, Kyrie Wu
 <kyrie.wu@mediatek.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Sun, 04 Oct 2026 07:27:59 -0400
In-Reply-To: <20260815134949.49042-1-pengpeng@iscas.ac.cn>
References: <20260815134949.49042-1-pengpeng@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-QpMlAF90W0tCNQZ2Cp7Y"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_042804_198275_3EE5E4AD 
X-CRM114-Status: GOOD (  19.22  )
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


--=-QpMlAF90W0tCNQZ2Cp7Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 15 ao=C3=BBt 2026 =C3=A0 21:49 +0800, Pengpeng Hou a =C3=A9crit=
=C2=A0:
> wait_event_interruptible_timeout() returns a positive value when its
> condition becomes true before the timeout. mtk_jpegdec_worker() treats
> every nonzero result as a failure, so a normal decoder wakeup finishes
> the mem2mem job as though no hardware became available.
>=20
> Handle interrupted waits and exhausted timeout retries separately, and
> retry hardware selection after a successful wakeup. Increment the retry
> count only for actual timeouts. The encoder uses
> wait_event_interruptible(), whose successful return is zero, so its
> existing check is correct; leave that separate no-timeout policy
> unchanged.
>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Applied, ty.

> ---
> Changes since v2:
> https://lore.kernel.org/all/20260720115322.89784-1-pengpeng@iscas.ac.cn/
> - add the Fixes tag
> - revalidate the decoder-only change against current mainline
> - add the required coding-assistant attribution
>=20
> Changes since v1:
> https://lore.kernel.org/all/20260625003142.99598-1-pengpeng@iscas.ac.cn/
> - split interrupted waits, timeout exhaustion and successful wakeups
> - use distinct diagnostics and explain why the encoder path is unchanged
>=20
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec483081..9634c95aaada 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1697,9 +1697,15 @@ static void mtk_jpegdec_worker(struct work_struct =
*work)
>  		ret =3D wait_event_interruptible_timeout(jpeg->hw_wq,
>  						       atomic_read(&jpeg->hw_rdy) > 0,
>  						       MTK_JPEG_HW_TIMEOUT_MSEC);
> -		if (ret !=3D 0 || (i++ > MTK_JPEG_MAX_RETRY_TIME)) {
> -			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
> -				__func__, __LINE__);
> +		if (ret < 0) {
> +			dev_err(jpeg->dev, "decoder HW wait interrupted: %d\n",
> +				ret);
> +			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +			return;
> +		}
> +
> +		if (!ret && i++ > MTK_JPEG_MAX_RETRY_TIME) {
> +			dev_err(jpeg->dev, "all decoder HW are busy\n");
>  			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>  			return;
>  		}
>=20
> base-commit: dac3e89a2c90c2feeb471e1f22a2512ad424b792

--=-QpMlAF90W0tCNQZ2Cp7Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasI4PwAKCRDZQZRRKWBy
9NuTAPiH0Pb4Hv6jCeaCxdy/4aZd8Z1R3IzPxbwVYpFmBA/lAQCWv/jVgYefRNok
CUnniqRpZ//vxqIPJzCA3jzERvecAQ==
=u5ij
-----END PGP SIGNATURE-----

--=-QpMlAF90W0tCNQZ2Cp7Y--

