Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E486BCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0egTMB0eVJG+8gx1imSrbVZ39xE8cWiRG6ao1LpWXY=; b=t6K4TOeWEh66qM84di7nREbuCC
	bJ2X2ZFtDL21y38C21TKtlna7OO+hVp9cEc05CcEBTsU52lZ0wzNlTVmsmXBF5THNQnxUz3wE6ADd
	ygigUESNCyapo174ch46fJWMJfaHnTU4ue9BcDtNGug1OwxDYWyvhBkFAMxHNN2zsnKFbQceNt+o9
	xs83gIbymZOicS15iIMHHNNaWKzDh1p6Dk+v75pZZ03/Fhk6fbCMmhL+MThV3GJtOFCz42Is1xSAR
	N2Bh9u2YbC5DHQR6rdSTd3FyNUoXf5S1VICyKRb6Jm/U2xAArgyfbz/21zxKC4GTPS8OzGNHSqKNf
	wNidykLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBu9P-000000066MY-2Wrp;
	Wed, 30 Sep 2026 13:15:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBu9L-000000066M2-45By
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:15:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A8E6497;
	Wed, 30 Sep 2026 06:15:03 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F2B93F86F;
	Wed, 30 Sep 2026 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790774106; bh=vg7MW/V4HY5tvB5/b+Uq7fMjQ87Rz4OVY8HhQKNXqJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThFLakqffTbj2ib6KicQbQjOxFz0FcE+uenjE6tXtxwTLir2gJkQ3ZxVGvINz9XPh
	 q77qEmlchGDHM/wHgBDSj+BGHPdwqQ8nnI9QJAn6j1dN9SDukMKrqBqAfptRvilZ70
	 t7fSmkiZ/TG/i7p/g/aTn6KqJ5ghcgUk0rgWNdvE=
Date: Wed, 30 Sep 2026 14:15:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v20 4/9] firmware: arm_rmm: Add support for SRO
Message-ID: <ar0LQwXM5MEvFUWa@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-5-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929221623.1342076-5-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_061508_062997_A813D3D0 
X-CRM114-Status: GOOD (  13.10  )
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

On Tue, Sep 29, 2026 at 11:16:18PM +0100, Suzuki K Poulose wrote:
> +static int rmi_sro_donate_contig(struct rmi_sro_state *sro,
> +				 unsigned long sro_handle,
> +				 unsigned long donatereq,
> +				 struct arm_smccc_1_2_regs *out_regs,
> +				 gfp_t gfp)
> +{
> +	unsigned long block_size_fld = RMI_DONATE_BLOCK_SIZE(donatereq);
> +	unsigned long block_size = rmi_addr_block_size_to_bytes(block_size_fld);
> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
> +	unsigned long state = RMI_DONATE_STATE(donatereq);
> +	unsigned long size = block_size * count;
> +	unsigned long addr_range;
> +	unsigned long donated_size;
> +	int ret;
> +	void *virt;
> +	phys_addr_t phys;
> +
> +	/*
> +	 * The RMM specification requires contiguous allocations are always a
> +	 * power of 2
> +	 */
> +	if (WARN_ON_ONCE(!is_power_of_2(size)))
> +		return -EINVAL;
> +	/*
> +	 * RMM clamps the Maximum value of RmiOpMemDonateReq:count to prevent
> +	 * overflow in the RMI_ADDR_RANGE_COUNT field.
> +	 */
> +	if (WARN_ON_ONCE(count > (BIT(PAGE_SHIFT - 2) - 1)))
> +		return -EINVAL;

Nit: it might be easier to read as FIELD_MAX(RMI_ADDR_RANGE_COUNT_MASK)
as that's what we want to limit it to.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

(Sashiko seems to have more findings but the rest looks alright to me)

