Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DzUDeGy6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ixrA1YXo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PK2lzk2mI4nQc8YfV5A1vWK0eiPo0oKUX3U4tb8dEk=; b=DzUDeGy6pIl89M56CaaJDMfBEN
	XWQI1XBr3T2UKjHKw76EoGdKThNfEhZicth4d0YkocJ91Ry3cW0WHDfqEoqtA3mBIqfILi8F/nFd+
	7Rm689OvsOuvHJVAxKz5T06HLggqDBHnEvLwwM1gN5t1+2GbCRZNaotmQURxDGrZ3BrQxLdZSeuy1
	sjVnAVptIKl70ebdoZRp+3eD3Ah3FVkCNbE5pGL9uiLR/EtGR6p1Wni2dvdhkvGLM8A8a+enoxJTR
	pxjc4mp+rdZybCBW09I5svdjSOjYgezYBnS/VPM+ciEezu+ABy6vnRTnnnB5dZ5GEH1y/4jHNU+RJ
	siyujtEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEzv-0000000AUZI-0lJZ;
	Tue, 20 Oct 2026 18:55:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEzt-0000000AUZ0-2aAi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:55:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 096DD43917;
	Tue, 20 Oct 2026 18:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95591F000C9;
	Tue, 20 Oct 2026 18:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792522540;
	bh=4PK2lzk2mI4nQc8YfV5A1vWK0eiPo0oKUX3U4tb8dEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ixrA1YXoG1+qDDsa71ntE6lr2e2co5LFsNrTKt8FNl3m6zEf+qKK604id9y1tabd8
	 14W+Z3DkFxcjCaLductg5BAFEYKUO/ziRrIBgad7TlD7Ux5YukQqYgpeulnSiaMR62
	 N0aRHjT3HzxcpmuNxWh2VOoAmQgl4EOdXN8PUXHgSsGXT7AT/fKY45YiDCm8mZNXWR
	 5E1OveQbNkOjLlxffgevQBqSit/uR6E5Gn2TBr9dhF7BshNAWk2hR7vV1c0HogUU4Q
	 QsDZ+HUowwJwoEVGcYgikapOSOf2EUNvV5YE2kuXOITX6tvb6g3I6tsnyU6ACMGpUL
	 ZMXY+v7EkiUFg==
Date: Tue, 20 Oct 2026 19:55:36 +0100
From: Simon Horman <horms@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net] net: axienet: don't advance the TX ring head before
 the descriptor is ready
Message-ID: <20261020185536.GR503057@horms.kernel.org>
References: <20261013-b4-axienet-dmaengine-ring-head-v1-1-7add24e74477@toxicpanda.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-b4-axienet-dmaengine-ring-head-v1-1-7add24e74477@toxicpanda.com>
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 13, 2026 at 06:25:06PM +0000, Josef Bacik wrote:
> axienet_start_xmit_dmaengine() bumps lp->tx_ring_head before
> skb_to_sgvec(), dma_map_sg() and device_prep_slave_sg(), and none of
> their error paths undo it.  The skb is freed and nothing is submitted,
> but the slot stays claimed.  axienet_dma_tx_cb() walks tx_ring_tail
> once per completion, so the next completion lands on the abandoned slot
> and dereferences whatever skb pointer is left there: NULL if the slot
> was never used or was already completed, or a stale skb that gets
> consumed a second time.  Every completion after that is accounted
> against the wrong slot.
> 
> dma_map_sg() and device_prep_slave_sg() can fail at runtime, and so can
> skb_to_sgvec() on a malformed skb.  Only advance tx_ring_head once
> those have succeeded.  The completion callback can't run before
> dmaengine_submit(), so claiming the slot just before that is fine.
> 
> dmaengine_submit() itself can also fail on xilinx_dma after a channel
> error, and its return isn't checked either.  That's a separate problem
> and isn't changed here.
> 
> This was found by the Sashiko AI review of the skbuff BUG_ON() series.
> 
> Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
> Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
> Compile-tested only, I don't have the hardware.  The bug is in the error
> paths, which are easy to see from the diff: every goto after the old
> increment returns without submitting anything.

Reviewed-by: Simon Horman <horms@kernel.org>


