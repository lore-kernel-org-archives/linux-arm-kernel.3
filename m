Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952D660C51E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CRg7Ks82;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UvQAJycX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kQ1PWAmFEtKoBEC+bNwIuh8gN874WNEQ3lk9n+F20OI=; b=CRg7Ks82IV5bbKrXUpUNI8ZjBp
	V7onaMxvEqJwyahXtqVmZWh3pOFoOwa/pWCvj6XPo1CQjuX2LFsna/twgjOzmRzSDJo7siSLsAzQS
	Aaya/9mcvQluenyoApCDePgTFcDMq928Y1dN10PyEV5SeRuKPvFtZnADPol0br1vpHc99G0nS5YtJ
	fcrxezF5yW5WA2dGvfaDhjmVqnJGbl8naWfHu+yzAcJ32bQJpVjjYsDRg7xjhsOSwJKax6y7GJBgC
	qlSfTXmfWdhn2izBqGm3ufukQncc/WKO9rASgUnSjCh5MjaLK35n6485ghI3z7qXNlWzHEhEbYs/W
	u7h1AmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtsD-0000000H4K6-28GO;
	Mon, 02 Nov 2026 15:23:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtsB-0000000H4Iv-2rWt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 15:22:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BBB460A4A;
	Mon,  2 Nov 2026 15:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7F11F00A18;
	Mon,  2 Nov 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632978;
	bh=kQ1PWAmFEtKoBEC+bNwIuh8gN874WNEQ3lk9n+F20OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UvQAJycXDc0VLTbkhhERsC98qh02IDp+owl+L///nSFLXG/ONRDArnzh94iOBrFoe
	 fzUbUPFk9i7kQB5ssg8/X8TP2knPuh4Jbf3QfnKshec+rFdN+sGAzYPmOV9FQblGYE
	 rumOc4qsb3h9+gn3CucJYP3q5+I3TTDkwPuyeiSdEK8qT9gzfH29jXnH3TMAJ/NGGT
	 0hVKihLC2DKelzCrzAL5//Wn5IS5wZmXcLmrHAR9fJCj4oW1qGT7gtRr8ZQy5F4ehP
	 ftfrdOZL2ebYPmmsA+J3zHoAfzUkKgAc7rIHyh2Aim1ROsv2hrDwWIQOJ/uxzQU6nT
	 J6ZfzZE1Ukiwg==
Date: Mon, 2 Nov 2026 16:22:53 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] irqchip/gic-v5: Invalidate ITS device cache before
 freeing ITT
Message-ID: <auiqzTXn2FoSLbor@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-8-743b61626fc5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-host_gicv5_fixes-v1-8-743b61626fc5@arm.com>
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

On Mon, Nov 02, 2026 at 01:33:01PM +0000, Sascha Bischoff wrote:
> A cached device table entry can still reference the ITT after its
> memory is freed via kfree(), even if the DTE has been marked as
> invalid. Once the memory has been released, it could be reallocated,
> and it would be unfortunate for the hardware to interpret this as a
> valid ITT.
> 
> Invalidate the device cache and wait for completion before freeing the
> ITT during device teardown.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 8628de326f28d..4de07bbdc4923 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -556,6 +556,7 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>  				       struct gicv5_its_dev *its_dev)
>  {
>  	__le64 *dte;
> +	int ret;
>  
>  	dte = gicv5_its_devtab_get_dte_ref(its, its_dev->device_id, false);
>  
> @@ -568,9 +569,10 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>  	/* Zero everything - make it clear that this is an invalid entry */
>  	its_write_table_entry(its, dte, 0);
>  
> +	ret = gicv5_its_device_cache_inv(its, its_dev);
>  	gicv5_its_free_itt(its_dev);
>  
> -	return gicv5_its_device_cache_inv(its, its_dev);
> +	return ret;

Patch is right, though we don't check ret (gicv5_its_device_unregister()) so
rather that pretending to return anything useful I'd just drop it
(gicv5_wait_for_op_s() spits an error already on timeout, not sure more than
that there is anything we can do at this stage).

Again, this is a fix so I can clean this up later:

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  }
>  
>  /*
> 
> -- 
> 2.34.1
> 

