Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCFEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k064ZvMun284uDaXZd4Db14gBsND1gm4KYQ67hv9h88=; b=ocWkGyV7nUFyuqJNkiT+hCKNkI
	ixJ+zBC/IbbY7nrDkL7Fr3wNwvrZCqaUjPqlzPg4hF4KR1cRD8ipH+523VhJ+3VpNRXyyJ8oXZlao
	UYBOoG/lnG72SNqv07J0PVYdQMZ/CfuRYD+pJfyKiPaIfSwCfr5o7kUgDmqP9DkzRDLEnEfwQCMfl
	EOzXSMnfgxdO3c1yDc5y4Joj0UgfKexujCZnMUkcB+/VThvH/MUI4Ij/+jqmTlT25+J0B9xqMRlsQ
	uTPNyrzfrUNYY5T4PKL/4eLTp/16O6lIk31RoDmZP0Okm3TcHp2+Yexn1d1BIBCSF5H5G8tL1p8sv
	0WYgRR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrOb-000000030Yp-1eIS;
	Thu, 09 Jul 2026 16:14:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrOa-000000030YG-0ebW;
	Thu, 09 Jul 2026 16:14:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9811640288;
	Thu,  9 Jul 2026 16:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A7F1F000E9;
	Thu,  9 Jul 2026 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783613679;
	bh=k064ZvMun284uDaXZd4Db14gBsND1gm4KYQ67hv9h88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J46x5i9RvK2/EnDTyF1VX/OcvrhzbiVnrFH274TGikFB3gfR2FzdAeou/x0Cy7gtR
	 LY3vL7tAIYDRP2oFB7CSpkr1QO1562a6nsiOEGHGpYkA35/xmzbI3ITMadaczaDaWN
	 EL/Z7L8GpMRmv2OXJ7T7h0BO014EijAV6iQaegtltUopWVT1MM881d0KCLs1U8hVww
	 MHUuQ4/ifUYl1ig8iAVOtBYT2zdICzI1cPjRJwT7c3gaAxJ+sFHXOmANwQSvAtYhn4
	 Hv0QtKbVFTq7w2FY27YoXst7BrjThs5rnIf7Q10rdbmxbn9ATEBRXb9krMairuIQCv
	 iIina1BbBhyeg==
Date: Thu, 9 Jul 2026 17:14:35 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 2/3] net: airoha: fix ETS QoS stats counter
 underflow and cross-channel corruption
Message-ID: <20260709161435.GR1364329@horms.kernel.org>
References: <20260703-airoha-ethtool-priv_flags-v8-0-015ba5ac89ee@kernel.org>
 <20260703-airoha-ethtool-priv_flags-v8-2-015ba5ac89ee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-airoha-ethtool-priv_flags-v8-2-015ba5ac89ee@kernel.org>
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

On Fri, Jul 03, 2026 at 11:19:26AM +0200, Lorenzo Bianconi wrote:
> airoha_qdma_get_tx_ets_stats() has two bugs:
> - The hardware counters read via airoha_qdma_rr() are 32-bit values
>   but are stored in u64 locals and subtracted from u64 baselines. When
>   a 32-bit hardware counter wraps around, the subtraction produces a
>   large underflow value passed to _bstats_update().
> - The baseline counters (cpu_tx_packets, fwd_tx_packets) are stored as
>   single per-device fields, but airoha_qdma_get_tx_ets_stats() is
>   called with different channel values (0-3). Each call reads a
>   different channel's hardware counter but overwrites the same
>   baseline, corrupting the delta computation for other channels.
> 
> Fix both by:
> - Narrowing the counter locals and baselines to u32 so that 32-bit
>   unsigned subtraction handles wrap-around naturally.
> - Grouping the baselines into a per-channel qos_stats array so each
>   channel tracks its own previous counter value independently.
> - Splitting the delta addition into two statements so the first u32
>   delta is widened to u64 on assignment and the second is added in
>   u64 arithmetic, preventing overflow when both deltas are large.
> 
> Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


