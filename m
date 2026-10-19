Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7D860A2602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3mAksXSu;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iUvNmK0F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KRFoez2MHK6RdePaMAxh33RzW/2GI6fZB4kUeE4dvY=; b=3mAksXSuxDNDQM7ErVBabTD6n7
	lwVgTvjKBMWrsLK1fqYQBuBO4cSO38C8wbGbtnIQT8LGgfKE40zcrtrBHTzLKCZ9UAajd6Xwa/Tl9
	z+/ulJtdhD8H+nG5Mbun/s72q+laqyusc8TXoOx+CvvqaW46gB96pgvghWmpPnRWTnPAfcFrqAtO+
	XFqNPcUjvHzSB1HMBXbmBRBvOtzO7p3LdXqdvzTt2CxyUc5aaUVyPASoTgHLfmY00Lj4fjWd44m5r
	fVGWFnuYcYByV2zfK6pZxKhXYcrUgbVridzeTZCVVgB6S3oiBkf3XzujcylswZNLab8vOjgsJYV9/
	/72R+dTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWl-00000008S5n-0Np7;
	Mon, 19 Oct 2026 22:08:19 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWU-00000008Rta-1OHx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447683; x=1823983683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KSmmFCGJg8FWLkt7bylQR8X3wY+9QEqWerUrD4M3uL4=;
  b=iUvNmK0FJdPKCym43KJ1Io29Be1248h2hAjP4m+RwPCVJZidCKcfLqF2
   zLAw6VQQQLFzd1HIgzJPEj3mdFAqEg6/1Paiww/wQpawNMvw1aO0pjo/W
   1fLsK7aObGNamPbr71aBJlJcq7fBPy62Cg4Pdvz3/9r/h6SH32GP5Eaui
   UtaNv8vfcslLsMorPukY4ULAW592fuw9+D1HfGQ+RKNbCOJIvgHlwlD/j
   yRuCfrwoI2mVriviACCDrWDfoilRkjoNd5OO2blrvsK5C0vd6axFnbDLh
   E2n+juw8kv/EmoW4ul0QMnGYxQLCW0ngPaUzJtsdvUsyHBigQ+EJeSRT/
   Q==;
X-CSE-ConnectionGUID: sMiJPJkTQGqca9xHuwfEgQ==
X-CSE-MsgGUID: pLKhDfRqRg+qf8ku0ysPQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144228"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144228"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:08:00 -0700
X-CSE-ConnectionGUID: u8smdNEJRP+wDnO1uhFLgQ==
X-CSE-MsgGUID: AAzRo9G0TPq8G3hxomZ2sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708349"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:59 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com
Cc: tony.luck@intel.com,
	yu.c.chen@intel.com,
	babu.moger@amd.com,
	fustini@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [RFC PATCH v2 08/10] arm_mpam: resctrl: Require a component for each monitoring event
Date: Mon, 19 Oct 2026 15:07:42 -0700
Message-ID: <3384e5bedb29e3a0bd7fa383939db8ca70c4a733.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
References: <cover.1792443633.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_150802_486566_D813B02F 
X-CRM114-Status: GOOD (  14.59  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Setting up a monitoring domain looks up, for each monitoring event, the
component of the event's class that contains the CPU and records it in
the domain. Reading and resetting the event's counters in the domain
then use the recorded component.

If an event's class has no component for the CPU, the domain is still
set up as long as another event's class has one, and the event is left
without a component. Reading or resetting the event's counters in that
domain then dereferences a NULL component. This is not expected to
happen since only classes that cover all possible CPUs are picked for
monitoring.

Fail setting up the monitoring domain, with a warning, if an event's
class has no component for the CPU, so that every event of a monitoring
domain has a component.

Keep the check that at least one component was found. It now only fails
if no event has a class, and so captures that a resource that supports
monitoring has at least one monitoring event with a class.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_resctrl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 63c5bf45856d..36a924734484 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1661,9 +1661,11 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
 			continue;       // dummy resource
 
 		mon_comp = find_component(mon->class, cpu);
+		if (WARN_ON_ONCE(!mon_comp))
+			return -EFAULT;
+
 		dom->mon_comp[eventid] = mon_comp;
-		if (mon_comp)
-			any_mon_comp = mon_comp;
+		any_mon_comp = mon_comp;
 	}
 	if (WARN_ON_ONCE(!any_mon_comp))
 		return -EFAULT;
-- 
2.55.0


