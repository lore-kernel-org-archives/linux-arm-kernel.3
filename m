Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C2E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AZb2IfC9;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=hZ6CDGNv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SVPciQr1s9BDQkZqo0irUvEcCQ8iKbnU6l79MHO+xgQ=; b=AZb2IfC9jBwRQq
	bv6r6BrXQ4BKdoJhLkjmd6ZNhVtDpWvw1xT670DVfeBaGNmqTV37BaygkDsyfjI/e6g6LFj8lj/ov
	MNpHr0ZHZgdbiBLUWZGmGbPDXBOn8ZnLE4vM1+jJkfefy5vCUVkyafP2yvhepdJWTpY84R4B2F83a
	+beVCDuFzq2EeRr6VJwlVIVDCYGkvosaiQxvrQF28d13jr+w56Qkevqv8xDGnf4+PK6g9wU+H4CrC
	WQHK6TQ646Jq1M7pXA69wP9+jQSgLALQAy0kY6nlbKkYEx5ucIZFGqjHbgYiHhcPGsUxVU8Cx4x8+
	GCpZ82KwIu6O0G6c2tHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnQ8-0000000Fs2U-3PYn;
	Mon, 02 Nov 2026 08:29:36 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnQ5-0000000Fs1l-0KVp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:29:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25664A1587;
	Mon, 02 Nov 2026 09:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1793608163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SVPciQr1s9BDQkZqo0irUvEcCQ8iKbnU6l79MHO+xgQ=;
	b=hZ6CDGNvoqmbNZETgMYos71ChglJxAY5D1UMWnFszUL9QlgIvEgwNXd2Fv3qIjv1OBaSoA
	1hehzwuSyn0Ktu816SVRZmeF0tPvTV0Ra2OJO7KKuYSjQ/ILeONbIIvgrpvcsX/3e3AgcC
	eZYOvT3CUa9vRaYKueSZrRbJplxNGPexFCAeOf0QfV9xAd2uKHUS/qHrKiQUf92s34ChUI
	Ofaw9ff8zVFsn+b9KUxUrpBzq/T8hO6kVumu711LTbLtlEX0fW0xagDc2L7cpcJUe7WIkf
	ygAKn7SkXoYQBj+dDBYxoSETGPoPKAdZycjEiSpajFA/54XP75s8d/05JJeydQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 02 Nov 2026 09:29:18 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: Yao Zi <me@ziyao.cc>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Nazim Amirul
 <muhammad.nazim.amirul.nazle.asmade@altera.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-motorcomm: mask the MISC interrupt
In-Reply-To: <20261102080938.2955-1-magnusleatti@kernelriot.com>
References: <20261102080938.2955-1-magnusleatti@kernelriot.com>
Message-ID: <805aeb73d9e32b237bcb30c8fd44ffed@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_002933_593938_EF721E89 
X-CRM114-Status: GOOD (  16.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Magnus

On 2.11.2026 09:09, Magnus Leatti wrote:

> [...]

> Russell, d3265c19b35d ("net: stmmac: xgmac2: disable RBUE in default RX
> interrupt mask") describes a similar storm on xgmac2. Should dwmac4 do
> the same? I have only tested the glue change.

AFAIU RBU is the cause. Dropping it in dwmac4, as Russel did in  
d3265c19b35d,
would cover all multi-MSI users.

> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 124fcd55a..610d533b9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> @@ -30,6 +30,7 @@
>  #define OOB_WOL_CTRL				0x1010
>  #define  OOB_WOL_CTRL_DIS			BIT(0)
>  #define MGMT_INT_CTRL0				0x1100
> +#define  MGMT_INT_CTRL0_MASK_MISC		BIT(21)

Where is this bit documented? The vendor driver?

>  #define INT_MODERATION				0x1108
>  #define  INT_MODERATION_RX			GENMASK(11, 0)
>  #define  INT_MODERATION_TX			GENMASK(27, 16)
> @@ -172,7 +173,11 @@ static void motorcomm_reset(struct 
> dwmac_motorcomm_priv *priv)
> 
>  static void motorcomm_init(struct dwmac_motorcomm_priv *priv)
>  {
> -	writel(0x0, priv->base + MGMT_INT_CTRL0);
> +	/*
> +	 * Nothing services the MISC source, and once raised it never
> +	 * deasserts, so keep it masked.
> +	 */
> +	writel(MGMT_INT_CTRL0_MASK_MISC, priv->base + MGMT_INT_CTRL0);

Doesn't this turn off the stmmac MAC irq on vector 5 completely? If so,
please mention it in the comment.

Also, does the MSI fallback still get RX/TX interrupts with MISC masked?

> [...]

Thanks,
Nicolai

