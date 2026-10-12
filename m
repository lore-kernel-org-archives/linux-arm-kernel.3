Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1257CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 20:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7gHMV3umSUeDW/ePA4faUCYbBu5Azy4eUsgtI9tPzs=; b=ARwUx3W3JrXh0ekXibUzboESNs
	aUH0Ro2rc4bJOor5UqSsd5S+hglhon2emDagHM4PkWJIXKGCFqBu2qjuL7aFJnERgo4CmbXsejt2R
	v6ql4Y8iFeS+NMRGN0TvVSxm6g5QFMxzEJkDVWOEqqGuy/3DymfXNW00/4SYUya0ohynRCCWklii0
	9RPvUx4usLNQT5XgPP/j/PPQ1Mztp0GHFNs5iBBCf2sHy2fejAm81G02AHfLSDb6ONTh+QBdZ/Ji8
	v0UhfDhSqKvI03oqx4zBvYlVwdB5iozOCkvRbDcvf9QceOZkH3IanRrb59c9JF2Q99zBwf8BKd3gF
	YiY2u+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGN73-0000000BVsy-2rxi;
	Mon, 12 Oct 2026 20:59:13 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGN6z-0000000BVs7-3S3w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 20:59:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D914A1583;
	Mon, 12 Oct 2026 22:58:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791838738; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b7gHMV3umSUeDW/ePA4faUCYbBu5Azy4eUsgtI9tPzs=;
	b=EzSm5dvL7ATlJxnSTNJmDAp/fW9wg6fTo12WUZXP8S953bpQ8tsUVSOxYBYo6wrXw4QwnY
	Ma6OZwWUqp7wFVH3q0koTg/H94K86mjCmZAhiDirvqCQY0FQwF76mF8jQzoDP7HHWVdaq1
	1XP0HZvB3BUsnYZ/DSuhXruffJ4fUyILiGoxLzTB+rciulAVysagewVFZB8QUhvPXL0UoD
	6mFq7gpQNduexAR0s2n2omYqH+3rC13IJwgoGp7nVgaKBnZ6T83YPLQlW/uVvDj5j9OhWb
	w/z6PY9EzcqiX4/fPGRBKTi/l3sLPRH9an+n+8Un3nAWEbBOjO2jLP9hrFY52A==
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 22:58:52 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, Ong Boon
 Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, James Hilliard
 <james.hilliard1@gmail.com>
Subject: Re: [PATCH net-next v6 1/4] net: stmmac: take ownership of saved RX
 state at poll entry
In-Reply-To: <20261012-stmmac-rx-mb-v6-1-2225050915c1@oss.qualcomm.com>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
 <20261012-stmmac-rx-mb-v6-1-2225050915c1@oss.qualcomm.com>
Message-ID: <829fd355a6673517df0eeaa382f078c4@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_135910_623903_71E47BBE 
X-CRM114-Status: GOOD (  13.91  )
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

On 12.10.2026 18:44, Lorenzo Bianconi wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> When a saved partial packet completes with a poll budget of one, the
> old loop can leave state_saved and state.skb pointing at an skb that
> has already been delivered or freed. The next poll then reuses that
> pointer, causing a use-after-free or double free.
> 
> Take the saved state at poll entry and clear the stored ownership
> immediately. Save it again only if the packet remains incomplete,
> including when the next descriptor is still DMA-owned.
> 
> Track the frame-in-progress flag independently of the status read from
> the next descriptor. The old code keyed the save on the status of the
> last descriptor looked at, so a loop stopped at a DMA-owned descriptor
> (rx status not yet valid) could drop the saved error/length bookkeeping
> in stmmac_rx_zc().
> 
> Drop the saved state both when the queue parameters are reset and when
> the ring is destroyed. stmmac_reset_rx_queue() is reached from
> __stmmac_open(), stmmac_xdp_open(), stmmac_resume() and
> stmmac_enable_rx_queue(); without draining it there, a partial frame
> saved before suspend (or before a queue is disabled and re-enabled)
> survives while cur_rx and dirty_rx are re-armed, and the first poll
> resumes that stale skb with descriptors from the freshly initialized
> ring. __free_dma_rx_desc_resources() releases it on teardown.
> 
> Apply the same state handling to stmmac_rx_zc(), which also leaves
> state_saved set when a saved frame finishes at the budget boundary.
> That path saves only error and length bookkeeping, not an skb pointer.
> 
> Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header 
> support")
> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

