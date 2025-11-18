Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E543CED63B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvR4F7oICCpvfv+cfyWVoylAF+pTD7JBlKUOln72bos=; b=Gg+WuImJQsJ8zqUlx+2mWsmwP1
	cAXkAF3ltMlRkIgktbnWKdtIEgpF+03aEqPI6BZ+3xmUnImZZi2Fb7Ow7qes7jcBIjYYgrqoqjJUq
	LlZGr1640S0w201AFMXnF+rMWdycFaUuNHeKwvFZUK/jHwUSqeNL1nP7br3oRvAYYkUotX/gQNLAf
	Hjni9D80lLaUqhjyuo2hpl4wrIC1VVuxcaqA5SoZI2u91dRxFOmJ2k/YbUNWHQju0AuPBBYWus7eL
	FuCqMuYSYytOPPf4X1m8+jr5+Tn4Zz8NToDISpAcKgsBxlMBM8LyLNQUVDYat6Mg/GdXKcXlE6fpP
	NKXFMqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLM6H-00000000ULM-0Bm1;
	Tue, 18 Nov 2025 13:50:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLM69-00000000UHw-0Fp3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:50:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD81340534
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 13:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E12C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763473820;
	bh=rZN0IQenPgdJTxvH2ZMIbHtQc8Q8fpFwqgB1ZfTEqYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H2yHbif8z+en/wea/E6biwnhVAAeLfkDqi7+9u+vSZjZtXBr+fX9yeQh6EjcDhUfq
	 0u+oDLib5XCTHez+5KPmkmBFEOrLPNJGU5+wVHH1txakE7Gy0IWrOyHqBLpUmP3KtL
	 PcIs4pzWC2/7pu9th9lnSHAX2zXINrH8INZDZ/LdT5XZK72LONJ9tiviHEXlYoodZK
	 ARjUudcs8lNG1NKECutLcqkGCqI31ILnV/VPVejQie2sPx6xhtYcCgtdWOml4ldteC
	 Qzyi8rWb4ISIy9S5GuDB7dG1JZTHysASEYcCcXiC1So55g5o1ECGTAceFUU/2VKOZP
	 cf/j+1UBCRqNw==
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7ba92341f83so1652861b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:50:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcUfKtsQ3KHJnDcRU8ma60tlBEIj7PztL2Ub9QcPgby39I9pnqU0dxDzBTp3mkqGDulzhmBIovfSwFQ6Ef8sVl@lists.infradead.org
X-Gm-Message-State: AOJu0YyOebv8hf5RJq51Md14eeElWCdNkEb4ENgL4LwiMG+MkD/4OrPi
	QY+PE02mdajz+j2kkkLeALmKejTw1Yfaqv+t2zyMALarkBojLBvirb8IqBFwVyb0aAMwJ8HTWjv
	LNk4DNo5EXgY+qUD42XiUlyF9o0I5kg==
X-Google-Smtp-Source: AGHT+IE5Z2MpRyC9oab0WJaiNyBW3hN6XFa3Rzhz8UyPsuoc9Pa2UFnVnNAcowlT5BeYTRlFBG3gB1aTEHHdsdqc3w8=
X-Received: by 2002:a05:7022:3c0d:b0:11b:8278:9f3a with SMTP id
 a92af1059eb24-11b82789fd2mr4151535c88.8.1763473819071; Tue, 18 Nov 2025
 05:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20250921055416.25588-1-jay.liu@mediatek.com> <20250921055416.25588-2-jay.liu@mediatek.com>
In-Reply-To: <20250921055416.25588-2-jay.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 18 Nov 2025 13:50:05 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8awo9B857BRdgNoh_350VHa8eTaxh0ALWbT287ZNstAw@mail.gmail.com>
X-Gm-Features: AWmQ_blmZtT5uXUtSPveVBwvv-qvjHpM1nxw_RCICsWDHLjgGSlWLYcocIHO-_w
Message-ID: <CAAOTY_8awo9B857BRdgNoh_350VHa8eTaxh0ALWbT287ZNstAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n
 function issue
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055021_141766_A885B374 
X-CRM114-Status: GOOD (  20.75  )
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

Hi, Jay:

Jay Liu <jay.liu@mediatek.com> =E6=96=BC 2025=E5=B9=B49=E6=9C=8821=E6=97=A5=
 =E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=885:55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> if matrixbit is 11,
> The range of color matrix is from 0 to (BIT(12) - 1).
> Values from 0 to (BIT(11) - 1) represent positive numbers,
> values from BIT(11) to (BIT(12) - 1) represent negative numbers.
> For example, -1 need converted to 8191.
> so convert S31.32 to HW Q2.11 format by drm_color_ctm_s31_32_to_qm_n,
> and set int_bits to 2.
>
> Fixes: 738ed4156fba ("drm/mediatek: Add matrix_bits private data for ccor=
r")
> Change-Id: Icb2aae1dee21d9ea34f263a54850fee26d97d455

With some fixed up, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 26 +++--------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/=
mediatek/mtk_disp_ccorr.c
> index 10d60d2c2a56..634b31346921 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -80,28 +80,7 @@ void mtk_ccorr_stop(struct device *dev)
>         writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
>  }
>
> -/* Converts a DRM S31.32 value to the HW S1.n format. */
> -static u16 mtk_ctm_s31_32_to_s1_n(u64 in, u32 n)
> -{
> -       u16 r;
> -
> -       /* Sign bit. */
> -       r =3D in & BIT_ULL(63) ? BIT(n + 1) : 0;
> -
> -       if ((in & GENMASK_ULL(62, 33)) > 0) {
> -               /* identity value 0x100000000 -> 0x400(mt8183), */
> -               /* identity value 0x100000000 -> 0x800(mt8192), */
> -               /* if bigger this, set it to max 0x7ff. */
> -               r |=3D GENMASK(n, 0);
> -       } else {
> -               /* take the n+1 most important bits. */
> -               r |=3D (in >> (32 - n)) & GENMASK(n, 0);
> -       }
> -
> -       return r;
> -}
> -
> -void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
> +bool mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  {
>         struct mtk_disp_ccorr *ccorr =3D dev_get_drvdata(dev);
>         struct drm_property_blob *blob =3D state->ctm;
> @@ -109,6 +88,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_=
crtc_state *state)
>         const u64 *input;
>         uint16_t coeffs[9] =3D { 0 };
>         int i;
> +       int int_bits =3D 2;
>         struct cmdq_pkt *cmdq_pkt =3D NULL;
>         u32 matrix_bits =3D ccorr->data->matrix_bits;
>
> @@ -119,7 +99,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_=
crtc_state *state)
>         input =3D ctm->matrix;
>
>         for (i =3D 0; i < ARRAY_SIZE(coeffs); i++)
> -               coeffs[i] =3D mtk_ctm_s31_32_to_s1_n(input[i], matrix_bit=
s);
> +               coeffs[i] =3D drm_color_ctm_s31_32_to_qm_n(input[i], int_=
bits, matrix_bits);
>
>         mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
>                       &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
> --
> 2.46.0
>

