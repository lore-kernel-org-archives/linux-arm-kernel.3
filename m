Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F1DC35FF8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 20:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UAEZys5wOPUk2jbwZot4PTd5CxE8viW8h6Oq3fXiwbI=; b=oLAh2VkONlNwN2mqR4jPGYdkTQ
	j+yoRunWdge1tMs1e6mUQnRpwNyXDJ6s/FcclLkDpLjVtP0AQWoXd/KRG6RORvZlhx5z6dB3b6fCf
	01eochD4ecbn9coFFKmaruNMaCQonBbtldrB32aIKkvdTZaPRnybRLxJOV6RvsFFM1iYkBkErKyco
	1JkEecsf+MfZmQ6J2GMQG8sPsX4+3UJbHCE6cXDLebbxMGGPCllvyUMB85Yj2msMUp/A8Es+jmX6C
	JjR7+CxVkvSx594z2h/zaABkq8jD367jWuc7XsoCiAor6D0taQzBaazZxbm9F1xfba5sovUejIqFl
	9QiTdx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tudua-000000073gu-00l9;
	Tue, 18 Mar 2025 20:51:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tudrq-000000073AZ-1o79
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 20:48:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E7DF13D5;
	Tue, 18 Mar 2025 13:48:59 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97D0A3F694;
	Tue, 18 Mar 2025 13:48:50 -0700 (PDT)
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
Subject: [PATCH 0/7] arm64: Enable UPROBES with GCS
Date: Tue, 18 Mar 2025 15:48:34 -0500
Message-ID: <20250318204841.373116-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_134854_513489_735DCF1F 
X-CRM114-Status: GOOD (  10.47  )
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

Jeremy Linton (7):
  arm64/gcs: task_gcs_el0_enable() should use passed task
  arm64: probes: Break ret out from bl/blr
  arm64: uaccess: Add additional userspace GCS accessors
  arm64: probes: Add GCS support to bl/blr/ret
  arm64: uprobes: Add GCS support to uretprobes
  uprobes: Allow the use of uprobe_warn() in arch code
  arm64: Kconfig: Remove GCS restrictions on UPROBES

 arch/arm64/Kconfig                       |  1 -
 arch/arm64/include/asm/gcs.h             |  2 +-
 arch/arm64/include/asm/uaccess.h         | 42 ++++++++++++++++++++++++
 arch/arm64/kernel/probes/decode-insn.c   |  7 ++--
 arch/arm64/kernel/probes/simulate-insn.c | 42 +++++++++++++++++++++---
 arch/arm64/kernel/probes/simulate-insn.h |  3 +-
 arch/arm64/kernel/probes/uprobes.c       | 34 +++++++++++++++++++
 include/linux/uprobes.h                  |  1 +
 kernel/events/uprobes.c                  |  2 +-
 9 files changed, 122 insertions(+), 12 deletions(-)

-- 
2.48.1


