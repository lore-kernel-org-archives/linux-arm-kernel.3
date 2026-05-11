Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFF3CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZyNVSOySI1gHk/c4KPMZ7BfG0sSOsQCTLlCMWlIPC8k=; b=Rhu00VETObkQOmgkbVLvtZ6kvv
	eVICymCfZZ5qWWQsJfPeHjZ1bcdvTSRUsUfpa1AreIwQoKQDNnbPFhIKR4Ff3prtVLWaG1Ys9Y+XF
	SXTW6q0m1q3gTnNvzt5EqNAdHoAFhDRSK5HJXrZUC+hAqR32kloRglULTn34XUdXNxq6tLsmStusN
	Q7WsoipM+pbRGHrXSdeVUEqIMBPqdL6ybCwtGXnl2mRcCIOOlSCIPF7sxzkcIVYGhdeyMHyWH+jzk
	B+FkGtPAGZ3bMK9YM7B0vnjSLoZlhNYU3Xc6+UGM6iftvzHa9GZlnZffk7DrDv6Xbll/j/NWVrV4D
	YU6vY9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSlf-0000000E57R-1nRu;
	Mon, 11 May 2026 15:42:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSlc-0000000E56I-1D6Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:42:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2421F2BC3;
	Mon, 11 May 2026 08:41:53 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E05B3F836;
	Mon, 11 May 2026 08:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778514118; bh=01Py6kniqEDmy2AGjySPUP6siF53kjqGVEBh9dl5R08=;
	h=From:To:Cc:Subject:Date:From;
	b=EHFfYEIqahMR4Pr7LUZdZuNfpY4PK0wHbiQA8hx0VrebE4ciRHSlwGTrBCTFwNEfW
	 /5auBtv4S6YeK+S4Jvqewz0xfETNb8RaMi0JIR9yQnN6ufYExMzwLzwcYkp4nIeIlW
	 T32AG+GCI9viUTjR16CjNkq85AOr/FUNVJR9T08Q=
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
	jonathan.cameron@huawei.com,
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
	x86@kernel.org
Subject: [PATCH v3 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
Date: Mon, 11 May 2026 16:41:42 +0100
Message-ID: <20260511154147.557481-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084200_371807_95FF01C7 
X-CRM114-Status: UNSURE (   7.86  )
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

Removing the rfc tag as the resctrl precursors [1] have been queued in tip
x86/cache. Due to that dependency, it would be good for this to also go through
x86/cache.

This series adds support for memory bandwidth monitoring.

Please review and test.

Changelogs in patches.

[1] https://lore.kernel.org/all/20260506082855.3694761-1-ben.horgan@arm.com/

Description from the initial cover letter:

The MPAM counter assignment (ABMC emulation) changes that were dropped from
the resctrl glue series due to some missing precursors in resctrl. Counter
assignment enables bandwidth monitoring in systems that have fewer
monitors than resctrl monitor groups.

rfc v1: https://lore.kernel.org/lkml/20260225205436.3571756-1-ben.horgan@arm.com/
rfc v2: https://lore.kernel.org/lkml/20260319165540.381410-1-ben.horgan@arm.com/

Ben Horgan (2):
  arm_mpam: resctrl: Pre-allocate assignable monitors
  arm64: mpam: Add memory bandwidth usage (MBWU) documentation

James Morse (3):
  arm_mpam: resctrl: Pick classes for use as mbm counters
  arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
  arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
    resctrl_arch_reset_cntr()

 Documentation/arch/arm64/mpam.rst |  17 ++
 drivers/resctrl/mpam_internal.h   |   6 +-
 drivers/resctrl/mpam_resctrl.c    | 306 +++++++++++++++++++++++++++---
 3 files changed, 306 insertions(+), 23 deletions(-)

-- 
2.43.0


