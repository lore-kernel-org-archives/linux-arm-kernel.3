Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C6DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Rxe8fclWU9eKQhUr4r0+qJ5LJ20LHWcKq4r0Ksq24c=; b=mTQXSk/KZ8LZsM5DSwVAigFDYr
	nAjNrBHuN3n06iSmh44DrT+Fpt2oWIq+Tg+ATIxPcUpTDuAB8YLgyu9fT9wxavUwQPDVFE4ecrrz6
	wZ8ZUarBFKTAM3NxmVkMYv82rYjEJPJUpmD6017y9H/irW4Kb5EPSOmVJbRLXfGw39gFDsbpyGd+5
	kWa83UponFYFWz3XTzHtMWHkd5yNMIA8/KvS9gWFoI9e5D39otqA+KeHeJPENy1XG3EfANXloPO9k
	lD9MlUb8rWh8EiPs41Yl9jCRnFr+QbHIsH2Q0vjZBCM95RavK5Dm0GQBtLwZgR+oRTVhLwAWBtQg0
	xaGtIo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZnF-0000000HQEM-18Jv;
	Thu, 14 Aug 2025 15:23:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYfx-0000000HBRC-2SPb;
	Thu, 14 Aug 2025 14:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3Rxe8fclWU9eKQhUr4r0+qJ5LJ20LHWcKq4r0Ksq24c=; b=FiDj4GAPVYaaON4tetyT9V0dBM
	nx6w7bPa8U5pgLoFLkSGYqDZtAt0m6Q4RUyuwga1cLAbwK8I1WlaoUyaALFVH4xVAJXxz618iLCPQ
	5Cedv8yqtvBBBzlUoH0OpCCzJZNqKI8RObJZiPfkAvvqGLDmE5ot079gqhPPaO6qQfNcBSlS62uW6
	CItJkkiO3//2jThlGYDeD9i7LK3bJFO6tEj9bIUMzKk9NEjx+tUvGQdJjSjHLcdesyz2SRcghA9n2
	0jiWy18T8uVyUfBdIum6Fu8Vzxg47iRuioqZi8muqVg3ggkX5NHqB09Nf7JTrALgyvNccVBWUEJIy
	g9DDU5fQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYft-0000000GQxl-2idf;
	Thu, 14 Aug 2025 14:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4639FA553AA;
	Thu, 14 Aug 2025 14:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE6CC4CEF7;
	Thu, 14 Aug 2025 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755180680;
	bh=EtreIo4RmDvEX0MIutMMZJFN4Qc14MzIRQ/PqGEOA/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FQP9lgRbJpaU/omrvPEuTR4GtID0tGpr5hPgbP/9Ucp7gJA9Aro/wW2YHWZqgu5Vc
	 wsD+2GRbUwtIAN6PV8J4qDdcfgLyvLZnhsN66UKNdehPNe6wGBr9AlHFwIrxkHhndR
	 BnXc28vFwXJR9AfpRnv++NudL556N7g7Wx66/Ro026kXM+fwGwifhAtDo/j+Vl64m2
	 emnVjOKqdGlQP8/EXg6auJrR1duahyqT1PJXKhGqrli1naUed1nTQ3uYz+7ztaFhPN
	 gk4F5kb5Vx8w/UlHP8joFWuRO7W3rSebNLZYmCda1MGSLvjsEw28Ic5UpFUu/iYcQl
	 XVNYH6CmaNOhw==
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-244581caca6so7092875ad.2;
        Thu, 14 Aug 2025 07:11:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOdbuP2rPvEk11S9lbjLPR7Ked41G35np+Y6Pe4vU83Au8oPbN3g5yZ7TZMKRj7w1yQNqGJPSpNOPiZAg6DNXg@lists.infradead.org, AJvYcCV8QafQD58CD+IvpbCEoUFKYSOtUkQsJH9smQ+OTc9IJFL4g3m/g3yg0h0RNfejVcxK5rLMTWmq6GL4UdXxB4E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQEEivpFGeaMsNTUivbRNsb97cRjujvaHP3wD0Tj6dcPUc0h+o
	rWzVckim697QE3LlyicptltVHeLVvGT49X6W0NAO2I9LICfiUDPqcZZr54Esj1ILGx6qnsFIdFz
	bBBhTDQA5VhVvm5v5PyFSE83AZ41ZnQ==
X-Google-Smtp-Source: AGHT+IEv9bl0mTCA5QeP2B9Sxyl/+418cvcY/Da5c3dtb2moz6zUZWAO3T1U7DLbuoeYmCLdV4cIQSoAiWVpGPO+VXs=
X-Received: by 2002:a17:902:d2c1:b0:240:a430:91d with SMTP id
 d9443c01a7336-244584ed485mr48360715ad.10.1755180680384; Thu, 14 Aug 2025
 07:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
In-Reply-To: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 Aug 2025 22:12:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9u2R3k5BORM2pwJnE9XOVfFBE_5gDfs8-PD9fBgTtmgQ@mail.gmail.com>
X-Gm-Features: Ac12FXz7hoERrgUkkr3SijSA29p_W0qoePN2uF4iKzdoy_Nb5WblBq2K-Bi3CRU
Message-ID: <CAAOTY_9u2R3k5BORM2pwJnE9XOVfFBE_5gDfs8-PD9fBgTtmgQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Fix DSI host and panel bridge
 pre-enable order
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_151125_951247_7B47187D 
X-CRM114-Status: GOOD (  22.02  )
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B47=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:31=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> Since commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> pre-enable and post-disable"), the bridge pre_enable callbacks are now
> called before crtc enable, and the bridge post_disable callbacks after
> the crtc disable.
> In the mediatek-drm driver, this change leads to transfer errors on
> mtk_dsi_host_transfer callback processing during the panel bridge
> pre-enable sequence because the DSI host bridge pre_enable and CRTC
> enable sequences, that are enabling the required clocks and PHY using
> mtk_dsi_poweron function, are called after.
>
> So, in order to fix this call order issue, request the DSI host bridge
> be pre-enabled before panel bridge by setting pre_enable_prev_first
> flag on DSI device bridge in the mtk_dsi_host_attach function.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable=
 and post-disable")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> This patch fixes an issue that can be observed on boards such as
> MediatekGenio 1200-EVK or 350-EVK with a kernel based on linux-next
> (tag: next-20250635) since commit c9b1150a68d9 ("drm/atomic-helper:
> Re-order bridge chain pre-enable and post-disable").
> In boot logs, there are multiples errors such as IRQ timeouts and
> panel init errors, leading the DSI panel not being enabled:
>
> Example on Genio 1200-EVK:
> ```
> [drm] Wait DSI IRQ(0x00000002) Timeout
> panel-himax-hx8279 1c008000.dsi.0: sending generic data b0 05 failed:
>   -62
> [drm] Wait DSI IRQ(0x00000008) Timeout
> [drm:mtk_dsi_host_transfer [mediatek_drm]] *ERROR* failed to switch cmd
>  mode
> panel-himax-hx8279 1c008000.dsi.0: sending DCS SET_DISPLAY_ON failed:
>   -62
> ```
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index d7726091819c4762698b41060b3d4d8d27940238..0e2bcd5f67b767d92f2697a5b=
8183f67ee178a38 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1002,6 +1002,12 @@ static int mtk_dsi_host_attach(struct mipi_dsi_hos=
t *host,
>                         return PTR_ERR(dsi->next_bridge);
>         }
>
> +       /*
> +        * set flag to request the DSI host bridge be pre-enabled before =
device bridge
> +        * in the chain, so the DSI host is ready when the device bridge =
is pre-enabled
> +        */
> +       dsi->next_bridge->pre_enable_prev_first =3D true;
> +
>         drm_bridge_add(&dsi->bridge);
>
>         ret =3D component_add(host->dev, &mtk_dsi_component_ops);
>
> ---
> base-commit: c6a68d8f7b81a6ce8962885408cc2d0c1f8b9470
> change-id: 20250630-mediatek-drm-fix-dsi-panel-init-1a4b534c40a6
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

