Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6282C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4x16Vtgn;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lU/tWOyV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MXzFIbuDJ84A/5AW07Mg/XHQWGN8y0TeHvaMsntxdaA=; b=4x16Vtgnx+6v4o
	V10pKsqhMHdUMgmDgSIPh6JELDfo44Skhzi70REcXiAIcBc9ME4Gi697eRXoxr8p73SGO10HuCS0h
	kW9EuelX1fnaSUf+rrqju/lla9zi2cDe5eLkD7HQa/uw/1lts6u+9wPRuqBjvVvSaP/r9Wh5MOqs1
	RsDQ39kOkuS5Jjkg00PF57e095Q08nHZ42o086xFu5tpmS7vZo2R+lRPxSw14JejAN/vvqLguqwvI
	sGKnw6bcfJwvkPTm/ZRomr8L7bH0r01X42FPwq6p4Tb6cbAPqYsmcxCmyJ96eka3tkcQFYj8uDeuT
	auh0H98F10+wtEL0zacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl87-0000000BbES-1tri;
	Fri, 30 Oct 2026 11:50:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl84-0000000BbDw-27S0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:50:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4022C1682;
	Fri, 30 Oct 2026 04:50:35 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05E583F7B4;
	Fri, 30 Oct 2026 04:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793361038; bh=RP5O8+TrrNiChKav5OBQ0e3c5WvNX6Y1zOlCAMRl860=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lU/tWOyVHaLrUngFuy01LnUghNCRymm8KuQDWfUt+bNjrVmcqHWMPOLOE+tEjEf4y
	 F1eH9vtlZ+aNfreW0na2a03e7PObmDRiHq1zOHTZbRn1xxIdQVHK3A5ve29GXFTI2w
	 hexk5/pmFi5m0iP0md3LhC6nGY+3Qn84Ujtw+J0s=
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
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Remove stale remark on canonical IPA alignment
Date: Fri, 30 Oct 2026 11:50:33 +0000
Message-ID: <auSEiTmuLcPmG7Gs@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029175238.3214788-3-weilin.chang@arm.com>
References: <20261029175238.3214788-1-weilin.chang@arm.com> <20261029175238.3214788-3-weilin.chang@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_045040_612713_2100E05E 
X-CRM114-Status: GOOD (  20.65  )
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

On Thu, Oct 29, 2026 at 05:52:38PM +0000, Wei-Lin Chang wrote:
> Commit 3b8ce2b5132ae ("KVM: arm64: Use a variable for the canonical IPA
> in kvm_s2_fault_map()") created a variable to store the canonical IPA,
> instead of calculating it when needed. It moved the aligning just before
> mark_page_dirty_in_slot() to an earlier place but did not update the
> comment.
> 
> Remove the stale part of the comment.
> 
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  arch/arm64/kvm/mmu.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index c7df646af79f..695c6229a216 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2232,11 +2232,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  	kvm_fault_unlock(kvm);
>  	kfree(mapping);
>  
> -	/*
> -	 * Mark the page dirty only if the fault is handled successfully,
> -	 * making sure we adjust the canonical IPA if the mapping size has
> -	 * been updated (via a THP upgrade, for example).
> -	 */
> +	/* Mark the page dirty only if the fault is handled successfully. */
>  	if (writable && !ret)
>  		mark_page_dirty_in_slot(kvm, s2fd->memslot,
>  					gpa_to_gfn(canonical_ipa));
> -- 
> 2.43.0
> 

Reviewed-by: Leonardo Bras <leo.bras@arm.com>

