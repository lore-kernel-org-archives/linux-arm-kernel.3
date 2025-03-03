Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024DBC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 21:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VL2PoiSGgr0ZBIyYB1keoFRM15/brjcTmISS7bEwIkY=; b=o1PBMC0zgWYhZLnVnPJihfP8ZO
	o0o+mfMxA9nAcLQByGqSCAjLplJuk4tZ2xNcMi2Re2Ha4Tf4LZPs0uaeaUliYSYrPxd4wZ/l74+Nl
	QgG6ZWfREZTdi3coiIAXYwLmLjWuaSms7+7WPTgHVeMaU3V+bM8nNk/IL96i7UlhIVv9fewD8xuXb
	hmeca2NLhQ8RkX78R3lyLQZHDYzQUNU62bC/Lsn07fbYr/4pF2k+LH3p01Yo5Pqp90w3jiHXbzamG
	AbceaAg7XENdEKG/bETJd0bunK+txkBXwOXNiGbdGGH3g+fY0dNDcOhM6KsMVGF9ufA4OPsgdxVBV
	0UluOkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDEf-00000002MKK-41NV;
	Mon, 03 Mar 2025 21:22:01 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDBa-00000002Luj-2eWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 21:18:52 +0000
Date: Mon, 3 Mar 2025 13:18:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741036725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VL2PoiSGgr0ZBIyYB1keoFRM15/brjcTmISS7bEwIkY=;
	b=xB0QWNwIYrNkYhnY9l2eJb2tbiISVRGAHbCv8MZtR1mqso28BlvjRvjLdf0VZ3Wd3or/S0
	bnzxMb0fE9H7rtuhqY2yMBAAuczCsqYRBfd3fHXztq9COm+M0AS9fTJyrMg8N3r5/7QpDP
	vlmCQHNQF2zlEojXjEWVqP0o473JIbo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Count pKVM stage-2 usage in secondary
 pagetable stats
Message-ID: <Z8Ycq3d7O8_3fozk@linux.dev>
References: <20250228121355.1377891-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228121355.1377891-1-vdonnefort@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_131851_377844_0407FFA5 
X-CRM114-Status: GOOD (  11.04  )
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

On Fri, Feb 28, 2025 at 12:13:55PM +0000, Vincent Donnefort wrote:
> Count the pages used by pKVM for the guest stage-2 in memory stats under
> secondary pagetable stats, similarly to what the VHE mode does.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1f55b0c7b11d..c2e022c41313 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1088,12 +1088,18 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>  
>  static void hyp_mc_free_fn(void *addr, void *unused)
>  {
> +	kvm_account_pgtable_pages(addr, -1);
>  	free_page((unsigned long)addr);
>  }

Don't we drain more than just stage-2 page tables into the teardown_mc
(e.g. vcpu structs)?

Thanks,
Oliver

