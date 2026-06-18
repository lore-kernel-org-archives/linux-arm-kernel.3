Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1605CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xHduvJKmoBDw5ZJr8Mqo8CHiviUc2oC0TXXFw/0eRY=; b=DyRc6VtnDdliQxo6i10Cw7ndZt
	2oxz9bW2BPb339sY0sjl6d7JXeFDuPjMOd4zcQ1lJjo2gf52Vhgh1ERqZS6CcSf10TWOMXHQ6BS41
	xxbTCzmZA/aCc8xppiQwnRV1eA8SXJUbWVZMPhL+Co1/j3Y/q05HXWiJ5m81b29oJ2pDnt4hJj7hq
	L9nYDo5NqaXC7DFQ1hl17xj02sa3GfWmnuNLvcTa48wOA09SJCdZg6gM0e4nI6yCFORjO/L/ub1Gq
	UxrcBWXtyAje77tHr6+Ji2ViKBrrAbjnVCHlXi9E9SN3qupATtErQUVyhmQ3qZgz9fQwFGGtEdpRQ
	/BOPfQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6mn-00000000jFM-3rhG;
	Thu, 18 Jun 2026 07:03:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6ml-00000000jEl-0kX4;
	Thu, 18 Jun 2026 07:03:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CDB10C06CC6;
	Thu, 18 Jun 2026 07:03:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72E365FF03;
	Thu, 18 Jun 2026 07:03:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F390106C823E;
	Thu, 18 Jun 2026 09:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781766208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5xHduvJKmoBDw5ZJr8Mqo8CHiviUc2oC0TXXFw/0eRY=;
	b=z9hUWqH8IVeplt0BiXE3R+kSStEU8GET5xLAykz9NNOYDbRiov+5Ve28wsHz0YEX70hgDq
	3fhC/2DUVYWzUQAcXEHZthNhZXOo97Mxwa5u6+TB8w17SMRVQD25EAp8c4KbU8kos/Gon2
	RX8wKBG8IEy67RhTNc/LifdhOhq0G3voHvLP58oVeK2rB59flHxmm63G7ktysTk84dpazO
	IsaNBIuj2shHw5QNq7PP5zh9e0LCCw2H8gPRG3v/5+gYiFZEzCrk4V4qV7aZa4aoSSh4rn
	dCWS6u1TPFWxSQ6FVudPHcppKKEq52x8zpof+Ptc/MxAnXVfPLeRbZ+ANY5Eqw==
Message-ID: <9b39829d-92b4-4ffa-be0b-b2b0f857f58e@bootlin.com>
Date: Thu, 18 Jun 2026 09:03:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-spacemit: Fix wrong ctrl register
 definition
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yixun Lan
 <dlan@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260618064143.1102179-1-inochiama@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260618064143.1102179-1-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_000335_412134_9080DF5A 
X-CRM114-Status: GOOD (  12.66  )
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

Hi Inochi,

On 6/18/26 08:41, Inochi Amaoto wrote:
> There register layout of the phy ctrl register has something wrong,
> fix it to match the right layout
> 
> Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> index 223754cc5c79..6feffaa3ef3a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> @@ -18,10 +18,12 @@
>  #include "stmmac_platform.h"
>  
>  /* ctrl register bits */
> -#define CTRL_PHY_INTF_RGMII		BIT(3)
> -#define CTRL_PHY_INTF_MII		BIT(4)
> -#define CTRL_WAKE_IRQ_EN		BIT(9)
> -#define CTRL_PHY_IRQ_EN			BIT(12)
> +#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
> +#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
> +#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
> +#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
> +#define CTRL_PHY_IRQ_EN			BIT(9)
> +#define CTRL_WAKE_IRQ_EN		BIT(12)

Looks like you're fixing 2 things there :

 -> Wake on Lan probably didn't work before, as the wake irq was apparently wrong
 -> The MII mode selection apparently also changes, but maybe you don't have a
    MII board around to test this ?

Is it possible you address these issues independently (i.e. split this in 2 patches) ?
That way, if we ever revert one, we won't re-break the other thing that was broken.


Maxime


