Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287E5FED2F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IX9QCS5b6Xn8/dE+/kiOOEMjyLxuCn5DnqDHXAakk1Q=; b=ookTy0LQ7SvYkM3iUxvHoyC+Ns
	0/rgLAZ6TJU69bMeYAT4Ueg+5Zog1yFITNUoBB875qQoTuschdnObjdChPI222V2LzZ6eyKrv/85Y
	Kedblx+PmSLIcqkIQQQu/O+tR4fVIv1AavW6dN+9ouXuJOhZp5g8UYONGwMmyyb4BdbLMKqsIGA8s
	XtgFwWPeZ8qj1OkIDnakzehbEwI4XThwoncLFOeiqE1UWqoD4/UoxQPicPYvNekgHsPWMokyHjiPQ
	3buvluhA5PK1kUznBPmUjb2CRxCA7mi+rHcR4YnSD3K/9liAfuqaqR5LvfhHY8WbvK9l0iL2cbTr5
	FrVbjcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0boO-0000000DfMW-0nfW;
	Thu, 12 Mar 2026 08:54:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0boL-0000000DfM0-14TE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IX9QCS5b6Xn8/dE+/kiOOEMjyLxuCn5DnqDHXAakk1Q=; b=aeYFHgEtYTI5faN/d/LqgD2Dp6
	odc7r897g1zvAU6wvFcuBnivPiYJbIxNehFn3ZKXukEe2Lxlm/YIfB6y71RBd1b1jq/1tcm2ntQmR
	jikwtnBlvs5XmwbNZx+7HZiA62AWry4n2J4zruKOj7swfs9a6L8E1Z0jirq8Gdfwg7PQ3rCw2Rar/
	JGdtsGje6JyAXnBsa2hGg8O8vtb6pesAjYqqcwwsQqYlKNp1QYkcRCTzKay133DvUxElIUtY/we0Q
	FkVmm8WLGj37z1lgPHsrU5chrBFb7nygXNfFR4R3dx3U24Lq9sucIwaAV0lQlE/B3QaJMP/YRmZjX
	hgjfxbpA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51292)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w0bo1-000000007QA-0LuK;
	Thu, 12 Mar 2026 08:54:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w0bnx-0000000076N-39Oq;
	Thu, 12 Mar 2026 08:54:05 +0000
Date: Thu, 12 Mar 2026 08:54:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: Re: [PATCH net-next 02/15] net: stmmac: helpers for filling
 tx_q->tx_skbuff_dma
Message-ID: <abJ_Le1xOP6roesb@shell.armlinux.org.uk>
References: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
 <E1w0GEg-0000000CiSj-2CVA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w0GEg-0000000CiSj-2CVA@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_015429_633508_CC89CAD1 
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

On Wed, Mar 11, 2026 at 09:52:14AM +0000, Russell King (Oracle) wrote:
> +static void stmmac_set_tx_dma_entry(struct stmmac_tx_queue *tx_q,
> +				    unsigned int entry,
> +				    enum stmmac_txbuf_type type,
> +				    dma_addr_t addr, size_t len,
> +				    bool map_as_page)
> +{
...
> +	tx_q->tx_skbuff_dma[entry].buf_type = type;
...
> +}
> +
> +static void stmmac_set_tx_skb_dma_entry(struct stmmac_tx_queue *tx_q,
> +					unsigned int entry, dma_addr_t addr,
> +					size_t len, bool map_as_page)
> +{
> +	stmmac_set_tx_dma_entry(tx_q, entry, STMMAC_TXBUF_T_SKB, addr, len,
> +				map_as_page);
> +}

...

> @@ -4471,10 +4495,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  	 * this DMA buffer right after the DMA engine completely finishes the
>  	 * full buffer transmission.
>  	 */
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_headlen(skb);
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
> +	stmmac_set_tx_skb_dma_entry(tx_q, tx_q->cur_tx, des, skb_headlen(skb),
> +				    false);

when nfrags is zero, tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type is set
here.

>  
>  	/* Prepare fragments */
>  	for (i = 0; i < nfrags; i++) {
> @@ -4489,17 +4511,14 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  		stmmac_tso_allocator(priv, des, skb_frag_size(frag),
>  				     (i == nfrags - 1), queue);
>  
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_frag_size(frag);
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = true;
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
> +		stmmac_set_tx_skb_dma_entry(tx_q, tx_q->cur_tx, des,
> +					    skb_frag_size(frag), true);
>  	}

... and tx_q->cur_tx is not incremented because the loop is not
executed.

>  
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].last_segment = true;
> +	stmmac_set_tx_dma_last_segment(tx_q, tx_q->cur_tx);
>  
>  	/* Only the last descriptor gets to point to the skb. */
>  	tx_q->tx_skbuff[tx_q->cur_tx] = skb;
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;

Thus this assignment of tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type is
redundant. As the loop doesn't execute any code in the nfrags=0 case,
there is no call to stmmac_tso_allocator(), and thus tx_q->cur_tx will
be the same as when the previous stmmac_set_tx_skb_dma_entry() was
called.

Therefore, the AI review is incorrect.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

