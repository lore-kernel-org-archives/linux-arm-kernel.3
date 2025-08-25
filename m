Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EBDCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 03:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n96rv7FbspMakWNcAX9ygnTiA2nT1+AtYHVreb0WWdU=; b=tNCLSAsULxmp0116/2GAs/3yfb
	GUizvkos0F1k7N+bn7BSmcZoIUM9TK0xKi0rJA8I4YphcIyz+98x5p5JUx0W2wGwqwqot7H1v1S77
	GviTeXanhepUFkeFQ7XP/oFnMEqJG+R0R/bJ9di4rCRrxvPj1i2RzUOKowSN1xpQKNfFj/Nj4d7Mg
	UgWBHKqqCn5V2LW8JMFGnpSVAHX+rxBXM3R2xaLHPzHtMpayu5hcWt3qBe5ewFGfrkjdDuVg0FiUx
	kHE8dPPVo6/2gUUTdwP/A49LaTeVs/1O0hRTAnA//ZQcdqkCnlyuD+G4b3rp7ykwoqmlfPhaMMdc+
	IfLo9YIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqO24-00000006pLv-2M51;
	Mon, 25 Aug 2025 03:38:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNya-00000006ofb-2tue
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 03:34:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1E4915A1;
	Sun, 24 Aug 2025 20:34:19 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C52223F63F;
	Sun, 24 Aug 2025 20:34:26 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
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
Subject: [PATCH v7 0/7] arm64: Enable UPROBES with GCS
Date: Sun, 24 Aug 2025 22:34:14 -0500
Message-ID: <20250825033421.463669-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_203432_781218_1FCA40FF 
X-CRM114-Status: GOOD (  10.11  )
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

v6->v7: Minor comment changes per review
	Add additional review-by's

v5->v6: Add additional review-by's
	Post the version with the complete function rename that
	     builds with/without GCS (patch 3)
	Drank my coffee before posting this time.

v4->v5: Fix ret xn handing
	Renames, comment tweaks, formatting, per review comments
	rebase 6.17, drop first patch
	Add reviewed-by's

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

Jeremy Linton (7):
  arm64: probes: Break ret out from bl/blr
  arm64: uaccess: Move existing GCS accessors definitions to gcs.h
  arm64: uaccess: Add additional userspace GCS accessors
  arm64: probes: Add GCS support to bl/blr/ret
  arm64: uprobes: Add GCS support to uretprobes
  arm64: Kconfig: Remove GCS restrictions on UPROBES
  uprobes: uprobe_warn should use passed task

 arch/arm64/Kconfig                       |  1 -
 arch/arm64/include/asm/gcs.h             | 91 +++++++++++++++++++++++-
 arch/arm64/include/asm/uaccess.h         | 40 -----------
 arch/arm64/kernel/probes/decode-insn.c   |  7 +-
 arch/arm64/kernel/probes/simulate-insn.c | 50 ++++++++++---
 arch/arm64/kernel/probes/simulate-insn.h |  3 +-
 arch/arm64/kernel/probes/uprobes.c       | 33 +++++++++
 kernel/events/uprobes.c                  |  2 +-
 8 files changed, 172 insertions(+), 55 deletions(-)

-- 
2.50.1


