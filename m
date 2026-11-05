Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A410606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vDfMKT6V;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=s/eDR5GH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=65Yh0STFpLyAg9Zs0iCagOebJs1u9d/lfGQNo4tHSio=; b=vDfMKT6ViFbOc6
	h24jWdYRUcYYFBiaV2bholkvvFjjOHU5T7y24p3hrGEfpswpXVE/ATSGGZ4s5zPSZsMZ4YPLDkMFf
	XSvG5CDP2ppCodfzMeEeJXbOX5ei/ZahfDFsdae/BqlYHJBaYGPYmq5UZ5uYiNpvqujhnoPtZwo7N
	Qq0VxaqPtHDpF2SaxvoqjInr5OnjZXoARIVVkPRAIiNthQph383LL+xL1LF4bsdLxSpfU6eQC04Ls
	utTFpx0jh/zlhZlTZKIMx/DCFClm1QOCzfXQH5OQOuNQ6p0nfM14PFuUUC1unprsXPemAyVZqxs/e
	Aab6tPf+Hjgyr8uEGR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvK1-00000008Zr2-26my;
	Thu, 05 Nov 2026 11:07:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJh-00000008ZWI-2WUu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:07:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B14B219F6;
	Thu,  5 Nov 2026 03:07:30 -0800 (PST)
Received: from [10.0.128.216] (Suzukis-MBP.cambridge.arm.com [10.0.128.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61A953F628;
	Thu,  5 Nov 2026 03:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793876853; bh=6vL6Hj9BVQ3Cd5slOfB844llVYPZr5KiY8zuKWjv6CI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s/eDR5GH2EXKtUZQxWAIJW0pNTIUzYp1nwESLI3Tbh7DdCBi4I4IXSZvUtxiDpHtM
	 ZGwUJUZFSBQoxl9MZlfPr8BVYx7mrcMKBXJdsCFU77HxR9VXOFwKaAl8AWi+SsCHOf
	 MgFNETUGvNpRq3F/Q/xKTPxo5wCGzvCY0tGRTWCY=
Message-ID: <d496e730-dea3-4772-bfe9-5e51e67d170b@arm.com>
Date: Thu, 5 Nov 2026 11:07:29 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] KVM: arm64: Resume stage-2 teardown where the walk
 stopped
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Raghavendra Rao Ananta <rananta@google.com>,
 Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
 <20261104124451.2148724-2-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261104124451.2148724-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030738_026865_30B1B102 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04/11/2026 12:44, Fuad Tabba wrote:
> Since commit 4ddfab5436b6 ("KVM: arm64: Reschedule as needed when
> destroying the stage-2 page-tables"), kvm_stage2_destroy() walks the
> IPA space one block-sized chunk at a time. The walker steps over an
> invalid entry in one go, but the next walk starts at the following
> chunk, so an invalid entry larger than a chunk is visited once for every
> chunk it covers. Destroying a VM with a 52-bit IPA then takes 2^27 walks
> with 16K pages (2^22 with 4K), however little it maps.
> 
> Have kvm_pgtable_stage2_destroy_range() return the address its walk
> reached, which kvm_pgtable_walk() doesn't expose, and resume from there.
> pkvm_pgtable_stage2_destroy_range() returns the end of its range, and
> EL2's kvm_pgtable_stage2_destroy() ignores the value.
> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>


Thanks Fuad for this, looks good to me with Oliver's suggestion.

Cheers
Suzuki


