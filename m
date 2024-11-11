Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0812D2E9FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 13:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZMvE+JOERrSbOJvam4QBOmbam6IavzIjHWjZH5t6aI=; b=Ifin08V9s2dz3MWmlHi3/+XzZC
	UgfmzcOz1f4xhZ6rTWwX6TYhuGlQEEqntT+Fi6wMoTD98BtCb5CeQW9ty01sk8t6CsynlwrXlin6X
	2rjrjvKeKw9wouofsIxwGCBP/xxf8aokFEXIH0m5EWxO2y3jgelfqfNz2vFENN2ytl5ehTG2k25Xe
	LF26ir9MfQB+3zX48xXhV+TFv9AtlsgU5XDC0aV+EhVErp23vsG/NsNJ/VBKLrveVP+KmJeEVZYD7
	mkx639dUr55hwimZcKqLstgJsGKZnMfZpkrfNPBxtE3xcxD0+mR/srJyMyp1X6Frl4MTB/4IggIlr
	pWrteRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUqE-00000000Dvo-395O;
	Mon, 11 Nov 2024 13:52:31 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUoR-00000000Dhv-1uWZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 13:50:40 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 58C102010CF;
	Mon, 11 Nov 2024 14:50:35 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 52B662010C6;
	Mon, 11 Nov 2024 14:50:35 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 10FFE20326;
	Mon, 11 Nov 2024 14:50:35 +0100 (CET)
Date: Mon, 11 Nov 2024 14:50:35 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v4 05/16] net: dwmac-dwc-qos-eth: Use helper rgmii_clock
Message-ID: <ZzILq99H/Zj4I/6Q@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>
 <20241105134206.GE4507@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105134206.GE4507@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_055039_781915_EFA0C4B6 
X-CRM114-Status: GOOD (  20.54  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 05, 2024 at 01:42:06PM +0000, Simon Horman wrote:
> On Mon, Oct 28, 2024 at 09:24:47PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > Utilize a new helper function rgmii_clock().
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> > index ec924c6c76c6..5080891c33e0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> > @@ -181,24 +181,19 @@ static void dwc_qos_remove(struct platform_device *pdev)
> >  static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> >  {
> >  	struct tegra_eqos *eqos = priv;
> > -	unsigned long rate = 125000000;
> > +	long rate = 125000000;
> >  	bool needs_calibration = false;
> >  	u32 value;
> >  	int err;
> 
> Hi Jan,
> 
> As it seems that there will be another revision anyway,
> please update the above so that the local variable declarations
> are in reverse xmas tree order - longest line to shortest.
> 
> Likewise in s32_dwmac_probe() in the patch
> "net: stmmac: dwmac-s32: add basic NXP S32G/S32R glue driver".
> 

Hi Simon,
thanks for review, I will add those formating fixes in v5.

BR.
/Jan

