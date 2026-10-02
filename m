Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFB5CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeAH2HLFKycrcmwyC5HSjWQ60l+51q3CGIcNfX9Q6Xo=; b=X8jvPbnTBr0KonjxPG55nTRLrB
	dergwUDzqXO5enFkLHq8UgWD4lTx3vlGTJAWisHCz814U9nnSjrLpXW7wS5PXyKyhHcceNmF3D19G
	wCUwzBL/IyfTAxIXtexNGA4uYSoAaelEXVNOMPiGvQVvzk9q7t4UlY1WLryWbR7r1Muf0qGcjAA5W
	2KTtTwAxVf5nsH9Z4qfrveS3IBPmPexAlxlhyl7Ajn9Rlfjwd3p2tBShIs7n5zHxhvQWlUFwt6nKo
	u0+WVKsTX3M8VTFzlzCBspwotwxmUjsv/sXq6wMuUzcgU6BTVqyEXg1nX3OJ42vF/fI30z7XWscLA
	O7UwW2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChF2-0000000CBRa-3Kq4;
	Fri, 02 Oct 2026 17:40:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEz-0000000CBME-03Bo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 169B22F;
	Fri,  2 Oct 2026 10:40:09 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74D7E3F85F;
	Fri,  2 Oct 2026 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962812; bh=SKKFkIesXe7+3DxrkH/1tXeDjAt79/SDmACm8P7dmhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VmE1fnoivO7cFNHwp3KxdFlQqPfcwtySoOjKjpjgVkfup20rzpM5T9Tf+1O5SOzY4
	 Mq9LjuyR7/xn6zdCGdy27xWFgMx74TEk60LCBN7QPpZrdT8OlJMYgvGez3+OL5jodC
	 8cSxmsMjNW/U1qWsURMYca2082WlXy+UwHRwkNUo=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 09/27] arm_mpam: resctrl: Make read_mon_cdp_safe() self consistent
Date: Fri,  2 Oct 2026 18:39:22 +0100
Message-ID: <20261002173941.292319-10-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104013_100024_EE60E5F9 
X-CRM114-Status: GOOD (  14.59  )
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

When read_mon_cdp_safe() is called with cdp_enabled equal to false then the
reading returned in val is the sum of the monitor values for the given
component. However, when cdp_enabled equal to true it is again the sum of
the monitor values but with the initial value of val also added. Both
resctrl_arch_cntr_read() and resctrl_arch_rmid_read() call
read_mon_cdp_safe() and are documented to return the val directly without
consideration of the older value.

The val is always zeroed before read_mon_cdp_safe() is called except in
__check_limbo() and __l3_mon_event_count_sum() but the latter is not
relevant on MPAM systems.  The extra accumulation in __check_limbo() means
when there are multiple RMIDs in limbo some of them may be marked dirty
when they are already clean.

Change the cdp_enabled equals true case to match the false case.

Fixes: fb56b29932ca ("arm_mpam: resctrl: Add resctrl_arch_rmid_read()")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
[morse: fixed commit message indenting and removed stale description]
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index b825bd90d4bd..321741a702fe 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -497,7 +497,7 @@ static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component
 		if (err)
 			return err;
 
-		*val += code_val + data_val;
+		*val = code_val + data_val;
 		return 0;
 	}
 
-- 
2.53.0


