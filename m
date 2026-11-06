Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B14606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z1JMpir1;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sjTGYC6q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZiIKqYRHXYUrq5jY4SAhBx+dxEMk/9hW4rEcLk5Peqs=; b=Z1JMpir1nX5D4k
	l4xZQ3DKlfIqcd3+l84hn0RHf+BAnSMji7XUB29xblQnt1CiWlNEJnbtMf/i7IG28dqKe68df+EUv
	qhK1SK75IfiiVFev99XBfoaMnEBr5SfEOmm9yIVG1Ypw60RhwzBkcQ/MlnpvOLeWfS82zXJSe9vxv
	yGxKlUUmA4WX7Eisqy4JjgC4PBSUotl06s8hRBVeJ1cH2s9LDOeisYqvzdVT+NLTTYpiZgrF5Ba9U
	2qCswRmyOB0WlJ+KIwvu2+wBwN7r7hjl1aHzSA/Rzc4x8Xk5IwafSFbMuGxOpDxJR5zBmrDJS/Lwv
	6TXTwPMnSMJx60gNkqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGa3-0000000BoDD-2fQP;
	Fri, 06 Nov 2026 09:49:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGZy-0000000BoBZ-3DaK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:49:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AEAA1682;
	Fri,  6 Nov 2026 01:49:46 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B9E23F628;
	Fri,  6 Nov 2026 01:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793958589; bh=LQ0TS4wrpbh7eTZLNIBqGnXpSRsa0/ujpXDDC9XeSSc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sjTGYC6q6C4GKCQI3+YrAvT5ASM/aJRD9nUT9eOvYm/rPv4C+9p9QtONiqNBnYqx3
	 qbi50ikTMnDem31yG+ZUwH5Hu3mKGoetr+1io8wKqWzAHu1+j4WiklGCpvu4W/IBWq
	 fM1ctohDAb61wRN3gdtFT6cV2myIz0RDVgD3pOEc=
Message-ID: <5ca3f30c-5fea-4602-919a-6182aba20310@arm.com>
Date: Fri, 6 Nov 2026 09:49:46 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
 <20261106092625.3977163-2-fuad.tabba@linux.dev>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261106092625.3977163-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_014950_854964_69B7404B 
X-CRM114-Status: GOOD (  15.34  )
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
> Commit e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
> dropped the ALIGN() of the ITT address in MAPD, on the premise that the
> ITT pool returns 256-byte aligned blocks. However, the pool's minimum
> allocation order is get_order(ITS_ITT_ALIGN), which is 0, so its
> granule is a single byte. An ITT whose size is not a multiple of 256
> leaves the next one misaligned, MAPD drops the low bits of its address,
> and that device's ITEs land on the previous device's ITT. QEMU's
> emulated ITS has 12-byte ITEs, so two devices with 32 vectors each are
> enough to hit it.
> 
> Create the pool with a granule of ITS_ITT_ALIGN.
> 
> Fixes: e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   drivers/irqchip/irq-gic-v3-its.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 282e4bafb084f..5613c52adf88e 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5849,7 +5849,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
>   	bool has_v4_1 = false;
>   	int err;
>   
> -	itt_pool = gen_pool_create(get_order(ITS_ITT_ALIGN), -1);
> +	itt_pool = gen_pool_create(ilog2(ITS_ITT_ALIGN), -1);


gen_pool_create expects the first argument as:

min_alloc_order: log base 2 of number of bytes each bitmap bit represents

So, passing get_order() is definitely wrong and ilog2 is the correct
choice here.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

>   	if (!itt_pool)
>   		return -ENOMEM;
>   


