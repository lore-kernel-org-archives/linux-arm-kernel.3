Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFF5C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTwyAcmmwfP6+HY9ca4ejBuxhsbqDgDNfhSKxTLRk78=; b=qWU2toNR+K+mDOFRMtOGiNNxlg
	WaRdY1zUdnGssODBVUV/Ks9yRDTtZruJL1mWje9X+Zq7PfbcGHZPO10EOobem8/ZocebcfR5XYrQ9
	DH4086DJbKV2+ElhDy6SNg7O4ILP3zNcKsKLUx9x27zFkQz6lq7kXYotK2wxfHACtFISkv2ENJ4kr
	NqSDNNl0Y5U2wIRWuhKAzFPxH42Fh+zKYa9/MNa5CBphIllX8mZGrpLyKBNAux8N1v2qmVYKp0DYM
	BfRTpQMWaqjkaoR6Zy+/XEVjjkT+Z4uxTNjr+8l9+aaHHaW4vAuD6aX4Axdeou+Gg7yKjV5WLYlhB
	zJNUkyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7Kr-00000001Ffs-2lGL;
	Thu, 20 Feb 2025 14:15:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7FS-00000001EBn-4BIU;
	Thu, 20 Feb 2025 14:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2CE25C5CD4;
	Thu, 20 Feb 2025 14:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A04AC4CEE3;
	Thu, 20 Feb 2025 14:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740060593;
	bh=x9CYPp92qt7nrQ8n1R6hogiZ3ztLUyzp5dk9F+0pnAE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HiWxuCynedPnTLyt9VduRt3IIwD1IfgC1Cnl08Vn2y0UtKvqjmxX7ucBMSN8sRzkA
	 8XEK6trVBftYiqPjsDxU5Hn3rX7tZ/WsbN0JNuKQY5BGUFikvybXRtAwPvTXNeZthT
	 jYhAR5N91dXRWNGvY9vysE7EvcsmJGMzS6hY2YMuCJvdbTFarAu4H0Urq2WE/H+pdb
	 ttRKIzKxjpjfOKtPFZ5DTBfbWISx/puz4crnoNVq+KTT5C3eZnD2ud8w1YZ73edmHz
	 pLq9FhUZ4cxQfGqaKPph2YRru4cADZYuseTSZf3/ZjDXAh+k39ze+ZqVL0TBXzoMkf
	 wWS15/BieXUeg==
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fcce9bb0ecso1726269a91.3;
        Thu, 20 Feb 2025 06:09:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCNl26ubm7LEqC26ozYc6V3RzCOxHapyMdj0iHWufWWWvqUwxggG8+364fLD3jjhNK6CArzrG1Z1HiqW9qrU8=@lists.infradead.org, AJvYcCXeZCq5TwFEEFXOFeEDV5i0yHBrVaP9dRzl17q02xouz5PJvWzJARK0PeEHeRlzZ8M+3bjNUH98hjc8/lc5QO1P@lists.infradead.org
X-Gm-Message-State: AOJu0YxD7290IaFDdCueeiUPQbqQCDKwfFLbpuubmoe5e3pwfnp4BLga
	9FicfLZ/lxUoBOtc9q2z67KTrOIgy4hxpAA6wGd0ZfvzfrRks8c8CrJbX9a3B0Z9U389Qk9Xo9H
	LK5UmgH6NdmN46LIPuD+vaply4g==
X-Google-Smtp-Source: AGHT+IE0v84Qb6FC/gDtH8xNJeXoFkB/nAfUjSnTsVJesFFxd/imMIypRaefBomgcHEC0WrtRHoFrNT9UaSnKPKXvqk=
X-Received: by 2002:a17:90b:4c07:b0:2ee:b8ac:73b0 with SMTP id
 98e67ed59e1d1-2fc40d1245fmr35061143a91.2.1740060593030; Thu, 20 Feb 2025
 06:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-30-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-30-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:10:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9U4gNASfdiF=B-5+er0qs+F7V=gO1RwjuXw7FagMiUwA@mail.gmail.com>
X-Gm-Features: AWEUYZkEgaHMKjmDQHz4a-_W0aseAk_FLY9Y1EUWnfNXr-s5564_MkXpbtF3WgU
Message-ID: <CAAOTY_9U4gNASfdiF=B-5+er0qs+F7V=gO1RwjuXw7FagMiUwA@mail.gmail.com>
Subject: Re: [PATCH v7 29/43] drm/mediatek: mtk_hdmi: Use devm managed version
 of drm_bridge_add
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
	jason-jh.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_060955_120023_92F2EFA6 
X-CRM114-Status: GOOD (  15.93  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Simplify the probe/remove functions by using devm_drm_bridge_add()
> as now there is no more need to manually remove the bridge.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index e79ebed21eab..f539472307e2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1674,14 +1674,15 @@ static int mtk_hdmi_probe(struct platform_device =
*pdev)
>         hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>         hdmi->bridge.vendor =3D "MediaTek";
>         hdmi->bridge.product =3D "On-Chip HDMI";
> -       drm_bridge_add(&hdmi->bridge);
> +
> +       ret =3D devm_drm_bridge_add(dev, &hdmi->bridge);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to add bridge\n");
>
>         ret =3D mtk_hdmi_clk_enable_audio(hdmi);
> -       if (ret) {
> -               drm_bridge_remove(&hdmi->bridge);
> +       if (ret)
>                 return dev_err_probe(dev, ret,
>                                      "Failed to enable audio clocks\n");
> -       }
>
>         return 0;
>  }
> @@ -1690,7 +1691,6 @@ static void mtk_hdmi_remove(struct platform_device =
*pdev)
>  {
>         struct mtk_hdmi *hdmi =3D platform_get_drvdata(pdev);
>
> -       drm_bridge_remove(&hdmi->bridge);
>         mtk_hdmi_clk_disable_audio(hdmi);
>  }
>
> --
> 2.48.1
>

