Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC33D68BEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4q3nR9c4FLOvWXyixuO6uUYLfPpjbnCGfPGRVx1GhG4=; b=ZS5BtnD0NXWRMLZTe8fnAsw7Dr
	SFo8EsX8RG6v2T9/4mdx9mRAqnOf91zF5WBKcc9r4HlCrMzeRIFfWZs9V66TyTk5N8nHNthNjGsTR
	4OKf9lU8B44wz1IzB5lbn0898OjDmW3lssoxCh/Aqy8e/O3E2D4bTCNik2mCXI8EhYkM1W3qFQgM5
	WUOUptcDKXSYJsXLzgSSSSjFT9xidHN0alZ9QUmbKixpKUJLZLQvpUoBZ3vDUQY1cg1KSxnpS5N6e
	LT7EOpbiCP1V6GH978QgC6tE3PRJAncynTyGeHc5xAc7LGzZ7oKk5QRD3aLJQl784Zlh6a5UKvdMv
	8U7Nv4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tChNe-00000007VZM-3zCM;
	Sun, 17 Nov 2024 15:40:07 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tChMi-00000007VQP-2ztX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 15:39:10 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 604521A033D;
	Sun, 17 Nov 2024 16:39:05 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5302A1A0018;
	Sun, 17 Nov 2024 16:39:05 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0CBCC203CE;
	Sun, 17 Nov 2024 16:39:05 +0100 (CET)
Date: Sun, 17 Nov 2024 16:39:05 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 16/16] net: stmmac: dwmac-s32: Read PTP clock rate
 when ready
Message-ID: <ZzoOGdlbQXQVxPkv@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-16-03618f10e3e2@oss.nxp.com>
 <9154cc5f-a330-4f6d-b161-827e64231e35@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9154cc5f-a330-4f6d-b161-827e64231e35@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_073909_013531_CD44D8D8 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Andrei Botila <andrei.botila@nxp.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Oct 29, 2024 at 01:18:43PM +0100, Andrew Lunn wrote:
> On Mon, Oct 28, 2024 at 09:24:58PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > The PTP clock is read by stmmac_platform during DT parse.
> > On S32G/R the clock is not ready and returns 0. Postpone
> > reading of the clock on PTP init.
> 
> This needs more explanation as to why this is a feature, not a bug,
> for the PTP clock.
> 

Thanks for comment. I did a homework and found out the root cause is
using PTP clocks before they are properly enabled. As I understand,
the clocks, especially the composite variant, require preparation and/or
enabling them, what is not managed correctly for PTP clocks when
stmmac_platform is used. In this case, the PTP clock value is read this way:

   stmmac_probe_config_dt:
   // https://github.com/torvalds/linux/blob/4a5df37964673effcd9f84041f7423206a5ae5f2/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c#L634

	/* Fall-back to main clock in case of no PTP ref is passed */
	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
	if (IS_ERR(plat->clk_ptp_ref)) {
		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
		plat->clk_ptp_ref = NULL;
		dev_info(&pdev->dev, "PTP uses main clock\n");
	} else {
		plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
	}

If I change getter to enabled getter:
	plat->clk_ptp_ref = devm_clk_get_enabled(&pdev->dev, "ptp_ref");

The driver got valid rate and the patch is not needed anymore.

So, if I didn't miss something, it seems like I have to replace the current
patch with one fixing clk getter.

BR.
/Jan

