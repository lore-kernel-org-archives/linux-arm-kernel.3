Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B30CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 10:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLggc6D5Y1k/S3Gu+2V3OtePga4cxDlEo3qo1/u86xI=; b=QBGp42ExHDgRSAHlpummZSBrND
	8sPMyH0EEUULbRW/AW1pjgZkZwNN4IDFlrOtgB9r03pROq42pUP4X2g8RMiyRIcvFdSKJK+WSBTlA
	yY78LLcP8i5wsHBbvkOSaqdrJ8HgeaumxIkOqjMtPtk8kdk6REaq7XSCQPCKHvrdEZxBGJ9/JdR7u
	TfoetbLF31ckwLdGNgPmP7hCZTO0bJgJj7fjg2BdhtKif+57Znh3c8hFCdIYdVLlJqqrtTn8RlZLM
	TrYN+66AtYjpDGzV7Yj3BGtTvBnixEpinRXLQ4SFzJY91dQhK61R6WrOmQO9+tjz4ypxkXPcb/GPD
	NLWAKfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7X4K-0000000A3C2-15gK;
	Sat, 11 Oct 2025 10:43:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7X4J-0000000A3Bt-2GrV;
	Sat, 11 Oct 2025 10:43:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92372603DD;
	Sat, 11 Oct 2025 10:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737BCC4CEF4;
	Sat, 11 Oct 2025 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760179398;
	bh=nvw6W22YNUcuYDkHM+/YmRNu7p7dmP/S/3RcNhOY36U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7YRL+XvPTvkgZK8XFE7+R7vW0qu3Q9vz9NeH6kX1WYopPqSBVEDm/tpicH10elOm
	 mtxO8+nClsaSliE7N9vg0ra4GVLP34we1YWBfftqCtl8W8C1+9kLBhXC9fOZfMI//6
	 x2BNtd3E8Z05g9V7prCiRug5HF950H2QOuKWorVId+dSXVEmSQZf5hnp4A1Kv/s8ey
	 nsAOW+PvetWJife73IN+NqWpjUS1y8+bujPHItr8wjrcn81inYRccNvV0ls7/Rrcxj
	 2W/qz3tcMo/BwmmA2o4VA4i3A8LQerqjX5DWx6kGVfQQwHvCNv2Xuz9/4y675ycEol
	 OMFiEChbBUG/g==
Date: Sat, 11 Oct 2025 11:43:14 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Take into account out-of-order tx
 completions in airoha_dev_xmit()
Message-ID: <aOo0woPiMxjABFv2@horms.kernel.org>
References: <20251010-airoha-tx-busy-queue-v1-1-9e1af5d06104@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-airoha-tx-busy-queue-v1-1-9e1af5d06104@kernel.org>
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

On Fri, Oct 10, 2025 at 07:21:43PM +0200, Lorenzo Bianconi wrote:
> Completion napi can free out-of-order tx descriptors if hw QoS is
> enabled and packets with different priority are queued to same DMA ring.
> Take into account possible out-of-order reports checking if the tx queue
> is full using circular buffer head/tail pointer instead of the number of
> queued packets.
> 
> Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 833dd911980b3f698bd7e5f9fd9e2ce131dd5222..5e2ff52dba03a7323141fe9860fba52806279bd0 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1873,6 +1873,19 @@ static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *dev)
>  #endif
>  }
>  
> +static bool airoha_dev_is_tx_busy(struct airoha_queue *q, u32 nr_frags)
> +{
> +	u16 index = (q->head + nr_frags) % q->ndesc;
> +
> +	/* completion napi can free out-of-order tx descriptors if hw QoS is
> +	 * enabled and packets with different priorities are queued to the same
> +	 * DMA ring. Take into account possible out-of-order reports checking
> +	 * if the tx queue is full using circular buffer head/tail pointers
> +	 * instead of the number of queued packets.
> +	 */
> +	return index >= q->tail && (q->head < q->tail || q->head > index);

Hi Lorenzo,

I think there is a corner case here.
Perhaps they can't occur, but here goes.

Let us suppose that head is 1.
And the ring is completely full, so tail is 2.

Now, suppose nr_frags is ndesc - 1.
In this case the function above will return false. But the ring is full.

Ok, ndesc is actually 1024 and nfrags should never be close to that.
But the problem is general. And a perhaps more realistic example is:

  ndesc is 1024
  head is 1008
  The ring is full so tail is 1009
  (Or head is any other value that leaves less than 16 slots free)
  nr_frags is 16

airoha_dev_is_tx_busy() returns false, even though the ring is full.

Probably this has it's own problems. But if my reasoning above is correct
(is it?) then the following seems to address it by flattening and extending
the ring. Because what we are about is the relative value of head, index
and tail. Not the slots they occupy in the ring.

N.B: I tetsed the algorirthm with a quick implementation in user-space.
The following is, however, completely untested.

static bool airoha_dev_is_tx_busy(struct airoha_queue *q, u32 nr_frags)
{
	unsigned int tail = q->tail < q->head ? q->tail + q->ndesc : q->tail;
	unsigned int index = q->head + nr_frags;

	return index >= tail;
}

...

