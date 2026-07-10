Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65984C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDMFDAq86kLtjikbrKzKLndIY5D/ygO/TMXOg1+wB/s=; b=0WifYIRTvO/WIGZ9vppAwimJ+H
	uB04YwR8F405XD+/sgUJ3GIkQH8ietRR2IC023fOb5Lqj2w3EQTv9SDEvuJZZSHu+MgMvhW5pfH+k
	uazq3fQMstRkS+xkRBfOjbom8Xaf1q6abWzkM34EWtwFC4ynDwk6cC1u1NrY191UbEIR2okQcZGxj
	JH+RTgMhrj+0yfyl2V0KYyZs/ODwPJBd7pVu2cp3eHiKF5iYNlJi/lCXY6j4Qamp18WybB64rSaZR
	ABaIBCedTHGI86me1Y6ewbI0ILHGMpjBYEEqcSPL9gXujOl2cbAfKoDfikezr/Feu9scY9IOwr7mk
	+s4+uZuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9q8-00000004s05-1Vej;
	Fri, 10 Jul 2026 11:56:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pz-00000004rl4-22r5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 347361EDB;
	Fri, 10 Jul 2026 04:56:06 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 38A8B3F85F;
	Fri, 10 Jul 2026 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684570; bh=zLGEpiegRh4FFq0BMnzwA9fu2/Q7LJvjrYlVm3SdoCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nYcHC9r0kTZZFOTYqijD1QvjLT/UAiUXTYSgwn9Kb+fSYiyb+YP1iRlwQKkGYw6fB
	 T3vj8BQ2F8ueSi9Y0EI4pIbNXgwi2WijxyRis9swT8ZIXybL9mkB8/GPIq+KsDDigY
	 jSrYrCbLaRsAhAo+WhEbGtDWW+vQJ60EBhu9lc/w=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 09/11] arm_mpam: resctrl: Make read_mon_cdp_safe() self consistent
Date: Fri, 10 Jul 2026 12:55:43 +0100
Message-ID: <20260710115546.29644-10-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045611_576565_30B7DF34 
X-CRM114-Status: GOOD (  12.17  )
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

When read_mon_cdp_safe() is called with cdp_enabled equal to false then the
reading returned in val is the sum of the monitor values for the given
component. However, when cdp_enabled equal to true it is again the sum of
the monitor values but with the initial value of val also added.

Change the cdp_enabled equals true case to match the false case. All
callers zero the val before calling and so no functional change is
anticipated.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 59dea750ff56..d97565479014 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -487,7 +487,7 @@ static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component
 		if (err)
 			return err;
 
-		*val += code_val + data_val;
+		*val = code_val + data_val;
 		return 0;
 	}
 
-- 
2.43.0


