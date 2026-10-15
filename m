Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B04CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gJALexW05XL2Pb5Fq3PqAp03mD7NtGawsGCWpwRmHU=; b=KScoISruraQiNMjYfjpJGYpycC
	blLy+ltgryoe6Z4oJ7Ebfh36NA2P3rcojPW5zrH9BQKHS2M5guAwqQiQz7PcvwgHsXyAakpEWIf7q
	WxemhePzmeovKIORFh+WkPVjSiBiemXnK48XuSeM/C/xZ9lluvkwMqsROQO8+fCqdMVU5BXbtxuZQ
	qnTEbfAcUklls/JcZf+L3UygZlJhlpdtGs3JoI7E8yAhrMa9815XT1kEBCLxqnWwC7Ka4liIR/vHM
	V5fC1w9ucDWUWKyEHlEtrg2evJHoQOBKuRU5+P2I5Mt9nwhmOA8PNU94kR+OdwPDqvxWczF9MaClm
	R9ud8jvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKLg-0000000049b-2Jvf;
	Thu, 15 Oct 2026 12:14:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKLd-0000000047w-1KpV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:14:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B3DF1A123A;
	Thu, 15 Oct 2026 12:14:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3666C60360;
	Thu, 15 Oct 2026 12:14:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 088BA10328BC6;
	Thu, 15 Oct 2026 14:13:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792066447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1gJALexW05XL2Pb5Fq3PqAp03mD7NtGawsGCWpwRmHU=;
	b=Ifd3weqBL4dZA0MqbkFF6C1lVmZFL0nzM8MZMHA0eL16k/mOcv6E2MdHPf+LP5Dc4+sXdV
	ygypA+PGRWQvkyiY0pAMcGEFaC7Rvqve5eIsLePBC0HXvoRZgUm/U9JTRHWwFqTjlA7WDE
	jAmoVj/isy17n/rOndSPQO3DgCctO5lXH2zCSU8zV1mkbmsdkn8bET33npg4fLrzeEzg9I
	J4WqRzvtsnMZdcTXYsUiHJA/LeksZJGP5RqFoESXDJPKuMx8cBI5syhWVcynEMBDGeZcnH
	tjzP3neVJnw4LN2GRYQ9psSJNGjeIWK8mzxtxl07E6XN+Cgc9vwbDO3DgMKrdA==
Message-ID: <020aa4b3-3f18-4a04-92b7-81cd21b07f7d@bootlin.com>
Date: Thu, 15 Oct 2026 14:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: remove STMMAC_DOWN check to avoid irq storm
To: Xiaochuan Li <chuanx2070@163.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20261015112415.437900-1-chuanx2070@163.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261015112415.437900-1-chuanx2070@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_051413_498997_8F66A7D1 
X-CRM114-Status: GOOD (  21.10  )
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

Hi,

First thing first, you're missing the target git tree, net or net-next. It's
likely net-next, unless this is a real crash you're facing.

On 10/15/26 13:24, Xiaochuan Li wrote:
> The stmmac interrupt handlers return IRQ_HANDLED immediately when
> STMMAC_DOWN is set, without reading or clearing any device status
> register.
> 
> STMMAC_DOWN is set by stmmac_reset_subtask() before dev_close(). The
> device interrupt is level triggered, so if it fires after STMMAC_DOWN
> is set and before the IRQs are masked/freed in __stmmac_release(), the
> pending status is never cleared, the line stays asserted and the handler
> is re-entered forever. Since the handler returns IRQ_HANDLED,
> note_interrupt() never flags the IRQ as spurious and never disables it,
> resulting in an interrupt storm.
> 
> Signed-off-by: Xiaochuan Li <chuanx2070@163.com>

This STMMAC_DOWN flag is quite misleading :( it's only set in the
stmmac_reset_subtask() and there's no explanation at all in the git history about
why this flag is even here...

How did you find that problem ? Do you have a use-case that triggered the
storm ?

I'm wondering if the right move isn't just to get rid of the flag entirely, I'm
failing to see what it brings.

> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 ++++++++-----------
>  1 file changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 56d89a696272..520c1b8d736c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3091,6 +3091,13 @@ static bool stmmac_safety_feat_interrupt(struct stmmac_priv *priv)
>  
>  	ret = stmmac_safety_feat_irq_status(priv, priv->dev,
>  			priv->ioaddr, priv->dma_cap.asp, &priv->sstats);
> +
> +	/* Status is read/cleared; do not escalate to a global error reset
> +	 * while the interface is going down.
> +	 */
> +	if (test_bit(STMMAC_DOWN, &priv->state))
> +		return false;
> +
>  	if (ret && (ret != -EINVAL)) {
>  		stmmac_global_err(priv);
>  		return true;
> @@ -3113,6 +3120,12 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan, u32 dir)
>  	rx_napi = rx_q->xsk_pool ? &ch->rxtx_napi : &ch->rx_napi;
>  	tx_napi = tx_q->xsk_pool ? &ch->rxtx_napi : &ch->tx_napi;
>  
> +	/* Status was already read (and clear) above, so the irq line is
> +	 * deasserted, Drop the event while the interface is going down.
> +	 */
> +	if (test_bit(STMMAC_DOWN, &priv->state))
> +		return 0;
> +

I don't quite understand why this is added here, can you elaborate ?

Maxime


