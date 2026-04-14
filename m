Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B272F9D0CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFsHWqLg+0xIam6os0DlYyH4MJVroIL9fnFiWQQ0xGQ=; b=0m9a4Bz4XQi6TPQ4E2JMDl4M1a
	F0GQzwUXpqMYOOFmVbvyo33az7XQLlwAxO76M76W0HmJ2xigG8QG9LcmSM7cUDHkTL9Oalnzcq/zm
	xk/MvCOr0xT+RaF/DUUYLuvrUEFTzzfb0AZc3XT1WGDU2pubaKgxQLGCf7uc61u9YGieH7EfMycVr
	f2DYjt4xEwGC983SXvNmPyqlsjkRrlMWOfT+qhykw4FUage/eVECiVweMcHGfK0/fRbmKD5LauSNn
	7Nm+Izcb71rZvDc5zgLKU203pFxnDyrz9trxrYl9zZfDUFsry4jBs2aKiJg20/TIf02PtLRC1H77s
	Z+uxnoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdoU-0000000HNN8-136K;
	Tue, 14 Apr 2026 13:28:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdoP-0000000HNKe-2ahG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:28:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAD184E8A;
	Tue, 14 Apr 2026 06:28:09 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3334D3F7B4;
	Tue, 14 Apr 2026 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776173295; bh=HMzN+2rajCGdvWg1so8Az2z0J7swU487eh13m8v6SPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cEtJS8P4RiQUJJ1QiaaJCMt+yU59xcofiec0MhrOr3+1G6sB/0KqvwL69k64SxRAH
	 dKaRyICKuOH4/slloOp9LlGhEOPe9uOiFrAC1agcvTo7nWj7xNK99uD5D7TsBH3kXT
	 llPzvS28Ttt48NFqMsfir3lSbaM+DNabmNjsoVU8=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Dan Carpenter <error27@gmail.com>,
	James Morse <james.morse@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v1 2/2] arm_mpam: resctrl: Make resctrl_mon_ctx_waiters static
Date: Tue, 14 Apr 2026 14:27:58 +0100
Message-ID: <20260414132758.196874-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414132758.196874-1-ben.horgan@arm.com>
References: <20260414132758.196874-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_062817_708395_1E0B5BA5 
X-CRM114-Status: GOOD (  11.06  )
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

resctrl_mon_ctx_waiters is not used outside of this file, so make it
static. This fixes the sparse warning:

drivers/resctrl/mpam_resctrl.c:25:1: warning: symbol 'resctrl_mon_ctx_waiters' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603281842.c2K96tJA-lkp@intel.com/
Fixes: 2a3c79c61539 ("arm_mpam: resctrl: Allow resctrl to allocate monitors")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index d80df486a313..bb933b224851 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -22,7 +22,7 @@
 
 #include "mpam_internal.h"
 
-DECLARE_WAIT_QUEUE_HEAD(resctrl_mon_ctx_waiters);
+static DECLARE_WAIT_QUEUE_HEAD(resctrl_mon_ctx_waiters);
 
 /*
  * The classes we've picked to map to resctrl resources, wrapped
-- 
2.43.0


