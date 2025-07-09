Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC696C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oi+8ljfF+JQ62/JezDSEUuiZkb455tkEy3zZWjAXllY=; b=EJU6W1AgU0/LzSXABadpjhhyop
	hF5YD6wLHZp0xzLJG0G5BYOZ29/G2qrPkVPIaN+7Gg88sLk2jU7IijQVmzsta9FvASrAq43/te15A
	jIGiq1Ibt8V5AyYA7rD04cOGgioFdUPQlYGdPE6FMRRDZzjZV1I8qjngBRh5G9CCSUmj4QXxACtfl
	iQxcRu5Q2pyqovQLV7n0GQGYaMx0tKW5hthUKfinpH5a80BBms54pSUkI+dPs8Y1AC1zhsUjt1m9a
	EOPZFdTzNE3oNKyumSytDJ9owPVELjn654lCBJlvVjnWd2GA2hetxnxpltNA0YhyPcQx/ze/spLQ+
	gfEoac2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdiF-0000000A7xq-0fDC;
	Wed, 09 Jul 2025 22:56:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZawN-00000009kRf-1VRe;
	Wed, 09 Jul 2025 19:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Oi+8ljfF+JQ62/JezDSEUuiZkb455tkEy3zZWjAXllY=; b=CplRT5r6vcPr6kjF6esg0ft930
	B90fQvkTqExfjC/bI9ln9oLal5rexREbxOjnqMv5pb0a18gQDO/sUzrXkC7Tuqyq/UnM4SJD5Q4js
	vJsLIbGSTvV1bEHWxzhmjgOm/rA/4h5hAB4ob+Mw7zL6XdA6rE9zvyCo/QOg4P8+894UnFF8CYXi/
	1IF31V+e1mgGDD3pGhy4KUTzB3UcJbZLDkIVFeRNotAoqE6RKf9arcc2Bz3qB6CpXwWSGq1BfspbA
	GA+h8dm92fFcTEf85HDWVt5VBHBqQYhMdxrjDcu7jBP3mQMgUlZw6Cjx6lJ1IzVJRpmrOxbT++sHQ
	lK7lIn7A==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZavq-0006bE-Gp; Wed, 09 Jul 2025 21:58:18 +0200
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
Subject: Re: [PATCH v2 05/12] drm/exynos: exynos_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
Date: Wed, 09 Jul 2025 21:58:17 +0200
Message-ID: <6306541.2iPT33SAM4@diego>
In-Reply-To: <20250709070139.3130635-6-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-6-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_125851_395746_355ED81C 
X-CRM114-Status: GOOD (  15.83  )
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

Am Mittwoch, 9. Juli 2025, 09:01:32 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Damon Ding:
> The &analogix_dp_plat_data.skip_connector related check can be replaced
> by &analogix_dp_plat_data.bridge.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 9d7d3f009e58..9e1313fdecad 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -237,7 +237,6 @@ static int exynos_dp_probe(struct platform_device *pd=
ev)
>  	dp->plat_data.power_off =3D exynos_dp_poweroff;
>  	dp->plat_data.attach =3D exynos_dp_bridge_attach;
>  	dp->plat_data.get_modes =3D exynos_dp_get_modes;
> -	dp->plat_data.skip_connector =3D !!bridge;
> =20
>  out:
>  	dp->adp =3D analogix_dp_probe(dev, &dp->plat_data);
>=20

I think you might want to merge=20
=2D drm/exynos: exynos_dp: Remove redundant &analogix_dp_plat_data.skip_con=
nector
=2D drm/bridge: analogix_dp: Remove redundant &analogix_dp_plat_data.skip_c=
onnector

Because when separate this creates a bisection issue.
Like when a bisect happens to land directly on this commit, you already have
removed the exynos assignment, but the updated check from the following pat=
ch
is not yet in place.



