Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3E6CED63B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLKf1QB8zzifyWM44fyRAxO5E+WCOo3I8lg4wmBAeoM=; b=eLs51z/3GQWAQR3bl9VunDZtq2
	sNW1FgQgLw+vPMTuz/JH7gBj9bIl7ylj+V8ZRoNCblhw4Qhe8EW35nLE9Kj1qXVyz9uWPGV+Zfans
	uo/w5qFevwLtXTNifBmttmMFJ0Bi68H0LeGvggU5ctFHLrXfmhS/Hxk9i6D/oEJCLauaXuW13jQny
	hfoqUakZDednHioRcfrMQ1xO5lG8qLv2HHpDII2ji4tSrtsJUWcohhT9oVdlcy49lvliNFTTBrGxy
	HLuQ7Iwe7V6+eFhB8Tz96rWA8VZDPh8gxvoBibGGecOjUyszKamGMSnUTZPbWSWefuNbqjNkHo0Do
	2dR8ccRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMFG-00000000WN9-0g7C;
	Tue, 18 Nov 2025 13:59:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMFC-00000000WMY-1Mjh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:59:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3C561C1267D;
	Tue, 18 Nov 2025 13:59:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C183606FE;
	Tue, 18 Nov 2025 13:59:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC53E10371DD3;
	Tue, 18 Nov 2025 14:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763474378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=MLKf1QB8zzifyWM44fyRAxO5E+WCOo3I8lg4wmBAeoM=;
	b=RHkFEYAgyvVY3y1++cyuIhzJKbhWpST/loRXeeznyalkCTe1lwAelo6gzFkKb9dYN7mMOM
	TSsAHdZy9s7j1/t9e8LMYeBqkViUbelLRJiaAboYCgeYZeqe7OpZCVu8QEnnpEakFEkr+v
	FlJFNKN5x5mCPTHY0RHqx36K6wL5E5dnD1KeItl0tAe2hTFZOwtdD0EOEH5umBO59V9xtm
	/HQM74ZMXuLLNPG9rWEJZ2O7XVLF9FGfHagICoxkB2yme2HA4OaS+X4l0Kf9/56WoJLoEd
	icnAGgfTMmTKtgMe9ijDg8HvL5D8n1T03/3iLb0GX+7mthKc6S+LrqUKIBcTKQ==
Message-ID: <a1f1ad21-fb73-4f30-b428-8cec5ff53ed6@bootlin.com>
Date: Tue, 18 Nov 2025 14:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: stmmac: stmmac_is_jumbo_frm() len
 should be unsigned
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
 <E1vLIWR-0000000Ewkf-1Tdx@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vLIWR-0000000Ewkf-1Tdx@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055942_524801_E09EBC7D 
X-CRM114-Status: GOOD (  14.52  )
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



On 18/11/2025 11:01, Russell King (Oracle) wrote:
> stmmac_is_jumbo_frm() and the is_jumbo_frm() methods take skb->len
> which is an unsigned int. Avoid an implicit cast to "int" via the
> method parameter and then incorrectly doing signed comparisons on
> this unsigned value.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/chain_mode.c | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/ring_mode.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> index fb55efd52240..d14b56e5ed40 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> @@ -83,7 +83,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  	return entry;
>  }
>  
> -static unsigned int is_jumbo_frm(int len, int enh_desc)
> +static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
>  {
>  	unsigned int ret = 0;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index d359722100fa..4953e0fab547 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -541,7 +541,7 @@ struct stmmac_rx_queue;
>  struct stmmac_mode_ops {
>  	void (*init) (void *des, dma_addr_t phy_addr, unsigned int size,
>  		      unsigned int extend_desc);
> -	unsigned int (*is_jumbo_frm) (int len, int ehn_desc);
> +	unsigned int (*is_jumbo_frm)(unsigned int len, int ehn_desc);
>  	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  			 int csum);
>  	int (*set_16kib_bfsize)(int mtu);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> index d218412ca832..039903c424df 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> @@ -91,7 +91,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  	return entry;
>  }
>  
> -static unsigned int is_jumbo_frm(int len, int enh_desc)
> +static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
>  {
>  	unsigned int ret = 0;
>  


