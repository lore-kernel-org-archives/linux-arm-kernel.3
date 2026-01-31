Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1F3E6BF38
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 01:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1p3l0Ab/P6U2jKHqy2nPkaIBhQyAdHsvReVOEIQzkk=; b=1RQuBxYZAIjb/3/nN+eQqoiB4K
	T0wpoL1oSic4JsPJB+zFLO4A8p9BHSd72IBBEC6tdlep0KBGTdQ8JO74zsMvBUJ13Hpt1AJTXTvct
	NHiupcbVcxNqVxpHWPNjOQbfYn1gnK2Ulk1xYn7lOL2p9Gmku6oO6cNQYiOYbaTDcUjL0Ngf/ARiE
	5fB0wbY30EKXB5qrRh7ijLT2Kz/72qFbRDLkc15nmUoksduq15z2jdDC1avX241G7KI7GVz9a0NCm
	Uqrys7ZKylEWz+clPY8yt3mQ1AQXiN4tt+uKLDpVDy1X1C6OjS1ENp9t7Gduy5BUO9VD1tSd5bXIn
	NySP8chg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm07q-00000002Clz-0n9z;
	Sat, 31 Jan 2026 01:50:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm07o-00000002ClS-0xZc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 01:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 441BC6013C;
	Sat, 31 Jan 2026 01:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07668C4CEF7;
	Sat, 31 Jan 2026 01:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769824211;
	bh=yZ2ydlBeIEM1kguh/UCzdsK/jkpYCuJzFCaodPIBfF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dLN628BxXGuoHL9Qtmsod7rQPNY34dyHhFXsPj7T2VvVclMks14q8oXxR8pt0zc0A
	 nOfqTI/JVn/lkuhuAAH0dG/qVsAPEk1RbDcePZvbV9u2+MWc2wlQhutVrC1Upwn2VA
	 G1xyGz0UGUOYigVRwkTTR1GrS4nac8TLelDxZrzYaqwfirmUr04JK67qwmf+lbYyDQ
	 HInljldRdfEyrR31FcyuwXxPy3ltyp5vsKGD+VkEjWy4Ac/pd49EbyTmtuXXIH7dNK
	 SKnRh45SZ9QYkRfdSzFc1KReVFwxuKnVizP7I/TAyuDNqHsFO5SmN+8s9UNHtrIhiA
	 MOtJ51o1b9MfA==
From: Jakub Kicinski <kuba@kernel.org>
To: a0987203069@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	ychuang3@nuvoton.com,
	andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com,
	yclu4@nuvoton.com,
	pabeni@redhat.com,
	davem@davemloft.net,
	andrew@lunn.ch,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	krzk+dt@kernel.org,
	edumazet@google.com,
	robh@kernel.org,
	schung@nuvoton.com,
	netdev@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Subject: Re: [net-next,v10,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Fri, 30 Jan 2026 17:50:08 -0800
Message-ID: <20260131015008.970729-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129054445.416242-4-a0987203069@gmail.com>
References: <20260129054445.416242-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

Adds Gigabit Ethernet support for Nuvoton MA35 series SoCs using
the stmmac driver framework.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

[ ... ]

> +static struct nvt_priv_data *
> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nvt_priv_data *bsp_priv;

[ ... ]

> +	bsp_priv->regmap =
> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
> +	if (IS_ERR(bsp_priv->regmap)) {
> +		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
> +		return ERR_PTR(-ENODEV);
                           ^^^^^^

Should this propagate the actual error code from
syscon_regmap_lookup_by_phandle_args() instead of always returning
-ENODEV? If the syscon lookup returns -EPROBE_DEFER, this will lose
that error code and prevent the driver from properly deferring its
probe when dependencies aren't ready yet.

Other dwmac drivers (dwmac-loongson1, dwmac-starfive, dwmac-sun8i) use
something like:

    return dev_err_probe(dev, PTR_ERR(regmap), "...\n");

or

    return PTR_ERR(regmap);

to propagate the error.

> +	}

[ ... ]
-- 
pw-bot: cr

