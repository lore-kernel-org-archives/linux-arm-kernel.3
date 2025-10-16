Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C050ACCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 07:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHZj/DgqA8o4wPCtAZaC2EX3z/hRb2lVa/qz3oUIQRY=; b=NQyineatZADfAupGi59eqssDiU
	ADOT7mlPVashA2E1Vn1Vi1HrLid2iFb9YH8f4VT8A4yMvytjJQjGhAfjwvLaoA0E/OWiXqkbb24ZA
	BqgmfwBkg2SGh7sEMYYRjaaMg/XMKUq5w9uNg/H6sDObyBTtenjgmpoQ54k3hyWOyBieK8/5FFZgF
	819Oq9ZuM6MICsGY6l3xe7HrP9zYluJ0EhJsbe5fN1KqOEPHNq5fKzPq6O2vM9DYnwRoTtW8FIkLB
	L/17uf9qLNud9UHlb+an02A2PGCObbP640u6f+6311w/b7e00KkqUXeMCs9i1fvsEzRBu/Pj5eln1
	JrMEdl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IND-00000003l3D-19IB;
	Thu, 16 Oct 2025 07:26:07 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IN9-00000003l1M-3vWz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 07:26:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DAA21C03B71;
	Thu, 16 Oct 2025 07:25:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F17706062C;
	Thu, 16 Oct 2025 07:26:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC9F1102F22AA;
	Thu, 16 Oct 2025 09:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760599560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FHZj/DgqA8o4wPCtAZaC2EX3z/hRb2lVa/qz3oUIQRY=;
	b=nhdy/LOFyku5r+RwonmgR91X0cHcHLcLhRrjVm5kKUxu2v9THrznH6afS9BZkAmFUncu5e
	OynM1Ju3DnbJRv+4/9sklTJe8eGxLry2C//BG8Tx9gI0VwR+h9dj/g2Jc1vBXmPz72yAPT
	6qv3iHGKZCXL4h4MkZXL3CnZy/OoHw0cQ9v6KrvXwLeGCOZEPMx2Gu4PUcLFZSsuMBjnmT
	o7N6jWIXgY8nlfU5UbRkcvMvBh0J/dBvwgyYQDhVLrbAgMyjQfVGPKCPWsuWqo4K98x7Kg
	iAKm8zzQMXqzzPnarxCkuH8bn0lXohtGhpo6oJG/KQGm6/LXPiO3W1stqwijag==
Message-ID: <ade8145a-b236-4190-8289-2a44c6df0fa4@bootlin.com>
Date: Thu, 16 Oct 2025 09:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/5] net: stmmac: rearrange tc_init()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945Y-0000000Ameb-2gDI@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v945Y-0000000Ameb-2gDI@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_002604_167555_48A2C6A0 
X-CRM114-Status: GOOD (  13.83  )
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



On 15/10/2025 18:10, Russell King (Oracle) wrote:
> To make future changes easier, rearrange the use of dma_cap->l3l4fnum
> vs priv->flow_entries_max.
> 
> Always initialise priv->flow_entries_max from dma_cap->l3l4fnum, then
> use priv->flow_entries_max to determine whether we allocate
> priv->flow_entries and set it up.
> 
> This change is safe because tc_init() is only called once from
> stmmac_dvr_probe().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 97e89a604abd..ef65cf511f3e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -262,10 +262,10 @@ static int tc_init(struct stmmac_priv *priv)
>  	unsigned int count;
>  	int ret, i;
>  
> -	if (dma_cap->l3l4fnum) {
> -		priv->flow_entries_max = dma_cap->l3l4fnum;
> +	priv->flow_entries_max = dma_cap->l3l4fnum;
> +	if (priv->flow_entries_max) {
>  		priv->flow_entries = devm_kcalloc(priv->device,
> -						  dma_cap->l3l4fnum,
> +						  priv->flow_entries_max,
>  						  sizeof(*priv->flow_entries),
>  						  GFP_KERNEL);
>  		if (!priv->flow_entries)


