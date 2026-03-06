Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69D5F0180E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgDBXmEnVujJM8vulMEVYeA6ICqdKuQICuLq3YHevSE=; b=kXwO8+h5Nz5Wed/e/l5GBxmDpn
	n12KPtmGgHQOFcLDAysPhEQdOQvyWecujRYCkOLAC3Ir5i4n/tEVTXoX/qI1WysbLo3r5A3xHpHqb
	1pKdN1W2qdK8oy3/U0kZjSg6LpFjiF2OxIbBkHSpokMvbwWf/J8v1w+jv7qKUU9tvG8X5TZRuLVh3
	BIDVcfydbK5rCWTNwDk6LxdxYccbB2wkYFOafzTpQaC4ChhPzvfqTmdf/h6EbzQTHHl8PjuBPQSTz
	wVVU9BtYpRf3LjKMjAYsjLO1iFLIFurPZPh/xf7mR6zLR9hFcnrjFYJ8VkeLqu3u6d3jewuMBogCG
	NGA6el1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyR4D-00000003JbA-0Owd;
	Fri, 06 Mar 2026 09:01:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyR4A-00000003JaK-2dd7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 09:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZgDBXmEnVujJM8vulMEVYeA6ICqdKuQICuLq3YHevSE=; b=ahlOo+mh3t8qpxKXMd1PjHafv8
	37m8cqehiUO9Z7eeLymK0NQLXS2kg/oIzYDJb/+pa/1UWGRgWbVrqrzTls5cEEWCNlrHOHM8cTYwQ
	a5II4e0BX4jwm8RucqWkof7Cty24hFJL9ulS8FjKmCsGQN7FbTvSSZfsOuq6UAfECxPkKZRk/aJ/8
	XbyLQLvyn0r0SFGP1co3x79I6CK5a2c/lL3xzvApaImX44AhUkUNRDimQ0ixXKyiyVJXayzafi+LL
	2RQjiZdzN9d1XCKWHlaN+a9mSDe44Xinj4sdhoXz2tXjO0f+CtHT4Jrefqs2ytwtMX/ozvm4Z6pWd
	3Y7Uo/bQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47666)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vyR40-000000000jm-29aw;
	Fri, 06 Mar 2026 09:01:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vyR3w-000000001IO-41FR;
	Fri, 06 Mar 2026 09:01:36 +0000
Date: Fri, 6 Mar 2026 09:01:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH net-next v2 3/8] net: stmmac: mdio: simplify MDC clock
 divisor lookup
Message-ID: <aaqX8IxLzZ7jGM4r@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
 <E1vy6A9-0000000Btwp-0lxY@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vy6A9-0000000Btwp-0lxY@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_010150_671508_DEBC5B4A 
X-CRM114-Status: GOOD (  22.16  )
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

On Thu, Mar 05, 2026 at 10:42:37AM +0000, Russell King (Oracle) wrote:
> As each lookup now iterates over each table in the same way, simplfy
> the code to select the table, and then walk that table.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 29 +++++++------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 6292911fb54b..c9f0b8b601d2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -535,6 +535,7 @@ static const struct stmmac_clk_rate stmmac_xgmac_csr_to_mdc[] = {
>   */
>  static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
>  {
> +	const struct stmmac_clk_rate *rates;
>  	unsigned long clk_rate;
>  	u32 value = ~0;
>  	int i;
> @@ -548,25 +549,17 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
>  	 * the frequency of clk_csr_i. So we do not change the default
>  	 * divider.
>  	 */
> -	for (i = 0; stmmac_std_csr_to_mdc[i].rate; i++)
> -		if (clk_rate > stmmac_std_csr_to_mdc[i].rate)
> -			break;
> -	if (stmmac_std_csr_to_mdc[i].cr != (u8)~0)
> -		value = stmmac_std_csr_to_mdc[i].cr;
> -
> -	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
> -		for (i = 0; stmmac_sun8i_csr_to_mdc[i].rate; i++)
> -			if (clk_rate > stmmac_sun8i_csr_to_mdc[i].rate)
> -				break;
> -		value = stmmac_sun8i_csr_to_mdc[i].cr;
> -	}
> +	rates = stmmac_std_csr_to_mdc;
> +	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I)
> +		rates = stmmac_sun8i_csr_to_mdc;
> +	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
> +		rates = stmmac_xgmac_csr_to_mdc;
>  
> -	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
> -		for (i = 0; stmmac_xgmac_csr_to_mdc[i].rate; i++)
> -			if (clk_rate > stmmac_xgmac_csr_to_mdc[i].rate)
> -				break;
> -		value = stmmac_xgmac_csr_to_mdc[i].cr;
> -	}
> +	for (i = 0; rates[i].rate; i++)
> +		if (clk_rate > rates[i].rate)
> +			break;
> +	if (rates[i].cr != (u8)~0)
> +		value = rates[i].cr;

Looking at the AI review, it seems to me that the AI review is
incorrect.

With reference to the full original code which can be seen in:
https://patchwork.kernel.org/project/netdevbpf/patch/E1vy69y-0000000Btwd-3oq7@rmk-PC.armlinux.org.uk/

If we look at the original code, then we can see that the intention
is that if clk_rate is smaller than the last real entry for the
sun8i and xgmac cases, the value should end up as zero - and this is
exactly what the new code does. So, the behaviour is preserved, even
though AI thinks it isn't.

AI seems to think that reaching the last entry for sun8i and xgmac
means we have an invalid rate. That is where AI is going wrong -
that is an incorrect "assumption".

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

