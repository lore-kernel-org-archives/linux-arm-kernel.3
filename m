Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01A3CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hx63cUOg3zFFPG39gRrWZkayhE967HNwocDD6W1CSws=; b=f7SOGfsYZDYvzoC5ITJFK69HFL
	RsdIWRtGaAPZ75M2REhOULfdkmO5+BNXQM3083X+HdyBV5yUj+4ClUFUg0Mc4NeX2ryjH9X8Sn4eX
	9QoBGjNvyDre9LPbGqZytXi64pWDxxpDHJXLFaGjnbGnhg9QC58vxmeTQ5wC2CGl6px4+VlKQD1VH
	7p5PvXYxDfnERKJ4yQI5GK1nonxs77uTUJ29vmMJjFViUfHRmEsBDCrWTWYUY4ywjAEOZcpu1B+gN
	hbL4+QyJWRfSgXwgz+oZbTnmGZwOmMUQFSfgi8VBdL06uQRSD8yW+MTM8B5e+rDL1B9pMf+pEsh7z
	B9UQewZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nx6-0000000Aemo-39nX;
	Thu, 25 Sep 2025 15:32:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nx5-0000000Aelz-23Ng
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DDA4960ABF;
	Thu, 25 Sep 2025 15:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CD9C4CEF0;
	Thu, 25 Sep 2025 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758814330;
	bh=cFkCFmu4D09Ng3fzdOMuwdXQRxFSrA6RQpXW6yMLdiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wg88FYtnhP+LfoaGZxAKVUGwSoFWx2DNxG+6R24xTuJUV+1QQWBF/gFlIW1C/lkh2
	 4RM1Qf53NyG95RzQ2piqGU1COv4x/UTlPULEVMJ6tAopkBBfFHjC8VjhpLCxB/cnMB
	 48RR+yHMyuORzF/R6kEZfhNO/itr/qoBRw2vinln/2CxNEgBwH15HtCdd44H2NveyT
	 vo7GUsObVM39LBAHZU+ETL82yNcyEwQ8pieF3IV3CI+hvGiDNn4cWWvSkisNiC31nJ
	 V/mIVbtikKGTd0UEbXh0KOjfHlYVFj+x3Z8BKGLo70q40vv5SfmhjQEb+EIu5F2fgd
	 g34i0xATJ63Aw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH v2] arm64: mm: Move KPTI helpers to mmu.c
Date: Thu, 25 Sep 2025 16:32:01 +0100
Message-Id: <175880703970.3419388.13372770098169657486.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912073908.404924-1-kevin.brodsky@arm.com>
References: <20250912073908.404924-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 12 Sep 2025 08:39:08 +0100, Kevin Brodsky wrote:
> create_kpti_ng_temp_pgd() is currently defined (as an alias) in
> mmu.c without matching declaration in a header; instead cpufeature.c
> makes its own declaration. This is clearly not pretty, and as commit
> ceca927c86e6 ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
> function signature") showed, it also makes it very easy for the
> prototypes to go out of sync.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

Please check that I resolved the conflicts correctly...

[1/1] arm64: mm: Move KPTI helpers to mmu.c
      https://git.kernel.org/arm64/c/200b0d25084d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

