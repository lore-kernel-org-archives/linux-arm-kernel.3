Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C76CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjgkLRncbK1H6pqJh4QjzFtPlK5zMlruY50vHLD4dSY=; b=F+EewsUXF8M9a7veo6bNpvFI4W
	mllxx8jMR90UWEe87H4pr4M0Lztm9wpX311xbgeDDj2JTueh6jWIXFK2cndt2cTzfGmOQz4V9IscU
	+VEaChUfBiyE/2IaorZITcmWSZL3di2z4eDbVp3x3W7YjHGvYRcFNxvcBzdlKK7aXHobWJ9t7T8q3
	3zfjA06eITn4YyU8K/r4wptDZ44Jzw0F2Kvsujnk3XA9GORT/VvFq3Wsz1TvXxJimryo07T8t5bCX
	2rlP3JgMFQySC1qssTU1vwJiY2JpVX6unu4PDRNpPgUnNPboa1gGlQgDY6Wpwi00hC0doUM8yjjRM
	MaHzBtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzSH-00000005nJT-3S0V;
	Tue, 11 Mar 2025 13:15:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzQc-00000005mwG-3c3f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 13:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EF0BA44D68;
	Tue, 11 Mar 2025 13:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0536C4CEEC;
	Tue, 11 Mar 2025 13:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741698829;
	bh=W5TW3ItKe0zCXjEoHNcQyGj1KCK/QSQc7spLlCVjgow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQrtOQMYMPMYlS/buZhQKhd0yPkZTs6SrqVzwdmGj4OUORYyFjIwCtSkrmyNRkxaU
	 hwTij4rzs46Ky1AOTB8HpRT2IG/XT7zsP/KijrhWYiRhHQ93n+jSnglTaRa93MPQEW
	 G/Qf5R2NSma/6n+KVhg0dt3fRdBTCUw2kubMbukoUaL4cUixdk0itiwLmVzWs3VVC0
	 S0qyqOhcGAN4haUtooV0AcirdKVCHJRI4FtYz3jj/ny+jfq6b9B0FJpU+fbNnaC2mL
	 oHXR8OKBUdbo/KWOKbg7E1N0EFLcYDw1ik86bkNGCLXLSDUqgSEQK8m8uQLVpmyQT2
	 8ns50s61k3GAA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Piotr Jaroszynski <pjaroszynski@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alistair Popple <apopple@nvidia.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	SeongJae Park <sj@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	iommu@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] [arm64/tlb] Fix mmu notifiers for range-based invalidates
Date: Tue, 11 Mar 2025 13:13:36 +0000
Message-Id: <174169306404.278141.17801949874773526998.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250304085127.2238030-1-pjaroszynski@nvidia.com>
References: <20250304085127.2238030-1-pjaroszynski@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_061350_960693_ABF39FE0 
X-CRM114-Status: UNSURE (   9.89  )
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

On Tue, 04 Mar 2025 00:51:27 -0800, Piotr Jaroszynski wrote:
> Update the __flush_tlb_range_op macro not to modify its parameters as
> these are unexepcted semantics. In practice, this fixes the call to
> mmu_notifier_arch_invalidate_secondary_tlbs() in
> __flush_tlb_range_nosync() to use the correct range instead of an empty
> range with start=end. The empty range was (un)lucky as it results in
> taking the invalidate-all path that doesn't cause correctness issues,
> but can certainly result in suboptimal perf.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] Fix mmu notifiers for range-based invalidates
      https://git.kernel.org/arm64/c/f7edb07ad7c6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

