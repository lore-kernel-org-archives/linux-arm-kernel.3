Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF095CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1uta8p/W5QNqzGp1HZ4zz99/QdMe5/qSC/Dn+nw3nE=; b=HkuUG6k+2NHbSCIyLCuFy/5Z8p
	1ecH4ezqc6pbQaI3m2dACh865/sQvC305J6CHEXN4A/+SSyJ5K0Isml9doSTQcq7Vwty22o+Onw6d
	gViHH4GLQTL9O5OBC4j1t83rZZfzW6y8CzslMqAfXr1rTqalNfZSq/Ix7GdYOhdKbudda02eJG/gu
	oKks5xEroHPb+DwPXRlf30YSB52Ftf30z8VVcqQUkBNkrq8GMPCOLGAkzu2r4iw1QLGgBGA8sJb4/
	4aeT6S+93PB+kNpnbi66h1j9yk5E0sDmhnCEWDlnlpwEWRCcx2A4r6zfDr/QXS5qm7zj7OtR/Y7tL
	ynoKO6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8pE-00000001xxB-2DvO;
	Wed, 29 Oct 2025 16:15:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8pB-00000001xvZ-3dFf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 16:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W1uta8p/W5QNqzGp1HZ4zz99/QdMe5/qSC/Dn+nw3nE=; b=EMxl0AuB+F5NhLkZJJB1QEOz6d
	izBrPIejNaEZTbx1kB9++36hpSVq4VrbjowPsYx+wxYn1n6hWtIB2p5LFEgSEk/losPNx3B0CY8ye
	sCxHCGOBRk+cYdYfJk9L4R3/NETijwSnOr9s4M4h5TtLy+Q3wdwNr7yeJrRKRN49SHAvUE3t2UPDS
	2/uJDN6FCVpX5sQz5b799RklPXywAZOGOzW9PGUHHsIavoD61BRVcRTFi4dwPW6ed0PjSnx/V2gXm
	rQMmufWZRvlV+4WEHLOYcFA5nixNaF4W/UirLbd+QGwTPGcino/bth4BxE6Ag7pzYPwpD0ZV5ryvT
	ZeBJ7pZw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56504)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vE8ow-000000004ci-1h3W;
	Wed, 29 Oct 2025 16:14:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vE8os-000000007eD-12kw;
	Wed, 29 Oct 2025 16:14:42 +0000
Date: Wed, 29 Oct 2025 16:14:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] net: stmmac: socfpga: Agilex5 EMAC platform
 configuration
Message-ID: <aQI9ckiHEybp3c_y@shell.armlinux.org.uk>
References: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
 <20251029-agilex5_ext-v1-1-1931132d77d6@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-agilex5_ext-v1-1-1931132d77d6@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_091502_179432_6D2155B7 
X-CRM114-Status: GOOD (  11.43  )
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

On Wed, Oct 29, 2025 at 04:06:13PM +0800, Rohan G Thomas via B4 Relay wrote:
> +static void socfpga_common_plat_dat(struct socfpga_dwmac *dwmac)
> +{
> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
> +
> +	plat_dat->bsp_priv = dwmac;

Surely this is something which is always done? What's the point in
moving this to a function that always needs to be called from the
implementation specific setup_plat_dat() method?

> +	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
> +	plat_dat->init = socfpga_dwmac_init;
> +	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
> +	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
> +	plat_dat->select_pcs = socfpga_dwmac_select_pcs;

From what I can see in your patch series, these are never changed.
So, I question the value of having this "common_plat_dat"
initialisation function. Why not leave this code in
socfpga_dwmac_probe(), and just move the initialisation of
plat_dat->core_type and plat_dat->riwt_off ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

