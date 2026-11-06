Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375776082BC7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BXhobOdX;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hhrXfhLc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XAkSWWlSKWrfSpGakr9IRtUKXWmzHK5177/xyA2/F6U=; b=BXhobOdXNPoTOO
	pkGmkj4uWEt2bSrDK6M+1clppI0X1022ksqtQcufU05eHw9njjzrZNtJeuF+nasnhFSf/8xE44YEN
	PEq7Q6Upx9QobUm0jNpUUwkR6Zo1L8VSymmAcVhuo6JyZtdJ6RLyA0EmBaJo6iVuYxV/PFQWDQrHa
	JCRJKMbvOnkptSOgp9Rg+4mydfNn4bP/hR3VsbLuULe9H/cYBmpwqTxzVmxQRhX9CUA+05eYXmgQ/
	Y0iOz7hp7PEdR+UD2HhVKLmMgSd666Tc23WCa+plB6YzsRkn2+S6gTbJM678Wo7PBqsGG59xbllO9
	Fa/fZKlgrtycwGGsTC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGgq-0000000BpR6-2ugx;
	Fri, 06 Nov 2026 09:56:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGgo-0000000BpQG-0kSd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:56:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D20CB1476;
	Fri,  6 Nov 2026 01:56:49 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28BC3F628;
	Fri,  6 Nov 2026 01:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793959012; bh=0WBXFs1MiLuO2PVoH0yOAYbRTTQ8cqOTi1RLFPjBnsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hhrXfhLcOF3M5cj3yeVnRsYrdvVg7xXEXL9iwfog98xq4ECNodhUH6MEsipsTN59D
	 OjZzf8YM0s7KlZi/zE581GGp6U0IiJTOvaZrlrz1kcY4OrLFwT2PDs2DIfCyX23INa
	 iyrfHDkmuTYW6J7UD5Pkio1isF8xpnQMJD2c2BlU=
Message-ID: <17294983-0e81-4f73-928d-34e676807b29@arm.com>
Date: Fri, 6 Nov 2026 09:56:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] irqchip/gic-v3-its: Zero ITTs reused from the ITT
 pool
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
 <20261106092625.3977163-3-fuad.tabba@linux.dev>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261106092625.3977163-3-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_015654_259316_962EF7DE 
X-CRM114-Status: GOOD (  18.83  )
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
> Commit b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a
> non-trusted hypervisor") moved sub-page ITTs from kzalloc_node() to a
> genpool. The pages added to the pool are zeroed, but an ITT freed back
> to it goes to the next device as the previous one left it. MAPD is then
> UNPREDICTABLE: "When V == 1, the specified ITT does not contain all
> zeros" (IHI 0069H.b, 5.3.10).
> 
> Zero the ITT when it comes from the pool.
> 
> Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   drivers/irqchip/irq-gic-v3-its.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 5613c52adf88e..5c3ab9d30f6af 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -267,8 +267,10 @@ static void *itt_alloc_pool(int node, int size)
>   
>   	do {
>   		addr = gen_pool_alloc(itt_pool, size);
> -		if (addr)
> +		if (addr) {
> +			memset((void *)addr, 0, size);
>   			break;
> +		}

It is safer to do this at allocation than freeing something back to the 
gen_pool.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

>   
>   		page = its_alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
>   		if (!page)


