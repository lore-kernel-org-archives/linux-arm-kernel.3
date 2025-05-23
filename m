Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AE1C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXQOTRtZ1jRJVUa4oYTmu+8c6JwfvWcPZW4/fzmrjuQ=; b=wh/PWvPYVqIJY44FA7rK/ywsAD
	5nl5EcvBQdNzlkzSCCUtLsWR9q4GScxR/yoLr/mlvQoiKN3rHTB3iLlDPXoOXXydK75tTBtM6p2iL
	OVraiC/I7ciMFcQEcHKJhKbGFC0bkdzixJN0uzyDa3PASnKqC/0o6xygA/vJFoP4u81CZguIl9gPP
	tLxze/qpJtAEUCy21n3otk6FpkRnNpjTh22AmjygBljDOAuOoThVpaoot4qphv6TChJU2Op2QCF74
	sZsRXVOe8pVFK1AyETVtLWMyDrcSd392zqb5aC02hnkfRgWzyQEwYh9jEbwgz/Rpp5lEsgWtS/yV8
	Q7ed+96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQG1-00000003fl2-1dzV;
	Fri, 23 May 2025 11:08:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQDc-00000003fYj-2PnZ;
	Fri, 23 May 2025 11:05:41 +0000
Received: from pyrite.rasen.tech (fp76f176b6.tkyc001.ap.nuro.jp [118.241.118.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0A916B5;
	Fri, 23 May 2025 13:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747998316;
	bh=Ye3uQC7xrBPg3aUxgsBw7tGbGkMZh87SKpNk54FKl/g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=G/y3vF7YOUJLFITEcHDpZCtnC7qocDabh33hZac6L8UjnXI1jLccP/ZETvK3upVRV
	 gQLqvFzXJXlGCU+zTkAwgehOnCQIgfX/xQCO34L6dNj7jlOkXtcvmsV5hEUvzqKmJ5
	 2Cl9zbuhwDoSvmda14WqVX2ZaK3Lcs48tRgAlXng=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <m3tt5b7kvc.fsf@t19.piap.pl>
References: <m3tt5b7kvc.fsf@t19.piap.pl>
Subject: Re: [PATCH] media: rkisp1: correct histogram window size
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>
Date: Fri, 23 May 2025 20:05:32 +0900
Message-ID: <174799833258.43941.7457628037394806572@pyrite.rasen.tech>
User-Agent: alot/0.0.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_040540_756773_C6307261 
X-CRM114-Status: GOOD (  17.14  )
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

Hi Krzysztof,

Thanks for the new version.

My bad, I should've mentioned in the review of the previous version; I think
you should have a paragraph in the beginning briefly explaining the problem=
 in
english.

"The histogram window dimensions are unnecessarily decremented. This can be
seen in the following example, where when all pixels are of maximum intensi=
ty
there are pixels that we expect to be counted but are missing from the high=
est
bin. Fix this by removing the unnecessary decrement."

I think would be good enough.

Quoting Krzysztof Ha=C5=82asa (2025-05-23 18:10:47)
> Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
> the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
> HIST_STEPSIZE =3D 3 (lowest permitted), all weights are set to 1:
>=20
> isp_hist_h_size: 383 (=3D 1920 / 5 - 1)
> isp_hist_v_size: 215 (=3D 1080 / 5 - 1)
> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 229401
>=20
> Apparently the histogram is missing the last column (3-pixel wide,
> though only single pixels count) and the last (same idea) row
> of the input image: 1917 * 1077 / 3 / 3 =3D 229401.
>=20
> E.g. without the patch, the pixels counted in lines are:
> 0, 3, ... 1914 (which makes 1917/3), and patched:
> 0, 3, ... 1914, 1917 (which makes 1920/3).
> The same is true for rows.

I like this clarification.


With the above paragraph added,

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

(I suppose if you approve it then it could simply be added when it's applied
and you wouldn't need to send a new version, but I don't have permissions f=
or
that so uh...)

>=20
> With the patch applied:
> isp_hist_h_size: 384 (=3D 1920 / 5)
> isp_hist_v_size: 216 (=3D 1080 / 5)
> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 230400
>=20
> 1920 * 1080 / 3 / 3 =3D 230400
>=20
> Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a3..ca9b3e711e5f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -819,8 +819,8 @@ static void rkisp1_hst_config_v10(struct rkisp1_param=
s *params,
>                      arg->meas_window.v_offs);
> =20
>         block_hsize =3D arg->meas_window.h_size /
> -                     RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10 - 1;
> -       block_vsize =3D arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW=
_NUM_V10 - 1;
> +                     RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10;
> +       block_vsize =3D arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW=
_NUM_V10;
> =20
>         rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_H_SIZE_V10,
>                      block_hsize);
>=20
> --=20
> Krzysztof "Chris" Ha=C5=82asa
>=20
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

