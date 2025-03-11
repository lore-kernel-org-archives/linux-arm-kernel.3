Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9984C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0IknKvMtwlAhIOJUFN/hhWpcsxdlwiL2Eoes3ipkS0=; b=ln3YvKqPzcEbMRzq0SaflemhB0
	hAqABefeF3Velj6Pxm7+9O3znyxuMOsyg6ok9xTyPVFAtC9b8UEcYntv6s5fEostJV7hu/Lcg1TEI
	mJGk897RSs+CKzHUDTHAcBEIDXXfL0MQKf1bzMAaUz7D7/g8q+TAUPUYy6dO7JRHjS/NLZTG6SnOw
	QRpT0ZuRsiTSQFEcaYb7wmL8TMr3hnJ0xeqpfwYGPhhRBlqdm6Izdbn7tz4aLwx3H2aF/FYS3N8w1
	ZsLBPed/gxuLa5avzTdbpLMs0nmkF4l5EtdXcJ1/WZx12C6nRTnEaNwKEASo7FVj/oArUqm8kbkie
	/Gd0F8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Ob-00000006dGr-0918;
	Tue, 11 Mar 2025 18:32:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts43o-00000006ZYU-1jah
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 186315C1008;
	Tue, 11 Mar 2025 18:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF88C4CEE9;
	Tue, 11 Mar 2025 18:10:33 +0000 (UTC)
Date: Tue, 11 Mar 2025 18:10:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: arm-kernel@lists.infradead.org, James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/8] KVM: arm64: ptdump: Test PMD_TYPE_MASK for block
 mapping
Message-ID: <Z9B8lyYEtL62ZzVb@arm.com>
References: <20250221044227.1145393-1-anshuman.khandual@arm.com>
 <20250221044227.1145393-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221044227.1145393-2-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111036_497560_27545D36 
X-CRM114-Status: GOOD (  15.45  )
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

On Fri, Feb 21, 2025 at 10:12:20AM +0530, Anshuman Khandual wrote:
> Test given page table entries against PMD_TYPE_SECT on PMD_TYPE_MASK mask
> bits for identifying block mappings in stage 2 page tables.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: James Morse <james.morse@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: kvmarm@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/kvm/ptdump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> index e4a342e903e2..098416d7e5c2 100644
> --- a/arch/arm64/kvm/ptdump.c
> +++ b/arch/arm64/kvm/ptdump.c
> @@ -52,8 +52,8 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
>  		.set	= "AF",
>  		.clear	= "  ",
>  	}, {
> -		.mask	= PTE_TABLE_BIT | PTE_VALID,
> -		.val	= PTE_VALID,
> +		.mask	= PMD_TYPE_MASK,
> +		.val	= PMD_TYPE_SECT,
>  		.set	= "BLK",
>  		.clear	= "   ",
>  	},

Marc, Oliver - are you ok with this patch going in through the arm64
tree?

Thanks.

-- 
Catalin

