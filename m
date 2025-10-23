Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C353FCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 17:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doFq+KAPnF9d8vUlzJpsUFF/6nlCw0llWQ17gnq+SwA=; b=eNEFHkfgRHJb2WO3QKtkpkvjpw
	q54MlnZ0mxTfv89KkL720bPc9nPT9yrUR5CXKrSFuHncAKdBVrekui8jt4/zbOPtP+A0Xl8aOy65h
	GWOI+9jcQ4Azu0Wb+qLahNl9zt9sqa/I4sUcN5nkX2/ligBt9MgaUOEzDoFX85+wZwSO59Ljd/xrB
	RuoPEm31jZ7UJ+cuYZhQ4ZSxdkUp6YbFJzXGLad8tGqgOLsXe8Zv5t/wOyduLuiuTHB7Gws2Elm7Q
	KN0YsPWWaIbWfQGhD5TA7wzKfilmFoli/uvbtgh6eGelaqtzt1m+M8s+S1QYZi5Wzr9fPZAyoy3bl
	vJPQBy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByl9-000000071wi-24kf;
	Thu, 23 Oct 2025 17:05:55 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByl7-000000071vs-1tDS;
	Thu, 23 Oct 2025 17:05:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761239142; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B73QoxPD3VyOxVdGEzFNxx59VdD+bX0v1/HUGhLYrWLrFOgQ5ucBpwXQCqSCnEacfznyeTAfH4QIp8hdSsHjcy0PDEUcnWgSNc9ZZlp8LJNg14p5A7kGzUAn3ODpUds3CDkESMSTafr0f/s9D4PeDwNFgS03Yqtyq06aS8OLIGM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761239142; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=doFq+KAPnF9d8vUlzJpsUFF/6nlCw0llWQ17gnq+SwA=; 
	b=C3Q3x17n5XrkRG4x7NWK36I+iDh6Tp9rYuqniXPmTfrEBN526Gnv5WNheXYCG0Trr3MdU70V7tqHxx2dex+bVvR++6UrKxCjx/Yaj3UdX+28OGoyBikX5tIl0+IMXipTiqAI/moBXii2VdLQogLHNMF5uxz7GnPKfyc9HBatRhc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761239142;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=doFq+KAPnF9d8vUlzJpsUFF/6nlCw0llWQ17gnq+SwA=;
	b=lAoy7FAGFwNhyfn8q8DeaQz6wgUwvIOG+GI4W2e5sEcs6GV7TO/WaswT0eYu67U/
	iZofSecg8lI+fn71L/TNJqerqjtkM7YGK/PU0XFE2KBloBjLExACJYigstlxCHOJSVw
	0JalTZYeb1cIS5h5/Vfu4mHIb49MxND8bEUzTux8=
Received: by mx.zohomail.com with SMTPS id 1761239140304964.1024061848422;
	Thu, 23 Oct 2025 10:05:40 -0700 (PDT)
Message-ID: <a55c9480da785a8618dd60c3f3e0ddc398c5d45f.camel@collabora.com>
Subject: Re: [PATCH v11 05/11] drm/mediatek: mtk_hdmi_common: Make CEC
 support optional
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Oct 2025 19:05:31 +0200
In-Reply-To: <CAAOTY_8y6C5=jSjzBVVJ2vJq1L+Nf9U0tZvxzVX-e-3g91xEeQ@mail.gmail.com>
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
	 <20251023-mediatek-drm-hdmi-v2-v11-5-7873ec4a1edf@collabora.com>
	 <CAAOTY_8y6C5=jSjzBVVJ2vJq1L+Nf9U0tZvxzVX-e-3g91xEeQ@mail.gmail.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_100553_569760_1126913A 
X-CRM114-Status: GOOD (  33.47  )
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

On Thu, 2025-10-23 at 15:59 +0000, Chun-Kuang Hu wrote:
> Hi, Louis:
>=20
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=
=B9=B410=E6=9C=8823=E6=97=A5
> =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:32=E5=AF=AB=E9=81=93=EF=BC=9A
> >=20
> > From: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> >=20
> > In preparation for adding a new driver for HDMIv2, for which CEC
> > is not strictly required, change the of_get_compatible_child()
> > failure error to -ENOTSUPP to be able to differentiate between
> > error conditions in mtk_hdmi_dt_parse_pdata().
> >=20
> > In that case, if -ENOTSUPP is returned, this driver will print
> > an informative message saying that CEC support is unavailable,
> > as the devicetree node for that was not found, but after that,
> > function mtk_hdmi_dt_parse_pdata() will not return error to
> > the caller.
> >=20
> > This will not change functionality of the mtk_hdmi (v1) driver
> > as that is still checking whether CEC is present and, if not,
> > will fail probing with an error saying that CEC is required
> > by HDMIv1.
> >=20
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > Signed-off-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
> > ---
> > =C2=A0drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 9 +++++----
> > =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > index
> > f28e63716d7c2e2c6bdf5b28d24789bc926d2beb..989479fdfe40952762a1b6379
> > 7bf602b520dcac5 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > @@ -253,12 +253,11 @@ static int mtk_hdmi_get_cec_dev(struct
> > mtk_hdmi *hdmi, struct device *dev, struc
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The CEC module handles HD=
MI hotplug detection */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cec_np =3D of_get_compatible=
_child(np->parent,
> > "mediatek,mt8173-cec");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!cec_np)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return dev_err_probe(dev, -EINVAL, "Failed to find
> > CEC node\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return dev_err_probe(dev, -ENOTSUPP, "Failed to
> > find CEC node\n");
>=20
> The checkpatch show the warning:
>=20
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> #40: FILE: drivers/gpu/drm/mediatek/mtk_hdmi_common.c:256:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(dev, -EN=
OTSUPP, "Failed to find CEC
> node\n");
>=20
> I find many driver use ENOTSUPP, so I'm not sure which one is better.
> I really don't understand the description about these two error code
> [1].
> If you choose ENOTSUPP, please give me some explain.
>=20
> [1] https://man7.org/linux/man-pages/man3/errno.3.html
>=20
> Regards,
> Chun-Kuang.
>=20
>=20
I think ENOTSUPP can be replaced by EOPNOTSUPP in this patch safely.

There is only a single call of the mtk_hdmi_get_cec_dev function in the
driver and the code that checks this particular return code value in
mtk_hdmi_dt_parse_pdata function is also added by this patch.

I also don't see no other occurrence of ENOTSUPP code in mediatek-drm
and since checkpatch recommends to prefer EOPNOTSUPP over ENOTSUPP,
let's replace it in this patch (both code and commit message).

Do you want me to send a new version of the series for this change?

Regards,
Louis-Alexis=20

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cec_pdev =3D of_find_device_=
by_node(cec_np);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!cec_pdev) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cec_np);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
> > cec_np);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 of_node_put(cec_np);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -EPROBE_DEFER;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > @@ -319,7 +318,9 @@ static int mtk_hdmi_dt_parse_pdata(struct
> > mtk_hdmi *hdmi, struct platform_device
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(dev, -EINVAL, "Failed to get
> > ddc i2c adapter by node\n");
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D mtk_hdmi_get_cec_dev=
(hdmi, dev, np);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret =3D=3D -ENOTSUPP)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dev_info(dev, "CEC support unavailable: node not
> > found\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (ret)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return ret;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> >=20
> > --
> > 2.51.0
> >=20

