Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55D9EA4FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+E9U1RZCokT+0vJMPSWAtnPtlZgN5NxMnzGX5ByfkxE=; b=jDtVd4X8YTY1Mw8gvwEUb4Bq6K
	f/ZcK//locTmS3accP4SYuRobB/VFPIqPh2fE882HelN5og3PPGKSHgpVrP+YDOCUo6ehZKGQWrWX
	QYjr/7aQRjI2nKXkEOw8LltWMIlDPm7tH0PDKYk14lwd2M65QXGOxOQdvFEh24OfW5/zfU7HSaR2Z
	r8bEM1QcarpqUJ31UWgVu863aDUFwMFSp6zbQFGpSzrn2ea4Ti4SF/BCwkqivf5f11bYCN0gRIBhS
	YWW9gZBl4IVmcuK+I5PkkBQxhXpXCjBSpxVEcqxrxShx+8muvhG71T0o/rmV/WflV/KL3dPfCEtM0
	5PnRFhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW5J-00000000NC2-0vZM;
	Mon, 23 Feb 2026 13:34:49 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW5G-00000000NBZ-1fDP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:34:47 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 82BD71A14BA;
	Mon, 23 Feb 2026 14:34:44 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6B0901A11FC;
	Mon, 23 Feb 2026 14:34:44 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id BBBA1202AE;
	Mon, 23 Feb 2026 14:34:43 +0100 (CET)
Date: Mon, 23 Feb 2026 14:34:44 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: edumazet@google.com, shawnguo@kernel.org, kernel@pengutronix.de,
	krzk+dt@kernel.org, robh@kernel.org, andrew+netdev@lunn.ch,
	mbrugger@suse.com, davem@davemloft.net, pabeni@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com, s.hauer@pengutronix.de,
	conor+dt@kernel.org, chester62515@gmail.com, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, ghennadi.procopciuc@oss.nxp.com,
	devicetree@vger.kernel.org, alexandre.torgue@foss.st.com
Subject: Re: [v4,4/4] stmmac: s32: enable support for Multi-IRQ mode
Message-ID: <aZxXdNQGRcG6LeHS@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260128-dwmac_multi_irq-v4-4-82fa34fcf2f2@oss.nxp.com>
 <20260129051004.375682-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129051004.375682-1-kuba@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053446_591944_6C21C49C 
X-CRM114-Status: GOOD (  14.38  )
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

On Wed, Jan 28, 2026 at 09:10:04PM -0800, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> stmmac: s32: enable support for Multi-IRQ mode
> 
> Enables Multi-IRQ mode for the S32 GMAC driver when per-queue IRQs
> are present and more than one RX queue is configured.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > index 5a485ee98fa7..37a5b7b46973 100644
> 
> [ ... ]
> 
> > @@ -149,6 +149,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
> >  	plat->core_type = DWMAC_CORE_GMAC4;
> >  	plat->pmt = 1;
> >  	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> > +
> > +	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
>                                                    ^^^^^^^^^^
> 
> This isn't a bug, but "symetrical" should be "symmetrical".

I will fix it in v5.

Thanks.
/Jan

