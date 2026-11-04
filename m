Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096C7606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uI07dMGc;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=A+8t5vjZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uRrdt0oAcAPfS+w2dQ61HkrI15khdaUCiJ5g7tU0p+Q=; b=uI07dMGcv9dPM24anTGw7Ef/i8
	ZpSozk5XcXizOiZZ8V/vmurOKCvlIn/hIyl5YZ8181TJ/OBFf11n/JF9jXB+8Xgvc7se+n651nhhj
	JTxyODX7CVKVBjPTHtEpuSS9yKssHO1Qhiiasbzdyj8+xToW2QDaCB5qnBoBj/LUgf3szKEMelcrz
	SL/Wlby1fGRsl0QNAGLiygI1Y2ByKOO6LbwhHDKr8yv275j875PLWS1JU3qloYyhWRy2I7H6Txo3C
	vNZI9ZYmJM1gK0KeTLaYywsswvqsaSwI9Tec2wP4akbuut0eTV4w4U8Ihr8ox7Dg2el+HhINTiRmv
	u47e9TEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYBp-00000004zdF-1nrB;
	Wed, 04 Nov 2026 10:25:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYBm-00000004zc0-2Y3p;
	Wed, 04 Nov 2026 10:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uRrdt0oAcAPfS+w2dQ61HkrI15khdaUCiJ5g7tU0p+Q=; b=A+8t5vjZqpreZvPSLqn2rWHCfk
	n20HzKOydnfedJfrqrbJoETErbWXGYMoVDxPotfS+pj30dhVa9kgt9ioE3h2XT9i+o0G+8YdGkx94
	c3QBYW5k2mk+ni5jhkwtbJ0XyA5dPKbn2W67WeyaIRUJ548XcG9M2F372a+JG9Z4saOhjOzo+w3oC
	eyhS0ZoraybqUEcq+Rs1ShIc64rINHDJig5KDlfjZqHUgloCWhUZhfDAow0U/X/rkbraLV4ZTsUbE
	L8NNkvSjhwcAGWUz3HAevwzEEWEfjFK3ykebZUp2dFTL+4ugzZ2Y132qKzJFggyFXmgKN48nvtd3S
	d5ApHuFg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 ulfh@kernel.org, p.zabel@pengutronix.de, ogabbay@kernel.org,
 zhangqing@rock-chips.com, Jiaxing Hu <gahing@gahingwoo.com>
Cc: royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
 u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 jeff.hugo@oss.qualcomm.com, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [PATCH v15 04/15] accel/rocket: let the core suspend after a reset
Date: Wed, 04 Nov 2026 11:25:30 +0100
Message-ID: <3373678.NnENhoQgcM@diego>
In-Reply-To: <20261101082307.151957-5-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
 <20261101082307.151957-5-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_022554_650177_ECCA7A91 
X-CRM114-Status: GOOD (  17.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Sonntag, 1. November 2026, 09:22:56 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Jiaxing Hu:
> rocket_reset() drops the in-flight job's runtime PM reference with
> pm_runtime_put_noidle(), which requests nothing, so the core does not
> suspend until something else asks and its power domain does not cycle. On
> RK3576 the domain's power-on resets the NPU bus interface; without it the
> IOMMU stops answering and the job after a timeout fails.
>=20
> Use pm_runtime_put_autosuspend(), as the completion path does. On a ROCK =
4D
> the job after a timeout goes from 0 to 128 of 128 channels correct.
>=20
> Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail=
=2Ecom/
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores, i=
nduced reset, JOB_TIMEOUT_MS=3D2
> ---
>  drivers/accel/rocket/rocket_job.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 5b2abf40b618..152a9098634b 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -467,12 +467,12 @@ rocket_reset(struct rocket_core *core, struct drm_s=
ched_job *bad)
> =20
>  	/*
>  	 * No handler is running now, but we might still have stuck jobs. Let's
> -	 * make sure the PM counters stay balanced by manually calling
> -	 * pm_runtime_put_noidle().
> +	 * make sure the PM counters stay balanced by putting the reference the
> +	 * job took, and request idle while doing it so the core can suspend.
>  	 */

with my comment in patch 3/15 fixed

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

>  	scoped_guard(mutex, &core->job_lock) {
>  		if (core->in_flight_job)
> -			pm_runtime_put_noidle(core->dev);
> +			pm_runtime_put_autosuspend(core->dev);
> =20
>  		iommu_detach_group(NULL, core->iommu_group);
> =20
>=20





