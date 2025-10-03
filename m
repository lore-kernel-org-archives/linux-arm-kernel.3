Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643A9CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61DBDJbMKe1+3EORcKB24f0U7n8ePLnHufDsIEP/vPM=; b=ojVcd+ce8IcUN/76wkePR75w0x
	LVUn7Z3Upu5KbHeK/gyDuct0iBxNyBW42M12Yl3S6D0/tA0s0BAOUYexyf1PeuyThUEyojd+AA8KY
	jo7DA3u3bMrfIHDbADNhdW/qxGhk8SRlRpro8e0Ws4AX7stjEOX45x9IYu9muV44RtBeGdR0gE/mu
	lRD2CvVMXBOGQH62QltVwNN35iLlMeBjCyKage4h6Pntp6eMmGK6K3Lj/CKjC9SEE8r3cIAn3Brks
	pv19y8T8aSr1v8r8uMIPUQPCBGB2LkHDsB2DG0TeqlyIXuH89We3qn2EE8EpfCKHHYLgYYOJFfJF6
	JR5tnvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jRe-0000000Coox-0zrM;
	Fri, 03 Oct 2025 17:19:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jRc-0000000Coom-2fso
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 17:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F8B661148;
	Fri,  3 Oct 2025 17:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAA0C4CEF9;
	Fri,  3 Oct 2025 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759511986;
	bh=GShFWIQ3nrEgTCifByOJt8FtOhCMkv17vq1x8IjNKfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J1tahpCrkVyBq/hq4ygwhyX+rN5XmYCG4Cbhv+cLxQLg69tPDE6WPSDVuzIQmVSMp
	 hoGIUGLh6WEJOfkk6R+ttsqMvJVgziObApVcSVcWUgHRl9oxThjQwGOB+6c0OjWI+O
	 DCFhnklNSs5V+/dgDZTnQBaF4lSxEVB75wQl1VI3zwzJ/wbrRHVkjm8XyHzP8Ry44Y
	 qpryHZyAFVpp4PyaJ5oJOpMGaRKL7OcKxpMUT7ECI94fFgNY4ZbSioZI8fncQ5Ogff
	 WoccmPaRMF4yS1PMjEBSCY0flx7L3y2ZcXMldsR24TGH+frFPcOIQX71quEIpNG7tt
	 xewrc58DrkrZA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	Gergely Kovacs <Gergely.Kovacs2@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH] arm64: mte: Do not flag the zero page as PG_mte_tagged
Date: Fri,  3 Oct 2025 18:19:38 +0100
Message-Id: <175950165527.786497.14310575132704411238.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250924123528.1536835-1-catalin.marinas@arm.com>
References: <20250924123528.1536835-1-catalin.marinas@arm.com>
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

On Wed, 24 Sep 2025 13:31:22 +0100, Catalin Marinas wrote:
> Commit 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to the
> zero page") attempted to fix ptrace() reading of tags from the zero page
> by marking it as PG_mte_tagged during cpu_enable_mte(). The same commit
> also changed the ptrace() tag access permission check to the VM_MTE vma
> flag while turning the page flag test into a WARN_ON_ONCE().
> 
> Attempting to set the PG_mte_tagged flag early with
> CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled may either hang (after commit
> d77e59a8fccd "arm64: mte: Lock a page for MTE tag initialisation") or
> have the flags cleared later during page_alloc_init_late(). In addition,
> pages_identical() -> memcmp_pages() will reject any comparison with the
> zero page as it is marked as tagged.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: mte: Do not flag the zero page as PG_mte_tagged
      https://git.kernel.org/arm64/c/f620d66af316

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

