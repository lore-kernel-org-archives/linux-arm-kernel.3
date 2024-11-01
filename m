Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADC2E6F06F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BilCBdj0cz9tn0eKLbfA0prIwNcqfAvYUVFpB7V50Ic=; b=schUSu2lMMIKfaKsaHxqJGz2Ul
	plVmchLeKP1sbZRgyCJaFPeOOOxXYZTXgQewQKqktY6WIoBjuBSZLc7zW7H4K5TgvRrCCkWzBa5wf
	CoMQ+52MQXXfSGcBALIAybRtC4vkXPU+LxP00E0Q7+95TennpMPBFs+wF+hShal5thdfiD2yESZw+
	KbU0DV4ilCwFQyxzoHfdJ7dxS9QfSlXWAM9pAe7ejiHfKacUMewWSZMTvpliY7B0gyV3PBVpeGAIx
	E+mSgYdmo5IvE7hjkyfe/FWSqldVUj//VunNAH4X9AqZoKiAVndaR7ETjfS3NBCMcRn6giFTi3rRV
	jDqVFu2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vaS-00000007rRo-14tV;
	Fri, 01 Nov 2024 17:37:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vYk-00000007rBc-2KYH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:35:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28195A43101;
	Fri,  1 Nov 2024 17:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5A4C4CED2;
	Fri,  1 Nov 2024 17:35:39 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Re-organize arch_make_huge_pte()
Date: Fri,  1 Nov 2024 17:35:37 +0000
Message-Id: <173048223682.1108539.16990086073905192650.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029044529.2624785-1-anshuman.khandual@arm.com>
References: <20241029044529.2624785-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_103542_703282_B3DE4B9C 
X-CRM114-Status: GOOD (  12.60  )
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

On Tue, 29 Oct 2024 10:15:29 +0530, Anshuman Khandual wrote:
> Core HugeTLB defines a fallback definition for arch_make_huge_pte(), which
> calls platform provided pte_mkhuge(). But if any platform already provides
> an override for arch_make_huge_pte(), then it does not need to provide the
> helper pte_mkhuge().
> 
> arm64 override for arch_make_huge_pte() calls pte_mkhuge() internally, thus
> creating an impression, that both of these callbacks are being used in core
> HugeTLB and hence required to be defined. This drops off pte_mkhuge() which
> was never required to begin with as there could not be any section mappings
> at the PTE level. Re-organize arch_make_huge_pte() based on requested page
> size and create the entry for the applicable page table level as needed. It
> also removes a redundancy of clearing PTE_TABLE_BIT bit followed by setting
> both PTE_TABLE_BIT and PTE_VALID bits (via PTE_TYPE_MASK) in the pte, while
> creating CONT_PTE_SIZE size entries.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Re-organize arch_make_huge_pte()
      https://git.kernel.org/arm64/c/f8192813dcbe

I think we can now get pte_mkcont() to only set PTE_CONT without
touching PTE_TYPE_PAGE. Previously it wasn't possible because
pte_mkhuge() was clearing the PTE_TABLE_BIT and we added it back via
pte_mkcont(). Give it a try and send an additional patch cleaning up
pte_mkcont() if this works. Thanks.

-- 
Catalin


