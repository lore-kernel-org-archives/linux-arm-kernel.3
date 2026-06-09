Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4151DCD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l00W81UYsyqDsSVEFT5iHHagCSaGJS6VwfSu9rBGR+c=; b=A/BKELsXWUwuWalPDNN8bRxSoL
	UFk4nEkM44p3Rhu8TPsCpiuyhlm76DMbB2Q+t2orc7tsjObftmBjSr0Ac5PLgY4zuYoO5rNydNC6f
	Kxm6UFo4LaBtW1LjtFWwl17HWys8rRbIUpAHd2Se6VGT3Bd5FGwIuw6S9AMeuoteSmMCJNbLg0jV2
	7s8u9m9FZNaRm+MpT8OT5v8iMKw1HMIioJm0mXd16N1FB+DRvzWgNB/Pm1pa+jgujNn+56S4xE3Lu
	VZ+h9tvzn92DojB1sASwtwHq2JHU3wvZZEGyVe/0lZiBS2immN/qK4mGLhll+TOBlm+UGakJbu0GE
	DJPHO8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwl1-00000005gtX-0wi4;
	Tue, 09 Jun 2026 13:44:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwkw-00000005grV-24AA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:44:40 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45efb47aa6fso534806f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781012677; x=1781617477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l00W81UYsyqDsSVEFT5iHHagCSaGJS6VwfSu9rBGR+c=;
        b=eRK3Me311p7MPwl9U4ZbA6k39lCWIGwT9HXID6xqwFtGRmpIRr2ijUI1AQaXJ5dL86
         Qdnv3sOiXHdCwJNx71LCuZyrktmhtKnIY8nznIQpAAR0fx/tAFWS4crGk33I8O+e4yf2
         7OV61mpcua4BSawjMiydfztus6b54Nb5mWKjeSVEpz2m8siHD0PTSNMYEBsL2s+LnDNx
         RJ+6ixzOrLUjYPBc6Vl2xP8mWn6ZT8Xh+KE2IyO8svNYfFG7YuLn53iGNEFNJB4aHXGc
         3vXZXo5sNE5qfY4OAGuPgJ47/Eu715TFImABfE/o6JgM6/iM31Qv/9DmdgUQKFw+JdR4
         ALcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012677; x=1781617477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l00W81UYsyqDsSVEFT5iHHagCSaGJS6VwfSu9rBGR+c=;
        b=XSjzU8JSoPUPS46+P3YbIAC1YbRfNAE1X2qLHXY8i267henMlAmMSmgFf3G1bApcPt
         6G9veu90617XOuINpe3soqfg1FUGdlkTLqBZyMoam7YoYTKdzMKMpp9+2HjFzDyiYkf2
         G6hU1CDtOKKxrdFfATalhK4GYoSFpfRuLooj1IrYugr0d11bOFFkT1NxkA/F0pGxUtln
         LptVdzn/kIBCBxbJLwueCtx5V6EKNBfiWXS9nGpCKkEJrTHDWz2RJQXKMxQo9Sba/pAH
         uAHtZVKbD6Piqa6FJDaYDmZq5Xh3aP0d7i0PjcPZqlj0sIhc/zw8HjqAj/qXmE2pk7q0
         WgWA==
X-Forwarded-Encrypted: i=1; AFNElJ8p6Fa5UpFyPnt/N+TvNV1vnIQugY+nMZQv43r6rJykVzVYlFfBxrdw+BWk1Q0RB4XZ9N2q1qmfIEidAQndFeTX@lists.infradead.org
X-Gm-Message-State: AOJu0YyU8mdyOtuG+Z1ahePdmWaC7D37l+nAZFiTtMXJkf02BjsmggXk
	c62RNwmcakwnR032rw6mRV365oN6meoX7KAhP7AGXArgrAfhoc0e1JOrvVGN9uoayY8=
X-Gm-Gg: Acq92OHRUJi7QMqoEAQnPc11pYV7HHo7WwOICM8tCo/ZHN3zF0P3wZobMnE2PtYg+JV
	UbiVd1SvfTCc1TjEHIhJhBIEZuq/6RnRZUpCkqlF2kW7aRy6W/4ErHBoDMnDNui5wjfc9028kO3
	dEkyax02jWZWUWaeoHqM2FXlgQ5UtGGiGZCISAbaSRVGnZnCDBdsflBinEA2RZB90dwmUOMGGK6
	bMaBRRY4vS3RzrPjjJ6CG5yOWzTvT8d+pQjHuTrWkQ65GUCKrz4sVKzsULIcByBTFtQJpGCh5rQ
	3oa/E3Jxk9lQFTg5aWBRe9UD1APkBJw1GkUrKp14q8ZtgAvUnTE4+mn8XeGFF4+O7EwiqcDwsZk
	ca/ESu6HBRGq0g/ucoBWtl1f+uvHr5sP8/WeAgoPe67m4oSFd9AG6ds09xKaDF5/n6ucfc6jYjE
	bM+WC/RaqxBKyuoGZGX590mw5T6FhioE/VIw==
X-Received: by 2002:a05:6000:715:b0:441:1c35:4b79 with SMTP id ffacd0b85a97d-4603076f62bmr12393402f8f.8.1781012676663;
        Tue, 09 Jun 2026 06:44:36 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm66805957f8f.36.2026.06.09.06.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:44:36 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:44:34 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy
 <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
 <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
 Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Alexey
 Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
 Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v6 20/20] swiotlb: remove unused SWIOTLB_FORCE flag
Message-ID: <20260609154434.13dba7b9@mordecai>
In-Reply-To: <20260604083959.1265923-21-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-21-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_064438_980060_1A3A2DD8 
X-CRM114-Status: GOOD (  18.91  )
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

On Thu,  4 Jun 2026 14:09:59 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> SWIOTLB_FORCE has no remaining in-tree users. Forced bouncing is now
> controlled through the swiotlb=force command line option via
> swiotlb_force_bounce.
> 
> Remove the unused flag and simplify the force_bounce initialization.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/swiotlb.h | 1 -
>  kernel/dma/swiotlb.c    | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 526f82e9da45..af88ca7182f4 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -15,7 +15,6 @@ struct page;
>  struct scatterlist;
>  
>  #define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
> -#define SWIOTLB_FORCE	(1 << 1) /* force bounce buffering */
>  #define SWIOTLB_ANY	(1 << 2) /* allow any memory for the buffer */

These constants are kernel-internal, so let's not leave a hole in the
bitmask... I mean, what about changing SWIOTLB_ANY to (1 << 1) after
you remove SWIOTLB_FORCE?

Other than that, LGTM.

I consider this whole series a big step towards saner handling of
encrypted/decrypted memory for DMA buffers. Thank you for your effort!

Petr T

>  
>  /*
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index e4bd8c9eaeda..81cc4928e949 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -400,8 +400,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  	if (swiotlb_force_disable)
>  		return;
>  
> -	io_tlb_default_mem.force_bounce =
> -		swiotlb_force_bounce || (flags & SWIOTLB_FORCE);
> +	io_tlb_default_mem.force_bounce = swiotlb_force_bounce;
>  
>  #ifdef CONFIG_SWIOTLB_DYNAMIC
>  	if (!remap)


