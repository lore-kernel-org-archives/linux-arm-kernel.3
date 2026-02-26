Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A86FD45F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrnUE/q3gmIeG62aFUpdQBCy20Syja9ZUr7UR4BHMf8=; b=YXsxM76CQSmWd1YCBTM0zu4GCg
	sj/oWi0br3MOdl+c1fOqDtLCOonR3JT7C8RjJeDs1S61ebJMGJbmd08Hk+ow3fBjRP/rbt3gEnC8S
	IejA34vzR1OgQUrZ9iUlNaqN1fP01O7sATbW3UajFWlBYteLB9OP0Gh4XoqbJnjfZ6Jarp3D3THLW
	/GTC877BvVuKml9kFSg39k1q1ILqt5Qu/SY2ii5dgMSC0ufVp+Lklrg+Fem9nD7SY2jhfnmTrDCz7
	Ay2FZPKoaygHkjY0GGvfKynWUnW4ZwcBYVEdLGiy//VHQQn9J9XsprNFQ1VMZjac2s+94SnNpQ6No
	jlh9FZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOuN-0000000572h-3amS;
	Thu, 26 Feb 2026 00:07:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOuI-0000000571M-05xt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 00:07:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47558423BC;
	Thu, 26 Feb 2026 00:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B43C116D0;
	Thu, 26 Feb 2026 00:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772064425;
	bh=N3Cop8RfISGBcWnYfdQgblW5PrfexzCID4NKmeU3VCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jgQIDNczrtOsSUge+BFmYejGuqxmWoaXbLmhCbqd0b9p6OPtHFPifhAbFcDT7hSPr
	 ZbZ+0utZ4b3XUJe9odt01qoq5bUX+MjOKy6j2VMfHP6OnMBimqIVFuxWSWG++04BWB
	 PLeBCE0YPtALSJM8aWey7nlZBIQcV8aD1FUWIOHrSRi80oD3nXHWK04Ho+71zyDmZ9
	 /CDPOhEkVqz3gNjSVhG5l7f4D+OuAgn8+hrPP8aVCxuXh9wQ4rnmF5jZjZQYJqdjnA
	 7viPFOK8xeOAb8369Ez9bfi90/6BkhU0urL/+Hz/Px8EJXozp/d5cIDDiPYhKbfWk7
	 zL1ftQyZQnsRQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	maz@kernel.org,
	oupton@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH 0/2] arm64: tlb: Optimize ARM64_WORKAROUND_REPEAT_TLBI
Date: Thu, 26 Feb 2026 00:06:53 +0000
Message-ID: <177205546547.3273745.12672625453901856925.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218164348.2022831-1-mark.rutland@arm.com>
References: <20260218164348.2022831-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_160706_078702_E3791D39 
X-CRM114-Status: UNSURE (   8.25  )
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

On Wed, 18 Feb 2026 16:43:46 +0000, Mark Rutland wrote:
> Some Arm partners have complained that the overhead of
> ARM64_WORKAROUND_REPEAT_TLBI is too large, and despite the relevant
> errata being categorized as "rare", they still want to use the
> workaround in some deployments.
> 
> For historical reasons, the current workaround is far stronger (and
> consequently far more expensive) than necessary. In part, the SDENs had
> somewhat misleading descriptions, which have recently been clarified:
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: tlb: Allow XZR argument to TLBI ops
      https://git.kernel.org/arm64/c/bfd9c931d19a
[2/2] arm64: tlb: Optimize ARM64_WORKAROUND_REPEAT_TLBI
      https://git.kernel.org/arm64/c/a8f78680ee6b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

