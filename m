Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D601C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 23:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vPxXYTUhw0LxJegZOdaH0V/tWdS8rYpM0fqjupPPZww=; b=4K3dsbd/M3qzEm4KCbMIjYgAnS
	nM8YX/nKL4KYh3vxj2D5tivIcDORd7/fxGq521GbIMP5RrzWajBNI3WGKR5sDDrjnvrb//7ITR0Xt
	VPjFN/8RBfmQOzKkb4GeR1gKjIHWvNGIyF1R24RP7ClD3ZBA7OU12GQx1H8vhQIKNf0C3+oXGAskX
	3D993LHWjiMEbs5Ix1FzsEuqOpffQUVjdr9puzWHRqlnm/tlEWkOxeTd293bhTjm+z8SP/80DWJ48
	u7lL9K9YC9s0lEOnBGp+yIRicPQ/WWZq3UL+5AomKjhCMdQnKRYHJz6fUOz5PKlId/4XTM2h/9QPP
	6oMIVTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBiqg-0000000686N-3Nn9;
	Sun, 04 May 2025 23:34:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBiok-000000067gH-10IO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 23:32:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76B0B1007;
	Sun,  4 May 2025 16:32:05 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28F6B3F58B;
	Sun,  4 May 2025 16:32:14 -0700 (PDT)
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
Subject: [PATCH v3 0/7]  arm64: Enable UPROBES with GCS
Date: Sun,  4 May 2025 18:31:56 -0500
Message-ID: <20250504233203.616587-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_163218_324019_6F002EE4 
X-CRM114-Status: UNSURE (   9.19  )
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
shadow stack. It then utilizes those functions in the uprobe paths
as needed to synchronize GCS with the changes in control flow at
probe locations. 

The KCONFIG restriction is then dropped.

v2->v3: Cleanup RET logic to alwaays use LR, and not update IP if GCS aborts
	Correct generic uprobe_warn bug even though we aren't using it

v1->v2:
	Drop uprobe_warn() patch
	Fix copy_thread_gcs() bug created by fixing task_gcs_el0_enabled()
	Comments, now describe issues with reading userspace GCS pages
	Rebased to 6.15

Jeremy Linton (7):
  arm64/gcs: task_gcs_el0_enable() should use passed task
  arm64: probes: Break ret out from bl/blr
  arm64: uaccess: Add additional userspace GCS accessors
  arm64: probes: Add GCS support to bl/blr/ret
  arm64: uprobes: Add GCS support to uretprobes
  arm64: Kconfig: Remove GCS restrictions on UPROBES
  uprobes: uprobe_warn should use passed task

 arch/arm64/Kconfig                       |  1 -
 arch/arm64/include/asm/gcs.h             |  2 +-
 arch/arm64/include/asm/uaccess.h         | 42 ++++++++++++++++++++++++
 arch/arm64/kernel/probes/decode-insn.c   |  7 ++--
 arch/arm64/kernel/probes/simulate-insn.c | 41 ++++++++++++++++++++---
 arch/arm64/kernel/probes/simulate-insn.h |  3 +-
 arch/arm64/kernel/probes/uprobes.c       | 30 +++++++++++++++++
 arch/arm64/kernel/process.c              |  6 ++--
 kernel/events/uprobes.c                  |  2 +-
 9 files changed, 119 insertions(+), 15 deletions(-)

-- 
2.49.0


