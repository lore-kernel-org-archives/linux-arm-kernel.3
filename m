Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2371760A2623
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZEh1/3Kr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cgi/Sha7;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bXq7ph6n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y6fKhPj/87pimLsrwa96wiOXJcyMQ8XJmdtAlqWwRbI=; b=ZEh1/3Kr1FPv7BDX9XSLQzYR3q
	XJTc/4/qSibXRNbX7c8ikec4LSKj0n4Xgs5DUY3UecbyrGR6rMe1ihj1vhOcIzwDfEHRZTmGDTaK4
	nBd0hDHcCMXYURkYPHD71Y39ux/WMjg/aR9kdB+OzPxNU3oGbFu5vckevN+NNV+KImjcqY9PxUqz7
	F0YZomvrtar5ZWPcBKUJXqmZSHsmZFl/HLEmhDP5gco5SozKub93by+1zWz0T86xTSnXazWe0mlTY
	W+FjazlF5pMp3lbQsq9TcDJBOZsck5CTtgK264PjwMmB9iPeNcXiTm3GOoZ01fSCYmNHPDPxt+3ud
	6fhizz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpDq-0000000DqUA-27Zi;
	Thu, 22 Oct 2026 09:36:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpDp-0000000DqTh-2UiC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 09:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y6fKhPj/87pimLsrwa96wiOXJcyMQ8XJmdtAlqWwRbI=; b=cgi/Sha7qX76n02uiGwC3QiCQx
	50lAnC9S4i1u9anJSoQL+t/NPjcdxLlRNbv+FwigO0KtcKAbvxC3aybyK4m9pscVRN/LDpuhaZrm4
	V1kO6lDjn2dpKW8Nu4BWnDHSYdtnOhUkBIhAMR9MRHM4A356yGQdKdDvt5uwMiTFk4ZQxizsRfkAB
	6d49l6vFP8xXKKAV7iJNG0xNA7bgEiuuxLPC8dkINh8JKQiHjLo14Ljv3NevRBHj+pkthcYaVL0uF
	KJmB2MtNnm3TrgMuHCkLmw8pSGwofxfo61SAwGyt9X//c3U+iOYHXBeP0ciOHKPz0bTlW5D6tcV2t
	FYytWGrA==;
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpDm-00000006m5Q-0DEV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:36:28 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E7E4E2004FF;
	Thu, 22 Oct 2026 11:36:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792661782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y6fKhPj/87pimLsrwa96wiOXJcyMQ8XJmdtAlqWwRbI=;
	b=bXq7ph6ntsifd3fQBzyhED2nbhwiV5G4GjRpF7oFKQoKAHwUavLydnwPtO02w6UoTIsrwm
	IGgtbDu2MC0TXa48uEbryw/KHSrSc3Imjl5CQD9kvpGT0wD8tL5zO1jP3UCdWWKEJ2EFbh
	L93LUL7PHPjIL6/Xx9ARsW4wKx/tPdDqYd0USbBI7rcF9wWbYbAgALnL6t/GwCY8LJc7MH
	9o1KrLus06gNGE8s6FqOFx0LAqKB/3U7rg3056+7ggxpQfYK7xYraXDYB8K5Y5toq7aEL1
	XiSQi57j9TVqW32yPWKBhS8dtloO/BDUwvsaAMvVYQMYSJiFDfzdXvvYnJRwzw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792661782; a=rsa-sha256;
	cv=none;
	b=WykGo8jD8hoj3R5BdABolvEsTgPvDWg7IgivSeTxChcYdeiN6LdCe4v9cw+PDHxpQAhd34
	LXriW4TjdGJZ7sSihMd8BL8IJsbgE4DGcCKGRW5pJx31vQuUcx3mo1b8fCKtZ6mMHS8BCO
	aGs0UHSk/z9zxhRVxEyAx4wiMwSFcbsE5iBntSLen4y8ABKhooPDyDYOYMhu+6XikA7MK6
	lyhJTX8ytsYN/7l8om/+UGIrQRfH4D2PIvcLkC2sE7bgi6HW52XO7G4kxrMOezltHNY/LC
	k1r6cEBbsYxtKUPj8QvSdYmlvvuGxXLhKveo1VeT9XD4uJ/uK6RNusU4jntSbQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792661782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y6fKhPj/87pimLsrwa96wiOXJcyMQ8XJmdtAlqWwRbI=;
	b=LlMqAmC8/AkwywL7CYQSP+s+ZiAPecaqDv7M7KJsdN/HON5OTFOnpzKh35OY1Gp3fQouio
	6kgS82yTFZfAvm4MPHy8/4sqgfAj5ozTWBQV62TJXfusG4nE690zUP5S4dVSnMxeWZIRtK
	4kSR14eJ19qmpOKGXGplWQ3cxZ9gkwaTxXYLfCecd+xus6QvTonC0ddc50BUTxS9Q9R8rT
	UnG0UVcY+NW8fANIsuDZq6oc4vu2adjbXzthGL8cWhdvNE0Qi6vVkRe+gALT2VvbJ7SUl+
	C15BT2EQ5kMRBIz+c4HFjFPQN0zqb8SvcoJsyjPPSeKzmayAwZoOAezz5+gtqg==
Message-ID: <bafa6ad636d5e8a681494714adbd66bf8f2f7b19.camel@pengutronix.de>
Subject: Re: [PATCH v3 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Petar Stepanovic <pstepanovic@axiado.com>, Naveen Kumar Rajgiri Bassappa
	 <rbnaveenkumar@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei	 <twei@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Krutik Shah <krutikshah@axiado.com>
Date: Thu, 22 Oct 2026 11:36:22 +0200
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-6-3012ecfc0a93@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
	 <20261020-axiado-ax3000-usb-device-controller-v3-6-3012ecfc0a93@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_103626_336136_19DF6963 
X-CRM114-Status: GOOD (  17.28  )
X-Spam-Score: -0.2 (/)
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

On Di, 2026-10-20 at 00:19 -0700, Petar Stepanovic wrote:
> This patch introduces the core probe/remove functions for the Axiado
> AX3000/AX3005 UDC driver, and wires up the directory into the build
> system via Kconfig and Makefile.
>=20
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  MAINTAINERS                               |   1 +
>  drivers/usb/gadget/udc/Kconfig            |   2 +
>  drivers/usb/gadget/udc/Makefile           |   1 +
>  drivers/usb/gadget/udc/crg/Kconfig        |  16 +
>  drivers/usb/gadget/udc/crg/Makefile       |   9 +
>  drivers/usb/gadget/udc/crg/crg-udc-core.c | 706 ++++++++++++++++++++++++=
++++++
>  6 files changed, 735 insertions(+)
>=20
[...]
> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadg=
et/udc/crg/crg-udc-core.c
> new file mode 100644
> index 000000000000..80a4fc6a61e8
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
> @@ -0,0 +1,706 @@
[...]
> +static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
> +{
> +	struct device *dev =3D crg_udc->dev;
> +	int ret;
> +
> +	crg_udc->clk =3D devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(crg_udc->clk))
> +		return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
> +				     "failed to get clock\n");
> +
> +	ret =3D clk_prepare_enable(crg_udc->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clock\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk=
);
> +	if (ret)
> +		return ret;
> +
> +	crg_udc->rst =3D
> +		devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);

Why is this stored in struct crg_gadget_dev? It's not used anywhere
that I can see. The struct reset_control could be a local variable.

regards
Philipp

