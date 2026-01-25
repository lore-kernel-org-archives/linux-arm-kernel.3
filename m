Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2DBD7237B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rS+udoQ5F3BQRBQHE4NZ3HhS+VP40smiqxBwimorpnw=; b=WTEwonKciIKxPKJdprpH6y/nEp
	YTR39/aJo+94MHzpAgBCDHc6JXt2NmgsyJxoYXA0NsTl1w/oeVficRxiagXbrWiKy7eyZoBXQLrgd
	SBrX4Nj7hWznJj9D+WNhcb7vDxwXrIp1jUd5hcvQex1rmZSN4NocdX/E+Q8eT4jkWwy04v4nmCBQh
	En7U9nJAzyRX/h+azKsBmvH53U8LCRhF2AjUPDAU3Ev7QypyISs7U2aaG01fcYd9RyeRSQ4NS7gmr
	YTQceLw7KFZLue9xAGphqpekbPSpuunuq65ZqXkEfMPsrhvzIs/v5U6S1HEmUOqVdDkyk64p3DBki
	Wd0JU8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8N1-0000000BYm0-0bes;
	Sun, 25 Jan 2026 22:14:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8Mz-0000000BYlu-3kWy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 321A4600C3;
	Sun, 25 Jan 2026 22:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED55EC4CEF1;
	Sun, 25 Jan 2026 22:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769379247;
	bh=iZlQMjT87MAKVDpNXN3PnkGFzV2iu5aW29TTIBiz4LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J6akJgre43BvTHV/oVpuun6heVrwS1teSyBWH6FuCNcPiuDiEFO1PgpjDWyLdqP8N
	 QOsluSCZROsPBl5eVixeH74A1gNrAVod6jue+z9olPAMdcM6v7L2iSrq5h1cH8v+52
	 6XUIosoZiM4ohYRhYXi2143dPv+iUUh2syQRhIbAJx5NOkLnNCVfklF1UNtAqQ50kS
	 D6bIljup//yXFN3doJv8I4aRgDuvNMdEjZJKQ8s4WFqcLSzfu59UkUrrqWYXtIuQtr
	 SMQP64HzuOLGlgr2mhNknQFPUmOw+okgeif9F50vg+UrLJCvKw8pS3r53domFjqAI4
	 x9N3q6FO5pbdA==
From: Jakub Kicinski <kuba@kernel.org>
To: jan.petrous@oss.nxp.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	robh@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	mcoquelin.stm32@gmail.com,
	kernel@pengutronix.de,
	pabeni@redhat.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	chester62515@gmail.com,
	s32@nxp.com,
	linux-kernel@vger.kernel.org,
	ghennadi.procopciuc@oss.nxp.com,
	festevam@gmail.com,
	alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	krzk+dt@kernel.org,
	mbrugger@suse.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [v3,4/4] stmmac: s32: enable support for Multi-IRQ mode
Date: Sun, 25 Jan 2026 14:14:05 -0800
Message-ID: <20260125221405.3395497-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123-dwmac_multi_irq-v3-4-cc53f2be8961@oss.nxp.com>
References: <20260123-dwmac_multi_irq-v3-4-cc53f2be8961@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
stmmac: s32: enable support for Multi-IRQ mode

This patch enables Multi-IRQ mode for the S32 DWMAC driver when both
multi-queue and per-queue IRQs are configured. The driver now selects
between Multi-IRQ and MAC IRQ modes based on device tree configuration.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index 5a485ee98fa7..342091045714 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c

[ ... ]

> @@ -149,6 +149,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>  	plat->core_type = DWMAC_CORE_GMAC4;
>  	plat->pmt = 1;
>  	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> +
> +	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
> +	if (plat->rx_queues_to_use > 1 &&
> +	    (res.rx_irq[0] >= 0 || res.tx_irq[0] >= 0)) {
                        ^^^^            ^^^^

Should these checks be "> 0" instead of ">= 0"?

stmmac_get_platform_resources() initializes the res structure with
memset(0), then only writes positive IRQ values when per-queue IRQs are
found in the device tree. If no "rx-queue-0" or "tx-queue-0" interrupt
names are defined, rx_irq[0] and tx_irq[0] remain 0 from the memset.

Since 0 >= 0 evaluates to true, this condition will enable Multi-IRQ
mode even when no per-queue IRQs are available. The commit message states
that "queue based IRQs are set" is a prerequisite, but the current check
does not properly verify this.

> +		plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> +		dev_info(dev, "Multi-IRQ mode (per queue IRQ) selected\n");

[ ... ]
-- 
pw-bot: cr

