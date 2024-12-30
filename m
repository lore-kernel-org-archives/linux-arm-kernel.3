Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32571E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohpyCkaTqxyUXMynWwvURgO+yrb1u9FDS8ycM12jyzo=; b=1UF08F0txefXK7lcJLK/DyNCJj
	Xb/QOJvpec2F249UvevUGD/oL4Rv1A9zVdtT9V5suOHlkIjKDpQ8X40z8U2zUuSADjCzCxCHUXNaz
	ZEGeOgzAeSwW4W/uJS1CEDSFeNNYx+EbL+ys0/XTx+RFRs1zhRU1GrspGaM2GQOoSmgiqbIUJ6HLN
	I6R67d/zHxHB5R8TS7mnmTwvi5IUY33tF1kJCSQK/qyel/rutjnIoak0yTRPxtDqe765MSLU/Ft7z
	gQx/QVuTuVLcZmZzgBLhzp8FisYU202gxZNmaJachTvPv8GoxltgzbhsUEQd+HLIr0ARt9Cjztccz
	rOnCq2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHAh-00000005OTY-1cQy;
	Mon, 30 Dec 2024 14:55:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSH9V-00000005OH2-2uMQ;
	Mon, 30 Dec 2024 14:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99FFD5C5BE6;
	Mon, 30 Dec 2024 14:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9A1C4CEDC;
	Mon, 30 Dec 2024 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735570432;
	bh=WDFEw3OsZJJ8Sq6HsWUnnhd0lqswD+wj97EUubtix7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wz0whRTmwKap/vP8QsLGjspq7fE5V7xrYvevZur3NBIp2TZ9m09F8z3RY2FL+JZQP
	 H0w5hh4Snc6FNPBgp+zqMrYZGYq0cTy9nW5WByM87MOwcoRrbY8Mnn5ZtG5oDru0PW
	 zRsjAfpl3BUodZrbCz5UnmnQcH+AS/xWlxqRUbA3PkQHBDgcn8Z6bExxniREx66GrQ
	 1lJrn2O7pWqfwxVbaAvPGfiInSD3bekhco+CR2M0uAyCRTNpGxihmqWmIxmzsOHR2p
	 0kR55W0HJDX1SJSn6e7PLfykVFJj94UH6QmAKN0YHoqYnTfs3dtnu701lIZ41LnSyb
	 TEydaqKfuKVpA==
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso9385569a91.0;
        Mon, 30 Dec 2024 06:53:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUxkLxOKwEdU15Y5sWpkAx6hEMJtveig9BzYBiyC9A6ZCBNtwUQX3mr0R8vmnT68Iw1YmvbzaRyTBz3kZ0rzY=@lists.infradead.org, AJvYcCVjbudKhYEzPUTEHd7YBu1HeH/UxqEOf4iPyp4hzL0EVkbnjvzKoDg7EBER8QVBDKxeBPRkqe7jVTQ4yOCgJ/KI@lists.infradead.org
X-Gm-Message-State: AOJu0YwRCBisLPJY62tdfuU7o24mjY+PJ/Qw1It9qFzpl7MN9Qh8cn/e
	F7OlhAnsH8UydKpq3srf40/L79R3uoudlfeKm+MRW274B2RpJBJ9ME76EbMnlL/WR56VhjafZaq
	6NnIQWGOzhN4t9LMUQ8m5SS8ixw==
X-Google-Smtp-Source: AGHT+IHWVxToWBIQDV5+6IDtpEaGWg3Z6eUwvEqRbNXBop4eB6WUWI7Yn024Nknp9WTDicmflHwCHCjFlUdP+kf7CQw=
X-Received: by 2002:a17:90b:2e0b:b0:2ee:f550:3848 with SMTP id
 98e67ed59e1d1-2f452deb50bmr56119082a91.5.1735570432073; Mon, 30 Dec 2024
 06:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20241219112733.47907-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241219112733.47907-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 30 Dec 2024 22:54:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__7-3Y_dyp2u=SXA2Cq6xxeyrzrvwvvLE7GeR39Gi6r5A@mail.gmail.com>
Message-ID: <CAAOTY__7-3Y_dyp2u=SXA2Cq6xxeyrzrvwvvLE7GeR39Gi6r5A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add registers to pdata to fix MT8186/MT8188
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, rex-bc.chen@mediatek.com, 
	xinlei.lee@mediatek.com, shuijing.li@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_065353_825571_EAF852C8 
X-CRM114-Status: GOOD (  19.34  )
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
2024=E5=B9=B412=E6=9C=8819=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:=
27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Registers DSI_VM_CMD and DSI_SHADOW_DEBUG start at different
> addresses in both MT8186 and MT8188 compared to the older IPs.
>
> Add two members in struct mtk_dsi_driver_data to specify the
> offsets for these two registers on a per-SoC basis, then do
> specify those in all of the currently present SoC driver data.
>
> This fixes writes to the Video Mode Command Packet Control
> register, fixing enablement of command packet transmission
> (VM_CMD_EN) and allowance of this transmission during the
> VFP period (TS_VFP_EN) on both MT8186 and MT8188.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 03d7adc41027 ("drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.=
c")
> Fixes: 814d5341f314 ("drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.=
c")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index e61b9bc68e9a..978332cd52f5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -139,11 +139,11 @@
>  #define CLK_HS_POST                    GENMASK(15, 8)
>  #define CLK_HS_EXIT                    GENMASK(23, 16)
>
> -#define DSI_VM_CMD_CON         0x130
> +/* DSI_VM_CMD_CON */
>  #define VM_CMD_EN                      BIT(0)
>  #define TS_VFP_EN                      BIT(5)
>
> -#define DSI_SHADOW_DEBUG       0x190U
> +/* DSI_SHADOW_DEBUG */
>  #define FORCE_COMMIT                   BIT(0)
>  #define BYPASS_SHADOW                  BIT(1)
>
> @@ -187,6 +187,8 @@ struct phy;
>
>  struct mtk_dsi_driver_data {
>         const u32 reg_cmdq_off;
> +       const u32 reg_vm_cmd_off;
> +       const u32 reg_shadow_dbg_off;
>         bool has_shadow_ctl;
>         bool has_size_ctl;
>         bool cmdq_long_packet_ctl;
> @@ -367,8 +369,8 @@ static void mtk_dsi_set_mode(struct mtk_dsi *dsi)
>
>  static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
>  {
> -       mtk_dsi_mask(dsi, DSI_VM_CMD_CON, VM_CMD_EN, VM_CMD_EN);
> -       mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
> +       mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, VM_CMD_EN, VM=
_CMD_EN);
> +       mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, TS_VFP_EN, TS=
_VFP_EN);
>  }
>
>  static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
> @@ -714,7 +716,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>
>         if (dsi->driver_data->has_shadow_ctl)
>                 writel(FORCE_COMMIT | BYPASS_SHADOW,
> -                      dsi->regs + DSI_SHADOW_DEBUG);
> +                      dsi->regs + dsi->driver_data->reg_shadow_dbg_off);
>
>         mtk_dsi_reset_engine(dsi);
>         mtk_dsi_phy_timconfig(dsi);
> @@ -1263,26 +1265,36 @@ static void mtk_dsi_remove(struct platform_device=
 *pdev)
>
>  static const struct mtk_dsi_driver_data mt8173_dsi_driver_data =3D {
>         .reg_cmdq_off =3D 0x200,
> +       .reg_vm_cmd_off =3D 0x130,
> +       .reg_shadow_dbg_off =3D 0x190
>  };
>
>  static const struct mtk_dsi_driver_data mt2701_dsi_driver_data =3D {
>         .reg_cmdq_off =3D 0x180,
> +       .reg_vm_cmd_off =3D 0x130,
> +       .reg_shadow_dbg_off =3D 0x190
>  };
>
>  static const struct mtk_dsi_driver_data mt8183_dsi_driver_data =3D {
>         .reg_cmdq_off =3D 0x200,
> +       .reg_vm_cmd_off =3D 0x130,
> +       .reg_shadow_dbg_off =3D 0x190,
>         .has_shadow_ctl =3D true,
>         .has_size_ctl =3D true,
>  };
>
>  static const struct mtk_dsi_driver_data mt8186_dsi_driver_data =3D {
>         .reg_cmdq_off =3D 0xd00,
> +       .reg_vm_cmd_off =3D 0x200,
> +       .reg_shadow_dbg_off =3D 0xc00,
>         .has_shadow_ctl =3D true,
>         .has_size_ctl =3D true,
>  };
>
>  static const struct mtk_dsi_driver_data mt8188_dsi_driver_data =3D {
>         .reg_cmdq_off =3D 0xd00,
> +       .reg_vm_cmd_off =3D 0x200,
> +       .reg_shadow_dbg_off =3D 0xc00,
>         .has_shadow_ctl =3D true,
>         .has_size_ctl =3D true,
>         .cmdq_long_packet_ctl =3D true,
> --
> 2.47.0
>

