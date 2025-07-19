Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9B0C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 04:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JtpAvtaKpyQVahKmCuOvuPcOf5FrIYJe/3k/daAaJAw=; b=uYWeCKA2GXnVOiWIJESnBWZUFv
	zXRujINqhNed1hHHjzCWiuPyWe6a8+yPGqEsxe8EUizhe/JfFCevCdJiyr7Hm5sI6Kf3w0jhwhicE
	JWIshSQjAjxp9tuI56Az8YXkuFDMv/i/CwlETh47g9G9z/MoPmJyexRmG1h4Z7HMYmPrYcPB9DFL3
	OcDllqrVvKEY/n3sEiQCo93XtQoJh5fyjkFmY8oowmsL1H7vdMl1NZiAuFSt1R+g7ddFLoR4QeJYs
	hJFz2mUwZzTvoRglCMDnEd1MV288ljRurdxryJYj0JavXsCPVviP1js5zF2YWFuAvpy6VCikEvqh5
	SfqbwxsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uczN6-0000000Dspm-3Mt9;
	Sat, 19 Jul 2025 04:40:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uczKb-0000000DsNZ-3RzT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 04:37:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0B3A1596;
	Fri, 18 Jul 2025 21:37:43 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 961423F66E;
	Fri, 18 Jul 2025 21:37:49 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	thiago.bauermann@linaro.org,
	broonie@kernel.org,
	yury.khrustalev@arm.com,
	kristina.martsenko@arm.com,
	liaochang1@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v4 0/8] arm64: Enable UPROBES with GCS
Date: Fri, 18 Jul 2025 23:37:32 -0500
Message-ID: <20250719043740.4548-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_213753_909153_0A6F6249 
X-CRM114-Status: UNSURE (   9.87  )
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

Currently uprobes and the Arm Guarded Control Stack (GCS) feature are
exclusive of each other. This restriction needs to be lifted in order
to utilize GCS for generic Linux distro images where the expectation
is that core debugging features like uprobes work.

This series adds some user accessors to read/push/pop the userspace
shadow stack. It then utilizes those functions in the uprobe paths as
needed to synchronize GCS with the changes in control flow at probe
locations.

The KCONFIG restriction is then dropped.

v3->v4: Much delayed v4 rebased to 6.16
	Move existing gcs accessors to gcs.h and then add the new
	     ones. This fixes some of the forward reference issues,
	     the build break and keeps them all together.

v2->v3: Cleanup RET logic to alwaays use LR, and not update IP on aborts
	Correct generic uprobe_warn bug even though we aren't using it

v1->v2:
	Drop uprobe_warn() patch
	Fix copy_thread_gcs() bug created by fixing task_gcs_el0_enabled()
	Comments, now describe issues with reading userspace GCS pages
	Rebased to 6.15

Jeremy Linton (8):
  arm64/gcs: task_gcs_el0_enable() should use passed task
  arm64: probes: Break ret out from bl/blr
  arm64: uaccess: Move existing GCS accessors definitions to gcs.h
  arm64: uaccess: Add additional userspace GCS accessors
  arm64: probes: Add GCS support to bl/blr/ret
  arm64: uprobes: Add GCS support to uretprobes
  arm64: Kconfig: Remove GCS restrictions on UPROBES
  uprobes: uprobe_warn should use passed task

 arch/arm64/Kconfig                       |  1 -
 arch/arm64/include/asm/gcs.h             | 89 +++++++++++++++++++++++-
 arch/arm64/include/asm/uaccess.h         | 40 -----------
 arch/arm64/kernel/probes/decode-insn.c   |  7 +-
 arch/arm64/kernel/probes/simulate-insn.c | 41 +++++++++--
 arch/arm64/kernel/probes/simulate-insn.h |  3 +-
 arch/arm64/kernel/probes/uprobes.c       | 31 +++++++++
 arch/arm64/kernel/process.c              |  6 +-
 kernel/events/uprobes.c                  |  2 +-
 9 files changed, 165 insertions(+), 55 deletions(-)

-- 
2.50.1


