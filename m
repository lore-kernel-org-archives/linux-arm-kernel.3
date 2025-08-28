Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4250CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 01:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwOn30QiPyn0qHj3ZkxX/sIAZIkq2PgsfiPkNvkX0C4=; b=YJAdG5jnYNJCPCBC7huFACajNU
	lc1l/5mllUlubOu5vyT2Zs+4Lytix0f8T7Xv4I5BadZ/4EDULHbDHQUMtUJhHnLfjQmTvk2lyjz1h
	A4NxrBmQilpwSZ+dDNDvgY2356KRbabO1iC5s97M2W9UebMlO3GGQAdY+JY1WVe2bkf8OwYKyUKTa
	2lD/EOosKZncH71N6qtk84kAH1CsEXYJemNu3s3l+6YVU/bREhfVUJK+JMgmpB065ofV2KLyywOqm
	TiduC0YyIgMy+mf1bnOsYy2fR7nKzR1YOs3OpA0JficOp7XYo3wTn37z0Tcam91BC0mFbi01cBekl
	bKxjL9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urRJd-0000000HUBg-2HF4;
	Thu, 28 Aug 2025 01:20:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urRFb-0000000HTfP-47TW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 01:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69E17601D3;
	Thu, 28 Aug 2025 01:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90BAC4CEEB;
	Thu, 28 Aug 2025 01:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756343787;
	bh=1qvh7FuwAHEr4HKxFymbYY2odFZkstc1OtXh+ux1otw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H1VVtCDq8VzVgnW8qc384lkGjTID6Tgrh52L8O+ejsVygga8IYPyd46WYoVbv5zme
	 GafxmernB0BMHDZJLzimPFNvmayADOV0lUuxCEgMtC4bS3QtPDkK0VTBIdr1iw3jM+
	 JtnX6bY7jceabW+uqjqCf2VIQvEu/Dq//r7f+W8H0DLNK5FIXYUQ6VxKV1ycLG+FiR
	 9ZBOPc08b0y1nq7Qxo9m0rTD1jUEbfMIx19iIqd5v4SEM3goC6iPSL2CzSUdfUOyy8
	 eiLyIYvwt6dUTiBL5g6c6oP3szad9kzVKxzNIit/KBQubRYHGZPWSmtDcu6yiXXovl
	 BxZNtaqodqynA==
Date: Wed, 27 Aug 2025 18:16:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Abin Joseph <abin.joseph@amd.com>
Cc: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <michal.simek@amd.com>, <git@amd.com>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH net-next] net: xilinx: axienet: Add error handling for
 RX metadata pointer retrieval
Message-ID: <20250827181626.7d1dbc3f@kernel.org>
In-Reply-To: <20250826180549.2178147-1-abin.joseph@amd.com>
References: <20250826180549.2178147-1-abin.joseph@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 26 Aug 2025 23:35:49 +0530 Abin Joseph wrote:
> Subject: [PATCH net-next] net: xilinx: axienet: Add error handling for RX metadata pointer retrieval

Sounds like a fix, please repost as [PATCH net], against the
netdev/net tree.

> Add proper error checking for dmaengine_desc_get_metadata_ptr() which
> can return an error pointer and lead to potential crashes or undefined
> behaviour if the pointer retrieval fails.
> 
> Properly handle the error by unmapping DMA buffer, freeing the skb and
> returning early to prevent further processing with invalid data.
> 
> Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
> Signed-off-by: Abin Joseph <abin.joseph@amd.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 0d8a05fe541a..1729fd21d83b 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1166,8 +1166,17 @@ static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
>  	skb = skbuf_dma->skb;
>  	app_metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
>  						       &meta_max_len);
> -	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
> -			 DMA_FROM_DEVICE);
> +
> +	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size, DMA_FROM_DEVICE);

80 char width is still strongly preferred, at least in networking.
So please don't unwrap this line for no apparent reason :\

> +	if (IS_ERR(app_metadata)) {
-- 
pw-bot: cr

