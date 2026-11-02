Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1F606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lLHJU5CW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VRxTfCma
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XPRtcZyPX5uyQlsqBbPqlbi2Hh4PJVsJ6P0BXSRYmAk=; b=lLHJU5CWPjvffwit0H7GhKJA4Y
	2OeTkfUeGE/QN5hwtduQBfmqx2Rt7Nb4ivg6gdKvXmSGF/IDSNsXtzZdFC+Bwj9foPmqJfJa2Asc8
	6IzDttoE7POjeIqaTyX2FhQXVx8XLloAOHPnJUHk+3/b4k6cw0Pt4UYAj1B6eRSxcD+Hfu1ilv9XH
	Z3aNStCYFoGE3u/TVmj3PemjomFj4NS2tL5LMSbDQiS6Oe+xOmTN99qJVX53e8inwtOJW1/LFIpeq
	HBVW2PktJl045MWj3z9wlA9LsADX6nkJ5XA7zopc5E9SYt1vjArHLEHyQyu+IiW7URaqCKrcgc9Ed
	XpJng2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsmb-0000000GjYE-3ABV;
	Mon, 02 Nov 2026 14:13:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsma-0000000GjXo-1ZmZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:13:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26CAE402C1;
	Mon,  2 Nov 2026 14:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415641F00A16;
	Mon,  2 Nov 2026 14:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793628788;
	bh=XPRtcZyPX5uyQlsqBbPqlbi2Hh4PJVsJ6P0BXSRYmAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VRxTfCma8suNDbAIew/uqNt2bgj8LgYc15bq9P6bz/YxU+n1N3TEzLZoUbSEpSg13
	 IHzInqJBrnlrpMl1kZxiMTqGHQu6ltNsXPcGdQ3xqXN7NB2oak6VPWpe9VMHEyKf8C
	 apXhKvnNNL5EspRWogeyjQXwMm+/nfDupYn7EVytH1qezntwPTyyaLh6GWcK4lqLMe
	 Z9bTalVJJCwnuoRg8vEfaY6Z4XXUs6bue1se/fw3bNFLiqoT+uoGAX/OZbolSBpY21
	 byimb68/dgZy+BOFsbKJcdSjrQrv9e8Up8iNKTNSAHkV6FhIMsvbiKy18gLftamcCt
	 tnm9kXlL55wqg==
Date: Mon, 2 Nov 2026 15:13:02 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 06/10] irqchip/gic-v5: Honour ACPI ITS noncoherent flag
Message-ID: <auiabr1U4c9C7FwL@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-6-743b61626fc5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-host_gicv5_fixes-v1-6-743b61626fc5@arm.com>
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

On Mon, Nov 02, 2026 at 01:32:59PM +0000, Sascha Bischoff wrote:
> The ACPI ITS probe passes its noncoherent flag to
> gicv5_its_init_bases(), but the common initializer checks a DT
> property instead. For an ACPI ITS, this always selects coherent cache
> settings and skips the cache maintenance required for its tables.
> 
> Use the noncoherent argument, which both firmware paths already
> supply.
> 
> Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 866c238f08dfe..c5d057f713134 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -1135,7 +1135,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
>  			goto out_free_node;
>  	}
>  
> -	if (of_property_read_bool(np, "dma-noncoherent")) {
> +	if (noncoherent) {

Bah. This is a very stupid thinko. Apologies.

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  		/*
>  		 * A non-coherent ITS implies that some cache levels cannot be
>  		 * used coherently by the cores and GIC. Our only option is to mark
> 
> -- 
> 2.34.1
> 

