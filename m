Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2F5C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQNGWTk0C38Hs1u5kVIgIbQF9al0zYxSfDbukQVEcl0=; b=XMgWkrTJE9HTDtbE0XZUnKredl
	guJB6F3b/RRwBXoKA09hVXkOUOtSEkDG38Q3t6DLApR44oQ0Ub4D9ivYmC2fGTJ7dPgMWDrU5sTb6
	5PYL2oUV14EzDMEXai+YkRHwm5RL+gV0v5d0KbbSnRvivRB+EhCI82Eqd+uwRvIH0yRDz4fFMtzLv
	Pqz19m1S8Df6FH0RZtmFGpkkMgBatn4dbtPCKkaUwMcTZxlWYB5zDmnIGpqiL82UlUhJvhrXDh3h4
	N74nPV709j1ZQQ5rag+YroCs2xIyJK0OkMluHQFntjPxzdITHVe6tAmnZsI8WOJRhurbpZf0IegLU
	lcLVB6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcT59-00000002uSB-2CZh;
	Mon, 27 Jan 2025 17:39:31 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcT3o-00000002uIW-0dPy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 17:38:09 +0000
Date: Mon, 27 Jan 2025 09:37:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737999480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQNGWTk0C38Hs1u5kVIgIbQF9al0zYxSfDbukQVEcl0=;
	b=sGqjcCx/rEzKDe5DeIUDRMPSt6ed1g3q6YQE/9pKA/MTD41Dv6zozl5UKdkfHE9lB2hLIu
	EoIxFOOjBtDQSeEjpyGSLz9UP+LJiTEzu3Hxu+AEjT3Zx0C4nY3y307nuX0K9LUVp8hBtv
	ZVXeKWO+nslNdL+8xi3W7Menn80S3zU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, maz@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, cohuck@redhat.com,
	eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
	wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v5 4/4] arm64: paravirt: Enable errata based on
 implementation CPUs
Message-ID: <Z5fEcqVDrPP_7pXp@linux.dev>
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
 <20250124151732.6072-5-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124151732.6072-5-shameerali.kolothum.thodi@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_093808_461984_09E88DE8 
X-CRM114-Status: GOOD (  13.59  )
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

On Fri, Jan 24, 2025 at 03:17:32PM +0000, Shameer Kolothum wrote:
> +void  __init pv_target_impl_cpu_init(void)

I get the sense that this implementation should actually be part of the
KVM guest services driver in drivers/firmware/smccc/kvm_guest.c

> +{
> +	int i;
> +	unsigned long max_cpus;
> +	struct arm_smccc_res res;
> +	const u32 funcs[] = {
> +		ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER,
> +		ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS,
> +	};
> +
> +	/* Check we have already set targets */
> +	if (target_impl_cpu_num)
> +		return;
> +
> +	for (i = 0; i < ARRAY_SIZE(funcs); ++i) {
> +		if (!kvm_arm_hyp_service_available(funcs[i]))
> +			return;
> +	}

nit: drop the for loop and just use the literal values.

> +	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_VER_FUNC_ID,
> +			     0, &res);
> +	if (res.a0 != SMCCC_RET_SUCCESS)
> +		return;
> +
> +	if (res.a1 != ARM_SMCCC_KVM_DISCOVER_IMPL_VER_1_0 || !res.a2) {

This is brittle. The versioning scheme really should match that of PSCI
/ SMCCC, where minor revisions within the same major are backwards
compatible with older clients.

So consider just checking that the major version is 1.

> +		pr_warn("Unsupported target impl version or CPU implementations\n");

This would be more useful if you provide context (i.e. the detected
version).

-- 
Thanks,
Oliver

