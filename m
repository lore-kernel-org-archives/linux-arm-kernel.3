Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A29D6392D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsUNlAwTDMksRzhrgp1dyy0KnNkr+tmdl6QVNbp3R04=; b=o6QttcgucoQSXGXgdd7Heh14/L
	0t1YkqhhW4HEEDshYuEzrviTngcAsvGR7Ee/klPRr6RPBOeggm8ENy80CgiOzHYSYK3cfJLsLjeo+
	ZPh9M2olXjcnDli4V66+DS6i1no6qjq1xM411qqkmMBIhIFEE7CVr1JZekCglwj0ZwEkIJ+UDhvNg
	ftbaAhFlGcN6+eYlmqGDKrdhq0eEhofWc5JfALW6PVezAoJrxHqVSWteHgjgFVWNQ0HGv/svLbQZA
	kiEjQjBPfT1UIEAdBUIi6IJT+QH4iFSE0itloc6BEnx/h1yJpVkhykmaaFzfa6aw8QU1joJJkHYAP
	Fv29vGEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiqk-0000000FBoI-18HY;
	Wed, 20 Nov 2024 11:26:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDipm-0000000FBjD-3SVR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 11:25:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 668511480;
	Wed, 20 Nov 2024 03:25:49 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77C3E3F5A1;
	Wed, 20 Nov 2024 03:25:18 -0800 (PST)
Date: Wed, 20 Nov 2024 11:25:13 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] KVM: arm64: Mark set_sysreg_masks() as inline to avoid
 build failure
Message-ID: <20241120112513.GA1500059@e124191.cambridge.arm.com>
References: <20241120111516.304250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120111516.304250-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_032522_903443_E99B22E6 
X-CRM114-Status: GOOD (  16.18  )
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

On Wed, Nov 20, 2024 at 11:15:16AM +0000, Marc Zyngier wrote:
> When compiling with CONFIG_CC_OPTIMIZE_FOR_SIZE=y, set_sysreg_masks()
> fails to compile thanks to:
> 
> 	BUILD_BUG_ON(!__builtin_constant_p(sr));
> 
> as the compiler doesn't identify sr as a constant, despite all the
> callers passing constants.
> 
> Fix the issue by always inlining this function, which allows GCC to
> do the right thing.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411201857.ZNudtGJl-lkp@intel.com/
> Fixes: a0162020095e2 ("KVM: arm64: Extend masking facility to arbitrary registers")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/nested.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index aeaa6017ffd89..9b36218b48def 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -951,7 +951,7 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *vcpu,
>  	return v;
>  }
>  
> -static void set_sysreg_masks(struct kvm *kvm, int sr, u64 res0, u64 res1)
> +static __always_inline void set_sysreg_masks(struct kvm *kvm, int sr, u64 res0, u64 res1)
>  {
>  	int i = sr - __SANITISED_REG_START__;
>  


Reviewed-by: Joey Gouly <joey.gouly@arm.com>

