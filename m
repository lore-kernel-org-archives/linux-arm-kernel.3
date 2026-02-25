Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28477EFD214
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0T6AUZmkxUO1rcSjAplCIwydwIsbIsoTIfYpppRWx8=; b=HtLkhr/BDNojqk8aMxJk1LciAn
	+xoUpsTJ20ISpnj+1u3XC0/XO8pjyrvLgIU6C509s7x0M5NbNNBBZ+P76ySyVz9GAtre53bLnR5ZL
	KUdtyFL0/4c5A5fa+q1Qkiy2iTuBTCiHV7xHYADQXrDzvnwGkR2vuy1iMhxEpjVSAS5plpJKF1mw8
	ufe1Zmwu6myNLeQ46WoZtL5YkHarJ3sKAVCi9F8pT4icAUUm6abSqX6hSJfENYiBVvBs6O+kA296U
	pB+rHMe1nJA90Ef+0NaiSE7yOHMX/OEYvL3zKNeGgX+pCskb7tlbvKVDsXBLZPsoT3WrPrqGBT/u/
	Dp5TYOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB94-00000003gMc-0fKv;
	Wed, 25 Feb 2026 09:25:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB91-00000003gJN-0KAE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF36F40840;
	Wed, 25 Feb 2026 09:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EE0C2BC86;
	Wed, 25 Feb 2026 09:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772011522;
	bh=3F7Z5Pfj8Pt/optjPDV9G8Xvyryo9NuHarxp+2EdQZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uJXxxlHBV0DRrSf9EXAEusXlJPeHnoT0EXFvLsrldQu/5D1nC+cn49GEzCZn5mSbM
	 A/xtGjS6xvWhP74lBLA/DVb/a4R6aeCiawcKj3TaGKNHT/TXw8XSi16nLSzWcQlnis
	 v0m+TCnAHsyPXyt2AknbqUGNEyD6LZYPnXc76KzrSaqQiZhlkwECxt+w/6vM3LLfHp
	 khpI2max/MI8mlIiNJLbDhcnYr2sSLHsuQBluXaRBJHXwNwXKsHHqzTo30n1Yu2Ss+
	 qSurO9g1H5v2Zq3H06S6xZDG61BdabR3sXwIssrYT/w6bZq7HIzDkIaA3SmP20SxVt
	 Lug+csEN4rnXw==
From: Simon Horman <horms@kernel.org>
To: jan.petrous@oss.nxp.com
Cc: Simon Horman <horms@kernel.org>,
	alexandre.torgue@foss.st.com,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	chester62515@gmail.com,
	s.hauer@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	davem@davemloft.net,
	mbrugger@suse.com,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	s32@nxp.com,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	robh@kernel.org,
	kuba@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	ghennadi.procopciuc@oss.nxp.com,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	edumazet@google.com,
	mcoquelin.stm32@gmail.com,
	imx@lists.linux.dev
Subject: Re: [v5,4/4] stmmac: s32: enable support for Multi-IRQ mode
Date: Wed, 25 Feb 2026 09:25:13 +0000
Message-ID: <20260225092513.174261-1-horms@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223-dwmac_multi_irq-v5-4-8fc699a5fac4@oss.nxp.com>
References: <20260223-dwmac_multi_irq-v5-4-8fc699a5fac4@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_012523_796957_78A46AE0 
X-CRM114-Status: GOOD (  16.25  )
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

This commit enables Multi-IRQ mode for the S32 DWMAC driver, allowing
per-queue IRQs for improved performance. The driver checks for multiple
queues and per-queue IRQs, enabling multi-IRQ mode when both are present.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index af594a096676..4aad7077c9d6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c

[ ... ]

> @@ -165,6 +165,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>  	plat->core_type = DWMAC_CORE_GMAC4;
>  	plat->pmt = 1;
>  	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> +
> +	/* Check for multi-IRQ config. Assumption: symmetrical rx/tx queues */
> +	if (plat->rx_queues_to_use > 1 &&
> +	    (res.rx_irq[0] > 0 && res.tx_irq[0] > 0)) {
> +		plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> +		dev_info(dev, "Multi-IRQ mode (per queue IRQs) selected\n");
> +	} else {
> +		dev_info(dev, "MAC IRQ mode selected\n");
> +	}

Does this validation check all queues have IRQs? The condition verifies
only res.rx_irq[0] and res.tx_irq[0] but doesn't confirm that higher
queues have IRQs when rx_queues_to_use > 1.

If a device tree specifies multiple queues but only provides IRQs for
queue 0:

    snps,rx-queues-to-use = <2>;
    interrupt-names = "macirq", "rx-queue-0", "tx-queue-0";
                      /* queue 1 IRQs missing */

The driver would enable STMMAC_FLAG_MULTI_MSI_EN, but later in
stmmac_request_irq_multi_msi() (drivers/net/ethernet/stmicro/stmmac/
stmmac_main.c), queues with rx_irq[i] == 0 are silently skipped:

    for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
        if (priv->rx_irq[i] <= 0)
            continue;  /* queue 1+ skipped, no handler registered */
        ...
    }

This would leave higher-numbered queues with no interrupt handler,
causing packet loss when traffic arrives on those queues.

Would it be safer to validate all queue IRQs before enabling multi-IRQ
mode, or fall back to MAC IRQ mode if any queue IRQ is missing?

> +
>  	plat->rx_fifo_size = 20480;
>  	plat->tx_fifo_size = 20480;

