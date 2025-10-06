Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FFBCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 13:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oe64pd3Ce7fOrIkCrzTaXxkbn+TE53gBPywJ7arHoUk=; b=k9xRDpZ8gOQS7tiuJ8ub1/0ym8
	cxyXieUBD2SYQjqeb4GKkul/YhwcT81NDdXN6blwxe7qptqcoI4/udjSl6HRriEv4Boka6xB/1eDZ
	44+yTEefBJcqhwyH/B/EgMFSMrEt9JYG1SsuPcrSfn9YzuxoAXgkBthT9YrQDjuoLtHANxOVGrHbr
	8T1p4uGiIsY5OMpfTH4JiNlJCzcxpIpXmc5R3L/GoxsY5u4giZZoOyQTKBHzNqE50YdvMnmjbkYJ1
	wL89UxZPMplUXu8OYgN8KuXMREKYujUaDOM+K6hWOb1pgDI9F8F6XXQA3VxAKLj2Z4zyf2gpnD3Jx
	oaKkA3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5kyM-000000004Co-3nHg;
	Mon, 06 Oct 2025 13:09:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5kyK-000000004CP-0Ya9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 13:09:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5ky3-0006IW-7H; Mon, 06 Oct 2025 15:09:31 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5ky0-002Eb3-38;
	Mon, 06 Oct 2025 15:09:28 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5kxv-000000009q1-3bRt;
	Mon, 06 Oct 2025 15:09:23 +0200
Message-ID: <bf3de9ecf10a3f6a63a6f2e235369519cb2f63e8.camel@pengutronix.de>
Subject: Re: [PATCH] reset: core: reset-gpio: Suppress registration error
 for optional resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andre Przywara <andre.przywara@arm.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 06 Oct 2025 15:09:23 +0200
In-Reply-To: <20251002222826.16516-1-andre.przywara@arm.com>
References: <20251002222826.16516-1-andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_060948_175095_5966C8E9 
X-CRM114-Status: GOOD (  23.02  )
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

Hi Andre,

On Do, 2025-10-02 at 23:28 +0100, Andre Przywara wrote:
> For reset controllers that are marked as optional, we should skip errors
> during probing and return NULL, to avoid unnecessary failures. The
> reset-gpio controller does this mostly, but returns the true error in
> case the __reset_add_reset_gpio_device() call fails. Treat this call the
> same as the other registration errors, and consider the optional flag.
>=20
> One could argue that at this point it's a proper error that should not
> be ignored anymore, but in case of the reset-gpio controller this is not
> entirely true, since the code at the moment does not support GPIO
> controllers with three #gpio-cells - there is a TODO comment about this
> in that said function. So to avoid unnecessary probe fails for devices
> using reset-gpios (it's an optional reset after all), let's treat an
> error as still optional at this point.
>=20
> This fixes operation of WiFi chips on Allwinner boards, where some use
> reset-gpios, and which currently fail because all Allwinner SoCs use
> GPIO controllers with 3 cells.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/reset/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 22f67fc77ae53..c2ccd08fb36e1 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -1044,7 +1044,7 @@ __of_reset_control_get(struct device_node *node, co=
nst char *id, int index,
> =20
>  		ret =3D __reset_add_reset_gpio_device(&args);
>  		if (ret) {
> -			rstc =3D ERR_PTR(ret);
> +			rstc =3D optional ? NULL : ERR_PTR(ret);

Please move this into __reset_add_reset_gpio_device() and pass flags
into it. Only the -ENOENT return value mentioned in the commit
description should be suppressed by the optional flag, not any -ENOMEM.
And especially not the return value of __reset_add_reset_gpio_lookup(),
which may be -EPROBE_DEFER.

regards
Philipp

