Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7107FC83F18
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFhcVY1ZSSoc/XTpIZicoEuxmwFVa6EOH7jKZUvbqJs=; b=ZBhOx+w8Xloahl38cHjsAO+O+/
	7aFxSyHVD1Zedp3jg30Z47ud2w5X3qQrL/S84daIH8UDQbSm/YbU9+6PbqbGmeikMDdOKSTn6BHtn
	1BNqR0uky+B+RKso+HT8aYt6lwMEe93+7kpn5TKYUQlMaIc1K+OxXJobj5FEUQM2GkUK29/qYxkfl
	T3A2jEsReBHhOfZAb4ks6AUqQMAK286loIGikDiQNXDc3uto+vFWDp7rt7GhFz7dD1x6Rgtai4dnB
	2aTCbrKCg39VKbm+ALvODmIc9hzL+QXJ4w29TFx1JM0/f9m5fquu3NSevNulMDpiOpFrQ/TxtOMF8
	/SLjNdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdiE-0000000A7w8-106d;
	Wed, 09 Jul 2025 22:56:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZatg-00000009kHK-2IAz;
	Wed, 09 Jul 2025 19:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JFhcVY1ZSSoc/XTpIZicoEuxmwFVa6EOH7jKZUvbqJs=; b=BFRzFXD5Nbw5HVW60D6pQXWEb8
	3rkb7z3l/vfTl5da3duXtLdc/TgsbxYZiEhh4XeVUvi10UQOSOZpgQMQVwle74iJrcXN7cEqlizaX
	xcuzHez4FLT7kuIr2EwMrRwDh6ywlS0OrgwOon9hRnVkWz2PE+yRX3esQDmCP61Iz446VQx9+Ido0
	Xv6mXFIbpfjbwMIa1PD9kbL6YLx9AGX5m7FLKX8EewJFkxjKzEobi5gYdGSkmpYhzrJZ4N5oM+dFN
	A067ULINjLEdxlBlUroBOwKs6oTOhlhoSEOXwX3H/Je5oLleHGRyTUrd3ndmq/Y5UPVXlP/3uFSVr
	+O1ZAOHw==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZat6-0006ZI-2e; Wed, 09 Jul 2025 21:55:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v2 04/12] drm/exynos: exynos_dp: Remove
 &exynos_dp_device.ptn_bridge
Date: Wed, 09 Jul 2025 21:55:26 +0200
Message-ID: <4596850.bcXerOTE6V@diego>
In-Reply-To: <20250709070139.3130635-5-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_125604_592756_83915313 
X-CRM114-Status: GOOD (  10.21  )
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

Hi Damon,

Am Mittwoch, 9. Juli 2025, 09:01:31 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Damon Ding:
> Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
> directly.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

> @@ -155,7 +154,7 @@ static int exynos_dp_bind(struct device *dev, struct =
device *master, void *data)
> =20
>  	dp->drm_dev =3D drm_dev;
> =20
> -	if (!dp->plat_data.panel && !dp->ptn_bridge) {
> +	if (!dp->plat_data.panel && !dp->plat_data.panel) {

typo. The second test should be for dp->plat_data.bridge


>  		ret =3D exynos_dp_dt_parse_panel(dp);
>  		if (ret)
>  			return ret;




