Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D60BC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 18:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5SzxXp4jBT7/OeH4DFHg26xpNJKDCR5LJbs0+ynniM=; b=q6OGxuhXBqmzX4GbqmmjmKoSMC
	zWA1iHgkNQXqp27lssDl1T7pRjVGSakAnNwKUhoSCcX7jNUXriZFh5VQirgfRpVmlqYDfHelb9t6e
	80ZPdaSseQKrb6esir5WTCe1As46z+kNGrw7yMf3gSYsiBR19/q4pDZsUIg518rqMIRxHZq8JPAft
	Uw4qJoBjOs+/lnEj+2yA4D9tHIYnfNtO3hlVYf+qwM8YgQIgYxSlnJPI0F5izXRPU22qkQ1SjEPV4
	htvp3RQYAID1DmAEQKh+dsvqyoKiTroV9pm2cWA8PbPINjmvHFumeb9ETQVXFJggyoWQ0705UDV2C
	OnKJSxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc735-00000008Pmx-2dHv;
	Wed, 16 Jul 2025 18:40:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6q6-00000008Og4-2sqC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 18:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D19643795;
	Wed, 16 Jul 2025 18:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81527C4CEE7;
	Wed, 16 Jul 2025 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752690405;
	bh=KCI9QZcVDuWjy5ZVOPOAx/ruTJtXCpvCzpUcKn/zFn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vE9bJK12jxgkmSRjxrH+s62/zfMpgYGxtAyUdvlCfD0bBa79XJOL7Z7bhSAmi46D9
	 fZqA4YmEBaadiNbLrO0dFfrIQaTa0nayvL1YERrxD0nuiSir4qq0lE890MRtJ7wM4M
	 9brwHv0uli5xR/UR3PLv0G4a1fcKvJ75iDfsGa75ur3+cnPZ8JeBMB5odFgJeAZZrG
	 9pFblBkAlZkpEZ3lBURTowzuq03ebP9L0O40aw4AHgazK/mfc4K9yyleJw3daI1vEx
	 kb6dIZxxGlTtY2RBdSWKeV14LzcGIaZ9cl6LzHx8QSFwmo8ytp2o4rOJaRjCp3Ff1C
	 OTp5d0YO1DM1g==
Date: Wed, 16 Jul 2025 12:26:41 -0600
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: Revisiting c0a454b9044f
Message-ID: <20250716182641.GA2746700@ax162>
References: <20250714195205.GA3723043@ax162>
 <aHY4d46ehF-j_pbw@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHY4d46ehF-j_pbw@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_112646_767894_68C7DEA1 
X-CRM114-Status: GOOD (  28.81  )
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

On Tue, Jul 15, 2025 at 12:16:07PM +0100, Mark Rutland wrote:
> On Mon, Jul 14, 2025 at 12:52:05PM -0700, Nathan Chancellor wrote:
> > I am looking to potentially bump the minimum version of LLVM for
> > building the kernel to 15.0.0 after the next merge window. In my quest
> > to look for workarounds that can be dropped, I noticed that
> > CONFIG_ARM64_BTI_KERNEL was disabled unconditionally for GCC in commit
> > c0a454b9044f ("arm64/bti: Disable in kernel BTI when cross section
> > thunks are broken") as a result of [1]. Looking at that GCC report, it
> > seems like the AArch64 ABI now documents [2] the GNU toolchain's
> > behavior as expected 
> 
> For context, at the time of commit c0a454b9044f, GNU LD did not handle
> this appropriately, leading to runtime BTI failures where two sections
> were too far apart.
> 
> GNU LD was subsequently fixed, and the ABI documentation was updated,
> but I'm not sure which specific versions of GNU LD have the fix, and we
> hadn't chased that up to re-enable BTI with GCC.

Based on https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671#c7 and
https://sourceware.org/bugzilla/show_bug.cgi?id=30076, it sounds like
binutils 2.41 would be the first fixed version.

> > and LLVM has been adjusted [3][4][5] to match. Do I need to block
> > CONFIG_ARM64_BTI_KERNEL from being selected with LLVM 21.0.0?
> 
> I'm missing something; why would we need to dsiable BTI in that case?

Nope, you are not missing anything, I missed the correlation between the
compiler and linker.

> The concern from the kernel side is simply whether we get unexpected BTI
> failures. IIUC so long as compiler and linker agree we should be good,
> and we simply need to forbid broken combinations.

Mark Brown did mention something about the module loader as well so I
was not sure if that was relevant here.

> > Or should the kernel adjust its expectations now that the ABI and
> > toolchains all agree?
> 
> Yes, we can probably rework this.
> 
> IIUC we'd need to forbid BTI with:
> 
> * GCC + old GNU LD
> * GCC + old LLD
> * new clang + old GNU LD
> * new clang + old LLD
> 
> ... and can enable BTI otherwise.
> 
> Does that make sense to you?

So something like this if I understand correctly?

Cheers,
Nathan

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 393d71124f5d..fe523f9f2d61 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2097,7 +2097,11 @@ config ARM64_BTI_KERNEL
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
 	depends on !CC_IS_GCC || GCC_VERSION >= 100100
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
-	depends on !CC_IS_GCC
+	# https://sourceware.org/bugzilla/show_bug.cgi?id=30076
+	depends on !CC_IS_GCC || LD_VERSION >= 24100 || LLD_VERSION >= 210000
+	# https://github.com/llvm/llvm-project/commit/7af2b51e761f49974a64c3009882239cea618f2a
+	# https://github.com/llvm/llvm-project/commit/098b0d18add97dea94e16006486b2fded65e228d
+	depends on !CC_IS_CLANG || CLANG_VERSION < 210000 || (CLANG_VERSION >= 210000 && (LD_VERSION >= 24100 || LLD_VERSION >= 210000))
 	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
 	help
 	  Build the kernel with Branch Target Identification annotations

