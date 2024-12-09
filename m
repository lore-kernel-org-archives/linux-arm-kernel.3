Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4A4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/V/M8m5vnVqkNBk5lcKbrcMSb1/XSdr4T7UP5BmN4QU=; b=peVwTStuNEwTk35FisONlxE/Xq
	JKDCFaXWYrFFGOGkjiuDqbHJhOxZStpmateO/Uh6Mp5LCDezQcZqebXBKMzDd12beTcZMnhNaNiVN
	Kn3Pk7/b114HVN2UYCnxchV86tB3c49a0RU3PnjlS4lXXTCS7cLGZp3az/l1RcLclHWeJDxi+hKWr
	Zlz246uSlEdoR0NxualGB51XxOu3pv5bcUAOr2J9Bbm/MaZaNEuwpdkv3JJpCZ1ocuLn3qVcHvSmx
	MT5BcIcIEXunFH8EK73MYbU/uHMeOUY8+TPqkTE2kruxs8FJt9u1kXpytN9AugZaZSSB4X0Jndvb4
	1Z8L5dAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnek-00000009dMx-207T;
	Mon, 09 Dec 2024 23:59:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKndi-00000009dHO-2en0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 23:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9442F5C5F26;
	Mon,  9 Dec 2024 23:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48ECC4CED1;
	Mon,  9 Dec 2024 23:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733788689;
	bh=PNBJ7bGJrJaQBHaIWZFvWw8CJ1fG1cKVlwr8kkw2luc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sd67anHUFKDXOnpMU2dHVFW1iDKUgEISLcQZ2ZxgyEnEZuQjG2mFQUk/I6JXupDWm
	 ie6z7VrS+ezcDHyrqtj10GBt8X6cl7sJe0QkyGRxfi5UTFlucJWCOlMaOTIFeZJbwa
	 EC//o/yZjqWjbZ0tvYNbfQMz4Y+mZS+s3V3K4SI8LFBBvjzTl+DbE/ndW03b7GNhWG
	 F3blFf5ctZUfBbTeUTl8/I0OcEw53Q4c6oRKSjw+nrJwpSvfw0x6cs8jO2O76oWehV
	 ZoGKVcqgqLM/kC5pkvkL2lyUi+wbqRu/3n64ihGHENh/xsD8mjL1H2dAspgiip1rgE
	 dlwtSzJrvdlIA==
Date: Mon, 9 Dec 2024 23:58:05 +0000
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com,
	joro@8bytes.org
Subject: Re: [PATCH v2 1/2] iommu/io-pgtable-arm: Fix stage-2 concatenation
 with 16K
Message-ID: <20241209235804.GA14069@willie-the-truck>
References: <20241202140604.422235-1-smostafa@google.com>
 <20241202140604.422235-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202140604.422235-2-smostafa@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_155810_711761_D4F1F4B4 
X-CRM114-Status: GOOD (  22.02  )
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

On Mon, Dec 02, 2024 at 02:06:03PM +0000, Mostafa Saleh wrote:
> At the moment, io-pgtable-arm uses concatenation only if it is
> possible at level 0, which misses a case where concatenation is
> mandatory at level 1 according to R_SRKBC in Arm spec DDI0487 K.a.
> 
> Also, that means concatenation can be used when not mandated,
> contradicting the comment on the code. However, these cases can only
> happen if the SMMUv3 driver is changed to use ias != oas for stage-2.
> 
> This patch re-writes the code to use concatenation only if mandatory,
> fixing the missing case for level-1 and granule 16K with PA = 40 bits.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 45 +++++++++++++++++++++++++---------
>  1 file changed, 33 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 6b9bb58a414f..0055876b3527 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -223,6 +223,33 @@ static inline int arm_lpae_max_entries(int i, struct arm_lpae_io_pgtable *data)
>  	return ptes_per_table - (i & (ptes_per_table - 1));
>  }
>  
> +/*
> + * Check if concatenated PGDs are mandatory according to Arm DDI0487 (K.a)
> + * 1) R_DXBSH: For 16KB, and 48-bit input size, use level 1 instead of 0.
> + * 2) R_SRKBC: After de-ciphering the table for PA size and valid initial lookup
> + *   a) 40 bits PA size with 4K: use level 1 instead of level 0 (2 tables for ias = oas)
> + *   b) 40 bits PA size with 16K: use level 2 instead of level 1 (16 tables for ias = oas)
> + *   c) 42 bits PA size with 4K: use level 1 instead of level 0 (8 tables for ias = oas)
> + *   d) 48 bits PA size with 16K: use level 1 instead of level 0 (2 tables for ias = oas)
> + */
> +static inline bool arm_lpae_concat_mandatory(struct arm_lpae_io_pgtable *data)
> +{
> +	unsigned int ias = data->iop.cfg.ias;
> +	unsigned int oas = data->iop.cfg.oas;
> +
> +	/* Covers 1  and 2.d */
> +	if ((ARM_LPAE_GRANULE(data) == SZ_16K) && (data->start_level == 0))
> +		return (oas == 48) || (ias = 48);

I'm guessing the second disjunct here should be:

	(ias == 48);

I'll make that change when applying...

Will

