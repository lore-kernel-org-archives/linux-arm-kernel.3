Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DA0D2F023
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xf8RROWmvCfyZlwoPL04txmW2w3MORmkL6T8EP6k5k=; b=GJN+RKo8j7Cb+PPa0ZCtvN+zYD
	MKO6N78GlMdCWzVM/ahk4XTccM/2FuPmUBZEoiM+Xnx1ljeYrZu3n9c4gya9U4Dv7A9PlTZDlsFDX
	QXImrcbbhZsHrPDCz6nOEnjubClN5CXcPqYz45PWf6QeFuasCIm43v3ABo+bzEftkq+OQppc5WRLm
	Uzaq+uAASvp8wKZnlx4BiWTvYAw1/jHLjBQ5/WlOpcxcRs3tfsZQhR6McgGCUj8iJWCHqQdQwXuDq
	8EljEbpZQXg1jJFaaORUQuDM6SqP5LxhEtK43UCMuQePWdjtYV7h5oRfpvP+u7MBg0CPSoGDLrpoD
	FRFQr0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkinp-0000000EI1Y-2AcI;
	Tue, 27 Jan 2026 13:08:17 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkinn-0000000EI1B-1YKD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:08:16 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 76A9020295F;
	Tue, 27 Jan 2026 14:08:13 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5C3EA20295E;
	Tue, 27 Jan 2026 14:08:13 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A168D20405;
	Tue, 27 Jan 2026 14:08:12 +0100 (CET)
Date: Tue, 27 Jan 2026 14:08:13 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: robh@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de,
	mcoquelin.stm32@gmail.com, kernel@pengutronix.de, pabeni@redhat.com,
	edumazet@google.com, andrew+netdev@lunn.ch, chester62515@gmail.com,
	s32@nxp.com, linux-kernel@vger.kernel.org,
	ghennadi.procopciuc@oss.nxp.com, festevam@gmail.com,
	alexandre.torgue@foss.st.com, davem@davemloft.net,
	krzk+dt@kernel.org, mbrugger@suse.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [v3,4/4] stmmac: s32: enable support for Multi-IRQ mode
Message-ID: <aXi4vRvcCa+8LSKt@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260123-dwmac_multi_irq-v3-4-cc53f2be8961@oss.nxp.com>
 <20260125221405.3395497-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125221405.3395497-1-kuba@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_050815_543601_329695FA 
X-CRM114-Status: GOOD (  19.80  )
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

On Sun, Jan 25, 2026 at 02:14:05PM -0800, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> stmmac: s32: enable support for Multi-IRQ mode
> 
> This patch enables Multi-IRQ mode for the S32 DWMAC driver when both
> multi-queue and per-queue IRQs are configured. The driver now selects
> between Multi-IRQ and MAC IRQ modes based on device tree configuration.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > index 5a485ee98fa7..342091045714 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> 
> [ ... ]
> 
> > @@ -149,6 +149,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
> >  	plat->core_type = DWMAC_CORE_GMAC4;
> >  	plat->pmt = 1;
> >  	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> > +
> > +	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
> > +	if (plat->rx_queues_to_use > 1 &&
> > +	    (res.rx_irq[0] >= 0 || res.tx_irq[0] >= 0)) {
>                         ^^^^            ^^^^
> 
> Should these checks be "> 0" instead of ">= 0"?
> 
> stmmac_get_platform_resources() initializes the res structure with
> memset(0), then only writes positive IRQ values when per-queue IRQs are
> found in the device tree. If no "rx-queue-0" or "tx-queue-0" interrupt
> names are defined, rx_irq[0] and tx_irq[0] remain 0 from the memset.

The AI is wrong on this statesment. The loop reading IRQs from DT
in stmmac_get_platform_resources() returns also negative value
for missed queue IRQ line. And this is used as flag if multi-IRQ
can be enabled or not.

But I must agree that the comparition shall not include 0 as valid
value for IRQ, so I will fix it in v4.

Thanks.
/Jan

