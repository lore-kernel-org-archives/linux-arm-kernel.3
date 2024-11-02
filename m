Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75885E677EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZEwYd+eVP/nmU1iBKOLOdPKnYIOM6WOQ/H//SmmZJk=; b=ich9IoSL6MuKwWsvTeH3U19ZLy
	PAzBtKCDvsjQHOej+gDAiWyhk/RX0LdnhENrwHRfwazUnCdnpbB3bDblJdq/l6dtZnd6fX+99cWA+
	JeTzH4l/4lM1ZhZI8yxdTYQZ99ODzDsi8sM6b3j7ohg4ZxfDhsWTz0cAKPkPJZIc6ORvVs3E4F5FZ
	vg8U8QZvR6Si2tZemGnOJ9hNA2F0hPtE2C2muo4ooTpVSJ/3VXmvUYQZiFuYWzkk1RY/rQduRj/XM
	CXw7VFFfqo/vOUZwaEAw/GyfIWTjneFJLbHqYinq4WWG4te9JK+2RrW5uFnp+Po8fVVY6KKprjAVO
	gcMpn3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t79u0-00000009Kx8-2QCO;
	Sat, 02 Nov 2024 08:54:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t79sC-00000009Kk5-1WTQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 08:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFC7B5C01FB;
	Sat,  2 Nov 2024 08:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611A4C4CED1;
	Sat,  2 Nov 2024 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730537563;
	bh=5Ur0AthEvPTHPmN0Q6ms1UsYHOsLFRg2PHT8QzlnmVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5PffNWV0hSAaroMTOUeypERpBd4QK69Q5mCJy20GVfB1i4BTGzIY5xkubYuO8/ig
	 2ykIOrkevbctwbUhZRKb9klfeZwbvh07Ru+mfX5zZ+kTyd5cLGxYhEpsq9uKUDsXb/
	 zdNJAiSlas1Bks9qIE8qHsB8fC1ZSKbB5nCBzhGJO22iH9Fz+61kSuSaB6ne4vmGt0
	 2xoXvoEzCsMky5PJwSfmTD63KgI7hDio+UsWj47/ANX/QQRGRbofytywy8K1wt143b
	 vMMHD5BAonRv0WzwAy9XN7ZM5EAwHRgcQUpe0yWTQ9Tcm14L12+C7WWv+MZXhT5eEe
	 zqGNBh926zsUA==
Date: Sat, 2 Nov 2024 09:52:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <z5ky5g46tsdmrabplgjbt3ahlnkn7gljkwsxjshwpkdqqnirwr@wavvhc2wudlh>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_015244_475535_C2841F37 
X-CRM114-Status: GOOD (  13.44  )
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

On Fri, Nov 01, 2024 at 10:06:08AM +0200, Andrei Stefanescu wrote:
> +static int nxp_siul2_probe(struct platform_device *pdev)
> +{
> +	struct nxp_siul2_mfd *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->num_siul2 = S32G_NUM_SIUL2;
> +	priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
> +				   sizeof(*priv->siul2), GFP_KERNEL);
> +	if (!priv->siul2)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	ret = nxp_siul2_parse_dtb(pdev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
> +				    NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id nxp_siul2_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-siul2" },
> +	{ .compatible = "nxp,s32g3-siul2" },

So devices are comaptible? Why doesn't your binding express it?

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, nxp_siul2_dt_ids);
> +
> +static struct platform_driver nxp_siul2_mfd_driver = {
> +	.driver = {
> +		.name		= "nxp-siul2-mfd",
> +		.of_match_table	= nxp_siul2_dt_ids,
> +	},
> +	.probe = nxp_siul2_probe,
> +};

Best regards,
Krzysztof


