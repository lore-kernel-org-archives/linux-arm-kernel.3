Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8107DD2B925
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOyPSI5RgjOHGp9BgmM6DSt4tqvTEJQ8SxL92u68+eA=; b=xUJAnV/SZBdVU1f58ro7COUWPP
	DvMRX9FqSv81VCgqOvUq3GgZjqpvDCGcztD/oSWf+4i42VXh1k6FqoIajWsVz9d6EzKrTAbkBzPRI
	YSm9bH8bBvNRg9CcmZXazLNmsqMEG2bArlSNIL3eoN46N7xeZkKex7hA2nCWcu13atSIfrIgeYsxM
	OOModA1IqzeAoGVmwTk1bph1arLaQ+4/a34T2xHxKOmjs0+RXpjc8a65qYoGxYMOcJgDA0euCWRP6
	7kgViEP3dp5QvFaqP15W5t2o1qr+BMf7zdH2so+vkej+M7oodlgvM7PAC5Sf254xhpmLYRHAmoWpO
	oYZyPeFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jqv-0000000HACU-2k3f;
	Tue, 05 Nov 2024 13:44:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jp2-0000000HA1r-1KXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:42:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D8CA4A4321C;
	Tue,  5 Nov 2024 13:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388F7C4CED0;
	Tue,  5 Nov 2024 13:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730814134;
	bh=uBjQq4vty/Kv54JBAzOzZbTnfWxAOZe08zjGZl2RRng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWpB+y9GcHXvT6oCWVyQ/KVxxHgXagZzJhtB/rfYNtMNty1iyCdFcWBawsmHe2GHs
	 /oTty3u03wYvChtzTrj7ABQRgGmKSeSEsg6PKeVxsM63iUvWYSVjrSRx7oPzvLWrE4
	 3R2OTW65d/wL7l3BXcIsIbnD4Ct6ssJICt7sm86tunxRKeLQeDP5WBxMpuvOGSwm1k
	 IhdX4TOeybsLfPve1laLWr9W7bkOTJQOtdVBiQZSdidZtjMdUySDM4TmnGtJumra6/
	 pMWHB1C7E4ZJCpuCmZKBJ3X8UvXUyG1o7TgGQxrl5n0halO9aMvptdfoXz9azqoEx0
	 H7ztw+sM68i3Q==
Date: Tue, 5 Nov 2024 13:42:06 +0000
From: Simon Horman <horms@kernel.org>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v4 05/16] net: dwmac-dwc-qos-eth: Use helper rgmii_clock
Message-ID: <20241105134206.GE4507@kernel.org>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_054216_513402_E6E5BB23 
X-CRM114-Status: GOOD (  17.23  )
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

On Mon, Oct 28, 2024 at 09:24:47PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index ec924c6c76c6..5080891c33e0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -181,24 +181,19 @@ static void dwc_qos_remove(struct platform_device *pdev)
>  static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct tegra_eqos *eqos = priv;
> -	unsigned long rate = 125000000;
> +	long rate = 125000000;
>  	bool needs_calibration = false;
>  	u32 value;
>  	int err;

Hi Jan,

As it seems that there will be another revision anyway,
please update the above so that the local variable declarations
are in reverse xmas tree order - longest line to shortest.

Likewise in s32_dwmac_probe() in the patch
"net: stmmac: dwmac-s32: add basic NXP S32G/S32R glue driver".

...

