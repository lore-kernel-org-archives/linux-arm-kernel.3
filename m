Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07740C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xkn2Uy/nTx5tqruU7A6KwwuqsrJF9NzkXpHgHC1/Z98=; b=jsmkGTiusO7Bo0RRbR15Ym99OC
	3Uc6//aQgatljKUW34DdQIbVdfI6h+TMN40q49g01OVIss9di3+oJV6HYwwKSVMhLHcEFZZqld3Mv
	TKGONJRKBOfwGUt5GzGGXDzX+CY1Eijuh/SQvcarlUeXbsjZebMStTY+ZuXmXlM56H4oLXEYx/xz1
	QDFmQg6BkgGTz3MUC0e4Q/PaPZYjTV3WT+rOPLxoGrv156+gzBxsTf3cUG7RiIfwn8fYwlhhZn07s
	T16UFLQAn/Dw7Um5/i4zMkL5DkK3gcxTZAQ9BpZhn12Os+k+nWro3+TC1c625DvW32E28BfqNNWzT
	wcQyiiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNTj-00000001Btd-2wsY;
	Tue, 04 Feb 2025 18:16:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNQi-00000001BP7-30cn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:13:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4A70A42B86;
	Tue,  4 Feb 2025 18:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9007BC4CEDF;
	Tue,  4 Feb 2025 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738692827;
	bh=Dj4jkBKmFAE3YgshnrDJ3jVrrrueVT1kGYUMcy1Yj58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPf68PZsXMszTHlDPMN4gJh22izWzBAeDTVr+R75uw5SpOCE7nyP7DSBMSD8VBoug
	 xyGPevgIj6fO7uivU6QaxLaepHYCFRk1Ch9w6yIwioDcspIQO7q5BjCe3EVylSpmcQ
	 sr+MfO9gZl2/My2GFjNVU5js/P2aKsmgQxTaKkfRJO4BoeDkDEjgm0vVfUuepplqRg
	 SjR2l9LABZOGAKgfquPBx80QqoSWYfqgWb6oFkD5Dia0KL9HiQqKt0LhVro3k2/B3c
	 b1tDqHuxFaBByQxrJKFuw7o2oIUmYFCigfn6mrJO+YYuIeXBfkGUwhqugC9G4h/bxi
	 4AqqyVo3Yjb/g==
Date: Tue, 4 Feb 2025 18:13:39 +0000
From: Simon Horman <horms@kernel.org>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v6 4/7] stmmac: intel: configure SerDes
 according to the interface mode
Message-ID: <20250204181339.GM234677@kernel.org>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_101348_898386_BF99E63F 
X-CRM114-Status: GOOD (  20.75  )
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

On Tue, Feb 04, 2025 at 02:10:17PM +0800, Choong Yong Liang wrote:
> Intel platform will configure the SerDes through PMC api based on the
> provided interface mode.
> 
> This patch adds several new functions below:-
> - intel_tsn_lane_is_available(): This new function reads FIA lane
>   ownership registers and common lane registers through IPC commands
>   to know which lane the mGbE port is assigned to.
> - intel_config_serdes(): To configure the SerDes based on the assigned
>   lane and latest interface mode, it sends IPC command to the PMC through
>   PMC driver/API. The PMC acts as a proxy for R/W on behalf of the driver.
> - intel_set_reg_access(): Set the register access to the available TSN
>   interface.
> 
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

...

> +static int intel_config_serdes(struct net_device *ndev,
> +			       void *intel_data,
> +			       phy_interface_t interface)
> +{
> +	struct intel_priv_data *intel_priv = intel_data;
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	int ret = 0;
> +
> +	if (!intel_tsn_lane_is_available(ndev, intel_priv)) {
> +		netdev_info(priv->dev,
> +			    "No TSN lane available to set the registers.\n");
> +		goto pmc_read_error;
> +	}
> +
> +	if (intel_priv->pid_modphy == PID_MODPHY1) {
> +		if (interface == PHY_INTERFACE_MODE_2500BASEX) {
> +			ret = intel_set_reg_access(pid_modphy1_2p5g_regs,
> +						   ARRAY_SIZE(pid_modphy1_2p5g_regs));
> +		} else {
> +			ret = intel_set_reg_access(pid_modphy1_1g_regs,
> +						   ARRAY_SIZE(pid_modphy1_1g_regs));
> +		}
> +	} else {
> +		if (interface == PHY_INTERFACE_MODE_2500BASEX) {
> +			ret = intel_set_reg_access(pid_modphy3_2p5g_regs,
> +						   ARRAY_SIZE(pid_modphy3_2p5g_regs));
> +		} else {
> +			ret = intel_set_reg_access(pid_modphy3_1g_regs,
> +						   ARRAY_SIZE(pid_modphy3_1g_regs));
> +		}
> +	}
> +
> +	priv->plat->phy_interface = interface;
> +
> +	if (ret < 0)
> +		goto pmc_read_error;

Perhaps this is an artifact of earlier refactoring,
but the condition above seems to be without meaning
as in either case the code goes directly to pmc_read_error.

> +
> +pmc_read_error:
> +	intel_serdes_powerdown(ndev, intel_priv);
> +	intel_serdes_powerup(ndev, intel_priv);
> +
> +	return ret;
> +}
> +
>  static void common_default_data(struct plat_stmmacenet_data *plat)
>  {
>  	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */

...

