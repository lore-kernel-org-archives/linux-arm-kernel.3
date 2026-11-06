Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3411606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IAUlpt/a;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iNqYcSUl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mdIhThb+jl2JUlwhVMSBEXIMeVhHxJqzGZP7A7mVG/c=; b=IAUlpt/azbxdRP
	0jJudx1xqHfSj0oYnP9t13G0eY5fZw15yN9Lx+y2n8Y2gZV9lzuUN2QwvH36E0qkV11/S1XltpdFw
	Fx364k3jnPZIJakykQ+kCVfIQzm67p204wiNU52Zl/Wk5J+BhFkov6rl2dUpbGxhilAR8iHLd5zVz
	gq5gqmZgXzjqm25RLWCeAYu+2UND62btkmXbJyTIq5vBEQF+P5uRoAYWUz07hR58a+6YMwpt+cpYn
	6uco2wrKelpyFIz7Jjqo/SDu6hL3AV0WXc/dtCu4B0qnAI/3XzTD2fAB+EG8Ox1Q67s70VnU5NBsT
	NbOte0aQM/m+N/6mXPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKz6-0000000CfyW-1DtT;
	Fri, 06 Nov 2026 14:32:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKz2-0000000CfwV-3vUC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:32:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 617FA1476;
	Fri,  6 Nov 2026 06:31:56 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDE213F673;
	Fri,  6 Nov 2026 06:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793975519; bh=6klzQevvhvEQ74bOoMK8uucvxb17Dyoq6PMUlG5MA7U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iNqYcSUlgmf6qh5LNrg7ArXmgondI0M65+F4fe78P2DyEalQDtv9Gi3fhXBkZg0cb
	 dqNSg9+xwH1Sr8r1X55GmuynHigaZAjurOD3VXobCpwLFsyJC6Z2JtVfMgH7yyX0v2
	 Ho/6cay2Z+BgJV1/Age2QHTrw8AEC9lQOLQM0cWI=
Message-ID: <1312ec44-bc4a-427c-876e-1405e8c46e0f@arm.com>
Date: Fri, 6 Nov 2026 14:31:56 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] irqchip/gic-v3-its: Zero ITS pages before sharing
 them with the host
To: Fuad Tabba <fuad.tabba@linux.dev>, maz@kernel.org, tglx@kernel.org
Cc: radu@rendec.net, lpieralisi@kernel.org, steven.price@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 will@kernel.org, tabba@google.com, stable@vger.kernel.org
References: <20261106120221.347309-1-fuad.tabba@linux.dev>
 <20261106120221.347309-2-fuad.tabba@linux.dev>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261106120221.347309-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_063201_030967_B15674AE 
X-CRM114-Status: GOOD (  19.69  )
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

Hi Fuad

On 06/11/2026 12:02, Fuad Tabba wrote:
> In a pKVM protected guest, the ITS driver shares every page it
> allocates for the GIC with the host, through set_memory_decrypted() in
> its_alloc_pages_node(). its_allocate_prop_table() is the only caller
> that doesn't pass __GFP_ZERO. It fills the table after the call
> returns, so until then the host can read the page's previous contents,
> at least 64KiB of guest memory.
> 
> Zero every page in its_alloc_pages_node() before it is shared. Every
> caller except the property table already passes __GFP_ZERO.
> 
> Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

The patch, as such looks good to me and fixes the problem on pKVM.

We hit a similar problem with CCA, but not from a security perspective,
but a functionality perspective (crashing the Realm VM). There was a
patch proposed here [0]. The general consensus was to fix this for
all "shared allocations" and Aneesh has (had different attempts at this, 
but the latest) series is here [1]. Do you think something like this
would be preferred than fixing every caller like this ?

[0] https://lore.kernel.org/all/20260820150034.88729-2-steven.price@arm.com
[1] 
https://lore.kernel.org/all/20261104164555.3555725-1-aneesh.kumar@kernel.org

Cheers
SUzuki

> ---
>   drivers/irqchip/irq-gic-v3-its.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 282e4bafb084f..de1f1b1f26623 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -218,7 +218,8 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
>   	struct page *page;
>   	int ret = 0;
>   
> -	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
> +	/* Zeroed, as set_memory_decrypted() may share the page with the host */
> +	page = alloc_pages_node(node, gfp | gfp_flags_quirk | __GFP_ZERO, order);
>   
>   	if (!page)
>   		return NULL;


