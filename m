Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D82C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJ74uTcZ1w6H13eWlEAZANz/v1FhwMnE0af0UukasGE=; b=alTAX6s7NTOIdzKJxWD9/zSIzD
	2Izs7vivkQANyLkDvrOwqVonIiB2vfVkh7M21VFdhvSdhniSBSW6rQGW3ZcUvWT8anLiWCYV9F3zW
	y2SaV86+a00IocNRpvR6vVR5Ccs7emChcux9+ujrQpbwfjT8l6OW8L46lWt5oh4/8OtUDXEBUVgDK
	8A8pvjdUQ2Lm93cFFloGQaD8SFjMlN9D/GhDHUpXxBL7IYD8AOJwkrSVdjTiS4uFMKtarV6q9lkgg
	BQzgOVH/W55gPjBqmF3W679qojfg4oQx6/9HnUdksMuJmwPnksHJSvFZ0KWizH4IP7H/cCE5Cxes2
	Z0gssdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aU6-00000007448-0AM2;
	Mon, 07 Sep 2026 14:38:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aU2-0000000743o-3mra
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:38:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DF811476;
	Mon,  7 Sep 2026 07:38:01 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 036B73F528;
	Mon,  7 Sep 2026 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788791885; bh=WUNSoWZpeqdDZs8W4YWQUVGB39NYxjnCgCjxLQYs5jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDdmMswXM7Hyaxng4ZWtOFUzjYY9W9L3t2I6wgjA2csgfHO7soIZNCWzGxwQqTROn
	 hpcnBPqMDP9HZ0hSK7TeQxX6tNaGzjaBJxu6YvgNmXFh/RE2pcDUeW6+vqOqDgEOIT
	 /V36J4k5vsFR4Gtb88FtWgeQKGDXugPr/ss2KbfA=
Date: Mon, 7 Sep 2026 15:37:56 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, 
	oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 04/20] KVM: arm64: Use block-level annotations when
 setting up the host stage-2
Message-ID: <n2cker7zphcsacuck5ovwtj6k622ykpadg6njs2qirhqxj5keh@ub2dnnarnmmm>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-5-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803100904.3563942-5-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_073807_058343_78694632 
X-CRM114-Status: GOOD (  14.79  )
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

On Mon, Aug 03, 2026 at 11:08:48AM +0100, Vincent Donnefort wrote:

[...]

> +static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
> +				     enum kvm_pgtable_walk_flags visit)
> +{
> +	struct fix_host_ownership_data *data = ctx->arg;
> +	enum kvm_pgtable_prot prot = 0;
> +	phys_addr_t phys = 0;
> +	int ret;
> +
> +	if (kvm_pte_valid(ctx->old))
> +		prot = kvm_pgtable_hyp_pte_prot(ctx->old);
> +
> +	if (!prot) {
> +		/* Unchanged region */
> +		if (!data->prot)
> +			return 0;
> +
> +		goto apply_ownership;
> +	}
> +
> +	phys = kvm_pte_to_phys(ctx->old);
> +	if (!addr_is_memory(phys))
> +		return -EINVAL;
> +
> +	/* We already know phys is contiguous as we walk the linear map */
> +
> +	if (prot != data->prot)
> +		goto apply_ownership;
> +
> +	/* Accumulate in the current region */
> +	data->size += kvm_granule_size(ctx->level);
> +
> +	return 0;
> +
> +apply_ownership:
> +	ret = __fix_host_ownership(data);
> +	if (ret)
> +		return ret;
> +
> +	data->phys = phys;
> +	data->size = kvm_granule_size(ctx->level);
> +	data->prot = prot;
> +
> +	return 0;
> +}

I think this function can be simplified, if we check phys first:

static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
				     enum kvm_pgtable_walk_flags visit)
{
	struct fix_host_ownership_data *data = ctx->arg;
	enum kvm_pgtable_prot prot = 0;
	phys_addr_t phys = 0;
	int ret;

	if (kvm_pte_valid(ctx->old))
		prot = kvm_pgtable_hyp_pte_prot(ctx->old);

	if (prot) {
		phys = kvm_pte_to_phys(ctx->old);
		if (!addr_is_memory(phys))
			return -EINVAL;
	}

	if (prot != data->prot) {
		ret = __fix_host_ownership(data);
		if (ret)
			return ret;

		data->phys = phys;
		data->size = kvm_granule_size(ctx->level);
		data->prot = prot;
	} else {
		data->size += kvm_granule_size(ctx->level);
	}
	return 0;
}

Did I miss anything?

Thanks,
Wei-Lin Chang

