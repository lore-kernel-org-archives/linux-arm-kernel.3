Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4BECA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dX2j6jftY29+KqweHY3PNwIJjp/qX5H2Xz/6o7CjN9A=; b=hjjjXFXB1o3fRH9RMWJDmCtjBS
	tsYgGaGBguW1M5xZsmOVNiC9fG3HuK3YGYNvG+l9jmSwCjqGQ2VuVWCVoOKYLYcNELRjBrHx5H+3a
	aYKzEaqFLlIxa6X5RLW8IixHE4fCoLW9aNrpqeor74FJkI7vaS/XrcOuGb8lcEzbx9E7YbA1JiKbW
	534jteJP9hJvNIJB7QfnKh4oemBrobYYUllw8PLqKl5BEKMQAMAm8TPkzBoyThZ5CWYusLxpMRXFY
	T0ouZqAKv9mplPkpsZf5tfE3Oc31f+pYvAeSWcqbR4qqpU99KRq2RC44mScVQoom+OsOz3T7/RxOC
	qi8Fyn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwHr-0000000C1f4-2yvX;
	Tue, 12 Aug 2025 21:12:04 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvZ5-0000000BwDg-1UH8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 20:25:48 +0000
Date: Tue, 12 Aug 2025 13:23:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755030221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dX2j6jftY29+KqweHY3PNwIJjp/qX5H2Xz/6o7CjN9A=;
	b=DvGpu18So3vkJyOQpg+tmeRHcr48tG/vyY1KhUQykdF3gbmyFffjVYlwFxqfZlVDQTeWD1
	95RC24rxOwiA2fGc7eYeNy910rqsW2vFNkYz8I3PafN3NrevVvqht97maiJUDgkPjxuP8R
	Q48yWTa0hneV16oFYLk5CKNOW+tDNtI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Fix vcpu_{read,write}_sys_reg() accessors
Message-ID: <aJuixWlc87f2UlK0@linux.dev>
References: <20250809144811.2314038-1-maz@kernel.org>
 <20250809144811.2314038-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809144811.2314038-3-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_132547_532039_11B72517 
X-CRM114-Status: GOOD (  14.76  )
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

On Sat, Aug 09, 2025 at 03:48:11PM +0100, Marc Zyngier wrote:
> @@ -144,125 +156,120 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
>  		MAPPED_EL2_SYSREG(ZCR_EL2,     ZCR_EL1,     NULL	     );
>  		MAPPED_EL2_SYSREG(CONTEXTIDR_EL2, CONTEXTIDR_EL1, NULL	     );
>  		MAPPED_EL2_SYSREG(SCTLR2_EL2,  SCTLR2_EL1,  NULL	     );
> +	case CNTHCTL_EL2:
> +		/* CNTHCTL_EL2 is super special, until we support NV2.1 */
> +		loc->loc = ((is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu)) ?
> +			    SR_LOC_SPECIAL : SR_LOC_MEMORY);
> +		break;
> +	case TPIDR_EL0:
> +	case TPIDRRO_EL0:
> +	case TPIDR_EL1:
> +	case PAR_EL1:
> +		/* These registers are always loaded, no matter what */
> +		loc->loc = SR_LOC_LOADED;
> +		break;
>  	default:
> -		return false;
> +		/*
> +		 * Non-mapped EL2 registers are by definition in memory, but
> +		 * we don't need to distinguish them here, as the CPU
> +		 * register accessors will bail out and we'll end-up using
> +		 * the backing store.
> +		 *
> +		 * EL1 registers are, however, only loaded if we're
> +		 * not in hypervisor context.
> +		 */
> +		loc->loc = is_hyp_ctxt(vcpu) ? SR_LOC_MEMORY : SR_LOC_LOADED;

Hmm... I get the feeling that this flow is becoming even more subtle.
There's some implicit coupling between this switch statement and the
__vcpu_{read,write}_sys_reg_from_cpu() which feels like it could be
error prone. Especially since we're gonna lose the WARN() that would
inform us if an on-CPU register was actually redirected to memory.

I'm wondering if we need some macro hell containing the block of
registers we handle on-CPU and expand that can be expanded into this
triage switch case as well as the sysreg accessor.

What you have definitely seems correct, though. I'll twiddle a bit and
see if I come up with something, although I imagine what you have is
what we'll use in the end anyway.

Thanks,
Oliver

