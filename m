Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DA5C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 23:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BcdL7DCGU07TDd/5iPyYkuFOyY06VDEoEYPaFNx7yE=; b=2CllwwjAxfmltUGRzBh/nJkuXo
	HimJWQtRuZ96a93HziJwoCL9LU4ZYrB2mCUjlv1VG1vg+u7/LIUiSsV/R5vFcvOUhmSEAgdxMImtt
	RDt0R/F9I74XdbMLzAefJ5H1u9yIjRuQUCWvhUUCpumILf8ASWjXWQ72OG4vXtNllPvAEcLnOV+z8
	7ntyoEH9vd1Ak20m5ktA6EWIFSkvJlXXSB8zzIpma1Sl/yAN/YiUaDD44Ino37k5h013YkL1CwlSS
	WQW3q6vhYMFoK0iQo7WGYNskvBgUnecRTbhb0i2mfBTIvBqK1KlC6wC56ZlBxgkQWbD8CH6LE5e63
	QV5E2OPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtbY-0000000F1l2-45S8;
	Fri, 16 Jan 2026 23:51:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtbY-0000000F1kq-0Rsr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 23:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4679060160
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 23:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDCAC19421
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 23:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768607507;
	bh=78HHIyQq6HtcRgDAUe6py2URYh8Ya0TVMzsC4zKJWow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SzmPgWNCCsSi+phi8oxPp+adInnEOL/OLW4XQhPqwhoXz6xKVBvhz0ese2ODer8B6
	 g3D0HwWT2sYYrcj8RHHNiV4EDQHJFQ7n1JcTdAgFyqC2T6QpvlwlRRzm9AU2Hr1jf+
	 koOKF3F9wNrg65Hj2JxU74WIflgDOHxK6Oi98v1/VZddVbbsbstDmGGAsPlg2U6vnj
	 99uD9Xv1iw3PWoisBqOOVGIAv8433IPvBvliG7i/5yCeLHu8Co1aL0InU+uMl/xnv4
	 e04jYDtyDUnIoS23DVnh21Vvo5a7xNu5+uxkET9+KRIaGQpa+tBbWRXn/po+Vtl9rt
	 zL8e+k45fOJ6g==
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-123320591a4so2668079c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 15:51:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwn067MP295K+rDLLNHP0wD/PkDw30Pq6kl+mZN2cRo9ee45QqsR2+iXJOpdYYMlyBtL03ld4E0Ta7xrneblGz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc4H5iPJ3TBVHnxj33As5qekoKkHcvSa0yNtlfrBmyl0nVQuim
	7Umd8xqW2cEjpiiTtn5+aiaX1GoUV22tRNGMhg4GYv89HHSISYQzJzU5e/htr3PaZdloSSnObv5
	PQBuGs33DiDoqenA3WnN1S69kWl12vQ==
X-Received: by 2002:a05:7022:2394:b0:122:8d:3680 with SMTP id
 a92af1059eb24-1244a78c9e4mr3776921c88.40.1768607506346; Fri, 16 Jan 2026
 15:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 16 Jan 2026 23:51:34 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8roBx1nPqvaon6F-ittiotJfi_aZu-1jgwHZVbQ_uh0A@mail.gmail.com>
X-Gm-Features: AZwV_Qi3iCIeuX-2hrfld-Xfuvsl-3MOiLUpbyuk08dDI1xKsK1Z_v1DM9NSnaE
Message-ID: <CAAOTY_8roBx1nPqvaon6F-ittiotJfi_aZu-1jgwHZVbQ_uh0A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS) mode
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, bisson.gary@gmail.com, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
2026=E5=B9=B41=E6=9C=888=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:20=
=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Up until now, the MediaTek DSI Controller has always been working
> in Low Power Mode (LPM), as this driver has always ignored the
> MIPI_DSI_MSG_USE_LPM flag hence never setting HS mode.
>
> In the current state of the driver the only thing that is needed
> to add support for DSI High Speed (HS) transmit is to simply set
> the "HSTX" config bit in the configuration register.
>
> Check if flag MIPI_DSI_MSG_USE_LPM is set and, if not, set HSTX.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index e4953d5cb6a8..a90cae9512c5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -155,6 +155,7 @@
>  #define SHORT_PACKET                   0
>  #define LONG_PACKET                    2
>  #define BTA                            BIT(2)
> +#define HSTX                           BIT(3)
>  #define DATA_ID                                GENMASK(15, 8)
>  #define DATA_0                         GENMASK(23, 16)
>  #define DATA_1                         GENMASK(31, 24)
> @@ -1177,6 +1178,9 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const=
 struct mipi_dsi_msg *msg)
>         else
>                 config =3D (msg->tx_len > 2) ? LONG_PACKET : SHORT_PACKET=
;
>
> +       if (!(msg->flags & MIPI_DSI_MSG_USE_LPM))
> +               config |=3D HSTX;
> +
>         if (msg->tx_len > 2) {
>                 cmdq_size =3D 1 + (msg->tx_len + 3) / 4;
>                 cmdq_off =3D 4;
> --
> 2.52.0
>

