Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D56C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCI6atTaI4PYEZD2KV1e6ZIx+F5uWrAGqo2gIXXDVXk=; b=d3AjWiDpSv0eejcTALarVfEukx
	ecZnX6s9Yu6ca0hIxunDzQbRGoaCjh2nJiyfI1o/Gm11RQhtaYabrZvAk+5OE6SH6RbokNRkzlY6a
	qhXtywv+l3zXYpV1KbVDLrk3eCDz9U6g0+n2HuWaynj4zDeIv6v6SvKwAoTS1+3ogc8I80c0p3pmU
	/KwKTVrczBWyrEskVpM3rYMDo2CMFBXmcWQoFlYUIkPWZwWXSEoNutD+HPGy4cDUm2fYPK72c3E5/
	lvGGiuIsL/hrQDLxCjYujY40bT4ztBwYZa0Yj77lcBwTN1xnyAr0HelSu5w2ZSCjL2Ia/4G5Tp//T
	Ef2mb6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXe-0000000BbGo-0sTU;
	Thu, 17 Sep 2026 14:56:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXW-0000000Bb9z-3dkH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC574201B;
	Thu, 17 Sep 2026 07:56:38 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01DEF3F86F;
	Thu, 17 Sep 2026 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789657002; bh=2W4vg8a0BH3+OFw+MBFW0cOa1L2xE5ZnqmXZrMtVPsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K/ADxr8LGT+NRfiYYQX71AUBp4ZCgJLxTOTedZnU/VYIV+CIdfFT+WhA5g/dNvuk4
	 9RMwKqogC2BGIKZWorYLLZyp76aB/b5FVWKrZT0BkFE8tZJQ+olUswpMXKNMcuM/L+
	 x517IB1+QrY84D3rFVuhCoYZjQuRA1LOq8q7Igcs=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 09/12] arm_mpam: resctrl: Make read_mon_cdp_safe() self consistent
Date: Thu, 17 Sep 2026 15:56:14 +0100
Message-ID: <20260917145617.2202986-10-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075642_944703_6A10A326 
X-CRM114-Status: GOOD (  13.48  )
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
the monitor values but with the initial value of val also added. Both
resctrl_arch_cntr_read() and resctrl_arch_rmid_read() call
read_mon_cdp_safe() and are documented to return the val directly without
consideration of the older value.

 The val is always zeroed before read_mon_cdp_safe() is called except in
 __check_limbo() and __l3_mon_event_count_sum() but the latter is not
 relevant on MPAM systems.  The extra accumulation in __check_limbo() means
 when there are multiple RMIDs in limbo some of them may be marked dirty
 when they are already clean.

Change the cdp_enabled equals true case to match the false case and the
documentation of the resctrl arch hooks.

Fixes: fb56b29932ca ("arm_mpam: resctrl: Add resctrl_arch_rmid_read()")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
Add fixes tag as actually fixes an issue (Sashiko)
Update commit message
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
2.43.0


