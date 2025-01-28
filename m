Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829E8C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEmFa+/qd3u+ok4UR2h6fx/Z5JLxm/bEDrf24WuzN2s=; b=h78TaKdMqQaOiUzJMpUh6pDA69
	fCPn1l7xBO9if7yTW/1l7L2M5UqbL+6FSjQb8C2nRknrmteDKH5lnYaAEdJ82dVVsK/wV/kliKAmh
	fbEpWdA13gYNbGjXBDfOAoYFsdfnLjnAvnjHWhU0m0lq0L7H2scXgIixQiW7wyVXA4s0x+01FNQtC
	bkHk/qK7q5Xkdg5ZfdtiiNO7N/LeZxS07jmuUZk6FeOan+J6UlNzs/ffTXv9LkRa5f8UvBoCgg1Bb
	v25kc40vK32Wnqw550vWQbGiqzwR7xmkLLH2tzKpTs9atoHFNjvh8WMOsAeg98IfoJtFP40UL2ZBe
	FT34Ajsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tclz6-0000000502b-1A7u;
	Tue, 28 Jan 2025 13:50:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tclxm-00000004zvG-2zwX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 13:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yEmFa+/qd3u+ok4UR2h6fx/Z5JLxm/bEDrf24WuzN2s=; b=Xw3lOHtQvDhLs/svevG9AM/IFX
	DhAAsE7AbxXPYOdj8yAuflscQ/Nlx0sLKdGSZR4X8y95DXU6pGRQPOx2vi3vdBMYV+NxBPc0pRVwq
	7aqUuCbiG0LKhNxVxlVc6oPMrm444u87/9y3325aNXFkZ0vjAhOjPWvS7rgGxqPyB4/4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tclxR-008rO1-KR; Tue, 28 Jan 2025 14:48:49 +0100
Date: Tue, 28 Jan 2025 14:48:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, alim.akhtar@samsung.com,
	linux-fsd@tesla.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, alexandre.torgue@foss.st.com,
	peppe.cavallaro@st.com, joabreu@synopsys.com, rcsekar@samsung.com,
	ssiddha@tesla.com, jayati.sahu@samsung.com,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: Re: [PATCH v5 2/4] net: stmmac: dwc-qos: Add FSD EQoS support
Message-ID: <63e64aa6-d018-4e45-acc7-f9d88a7db60f@lunn.ch>
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102732epcas5p4618e808063ffa992b476f03f7098d991@epcas5p4.samsung.com>
 <20250128102558.22459-3-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128102558.22459-3-swathi.ks@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_054910_754837_4792D3D5 
X-CRM114-Status: GOOD (  12.26  )
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

> +static int fsd_clks_endisable(void *priv, bool enabled)
> +{
> +	struct fsd_eqos_plat_data *plat = priv;
> +
> +	if (enabled) {
> +		return clk_bulk_prepare_enable(plat->num_clks, plat->clks);
> +	} else {
> +		clk_bulk_disable_unprepare(plat->num_clks, plat->clks);
> +		return 0;
> +	}
> +}
> +
> +static int fsd_eqos_probe(struct platform_device *pdev,
> +			  struct plat_stmmacenet_data *data,
> +			  struct stmmac_resources *res)
> +{
> +	struct fsd_eqos_plat_data *priv_plat;
> +	struct clk *rx1 = NULL;
> +	struct clk *rx2 = NULL;
> +	int ret = 0;
> +
> +	priv_plat = devm_kzalloc(&pdev->dev, sizeof(*priv_plat), GFP_KERNEL);
> +	if (!priv_plat)
> +		return -ENOMEM;
> +
> +	priv_plat->dev = &pdev->dev;
> +
> +	ret = devm_clk_bulk_get_all(&pdev->dev, &priv_plat->clks);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "No clocks available\n");
> +
> +	priv_plat->num_clks = ret;

It looks like you should be able to share all the clk_bulk code with
tegra_eqos_probe(). The stmmac driver suffers from lots of cut/paste
code with no consolidation. You can at least not make the tegra code
worse by doing a little refactoring.

	Andrew

