Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B74CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CynKzDdTOEhf6qIY8m0R3RAcsN7AysDJ4Yn/0e6qABo=; b=jWCUzBxSItUgLjanLxQn/hv+/H
	fBGhmz1qsD+saxJpF7ouF+kcQaAY/Pbpd9UVeMWII1wPnwxzLP3V6AIggt/p2iBNXc5nmEn1yG+Zt
	rZG+8JKueACguns8syT7wi0F29rqxkoWG2eCOUXOj15UZ1SXqfqJI03GXM+iTZhQKaSIiJT1k8Ceb
	JPD8wJtvRnbDDTaunbFJyor7kvjlomja0tDAFSekMrb7kVMO+/bXLjpPZK9jPh6wSxyTWdUT0pwGF
	Bf5PhjYSWwm9hQJaBJx1iRwVTVIoF0q50KYIJykciklaw1Q0LEyC2ViYDzWBhvswtWCWEdHcejC6a
	BYRiAszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDX5-00000000Gfs-2n1P;
	Tue, 19 May 2026 06:02:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDX4-00000000Gfk-2RAj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 418E360052;
	Tue, 19 May 2026 06:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AC3C2BCB3;
	Tue, 19 May 2026 06:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779170541;
	bh=22gkf18a8yg0K51zlDRHlTrUxxq1tyaqoQ1aURojOp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p0xABhC0+b/gMmHS41oCAyCaMr4Q8ic65LXFQdch2Em4bqB2mWye0pa7rHQtncifD
	 5kEwuJnu7Bw1f4qkiOen91eN437m2ZbtKC5ZSCRdTRRwOSAbFKKE9ZlJZl745QjQut
	 4o6zsp62hCKLieLc0+5b0qJcUxWZeRIB4HVjHyZUOCsjNuY7byW5KXXb2sTUZ3M/ht
	 a41mM4IMvThbC+pJIkzDKT5sTEpCFxPjNE9/EkLONPv0ejXTCcOH5MjfJfdwITzhzE
	 2SSqFLCoGyvr+BbcUGWnvQABVso4Jtr4tmMldgFedmv+xJZ1FrV3dwPBfBFFqpnXpN
	 CA98XskqU7iIw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 10/44] arm64: RMI: Add support for SRO
In-Reply-To: <20260513131757.116630-11-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-11-steven.price@arm.com>
Date: Tue, 19 May 2026 11:32:11 +0530
Message-ID: <yq5a7bp0szrw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Steven Price <steven.price@arm.com> writes:

> +static unsigned long donate_req_to_size(unsigned long donatereq)
> +{
> +	unsigned long unit_size = RMI_DONATE_SIZE(donatereq);
> +
> +	switch (unit_size) {
> +	case 0:
> +		return PAGE_SIZE;
> +	case 1:
> +		return PMD_SIZE;
> +	case 2:
> +		return PUD_SIZE;
> +	case 3:
> +		return P4D_SIZE;
> +	}
> +	unreachable();
> +}
>
> +
> +static void rmi_smccc_invoke(struct arm_smccc_1_2_regs *regs_in,
> +			     struct arm_smccc_1_2_regs *regs_out)
> +{
> +	struct arm_smccc_1_2_regs regs = *regs_in;
> +	unsigned long status;
> +
> +	do {
> +		arm_smccc_1_2_invoke(&regs, regs_out);
> +		status = RMI_RETURN_STATUS(regs_out->a0);
> +	} while (status == RMI_BUSY || status == RMI_BLOCKED);
> +}
> +
> +int free_delegated_page(phys_addr_t phys)
> +{
> +	if (WARN_ON(rmi_undelegate_page(phys))) {
> +		/* Undelegate failed: leak the page */
> +		return -EBUSY;
> +	}
> +
> +	free_page((unsigned long)phys_to_virt(phys));
> +
> +	return 0;
> +}
> +
> +static int rmi_sro_ensure_capacity(struct rmi_sro_state *sro,
> +				   unsigned long count)
> +{
> +	if (WARN_ON_ONCE(sro->addr_count > RMI_MAX_ADDR_LIST))
> +		return -EOVERFLOW;
> +
> +	if (count > RMI_MAX_ADDR_LIST - sro->addr_count)
> +		return -ENOSPC;
> +
> +	return 0;
> +}
> +
> +static int rmi_sro_donate_contig(struct rmi_sro_state *sro,
> +				 unsigned long sro_handle,
> +				 unsigned long donatereq,
> +				 struct arm_smccc_1_2_regs *out_regs,
> +				 gfp_t gfp)
> +{
> +	unsigned long unit_size = RMI_DONATE_SIZE(donatereq);
> +	unsigned long unit_size_bytes = donate_req_to_size(donatereq);
> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
> +	unsigned long state = RMI_DONATE_STATE(donatereq);
> +	unsigned long size = unit_size_bytes * count;
> +	unsigned long addr_range;
>

Looking at above and the related code, I am wondering whether we should
use u64 instead of unsigned long for everything that the specification
defines as 64-bit.

-aneesh

