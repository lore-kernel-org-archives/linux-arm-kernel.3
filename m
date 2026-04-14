Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904B7F9D0D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvYZLZVkCA9+23Hm7HgmAZopaVLImsbRoVrD9doAB/g=; b=BNWgB8yu0uqUpKTggdwiJujlGH
	LjFhJK7pehhWrcgaMSSesbo1zTbDVf/IVGvbQcBkQBsnnPmwbO9q9Kjkc2iAqUNFFG8okGIJ3cKlB
	qGz5Ne18OP9bTkuCyjmwqJdcUELCU2++Zm8fFaDq7MiGbXAZErelEGdiSk/KrilwyM20a4ppAx598
	BAirx8SIW7br1Ei6GQLHqWUA6uppSdWl2uMk21U4rmRIPbooBbc5onXOPVZBlE7chLjRQXQjnqc1F
	VQwKzHQrqZwPyjlea8DIiN4bGwexQTXZL9hurxbnZrYqOIdJ03bfmudf1GKvQ8cKtfIN7oNgCfPAJ
	1vkJvFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdoQ-0000000HNLK-3r2e;
	Tue, 14 Apr 2026 13:28:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdoM-0000000HNJo-3wyS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:28:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF7E4F12;
	Tue, 14 Apr 2026 06:28:08 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 96E2A3F7B4;
	Tue, 14 Apr 2026 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776173293; bh=CkqqWnZ/7qBTK8c2/xuX0ONIv9/5APXXd5FmS3QEyTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gh0Q5iyUwM05Jy4hH31LJJaSluJUTCH0Hf3MzNdJK53QArlJi8uUzPXr33rJyyscp
	 FQ9NweD8G5QtKvFUWOfPi/RpqpwqKv80g/pMNUuc4/i8Nic1BN3CIbroFzPtLpinG8
	 SWUgP66tAhLk6UzXIzQNu39ylaxDmSuCgGPqbJKM=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Dan Carpenter <error27@gmail.com>,
	James Morse <james.morse@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 1/2] arm_mpam: resctrl: Fix the check for no monitor components found
Date: Tue, 14 Apr 2026 14:27:57 +0100
Message-ID: <20260414132758.196874-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414132758.196874-1-ben.horgan@arm.com>
References: <20260414132758.196874-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_062815_015890_E57A8C4B 
X-CRM114-Status: GOOD (  11.62  )
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

Dan Carpenter reports that, in mpam_resctrl_alloc_domain(), any_mon_comp is
used in an 'if' condition when it may be uninitialized. Initialize it to
NULL so that the check behaves correctly when no monitor components are
found.

Reported-by: Dan Carpenter <error27@gmail.com>
Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index a9938006d0e6..d80df486a313 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1399,7 +1399,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	}
 
 	if (r->mon_capable) {
-		struct mpam_component *any_mon_comp;
+		struct mpam_component *any_mon_comp = NULL;
 		struct mpam_resctrl_mon *mon;
 		enum resctrl_event_id eventid;
 
-- 
2.43.0


