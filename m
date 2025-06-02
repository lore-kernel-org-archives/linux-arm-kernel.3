Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8836DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeCptTjPKh8QeRV4pdJDx4/jefk8Ts/mxlP4WhX90Is=; b=kkaGl9jg6F8XtaAxGUaiYB6FIJ
	xziCsd+1xGnvFYBECHw1+r2ANF7XKxLIxiY+x2QxbFP225SAmOCcXYLTnAB4Ioa1E0UIjm2TTzsgL
	DExxwcxvDMLpMxNjvUF4t0BUncKDVEfDGwAcLeNb0WX63afVSfHGqigQlV5ls9lNR3BUhEoF4lz1w
	gsHNqkjqeZJyQJ4xzAJljB2N1u4Ep0p6WdToPgHtHbXhSpv6Op8rcQ+rzlxyWRpi89ZLVjrE+bwe0
	LnX1XxMvLKfbc1Nqa3yBQyOFKzWvTQ19BX3kHgAZPcc2H0EQDqiGEJW76bkozDC+lOJ/I/2FUvI37
	CIrDZ7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5Uu-00000007VaK-1M4j;
	Mon, 02 Jun 2025 13:46:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5Qa-00000007Uuc-3sgM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 13:42:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D0F243B68;
	Mon,  2 Jun 2025 13:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BD9C4CEF0;
	Mon,  2 Jun 2025 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748871732;
	bh=9dG7tW+nx7BmDUM0spYhtFYg3g+1VMEPVP91RDY7/ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hWRAEI7zwHb2ZnqIQ7Gv7GEIlc9q9iw8PRkMqLnpoF7/EW5Y5mcZpWwSBehG1ro7O
	 V68FvNs5AuiQu0W+YJMIHgm5OIXN0Q9HRuwXHl0jieeFyS3S/+ffsGPXnbDjf8OlH0
	 K6rJKiuQuO03eeVcXsMoPcXs7JhJ9vo/A1zgT4mOifep1MesQfW3K4v2Gr4AiGDE42
	 G+r6jAWiqmuUqnEnG4ZgmEetSPk4wzQ6JXkpFUVkfauYp4MRKkb4SAfPXqCL4wV/UJ
	 QLeE6x3PJE2LTOFcHQchfiUaR/YtlJxDB7diYHO6uaTpemfQaXXuB9ulHZlIQfqhJg
	 ogTfCg5FR+Ixg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	llvm@linux.lists.dev,
	nathan@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: Work around convergence issue with LLD linker
Date: Mon,  2 Jun 2025 14:42:03 +0100
Message-Id: <174886520058.2940056.14049740503782976267.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250531123005.3866382-2-ardb+git@google.com>
References: <20250531123005.3866382-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_064212_982958_5521F7EE 
X-CRM114-Status: GOOD (  11.00  )
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

On Sat, 31 May 2025 14:30:05 +0200, Ard Biesheuvel wrote:
> LLD will occasionally error out with a '__init_end does not converge'
> error if INIT_IDMAP_DIR_SIZE is defined in terms of _end, as this
> results in a circular dependency.
> 
> Counter this by dimensioning the initial IDMAP page tables based on a
> new boundary marker 'kimage_limit', and define it such that its value
> should not change as a result of the initdata segment being pushed over
> a 64k segment boundary due to changes in INIT_IDMAP_DIR_SIZE, provided
> that its value doesn't change by more than 2M between linker passes.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: Work around convergence issue with LLD linker
      https://git.kernel.org/arm64/c/dc0a08394804

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

