Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3D1FED9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qqIO5Nq4HZXMqx40ONnhQAaxlGohVZ2byEsaKtpwVE=; b=l+e+o1RDx64FBE+hJVppsTLPFi
	XaKOuZlPJT/opG5vheFI7wvJBj30vUmaBlG2nvKRuPzjxQVHu++FCUiN+O6R7bbazUrYMgg2yzYW1
	QO29Nmf+gUx+uHFkAYPg2D57XdfFAnM2WXc2Ik/Pt3gHVAyJayyg/oImPK/cQJ4tpdXgj0RRzazrG
	H2KRvE5oUOcJIBqctqTlAiznITHyT6+hc45lUUypbnlY5HBhJp+qNeOzNMXwH6OmM2VykJxDpyzmg
	f4Wen0/izBb/c4FtvxZHy1D1/S6DrinE6H/aHN3ynm757UqnqVP5PZfUwwQZNDf6ftDM5l05ATccr
	8FCVp4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2W8H-00000006hpd-40qY;
	Tue, 17 Mar 2026 15:14:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2W8F-00000006hon-1aPx;
	Tue, 17 Mar 2026 15:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4qqIO5Nq4HZXMqx40ONnhQAaxlGohVZ2byEsaKtpwVE=; b=aE6K6iBT+96RgF/AXkjeTIg7fI
	jlo6J/tjurPYMVRpNDnbGHBIADEYLG82kIiLADARaE4f7JgkQwuswrfvLaqqr7NtHHOCIZvJhIayv
	aWwdrfzo8wD+Qcs6NqgaPI/WOHwK89r1ko1FRqErJsJY9ZSMddQLK9hPC11feftENz+iQK3yPbQoS
	gaZfBJLzT8F7D+u5R84T+2tAFtTvO4XssjWwCxJcWkFoUQAChSJXhW0hcQSy2lVqQKzpuRaZVoVv8
	buG8FU/pxaTAE3L1mMLOx1xGWxBKJuB0jvcMfLSSPsRZB8OljdSHF9stY6s0LPCywIsQ2BZiCtQ6l
	CvCBrOLw==;
From: Heiko Stuebner <heiko@sntech.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] thermal/drivers/rockchip: Shut up eFuse prober defer warning
Date: Tue, 17 Mar 2026 16:14:45 +0100
Message-ID: <3330199.5fSG56mABF@phil>
In-Reply-To: <20260317-rockchip-thermal-trim-warning-v1-1-01bc4bda75e9@collabora.com>
References: <20260317-rockchip-thermal-trim-warning-v1-1-01bc4bda75e9@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_081455_475259_103DF7A3 
X-CRM114-Status: GOOD (  12.68  )
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

Am Dienstag, 17. M=C3=A4rz 2026, 15:31:30 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Sebastian Reichel:
> Shut up the following message printed at error level on ArmSom Sige5:
>=20
> rockchip-thermal 2ae70000.tsadc: failed reading trim of sensor 0: -EPROBE=
_DEFER
>=20
> Fixes: ae332ec0009d ("thermal/drivers/rockchip: Support reading trim valu=
es from OTP")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/thermal/rockchip_thermal.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchi=
p_thermal.c
> index c49ddf70f86e..2a40339de0d0 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -1638,8 +1638,7 @@ rockchip_thermal_register_sensor(struct platform_de=
vice *pdev,
>  	if (tsadc->get_trim_code && sensor->of_node) {
>  		error =3D rockchip_get_efuse_value(sensor->of_node, "trim", &trim);
>  		if (error < 0 && error !=3D -ENOENT) {
> -			dev_err(dev, "failed reading trim of sensor %d: %pe\n",
> -				id, ERR_PTR(error));
> +			dev_err_probe(dev, error, "failed reading trim of sensor %d\n", id);
>  			return error;
>  		}
>  		if (trim) {
>=20
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260317-rockchip-thermal-trim-warning-cd0072aa2f46
>=20
> Best regards,
>=20





