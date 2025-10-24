Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3317CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 00:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQoOeht7Ir4hDBOcXFiAbholVM++bOG7rSpyYqbWgJ4=; b=uCj8YavbDRxn0JKanxYv5d8YPq
	mEpFpM7UEq6PYacFIL3xUjIz6NvDUO/rw8LODv0VpEwh5DIAxnhA2k/w+xEkt+JijAcexBdIM43o1
	LkqCMlaqzk9Z6FIx7y62RyirXohWcb+K3lQOp8Icsu+xBm2PrUBjETBozmSn/xE4GNErfM5YdKoPc
	oM5ugFBi1PUk4RmRGj4Fy/zELNXv6ec8aZzc5H33Ja1tYDxHAHncAm/IBAFq8KEFBL8eq8nCMY/hm
	y4Fc4uW5bahjqRwJ/lhXlywxOKcX4iaWT+jrYaMkhQ6wQTDR0aqc9rlRlqp4qttN3tD6D9IMSpnrB
	wH/Wgo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5mT-00000007ua5-1R07;
	Fri, 24 Oct 2025 00:35:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5mR-00000007uZM-0vPH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 00:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3D1A43A39
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 00:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E15C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 00:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761266141;
	bh=PTncCyO74ELUzyL0VC+KcHhY+qg3bMKHZCe+2nsn7iQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TdK0/KmNrgyWVCC27KyJwSHPZZa+jFMqWuZj+N4Rjn152Dz+re35uvnY7iS2MKz9u
	 vsyNjaKJvtKx4tKhu10jPTlspdVkoLxKIC6PvacZS9uKtal5K2DLPBRpGkZXL7CLOr
	 A0lZddreh1sy7vq4PJNfbbcbD0YV5VrjAVGPfpA0RTL3XwT20jzyhbfVdRlUJ2QVkL
	 7KnSR/3DF+VyNgyAMPHXDgpn51O1/BfzSc1FEsGhEK01PLCuxISfN2GclfH2Qgr+fs
	 tZ1h1sOQpb+MoLK5u3f4PRg9M46cLGDiy73SLeEJy9DaP/vWkbKlXGZpjfKzZBbGfy
	 yenN2513oRR6w==
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b6cf30e5bbcso1034187a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 17:35:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSY+v4AlFGBTU4MjFIMdwD0Ymxnd+WZcewYQ03levHanjOm4h9QmB+3N0Ndlcl/56rg0knZVBQQOqABmBEa2wL@lists.infradead.org
X-Gm-Message-State: AOJu0YyQMbPMN+ru3RixKUYpi1wyxoN7JJoTh5VDGko5CNAZMMfmT79B
	2HBqVTMlT6tutz1eDWSX7j+BGCDcu3rH4ljE/gIBsN+zCOkehab9pvFB1kkgoXjWULGiTdaZ8LF
	tHP9TV8sjHOmQC+E5neChbONg9sPnsQ==
X-Google-Smtp-Source: AGHT+IGOMKLHi0CZOHqSh5IjaE+DgAa5Vkrkmi7gYN42ujUfgl+FvecwlSbnjr8WAwwoIN6a4Crw3ctvyAP+BawLEjM=
X-Received: by 2002:a17:902:f712:b0:26b:3cb5:a906 with SMTP id
 d9443c01a7336-29489e109b9mr8169415ad.16.1761266141410; Thu, 23 Oct 2025
 17:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
 <20251023-mediatek-drm-hdmi-v2-v11-5-7873ec4a1edf@collabora.com>
 <CAAOTY_8y6C5=jSjzBVVJ2vJq1L+Nf9U0tZvxzVX-e-3g91xEeQ@mail.gmail.com> <a55c9480da785a8618dd60c3f3e0ddc398c5d45f.camel@collabora.com>
In-Reply-To: <a55c9480da785a8618dd60c3f3e0ddc398c5d45f.camel@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 24 Oct 2025 00:35:29 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-f89vzGXzb_xRgpmx050tVM2+Ud6afR5iNycTROSmcYw@mail.gmail.com>
X-Gm-Features: AS18NWCs-ZOjPVHuitqceUJYqSJStFRyUNsop7HMJ8Io7hasX41agsqyg9N4J9c
Message-ID: <CAAOTY_-f89vzGXzb_xRgpmx050tVM2+Ud6afR5iNycTROSmcYw@mail.gmail.com>
Subject: Re: [PATCH v11 05/11] drm/mediatek: mtk_hdmi_common: Make CEC support optional
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_173543_290538_C0AAD4AA 
X-CRM114-Status: GOOD (  41.36  )
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

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B410=E6=9C=8823=E6=97=A5
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Thu, 2025-10-23 at 15:59 +0000, Chun-Kuang Hu wrote:
> > Hi, Louis:
> >
> > Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=
=E5=B9=B410=E6=9C=8823=E6=97=A5
> > =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:32=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > From: AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com>
> > >
> > > In preparation for adding a new driver for HDMIv2, for which CEC
> > > is not strictly required, change the of_get_compatible_child()
> > > failure error to -ENOTSUPP to be able to differentiate between
> > > error conditions in mtk_hdmi_dt_parse_pdata().
> > >
> > > In that case, if -ENOTSUPP is returned, this driver will print
> > > an informative message saying that CEC support is unavailable,
> > > as the devicetree node for that was not found, but after that,
> > > function mtk_hdmi_dt_parse_pdata() will not return error to
> > > the caller.
> > >
> > > This will not change functionality of the mtk_hdmi (v1) driver
> > > as that is still checking whether CEC is present and, if not,
> > > will fail probing with an error saying that CEC is required
> > > by HDMIv1.
> > >
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > Signed-off-by: AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com>
> > > Signed-off-by: Louis-Alexis Eyraud
> > > <louisalexis.eyraud@collabora.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > > b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > > index
> > > f28e63716d7c2e2c6bdf5b28d24789bc926d2beb..989479fdfe40952762a1b6379
> > > 7bf602b520dcac5 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > > @@ -253,12 +253,11 @@ static int mtk_hdmi_get_cec_dev(struct
> > > mtk_hdmi *hdmi, struct device *dev, struc
> > >         /* The CEC module handles HDMI hotplug detection */
> > >         cec_np =3D of_get_compatible_child(np->parent,
> > > "mediatek,mt8173-cec");
> > >         if (!cec_np)
> > > -               return dev_err_probe(dev, -EINVAL, "Failed to find
> > > CEC node\n");
> > > +               return dev_err_probe(dev, -ENOTSUPP, "Failed to
> > > find CEC node\n");
> >
> > The checkpatch show the warning:
> >
> > WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> > #40: FILE: drivers/gpu/drm/mediatek/mtk_hdmi_common.c:256:
> > +        return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC
> > node\n");
> >
> > I find many driver use ENOTSUPP, so I'm not sure which one is better.
> > I really don't understand the description about these two error code
> > [1].
> > If you choose ENOTSUPP, please give me some explain.
> >
> > [1] https://man7.org/linux/man-pages/man3/errno.3.html
> >
> > Regards,
> > Chun-Kuang.
> >
> >
> I think ENOTSUPP can be replaced by EOPNOTSUPP in this patch safely.
>
> There is only a single call of the mtk_hdmi_get_cec_dev function in the
> driver and the code that checks this particular return code value in
> mtk_hdmi_dt_parse_pdata function is also added by this patch.
>
> I also don't see no other occurrence of ENOTSUPP code in mediatek-drm
> and since checkpatch recommends to prefer EOPNOTSUPP over ENOTSUPP,
> let's replace it in this patch (both code and commit message).
>
> Do you want me to send a new version of the series for this change?

It's not necessary to send a new version of this series.
I would modify this patch when I apply it.

Regards,
Chun-Kuang.

>
> Regards,
> Louis-Alexis
>
> > >         cec_pdev =3D of_find_device_by_node(cec_np);
> > >         if (!cec_pdev) {
> > > -               dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
> > > -                       cec_np);
> > > +               dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
> > > cec_np);
> > >                 of_node_put(cec_np);
> > >                 return -EPROBE_DEFER;
> > >         }
> > > @@ -319,7 +318,9 @@ static int mtk_hdmi_dt_parse_pdata(struct
> > > mtk_hdmi *hdmi, struct platform_device
> > >                 return dev_err_probe(dev, -EINVAL, "Failed to get
> > > ddc i2c adapter by node\n");
> > >
> > >         ret =3D mtk_hdmi_get_cec_dev(hdmi, dev, np);
> > > -       if (ret)
> > > +       if (ret =3D=3D -ENOTSUPP)
> > > +               dev_info(dev, "CEC support unavailable: node not
> > > found\n");
> > > +       else if (ret)
> > >                 return ret;
> > >
> > >         return 0;
> > >
> > > --
> > > 2.51.0
> > >

