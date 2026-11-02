Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32864606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 01:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D7hbdhm4;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=hWW8bLso
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zzCU2zkthIhynh/pGZOVADh4w3xaW1IuAwNsbHBIwe0=; b=D7hbdhm4wMBCLblf6Fcj5gzWe4
	h5/VTd1pnuw0wmqSdsieIxttGSaG4hPmhHCDS8upTGsK87N0SFFPu06OrdTU23XMn2FYTT7v3ULcy
	SO524AEZg8QYwe/0Mem/O4elCLPcFz/yLT/VhXDfNFBkJQtMz9bf7p5BnfPM3VJVSZK7S0H9zmDFq
	PCqj454jZDmh+dxMYDiGRgLHM+U6AXtJ09cu7PCYLY4IQFwZyhaZBhV03vbGV20QgBaVnDKwatY66
	/yAFKADwqsU2sgO9xgTUWM1Nf/irTgKz4GJZfJuQxQXvB6JSwPWrORZaugYRzpfx7x16xJRxXGaTQ
	jXwvRJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNgoK-0000000FMLB-1Aga;
	Mon, 02 Nov 2026 01:26:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNgoH-0000000FMKn-3SnZ;
	Mon, 02 Nov 2026 01:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zzCU2zkthIhynh/pGZOVADh4w3xaW1IuAwNsbHBIwe0=; b=hWW8bLsomnVzGKHciWTUasclCf
	8tmij0rf9vle4WJmwrKBGRVLJEfPlPE3MvYaFpK0jK4y3Tw9p7hXOGoaWPTSZFHq0TTrSgmdOBInF
	huHicLfIk5HSbl7mXDafx5b2aEcPLZnPtJt9IPhYJhEDi+miOklAFfHAc0Tt1MU8O0Hc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xNgo6-00DiZC-2x; Mon, 02 Nov 2026 02:25:54 +0100
Date: Mon, 2 Nov 2026 02:25:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
Message-ID: <ce7d357b-8990-49bb-94c5-5491496f3ba8@lunn.ch>
References: <20261022200640.3101932-1-tanure@linux.com>
 <20261022200640.3101932-5-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022200640.3101932-5-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_172605_931348_FBF0FD86 
X-CRM114-Status: GOOD (  14.77  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +/*
> + * Delay handling of the SoCs up to the G12A. It reads phy-mode as the
> + * list of delays this glue has to add, falls back to a 2ns TX delay and
> + * takes the vendor delay properties, all of which ethernet-controller.yaml
> + * rules out. The boards in the tree depend on it, so it stays, but a new
> + * SoC must not use it.
> + */
>  static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>  {
>  	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
> +	struct device_node *np = dwmac->dev->of_node;
> +	u32 tx_delay_ns, rx_delay_ps = 0;
>  	int ret;

Does this code need to change?

It would be better if you did not need to change the old code, so you
don't need to worry about breaking other SoCs. Just don't call it for
the T7, use you new function in its place.

	Andrew

