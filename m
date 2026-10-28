Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0978606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sXXSaIyb;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCQmoYvd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ipgv8rmvtp6GT7cHXnZSnikAq5xmVO9Okns04bQSCyo=; b=sXXSaIyba0UFH+HwOgFUi/ZWGN
	VOY1QAiM3s14Bd8VEzGewiCDZCKmJMc330qxQyr8yaiHykNj/A0xMiAAc2fyy2tPGbeXgRQ8UG6Bo
	sUXF0UdWm/XREsfvGUwtnlve3hDQdaU1mgFkxNakfC/4encU0lo16GGhlPYepEKv+/s7ebn+mgE8O
	czVJdr2kCotf3nlSEZiTqpLz+WmLzdaBIz+KBujOeRJ3vBjVWpTot3j9DIkLwjEvYJnKTtMChSLvK
	GlrWFnSCAHf5m6w+dbFW6cIzj/airm2InOUTQiNdUeFhDECJpBrgIHuqvoBusA9sTsFUI8yffaY9F
	58bQeV0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAB3-00000007vBq-2cwd;
	Wed, 28 Oct 2026 20:23:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAB1-00000007vBd-497W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 20:23:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9980343268;
	Wed, 28 Oct 2026 20:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F031F01825;
	Wed, 28 Oct 2026 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793218994;
	bh=Ipgv8rmvtp6GT7cHXnZSnikAq5xmVO9Okns04bQSCyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BCQmoYvdPFuxDGcgYVXcoGOhBadVV29fjFGZ75cGAPdbuv881H+JoZIsjWI98RBdy
	 EZpO5Bg7CzuM6KjGwPdiIQrP+aggCqbZCiBaDIN+xTeLl1z3CSg2kZeSpok4dh/W55
	 mupIwGez6i0qGTQ86grpe47HS+EVB40GztDnXWZTjIcfOvm62QHxiJHIFlFs4wGTyM
	 zOQDsvxFcz6zu9vooMLNgQGRbHlAzn3MnuzRvpQeDN0UnowD2n4k1eHEr8FmrpnGki
	 nM0MJbuo8CjCa8jERdbOL1/dLoGelhl1NubL3PJ2YgCZyYVf+906HW/o6+mIrMvo3E
	 Kx9l9WmQ64eYw==
From: Thomas Gleixner <tglx@kernel.org>
To: Brian Norris <briannorris@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf
 Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>, =?utf-8?Q?Andr=C3=A9?= Draszik
 <andre.draszik@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Radu Rendec
 <radu@rendec.net>, linux-arm-kernel@lists.infradead.org, Mariano Marciello
 <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>,
 linux-clk@vger.kernel.org, Jakub =?utf-8?Q?G=C5=82owacki?=
 <jglow@google.com>, Brian Norris
 <briannorris@chromium.org>
Subject: Re: [PATCH 7/9] irqchip/google-cpm: Add CPM IRQ driver
In-Reply-To: <20261026144346.7.I41e14e9460b3add41e69dac97abf57a741e9c4c5@changeid>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.7.I41e14e9460b3add41e69dac97abf57a741e9c4c5@changeid>
Date: Wed, 28 Oct 2026 21:23:11 +0100
Message-ID: <87se1py3ps.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26 2026 at 14:43, Brian Norris wrote:
> +
> +static void cpm_irq_process_irq_status(struct cpm_irq_info *info, u32 irq_number)
> +{
> +	int ret;
> +
> +	ret = generic_handle_domain_irq_safe(info->domain, irq_number);

  int ret = generic...();

> +	if (ret)
> +		dev_err(info->dev, "Error handling IRQ %u, error code %d\n", irq_number, ret);
> +}
> +

> +static const struct irq_domain_ops cpm_irq_domain_ops = {
> +	.map = cpm_irq_domain_map,
> +	.xlate = irq_domain_xlate_onecell,

Tabular layout please

> +};
> +
> +static int cpm_irq_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct cpm_client *client;
> +	struct cpm_irq_info *info;
> +	int ret;
> +
> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->dev = dev;
> +	auxiliary_set_drvdata(adev, info);
> +
> +	info->domain = irq_domain_create_tree(dev_fwnode(dev), &cpm_irq_domain_ops, info);
> +	if (!info->domain) {
> +		dev_err(dev, "Unable to add irq domain\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, cpm_irq_domain_remove_action, info->domain);
> +	if (ret) {
> +		dev_err(dev, "Failed to add irq domain removal action\n");
> +		return ret;
> +	}
> +
> +	client = devm_cpm_request_client(dev, CPM_AP_NS_IRQ_SERVICE,
> +					 cpm_irq_rx_callback, info);
> +	if (IS_ERR(client))
> +		return dev_err_probe(dev, PTR_ERR(client),
> +				     "Failed to request cpm client\n");

No line break required. You have 100 characters.

> +static struct auxiliary_driver cpm_irq_driver = {
> +	.probe = cpm_irq_probe,
> +	.name = "cpm-irq-chip",
> +	.id_table = cpm_irq_id_table,

Tabular layout

> +};
> +

Pointless new line.

> +module_auxiliary_driver(cpm_irq_driver);

Other than those nitpicks this looks reasonable.

> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Google CPM IRQ chip driver");
> +MODULE_AUTHOR("Jim Wylder <jwylder@google.com>");

This does not add up: I can't find Jim in the From/SOB tags of the mail.

Thanks,

        tglx

