Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2B6CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HtcXJwIovXJhI6CN0srEgCID90Np/hQHMkqavjxkSc=; b=E7ETzEbHnGcKqhHYtXAY2icPoU
	tDj88hDLvy3pJWBy/bloZ1uR+YrWbNmIGQtBnM50pKkiKjf5bGVqJZ/Q9XIiXJBLgM0DWjRbUECBr
	5TSD9YnYJfjntiG2Zr3+MXJQF77kiE7Edrbq2NHN0g0SupyRQ9xfxZA0sURyX9eqzjmIBSnLMxcwM
	OdAxYJROkpXjEWuievfz4hduv9GN4UUx5JcDsbb+5kpYEnGyuSQIZaO3jesyyBLuHaWNUQwoe/xja
	/DFKZ0m7DCsolGrvQ0slYYwqnlExEgxckhGZVvg9nIoVd2I1itV/2tmOis+Dq6qEelSjtNcZtW462
	xS/QUrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBf6b-00000004ZfS-39F1;
	Tue, 29 Sep 2026 21:11:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBf6Y-00000004Zez-2VkC;
	Tue, 29 Sep 2026 21:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790716270;
	bh=OJHK3wW5ArguXbjLgPCeX7+D0gjNCSr/9bwfhXsKji4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YjjWYb+F7ntVNqsBOrNRkIabv3brgPYVxGRCJ+c1u7teeLF+YAbmOWh4O6jjRYHH7
	 HRBTPlrC8C4m0dNLXij4Cq0D1XXktLyiaJfdEgMR4mNqOdKAuD9in8StQ6fzJ0ha08
	 Sd9qfHyTk/JZPt+BuOb2u8PCFcBREiUFgPsXQdadDaCCOQ6L/0HCz3+tyaf0tDXcQC
	 5sIcSW8CND6vUM/YkE7nFt7IeP4UKUDqlEv8m2rE2WMq30TL7BqLwr2cXxc7QTdDeA
	 a83bI7ukhAE4KIBs7b31sgl7YyvEnsVMsbGNdO4Ge0wChkJkbNOlbmCb+G/FABfQeT
	 BCqvzTFdiH4qg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1797717E0203;
	Tue, 29 Sep 2026 23:11:07 +0200 (CEST)
Message-ID: <1db4cc111dcfcdff0042841ff71ca0e0740e5072.camel@collabora.com>
Subject: Re: [PATCH] media: mediatek: vcodec: destroy core workqueue on
 remove
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, Fei
 Shao <fshao@chromium.org>,  Kees Cook <kees@kernel.org>, Chen-Yu Tsai
 <wenst@chromium.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,  Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Date: Tue, 29 Sep 2026 17:11:06 -0400
In-Reply-To: <20260915115753.2411047-1-lgs201920130244@gmail.com>
References: <20260915115753.2411047-1-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-rz/nb+3HJ76xRI+V+kAt"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_141115_187054_A95D2740 
X-CRM114-Status: GOOD (  17.81  )
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


--=-rz/nb+3HJ76xRI+V+kAt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 15 septembre 2026 =C3=A0 19:57 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> The decoder probe allocates core_workqueue for latency-based decoder
> architectures. The probe failure paths destroy the workqueue, but the
> normal remove path only destroys decode_workqueue.
>=20
> As a result, removing a latency-based decoder leaves core_workqueue

LAT is an abbreviation to for the core responsible for entropy decoding. I =
don't
know what it translate to, but its not "latency", I'll do the minor edit. I=
t
does reduce decoding latency though :-D

> allocated after the device lifetime has ended.
>=20
> Destroy core_workqueue during remove for latency-based decoder
> architectures, matching the cleanup performed by the probe failure
> paths.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware=
 decode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>


Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index e936ed8dffba..426d060d937c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -570,6 +570,8 @@ static void mtk_vcodec_dec_remove(struct platform_dev=
ice *pdev)
>  	struct mtk_vcodec_dec_dev *dev =3D platform_get_drvdata(pdev);
> =20
>  	destroy_workqueue(dev->decode_workqueue);
> +	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
> +		destroy_workqueue(dev->core_workqueue);
> =20
>  	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
>  		media_device_unregister(&dev->mdev_dec);

--=-rz/nb+3HJ76xRI+V+kAt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwpagAKCRDZQZRRKWBy
9DH8AQDi1rdmJFjoheKwH20vfJzgzCvgVYU5PBPqraReB1W2sgEAnGKrT/vDeefh
OzjBK1cPvD9/FeMAd3jcnge8XJbQnQc=
=10sJ
-----END PGP SIGNATURE-----

--=-rz/nb+3HJ76xRI+V+kAt--

