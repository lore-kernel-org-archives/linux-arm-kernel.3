Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914D9C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDwppf5TaAtyT72KOdBATJ3WJiKV3w3Hh6OmGhriJfQ=; b=TKRGzy6ouiya+wSHTXofpnYrF1
	ZyiYmtUhUqjP87s0JOoxYPGQN4oxoawliDg9vckzYookFLRbn2IaRoIG9rRWrtzsQMBZSdNzzi8cD
	VnjxjcFFe8i7zaTdAt8iEl9lZ3zCfPnrk4gmU/01EL9Bp2kDRQBLDH7TYfKFMnHf4p2WbBuCcn0E3
	zzWOzX+bWkKuowyz1cCOM88tLoBmtHycp0cUTxQdySCrcwkvkqYg3ix0eSmTPZ9cpiXGPFosp1YdS
	l86cd9zrWHfMKhbrDK4Gj5No/KlGkpDZb+JQLeVC3Jeg+mojd+ipAcNJMdaYSpXFIsUljVgCtOW5V
	chQ9t0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZI-00000009ALL-2GTy;
	Wed, 02 Jul 2025 17:48:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0wU-000000094IZ-2aOe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 17:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEEA64483C;
	Wed,  2 Jul 2025 17:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F52C4CEED;
	Wed,  2 Jul 2025 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751476097;
	bh=sl+L6c54S4JFvlxl6rBTBhnWpBiz19X6BE8lx/bDcPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ne6mhWW5/ruaxicHzkogiUibQWjbCGTAI+my3l4pVqB15UOy1fW6nLHm9mZROYlDa
	 PzWhevJsY4UJj9sCUNIj6dJJ7cZKFn6XiIecaEgHCVZZwbtgB0ixXgVhMM+ak/sDyy
	 Jma4GMusJQ1DbYwp13XD+6jkWW88Cd3y5UhC/Lt/O/nq9DrCRkisDhza0XHFhsRmMB
	 WISjBHieLagyhTV5XYWNtUMwUKHYmaTaC4C1Tq2h1MSDUfJAjFu4ZV+t640sDopXwC
	 a2HSyzYZk0lBNN1sHlKHp9oM3CybVJvSzzjlpdk7eTclBXjeZ1+qtmcG0pI4kAXxxF
	 uukyrWgcQ6IfA==
Date: Wed, 2 Jul 2025 19:08:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
	linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 2/3] i2c: stm32f7: unmap DMA mapped buffer
Message-ID: <zp3pagbojmu67o4sjm65a44ovvui5uvybs32nayvhtewfbm4el@n5lro4v5iq36>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_100818_698838_7A61EC51 
X-CRM114-Status: GOOD (  18.08  )
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

Hi Clement,

On Mon, Jun 30, 2025 at 02:55:14PM +0200, Clément Le Goffic wrote:
> Fix an issue where the mapped DMA buffer was not unmapped.

"Fix an issue..." is too generic. Can you be more specific? Where
was it mapped? Where was it left unmapped?

Please, do consider that the user needs to understand what
happens in the patch without needing to look into the patch.

> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e4aaeb2262d0..042386b4cabe 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1554,6 +1554,8 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev,
>  	if (i2c_dev->use_dma) {
>  		stm32f7_i2c_disable_dma_req(i2c_dev);
>  		dmaengine_terminate_async(dma->chan_using);
> +		dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +				 dma->dma_data_dir);
>  	}
>  
>  	i2c_dev->master_mode = false;
> @@ -1622,6 +1624,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  		if (i2c_dev->use_dma) {
>  			stm32f7_i2c_disable_dma_req(i2c_dev);
>  			dmaengine_terminate_async(dma->chan_using);
> +			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +					 dma->dma_data_dir);
>  		}
>  		f7_msg->result = -ENXIO;
>  	}
> @@ -1642,6 +1646,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
>  				stm32f7_i2c_disable_dma_req(i2c_dev);
>  				dmaengine_terminate_async(dma->chan_using);
> +				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +						 dma->dma_data_dir);

Can't we use the dma_callback here, or similar? I see some
similar patterns and I think the code can be improved.

Andi

>  				f7_msg->result = -ETIMEDOUT;
>  			}
>  		}
> 
> -- 
> 2.43.0
> 

