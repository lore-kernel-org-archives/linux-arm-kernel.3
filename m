Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CA0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Wry1Am/yLsT0+JWJ5PlgVuBz37d8+/LGvTZudFiNzs=; b=B9W4alcdVtjg5eC4Jq7dAXMxjm
	IQYgvrREaQh+ijq/ypH9jFevL8ptJ6f4TxCypV98Yfp6XSI7jWrbV3RKm+sbg8pKUp3JivCQFNR0F
	aHvLFfdh1Tjxfxc4w7FM042b66ePKs2r7cRAQS220csnHfZmaTghRIBiVulmJHqYdfrzbgE9xTw+B
	y9OmtUIuz0VYIh4gknXK4OY2zAXwuSj18uS/9tYXr1CrCCMZXrfLxN3ludRd0USPLjvzGUpcJOPEe
	cAs+RiUt+tee+PB14ukistLHJk4rAwGm1LmumZwJHyABxqQxhSAXysbtq7OLr6p16KVDMTqUmT5DF
	J0/RkMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVcP-00000004T9Q-3Imo;
	Thu, 30 Oct 2025 16:35:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVcN-00000004T96-2IWw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 16:35:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 923746021F;
	Thu, 30 Oct 2025 16:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38906C4CEF1;
	Thu, 30 Oct 2025 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761842118;
	bh=hN0a1nBdKiMFiaSD/0G7lwpKVl2foow4E6pO4Pcw4F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmBVhbsrQtd2KdUoHIzwQgLRpap1mnzaevw6pXbKZmMsNw4YgKVexPHNc+DCZY7rz
	 ELtQbSCDRehuO8RYNFosVNUPCBYaIU7Kfd9n4dxOTyTSs8BHnBv5my6P065L8BsEt4
	 DP+yxEOUtptvkZ5QS15jYpGGlNjqohyoPfI5I244Ur7FUZRrXWL332j/G568pykAXF
	 UKqH00JIBeGIN2C2A4CJSccwnDSoh9TCGnUvIiYeJbipWvnATN7/NkFzSosiKKPsmn
	 iF1Hsc6UmyIjWRbE6V0KclKFYW7SD35wb1hzt9rZ7wSKxzRmsCh9W9aWQqgfQl9iHM
	 vYREVSeY9+4CQ==
Date: Thu, 30 Oct 2025 17:35:11 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 3/4] clocksource/drivers/arm_arch_timer_mmio: Switch
 over to standalone driver
Message-ID: <aQOTv3VnOCTjSj46@lpieralisi>
References: <20250814154622.10193-1-maz@kernel.org>
 <20250814154622.10193-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814154622.10193-4-maz@kernel.org>
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

On Thu, Aug 14, 2025 at 04:46:21PM +0100, Marc Zyngier wrote:

[...]

> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c

[...]

>  #ifdef CONFIG_ACPI_GTDT
> -static int __init
> -arch_timer_mem_verify_cntfrq(struct arch_timer_mem *timer_mem)
> -{
> -	struct arch_timer_mem_frame *frame;
> -	u32 rate;
> -	int i;
> -
> -	for (i = 0; i < ARCH_TIMER_MEM_MAX_FRAMES; i++) {
> -		frame = &timer_mem->frame[i];
> -
> -		if (!frame->valid)
> -			continue;
> -
> -		rate = arch_timer_mem_frame_get_cntfrq(frame);
> -		if (rate == arch_timer_rate)
> -			continue;
> -
> -		pr_err(FW_BUG "CNTFRQ mismatch: frame @ %pa: (0x%08lx), CPU: (0x%08lx)\n",
> -			&frame->cntbase,
> -			(unsigned long)rate, (unsigned long)arch_timer_rate);
> -
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static int __init arch_timer_mem_acpi_init(int platform_timer_count)
> -{
> -	struct arch_timer_mem *timers, *timer;
> -	struct arch_timer_mem_frame *frame, *best_frame = NULL;
> -	int timer_count, i, ret = 0;
> -
> -	timers = kcalloc(platform_timer_count, sizeof(*timers),
> -			    GFP_KERNEL);
> -	if (!timers)
> -		return -ENOMEM;
> -
> -	ret = acpi_arch_timer_mem_init(timers, &timer_count);

You probably already noticed (I was checking the initcall level in
drivers/acpi/arm64/gtdt.c to start sorting out GICv5 IWB dependencies),
AFAICS acpi_arch_timer_mem_init() is now unused so it can be removed.

Thanks,
Lorenzo

