Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A327C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lQcYnQ8lyEg5i0WjxaggcLhe0z/oRuCGvtrOa9xu+bc=; b=U9JXUHGrAG8PcdpnegVazr6tPN
	fwWYuKvL8B1HhQcj2dKquy1c+uUUkSdpzsx9TuOtnb9xZH4KY/B2fdJlqb0paj85PMmMVBFdPxL4Q
	AmTAG3t0XKOFfGaV94EZir0qKCYDnVFwy4K9bjQKgkFbZB1wZWMngZCATysaBVE4XhbsVrNlxsYqr
	FeE7eaXJJO/AQ6HUqwLLXRL7xIleXE/TBdO4TDB44zdLNx+AYQ6XPABb1UJ4jU1ZJeq2OqwMljg2k
	hxHZMmIfp9unfJQYQAEkyNAIdyGKCCGFAnvGioce9xtuvAoPMc5hPOzrZwR25YZBGZTX3IC1vlbel
	qKlHQpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8bT-0000000FSDj-481y;
	Tue, 07 Jul 2026 16:24:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8bR-0000000FSD2-1SPv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:24:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 437611AC1;
	Tue,  7 Jul 2026 09:24:49 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B4993F7B4;
	Tue,  7 Jul 2026 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783441493; bh=4P+3DkTskZ3SzXU8iwjdxVJpzAtgfoTwLqWoTi3eE2U=;
	h=From:To:Cc:Subject:Date:From;
	b=dS0uGEhQ58lZgaVSPETIXnBUAtVxZrpxk2nuSmg/fMRWDKapv6Uxesuer9B+RrCNg
	 IvWnnwTJirTQm+lLC6hOpOE9hWnVFy5oINBvy9TSs5Te6xo6ovuFJHHM8XOdBp1YDc
	 1JYRMyN25dZUmvKqElQzK+vZgndStmHd9l20lD+o=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jic23@kernel.org,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com
Subject: [PATCH v5 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
Date: Tue,  7 Jul 2026 17:24:35 +0100
Message-ID: <20260707162440.12132-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_092457_430219_B84C6EC8 
X-CRM114-Status: UNSURE (   8.71  )
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

Version 5 of this series addresses a few review comments but is pretty
similar to v4. The precursors in x86/cache have been merged so there is no
longer a need for this to go through there. It's likely easiest if this
goes through arm64.

This series adds support for memory bandwidth monitoring. Counter assignment
will be used for all platforms with memory bandwidth monitors rather than just
those with insufficient counters as originally proposed.

rfc v1: https://lore.kernel.org/lkml/20260225205436.3571756-1-ben.horgan@arm.com/
rfc v2: https://lore.kernel.org/lkml/20260319165540.381410-1-ben.horgan@arm.com/
v3: https://lore.kernel.org/linux-arm-kernel/20260511154147.557481-1-ben.horgan@arm.com/
v4: https://lore.kernel.org/lkml/20260520212458.1797221-1-ben.horgan@arm.com/

The code can be found at:
https://gitlab.arm.com/linux-arm/linux-bh.git mpam_abmc_v5

Ben Horgan (2):
  arm_mpam: resctrl: Pre-allocate assignable monitors
  arm64: mpam: Add memory bandwidth usage (MBWU) documentation

James Morse (3):
  arm_mpam: resctrl: Pick classes for use as MBM counters
  arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
  arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
    resctrl_arch_reset_cntr()

 Documentation/arch/arm64/mpam.rst |  22 +++
 drivers/resctrl/mpam_internal.h   |   6 +-
 drivers/resctrl/mpam_resctrl.c    | 318 +++++++++++++++++++++++++++---
 3 files changed, 323 insertions(+), 23 deletions(-)

-- 
2.43.0


