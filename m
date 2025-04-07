Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ABAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 17:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cp8UO9pOPIEmLwNOQK36z2oJFXixrdcvGimuc4r5OxQ=; b=BBMeoMCUdGZb1NdLh5cLCUXkud
	QsMeevW0DRRmPUIAPoaJR2xVTm+a2uxEpIv366UcWjuiRiwy8gB3o2sr7N2HbNfStSltdE/ObUPPe
	phIZum+SJeYcMlI77vmd1SSl4Uw4b0X66BpUJAjQKF40wsqNvFEXuBAt0+B40yDekARdttryNYefk
	a//X4ebYL2riAG1qDeo0qeyp74/o+Dju0Vgd1/CS3qJf3aRf5Gq5l2+Y1DQ+/k1u1IanQXuVus2z1
	NrsVFPQ1ADCEhpg9O7stbwsM8ao1TSnsr9e6kZAwbmX5vGKH/1uYhHNQoKsHlLtO2ME5N+aUxM5I4
	mazWXjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pvX-00000001K3a-2Qi9;
	Mon, 07 Apr 2025 17:06:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pCj-0000000197n-2MVC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:20:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C208106F;
	Mon,  7 Apr 2025 09:20:08 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF1D53F694;
	Mon,  7 Apr 2025 09:20:06 -0700 (PDT)
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
Subject: [PATCH v2 0/6] arm64: Enable UPROBES with GCS
Date: Mon,  7 Apr 2025 11:19:45 -0500
Message-ID: <20250407161951.560865-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_092009_652524_6CD5AD14 
X-CRM114-Status: UNSURE (   9.37  )
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

Along the way we fix a bug in the core gcs task handling and export
some uprobe quality of life functionality for use in arch specific code.

The KCONFIG restriction is then dropped.

v1->v2:
	Drop uprobe_warn() patch
	Fix copy_thread_gcs() bug created by fixing task_gcs_el0_enabled()
	Comments, now describe issues with reading userspace GCS pages
	Rebased to 6.15

Jeremy Linton (6):
  arm64/gcs: task_gcs_el0_enable() should use passed task
  arm64: probes: Break ret out from bl/blr
  arm64: uaccess: Add additional userspace GCS accessors
  arm64: probes: Add GCS support to bl/blr/ret
  arm64: uprobes: Add GCS support to uretprobes
  arm64: Kconfig: Remove GCS restrictions on UPROBES

 arch/arm64/Kconfig                       |  1 -
 arch/arm64/include/asm/gcs.h             |  2 +-
 arch/arm64/include/asm/uaccess.h         | 42 ++++++++++++++++++++++++
 arch/arm64/kernel/probes/decode-insn.c   |  7 ++--
 arch/arm64/kernel/probes/simulate-insn.c | 38 ++++++++++++++++++---
 arch/arm64/kernel/probes/simulate-insn.h |  3 +-
 arch/arm64/kernel/probes/uprobes.c       | 30 +++++++++++++++++
 arch/arm64/kernel/process.c              |  6 ++--
 8 files changed, 115 insertions(+), 14 deletions(-)

-- 
2.49.0


