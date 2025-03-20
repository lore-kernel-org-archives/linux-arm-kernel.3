Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F00C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pvaJ1auGFPaDXaYxmgMdX982S3BxLOGcqco5n2XSO0k=; b=VKQPyIdCMYjXBwmyxcciHTSqLV
	kVKmd9+fXK896nx2ygfLhcZ1CqyDNnzwofyy0p6oEY2CwR/2MFXMkUhBfbd3h5I84ryYYDtJFUuyB
	YpXmxf1DZIDMnLvo+cNrIERPusl5ZbVQ1jo+XQ3guwv8p3ByVyM/oZt4ItlMjAFZHixOjr7jT7rCZ
	RsALpJaw5GM8m40skWeON6sqcNXRRpsCyEsM/hMb2NR7zCfepgm/5gxjRWMFbh4KzCy+0vrgsLGkL
	U6i7upAqdY9XYJmFO+fD8SynchOVE2XS+sDnG1cMoEarCLsDipOnbRusPKF99L1+Y2qlzEvZy8w3f
	F/lzT5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJbJ-0000000Cn6W-0y02;
	Thu, 20 Mar 2025 17:22:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJV3-0000000Cm9s-0Ban
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:16:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF60AA495C1;
	Thu, 20 Mar 2025 17:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CC3C4CEDD;
	Thu, 20 Mar 2025 17:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742490967;
	bh=RBXQglLrnsSCMUyUpcMctHHkbTvdcAUfxAPc3DDrCJA=;
	h=From:To:Cc:Subject:Date:From;
	b=TSJL1HWgOfQfnUivOeHQa0IadphqPzG8l6kOjkYDivl9hUxvFwc9n11YuzBC2/Rot
	 vGhbLAFF8awTO3tTsDDOM0x+AXePTUnUmd67FGZPAESypwiA7Zg5+1vqDe70RGi8cw
	 aBmvWiVsFWvNwLcP/fQLCXepYPQ+9HMnlBSw4RbatMHY6/fykB5gOw36o/lK0olLI1
	 nN3EUjLZyfCu2PzXZ09Ra9MoQiIhLCJpXfh3kXGPS47NQ6FDxfV4ZAFUo6QsHjPVKu
	 XRHAg7AWj0NxTin5K5vyqcwEzeRz1txEa87lJ9mNtWZGWVkQXO1QcZHIJtXoK5u0n5
	 vlzz9Zv6Uw2xA==
From: Song Liu <song@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org,
	live-patching@vger.kernel.org
Cc: indu.bhagat@oracle.com,
	puranjay@kernel.org,
	wnliu@google.com,
	irogers@google.com,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	roman.gushchin@linux.dev,
	rostedt@goodmis.org,
	will@kernel.org,
	kernel-team@meta.com,
	song@kernel.org
Subject: [PATCH v3 0/2] arm64: livepatch: Enable livepatch without sframe
Date: Thu, 20 Mar 2025 10:15:57 -0700
Message-ID: <20250320171559.3423224-1-song@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_101609_144572_B5DCFADD 
X-CRM114-Status: GOOD (  10.38  )
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

There are recent efforts to enable livepatch for arm64, with sframe [1] or
without sframe [2]. This set tries to enable livepatch without sframe. Some
of the code, however, are from [1].

Although the sframe implementation is more promising in longer term, it
suffers from the following issues:

  1. sframe is not yet supported in llvm;
  2. There is still bug in binutil [3], so that we cannot yet use sframe
     with gcc;
  3. sframe unwinder hasn't been fully verified in the kernel.

On the other hand, arm64 processors have become more and more important in
the data center world. Therefore, it is getting critical to support
livepatching of arm64 kernels.

With recent change in arm64 unwinder [4], it is possible to reliably
livepatch arm64 kernels without sframe. This is because we do not need
arch_stack_walk_reliable() to get reliable stack trace in all scenarios.
Instead, we only need arch_stack_walk_reliable() to detect when the
stack trace is not reliable, then the livepatch logic can retry the patch
transition at a later time.

Given the increasing need of livepatching, and relatively long time before
sframe is fully ready (for both gcc and clang), we would like to enable
livepatch without sframe.

Thanks!

[1] https://lore.kernel.org/live-patching/20250127213310.2496133-1-wnliu@google.com/
[2] https://lore.kernel.org/live-patching/20250129232936.1795412-1-song@kernel.org/
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=32589
[4] https://lore.kernel.org/linux-arm-kernel/20241017092538.1859841-1-mark.rutland@arm.com/

Changes v2 => v3:
1. Remove a redundant check for -ENOENT. (Josh Poimboeuf)
2. Add Tested-by and Acked-by on v1. (I forgot to add them in v2.)

v2: https://lore.kernel.org/live-patching/20250319213707.1784775-1-song@kernel.org/

Changes v1 => v2:

1. Rework arch_stack_walk_reliable().

v1: https://lore.kernel.org/live-patching/20250308012742.3208215-1-song@kernel.org/

Song Liu (2):
  arm64: Implement arch_stack_walk_reliable
  arm64: Implement HAVE_LIVEPATCH

 arch/arm64/Kconfig                   |  3 ++
 arch/arm64/include/asm/thread_info.h |  4 +-
 arch/arm64/kernel/entry-common.c     |  4 ++
 arch/arm64/kernel/stacktrace.c       | 66 +++++++++++++++++++++-------
 4 files changed, 60 insertions(+), 17 deletions(-)

--
2.47.1

