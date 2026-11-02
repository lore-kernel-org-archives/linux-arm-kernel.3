Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C29606A901
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iNMcwFOj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGVizo0L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/WWmJnwldp5o5eeWM1lXiHDypa5/5oBu3TEWPCUu+dw=; b=iNMcwFOjXGhKgMpd0desqun09a
	0SsB/C+aZLaSD11BEKjJtSI+n+3Nyg+Vl3qaEQT1K/rUBEthLN2EyOH2XHmOmJIj17fMsDAW+glBN
	C1LS1TwRwvAWowSSWkudnHE0UvtaMR24c9anOShuss4LOGY3Y7Anhlq5m7BQ3F19bJbCOo4Mpakhr
	7TY08IsH1CFW9YGET1wsF7ALLOmoiRs19p4SJMsPZPFi/LG764LdAt/ZoGC/bzi7xaf8VqzZx2xIt
	Qyy1hz+AmDIvEzjsO77heKb3vMoBxZ9q7oPOLzmE5jzhCO6xwULcV3XuueN9+0UYDrdSyRDELJTl1
	xoUgfYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtIZ-0000000Gsfx-2F5d;
	Mon, 02 Nov 2026 14:46:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtIW-0000000Gsej-3LuN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:46:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5872141630;
	Mon,  2 Nov 2026 14:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23A81F00A16;
	Mon,  2 Nov 2026 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630768;
	bh=/WWmJnwldp5o5eeWM1lXiHDypa5/5oBu3TEWPCUu+dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lGVizo0L+8RuLsNUtlO+zNM2+q1ntFpybYeOz3XvGOl7Nf9tUtrMKp+29KsO8Ae+O
	 fi9+XbumetfQFbWRIx4i8Yqix9/HewLMKh9yVtnBBJVifqo/kGXKDKUOfs8oW/b7qw
	 9xCwSfyUe79pKpVRcsJaV1mA6fLdwKt4VIxnOptN1RNrajSUi/MZeCRaLMmQmooWtc
	 8VPOU5r+kP72Fk5E4YahVGWg4/ONtqEFBZjKqrNn9xY+YxLzaB96S5D8OQy1KmTo6f
	 e5hZBfwMVTcsPUKRf+oJ4jt1Ay9im2eVdYm+k7KBPTJ977zpfux8j7cAbWwGNjNGMg
	 7+xuuIR/gIbzg==
Date: Mon, 2 Nov 2026 15:46:03 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] irqchip/gic-v5: Clean the allocated linear device
 table size
Message-ID: <auiiK0ksqPMbHAmX@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-9-743b61626fc5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-host_gicv5_fixes-v1-9-743b61626fc5@arm.com>
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

On Mon, Nov 02, 2026 at 01:33:02PM +0000, Sascha Bischoff wrote:
> When the linear device table exceeds the kmalloc limit, the driver
> caps the DeviceID width before allocation but keeps the original size
> for cache maintenance. On a noncoherent ITS, this cleans beyond the
> allocated table.
> 
> Recalculate the size after capping the DeviceID width.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 4de07bbdc4923..c0f3982229194 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -601,6 +601,7 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
>  		pr_warn("Limiting device ID bits from %u to %u\n",
>  			device_id_bits, device_id_cap);
>  		device_id_bits = device_id_cap;
> +		sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
>  	}
>  

Or sz = KMALLOC_MAX_SIZE;

that's what we are doing after all.

I wonder whether moving:

sz = BIT_ULL(device_id_bits) * sizeof(*devtab);

after the capping out of the if and do:

if (BIT_ULL(device_id_bits) * sizeof(*devtab) > KMALLOC_MAX_SIZE)

to check whether mem alloc should be capped makes this any easier
to read.

Regardless, this patch is a fix and it is right to make it as small
as possible:

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  	devtab = kcalloc(BIT(device_id_bits), sizeof(*devtab), GFP_KERNEL);
> 
> -- 
> 2.34.1
> 

