Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D47606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wBO95QW6;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DhEnS2Ce
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0+U2vTqYGmEsuBaqKS6I103lcYhGQy++74M9paljrRI=; b=wBO95QW6c4XQ7B
	apoHAjwtMVN2WmDtDJYxjrqtP5e3KgwbrN91nZczX5GlgoN7WnEh+xHIFS74TGaV542KHUVwN1I2d
	VRKb5YEuXDL+urz4bRNBNYSxnuGFNncB48yc/c6GKqbjkXRnhFWD0ZJmSkACncTmjvma3CVpLP1IR
	jYhRV/aKXd1YEeboh92xMGa7QIGo1uP/gw3MTCXHB1/3oryxpCXQn6oLnMEntCxhSN0apDDV6PUb/
	V+cWi5wtyoJNEHZXWC1nv3JxQmkFE0kaE6/7CiQmGZwlT8+ghJjbYENV7cKcktIXeaG5ZZ3jBUZN2
	QB55g+h2LfGutuVihqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGjp-0000000BplJ-25xD;
	Fri, 06 Nov 2026 10:00:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGjm-0000000BpkR-2q0n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:59:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A12BE1476;
	Fri,  6 Nov 2026 01:59:54 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A695E3F628;
	Fri,  6 Nov 2026 01:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793959197; bh=fRhN6cuZAlw5ZrkbGaGNRC9tVNOKkyJ93r/CRrXa9Kc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DhEnS2Ceug/N/YCLhLrTyZWwH5R5P4kXVtOtISrJpNxGrZdZMj+fdWRZXPAGlpcNl
	 AUHhuN62B31Abm3uddk/rym1pPKaSfd2cw9ZNCpr+W1QVjVAwpQhS0KXY0GfU9kfo8
	 PYXXtFCVbNS2fDnrS5FRKzOlddj9XD07z8VzYKfI=
Message-ID: <b91edbb3-8abe-4a1a-a8ba-00dd475dccff@arm.com>
Date: Fri, 6 Nov 2026 09:59:55 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] irqchip/gic-v3-its: Free the page when gen_pool_add()
 fails
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
 <20261106092625.3977163-4-fuad.tabba@linux.dev>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261106092625.3977163-4-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_015958_768034_55C8BC3E 
X-CRM114-Status: GOOD (  16.59  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 09:26, Fuad Tabba wrote:
> When the ITT pool has no room, itt_alloc_pool() grows it by a page and
> retries. gen_pool_add() fails when it cannot allocate its chunk
> descriptor, but its return is ignored, so the page is leaked and the
> retry allocates another page to leak, until an add succeeds or a page
> allocation fails.
> 
> Free the page and fail the allocation instead.
> 
> Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 5c3ab9d30f6af..bdf7c81e60c76 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -276,7 +276,10 @@ static void *itt_alloc_pool(int node, int size)
>   		if (!page)
>   			break;
>   
> -		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
> +		if (gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node)) {
> +			its_free_pages(page_address(page), 0);
> +			break;
> +		}

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


>   	} while (!addr);
>   
>   	return (void *)addr;


