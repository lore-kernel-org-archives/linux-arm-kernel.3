Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBBBC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1xwY1Q1SquwuisAiQpebInsPnJhBL9Z8uV9FjMJwZs=; b=m97WGEIxIqF1bZh4W6mi6IUAHA
	/oZmqtjQl63taYjgTZ6KWrrXENM5qpJ8FMeJKFJmD6Kd+6kow6DlES1iBw170Tyes/ApucpPx+WoQ
	NP8ilUQt2io6V0qHd3V+xzUUE9Jjr8Y7jv8DfrGrlh6Q8Ci0iX4sa2pYt1aGQaXnje72mdmFo+SRY
	wJEDemkfDMEmaLjRdW5yqTbkIFxC11TTs5+N9vdDl6MI83Una0s/5Bxe8Uc0eOBZLMz718xu4IlLD
	D0UvWxP8Z8UrJUg7u0Bun1HZsq0qt8THvXxJAsh1P5bmX1ETGwg2CtzBxR6eakf2apwptSzUXRr+H
	t0yp8ZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdmw-00000004w1U-2aK0;
	Tue, 15 Jul 2025 11:25:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdeL-00000004v57-44Kq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:16:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D8FA12FC;
	Tue, 15 Jul 2025 04:16:32 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3AFC3F66E;
	Tue, 15 Jul 2025 04:16:39 -0700 (PDT)
Date: Tue, 15 Jul 2025 12:16:07 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: Revisiting c0a454b9044f
Message-ID: <aHY4d46ehF-j_pbw@J2N7QTR9R3>
References: <20250714195205.GA3723043@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714195205.GA3723043@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_041642_048366_0118E712 
X-CRM114-Status: GOOD (  18.25  )
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

On Mon, Jul 14, 2025 at 12:52:05PM -0700, Nathan Chancellor wrote:
> Hi all,

Hi Nethan,

> I am looking to potentially bump the minimum version of LLVM for
> building the kernel to 15.0.0 after the next merge window. In my quest
> to look for workarounds that can be dropped, I noticed that
> CONFIG_ARM64_BTI_KERNEL was disabled unconditionally for GCC in commit
> c0a454b9044f ("arm64/bti: Disable in kernel BTI when cross section
> thunks are broken") as a result of [1]. Looking at that GCC report, it
> seems like the AArch64 ABI now documents [2] the GNU toolchain's
> behavior as expected 

For context, at the time of commit c0a454b9044f, GNU LD did not handle
this appropriately, leading to runtime BTI failures where two sections
were too far apart.

GNU LD was subsequently fixed, and the ABI documentation was updated,
but I'm not sure which specific versions of GNU LD have the fix, and we
hadn't chased that up to re-enable BTI with GCC.

> and LLVM has been adjusted [3][4][5] to match. Do I need to block
> CONFIG_ARM64_BTI_KERNEL from being selected with LLVM 21.0.0?

I'm missing something; why would we need to dsiable BTI in that case?

The concern from the kernel side is simply whether we get unexpected BTI
failures. IIUC so long as compiler and linker agree we should be good,
and we simply need to forbid broken combinations.

> Or should the kernel adjust its expectations now that the ABI and
> toolchains all agree?

Yes, we can probably rework this.

IIUC we'd need to forbid BTI with:

* GCC + old GNU LD
* GCC + old LLD
* new clang + old GNU LD
* new clang + old LLD

... and can enable BTI otherwise.

Does that make sense to you?

Mark.
 
> Cheers,
> Nathan
> 
> [1]: https://gcc.gnu.org/pr106671
> [2]: https://github.com/ARM-software/abi-aa/commit/606ce44fe4d3419c15cd9ed598f18fb5d520fcfc
> [3]: https://github.com/llvm/llvm-project/commit/7af2b51e761f49974a64c3009882239cea618f2a
> [4]: https://github.com/llvm/llvm-project/commit/edf21314c98a4fe05d48f83dfab2b201ed8bfe9c
> [5]: https://github.com/llvm/llvm-project/commit/098b0d18add97dea94e16006486b2fded65e228d

