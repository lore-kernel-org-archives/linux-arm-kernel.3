Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEBBFC72BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAbWnxIRmyGo8szUrrG8yO3fuJqO9CKgMiT69K+FeGg=; b=NTIMfr6TmjHHxLblgdyWceF/5A
	/sloIDWi2sUbRn0myj/+JBN7Z8KdlQgVC4q20K203KniZs7IeoezSlx/mAOgjY8NP5Iv6dn2F4nKm
	JVjhuVuir4nhBhZkIBlogZFWS1t8N4ijGiT7q62KJIw98Qx3RTRgyZSMWmbo7RUgCbSbSPS8SFfXs
	wnJh3ninOrKSyvBrcoFJu7gEVpDByUZfVgN3eb/tYwmePPBPFPxFbdfjzD9DKLRXWsbxCjCdPtMn8
	0x5bc33HyAYdwm2FA4Zezq5pRUSXGMt0zk8AMZmJdkEs0omBMESxqTYm3sPYQIHJGEqnkDO4FN8sj
	bK8mIisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4IEb-0000000FKUG-0IP7;
	Sun, 22 Mar 2026 12:48:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4IEY-0000000FKT7-49se
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 12:48:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9B9242DB4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 12:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC86AC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774183724;
	bh=+DtQACtjWQV/63LCvj8FhHvvOYsYlPtKyxT/kV73eXo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KEazxW4pdXQkm5fA4QYCeDVSQSUyoQbVBgva9d+VcWoLuR9yLkrFgiIhiTK8/5izU
	 xpL4MQ7tWsi8tRzw9F/F9gA8dp7XDjLuuZi8mieg79pIeyky1vDyRP43ZmUzY0Zqrf
	 n4LzlNcyy9i+oSoov4HVmLXKGhyCuA1UNLZL7sqjif7dQg8NeV54UgQnMd0+xGPiZG
	 MjJ4kqhungFGye5yRLw0y3Tkd7kJgZXugDeITeHcDwOlnv0G42mtI8p34X5jY7vZqa
	 pfQV2o/zLJcm9chzDBlcazV1OSFbbCVsrZ1j6PdwcqeyRi9e+1VXPsekAqDF8vPY6q
	 EjM8ivRtQSy8A==
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0ea57fea7so3888464eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 05:48:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeGDOsRoiweRlp5c0C41y2K9PnMNA+FY8ck5W0PCqvGIMnQEidKuE171GF5emvUogkoVKmDxKBDeQJ4KzrrDMK@lists.infradead.org
X-Gm-Message-State: AOJu0YwbkipTb7Ufj0Bt0sIm7Hn+U3c4/qgxdk7Ak5D7OeFtGDaVBTlh
	BplNGGGlbIENZARAzhzso6VyoQRAHLhy/X9a3YPi52WV5A9hp4gn/1kDkduUa8vWC2B8OGwUj2k
	8HE0DpcLXVK+OwyK2RtszXDA7HFi68A==
X-Received: by 2002:a05:7022:b85:b0:128:d786:8ac8 with SMTP id
 a92af1059eb24-12a725b332fmr3592564c88.0.1774183724047; Sun, 22 Mar 2026
 05:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
In-Reply-To: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 12:48:32 +0000
X-Gmail-Original-Message-ID: <CAAOTY__b_zjQZnHwktBTmj3x5wm7xacSsA+uZ0TzjFhabdaPNA@mail.gmail.com>
X-Gm-Features: AaiRm51LgG71Rayap4Jr4WgpvsodcOgbZVoTNsW735vZ4_JuKqtb7WjSvvTg7sg
Message-ID: <CAAOTY__b_zjQZnHwktBTmj3x5wm7xacSsA+uZ0TzjFhabdaPNA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: Gary Bisson <bisson.gary@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_054847_071434_7B5E3A03 
X-CRM114-Status: GOOD (  23.43  )
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

Hi, Gary:

Gary Bisson <bisson.gary@gmail.com> =E6=96=BC 2026=E5=B9=B41=E6=9C=8820=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8811:37=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Some bridges, such as the TI SN65DSI83, require the HS clock to be
> running in order to lock its PLL during its own pre-enable function.
>
> Without this change, the bridge gives the following error:
> sn65dsi83 14-002c: failed to lock PLL, ret=3D-110
> sn65dsi83 14-002c: Unexpected link status 0x01
> sn65dsi83 14-002c: reset the pipe
>
> Move the necessary functions from enable to pre-enable.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
> Tested on Tungsten510 module with sn65dsi83 + tm070jdhg30 panel.
>
> Left mtk_dsi_set_mode() as part of the enable function to mimic what is
> done in the Samsung DSIM driver which is known to be working the TI
> bridge.
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 35 +++++++++++++++++---------------=
---
>  1 file changed, 17 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 0e2bcd5f67b7..b560245d1be9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -672,6 +672,21 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_dsi=
 *dsi, u8 irq_flag, u32 t)
>         }
>  }
>
> +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> +{
> +       if (!dsi->lanes_ready) {
> +               dsi->lanes_ready =3D true;
> +               mtk_dsi_rxtx_control(dsi);
> +               usleep_range(30, 100);
> +               mtk_dsi_reset_dphy(dsi);
> +               mtk_dsi_clk_ulp_mode_leave(dsi);
> +               mtk_dsi_lane0_ulp_mode_leave(dsi);
> +               mtk_dsi_clk_hs_mode(dsi, 0);
> +               usleep_range(1000, 3000);
> +               /* The reaction time after pulling up the mipi signal for=
 dsi_rx */
> +       }
> +}
> +
>  static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>  {
>         struct device *dev =3D dsi->host.dev;
> @@ -724,6 +739,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>         mtk_dsi_set_vm_cmd(dsi);
>         mtk_dsi_config_vdo_timing(dsi);
>         mtk_dsi_set_interrupt_enable(dsi);
> +       mtk_dsi_lane_ready(dsi);
> +       mtk_dsi_clk_hs_mode(dsi, 1);
>
>         return 0;
>  err_disable_engine_clk:
> @@ -769,30 +786,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>         dsi->lanes_ready =3D false;
>  }
>
> -static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> -{
> -       if (!dsi->lanes_ready) {
> -               dsi->lanes_ready =3D true;
> -               mtk_dsi_rxtx_control(dsi);
> -               usleep_range(30, 100);
> -               mtk_dsi_reset_dphy(dsi);
> -               mtk_dsi_clk_ulp_mode_leave(dsi);
> -               mtk_dsi_lane0_ulp_mode_leave(dsi);
> -               mtk_dsi_clk_hs_mode(dsi, 0);
> -               usleep_range(1000, 3000);
> -               /* The reaction time after pulling up the mipi signal for=
 dsi_rx */
> -       }
> -}
> -
>  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
>  {
>         if (dsi->enabled)
>                 return;
>
> -       mtk_dsi_lane_ready(dsi);
>         mtk_dsi_set_mode(dsi);
> -       mtk_dsi_clk_hs_mode(dsi, 1);
> -
>         mtk_dsi_start(dsi);
>
>         dsi->enabled =3D true;
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260120-mtkdsi-29e4c84e7b38
>
> Best regards,
> --
> Gary Bisson <bisson.gary@gmail.com>
>

