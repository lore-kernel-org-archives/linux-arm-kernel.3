Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D980EC5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 19:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDKDuS/tMqaYa7uFA3zEU7s+fsP3VqdlLklUhWw6OQU=; b=aZJZF9feuxSeq4iW+O9OnL3vYt
	bW65AjyCJ/uTKX0iJKXnVgRxIJJ+ZImcgVhnwx0jLTuqFH/vFkRmrDt+bJIfsVnWJMZ0uBrdbwuF+
	WhKDvqO14OIaPZ3sFIvctWuyTC/BRXQzAnD2HmcZZr/vezsnZZiK+iGrno7GBoeBgSKJKcueB5VZR
	6EZdkWVeHXJPGvWSY16lAW6npkFpiI83B6+kKFTXvRNnqQvfayzySwTvrFXABS2K1BwFGLa7L3QF1
	ZBnLiJBbdDde0GcxZW230yDVxILsPAXFxtdfrnMKBedHkRtqRVq8yLdGqLz28YTZ1trw3BUiWZs6l
	4VgEYbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVEz-0000000Ch8g-2RjW;
	Mon, 10 Aug 2026 19:00:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVEv-0000000Ch6Z-1JdZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 19:00:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C497D14BF;
	Mon, 10 Aug 2026 12:00:41 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E80D3F86F;
	Mon, 10 Aug 2026 12:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786388445; bh=Zvr1Mqog1F5FXR6W2+Z0D6uIY2t2ZIe0qqSdBJHutBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuqdIL3fFzRCVJpany3mDGkCPNxFE9bjUbslJw71VMebIeIPlvyKOyOjGJs5l/bc8
	 53QlJb78gEg2656/jlYbHBwvCmbE5RLInl1Uh+3eSV9kqmplq5Rchqe+VYiVzYuOnG
	 pr2n/l5RFSEFUcLQq2sdmy4CBMjpVhnvzC9Hlk+8=
Date: Mon, 10 Aug 2026 20:00:36 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Correctly cap TLBI Range to the architural
 limit
Message-ID: <ulkkvfcbwgv5nu5yo4wfpcjglhety4pzgoujmvnspfbklf4p3m@7bggrzdjxibg>
References: <20260810170616.746100-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810170616.746100-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_120049_390680_27E0F0D3 
X-CRM114-Status: GOOD (  19.43  )
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

On Mon, Aug 10, 2026 at 06:06:16PM +0100, Marc Zyngier wrote:
> TLB Invalidation by Range has a fairly powerful way of encoding pretty
> large ranges in a small number of bits. This range can be based on an
> arbitrary VA, which means it is pretty easy for a guest to generate an
> overflow should the hypervisor be naive enough to add the range to the
> base...
> 
> Make sure the range is capped to the limit dictated by the address bit
> that determines the VA range. For an IPA invalidation, this is further
> corrected down the line to ignore the upper range.
> 
> Fixes: 4ffa72ad8f37e ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
> Reported-by: Wei-Lin Chang <weilin.chang@arm.com>
> Link: https://lore.kernel.org/r/yifz3wn5gk5sr6mapi32trgk5m5kp33bquctsjmkifebnsnndt@fix6u4rthx4g
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/include/asm/kvm_nested.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> index c83be6d0e79ac..1ed7083358096 100644
> --- a/arch/arm64/include/asm/kvm_nested.h
> +++ b/arch/arm64/include/asm/kvm_nested.h
> @@ -305,6 +305,12 @@ static inline u64 decode_range_tlbi(u64 val, u64 *range, u16 *asid)
>  	num	= FIELD_GET(GENMASK(43, 39), val);
>  	*range	= __TLBI_RANGE_PAGES(num, scale) << shift;
>  
> +	/* Cap the range to the correct half of the address space */
> +	if (!(base & BIT(48)))
> +		*range = min(*range, (BIT(48) - base));
> +	else
> +		*range = min(*range, ~base + 1);
> +
>  	return base;
>  }

Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>

>  
> -- 
> 2.47.3
> 

