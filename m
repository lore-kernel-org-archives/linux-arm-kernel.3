Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E194CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gy/Z85EpA6PtugEQo7tOjG3wD8Ws/VL623KxkN4uUxg=; b=HVnzdjPLApAZnM4lm4T4QoKTWL
	uNRzNJ78Cc6fw6Ru3vl9+wMCOXKJAUJ3wanQGnw/BF0Pffk4g/DGWU8Hqyxql7cePC6EolIx5VkFD
	0IsP3P+P+DZxDf0YQk14qKCCaHZu+5H5X3CMgZQPOvz/WeJeIZWqhDxixmNBHCRQvo1ORqI/AjSPi
	UxKUe7cPclVqQcippSTkv6omwLxDp2r7HDLa0A/gvna91nEEb/o3G8Z14QrdqWXKQNM4aDsDac7zT
	Z070jJihuGa9I3DRlPdaKEJl2jAy+ihTJ/tSjRAa9Mrxhp+VNqmhmyBeGwjUrZr+m2977ni0a32Dv
	kBR0grOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIFw-00000000k4B-2XfI;
	Thu, 18 Sep 2025 17:17:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIFt-00000000k2b-06oO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 17:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gy/Z85EpA6PtugEQo7tOjG3wD8Ws/VL623KxkN4uUxg=; b=eCd8PvGiIcC61VFrTKq+rfWTo4
	gXilCPqrrdDWsaBvaiItkZCGj7Q1Za0o8TQFPU3zmt5Kt4H8rpVqqWNoU/LIZ8BeatYHkJI+w5DsC
	IhX/tepsPjuCWaV5amxVMQX+HvAQZexJwq9qOAimbFI7GgaIQovNbXow32YnHE//WnlH67UPT9+4x
	L4oyXn8ciroToLCc5xN8Gs648B02kcw759/Kr1ONF2jXe123CVwvTL44+O26XGC2rfrfMqrofk/AM
	aIG3nx5MfhxEURDQ1stujVejjeWdTFVEdsHskp4QxNDPRsVd8WdCKAAGFOLFfqRJFq6r8plyJaERq
	rNd8F/aQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51190)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uzIFS-000000001Vp-1DNL;
	Thu, 18 Sep 2025 18:16:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uzIFL-000000001Lm-0Tdb;
	Thu, 18 Sep 2025 18:16:39 +0100
Date: Thu, 18 Sep 2025 18:16:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: weishangjuan@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	yong.liang.choong@linux.intel.com, anthony.l.nguyen@intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, jan.petrous@oss.nxp.com,
	jszhang@kernel.org, inochiama@gmail.com, 0x1207@gmail.com,
	boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v7 2/2] ethernet: eswin: Add eic7700 ethernet driver
Message-ID: <aMw-dgNiXgPeqeSz@shell.armlinux.org.uk>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918090026.3280-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918090026.3280-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_101713_074372_3C923199 
X-CRM114-Status: GOOD (  19.17  )
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

On Thu, Sep 18, 2025 at 05:00:26PM +0800, weishangjuan@eswincomputing.com wrote:
> +	plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
> +	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> +	plat_dat->bsp_priv = dwc_priv;
> +	plat_dat->clks_config = eic7700_clks_config;
> +	dwc_priv->plat_dat = plat_dat;
> +
> +	ret = eic7700_clks_config(dwc_priv, true);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				ret,
> +				"error enable clock\n");
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> +	if (ret) {
> +		eic7700_clks_config(dwc_priv, false);
> +		return dev_err_probe(&pdev->dev,
> +				ret,
> +				"Failed to driver probe\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static void eic7700_dwmac_remove(struct platform_device *pdev)
> +{
> +	struct eic7700_qos_priv *dwc_priv = get_stmmac_bsp_priv(&pdev->dev);
> +
> +	stmmac_pltfr_remove(pdev);
> +	eic7700_clks_config(dwc_priv, false);

It would be nice to see the above code cleaned up like I did for all
the other stmmac glue drivers recently.

However, this is not to say this shouldn't be merged - but please
consider this if you do another rework of these patches, if not as
a follow-up patch.

Essentially, you can use devm_stmmac_pltfm_probe(), populate the
plat_dat->init() and plat_dat->exit() methods to call the
clks_config function, but as you don't want these methods to be
called during suspend/resume (because plat_dat->clks_config() is
already called there), provide empty plat_dat->suspend() and
plat_dat->resume() methods.

Bonus points if you include a patch which provides this functionality
as library functions in stmmac_platform.c which can be used to
initialise ->init() and ->exit() for this behaviour, and check other
stmmac platform glue drivers to see if they would benefit from using
these.

Of course, it would be nice not to have to go to the extent of
adding empty functions for ->suspend() and ->resume(), but stmmac has
a lot of weirdo history, and there was no easy way to maintain
compatibility without doing that when I added these two new methods.

Lastly, please consider using "net: stmmac: <shortened-glue-name>: blah"
as the subject so there's a consistent style for stmmac patches.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

