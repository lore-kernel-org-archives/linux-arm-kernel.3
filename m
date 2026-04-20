Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59784F588DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2HCD9QjegX3I5tGtkvSVuKIF6FOu0DMPtJHVSLvDZ8=; b=dNgmzvClAqFnzUosJd+yliTW4I
	oSSDebaaTEN4NIKOAMn0PUMSOPUWMPp3AJV3gQ2F6DlwGYbV07xh1wc9Dsp6paG+k8adGaOWywMw1
	8l9R93vFMgPc0U2ZRhll0NsdUUPcurIuySe7LQxT+FW6rbBA5xRkP9GqXiAKQTG6EPHZfG5MBvG/w
	PhP71Hs/ACcVa08b/vxvqNu9pObdRZC5eTv4bOdti761kZNSyA9GNKdE1NCYNzlZRPyk95wr4byW5
	SJm3Brp0qIoRQ1LRQl4EPzyG37kRB6cYNdUvWxqSMd/6ZGclI0xIVt+z2z66wXDsS4WiTkO1Rp4/y
	ee6NMokg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpFm-000000078I2-3zHw;
	Mon, 20 Apr 2026 14:05:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpFh-000000078FV-0lv5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:05:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 557171758;
	Mon, 20 Apr 2026 07:05:22 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF5A53F7B4;
	Mon, 20 Apr 2026 07:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776693927; bh=gAsYCogizfO50UZORWyBfzBnwICHJeinGM+fTo41cKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hWLNm+T1JS9lS1jd9bjyJAIXltL/24dmpP1bYgBq2FTkBwIgFoQC5zkmsUqqE0Xgg
	 kc6HChZK89A1aSyjibFcMCcYuAtEggW+jAE9oLIF4buOpEggOMa+h6KhtzodWUqhli
	 DzdPY5q9EsovjqG6G1yHKGAkkki8KZ9+eCpTwAcE=
From: James Morse <james.morse@arm.com>
To: catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	will@kernel.org,
	Ben Horgan <ben.horgan@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: [RESEND PATCH 3/3] arm_mpam: resctrl: Make resctrl_mon_ctx_waiters static
Date: Mon, 20 Apr 2026 15:05:16 +0100
Message-ID: <20260420140516.3892820-4-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420140516.3892820-1-james.morse@arm.com>
References: <20260420140516.3892820-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_070529_266210_B926249E 
X-CRM114-Status: GOOD (  11.57  )
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

From: Ben Horgan <ben.horgan@arm.com>

resctrl_mon_ctx_waiters is not used outside of this file, so make it
static. This fixes the sparse warning:

drivers/resctrl/mpam_resctrl.c:25:1: warning: symbol 'resctrl_mon_ctx_waiters' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603281842.c2K96tJA-lkp@intel.com/
Fixes: 2a3c79c61539 ("arm_mpam: resctrl: Allow resctrl to allocate monitors")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 1b0b37da12af..226ff6f532fa 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -22,7 +22,7 @@
 
 #include "mpam_internal.h"
 
-DECLARE_WAIT_QUEUE_HEAD(resctrl_mon_ctx_waiters);
+static DECLARE_WAIT_QUEUE_HEAD(resctrl_mon_ctx_waiters);
 
 /*
  * The classes we've picked to map to resctrl resources, wrapped
-- 
2.53.0


