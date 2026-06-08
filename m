Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876A6CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3HUUjAWNlRLISd9RyC9ozklEAbUjkeKAdJvPJfHQfA=; b=RKkzL7VvkW6EtFxd0/icVASlVW
	9WxSZR4ciqWZrs3nEDdByT3a373lamJahNqVds4oiTmQ0YmpT4sOSuZcRAtUwJrirNME7nXKtl94r
	W5G20bvXyXS8CkKQEgIwBmGePhVrv84kxvhemyC/LuLKV6Cg3jOH9oxaARbSP4aKScm3oGCSuaPSx
	FZkyBVnQlcK15SzpTUDDRnBDPbd9JuXCLSPwUMsotTNnI+IJVTPfPLkMD2Lr7KpFi+r8sLV6hbV4U
	m29sUvBHmV3kTPkRhaajiJ0Er7lcuTAy59vUQmX3EqlLiDc393+u3yMFk8FOH3KTzy/flt2M46BMx
	IvebkGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbop-00000003x3c-0MIT;
	Mon, 08 Jun 2026 15:23:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbon-00000003x3H-05Tq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 15:23:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E50321BF3;
	Mon,  8 Jun 2026 08:23:04 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B5713F86F;
	Mon,  8 Jun 2026 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780932189; bh=U1QnQ8FNiiJRG5/VviIte+UekKuf/B5wCMRztBquyPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jHAcC9N/vOvn59nMvvqwoenkkcnDUrGPzUeSKiRxTczMxoZGZ4LPRzy4sRP6mrK2A
	 y0Xja/AGpGl0iBvGgDBhIeSeUI46dVszHRenwY4R41VmPuuDN/C9Ps40fA1gcFOhrv
	 OQHauRT+9IRJiV9DuCoXEiQKXaR+brjzZL/ZLbe4=
From: Leonardo Bras <leo.bras@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Remove superfluous aligning of gfn for dirty logging
Date: Mon,  8 Jun 2026 16:23:05 +0100
Message-ID: <aibeWQY48zEsjqOt@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605153248.2412064-3-weilin.chang@arm.com>
References: <20260605153248.2412064-1-weilin.chang@arm.com> <20260605153248.2412064-3-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_082313_160482_642A010D 
X-CRM114-Status: GOOD (  19.83  )
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

On Fri, Jun 05, 2026 at 04:32:48PM +0100, Wei-Lin Chang wrote:
> Stage-2 mapping size is forced to PAGE_SIZE when dirty logging is
> enabled for a memslot, therefore we don't need to align it down to
> a possibly larger vma size or THP adjusted size, they won't happen.
> 

IIRC there was some effort being made in terms of tracking in LEVEL2 block 
granularity instead of LEVEL3 (PAGE_SIZE). It makes sense as some platforms 
can have very fast networking so setup time is more relevant than actual 
sending time.

Would not making this change affect such effort?

Thanks!
Leo


> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  arch/arm64/kvm/mmu.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 06c46124d3e7..d1f6ff7c2943 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2050,13 +2050,12 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  
>  	/*
>  	 * Mark the page dirty only if the fault is handled successfully,
> -	 * making sure we adjust the canonical IPA if the mapping size has
> -	 * been updated (via a THP upgrade, for example).
> +	 * mapping size is forced to PAGE_SIZE if dirty logging is enabled,
> +	 * so we don't have to adjust the canonical IPA here.
>  	 */
>  	if (writable && !ret) {
> -		phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
> -		ipa &= ~(mapping_size - 1);
> -		mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
> +		gfn_t canonical_gfn = get_canonical_gfn(s2fd, s2vi);
> +		mark_page_dirty_in_slot(kvm, s2fd->memslot, canonical_gfn);
>  	}
>  
>  	if (ret != -EAGAIN)
> -- 
> 2.43.0
> 

