Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22264CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 21:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtpdMC3f1KAFmxjZUh+ailSfGGlGpQNYcvTeq7U0rMo=; b=jzTooW8LKoXpkWte9H/d2m+d2i
	Q+R7eDdvqXVJBfD6RmyXWDb2AULBctxYhV03Jizd++ifsGEA+y1TG9atR0dc71ywc6JwhfOE7tPoL
	3aLWB9bubk3gERDXyuM7GehKvUwd60Qnp3z9/P7UqZqpRO1crPZUubVLgbexRkpiVGfW1mIJOFNFr
	SS0wNMkYp9B3SAOkUYwLgOChKNk56W2hvXeWeNnh6q7v1LF/B6P0LNXokBvj11Q4RFqdSkW41HTtC
	ZlXw2BBUuHbQBQZdSJfqH9xNKUCdJTwdLuOv5h4e2Gn8bE67MuEdA+lBuBLcGosjdJokCBrOfx9Y+
	SniyNf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGkH8-0000000E66Z-1reE;
	Tue, 13 Oct 2026 21:43:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGkH6-0000000E66P-3II4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 21:43:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A28DD601DB;
	Tue, 13 Oct 2026 21:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44A91F000FF;
	Tue, 13 Oct 2026 21:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791927787;
	bh=wtpdMC3f1KAFmxjZUh+ailSfGGlGpQNYcvTeq7U0rMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hwF/UfHPALEXRP/WvYSE5C40fRUfBxh4qXHyuJsN2ea3BoxA9J+LvrGWTu4LE+iVp
	 ZZ7MyEED+qJ8POJJSdCyWM1gZ63Tw1j9sUcjMNyNXEAkmmD0wAdrW4tAjuMU8bJATI
	 E8vtUZRIN1vrUU3eLhQ75XD7D8Rud4VczwNaU94mMb0TOjqaQR2NjIwoj22MfVHtXV
	 fTTULt78Ma/CYKNRT0TLVfk2IXyTRH/d8c7bbJm26CNCKXZLfEfYxWaxiHk9VB04aG
	 n5YKxlAfYviu572j04hONGrejAGo7I4jHSCbnLsrYLfGJ5kbjmd0qJK2ofmKA6ULPJ
	 DTdejL1c9jAKg==
Date: Tue, 13 Oct 2026 14:42:59 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Don't WARN on SMCCC filter reserved range
 allocation failure
Message-ID: <as6l4-oADdUKiVLq@kernel.org>
References: <20261013164334.1492070-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013164334.1492070-1-fuad.tabba@linux.dev>
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

On Tue, Oct 13, 2026 at 05:43:34PM +0100, Fuad Tabba wrote:
> The first time userspace sets an SMCCC filter, kvm_smccc_set_filter()
> inserts the reserved architecture ranges into the maple tree and WARNs
> if that fails. The insertion allocates with GFP_KERNEL_ACCOUNT, so a
> tight memory cgroup limit is enough for userspace to hit the WARN, even
> though the -ENOMEM is also returned to it. The WARN dates back to when
> the ranges were inserted at VM creation.
> 
> Leave -ENOMEM out of the WARN and keep it for every other error. The
> two reserved ranges are fixed and disjoint and go into an empty tree
> under config_lock, so any other error is a KVM bug.
> 
> Fixes: fb88707dd39bd ("KVM: arm64: Use a maple tree to represent the SMCCC filter")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260829055809.29AD31F000E9@smtp.kernel.org/
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

> ---
> Changes since v1 [1]:
>   - Keep the WARN for any error other than -ENOMEM. (Oliver)
>   - Split out of v1 as its own patch. (Marc)
> 
> Based on Linux 7.3-rc3 (fd73f4a665989).
> 
> [1] https://lore.kernel.org/all/20260928152507.2116110-2-fuad.tabba@linux.dev/
> 
>  arch/arm64/kvm/hypercalls.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index b11b8821c9fbc..c9d488c586e5f 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -197,8 +197,10 @@ static int kvm_smccc_set_filter(struct kvm *kvm, struct kvm_smccc_filter __user
>  
>  	if (!kvm_smccc_filter_configured(kvm)) {
>  		r = kvm_smccc_filter_insert_reserved(kvm);
> -		if (WARN_ON_ONCE(r))
> +		if (r) {
> +			WARN_ON_ONCE(r != -ENOMEM);
>  			goto out_unlock;
> +		}
>  	}
>  
>  	r = mtree_insert_range(&kvm->arch.smccc_filter, start, end,
> 
> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
> -- 
> 2.39.5
> 
> 

