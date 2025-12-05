Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07060D2F7FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 14:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faEdQwyqALbEvfgGmDIxXomnR131YER9QVOUbxN2Vfw=; b=Kd7ToK2sPJYJDWn2K+0ios7pkI
	wCIvOj1fbTJuGemgnxHJravHMyrGJTFIAnPMtZayjAFLIEkzx2+rdaPexIyVKUtn6eDe36JflJTBZ
	jRRM1hOb5DNZObk50S1Bmpk+BKyjde2sbvClnaL+zQO8q7JE2uU+DQwB42a/N8rv24tkpMp+q7+d3
	agWS7tPTxagvNJEtGk3nJZGtzWuJeGh8mRoixGvx/TH4LkP3kcLYDC9fsBzNw9gZQKBL1CmInVX+6
	X7uqimadfG085fFdSI42nohD08HKNn+uuUtLxXwl20wB7dVdP/5k3ZEjGXPgsamQ0kSpjJFAHH0eA
	UIhVQZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWbG-00000009ZNR-0sO6;
	Fri, 05 Dec 2025 14:15:58 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWbD-00000009ZMn-2UIx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 14:15:57 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1764944146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=faEdQwyqALbEvfgGmDIxXomnR131YER9QVOUbxN2Vfw=;
	b=Idk5TT7QPwh/gNKN4gh1LhQ8PaTc8RWP2Noj9basMbh+dFn+ErvaCbeiiJPg/cqZm+K1n5
	E2n3olE5h83ofUsdjeOIff+MxHzV6OUjgQLAq+CskrwpqFtJJyAaU4VvwSSJgo18RqIe/Y
	AA1aoaVoXVq9xdqPIUzPgiqTEEqavas6MkCPxWB0eWMT34NcvTTQxpzgFzUay5R+uP++CB
	NodoSZG5OpzLbkufKbianG4h8Q031ftaPJbcU+SDNNA3blbtiYtOGJyWsagvDb3SkY/YpF
	YlViJArhEm6XZ4WZ5DZwWEA2vdpBdPiMKHxs25ebPdjb2DZG1Cn1Raina9uu6A==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Dec 2025 15:15:39 +0100
Message-Id: <DEQCHCIUQ8KK.DXHGCLW95XUC@cknow-tech.com>
Cc: "Haotian Zhang" <vulab@iscas.ac.cn>, <linux-kernel@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] regulator: fixed: Rely on the core freeing the enable
 GPIO
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Mark Brown" <broonie@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Diederik de Haas" <diederik@cknow-tech.com>
References: <20251204-regulator-fixed-fix-gpiod-leak-v1-1-48efea5b82c2@kernel.org>
In-Reply-To: <20251204-regulator-fixed-fix-gpiod-leak-v1-1-48efea5b82c2@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_061556_202858_930D206C 
X-CRM114-Status: GOOD (  16.19  )
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

On Thu Dec 4, 2025 at 8:39 PM CET, Mark Brown wrote:

s/enable GPIO/enabled GPIOs/ ? (in Subject)

> In order to simplify ownership rules for enable GPIOs supplied by drivers
> regulator_register() always takes ownership of them, even if it ends up
> failing for some other reason. We therefore should	not free the GPIO if
> registration fails but just let the core worry about things.

I built a 6.18 kernel with this patch added and that fixed the problem.
Thanks :-) Feel free to add:

Tested-by: Diederik de Haas <diederik@cknow-tech.com>

Cheers,
  Diederik

> Fixes: 636f4618b1cd (regulator: fixed: fix GPIO descriptor leak on regist=
er failure)
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Closes: https://lore.kernel.org/r/DEPEYUF5BRGY.UKFBWRRE8HNP@cknow-tech.co=
m
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/regulator/fixed.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
> index a2d16e9abfb5..254c0a8a4555 100644
> --- a/drivers/regulator/fixed.c
> +++ b/drivers/regulator/fixed.c
> @@ -330,13 +330,10 @@ static int reg_fixed_voltage_probe(struct platform_=
device *pdev)
> =20
>  	drvdata->dev =3D devm_regulator_register(&pdev->dev, &drvdata->desc,
>  					       &cfg);
> -	if (IS_ERR(drvdata->dev)) {
> -		ret =3D dev_err_probe(&pdev->dev, PTR_ERR(drvdata->dev),
> -				    "Failed to register regulator: %ld\n",
> -				    PTR_ERR(drvdata->dev));
> -		gpiod_put(cfg.ena_gpiod);
> -		return ret;
> -	}
> +	if (IS_ERR(drvdata->dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(drvdata->dev),
> +				     "Failed to register regulator: %ld\n",
> +				     PTR_ERR(drvdata->dev));
> =20
>  	platform_set_drvdata(pdev, drvdata);
> =20
>
> ---
> base-commit: 81d431130ae1af4e64030f6a956ee9137e6fc1b0
> change-id: 20251204-regulator-fixed-fix-gpiod-leak-b1f50fb8c388
>
> Best regards,
> -- =20
> Mark Brown <broonie@kernel.org>


