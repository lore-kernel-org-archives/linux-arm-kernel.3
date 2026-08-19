Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B702C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEQ6PFGmDuvNbRNEG1Jwr41i80JcF+EHelcxz8o/Zb8=; b=oTG1YVEp/gwV6RBM1xBgTKhHKc
	OqpfN5D2mnFjhQDlydO9SCoCe6sPaGJ41NK21D84LJf4dtX+9OAZfW7qtiOCMgHfKR2SXXWMG1Yqo
	lKHQ0npCheBsGSmbCgJIwlK61e0OHAtGZIpuZIQHzVLYA0mhYSPPyz7lyT+F+kVSVhcq864MCdQcx
	fseA/a5Q/22pKmEYVytB65864WoWTDu+GMPZS2lf6uiUC+W0tavYKZaKKftxQIn343co2PsG3UveU
	tMssxeKHnXIJHF3W1L714RmR9Gjy0t0BEU5VxcmCpiepj3D/cpFPkBSKVbLmD5CeF610veXTVFZwv
	yF79Uksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfup-00000009oov-11k2;
	Wed, 19 Aug 2026 13:01:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfum-00000009ooJ-2S8Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 13:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QEQ6PFGmDuvNbRNEG1Jwr41i80JcF+EHelcxz8o/Zb8=; b=vu3WOyQU7YUhsljdFnzei6HB5w
	n7hV67n4vh5NX/UGabUFSAjaqJId3yk8ptmnpBrJL2BDH1nZTlN5TLt64tztiL+LHq6D9Ih1KV+Ij
	WMXLUd579bZ6gUFDIv16pbuj7yQMraa9KC2gU8p+mmvmIb18kstP9LCu2rzBvpm7C4rY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wwfu6-000bod-Rh; Wed, 19 Aug 2026 15:00:26 +0200
Date: Wed, 19 Aug 2026 15:00:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: platform: fix of_node leak when breaking RX
 queue loop
Message-ID: <6ca6be2d-548d-4110-9964-567bb8788e62@lunn.ch>
References: <20260819073258.467604-1-gonglinkai@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819073258.467604-1-gonglinkai@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_060108_626324_E06B584E 
X-CRM114-Status: GOOD (  18.88  )
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

On Wed, Aug 19, 2026 at 03:32:58PM +0800, Linkai Gong wrote:
> for_each_child_of_node() on the RX queues breaks once enough queues are
> parsed, which leaves the current child referenced. The TX loop then
> overwrites q_node, so that reference is never dropped.
> 
> of_node_put() the child before breaking. The TX loop already drops its
> last reference via the of_node_put(q_node) at the out label.
> 
> Fixes: d976a525c371 ("net: stmmac: multiple queues dt configuration")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index dc5f951a311d..66a048ecadb0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -170,8 +170,11 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
>  
>  	/* Processing individual RX queue config */
>  	for_each_child_of_node(rx_node, q_node) {
> -		if (queue >= plat->rx_queues_to_use)
> +		if (queue >= plat->rx_queues_to_use) {
> +			of_node_put(q_node);
> +			q_node = NULL;
>  			break;
> +		}

Why not for_each_child_of_node_scoped()?

Also, does this bother anybody? I think this should be for net-next.

And while we are looking at this, what about:

https://elixir.bootlin.com/linux/v7.2/source/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c#L232

    Andrew

---
pw-bot: cr

