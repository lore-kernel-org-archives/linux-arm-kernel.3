Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECBAC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ryMO4/DGARz6dpCLQgFlxwCCK8jbknJTAtU+Z1iluM=; b=dAlttLp1QXclUQGWhQjBci7s8n
	i0OkPizbq3OXlhpujz587r2ZOuFXfVKD7bZ+ce6HBve73Be2oRtPmDHftKk6OeAuuzyOkArSf9OtV
	yH7EqKD/Pw2xnDzRLqnqZHmhF8V7sc3kWMdtxKn89R7e8+NCyyFNCLUB9FWgrzmx4DIbluddOz+i6
	+ufian2B8ANs30cujIVjxOy3zLpUUAZcY+8Bj5PxX81mxvE4LZwOsNpPQhxhChbjylDiVLFDRsEFM
	oLMK7h7FV+5l765qMjBwXZJgAZG+tONhFWR1dWY8HZowrNgsGhxVAoligppl7IJJsOIGzNXFio7T6
	KlTWX49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0Kh-0000000BRcm-0bMC;
	Wed, 15 Jan 2025 10:09:07 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0JQ-0000000BRUt-45Im
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:07:50 +0000
Message-ID: <7b6acdc1-5151-427a-ac84-a6cb666f53ca@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736935663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ryMO4/DGARz6dpCLQgFlxwCCK8jbknJTAtU+Z1iluM=;
	b=sQ5UBkzG6Sa3qwVPFnRjJjSi78MlbdlIdHnotUb3Krv0djZP3ulfjNYrnAvnejXn9nljQU
	SvZ+0x2kBc/MdnUJ3aGiOIqMwLFJVYJUtFNSTWSgld9Cfw7zvgM3nDN7uL4BSNBcKXVIVO
	ZkT9vGUEOC1SEqDw/a7zktPocbQc8Pk=
Date: Wed, 15 Jan 2025 18:07:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 2/4] net: stmmac: Set page_pool_params.max_len
 to a precise size
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
 Joe Damato <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
References: <cover.1736910454.git.0x1207@gmail.com>
 <538f87c8bdd0ba9e2b9cb5cd0e2964511c001890.1736910454.git.0x1207@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <538f87c8bdd0ba9e2b9cb5cd0e2964511c001890.1736910454.git.0x1207@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_020749_696008_D68F3382 
X-CRM114-Status: GOOD (  11.31  )
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

在 2025/1/15 11:27, Furong Xu 写道:
> DMA engine will always write no more than dma_buf_sz bytes of a received
> frame into a page buffer, the remaining spaces are unused or used by CPU
> exclusively.
> Setting page_pool_params.max_len to almost the full size of page(s) helps
> nothing more, but wastes more CPU cycles on cache maintenance.
> 
> For a standard MTU of 1500, then dma_buf_sz is assigned to 1536, and this
> patch brings ~16.9% driver performance improvement in a TCP RX
> throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> core, from 2.43 Gbits/sec increased to 2.84 Gbits/sec.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng

> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>   drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h  | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)



