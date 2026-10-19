Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8269E60A2604
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tv2jcHbH;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mLPIY0Ld
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJfu+2Iib6dT3fsdnF/B/ETaJ/4ay7oZ9VYZjnnN23c=; b=Tv2jcHbHTUC11P3+uGG+O1xOY7
	gjqhgqaG+/tpbKSqEHrr/Qg8X4MJ1noU94gi9Bjxp1vQE9cHXFqNVS9vxWS5wv2vJxKC6M+lVaCJS
	g+LU1eTTniHilKmgKRIpqqkWHtX7dtJqN8TC8S23SgIrallz//+OYdFKgzeEmfmtFrH7lf+Jo49F2
	aCNv5ueLzRYBF5sttgRkuYrJJN38UNvdKECSCyyHNdhqwnoZByd/AWrONvnkS7B/gwZ5MHevJHwiG
	xisDMztSaYMjejyYcxUb9g7oa0UD2aPNyzgYHTi1+l0l+6sR1D1myYTRMyunnIfTVeV6Lb5ZSJm7N
	ordr68HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWS-00000008Rv1-2pav;
	Mon, 19 Oct 2026 22:08:00 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWQ-00000008Rta-34gs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447679; x=1823983679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CNkmXAHL2R10yvJMmAd0mxESBPC+RFtt/SPUU/bW604=;
  b=mLPIY0Ldizz3c3k9coCD+FO0b01NiHRZZXRJR4w4Ra5lv/GfL9YTifwM
   yNOywqTNDEZHSTvNT8CkPp1KOKG9K9FUDLUvzv8YlpVqGexE705Ow5Bhw
   RZsH9CbJaboTVJ+IbWDSdA3Ah/forwnOOnnZIX6/6f6vdoCC//tHggSak
   i9Aj0NMtQGGWzNQ897Dz29gm0j/V3SyCVHghP9xVkIwRx94rmTTi4omU8
   3ylUmBtFCcUVHRT0ECzqTFvvto4G3vjGx5+idZJkOsULkT/mDmx1Sjimb
   UQQhs8Fqz7m1ktnPZkO1aqgaXqfYzeRrIk8TC5amp/mYtkajJhmyFCpnq
   A==;
X-CSE-ConnectionGUID: aur9NAC+T4GyQyFdVYJ3gQ==
X-CSE-MsgGUID: hAks26iSROmsrfo6LHk9og==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144177"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144177"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:58 -0700
X-CSE-ConnectionGUID: l53lEktkQGa8P8j5EAg/gA==
X-CSE-MsgGUID: CNu/UWcXTOuo3/1xrXtKfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708327"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:57 -0700
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
Subject: [RFC PATCH v2 01/10] arm_mpam: resctrl: Use find_component() when allocating a domain
Date: Mon, 19 Oct 2026 15:07:35 -0700
Message-ID: <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
References: <cover.1792443633.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_150758_782127_0E8A4864 
X-CRM114-Status: GOOD (  14.90  )
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

mpam_resctrl_alloc_domain() starts by checking that the resource's
class has a component whose CPU affinity includes the CPU, and fails the
domain allocation otherwise. When the resource supports allocation, that
component also backs the control domain. The check uses an open-coded
walk of the class's component list, while the same function uses
find_component() to find the component backing each monitoring event.

The open-coded walk duplicates find_component(). It also holds the SRCU
read lock until mpam_resctrl_alloc_domain() returns, which suggests that
the component needs this protection while the domain is set up.

The component does not need it. Components are freed only when an MSC
fails to probe, in which case MPAM is never enabled and no resctrl
domain is created, or by mpam_disable(), which first removes the CPU
hotplug callbacks and thereby tears down all resctrl domains. A component
therefore outlives every domain that refers to it. The SRCU read lock is
only needed while walking the component list, and find_component() holds
it for that walk. In addition, mpam_resctrl_alloc_domain() only runs
from MPAM's CPU hotplug startup callback, which already holds the SRCU
read lock throughout.

Replace the open-coded walk with find_component().

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_resctrl.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9cec5843e8fa..3d5f90f9f1f3 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1623,21 +1623,12 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	struct rdt_l3_mon_domain *mon_d;
 	struct rdt_ctrl_domain *ctrl_d;
 	struct mpam_class *class = res->class;
-	struct mpam_component *comp_iter, *ctrl_comp;
+	struct mpam_component *ctrl_comp;
 	struct rdt_resource *r = &res->resctrl_res;
 
 	lockdep_assert_held(&domain_list_lock);
 
-	ctrl_comp = NULL;
-	guard(srcu)(&mpam_srcu);
-	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
-				 srcu_read_lock_held(&mpam_srcu)) {
-		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
-			ctrl_comp = comp_iter;
-			break;
-		}
-	}
-
+	ctrl_comp = find_component(class, cpu);
 	/* class has no component for this CPU */
 	if (WARN_ON_ONCE(!ctrl_comp))
 		return ERR_PTR(-EINVAL);
-- 
2.55.0


