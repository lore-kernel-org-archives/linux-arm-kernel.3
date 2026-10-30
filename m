Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96230606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e9CVNdJa;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XIVYestp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r6oWs9NRS8dj5BRdE3SOboRlekQH4GrocVOda0uMj/o=; b=e9CVNdJaXT6hPN
	bGMlOVZaA2xJTRJJqNCr4rrGQfjX56nKRBoWvHkfi4hpVko2AwbaowNe4TuvcL5ARFeK3QE0up5vT
	sAw45sFJH9mxmg8sNykQcMXBly73pD6qH2zMqh4wkB+ZCrIXS0yFrcy8qA7NJN4PjEazHr5D9QDDh
	cy2N5lBPS6c7bAisMPPzsGnzCqGKfYxMq7q7xnXoPk6LAVo061yR+gGT2c5z8LMYS55tdV60xeFwP
	T5aYULBv5KIRpWa6UtL2/9C6N6oj4JeZOECnyQTtldB7rL86TMvdnd+OIR+PttO0qdA61HOsBMByi
	F+uC1UlSkKhKQeUupASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkzv-0000000BZpN-1bTU;
	Fri, 30 Oct 2026 11:42:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkzs-0000000BZnr-1AT2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:42:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 203521596;
	Fri, 30 Oct 2026 04:42:07 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B86A03F7B4;
	Fri, 30 Oct 2026 04:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793360530; bh=TryfSyMJmpjHJWemiNgo4MBnrsZct6ejB9ZK29wCuRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XIVYestpCiqkWkpRrm7MMoeveYoA5FIQIuL/wKTNRlmW9R/fz0++XawOSAjqlO8Xy
	 6Oe7eykXf0SSQhKGDWSu4I/x7OTqVZ4S1lauXoLjNrGaFP13bMuZg8DoxKgM6Lw1gH
	 Zhlv37cZ4yULbIomkP4C4YA8e8Zu7yMJb2FV7GWw=
From: Leonardo Bras <leo.bras@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: Fix dirty logging detection in ring-only mode
Date: Fri, 30 Oct 2026 11:42:03 +0000
Message-ID: <auSCioOj63P47PMV@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029175238.3214788-2-weilin.chang@arm.com>
References: <20261029175238.3214788-1-weilin.chang@arm.com> <20261029175238.3214788-2-weilin.chang@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_044212_447676_EEFEE2F4 
X-CRM114-Status: GOOD (  19.45  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 05:52:37PM +0000, Wei-Lin Chang wrote:
> When checking whether a memslot has dirty logging enabled, the
> KVM_MEM_LOG_DIRTY_PAGES flag is the source of truth. Previously in
> memslot_is_logging() we were testing the dirty bitmap only and did not
> consider dirty ring.
> 
> With the ring and no bitmap, a logged memslot can still get block
> mappings, so guest writes to most of a block are never logged and a
> migration can copy stale memory.
> 
> Fix this by using kvm_slot_dirty_track_enabled() instead which checks
> KVM_MEM_LOG_DIRTY_PAGES, within memslot_is_logging().
> 
> Fixes: 9cb1096f8590 ("KVM: arm64: Enable ring-based dirty memory tracking")
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/kvm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 705f6d84770e..c7df646af79f 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -176,7 +176,7 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
>  
>  static bool memslot_is_logging(struct kvm_memory_slot *memslot)
>  {
> -	return memslot->dirty_bitmap && !(memslot->flags & KVM_MEM_READONLY);
> +	return kvm_slot_dirty_track_enabled(memslot) && !(memslot->flags & KVM_MEM_READONLY);
>  }
>  
>  static int pkvm_flush_remote_tlbs(struct kvm *kvm)
> -- 
> 2.43.0
> 

Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Awesome, thanks for taking the suggestion!
Leo

