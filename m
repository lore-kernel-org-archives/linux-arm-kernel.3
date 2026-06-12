Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ACECD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPd03DCEhnxVnAon/lJc1dl4riij9fpdXdHb1nTxRzM=; b=tGi80kTP37AP/921xdUf0JWG9Z
	MTThZxTKH38+12lZf58mgfRbAjckLyEzb1PLmKabEL2EJf8S9x5wKmyO/Jp90bGbaliV28DG6j4AT
	ubBHRwGjSdGojNtzQHkpz+ecL9SRJhs9YQn2FVB8esJe7mFJ19VbtdJkRrCOjikvTUaap1cvml3qJ
	7MwvnmOUElIFhmq5P2EpqFir8cCbUd/ladeFXjB+qdXM1RPakOBxmMKfYtzHTMbnrnQDobIc5gIB4
	ImaqVfLw3EzuIQgwBxsVYw6WajC2bmxHLz3pb5253JxN5uC2+EbdK7TgiLILFQ/cmWFw1L2owczfn
	nXxiGlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2FR-0000000B0dH-04Ms;
	Fri, 12 Jun 2026 13:48:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2FP-0000000B0ct-0bk8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:48:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490bd64ca95so67895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781272112; x=1781876912; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LPd03DCEhnxVnAon/lJc1dl4riij9fpdXdHb1nTxRzM=;
        b=UdniEA7tMelkDvJvF30f4NTV2xiVAe8jhl++o1DkNE57IXQ8j9sc0J8Hwk6Zo9TYJQ
         qUdJEqAJ8vN4MPLcnQJOpy50JGk4UEOj0xV9Atxcfu20GMzFnvfY4LE5qIDFxjYh01WT
         HTQikBwFQFvDJIkoRCgYvC5803WYNeRq0Z/WhxLS0+7HZHeDWuqtLDzTC+cfcn9Wcxof
         6lVI288KTTr1kSttmlgUrXLE+QpZzjh0Gz9yvjVqTogwV9VmMriDcpJkMrAYIVjuF3cN
         gsf0fS0CHccTB/s2kgYewI5RJoLbAgEqhvCwidTeW35LHTGotC8IkB5jp/r96lwdrnoT
         dkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272112; x=1781876912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPd03DCEhnxVnAon/lJc1dl4riij9fpdXdHb1nTxRzM=;
        b=XaHMgjOkA1kR5JdJ58nFJacC3aUdKHPjGKT46gK1eTSGGZpq3jr4IHyG88ypEX79Zz
         837eZ6xbSf4wEY1MgE7OUVBi+7Su3FdaChW5iwGxNpgEsU7q3Acd+Ddm+2ohw5a2XLbF
         rcsE3v9k5izYHDJZMLMw0WYKZjOai7FB0hyLk5Ghj9YIOzWBg/F+/4ZUZHbrZeQdCs73
         Bunav9GZQcQshFyKkhOdi0fPPixwWxLR+L8smtjJBgRYCdhCiZjHHrB+CBFS+CQ9rkN2
         js9MxJCZciB7IyT20LjcbI3Dm8fLXrzIA32YOYrj67IhYRKVSJ98BkKa3hXQouTVAZpT
         Znqw==
X-Forwarded-Encrypted: i=1; AFNElJ/I2Z3Y18xaCptsYGr1LvNsp/WDDwpf4cpyBZlpLt10phZsWFSqHL7GxGz5xaG4qPihFbd2LYU5eg8YumoANANF@lists.infradead.org
X-Gm-Message-State: AOJu0YxjcQ/0iQtQR1nfVk7XzpuQVmQaNNgDyZEDM/aspuJD7HDADS7a
	rYuDPzbOjDkS2IwI/ygHeRNIukfXDCEbjBKDtXcmqSxPvk42bDPiQJogdxZeflNMww==
X-Gm-Gg: Acq92OG8Klf9lC3tHy7L3aTPhXZuKb4i5DN/zyTZes0dXS1jP2NWVgVJou0HRbTgqs8
	4Tq6fTPiTw6zJ8lhfDbfowt7nKzG5TDxxQDTg0eaQxQSgRJOgu8zMOcNmjzwqzOdXtj0NyUl86O
	k9eTgM8LevfS5ikK1biem7z4lVe9p8t9PjHDHu60mQDF1o9Qth77z1fBM5YGU+6E37LCPK5qjkN
	cMAmXFWNenvnEYI0qUw8QEmzkymfdQ9oXv6ujxcDA6dHOoYe9lucwY6nZmWII0eN5r9eHEFuR+8
	dLiyjXlDOmSw12Y/foxd7wnaPYMpvZqG8xKxaYb6nqhZZzTS8NR8IzWniZ+LyYxmNWLi0sLulT0
	7kyv+YWO498tzP8Ni/xpoCplYFvBlWOJG4G5t1qfIGpDM/Mb6/Xa1Fkdxu4uXU/8/V/UhDVz+av
	hNoBlC4zi3yL7At64RxJuPLYSbwkN0qRBC7ekQYFpef5shQwkJkNyDlu10UOMFXMkynd3GQQ==
X-Received: by 2002:a05:600c:a149:b0:490:be1f:66bc with SMTP id 5b1f17b1804b1-490ea57d327mr1097535e9.4.1781272111887;
        Fri, 12 Jun 2026 06:48:31 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2d09a85sm146043915e9.14.2026.06.12.06.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:48:31 -0700 (PDT)
Date: Fri, 12 Jun 2026 13:48:27 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, catalin.marinas@arm.com,
	jens.wiklander@linaro.org, sumit.garg@kernel.org,
	vdonnefort@google.com, sudeep.holla@kernel.org
Subject: Re: [PATCH v6 3/6] firmware: arm_ffa: Fix Endpoint Memory Access
 Descriptor offset calculation
Message-ID: <aiwOKyXN_68A54_0@google.com>
References: <20260527150236.1978655-1-smostafa@google.com>
 <20260527150236.1978655-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527150236.1978655-4-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_064835_229397_459BE7A8 
X-CRM114-Status: GOOD (  22.19  )
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

On Wed, May 27, 2026 at 03:02:33PM +0000, Mostafa Saleh wrote:

Hi Mostafa,

> From: Sebastian Ene <sebastianene@google.com>
> 
> Use the descriptor's `ep_mem_offset` to calculate the start of the endpoint
> memory access array and to comply with the FF-A spec instead of defaulting
> to `sizeof(struct ffa_mem_region)`.
> This requires moving `ffa_mem_region_additional_setup()` earlier in the setup
> flow.
> Also, add sanity checks to ensure the calculated descriptor offsets do not
> exceed `max_fragsize`.
> [@Mostafa Harden error checking]
> 
> Fixes: 113580530ee7 ("firmware: arm_ffa: Update memory descriptor to support v1.1 format")
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 16 +++++++++++-----
>  include/linux/arm_ffa.h           |  2 +-
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index 059e2aae7ca0..bed4bd48963f 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -703,19 +703,26 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
>  	struct ffa_composite_mem_region *composite;
>  	struct ffa_mem_region_addr_range *constituents;
>  	struct ffa_mem_region_attributes *ep_mem_access;
> -	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg);
> +	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg), ep_offset;
> +	u32 emad_size = ffa_emad_size_get(drv_info->version);
>  
>  	mem_region->tag = args->tag;
>  	mem_region->flags = args->flags;
>  	mem_region->sender_id = drv_info->vm_id;
>  	mem_region->attributes = ffa_memory_attributes_get(func_id);
> +
> +	ffa_mem_region_additional_setup(drv_info->version, mem_region);
>  	composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
>  					       drv_info->version);
> +	if (composite_offset + sizeof(*composite) > max_fragsize)
> +		return -ENXIO;
>  
>  	for (idx = 0; idx < args->nattrs; idx++) {
> -		ep_mem_access = buffer +
> -			ffa_mem_desc_offset(buffer, idx, drv_info->version);
> -		memset(ep_mem_access, 0, ffa_emad_size_get(drv_info->version));
> +		ep_offset = ffa_mem_desc_offset(buffer, idx, drv_info->version);
> +		if (ep_offset + emad_size > max_fragsize)
> +			return -ENXIO;

Looking between v3 (the version that I sent) and this version, you
account correctly for the emad_size which depends on the FF-A version
(thus the introduced call to ffa_emad_size_get()).

I think the only remaining bit here is making sure that we don't
overflow in `ep_offset + emad_size`.

> +		ep_mem_access = buffer + ep_offset;
> +		memset(ep_mem_access, 0, emad_size);
>  		ep_mem_access->receiver = args->attrs[idx].receiver;
>  		ep_mem_access->attrs = args->attrs[idx].attrs;
>  		ep_mem_access->composite_off = composite_offset;
> @@ -725,7 +732,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
>  	}
>  	mem_region->handle = 0;
>  	mem_region->ep_count = args->nattrs;
> -	ffa_mem_region_additional_setup(drv_info->version, mem_region);
>  
>  	composite = buffer + composite_offset;
>  	composite->total_pg_cnt = ffa_get_num_pages_sg(args->sg);
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index 81e603839c4a..62d67dae8b70 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -445,7 +445,7 @@ ffa_mem_desc_offset(struct ffa_mem_region *buf, int count, u32 ffa_version)
>  	if (!FFA_MEM_REGION_HAS_EP_MEM_OFFSET(ffa_version))
>  		offset += offsetof(struct ffa_mem_region, ep_mem_offset);
>  	else
> -		offset += sizeof(struct ffa_mem_region);
> +		offset += buf->ep_mem_offset;
>  
>  	return offset;
>  }
> -- 
> 2.54.0.746.g67dd491aae-goog
>

Thanks,
Sebastian

