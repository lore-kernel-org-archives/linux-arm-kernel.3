Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C8B606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Loh+EZOQ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=VDrsKog5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UZCPbOxuHxVfcCpmEyp2FuF94MWKe2jTtQcOlBA8NP8=; b=Loh+EZOQYgWQuQTfvv1eaUlRlY
	DTq3q+CEVqjfkEt7s2hM9mFiKhMEArXN7Zx+wSVhWMsqszs04COjh46Y8z0fqHwDNqhsZf0+KMQch
	IzKtuNCWUt44U5R+CiiqgtW057sXSrQCUgoNyyQJdeHBHd1dNIpOL3h0qZMmdWCaIdzIrx4b1d227
	EuWgGLN3TaZz1ClP25jPjIxm14EJYxzpdXsZLT4Iu/16GY/M6kqgazLt7ZzN6IF/nrdIqthDbFPAr
	sariOGE4g44DTFnJQLuSySsibRbQF6VOASMpCvpQwzEYd3P5wvLQC3tfCAuGhoXLNHA1U2U3Yb5V0
	6kOPBRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOidp-000000074BW-0f4X;
	Wed, 04 Nov 2026 21:35:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOidn-000000074B0-22vg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UZCPbOxuHxVfcCpmEyp2FuF94MWKe2jTtQcOlBA8NP8=; b=VDrsKog51b2RF7ESU9eYKcZLb8
	VqMM9W/eeGlQgJy1/KjdcLA2TaK3nJJH1QKsBvJ1gSnoIvwrZDLlOnhXQnczL8BcAFReUSgXn/+Yv
	uXArciRi7epVa64gYAv3P0Khywv0cbo4wUI7FDbezlCziZysGT/TTxixnefFk+tS31rs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xOidY-00EOR7-8u; Wed, 04 Nov 2026 22:35:16 +0100
Date: Wed, 4 Nov 2026 22:35:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: joseph@telaak.dev
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
Message-ID: <ba345fce-e88a-4aac-b9a4-59c500f80247@lunn.ch>
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_133531_522622_9FCE272A 
X-CRM114-Status: GOOD (  11.30  )
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

> +/* The MAC adds an RGMII delay only where the device tree asks for one */
> +static int sf19a2890_gmac_set_delays(struct sf19a2890_gmac *gmac)
> +{
> +	u32 tx, rx;
> +	int ret;
> +
> +	ret = sf19a2890_gmac_get_delay(gmac, "tx-internal-delay-ps", &tx);
> +	if (ret)
> +		return ret;
> +
> +	ret = sf19a2890_gmac_get_delay(gmac, "rx-internal-delay-ps", &rx);
> +	if (ret)
> +		return ret;
> +
> +	writel(tx, gmac->cfg + SF19A2890_GMAC_TX_DELAY);
> +	writel(rx, gmac->cfg + SF19A2890_GMAC_RX_DELAY);
> +	writel(!!rx, gmac->cfg + SF19A2890_GMAC_RX_DELAY_EN);

What does SF19A2890_GMAC_RX_DELAY_EN do? By default rx is 0, so the
delay is not enabled. Is that any different to actually enabling it
with SF19A2890_GMAC_RX_DELAY set to 0?

	Andrew

