Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B94C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wv4BBXA+4pL6f4PUbQmyirqWFmcBaGMABn9VzcOlZ3U=; b=LkYP3zc/o+3DyY4StafVueEgfG
	sy58CwBp24mq4NbzjxW3hDSbOp9gmL1PtXlcbhzatL03l5BcvEgbNYKv9u9D7bfgXKGqRD7JsSfj7
	SkWmxnVBNaDyWg8wBPJwqng66xnF5MAmHixRH419MC11S27k3bKsqzOy3yaXaN1jdYXXaelSTSR+J
	WdKpEytEG3NQJvezeYEIYeS6KUDpqo2OFesyCn5SG1NiZetArBHVNXOaZfluvosKg9ndh/58aUGvg
	72zmcCc7JqryzvZb09EFut8ZlnBvyX3+fOT/7EgyEkXCIvBRImQKKoecmy0se3KD6rItJDu9Scf/o
	sTbG5++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1y-0000000CWxF-1OCH;
	Thu, 03 Jul 2025 20:59:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMYK-0000000BxOc-1hvB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Wv4BBXA+4pL6f4PUbQmyirqWFmcBaGMABn9VzcOlZ3U=; b=c+erWZh9K/H57qNTVjYAqIrEOL
	0CI5JHEPPML77qSqRxJ3y8+sdgKQhWnZhiWt6HM+5UC5IiYPL2fePvaabjIaqOlX4ckg1PkkE1Gl3
	rVU0jDk/u6oqPH0At3SkDXcHbiCKR8LVDVvZc87TGUO+KINbKzmRbybM83sM8aweDT9w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXMY1-0007LT-ER; Thu, 03 Jul 2025 18:12:29 +0200
Date: Thu, 3 Jul 2025 18:12:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com, jszhang@kernel.org,
	jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	inochiama@gmail.com, boon.khai.ng@altera.com,
	dfustini@tenstorrent.com, 0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com
Subject: Re: [PATCH v3 2/2] ethernet: eswin: Add eic7700 ethernet driver
Message-ID: <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703092015.1200-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_091248_444835_C03C4DCF 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

> +/* Default delay value*/
> +#define EIC7700_DELAY_VALUE0 0x20202020
> +#define EIC7700_DELAY_VALUE1 0x96205A20

We need a better explanation of what is going on here. What do these
numbers mean?

> +	dwc_priv->dly_param_1000m[0] = EIC7700_DELAY_VALUE0;
> +	dwc_priv->dly_param_1000m[1] = EIC7700_DELAY_VALUE1;
> +	dwc_priv->dly_param_1000m[2] = EIC7700_DELAY_VALUE0;
> +	dwc_priv->dly_param_100m[0] = EIC7700_DELAY_VALUE0;
> +	dwc_priv->dly_param_100m[1] = EIC7700_DELAY_VALUE1;
> +	dwc_priv->dly_param_100m[2] = EIC7700_DELAY_VALUE0;
> +	dwc_priv->dly_param_10m[0] = 0x0;
> +	dwc_priv->dly_param_10m[1] = 0x0;
> +	dwc_priv->dly_param_10m[2] = 0x0;

What are the three different values for?

> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
> +				   &dwc_priv->rx_delay_ps);
> +	if (ret)
> +		dev_dbg(&pdev->dev, "can't get rx-internal-delay-ps, ret(%d).", ret);
> +	else
> +		has_rx_dly = true;
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
> +				   &dwc_priv->tx_delay_ps);
> +	if (ret)
> +		dev_dbg(&pdev->dev, "can't get tx-internal-delay-ps, ret(%d).", ret);
> +	else
> +		has_tx_dly = true;
> +	if (has_rx_dly && has_tx_dly)

What if i only to set a TX delay? I want the RX delay to default to
0ps.

{
> +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> +				  &dwc_priv->dly_param_1000m[1]);
> +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> +				  &dwc_priv->dly_param_100m[1]);
> +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> +				  &dwc_priv->dly_param_10m[1]);
> +	} else {
> +		dev_dbg(&pdev->dev, " use default dly\n");

What is the default? It should be 0ps. So there is no point printing
this message.

	Andrew

