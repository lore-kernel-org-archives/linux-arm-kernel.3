Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FBDC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Fknv5QXxbGzjqMDIf0QFT+cu+Vlh2cbVBgcM2NOxJs=; b=Zfba3XXZfUquDWzIIhmLMlf8ec
	v5H7Qfyqk7Ac/Q6PuJuRFTQSiCdJiYPLBTwftwDV3FRaYsK4g5qrvOjFLV+hXJmxrimlJznnGaYd4
	1A2sU8XRrDId4TxNtTpXngV+VoCDqpjxf+niHfaGnZSJikUnyTJOs8jQwZC0XGZ7Znja+vs4T8PkV
	e39SIjRPcEDx2tZcQJ0lReVF7Wb6aFgSqdTaN7z/jwa2XbyVwIFO/SmltIlGZ2FZ2J1T+IsLoeklV
	3SWGLs+hI8WZKpb6U3VyufUhLWwqiIkg87Y1xizhgAQ+59k6YAprFXBKpDBgTiH/WDDBHFN8gjXMn
	+nUPAEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk31K-000000013wN-2xOp;
	Thu, 07 Aug 2025 15:59:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2yn-000000013g4-2jEs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 15:56:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE07FA55A96;
	Thu,  7 Aug 2025 15:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60936C4CEEB;
	Thu,  7 Aug 2025 15:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754582192;
	bh=Xs2eRRgMOKZ3yJrDm7z8G/UmvBpz47OWkvePKKXCCzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/xuTx+Xd3I3yDNkd0MUdhEoTNZ047KhLQOr9QMASpgWAs41RDJGRtToDZumDRi7F
	 8nt4LKReshbg3CBXwjNAV2gHvn+kp+Dw6CIX1DS1CyqATd22MgTQ0qgHj8QEsz8xki
	 iL/AmLh0jkWcGPTRYMKbT1J+/fiED9IxR3Zd6pxEFVZXrRzH7yDuSutgaGkHUpfwCr
	 ycWChe0d/aUecgorjBVETU9z+ishyX96Wl2IJDrJqnwqGLQFK0axlZtjspMGYsoZR6
	 UjjHWaHJYgqfV9JpFuLzkzO79RYVwIIr30gO3CzG6zB18SjxVIaM+2SBIfZzmyvO82
	 vt8EY3yvXZIqQ==
Date: Thu, 7 Aug 2025 08:56:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kvm: arm64: use BUG() instead of BUG_ON(1)
Message-ID: <20250807155626.GA2145434@ax162>
References: <20250807072132.4170088-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807072132.4170088-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_085633_764787_F9DABFD6 
X-CRM114-Status: GOOD (  20.36  )
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

On Thu, Aug 07, 2025 at 09:21:28AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The BUG_ON() macro adds a little bit of complexity over BUG(), and in
> some cases this ends up confusing the compiler's control flow analysis
> in a way that results in a warning. This one now shows up with clang-21:
> 
> arch/arm64/kvm/vgic/vgic-mmio.c:1094:3: error: variable 'len' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>  1094 |                 BUG_ON(1);
> 
> Change both instances of BUG_ON(1) to a plain BUG() in the arm64 kvm
> code, to avoid the false-positive warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Yeah I had responded to a build report around this but I never followed
up on seeing if it got fixed.

https://lore.kernel.org/20250714171559.GA1364710@ax162/

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm64/kvm/hyp/nvhe/list_debug.c | 2 +-
>  arch/arm64/kvm/vgic/vgic-mmio.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/list_debug.c b/arch/arm64/kvm/hyp/nvhe/list_debug.c
> index 46a2d4f2b3c6..baa6260f88dc 100644
> --- a/arch/arm64/kvm/hyp/nvhe/list_debug.c
> +++ b/arch/arm64/kvm/hyp/nvhe/list_debug.c
> @@ -17,7 +17,7 @@ static inline __must_check bool nvhe_check_data_corruption(bool v)
>  		bool corruption = unlikely(condition);			 \
>  		if (corruption) {					 \
>  			if (IS_ENABLED(CONFIG_BUG_ON_DATA_CORRUPTION)) { \
> -				BUG_ON(1);				 \
> +				BUG();				 	 \
>  			} else						 \
>  				WARN_ON(1);				 \
>  		}							 \
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
> index e416e433baff..a573b1f0c6cb 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio.c
> +++ b/arch/arm64/kvm/vgic/vgic-mmio.c
> @@ -1091,7 +1091,7 @@ int vgic_register_dist_iodev(struct kvm *kvm, gpa_t dist_base_address,
>  		len = vgic_v3_init_dist_iodev(io_device);
>  		break;
>  	default:
> -		BUG_ON(1);
> +		BUG();
>  	}
>  
>  	io_device->base_addr = dist_base_address;
> -- 
> 2.39.5
> 
> 

