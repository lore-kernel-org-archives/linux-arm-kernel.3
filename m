Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6D5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XY2VODNv1709dsUm1V1hMZed47t8ffS11EGWF+4N014=; b=HrfUxdwKKX49LiOw3ImsRhfQa/
	GeOmjrZ2P8qBW1GpITqE5PHS3/pCKr4NK9GsKCqym5de0DJk4N/xnT2TTHTt2EVUzyw+Mklc22FVr
	46dYBAHJRja1XUSk3w86zIaGhs1JeKBbcwKv+fUIbUzW/CgTORKFt5WrKo1KSbVLp0G2P8OSzhLYs
	eS/sdaRj/132wsbfZ+e1U3TZbkXyGRe8rlEPEcksMNbOboGVPDqI+rxkfbHrSPIBlcyP2kffVMoln
	OTBfahW4u8r/wk16uDU16JhfmsOQB0gq77mqoRUEleGBAuupYPQ2twro7vMcIpkf+p5GpcVlI/y3m
	OJogM+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTyB-00000004FhG-3zq7;
	Wed, 23 Jul 2025 07:32:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTvi-00000004FKT-3AeZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 07:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F09CB6691D;
	Wed, 23 Jul 2025 07:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231B4C4CEE7;
	Wed, 23 Jul 2025 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753255820;
	bh=FbNwzN2/uLaiFpmgiq5NTNUhWFAl35zHY3pxae52iF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZipQC3l8bjWiKOeN/wsGZxVfgEynMvry7829OsbLSLMuy01exL6T1I9wTyaAeOtkq
	 AfU+IyxQnQBVRe9QdbEE80XA2OEGrNSHiT5m56i8WvMZAy9Krujyivync1hQrAtM0l
	 zPylPI5OaadYRbT2eGhaDFCDQ1CzpzzE3hsYcbrjjP9i9ONGuQbHB4qRkqtfxQFuAG
	 eljUuLd2DBjjIDn0nal2UC9Un5+KsSEviK7p9sSvncAFEdFhCkg5zaexeEqDaqmKBC
	 VuKhBUPXa/DKeUNSyaZv6vkGl4KvDDRqLMKwlxe+UkTqYxJx2qkF3CaLpdj1R7g4da
	 YLidie6IXC9RQ==
Date: Wed, 23 Jul 2025 13:00:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, harini.katakam@amd.com
Subject: Re: [PATCH V2 1/4] dmaengine: Add support to configure and read IRQ
 coalescing parameters
Message-ID: <aICPiS1_ITwELrxq@vaman>
References: <20250710101229.804183-1-suraj.gupta2@amd.com>
 <20250710101229.804183-2-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710101229.804183-2-suraj.gupta2@amd.com>
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

On 10-07-25, 15:42, Suraj Gupta wrote:
> Interrupt coalescing is a mechanism to reduce the number of hardware
> interrupts triggered ether until a certain amount of work is pending,
> or a timeout timer triggers. Tuning the interrupt coalesce settings
> involves adjusting the amount of work and timeout delay.
> Many DMA controllers support to configure coalesce count and delay.
> Add support to configure them via dma_slave_config and read
> using dma_slave_caps.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  include/linux/dmaengine.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index bb146c5ac3e4..c7c1adb8e571 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -431,6 +431,9 @@ enum dma_slave_buswidth {
>   * @peripheral_config: peripheral configuration for programming peripheral
>   * for dmaengine transfer
>   * @peripheral_size: peripheral configuration buffer size
> + * @coalesce_cnt: Maximum number of transfers before receiving an interrupt.
> + * @coalesce_usecs: How many usecs to delay an interrupt after a transfer
> + * is completed.
>   *
>   * This struct is passed in as configuration data to a DMA engine
>   * in order to set up a certain channel for DMA transport at runtime.
> @@ -457,6 +460,8 @@ struct dma_slave_config {
>  	bool device_fc;
>  	void *peripheral_config;
>  	size_t peripheral_size;
> +	u32 coalesce_cnt;
> +	u32 coalesce_usecs;
>  };
>  
>  /**
> @@ -507,6 +512,9 @@ enum dma_residue_granularity {
>   * @residue_granularity: granularity of the reported transfer residue
>   * @descriptor_reuse: if a descriptor can be reused by client and
>   * resubmitted multiple times
> + * @coalesce_cnt: Maximum number of transfers before receiving an interrupt.
> + * @coalesce_usecs: How many usecs to delay an interrupt after a transfer
> + * is completed.
>   */
>  struct dma_slave_caps {
>  	u32 src_addr_widths;
> @@ -520,6 +528,8 @@ struct dma_slave_caps {
>  	bool cmd_terminate;
>  	enum dma_residue_granularity residue_granularity;
>  	bool descriptor_reuse;
> +	u32 coalesce_cnt;
> +	u32 coalesce_usecs;

Why not selectively set interrupts for the descriptor. The dma
descriptors are in order, so one a descriptor is notified and complete,
you can also complete the descriptors before that. I would suggest to
use that rather than define a new interface for this

-- 
~Vinod

