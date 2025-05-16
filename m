Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE44DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL6/StVhGMDxhgjk58MXzmY3ir7C4W0JcCVQ1MkroLs=; b=2O6ku6uGhVJSiWqXbufkw2lYDs
	O2dgKBQll+kUadXX0324ohZmIJcO20H9my2hhnJoO5SgrnQy+A6U6K4AZBWrTU8ILKpBwzuCJD625
	fHL3s4WF9lpiDLo8+6Mr8xq35FifButpbFP6iH4Vo5EQXGJRNcufp5dSodbI8sDH0oncQycTUVsax
	WBfRNiZfcfeI+oAFVvTK55K3F9Ltl0dilpcJSRDLoC3NX9cz0JaQERaI1zHuf4nJhny8KBQOfkE5+
	K6fKLyV+51DJXKGHJGLQy9rTPFjBMGcCWaWH972M3CIn9T9Q+zq7bW3z6ufXSG2JdASIfVD1Gzftc
	d5b8qEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxW5-00000003xUL-31QC;
	Fri, 16 May 2025 16:02:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx8H-00000003sbv-2Zxd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:38:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0FE8A4E8FA;
	Fri, 16 May 2025 15:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED770C4CEED;
	Fri, 16 May 2025 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747409876;
	bh=GPLWfIxhxeI+gEoZlD4EGy1WAmfKbNh7zDOUf73kHr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tWrjbSntMZnHCoWWroihESxoAMFpKMGUBnZ83YpMR9MpmhslxLmHGbnWQZtZiJFC9
	 jBHieqIOARhil/WWM7HWsh4XkVNku68fvwCaV2R4WnBsBlPED4nrXW0a1/ON6KX7N+
	 zhM3dGZM2heN6iMrTpSPH7eeZvLOsN7mcT9CuNeC2IToG2nonNuuWHXrvaa2lCJfD1
	 HsvIk75tfo617e3YeKrOAX78f0r9SkLhSNque1A78cvth+h7p7hJtUEMoD2M9pkftC
	 2tbDRyqOZQ6wMLPTOiFBZLt7w37A0icH5f6ZfOcQjMd5D7Eai6N/d88CNyVzmuw6Zv
	 BfxWTghSNUGOA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH v2 0/3] arm64/boot: Forbid the use of BSS symbols in startup code
Date: Fri, 16 May 2025 16:37:44 +0100
Message-Id: <174740792413.188921.9613065517341295309.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250508114328.2460610-5-ardb+git@google.com>
References: <20250508114328.2460610-5-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_083757_726597_983557BB 
X-CRM114-Status: UNSURE (   9.52  )
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

On Thu, 08 May 2025 13:43:29 +0200, Ard Biesheuvel wrote:
> Move any variables accessed or assigned by the startup code out of BSS,
> and into .data, so that we can forbid the use of BSS variables
> altogether, by ASSERT()'ing in the linker script that each symbol made
> available to the startup code lives before __bss_start in the linker
> map.
> 
> Changes since v1:
> - fix build error due to missing declaration in #1
> - work around Clang complaining about the ASSERT() expression in the
>   linker script
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/3] arm64/boot: Move init_pgdir[] and init_idmap_pgdir[] into __pi_ namespace
      https://git.kernel.org/arm64/c/93d0d6f8a654
[2/3] arm64/boot: Move global CPU override variables out of BSS
      https://git.kernel.org/arm64/c/4afff6cc9a55
[3/3] arm64/boot: Disallow BSS exports to startup code
      https://git.kernel.org/arm64/c/90530521079e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

