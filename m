Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA01CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLz84RlIFA/ezbsdeKX6wIecndzPrALIQ90angFyRwM=; b=0PzmC3WxJCgjqx787Zl1/6PzWX
	3d5BEaZSXGzxPS+UMZW/CENer/W8pRgj5Ni9aOmr1+8pDJ2YK+dioeIe3m84pEC30t+VGz1m+w8bV
	J57BSQA2TwoWO/EZWj3Ka2GZnRd+yJVxrAYBNPW9heBm9vsSgX7fIMskdHM12xKH1oCXAjh7IBd8Z
	vtosb6ChzvchRaw55/enlSLmA7OOsw8zKk3HYPSFlz+RqbQNP5pfOnQBbSU/M0dLXQ+m7W8XdXXkH
	xI9BSCv1Fr+J6djlpC6saHhNcAXkvZPBWagUKAZ65eayr5uKp2fS1cKOsPUWdUDz5DBAZ7pXGcwZd
	SCNNXc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITOU-00000005dzX-3U0X;
	Mon, 10 Nov 2025 15:01:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITOT-00000005dzJ-41vZ;
	Mon, 10 Nov 2025 15:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AD29601A6;
	Mon, 10 Nov 2025 15:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E05C19422;
	Mon, 10 Nov 2025 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762786880;
	bh=Ao89H0EjkcwXVj9g8SuLAjvtSkWXCQ1U/p78QLpZKFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONamQnDtP1ebBhZudUfAlK8M+CRqK8ZD4mj6kbsJOyUVDQW5+wxfH469PTVyALlkw
	 6ulJTJneVOsX4rFcHWwkCLPOZqSSGQt2VmPyQavms6nRr+BM9pR5XF+MIED+V6ITOL
	 rTEp4LmbSNft/8CuSctgsSSadzjPFFF/BztEUnGj8PwnOoSqOvux8pfyGFpFBCCW1l
	 5/PT35pY+zow1r1HRzrc1HyidS2Rfq0NZ1g6f/TIMouBfYGirvToaC/W4Qy34Zx1cq
	 3Qo4WgnQsO+3YDI44aiedy5Ecr/3aH0qdXrpPkEGxECDmp7uWDyP9lbqX2ZPLuGR6Y
	 7EQLiLDk8VBQg==
Date: Mon, 10 Nov 2025 09:05:26 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Vinod Koul <vkoul@kernel.org>, 
	Thomas Andreatta <thomasandreatta2000@gmail.com>, Caleb Sander Mateos <csander@purestorage.com>, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Olivier Dautricourt <olivierdautricourt@gmail.com>, 
	Stefan Roese <sr@denx.de>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 01/13] scatterlist: introduce sg_nents_for_dma() helper
Message-ID: <waid6zxayuxacb6sntlxwgyjia3w25sfz2tzxxzb4tkqgmx63o@ndpztxeh6o32>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
 <20251110103805.3562136-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110103805.3562136-2-andriy.shevchenko@linux.intel.com>
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

On Mon, Nov 10, 2025 at 11:23:28AM +0100, Andy Shevchenko wrote:
> Sometimes the user needs to split each entry on the mapped scatter list
> due to DMA length constrains. This helper returns a number of entities
> assuming that each of them is not bigger than supplied maximum length.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/scatterlist.h |  2 ++
>  lib/scatterlist.c           | 25 +++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
> index 29f6ceb98d74..6de1a2434299 100644
> --- a/include/linux/scatterlist.h
> +++ b/include/linux/scatterlist.h
> @@ -441,6 +441,8 @@ static inline void sg_init_marker(struct scatterlist *sgl,
>  
>  int sg_nents(struct scatterlist *sg);
>  int sg_nents_for_len(struct scatterlist *sg, u64 len);
> +int sg_nents_for_dma(struct scatterlist *sgl, unsigned int sglen, size_t len);
> +
>  struct scatterlist *sg_last(struct scatterlist *s, unsigned int);
>  void sg_init_table(struct scatterlist *, unsigned int);
>  void sg_init_one(struct scatterlist *, const void *, unsigned int);
> diff --git a/lib/scatterlist.c b/lib/scatterlist.c
> index 4af1c8b0775a..4d1a010f863c 100644
> --- a/lib/scatterlist.c
> +++ b/lib/scatterlist.c
> @@ -64,6 +64,31 @@ int sg_nents_for_len(struct scatterlist *sg, u64 len)
>  }
>  EXPORT_SYMBOL(sg_nents_for_len);
>  
> +/**
> + * sg_nents_for_dma - return the count of DMA-capable entries in scatterlist
> + * @sgl:	The scatterlist
> + * @sglen:	The current number of entries
> + * @len:	The maximum length of DMA-capable block
> + *
> + * Description:
> + * Determines the number of entries in @sgl which would be permitted in
> + * DMA-capable transfer if list had been split accordingly, taking into
> + * account chaining as well.
> + *
> + * Returns:
> + *   the number of sgl entries needed
> + *
> + **/
> +int sg_nents_for_dma(struct scatterlist *sgl, unsigned int sglen, size_t len)
> +{
> +	struct scatterlist *sg;
> +	int i, nents = 0;
> +
> +	for_each_sg(sgl, sg, sglen, i)
> +		nents += DIV_ROUND_UP(sg_dma_len(sg), len);
> +	return nents;
> +}

We need an EXPORT_SYMBOL() here.

With that, this looks good to me.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> +
>  /**
>   * sg_last - return the last scatterlist entry in a list
>   * @sgl:	First entry in the scatterlist
> -- 
> 2.50.1
> 
> 

