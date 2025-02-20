Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B54BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmKPFSbPJ5WoKs6gi+7FSv/KQmaSdQEKbDBEKB0rK4A=; b=mw0ZF6wOE/GyD5WAv9t1eKztYh
	pk4aLXSsKbcslWMyYDz7QXFb+CV2LtAxJDRTMDDBY8dP8X6Z5fkYLnEKrZQEejiOZMyh6EpWx6qWb
	9NBsc+VEPJvlo9YQVhDNshTbHXCzEW5O2za5/f1TDGV9VXwueWXtrjlWNfC3zVjpVrdXEeNq9BSGP
	XC5nQsqYXXBV7fhj8VoqQlK/+XcgXI6ePMdzNLoNCasZgs1lu7tpDfsb0CnqXmINdi2yBCXKA01qB
	3ab2OKgO0+Vn0wO7JFA5dTqDJS+f557tu6WhZ/A7mMO+arS3UeNVel7hrnxhBOCdij+3yzKMZF69t
	tbHLHsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7PG-00000001Gzj-2lU3;
	Thu, 20 Feb 2025 14:20:02 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7MR-00000001GBj-3Ca2;
	Thu, 20 Feb 2025 14:17:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8323861494;
	Thu, 20 Feb 2025 14:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4E8C4CED1;
	Thu, 20 Feb 2025 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740061026;
	bh=phtVfpAQP2gqJ9uhxpOiCBTEsxgIpvS5igy/qXNkMDI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hmDAx/bL+DtKimxCl9L1Ouu9reCfWS9G4jSWwbwFIt62paGHuLWpefNgpk6rEu9mY
	 xZW4LhwkcMuT7rH1d6qZGTSApMyHQYHP/fpyyRhBvV+DjXvOnUH6GOLoTa2xssxUow
	 bUZuyAFc+GmYnNKCa5ACj4s+NdjMC/QflQ6vupSIK5wqLBtCH250twMfbw5duc4ltw
	 nuH3lqb+ocRpyyMo4xPgz18M58FQS6S7PFLwq7rc/+9gl/OkZgzgl28Ex0gxg+7D7r
	 w0AQgd+dHiiP6+vcctnz/+qeAh4+MirPOfxaOcaZqqEt8BYd1ahdBw9+OYkkuOqrJh
	 5EfRZBi4NQS1A==
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f42992f608so1610844a91.0;
        Thu, 20 Feb 2025 06:17:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOduCGstu9Gj97nHR+2g2kjt+JnO0WU9wq1XrEuZmN6oPwAXSyCMmD2/d/M0WhdO4xRUBrqjyuMHsw2+LnuVLP@lists.infradead.org, AJvYcCUclle6FehYPHyQfzIq3VEYXoBYHpZ/yHRbNTg+F5Tnw8hJO28UsW9EuNfC/wJ8lrGF7TxhnzdREFCK6fRDD9g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwL6f6N6HszkGc7OMFHZzRlXRCxoh8agv1sFoyYmN/YchQdBhFA
	nD3wH3YxdROkqvepBDPlsSDXiE7/kQWyNLPDqOuVH6VSe8ECXv5EVOqiy+wp8nQHHJNT/aKlHP5
	Lu7/oul89wgDNiy05YTwY9ipafA==
X-Google-Smtp-Source: AGHT+IGyx5QWB4rzHyre9LMXoPdg2qp8oLeofiBp2HooA+47pReCBBVwzDOuk8vQdFLX+87Wzj+OpnchkAQUrEFYbI8=
X-Received: by 2002:a17:90b:2e50:b0:2ee:aa28:79aa with SMTP id
 98e67ed59e1d1-2fc40d14ac5mr32787274a91.6.1740061026314; Thu, 20 Feb 2025
 06:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-31-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-31-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:17:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8G36w1KZpfcVPbfZ6RjbAs3=GHdzdnPHZw=4Njnid35A@mail.gmail.com>
X-Gm-Features: AWEUYZn7UqFdQMaggAe3FK4XBZKbvE_M4ZaCHMfj6Eg3FDhoHOMNrpbhRQkeUao
Message-ID: <CAAOTY_8G36w1KZpfcVPbfZ6RjbAs3=GHdzdnPHZw=4Njnid35A@mail.gmail.com>
Subject: Re: [PATCH v7 30/43] drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
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
X-CRM114-CacheID: sfid-20250220_061707_919527_221CD88F 
X-CRM114-Status: GOOD (  17.87  )
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
> Since the SIMPLE_DEV_PM_OPS macro and the pm pointer are anyway
> defined when CONFIG_PM_SLEEP is not set, remove the ifdef for it
> and indicate that the mtk_hdmi_{remove,suspend} functions may be
> unused (as they are, in case PM support is not built-in).
>
> While at it, to improve readability, also compress the
> SIMPLE_DEV_PM_OPS declaration as it even fits in less
> than 80 columns.

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
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index f539472307e2..bf8cf7fc8c07 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1694,8 +1694,7 @@ static void mtk_hdmi_remove(struct platform_device =
*pdev)
>         mtk_hdmi_clk_disable_audio(hdmi);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
> -static int mtk_hdmi_suspend(struct device *dev)
> +static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
>  {
>         struct mtk_hdmi *hdmi =3D dev_get_drvdata(dev);
>
> @@ -1704,7 +1703,7 @@ static int mtk_hdmi_suspend(struct device *dev)
>         return 0;
>  }
>
> -static int mtk_hdmi_resume(struct device *dev)
> +static __maybe_unused int mtk_hdmi_resume(struct device *dev)
>  {
>         struct mtk_hdmi *hdmi =3D dev_get_drvdata(dev);
>         int ret =3D 0;
> @@ -1717,9 +1716,8 @@ static int mtk_hdmi_resume(struct device *dev)
>
>         return 0;
>  }
> -#endif
> -static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
> -                        mtk_hdmi_suspend, mtk_hdmi_resume);
> +
> +static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_res=
ume);
>
>  static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 =3D {
>         .tz_disabled =3D true,
> --
> 2.48.1
>

