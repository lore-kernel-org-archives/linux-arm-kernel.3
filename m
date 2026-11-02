Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143F9606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rvCp3qY/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvqjtEx8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KVOQNq9S8wxiZlJsxhiFCiqyhdxJhzKG+tbD5jT+WoU=; b=rvCp3qY/Gl7O8hWez1Qx7RKUKF
	6Zdygroilv0EZb080jHj0uSOV1HucQK8NEfnOVPhwztUdnpwGSS+fV08KRTCmLl8LyWh0Ezo07mlT
	UTkyb8Ax7EZy1+r6NuCA09rV4qSbjlaR0u7rWRQqzAiwZX1/D4NaXa4SyE+BdFe5JbqDxxo9g0YJU
	0q826UfkzwoTJiiS7Z9xUG5TaWe1vNCMstY9/uRlH1+wjjUK0MKjuYricwoUm9oMgNzOvwguP/xUh
	yPBPq85pqmSLipSgV8EMUS9CRh3pMWf9JKQ3WlSml7M2LB++99axbAi6Fhwdh1xNpzfmAPxDohdUx
	UbftKpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsa9-0000000GhTY-0YMd;
	Mon, 02 Nov 2026 14:00:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsa7-0000000GhTE-3YIH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:00:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9889641763;
	Mon,  2 Nov 2026 14:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013BD1F00A16;
	Mon,  2 Nov 2026 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793628015;
	bh=KVOQNq9S8wxiZlJsxhiFCiqyhdxJhzKG+tbD5jT+WoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mvqjtEx8gOhMPSPaJpvzNRVGPMNOMa+DWgnf08V2WGXMsCjLy+F3WSNVYPsS1p1Aa
	 Av2ErcZ2X6SpQWwTEVzzVBezd5uQoeyOYz87Gjevsf+A/ghwCRb0M2YcborupBCHAU
	 MdnkqHd14stqQQfxonHY6bnGcGl0yKnTveZY30nBs2sUMFDQuTka8bk3wMjdZiwAMj
	 FSPMA3F083SuZOs3vGwFQucxWgwc72bi1M+RvOShlZokTWXN1aIF7RWf4+XnW8DVDU
	 I2M+hbve0Cpo7E6nt75vg5zN7cS0o1pLVN9E1W4hDg4v6h15/+m9bcQn7xNA+NtEQt
	 ilXXq11s0N82w==
Date: Mon, 2 Nov 2026 15:00:10 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] irqchip/gic-v5: Only set IRS DPS when 1ofN routing
 is supported
Message-ID: <auiXamQ5CbqnfeJd@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-2-743b61626fc5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-host_gicv5_fixes-v1-2-743b61626fc5@arm.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 01:32:55PM +0000, Sascha Bischoff wrote:
> IRS_PE_CR0.DPS is RES0 when the IRS does not support 1ofN routing.
> Read the capability from IRS_IDR0 and skip programming DPS on systems
> without support for 1ofN routing, rather than blindly writing it.
> 
> Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-irs.c   | 14 +++++++++-----
>  include/linux/irqchip/arm-gic-v5.h |  1 +
>  2 files changed, 10 insertions(+), 5 deletions(-)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> index 9d60f474aa4f6..4edf787f3f97f 100644
> --- a/drivers/irqchip/irq-gic-v5-irs.c
> +++ b/drivers/irqchip/irq-gic-v5-irs.c
> @@ -541,12 +541,15 @@ int gicv5_irs_register_cpu(int cpuid)
>  		return -ENXIO;
>  	}
>  
> -	cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
> -	irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
> +	/* IRS_PE_CR0.DPS is RES0 when 1ofN routing is unsupported. */
> +	if (gicv5_global_data.one_of_n) {
> +		cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
> +		irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
>  
> -	ret = gicv5_irs_wait_for_pe_cr0(irs_data);
> -	if (ret)
> -		return ret;
> +		ret = gicv5_irs_wait_for_pe_cr0(irs_data);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	pr_debug("CPU %d enabled PE IAFFID 0x%x\n", cpuid, iaffid);
>  
> @@ -725,6 +728,7 @@ static int __init gicv5_irs_init(struct gicv5_irs_chip_data *irs_data)
>  	if (list_empty(&irs_nodes)) {
>  		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR0);
>  		gicv5_global_data.virt_capable = !!FIELD_GET(GICV5_IRS_IDR0_VIRT, idr);
> +		gicv5_global_data.one_of_n = !!FIELD_GET(GICV5_IRS_IDR0_ONE_N, idr);
>  
>  		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
>  		irs_setup_pri_bits(idr);
> diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
> index 299e75bc95255..34e22e7d4a4c7 100644
> --- a/include/linux/irqchip/arm-gic-v5.h
> +++ b/include/linux/irqchip/arm-gic-v5.h
> @@ -532,6 +532,7 @@ struct gicv5_chip_data {
>  	u8			cpuif_id_bits;
>  	u8			irs_pri_bits;
>  	bool			virt_capable;
> +	bool			one_of_n;
>  	struct {
>  		__le64 *l1ist_addr;
>  		u32 l2_size;
> 
> -- 
> 2.34.1
> 

