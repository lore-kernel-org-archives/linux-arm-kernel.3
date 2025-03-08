Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D98C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 01:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=knu7wLLxYNa2TBALnHvuKtT02EVqiGYY66iEt0X/SvY=; b=LJSjQgL0I6IKalK0PK8jMqpLeZ
	srlgsRLgsBuoImoPfBVaU02odniyESPNIM9z1lR6nuA3eE3BpYm2Lkt+n9LFUCX368Qcmmn1QKqyB
	8L/luf2oXEhhO5Z0GGzn8NRJvbYPlJhhIEXw/JTWVx1PXyjy512zo+Z2hCeocXB5tg7XnZBZ6gsPa
	c+2rTUFbH64kU0FYR0J2H5BZE/e0MEKyVetCgkPB4qYr+kGcSn9n3GDzu9ug7qx4nofLOaXAQF1oJ
	pfNIvPHJ63Nl6nD/qpn+/mDwPo9VWU3nqCEclTa3YXB5R+FTe93AAOzbYAOtzPL0wd869kkanVsCE
	lLG20WKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqj0P-0000000Fz5V-2kxQ;
	Sat, 08 Mar 2025 01:29:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqiyl-0000000FyqI-2SQF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 01:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4629D5C65D3;
	Sat,  8 Mar 2025 01:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A016AC4CED1;
	Sat,  8 Mar 2025 01:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741397269;
	bh=Hu8IOn0VSbEg4hk9ZqH8VsMwBi+3CebEMND9m2kLPIY=;
	h=From:To:Cc:Subject:Date:From;
	b=Gqm6tWhH6S9RFR12RcKOPUTP3ZFPc9JOf36/KEdJcR6JQ6Q167AXqyDI29y5S+hqb
	 +eh3ymvU7jaoB2hc+Dm/OcDjHVCI3DIZWbjm8rIrugRAjRLcwSayCKKTejCHwoRm5j
	 VOMAxgVEl8DVxD0b+DeG6jd9XjTxlz2Lgi7lsuefM7WoNal3TSSngznoXmb2rgeONp
	 biJBPRZjcZrY/yTqBM5pdY7zpNPmWTUAH7xgkbZA23kK/3+ZSiAZcpVtOcpli8uhkg
	 MlMmJXwB+Mkuv7Y88WpfJVX5X9/ifsLWQ05eERHpjHojLyqwJCn4Ng7Dku2al0Mz3o
	 P1jmx5vTRQovQ==
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
Subject: [PATCH 0/2] arm64: livepatch: Enable livepatch without sframe
Date: Fri,  7 Mar 2025 17:27:40 -0800
Message-ID: <20250308012742.3208215-1-song@kernel.org>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_172751_666695_BDD6E7A9 
X-CRM114-Status: UNSURE (   9.66  )
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

Song Liu (2):
  arm64: Implement arch_stack_walk_reliable
  arm64: Implement HAVE_LIVEPATCH

 arch/arm64/Kconfig                         |  3 ++
 arch/arm64/include/asm/stacktrace/common.h |  1 +
 arch/arm64/include/asm/thread_info.h       |  4 +-
 arch/arm64/kernel/entry-common.c           |  4 ++
 arch/arm64/kernel/stacktrace.c             | 44 +++++++++++++++++++++-
 5 files changed, 54 insertions(+), 2 deletions(-)

--
2.43.5

