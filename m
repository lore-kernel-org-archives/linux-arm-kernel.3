Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC836D262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgNqRczlHaPOLQzi/r6Lld5ff27LI+TpHcQLhX7OfF0=; b=oQWUH+1E30cll2NM1twjEOtQYa
	GcRwlwcevWmdv7+5x8yT4MpglhlzO2k1e9cmsuAnBz00TnjXdUR5qFagdxU8bLSsFUfd4CO2h9R+Y
	w37NKwoXCp7YfdhJtbpMyOl8jxyVtKRDebmWbmB4lTtG4yRISfK9GbmgkVCd6obr9CtsjDmBVqqTH
	vNceXMxjBy7cybSAzOyD6fnng/a07srOTcOhL5rNEBID+cTHkDwEuMXWirIWAUwzRMdVI52/9b/kQ
	4H8UiBDPbcgG/Ie5/8rTdmG8PZ0kXRrI8SRzFpWTxJNmRBeDAZpt48hMSAa5lHtApG+4qBuFjc9Qe
	UykLPOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viStc-000000052Fg-28p5;
	Wed, 21 Jan 2026 07:44:56 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viStZ-000000052FD-3TRy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:44:55 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AAE9D200D44;
	Wed, 21 Jan 2026 08:44:49 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 93A1B200D2C;
	Wed, 21 Jan 2026 08:44:49 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 00D46202C4;
	Wed, 21 Jan 2026 08:44:49 +0100 (CET)
Date: Wed, 21 Jan 2026 08:44:49 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] net: stmmac: platform: read channels irq
Message-ID: <aXCD8US9KQR4lq9W@lsv051416.swis.nl-cdc01.nxp.com>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
 <20251214-dwmac_multi_irq-v1-1-36562ab0e9f7@oss.nxp.com>
 <b9c8580f-e615-4eaa-8878-2fb8d888c0aa@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9c8580f-e615-4eaa-8878-2fb8d888c0aa@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_234453_998998_8571E2CC 
X-CRM114-Status: GOOD (  21.16  )
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

On Sun, Dec 14, 2025 at 11:30:43PM +0100, Andrew Lunn wrote:
> On Sun, Dec 14, 2025 at 11:15:37PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > Read IRQ resources for all channels, to allow multi IRQ mode
> > for platform glue drivers.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 38 +++++++++++++++++++++-
> >  1 file changed, 37 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 8979a50b5507..29e40253bdfe 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -700,6 +700,9 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
> >  int stmmac_get_platform_resources(struct platform_device *pdev,
> >  				  struct stmmac_resources *stmmac_res)
> >  {
> > +	int i;
> > +	char name[8];
> 
> Reverse Christmas tree please.
> 

Fixed in v2.

> >  	memset(stmmac_res, 0, sizeof(*stmmac_res));
> >  
> >  	/* Get IRQ information early to have an ability to ask for deferred
> > @@ -743,7 +746,40 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
> >  
> >  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
> >  
> > -	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> > +	if (IS_ERR(stmmac_res->addr))
> > +		return PTR_ERR(stmmac_res->addr);
> > +
> > +	/* RX channels irq */
> > +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> > +		scnprintf(name, 8, "rx-queue-%d", i);
> 
> It would be better to use sizeof(name), not 8.
> 
> Also, 'rx-queue-' is 9 characters. So i don't see how this can
> actually work?
> 

That is true. My fault, I accidentally pushed incorrect version.
Fixed in v2.

Thanks.
/Jan

