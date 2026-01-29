Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13E2D3569F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvltSTUhn8Annp6QzD2DB/K6kx+704pFW2sPhxHoY3c=; b=o1iD24NgMVc7fIfrJbVTXOMAp3
	k9OxTxdUrzmDjoIUzT9HSt7L3yNeO8k25E1trV7k/82D/CcXuKTvgdfq8Et2cQm/nrdpZz5TOF6ue
	9w9aI+b9nXa0Yl9ccyk+Rh79uGwwzk2IfHOjIL1RXfykFScSlpldWB/0tQ8+CKnKq2OddaDRzckFF
	LMcGO3ilG69x+++uF1Jeu57Wz9HMf4WZRtOHclupt3nFW2W2vpXbC0ikmarYajxgyfxUM/CsQPukP
	GMS7fRwVAd1391WZBb8cNXivrIDx/ZHhL6iAQbFJ1B+lbGskckR3BknUb1y89/QbDxSiVLNOIag0c
	puzzS+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKIC-0000000HFpR-0ltJ;
	Thu, 29 Jan 2026 05:10:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKI8-0000000HFov-3URh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16D644184B;
	Thu, 29 Jan 2026 05:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE81C116D0;
	Thu, 29 Jan 2026 05:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769663403;
	bh=MEKmakKxwgOmIdbsb7SgejjAQhwjoaOqNpBcOcihee4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aTqdfYgoSCk9iPbjkAjUMrfRPXimW0a4VCa9JpDyxDl3bawyEwF+0ZQIN+Ou1Wwb4
	 K9gzLmicFDJ2Fj+/5fHBoviWKsIue4fRuKRncSlwZ7Qf0ezGoQ+ssbmHK8ZdEw20mu
	 Yk/PAeABpRn849LSVP7fulNiBh1RTCvIpDSNhecJNKVOGmYM1lELsX7G+AOIiKiuuP
	 /EqGiVCCXRSkheayBOSMXzThHs0bQ0eC24Xo53glVd2nqaqJMK3PkjFFXjWrHWCD+b
	 aCxLyACMuY//EGfI5MbdygHLisM7zH2AHvJMylthRz3byVCmYD6JNE24HvUv/6SqCN
	 +ruVTsBFv+hVw==
From: Jakub Kicinski <kuba@kernel.org>
To: jan.petrous@oss.nxp.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	edumazet@google.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andrew+netdev@lunn.ch,
	mbrugger@suse.com,
	davem@davemloft.net,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	s.hauer@pengutronix.de,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	festevam@gmail.com,
	mcoquelin.stm32@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	devicetree@vger.kernel.org,
	alexandre.torgue@foss.st.com
Subject: Re: [v4,1/4] net: stmmac: platform: read channels irq
Date: Wed, 28 Jan 2026 21:09:59 -0800
Message-ID: <20260129050959.375635-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128-dwmac_multi_irq-v4-1-82fa34fcf2f2@oss.nxp.com>
References: <20260128-dwmac_multi_irq-v4-1-82fa34fcf2f2@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_211004_910583_EF6DB806 
X-CRM114-Status: GOOD (  12.87  )
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
net: stmmac: platform: read channels irq

This patch reads IRQ resources for all rx/tx channels to allow Multi-IRQ
mode for platform glue drivers.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 8979a50b5507..94854bfb6e0d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

[ ... ]

> +	/* RX channels irq */
> +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> +		scnprintf(name, sizeof(name), "rx-queue-%d", i);
> +		stmmac_res->rx_irq[i] = platform_get_irq_byname_optional(pdev,
> +									 name);
> +		if (stmmac_res->rx_irq[i] <= 0) {
> +			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +			dev_dbg(&pdev->dev, "IRQ rx-queue-%d not found\n", i);
> +
> +			/* Stop on first unset rx-queue-%i property member */
> +			break;
> +		}
> +	}

When platform_get_irq_byname_optional() returns a negative error like
-ENXIO, that value is stored in stmmac_res->rx_irq[i] before the break.

In stmmac_request_irq_multi_msi(), the check is:

    if (priv->rx_irq[i] == 0)
        continue;
    ret = request_irq(priv->rx_irq[i], ...);

Should the negative value be cleared before the break? Otherwise if
rx_queues_to_use exceeds the number of defined IRQs, the negative error
code could be passed to request_irq().

> +
> +	/* TX channels irq */
> +	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
> +		scnprintf(name, sizeof(name), "tx-queue-%d", i);
> +		stmmac_res->tx_irq[i] = platform_get_irq_byname_optional(pdev,
> +									 name);
> +		if (stmmac_res->tx_irq[i] <= 0) {
> +			if (stmmac_res->tx_irq[i] == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +			dev_dbg(&pdev->dev, "IRQ tx-queue-%d not found\n", i);
> +
> +			/* Stop on first unset tx-queue-%i property member */
> +			break;
> +		}
> +	}

Same question here for tx_irq[i].
-- 
pw-bot: cr

