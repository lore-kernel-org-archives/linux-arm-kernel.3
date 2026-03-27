Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080E710ED66E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erbc+7wqiHQWqC6LCA4hldZjC/aLPIKKlaItjZs75Co=; b=od48ftD9H1v4WDrcU66QUsgt2o
	+FMEQS8UYyQaILPAWABKUleyggjTpXc5VpP55s9BObD6jdStfke29eOdBZn4IQjWwkwYFKibMO0k4
	nnJGXZm5Ocs669e4cq2CPYNLCDZLoxu3JIViAwNpWlvc/nX17ZA0A+1yjBxB8a7AecTAPTQ5SNMrq
	OCsAROE4FAJ0jhc3zacZ3p5hVhanmUD96ODXdL5dXBoU6P94aRfUeYhjJXkw9A6tGhcu/94Umhtbq
	5Cvshfe9yBvqoe6f8XZzjhkxN6RRX7UPKySdK6FrYm+6AUr6P5u4Za1+mWChGi1J0Avo+S20nmRku
	PVEYeiDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66hp-00000007NFG-0yI9;
	Fri, 27 Mar 2026 12:54:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66hm-00000007NEr-0s5x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 12:54:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 196C93598;
	Fri, 27 Mar 2026 05:54:18 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B37123F905;
	Fri, 27 Mar 2026 05:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774616064; bh=4wFV09HCGNJDcNbBfqcQt9+lev0SQ766LP+kRXTAfSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CPDOjJqsqV4dCTj/BcsPtKxOdW6swwadwUugaYxjsINWwlq/qGIUJvpnq7PrK5AkQ
	 EDSYX84WmmgoTWLXwsVN4HcnBwO9bdkpBTU6P8Z8PZ7P/dPbPjf2DPrip1jdmy+zJX
	 6LvBxgxrKzIvsNKCh/vIG48Z32CAvzqenEy2hnd4=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH v1] arm64: mm: __ptep_set_access_flags must hint correct TTL
Date: Fri, 27 Mar 2026 12:54:11 +0000
Message-ID: <177461605188.2270962.16280793835697429472.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323163918.2028109-1-ryan.roberts@arm.com>
References: <20260323163918.2028109-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_055426_378305_3703161B 
X-CRM114-Status: GOOD (  10.56  )
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

On Mon, 23 Mar 2026 16:39:16 +0000, Ryan Roberts wrote:
> It has been reported that since commit 752a0d1d483e9 ("arm64: mm:
> Provide level hint for flush_tlb_page()"), the arm64
> check_hugetlb_options selftest has been locking up while running "Check
> child hugetlb memory with private mapping, sync error mode and mmap
> memory".
> 
> This is due to hugetlb (and THP) helpers casting their PMD/PUD entries
> to PTE and calling __ptep_set_access_flags(), which issues a
> __flush_tlb_page(). Now that this is hinted for level 3, in this case,
> the TLB entry does not get evicted and we end up in a spurious fault
> loop.
> 
> [...]

Applied to arm64 (for-next/tlbflush), thanks!

[1/1] arm64: mm: __ptep_set_access_flags must hint correct TTL
      https://git.kernel.org/arm64/c/b7d9d2e3a8ab

