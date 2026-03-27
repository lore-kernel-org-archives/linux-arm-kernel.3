Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA74E10F2869
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UB8QOT85HN4CqCM2wXl/iRa5geYsytFXEqwuM5zbFc8=; b=xxWdLEDaF0VocCGElD0nOU3Hxf
	D5eWYqcEMlx7cWn2DkYOFFgSFvQqpaN5/dcFfSUGRxA71N6vlCktSRPL+a6jNUYCjf/jsD7t1ZRem
	SrYpAJIvb9/kTmw7nnSkWGWbPFSCbx0IMG3TdLCSq29lu22tsBkmW8sccLfETQ1LmiJpdPdkQ8V5K
	mGVkCeWiPjJ+ZVqiT5IHbv2TxDdny7BsKFfsw/fGlk/2PpZRQ0MhBQWu8b2wkXtWI0cIf9784Olvf
	N7y3GAcsTMIsbSjd1U+oTm7ggmPjm+acMntt0yWS7YqKVozTVD6snCuDp+1V/bzalTYPUCNQDF6QQ
	JIVNSIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CjZ-000000085d0-2Irg;
	Fri, 27 Mar 2026 19:20:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CjX-000000085cU-0APQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:20:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 763B63D64;
	Fri, 27 Mar 2026 12:20:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F9023F99C;
	Fri, 27 Mar 2026 12:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774639237; bh=pgd264vHItCz+8HKmURdPzTDMcEbMwsjqx6znfulYR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7yDXUUF3NY9AOFm5HMuWmHqrUt5k2gYeuhkdm32MDk3V0RHCeL0MlNbSG5QdsTIe
	 KgTqJ+y6twH8Di37UoHtcFzkLDLAkfHeHBarfZKG8TzZ2eiSb90xbdY57ISBpfhoj8
	 +oDnzCIetfUpLrLtc2rfw45w/NMtaAQg1y2BGk/0=
Date: Fri, 27 Mar 2026 19:20:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH V2 0/2] arm64/mm: Drop TTBR_CNP_BIT and TTBR_ASID_MASK
Message-ID: <177463910135.2669909.9878459656482435980.b4-ty@arm.com>
References: <20260302064437.2791034-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302064437.2791034-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_122039_118554_6CF1FB5E 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

On Mon, 02 Mar 2026 06:44:35 +0000, Anshuman Khandual wrote:
> Directly use existing tools sysreg format field macros TTBRx_EL1_CNP_BIT/
> TTBRx_EL1_ASID_MASK, while also dropping off now redundant custom macros
> TTBR_CNP_BIT and TTBR_ASID_MASK. With this change in place, there are no
> more TTBR_EL1 register based custom macros left in the tree.
> 
> This was discussed and suggested earlier.
> 
> [...]

Applied to arm64 (for-next/ttbr-macros-cleanup), thanks!

[1/2] arm64/mm: Directly use TTBRx_EL1_ASID_MASK
      (no commit info)
[2/2] arm64/mm: Directly use TTBRx_EL1_CnP
      (no commit info)

-- 
Catalin

