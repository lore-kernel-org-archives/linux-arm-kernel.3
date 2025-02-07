Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5CBC02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aLodBbuz73clUqn2bpgO/5LEt3OTqmjDeud50rItdI=; b=0uwLthrisUMQrLuJI8nq6FZeQe
	2OPTuwEs7EK8CBY3StWgOsdlHQfXZX3VTxqAMGKe7RsAjNvE9ayA/2g4lkjxI5aWKVlH7gLu/oa7n
	4tKlu7+SaODSDFAxdmSHgVIuWnuMWKoTczYL4Z3zP5D+wdfjf6/Qq7Sb7kRtN5yOvelgNYEqnb1rf
	S8Aj/CarqqD4waKEsK8z9pR/dGVUr0+gU+r0bMg5gnEPstIk29d7OCd5jLYMi0HK1gMU6HLzAl72g
	OS+XceygUY4dYAOqLdvKSQ3x9fSQOZFsb+wMbV4Sp3s1Ib7L9PlrNwxNO2z0jJYFeOb1ZgoulYMVy
	z1WPAXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgP3h-00000009nKN-0p8V;
	Fri, 07 Feb 2025 14:10:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgP2I-00000009n2X-3ulq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:08:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2EBCF5C6085;
	Fri,  7 Feb 2025 14:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED39C4CED1;
	Fri,  7 Feb 2025 14:08:46 +0000 (UTC)
Date: Fri, 7 Feb 2025 14:08:44 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	will@kernel.org, mark.rutland@arm.com, cohuck@redhat.com,
	eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
	wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v6 4/4] arm64: paravirt: Enable errata based on
 implementation CPUs
Message-ID: <Z6YT7GxVKGKcnYmL@arm.com>
References: <20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com>
 <20250205132222.55816-5-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205132222.55816-5-shameerali.kolothum.thodi@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_060851_012100_E6C7960F 
X-CRM114-Status: GOOD (  11.64  )
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

On Wed, Feb 05, 2025 at 01:22:22PM +0000, Shameer Kolothum wrote:
>  static inline bool is_midr_in_range(struct midr_range const *range)
>  {
> -	return midr_is_cpu_model_range(read_cpuid_id(), range->model,
> -				       range->rv_min, range->rv_max);
> +	int i;
> +
> +	if (!target_impl_cpu_num)
> +		return midr_is_cpu_model_range(read_cpuid_id(), range->model,
> +					       range->rv_min, range->rv_max);
> +
> +	for (i = 0; i < target_impl_cpu_num; i++) {
> +		if (midr_is_cpu_model_range(target_impl_cpus[i].midr,
> +					    range->model,
> +					    range->rv_min, range->rv_max))
> +			return true;
> +	}
> +	return false;
>  }

It's a interesting approach but how does this work in practice if an
erratum requires a firmware counterpart? Do we expect firmwares on all
machines involved to have workarounds for the other machines? Or is KVM
going to intercept those SMCs and pretend the EL3 counterpart is there?

-- 
Catalin

