Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6F0EE021D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 15:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/twUw2aB8H1ESU7zga+wglunyiP/Oa0QDRW+mO/4gk=; b=kxFdFjap8sEO7U8gH+e4X5pgTo
	xnZRMI08ul5c2nMnmBQFNugqKPatOr10OzLt2kLjJmHdhZ13Aq8tAah7ssPIE0hv5ccEfWjgVYkhD
	MbUnkkhR7kDKUJlmlLbs/j0rpq/D2zSev+h1vVvG+92CkX3ywrvH9qqdfXLhy5k2X/WNQMY11Fvaj
	Ls0oLdYaPLdSlnfrWZtcezMseO4izZPwa2cLfMgWDi3ibx+tKyqMHFs5fAELx+aquYJ7xemSQ2nlC
	1pZ1WPSTkf6hIHZKvJNFSwesMGmjuHIi44/Ly6BUs7pWaNld7H1gCKD8rzi4QImwZj+RYLuNuEUqQ
	DdonO9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabzS-00000005194-2x2C;
	Tue, 30 Dec 2025 15:50:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabzR-0000000518G-1ZFZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 15:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2190D6001D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCF3C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767109826;
	bh=buNYBa+G8qfLlUvBCR4ZFcvapW46f5DYot+jLhw9HoQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uud/8zHKAy9vAmWpvkX9rbSTgMdpfHBrh6WLiprE9pI8hXsuIlJvKVSvybs77Fn8Y
	 sUNNKqabH1O3AAdbTpPpjTZKBZ6V0IebRTaOqL2zluNQBKVnI/KyICHqazM4+tq8Al
	 e7KrJX5C2v4quZN/1/fXqONBGLQD9e5pGrZWWuL4E2yUMn9tgr24TnxY0pGE54iQk3
	 FNmaJE5Xh1NVQAEmCs/Ertn7U8sVHeyHuLWOeql2YdFDe2u0OwNx/yZ5U0KPz8j379
	 t4oJxM3x8CAObxRNyV5UERTf1i+gfTxIHvgPsa8R+JAxSfQDAsS9oaFzAQxP4vVDon
	 lgi7CNLA0cyfA==
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7ba55660769so7819134b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 07:50:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUg26uEIbpRJASm/jXb2XzAzs27KPtiFPGBeKzcEHHvFHUt+yZnFOkDNRYokNzgX8OM7miYe7YV6sm94yjbE41j@lists.infradead.org
X-Gm-Message-State: AOJu0YwwsIJC4sDdNgGf8Os3CgWeK5j7RiyruD3wv7L3HNldNsufn1MH
	RACra+LOHPsVFhcuWZkuP39Kn3jGS4emq8Dzul7f0yE0C0v9l+YsYvnluFvmtAVZdn3YlCKAq5C
	sbz/ymjBUL02O784xIZk7g2sqnaRxFg==
X-Google-Smtp-Source: AGHT+IEZjuJ741PMreIHh9uiPP3hb59AwPjPkgs6EZmokmEJmwSPfCMKsbUmse1x0DIpIk+dUrk59qVP/n9gj5/yiuc=
X-Received: by 2002:a05:7022:b906:b0:11b:d4a8:d244 with SMTP id
 a92af1059eb24-121722ab1e3mr21838218c88.16.1767109826287; Tue, 30 Dec 2025
 07:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20251125-drm-mediatek-hdmi-v2-wifpts-v1-1-a6c7582cf69a@kernel.org>
In-Reply-To: <20251125-drm-mediatek-hdmi-v2-wifpts-v1-1-a6c7582cf69a@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Dec 2025 15:50:13 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-hGe-yWK-iSXDefEPJN9bc8A_r=kNirBAyHgCPhqoAvw@mail.gmail.com>
X-Gm-Features: AQt7F2ole3Zhplk3q7hyGThFScP9pdJnuSD325W6WxvbLpbbWXRXwbGOdauOQ4Q
Message-ID: <CAAOTY_-hGe-yWK-iSXDefEPJN9bc8A_r=kNirBAyHgCPhqoAvw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi_v2: Fix return type of mtk_hdmi_v2_tmds_char_rate_valid()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, linux-kernel@vger.kernel.org
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

Hi, Nathan:

Nathan Chancellor <nathan@kernel.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=8825=
=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:14=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> When building with -Wincompatible-function-pointer-types-strict, a
> warning designed to catch kernel control flow integrity (kCFI) issues at
> build time, there is an instance in the new HDMI v2 drm/mediatek code:
>
>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:1331:31: error: incompatible fun=
ction pointer types initializing 'enum drm_mode_status (*)(const struct drm=
_bridge *, const struct drm_display_mode *, unsigned long long)' with an ex=
pression of type 'int (const struct drm_bridge *, const struct drm_display_=
mode *, unsigned long long)' [-Werror,-Wincompatible-function-pointer-types=
-strict]
>    1331 |         .hdmi_tmds_char_rate_valid =3D mtk_hdmi_v2_hdmi_tmds_ch=
ar_rate_valid,
>         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>
> While 'int' and 'enum drm_mode_status' are ABI compatible, hence no
> regular warning from -Wincompatible-function-pointer-types, the mismatch
> will trigger a kCFI violation when mtk_hdmi_v2_tmds_char_rate_valid() is
> called indirectly.
>
> Update the return type of mtk_hdmi_v2_tmds_char_rate_valid() to be 'enum
> drm_mode_status' to clear up the warning and kCFI violation.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/med=
iatek/mtk_hdmi_v2.c
> index c272e1e74b7d..454b8b93b834 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> @@ -1120,9 +1120,10 @@ static void mtk_hdmi_v2_hpd_disable(struct drm_bri=
dge *bridge)
>         mtk_hdmi_v2_disable(hdmi);
>  }
>
> -static int mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge=
 *bridge,
> -                                                const struct drm_display=
_mode *mode,
> -                                                unsigned long long tmds_=
rate)
> +static enum drm_mode_status
> +mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> +                                     const struct drm_display_mode *mode=
,
> +                                     unsigned long long tmds_rate)
>  {
>         if (mode->clock < MTK_HDMI_V2_CLOCK_MIN)
>                 return MODE_CLOCK_LOW;
>
> ---
> base-commit: a846505a193d7492ad3531e33cacfca31e4bcdd1
> change-id: 20251125-drm-mediatek-hdmi-v2-wifpts-d67b55175609
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>

