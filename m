Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC41CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AZBqLfOaYXAUBlPVoGskbhQECOkougJkS5KT9vxEYB4=; b=fy3Mf5r6Qf1/9xLNXg6X0o/tlA
	ejVfoibQowvdDARPShL4GtbnTEwCMn/Np3PzULLVilyjMagRPZA4gPr2UDemHm42X3XiCTV+Lu5Dv
	AW2GFDz/wY9Fc68w8ZXM9xTeMKQ3DLZ6njU7S9pmA6ZXlWw1Qp3ex6Qz5rMztPkpixbjK9IrLuoh+
	/x/NDlpNiDKLMiKztrujQWHqmghzylz3S0zbb24asD1kmDMPSKsiVUlPZumlCcE1l4b77z+78zSFD
	uirz/sSzzgcXznGHRyNriSU+O648FO/X9NepWvpW7bP8w3OpRClSyYMBe/CvteHGKjbC3HYfhTRKx
	k58LM5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoPu-00000005pk4-0rYl;
	Wed, 20 May 2026 21:25:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoPq-00000005pi4-20XC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:25:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFCDA4907;
	Wed, 20 May 2026 14:25:10 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D722C3F632;
	Wed, 20 May 2026 14:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779312315; bh=uV0pitMgYy72xTsnWhGhkJam9QAMerA/pmeVRo4nAhg=;
	h=From:To:Cc:Subject:Date:From;
	b=S0lK/ZMs4dQNtegohCdmqCi/jjNJzm3oeXflLwBbd2TZmPC4sSZS5eZH4ENhckCGC
	 whpPOO/7MhFYEX6uqpFY46xWDKCqgxvfqdE9XP1xxMBPPnM8l22kmGceLbVsFTAg9f
	 WSKF7jc6sGACBm1cFzJLJwEeWq/iYg2B1dUQ1YCI=
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
	x86@kernel.org
Subject: [PATCH v4 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
Date: Wed, 20 May 2026 22:24:53 +0100
Message-ID: <20260520212458.1797221-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_142523_169947_6231F7F7 
X-CRM114-Status: UNSURE (   9.56  )
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

Version 4 of this series addresses a few review comments and some concerns
of the sashiko bot.

From the cover letter of v3:

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
v3: https://lore.kernel.org/linux-arm-kernel/20260511154147.557481-1-ben.horgan@arm.com/

The code can be found at:
https://gitlab.arm.com/linux-arm/linux-bh.git mpam_abmc_v4

Ben Horgan (2):
  arm_mpam: resctrl: Pre-allocate assignable monitors
  arm64: mpam: Add memory bandwidth usage (MBWU) documentation

James Morse (3):
  arm_mpam: resctrl: Pick classes for use as MBM counters
  arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
  arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
    resctrl_arch_reset_cntr()

 Documentation/arch/arm64/mpam.rst |  17 ++
 drivers/resctrl/mpam_internal.h   |   6 +-
 drivers/resctrl/mpam_resctrl.c    | 308 +++++++++++++++++++++++++++---
 3 files changed, 308 insertions(+), 23 deletions(-)

-- 
2.43.0


