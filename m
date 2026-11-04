Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F24606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g8quZ4bV;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ZSXPcTro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m7rHPBwaK2QnFjTfM9iOAm57zKhbpBduzc8crhMuhp8=; b=g8quZ4bVASRfFl
	/Lb7wL4wgDwks++7LT/2Hu2t66XuDGk7Ntj2EkMyzyYlAFhJsqY0GkFcgleDp+u8U99o17zvsYw8D
	Wq1qW6QOJMEndERLVe7tOzpNYR4tCwXhTFH5mtdS4pib4No04nyQ4zTxmL+GCgQ6bqXf8ICMvNn3w
	g/4vfuhv08ZQa4pjA12VAp3igXPKmlhXrDEybrBS21xmjDo0SBIulCYey16irNWRxAn9GzBIEfq3g
	aU2bfqBn/UaQOhUEMdt/Jy8M7Rf/0KaHaQyzVD+dSFi5fpt5hi0AaU1/dDHCp9nWBR5NYEPNJ9tM8
	f2hxRkIljSGSzq88KmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgCu-00000006V6v-27iO;
	Wed, 04 Nov 2026 18:59:36 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgCs-00000006V58-05p1;
	Wed, 04 Nov 2026 18:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793818771; x=1794077971;
	bh=m7rHPBwaK2QnFjTfM9iOAm57zKhbpBduzc8crhMuhp8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZSXPcTrojU0nKPQ7wcqHAeV2ZoLT12SqXlgU//5hc5rMpnCKKFRMAFllbrCF3LYKP
	 domxctA98X0SMSPXMMr+ueDPRlpjGteXvhusWkTNx0BQdCrF6z0OIYSHy19BKbo2/n
	 4WY32gq8Bt6OFUNVd0afx9nmUf9ghE7koNV5hU0DZFZUuWkzDKTxb276tKL/9kpUXl
	 p1Uj1O6l6Phlho0PoqcNnU5Fw/tlyKRcIU7IgmLrpWA92LNgFS66GvgLwMZ8E1Wxk+
	 nhise5dBgYi7BLOHE5EeVKAq9r/0xzkf84V/k+3nRBX8Nm/TfF9eGcuzipcZkIJ3Se
	 mgZ8pcy0DVPyw==
Date: Wed, 04 Nov 2026 18:59:25 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com, justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v9 11/13] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Message-ID: <F0G_dANYlJ1-UIb2SYBfD3M-Lf0LDESQ3_gls5cGALE1EXYHhZXJHfAibDIjbFR9Rc_rfmce8tk8vBoevtJ94X3inG6HVIVzzBBtWCyPTW0=@protonmail.com>
In-Reply-To: <20260916110825.102631-12-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com> <20260916110825.102631-12-angelogioacchino.delregno@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 72767cc76342ad316c8bf2f0e9abda7edd262961
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105934_219691_4BBDAC80 
X-CRM114-Status: GOOD (  14.39  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wednesday, September 16th, 2026 at 2:09 PM, AngeloGioacchino Del Regno <=
angelogioacchino.delregno@collabora.com> wrote:

> Enable PM Runtime at the end of mtk_dsi_probe() so that the
> mediatek-drm mtk_ddp_comp_power_on() function is able to do
> pm_runtime_resume_and_get() and, analogously, the function
> mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
> device.
>=20
> This makes sure that the power domains for the DSI IP are
> turned on and off when necessary.
>=20
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

No regressions on mt6595 or mt6768 platform.

Tested-by: Roman Vivchar <rva333@protonmail.com> # mt6595, mt6768

Best regards,
Roman

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 3b33419aee2d..4863d910511e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1735,6 +1735,10 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>  =09if (ret)
>  =09=09return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n=
");
>=20
> +=09ret =3D devm_pm_runtime_enable(dev);
> +=09if (ret)
> +=09=09return ret;
> +
>  =09ret =3D mipi_dsi_host_register(&dsi->host);
>  =09if (ret < 0)
>  =09=09return dev_err_probe(dev, ret, "Failed to register DSI host\n");
> --
> 2.55.0
>=20
>=20
> 

