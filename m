Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9AD606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RZHubgp6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZB9D6Xzw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=edBP2A68Bu7W9EkTwCHYe8SPLgIZpJkGOjQwcfidHTM=; b=RZHubgp6yRzr1NuOyabH3uDPFQ
	f1mQXQf0veZiOvXGEy1255lkrXZEJxBk0a0nFVgz8N+EClHjN8tWi3xudGwUKiHd58qF9nWiEXRZv
	TkDga6dRJzK+2YUKsNBrd0V4JPhEa6lXl1PggsDVtU9oB6zEOKXGhTN4MNOTc5iiqeIdHD1yiy3Re
	CYnbsbvFe/+VqmOBUoA1+xwR8XkEtns1iowWMVaOccmYfr+dR6da8NpdTxklHVFRck9W7zTfxhomj
	uo8E2EWFu45G6Hu0Kpqq27F30DZ7m5HT8/TZUSfUbeTpUBeq91Nu+fWztFQ9eXiCwaKXwiZ/XTOnP
	swhziJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqe7-0000000GOvd-3Qya;
	Mon, 02 Nov 2026 11:56:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqe6-0000000GOvW-2Ohc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:56:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07DA741424;
	Mon,  2 Nov 2026 11:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782D31F00A16;
	Mon,  2 Nov 2026 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793620573;
	bh=edBP2A68Bu7W9EkTwCHYe8SPLgIZpJkGOjQwcfidHTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZB9D6Xzwd9V0KWzgRay9qxu3z4JVvBe4OPAVsFf203Woxl4RClT/YrnH6K4nBD/na
	 DXtL9XYKSyieJh/JWVUVynigesvd3ygarNHTnkfg7MrJmJR5YacNNkCNyQQF+c7pJl
	 3p50jOAr74+5d8wBFkSjxBIpn5fbI4SMJ7/79+4qA1KtDo/zEXZh1igH9a9px8QOHy
	 wVlqSwLKt1LcsurRaPG7r4LuT1AGaEnWfjXeI13Ikl5Qmhry6E/wsxN3kbfGR4NJ0m
	 X5b1RKzvfkaGlqz1BXZrPz6dbdxN3LU295cMpqF5lx0H3AXYt+Jfk+3PuemaIss+26
	 miSzc4QBzyN2A==
Date: Mon, 2 Nov 2026 11:56:09 +0000
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, Steen.Hegelund@microchip.com,
	UNGLinuxDriver@microchip.com, richardcochran@gmail.com,
	horatiu.vultur@microchip.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: sparx5/lan969x: release the in-flight slot of a
 stale TX skb
Message-ID: <20261102115609.GA257209@horms.kernel.org>
References: <20261029-sparx5-ptp-stale-tx-slot-v1-1-ec15f391bbb7@microchip.com>
 <179339983815.3131.4933059375204484548@kernel.org>
 <20261102091449.oigddj44eapymqua@DEN-DL-M70577>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102091449.oigddj44eapymqua@DEN-DL-M70577>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 10:14:49AM +0100, Daniel Machon wrote:

...

> > [Severity: Medium]
> > Can this decrement race with sparx5_ptp_txtstamp_release() and count the
> > same skb down twice?
> > 
> > Each port netdev has SPX5_PRIOS TX queues and there is no
> > ndo_select_queue, so two CPUs can run sparx5_port_xmit_impl() for the same
> > port at the same time. sparx5_ptp_txtstamp_old_release() unlinks while
> > holding only tx_skbs.lock. The busy path decrements without checking
> > whether the skb is still on the list:
> > 
> > drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c:sparx5_ptp_txtstamp_release() {
> >     ...
> >         spin_lock_irqsave(&sparx5->ptp_ts_id_lock, flags);
> >         port->ts_id--;
> >         sparx5->ptp_skbs--;
> >         skb_unlink(skb, &port->tx_skbs);
> >         spin_unlock_irqrestore(&sparx5->ptp_ts_id_lock, flags);
> > }
> > 
> > A possible sequence:
> > 
> > CPU0
> > sparx5_ptp_txtstamp_request()
> >     skb_queue_tail(&port->tx_skbs, X)
> >     sparx5->ptp_skbs++
> > spin_lock(&sparx5->tx_lock)   /* waits */
> > 
> > CPU1
> > sparx5_ptp_txtstamp_request()
> >     sparx5_ptp_txtstamp_old_release()
> >         /* X looks older than SPARX5_PTP_TIMEOUT */
> >         __skb_unlink(X); dev_kfree_skb_any(X); purged++
> >     sparx5->ptp_skbs -= purged
> > 
> > CPU0
> > ops->fdma_xmit() or sparx5_inject() returns -EBUSY
> > sparx5_ptp_txtstamp_release(port, X)
> >     sparx5->ptp_skbs--
> > 
> > At HZ=100, SPARX5_PTP_TIMEOUT is one jiffy, so crossing a single tick is
> > enough for X to look expired.
> > 
> > Before this patch the purge path did not decrement, so X was counted down
> > only once. ptp_skbs is a u16 and the limit check only tests for equality.
> > 
> > If the counter wraps to 65535, does the SPARX5_MAX_PTP_ID limit stop
> > working, so that ts_id values can be reused while they are still
> > outstanding?
> > 
> > The same window already lets CPU0 keep using X after CPU1 has freed it.
> > That part predates this patch; the double decrement is new.
> 
> This fixes a leak seen in normal operation. Each lost timestamp keeps
> an in-flight slot, and after SPARX5_MAX_PTP_ID losses, two step
> timestamping stops on all ports. The lan966x twin (074caa30a627) is
> already in net.
> 
> AFAICT, the wrong count can never be used. The second decrement is in the busy
> path, which on the very next line unlinks an skb that a purge on
> another TX queue has already freed. That use-after-free is
> pre-existing and crashes before the count matters.
> 
> I am working on a net-next series that reworks PTP TX timestamping and fixes
> this and several related issues.

Thanks Daniel,

I agree that is a good approach.

Reviewed-by: Simon Horman <horms@kernel.org>

...

