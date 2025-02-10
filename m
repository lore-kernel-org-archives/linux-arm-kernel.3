Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B58C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4hcd5p1OATgqYTmoPCcHRGQ0r0fkeJOwBq+RIFNkL8=; b=y30KQhZSr7WDaJ63yDssHDwOWE
	Dt1v+waDfPDMvHCYp8dLfWSCThAO+QgaGhbxbGPdKXoZvlI7VzXk1fY8o7csvvY/C4xYJzFaLcJYE
	Lehhw3kO17+ZtDPbDVsNsjo4WpxHtGisiLYV8m+8FlSnVh3bJoVJ7s4PQT5fifOPC2Cpmkf7mLuZT
	bJGwL4WopMh5x0kw4knuD482DK8Sk0SoQkm+BhedMAc+TU1G44mVzBzQHcqEA1akEUY9k6bGuCv+3
	uP0hYJ+9t+aTpJc4cnvt2i05iBQjdUqCsAYPM7OEmZ7xb0gVpfkivCSJcQI1f/b4gmHaAqGdLCJau
	HtJphZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWmI-00000000Xmj-0GFr;
	Mon, 10 Feb 2025 16:36:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWk2-00000000XPr-0Ddf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:34:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB0B5A41A87;
	Mon, 10 Feb 2025 16:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81655C4CEDF;
	Mon, 10 Feb 2025 16:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205276;
	bh=TlIWjQGJKlEBYE9A3vQa414cBX1UvKjrazPd6Ba6uv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HsZEiMhYOaUB4/c+LRVfXW8h1xWWk929xFW7Vqyq7hrl+8CI75VtkgQtRsmP9+8++
	 bKGKUpQKMxxErAIT4vKvgYMPXXG9GmxZ9Rh7yeAYdFHrwIEftdOhm/W/xutFpjiiLH
	 C9yLrsmcNFXtWJA7mD4mlG3PZL0lKPlrDXdzl2I1+nKlUH4ONGw0rK8RO54wVM2JSd
	 Cz6YUJxZC13lvt2QGLSLVVIuH4np1El0WLeAVzIGPHsDkzjMwVpQ0NRQ0ce1+eaUR9
	 ffwDbn9s5e1CUldv8IKxTvRy/15huhkC/q7D246M61WZxEu8b9DX4xgy0DiqCjiqbv
	 TvrxwogMAPDEw==
Date: Mon, 10 Feb 2025 16:34:31 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 5/8] KVM: arm64: Refactor CPTR trap deactivation
Message-ID: <20250210163429.GF7568@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-6-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206141102.954688-6-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_083438_214341_B3A524DC 
X-CRM114-Status: GOOD (  22.11  )
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

On Thu, Feb 06, 2025 at 02:10:59PM +0000, Mark Rutland wrote:
> For historical reasons, the VHE and nVHE/hVHE implementations of
> __activate_cptr_traps() pair with a common implementation of
> __kvm_reset_cptr_el2(), which ideally would be named
> __deactivate_cptr_traps().
> 
> Rename __kvm_reset_cptr_el2() to __deactivate_cptr_traps(), and split it
> into separate VHE and nVHE/hVHE variants so that each can be paired with
> its corresponding implementation of __activate_cptr_traps().
> 
> At the same time, fold kvm_write_cptr_el2() into its callers. This
> makes it clear in-context whether a write is made to the CPACR_EL1
> encoding or the CPTR_EL2 encoding, and removes the possibility of
> confusion as to whether kvm_write_cptr_el2() reformats the sysreg fields
> as cpacr_clear_set() does.
> 
> In the nVHE/hVHE implementation of __activate_cptr_traps(), placing the
> sysreg writes within the if-else blocks requires that the call to
> __activate_traps_fpsimd32() is moved earlier, but as this was always
> called before writing to CPTR_EL2/CPACR_EL1, this should not result in a
> functional change.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>

[...]

> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index 7a2d189176249..5d79f63a4f861 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -39,6 +39,9 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
>  {
>  	u64 val = CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
>  
> +	if (!guest_owns_fp_regs())
> +		__activate_traps_fpsimd32(vcpu);
> +
>  	if (has_hvhe()) {
>  		val |= CPACR_EL1_TTA;
>  
> @@ -47,6 +50,8 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
>  			if (vcpu_has_sve(vcpu))
>  				val |= CPACR_EL1_ZEN;
>  		}
> +
> +		write_sysreg(val, cpacr_el1);
>  	} else {
>  		val |= CPTR_EL2_TTA | CPTR_NVHE_EL2_RES1;
>  
> @@ -61,12 +66,34 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
>  
>  		if (!guest_owns_fp_regs())
>  			val |= CPTR_EL2_TFP;
> +
> +		write_sysreg(val, cptr_el2);
>  	}
> +}
>  
> -	if (!guest_owns_fp_regs())
> -		__activate_traps_fpsimd32(vcpu);
> +static void __deactivate_cptr_traps(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm *kvm = kern_hyp_va(vcpu->kvm);

nit: You could lose the local if you used vcpu_has_sve(vcpu) instead.

However, given that this gets removed _anyway_ when we eagerly switch
ZCR later on:

Acked-by: Will Deacon <will@kernel.org>

Will

