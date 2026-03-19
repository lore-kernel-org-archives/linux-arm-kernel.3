Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36F21090255
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MDHnDwjgLXf2zgAJpuNMv3ZljFMCcoFp9wDyK1zgjR4=; b=y3F5vF16tzRnzHCPyyZTyxx4JZ
	P5Vgo2pAVPO91OYQ91wTYv/xuL+/ewBwIVHOZOJyjmeGeWh7JLm+0WAO3q48vPVHdH5BgGL+Qqoh8
	SrI3qWKO8fqU2RaPsgx6aoIcYLLfJSUPdiJs6JLjJ3HpbcOKavN91bdPwSfdCKfGQ65LQW1x16ACj
	u7Wz3+O6ULW7M8+iVororHYyUdp5X3wdV9ZLJiMiNsnHe1pZSP0dpfJR7V6RnXJzWAPsMATKz3ds6
	8KBUrRRJs7rY3sO2stzETfL12HbLekqJ//MXSRA0DBY9WufvbojTa98nTX6zungUCJfo6aCB7iJa2
	6Gu9dk7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GfA-0000000B7jT-1bbd;
	Thu, 19 Mar 2026 16:56:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Gf8-0000000B7iV-1fW2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:55:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5F4B16F2;
	Thu, 19 Mar 2026 09:55:46 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 117D53F7BD;
	Thu, 19 Mar 2026 09:55:49 -0700 (PDT)
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
	zengheng4@huawei.com
Subject: [RFC PATCH v2 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
Date: Thu, 19 Mar 2026 16:55:35 +0000
Message-ID: <20260319165540.381410-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_095558_479463_0DEBB902 
X-CRM114-Status: UNSURE (   6.76  )
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

The main changes in this version of the series are to deal with the
fallout from dropping memory bandwidth monitoring *without* counter assignment
from MPAM. The extra complexity of supporting memory bandwidth monitoring in
two different modes didn't seem necessary.

Changelogs in patches

Description from the initial cover letter:

The MPAM counter assignment (ABMC emulation) changes that were dropped from
the resctrl glue series due to some missing precursors in resctrl. Counter
assignement enables bandwidth monitoring in systems that have fewer
monitors than resctrl monitor groups. Posting this as an rfc as this now
depends on two series, the mpam resctrl glue [1] and the resctrl precursors [2].

[1] https://lore.kernel.org/linux-arm-kernel/20260313144617.3420416-1-ben.horgan@arm.com/
[2] https://lore.kernel.org/lkml/20260319162225.378485-1-ben.horgan@arm.com/

rfc v1: https://lore.kernel.org/lkml/20260225205436.3571756-1-ben.horgan@arm.com/

The series with the precursors can be retrieved from:
https://gitlab.arm.com/linux-arm/linux-bh.git mpam_abmc_v2

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
 drivers/resctrl/mpam_resctrl.c    | 303 +++++++++++++++++++++++++++---
 3 files changed, 303 insertions(+), 23 deletions(-)

-- 
2.43.0


