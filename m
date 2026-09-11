Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CF4C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNH/OsYIcw2SwCqHABXaQbKVWhGxSRFZUcnJDpFWP4k=; b=Zr1LxLIy6yqppH5uo/hD5rpBLO
	9auUgvpz0r4cnnQ9yQHyyWGRNLGWTB0rRLnthHkDyfTpr6Q4NJ3Agg8tRbhvtvW1/XuPF0xB3aZYa
	N65rPyiS+eMTC6moCVYAqOZ8MZiW6Ap5YMpzEvCA6gpC3W12QHL/U3c1WgycHOJ8sxNBYfn5CwlIX
	H0KhuHVhYVL82QdxTH1QTtZfoxxtvqc2/rG5nsnpUBlf5elgtb0/M8AwXMei2mbmlHYrFkfljpxha
	2cUAdhHI5j7c5/A7MSUUVzTE0VL81uZEHwzKYWO681r4zDg09Yh94pWbtZSbmPANVWz6yKwej8rAH
	bdCC9+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52EV-0000000GuWH-0EZ3;
	Fri, 11 Sep 2026 14:28:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52EQ-0000000GuUt-07NI;
	Fri, 11 Sep 2026 14:28:01 +0000
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8510663C;
	Fri, 11 Sep 2026 16:26:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789136775;
	bh=WzVA3xuZ5JdDGBqQbjJVlTNBllbYsKRQWabRga5ERUE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bx7OnAGre7KGRBkMjaytz3CoYbubcRbmabeSbTGp8hvXheaK6MZeL8YAqHLSkp6A8
	 bfKDFS6ZTNCkZKeVzsLJiCafbH+E+8Eu+c7SYGvIxU1EFElpCX3z/96SktdqYHUiMz
	 hL3/Ca78PdXrtLWp+crCNB4HLF+GCv9oBxX9xnTk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260911-imx8mp-demosaicing-bypass-v1-1-5568a7a560a6@ideasonboard.com>
References: <20260911-imx8mp-demosaicing-bypass-v1-1-5568a7a560a6@ideasonboard.com>
Subject: Re: [PATCH] media: rkisp1: Fix Bayer demosaicing bypass
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
To: Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri, 11 Sep 2026 15:27:50 +0100
Message-ID: <178913687012.1723501.3167773155478207003@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_072800_187917_CCB79BF7 
X-CRM114-Status: GOOD (  18.60  )
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

Quoting Jacopo Mondi (2026-09-11 14:56:19)
> The RKISP1_CIF_ISP_DEMOSAIC_BYPASS bit, when set, bypasses the
> demosaicing block on the RkISP1 ISP.
>=20
> The current implementation however clears the bit when demosaicing
> have to be bypassed and sets it when demosaicing has to be enabled,
> effectively inverting the bypass bit handling logic.

Ouch.

> Fix this by setting the bypass bit when disabling the demosaicing block,
> and by clearing it instead when demosaicing has to be performed.
>=20
> The issue never manifested itself as libcamera hasn't an algorithm
> to control Bayer demosaicing bypass yet.
>=20
> Fixes: 6c53a7b68c5d ("media: rkisp1: Implement extensible params support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> media: rkisp1: Fix demosaicing bypass
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 042b759eba62..496381962f1b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1854,8 +1854,8 @@ rkisp1_ext_params_bdm(struct rkisp1_params *params,
>         const struct rkisp1_ext_params_bdm_config *bdm =3D &block->bdm;
> =20
>         if (bdm->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
> -               rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> -                                       RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> +               rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> +                                     RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
>                 return;
>         }
> =20
> @@ -1863,8 +1863,8 @@ rkisp1_ext_params_bdm(struct rkisp1_params *params,
> =20
>         if ((bdm->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
>             !(params->enabled_blocks & BIT(bdm->header.type)))
> -               rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> -                                     RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> +               rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> +                                       RKISP1_CIF_ISP_DEMOSAIC_BYPASS);


I think this also opens us up to add mono formats as explicitly
supported by the ISP and potentially set the demosaic defaulting to off
in that instance?

Anyway, Looks sane to me in this order.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>  }
> =20
>  static void
>=20
> ---
> base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> change-id: 20260911-imx8mp-demosaicing-bypass-bb284d9cca60
>=20
> Best regards,
> -- =20
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>

