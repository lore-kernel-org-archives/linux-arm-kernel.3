Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BC7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 00:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRvI8+E7crd/J3RVLSvgOPbllIBq4iwslHzpas9qZDc=; b=4J/ZHKc1eS9WqBCQn5waB9179z
	FexpeGFYMPSJPDgIM9dj10Cumk+Qg81NsPWSc2C5nVzqTRNT9hh+TKJiL0x4NKC6T4a+JSY/Rq54f
	IOfV0se9Wat1WEXiaVeM+ATi/xNCXX13A8318GckXiyPme2GKn+ESmB3jDPPDOynQ7jZW82LxcinR
	b+86KDqRGJ1ogQge2fltow/Srt0a8H5QGSiUS5bSKAfIm3U7DGdDiEUSZ6XavjXlwscSt+csgNhfV
	FUvZvztiY/kmrSMYC6ybJn4r701/hdEDcNEELQYr6DPZiuRXqFEaxqanuzKcebBdEjY9csKioRMIN
	rkUnAuZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcui-00000006euX-1DtM;
	Wed, 05 Mar 2025 00:47:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpct8-00000006ep9-1QrB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 00:45:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC4175C64F3;
	Wed,  5 Mar 2025 00:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D50C4CEE5;
	Wed,  5 Mar 2025 00:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741135529;
	bh=gFLlK8tKubCvB0zH2AmLKFcC0Bw0FyNX/KP5Xafjw14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZi4Nst1ORWhKWhrislwqJ0nN6gzS2masD/TWLsThj5T1FkvvBjYE4H6+bduYuIb2
	 6lp8GbvTwxeuLUMoCFXb+QKNPQclw6Or4uh7PHcKLTMXVFCXaIPS4tgRJAQbAZ3U3V
	 uFl67ncSydHcttrWPwd8UnI62QJafNDziGcEoBo6ZhuFqR3GObn+OhqBQwtKSc7AgV
	 wuoZnF8pUu84XipAeYsvSDz9v6BCPZSGJQnf7LfFNdlhQVpY+08EAtvBgRSzMhkDx1
	 dmFQovKTn0qh7ndZlU8fUG6icPeISOQMOJrSXW34dEdzNIx5b7nkzOAkva4kK43VnJ
	 vZRYw3jRpHdng==
Date: Wed, 5 Mar 2025 00:45:23 +0000
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: Release the ownership of the hyp rx
 buffer to Trustzone
Message-ID: <20250305004522.GC31667@willie-the-truck>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-5-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227181750.3606372-5-sebastianene@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_164530_435223_3A8270E9 
X-CRM114-Status: GOOD (  19.66  )
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

On Thu, Feb 27, 2025 at 06:17:49PM +0000, Sebastian Ene wrote:
> Introduce the release FF-A call to notify Trustzone that the hypervisor
> has finished copying the data from the buffer shared with Trustzone to
> the non-secure partition.
> 
> Reported-by: Andrei Homescu <ahomescu@google.com>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 861f24de97cb..7da0203f1ee9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -725,6 +725,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
>  	DECLARE_REG(u32, uuid3, ctxt, 4);
>  	DECLARE_REG(u32, flags, ctxt, 5);
>  	u32 count, partition_sz, copy_sz;
> +	struct arm_smccc_res _res;
>  
>  	hyp_spin_lock(&host_buffers.lock);
>  	if (!host_buffers.rx) {
> @@ -741,7 +742,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
>  
>  	count = res->a2;
>  	if (!count)
> -		goto out_unlock;
> +		goto release_rx;
>  
>  	if (hyp_ffa_version > FFA_VERSION_1_0) {
>  		/* Get the number of partitions deployed in the system */
> @@ -757,10 +758,12 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
>  	copy_sz = partition_sz * count;
>  	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
>  		ffa_to_smccc_res(res, FFA_RET_ABORTED);
> -		goto out_unlock;
> +		goto release_rx;
>  	}
>  
>  	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
> +release_rx:
> +	ffa_rx_release(&_res);

Hmm, the FFA spec is characteristically unclear as to whether or not we
need to release the rx buffer in the case that the flags indicate use of
the rx buffer but the returned partition count is 0.

Sudeep -- do you know what we should be doing in that case?

Will

