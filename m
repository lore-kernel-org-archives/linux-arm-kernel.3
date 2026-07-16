Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C825C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LTNUjC40BXRlFybB+mSv8cEEmEKBkX1zlPpOw4BMpc=; b=Dc2V6zXiPfQ0OJjKF5OL2FhymV
	f/Mef92uRJIqMbeItlnRpSWmSbr7O98qvJ82sECzS9O/JXRKDR1hgFNu+WCJb12WyVq3vo27gU4QS
	0369UQ3425C1Olj5a8yQ7KfSg2pknoaXzJ8pcp/ceRZPTVhlFgR6bPly0IyYXI+RSSDwno2045Eui
	979bMWFmwXeNj2eIf9zc0q0K9UAsbAHWgq0Rshil9aYw7reR/ImaY9e3XbqskS6/wQvnYo0ZCv1du
	Bducb7vYijeMh+4K5zgloJHqhIJYWEUgfHM5aXACdNithBS+yvGSpVJYEU5yHEttjLvaV0Nl2vsPQ
	zIRZoK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTeF-00000000cGr-08DC;
	Thu, 16 Jul 2026 21:29:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTeB-00000000cGD-1fhy;
	Thu, 16 Jul 2026 21:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784237370;
	bh=osuDR5JILIJkcVDYeDbUBrentFjEpYinq/ObEaSWknU=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=EN0nQuawExwrn3Mh1KOKlP4V7n/75QqGhS7oQShw+OfyLKKRKk9dZexbtDTSqqkre
	 +k26gGjF/FZyUSWTBVSINzAx+vty17FT2OlSlMUFrVUchCoLIU4uebX3vy7ntzA/Pp
	 n54pjdZH1ZCHYSxGLqYdN4VB38egScbtW5b9KfpXLklE/sXOYd7JVeKuoXgSYXzGCu
	 2E9b3oYEs4OJ62X13InvmqZ6gxs7EM5VkMh7NEHO1dC1hu3CQYpF1iOUMDZT8/gL7O
	 /MUGsRquKsuZ1CEt58MCDhRrElHfoyOsOm1jmdjo6ndeCjPiSrGAhnMn+zPSFrHx30
	 CUXYIiRc9bCWA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 023D717E1066;
	Thu, 16 Jul 2026 23:29:28 +0200 (CEST)
Message-ID: <5f6b97ddf55abdd1e9b878fbe0f879cd1a58cb01.camel@collabora.com>
Subject: Re: [PATCH] media: mediatek: vcodec: unregister VPU watchdog handler
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai	 <minghsiu.tsai@mediatek.com>, Houlong Wei
 <houlong.wei@mediatek.com>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Chen-Yu Tsai	 <wenst@chromium.org>,
 Haoxiang Li <haoxiang_li2024@163.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Thu, 16 Jul 2026 17:29:27 -0400
In-Reply-To: <20260708124235.763036-1-lgs201920130244@gmail.com>
References: <20260708124235.763036-1-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-Qh1E11CnvQ0cabgTOs9W"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_142935_605088_CE5AFE02 
X-CRM114-Status: GOOD (  21.80  )
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


--=-Qh1E11CnvQ0cabgTOs9W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 08 juillet 2026 =C3=A0 20:42 +0800, Guangshuo Li a =C3=A9crit=
=C2=A0:
> mtk_vcodec_fw_vpu_init() registers a VPU watchdog reset handler and
> passes the vcodec device as the private data.
>=20
> The handler is stored in the VPU device and can outlive the vcodec
> device. If firmware initialization fails after the handler has been
> registered, or if the vcodec device is later removed, the VPU watchdog
> table can keep a pointer to a vcodec device that is about to be released.
> A later VPU watchdog reset can then call the reset handler with a stale
> pointer and dereference freed memory while walking the vcodec context
> list.
>=20
> Add a VPU watchdog unregister helper and clear the vcodec watchdog

The helper is already added in previous patch.

> handler from both the firmware initialization failure path and the VPU
> firmware release path before dropping the VPU device reference.

I'm changing my mind. Please resubmit with proper commit message, and make =
this
a series of 3 patches.

- 1/3 Add vpu_wdt_unreg_handler to vpu driver
- 2/3 Fix WPU watchdog
- 3/3 Fix MDP watchdog

Nicolas

>=20
> Fixes: 01abf5fbb081 ("media: mediatek: vcodec: separate struct 'mtk_vcode=
c_ctx'")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 ++++
> =C2=A0	=C2=A0=C2=A0=C2=A0 | 15 +++++++++++++++
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 ++
> =C2=A03 files changed, 21 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> index 3632037f78f5..c79a78c371ea 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> @@ -40,6 +40,9 @@ static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw=
 *fw, int id, void *buf,
> =C2=A0
> =C2=A0static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
> =C2=A0{
> +	vpu_wdt_unreg_handler(fw->pdev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fw->fw_use =3D=3D ENCODER ? VPU_RST_EN=
C :
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VPU_RST_DEC);
> =C2=A0	put_device(&fw->pdev->dev);
> =C2=A0}
> =C2=A0
> @@ -120,6 +123,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *pr=
iv, enum mtk_vcodec_fw_use
> =C2=A0
> =C2=A0	fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> =C2=A0	if (!fw) {
> +		vpu_wdt_unreg_handler(fw_pdev, rst_id);
> =C2=A0		put_device(&fw_pdev->dev);
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0	}
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..f59f45fecc75 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -437,6 +437,21 @@ int vpu_wdt_reg_handler(struct platform_device *pdev=
,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
> =C2=A0
> ++void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id=
)
> +{
> +	struct mtk_vpu *vpu =3D platform_get_drvdata(pdev);
> +
> +	if (!vpu || id >=3D VPU_RST_MAX)
> +		return;
> +
> +	mutex_lock(&vpu->vpu_mutex);
> +	vpu->wdt.handler[id].reset_func =3D NULL;
> +	vpu->wdt.handler[id].priv =3D NULL;
> +	mutex_unlock(&vpu->vpu_mutex);
> +}
> +EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
> +
> +
> =C2=A0unsigned int vpu_get_vdec_hw_capa(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct mtk_vpu *vpu =3D platform_get_drvdata(pdev);
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.h
> index 3951547e9ec5..2ccb481a04cf 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> @@ -141,6 +141,8 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
> =C2=A0			void vpu_wdt_reset_func(void *priv),
> =C2=A0			void *priv, enum rst_id id);
> =C2=A0
> +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)=
;
> +
> =C2=A0/**
> =C2=A0 * vpu_get_vdec_hw_capa - get video decoder hardware capability
> =C2=A0 *

--=-Qh1E11CnvQ0cabgTOs9W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCallNNwAKCRDZQZRRKWBy
9H0LAP93cFVyxF1Y5F/QhxqkNksrUWQE8WMGepmryjLgNuujgAD/Wq0VSBH7J5ui
5Hbe5xfRbMY1ZZlkcYXmLDujMdtkJws=
=rFnN
-----END PGP SIGNATURE-----

--=-Qh1E11CnvQ0cabgTOs9W--

