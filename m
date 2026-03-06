Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA970F0182F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V8eHScoIgr4hb4P9Tjc+JbZuDDA9jaPNPd2FXC+bNQ=; b=cTd8Yrg5jf9lJ+qCo6jZoR88SK
	z2FvESsz9JBXkSbKco+FqohhicbGBlciU03zDc99xe5Tvr2DLSURPeRsKi+DmjvNRMBhswunY3o0f
	pV8GJAE28rSJAnAAYymKYLMcgcE65Ix1aY69IDGTRE0Z4JAL+qVtEATpKz1z6tNCLKCDpKnIimL0l
	gu2wFVePFxZdBEwy2IvccnBZPe4M/NUzU+pENdxXroK2YENBpRhy7p0mQ+2YYVHSAuVBA2dh0E0I9
	ZVGrlOvRN/C/su0IfGDUEbLIvIi0/cCuWTFz9PyGusgqwhObUb/OhpHrfglqaYbJZOlKFbSU8XPcb
	aelC902g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUGn-00000003dwe-2egW;
	Fri, 06 Mar 2026 12:27:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUGl-00000003dwG-05zn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6981040A85;
	Fri,  6 Mar 2026 12:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF5EC4CEF7;
	Fri,  6 Mar 2026 12:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772800022;
	bh=7Hk7fAZvQF0ye88ruxvV6p3f98XYs2WUnmaeYiPvIvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UqhzYvMQwShy+yX4ebcbqbL3BTg7VeWu+fXcy9+1csqA9F/dXEuQrIdJpJZu+7/L0
	 5TgSSRj+V3KcV7JHs2tslveU3OM/HEYLlNmh+4YUzsoBAh4S6ubp5FHWLY5EUcu9EQ
	 OkVIHTdTid6voTnxnBvJKAlGOAF3Ripzjnz7eDX//RBm/16v4Hna2W4f4iFMguIVUB
	 +9hIYILu+nbENLitc+lrZibMpnr/KTamNWDgb9h8+w/LtfkCWWYWjCazcILWVhZQlq
	 BXBIEmeXIrmRql3AlTl5ui/O85GYlhV2RXy+Jqajab5bro4mwmJz5963mPzfM8Nggo
	 OZZrrPC3nNl1w==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Piotr Jaroszynski <pjaroszynski@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	John Hubbard <jhubbard@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	stable@vger.kernel.org,
	Alistair Popple <apopple@nvidia.com>,
	James Houghton <jthoughton@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2] arm64: contpte: fix set_access_flags() no-op check for SMMU/ATS faults
Date: Fri,  6 Mar 2026 12:26:52 +0000
Message-ID: <177279636044.453548.11482786576662988237.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305-contpte-fault-loop-v2-1-0216f0026d7f@nvidia.com>
References: <20260305-contpte-fault-loop-v2-1-0216f0026d7f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_042703_087583_EC538FAE 
X-CRM114-Status: UNSURE (   8.48  )
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

On Thu, 05 Mar 2026 15:26:29 -0800, Piotr Jaroszynski wrote:
> contpte_ptep_set_access_flags() compared the gathered ptep_get() value
> against the requested entry to detect no-ops. ptep_get() ORs AF/dirty
> from all sub-PTEs in the CONT block, so a dirty sibling can make the
> target appear already-dirty. When the gathered value matches entry, the
> function returns 0 even though the target sub-PTE still has PTE_RDONLY
> set in hardware.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: contpte: fix set_access_flags() no-op check for SMMU/ATS faults
      https://git.kernel.org/arm64/c/97c5550b7631

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

