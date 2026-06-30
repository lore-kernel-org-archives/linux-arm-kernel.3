Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ewpUf4cNOvt9d0UUmC8hZbJDc1XmG2sBxDSs3hf5Ac=; b=HXxqPGjFD5eyCFyklB2IIvNZoQ
	Owv+/sRer0rPzOdxdtFWHmMVLwr5VYvsubo6Xq5pVup2d/YGbq33/C+8Ieag9ctd2OiCZ0gR8s6Bx
	4b0cpjHYEAwSuaLMN1Lo21oyZydLyWmOZHiy6KCLRLANz2EjEugc6x4kXr93Z0JXYGPQat+rq3JS0
	YDOcp8oF/Ut7uUuK3Nrm/69FljuYhR0GZooeG98hmvjEbMfTOj1nxs892HTqDlzR5l11A3Y1rLfLz
	XWG0T2AlfZc1QykRHCaky5Gb7mq/dqiyXuNh0M9wqX4ThXaPL6qNmfqqGXrYeLWUpDQxMIhs4ydq0
	DB2zgyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWjK-0000000GrPf-3ULo;
	Tue, 30 Jun 2026 11:34:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWjJ-0000000GrPX-34qM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:34:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CCFB408B1;
	Tue, 30 Jun 2026 11:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1070A1F000E9;
	Tue, 30 Jun 2026 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819256;
	bh=9ewpUf4cNOvt9d0UUmC8hZbJDc1XmG2sBxDSs3hf5Ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bP5lOibsywM0z0kYIuPgcMctuls7Wc8cuV6rpo6h9xoL/qFdCtDV0QEf4OnT3goU8
	 aX1GV+F4rgt7BKiMrSznJXKmXepiYPjrpAhF46V1wBdIz5u1cdbj01xfVPSHTW+1Nk
	 XCcIbBnYP/s4mPrXGyDuzsn8hNZc04w59T5aeLUHR7HEWZz+ABa8r+drFZMfkaEai1
	 3UXRtAhHr1ecB8z4Tt4ikaS2ifKOua2ZDJugtltbh928rUgjA0H4nHDHr0h/Wu82gA
	 exuVqh7N4OZlmPeWYJ9TjyH5pfBPJXesCzc3tDo09Ok4QlFkW+ny5/MZzL+uFGhy8m
	 FLacHYjHZC+2w==
Date: Tue, 30 Jun 2026 17:04:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, mripard@kernel.org, arnd@arndb.de,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	zhongling0719@126.com, Frank Li <Frank.li@oss.nxp.com>
Subject: Re: [PATCH v4] dmaengine: sun6i-dma: Fix memory leak in
 sun6i_dma_terminate_all
Message-ID: <akOptOSkd7o0Vivk@vaman>
References: <20260618020609.1155962-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618020609.1155962-1-zenghongling@kylinos.cn>
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

On 18-06-26, 10:06, Hongling Zeng wrote:
> When terminating DMA transfers, active descriptors are not properly
> reclaimed. Only cyclic descriptors were handled, leaving non-cyclic
> descriptors and their LLI chains to be permanently leaked.
> 
> Fix by using vchan_terminate_vdesc() which handles both cyclic and
> non-cyclic descriptors by adding them to desc_terminated queue for
> proper cleanup.
> 
> Add pchan->desc != pchan->done check to prevent double-adding completed
> descriptors, which would corrupt the list.

Thanks for the patch. Please consider revising the subject which should
describe the changes in the patch and not the fix/issue.

A better one would be "fix reclaim descriptors while terminating"

> 
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> 
> ---
>  Change in v2;
>  -Add pchan->desc != pchan->done check to prevent race condition
>   where completed descriptors could be double-added to desc_completed
>   list, causing list corruption
> ---
>  Change in v3:
>  -Fix by using vchan_terminate_vdesc() as suggested by Frank Li
> ---
>  Change in v4:
>  -Correct the commit message
> ---
>  drivers/dma/sun6i-dma.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 7a79f346250a..134ae840f176 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -946,16 +946,13 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  
>  	spin_lock_irqsave(&vchan->vc.lock, flags);
>  
> -	if (vchan->cyclic) {
> -		vchan->cyclic = false;
> -		if (pchan && pchan->desc) {
> -			struct virt_dma_desc *vd = &pchan->desc->vd;
> -			struct virt_dma_chan *vc = &vchan->vc;
> -
> -			list_add_tail(&vd->node, &vc->desc_completed);
> -		}
> +	if (pchan && pchan->desc && pchan->desc != pchan->done) {
> +		struct virt_dma_desc *vd = &pchan->desc->vd;
> +		
> +		vchan_terminate_vdesc(vd);
>  	}
>  
> +	vchan->cyclic = false;
>  	vchan_get_all_descriptors(&vchan->vc, &head);
>  
>  	if (pchan) {
> -- 
> 2.25.1

-- 
~Vinod

