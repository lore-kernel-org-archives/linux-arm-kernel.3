Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC17106F2E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 07:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vCpUNBSiAnYzq38lMljTJz/wGpcaU+8Km5eWOGP29M=; b=p0k7U7JcsXXCMTED1eqLXDiAoq
	RXlpn+/PfFhHdEVY6cL1aQmkTO3hB72WP9nfhrL4LzEVKm+TwlXTxNaLk6ZWGVFDnB7XDOub3IEEm
	qaCMCo+DmH0R9g1OVACqnVZSUcWc2tVFIjbyJemOrZA8tpToRS7SKYnkSmcPuQKER8p6X93c1hymM
	9rZxPZadO2C2RQR3/BCWkbLHtBZ8wuPkh3qxgy7QQI3E7/V9+aJTgkRDpvQ8XiMpaZjavptWADUZ6
	M9kTDVfLITtHZ98eChP4dpBZT+Eadj7A2TsinVuFGsJmKJkXMcHbKwSKCTcPdlorAAWCsuXa6WM5G
	t95Rt7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fTD-00000004xVN-2SqE;
	Thu, 26 Mar 2026 07:49:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fTA-00000004xUb-19J4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 07:49:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B46FBC580BD;
	Thu, 26 Mar 2026 07:49:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9716F5FDEB;
	Thu, 26 Mar 2026 07:49:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE847104507C8;
	Thu, 26 Mar 2026 08:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774511366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6vCpUNBSiAnYzq38lMljTJz/wGpcaU+8Km5eWOGP29M=;
	b=O4LfPlA6DXdQvXswgXOIiIqA0zoyzh65smdruT1D4cZH0LIUieaE/NMYMxT79/ea3Lrlgg
	z+5xD0lSFdrKgWiB92T+DEVmk5Kxila/MxT+9yZ3ozHOsFYYW0XQoAI42vXoMGBCh9KG6b
	uSnavCLBGDt8DrmYRt4eZFRN8lIR52gsLgSbJOEiZ44S4CUr93s4X95s1MsHvPjBayyvyz
	NEIM4Z+9QnvY9qVXTWedfHXrOM1sahBC9X3IqD6+0FRZThSVIIPrC23nRpucKD5vSfpvaW
	z96VqNoA7sZEaXwCvqKWI5Bq8SFwwAYl8NCSsS/YMPoLJfd0nIGjkH4GBi1IQQ==
Message-ID: <abb1c779-b306-42f8-b2b1-aa56bfcebe1b@bootlin.com>
Date: Thu, 26 Mar 2026 08:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_004932_462348_973DE9C9 
X-CRM114-Status: GOOD (  19.61  )
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

On 21/03/2026 06:38, Michal Piekos wrote:
> stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> "Failed to restore VLANs" error even when no VLAN filtering is in use.
> 
> Check presence of VLAN HW FILTER flags before stmmac_vlan_update().
> 
> Tested on Orange Pi Zero 3.
> 
> Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> This patch fixes a noisy "Failed to restore VLANs" message on platforms
> where stmmac VLAN hash ops are not implemented.
> stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> VLAN hash ops presence which results in -EINVAL. 

I've been seeing the same message on socfpga. My two cents on that is
that this error messages doesn't bring anything to the table anyways.

As Russell explains, it's either triggered when the vlan op isn't
implemented (the stmmac callback macro stuff turns that into a -EINVAL),
or when some capabilities arent present. All in all, it's always stuff
that users can't really do anything about, as it's HW limitations, I
think we can simply discard this message.

Also, nothing actually checks what stmmac_vlan_restore() returns, so we
might as well return void ?

Maxime

> ---
> Changes in v2:
> - Replace check for hash ops with check for HW FILTER flags
> - Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6827c99bde8c..cfc0ce9cec9c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6863,7 +6863,8 @@ static int stmmac_vlan_restore(struct stmmac_priv *priv)
>  {
>  	int ret;
>  
> -	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
> +	if (!(priv->dev->features &
> +	      (NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_STAG_FILTER)))
>  		return 0;
>  
>  	if (priv->hw->num_vlan)
> 
> ---
> base-commit: 42bddab0563fe67882b2722620a66dd98c8dbf33
> change-id: 20260314-vlan-restore-error-f8b3a1c7f50a
> 
> Best regards,


