Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD83F9D0CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvYZLZVkCA9+23Hm7HgmAZopaVLImsbRoVrD9doAB/g=; b=yjquIF2xbM0iDHEYidizu0356x
	iLoAkgqsiDvZIekdQRFcFjdIHIcHAdkuL6GwtVQ7FsTF4PEG3khwZTkxyNbkoP4LGoffeEJz9DWaj
	BWUR2q4bmdTxhnPjFS9fUYmjrypP2YLcXiA76PeAwxGBrtz/HL941UIr91/Fy7piFe5m+yOx/Vv0Z
	EdLCrkdubYiFlBLWH4/JwzfXHxnL/2ahxdi5SWhqYFba+dTl9B/wB5IfkwIMxRH4FAmbvF0HHbt78
	ezsjeG8cf3oikYSdtdVgRzoktSVudUrFXqm820wW/UZkDKvQstLLcw4hbptlrwOZatmselLHfvlLC
	7WkLpciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdoQ-0000000HNKz-2I7u;
	Tue, 14 Apr 2026 13:28:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdoL-0000000HNIt-2kjX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:28:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E06D4E8A;
	Tue, 14 Apr 2026 06:28:06 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06ACE3F7B4;
	Tue, 14 Apr 2026 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776173292; bh=CkqqWnZ/7qBTK8c2/xuX0ONIv9/5APXXd5FmS3QEyTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K8KsHAJTPYanSmJzKqZ/1Oal0hodVVErmc3wOoOpVt1JB3MVFmmh/9b8cGuFk2OpG
	 OgH7wJ6ja8HS6Nuaq4nPGVp8cwZRVFVx1VmzPVhhobt/unM0ofS9u19XAGoXZrr0k8
	 flP2Y8RvyQjjztoiUWcuj+sf6pzoowpa8wf07KHU=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Dan Carpenter <error27@gmail.com>,
	James Morse <james.morse@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 1/2] arm_mpam: resctrl: Fix broken error path in mpam_resctrl_alloc_domain()
Date: Tue, 14 Apr 2026 14:27:56 +0100
Message-ID: <20260414132758.196874-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414132758.196874-1-ben.horgan@arm.com>
References: <20260414132758.196874-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_062813_738016_7FBC8E5C 
X-CRM114-Status: GOOD (  11.56  )
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


