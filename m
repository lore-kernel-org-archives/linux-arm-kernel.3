Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32D7D63936
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K94T6m1k9qmaYKauDWuFgz3XaEb4sXwDCFvcRQqnAE8=; b=TZ6tsm7roGS5Ra0xEQ543UbDKA
	oanYWsRz4gIQiiZLZtRW5+prXYI7ZlFzZVqsY+24zsx+daWQvr919NgFWUKxIvQQtetXOvtsMzTxD
	Brb7TdIMMEPjfIQLY0nmQRMohPbj9zDDi5+WBDhSlQI2HuggzJSg7iASD+TIXPofq30/QjLypSwRv
	RlbHSuYe6VEAZRUttAelhzeWrBnNZ4gJwoFppSofA9ucVZGiLBrvbnMOQNqGfEUQA7AqVKtuaO+RP
	zFdatOkgwlsDp+gKR9b6TCjJaYdiwF06Z3ttUHGz6rNt58Z2fsuI5anXed13gyX4wZOMzGJWqQEg/
	YaCFNFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkKI-0000000FMqX-3dog;
	Wed, 20 Nov 2024 13:00:58 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkJK-0000000FMk3-0acG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 12:59:59 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BC7771A01D3;
	Wed, 20 Nov 2024 13:59:56 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AF1A01A01C6;
	Wed, 20 Nov 2024 13:59:56 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6EBB3202E4;
	Wed, 20 Nov 2024 13:59:56 +0100 (CET)
Date: Wed, 20 Nov 2024 13:59:56 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH v5 16/16] net: stmmac: platform: Fix PTP clock rate
 reading
Message-ID: <Zz3dTNCb2/I0iDXV@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
 <ZzzGO5zgDvIK6JJ_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzzGO5zgDvIK6JJ_@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_045958_445179_18B9D815 
X-CRM114-Status: GOOD (  28.38  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 05:09:15PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 19, 2024 at 04:00:22PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > The stmmac driver supports many vendors SoCs using Synopsys-licensed
> > Ethernet controller IP. Most of these vendors reuse the stmmac_platform
> > codebase, which has a potential PTP clock initialization issue.
> > The PTP clock rate reading might require ungating what is not provided.
> > 
> > Fix the PTP clock initialization by enabling it immediately.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index b1e4df1a86a0..db3e8ef4fc3a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -632,7 +632,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> >  	clk_prepare_enable(plat->pclk);
> >  
> >  	/* Fall-back to main clock in case of no PTP ref is passed */
> > -	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
> > +	plat->clk_ptp_ref = devm_clk_get_enabled(&pdev->dev, "ptp_ref");
> >  	if (IS_ERR(plat->clk_ptp_ref)) {
> >  		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
> >  		plat->clk_ptp_ref = NULL;
> 
> Looking at where the driver makes use of clk_ptp_ref, it currently
> prepares and enables this clock via stmmac_open(), disables and
> unprepares via stmmac_release().
> 
> There could be a platform where this is being used as a power saving
> measure, and replacing devm_clk_get() with devm_clk_get_enabled() will
> defeat that.
> 
> I would suggest that if you need the clock to be enabled in order to
> get its rate, then the call to clk_get_rate() should have the
> enable/disable around it to allow these other sites to work as they
> have done.
> 
> Alternatively, we may take the view that the power saving is not
> necessary, or stopping the clock is not a good idea (loss of time
> in the 1588 block?) so the above changed would be sensible but only
> if the clk_prepare_enable() and clk_disable_unprepare() calls on
> this particular clock are also removed.
> 
> I can't say which is the correct way forward.
> 

For me it looks more conservative way to use first option = enclose
the clk_get_rate() with clk_prepare_enable() and clk_disable_unprepare()
as this don't change the PTP clock status for other glue drivers.

BR.
/Jan

