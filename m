Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356B5E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFPNZlEooIcwCnb3CHp/TZeV+ht1n+cuCeueLEr05qg=; b=sdM7DpFh8u6urD6D9j8St937xh
	+uFgfQBl8tSO1QqRu/z3Xsv+iBfWRqchWlAsYqVSMBC41YhPcqer6AWIrr3U3iub4261h0r6VTo5l
	PlfhxktQdHsUW0m80SLke89SIh5r7VqfhySQdSz0xj8r4pUr3NcVszORqngvKlSKIfOuhy/6vGlqq
	8Pa/WZibSLG1JbntT98Z5YYIJPOGS2q+NaDrBe3OC4M10tt0MSXvd3BwMmXd8dSwqEAo3e5fAtTvq
	Iue1U8ntXQUlF6esKyPFjOA+d7S1IC1St9oNFSuBo85hzT88HgnbnWjT8Cru1RqEwrrwrPRWRNjmr
	AmS0qZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFFn-00000001jj1-35oP;
	Thu, 19 Dec 2024 12:03:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFEh-00000001jae-079O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78C6A5C5744;
	Thu, 19 Dec 2024 12:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10F9C4CECE;
	Thu, 19 Dec 2024 12:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734609754;
	bh=hFX3zZUpFJljafxwc6mZtbVjERwcv2b9BVgvXBWnGGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0lDq/YGgQS3XixO17VMlzszN0bELqF56oxoFRog7N4hgtR0PUiEgbJqO7ud5y9tg
	 d8Zizqpdyc3XrrjJ1y4SmfvfBB/oUopfrKBEfNEaQo10TigZ+5dHgP/P5BRVqXQh5r
	 RFMRhOqwYO5W1mX3SREIjucpkl+sp5yLcljg61F3M9SNfVDAd6YVEkaZpMor7zBrM4
	 Sh44vkaFBj3gAN2mwsWaUNzlwYjyiqPnF60BfWnc7+0IhlE4dTg2foMQTRcC+aiMIb
	 s2WLXZkA6RAYrd4a2dlVwErbXFHeiC0AhxD0v/lweqT8Ob5t9hfq7s3WhfAoBbPdwj
	 fnxywvxtCfexg==
Date: Thu, 19 Dec 2024 13:02:29 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, o.rempel@pengutronix.de, kernel@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Message-ID: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
References: <20241218043541.143194-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218043541.143194-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_040235_111933_B51CD48E 
X-CRM114-Status: GOOD (  12.36  )
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

Hi Carlos,

> +	/*
> +	 * Init DMA config if supported, -ENODEV means DMA not enabled at
> +	 * this platform, that is not a real error, so just remind "only
> +	 * PIO mode is used". If DMA is enabled, but meet error when request
> +	 * DMA channel, error should be showed in probe error log. PIO mode
> +	 * should be available regardless of DMA.
> +	 */
> +	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			goto clk_notifier_unregister;
> +		else if (ret == -ENODEV)
> +			dev_dbg(&pdev->dev, "Only use PIO mode\n");
> +		else
> +			dev_err_probe(&pdev->dev, ret, "Failed to setup DMA, only use PIO mode\n");

Just for understanding, should we quit in this last case, as
well?

Before we were ignoring ENODEV and EPROBE_DEFER, but now you are
making it clear that other failures like ENOMEM might happen.

Thanks,
Andi

