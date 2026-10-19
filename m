Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110AA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RKBtoqNn;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dm0UdOdV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z930aZdfvVpIFshW/GQIi7DQ5rFjXFIvOgbMJU6b2ac=; b=RKBtoqNnzxa8P+FWd2OMpR4ptx
	ti+Q/RFx1UrnD+6+0raIJRvozB/JURPWq6fziksMTEoZQuTMRhLIx84wCoYbXCC7ukitkxqLZkwmF
	o1AzQurYvfRRNiV1l+aKDRXOT2/XXNCvenGo9SUc6UF3lzqrmBV7asxw96Q3DLW/rZjYwEhTtyFxQ
	J0Azow1xWz6D6Jc80hTwm263Xqt2dmF1W/8kpQIEHKotFWuBCoY/aRwBZx/vjl0CBlaxQlg8os1hr
	VAxAE5de4mexMaLsf+2ZQ+4gR/LVcoWcGe1GHK2xBFFWrbQ82YDTdsZnhSIMsy90hbTaPEDEgOaoH
	jrWprPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWk-00000008S4b-2qTq;
	Mon, 19 Oct 2026 22:08:18 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWS-00000008RtY-0kIb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447681; x=1823983681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nfptYNOJXfNoHZ1ujlSgRKHthsMSykqMpirq6OtD6gs=;
  b=Dm0UdOdVk3QT+BCYYkdUI3pFy9evU9c6Dt+FjBFX1tbzWewOzrO5rsGp
   mgCWdMIKn4amIdCeXI7lDNL2nGmX3e7svPgCs3w6ypOEjppjHsJVcpCYZ
   pQhK9QcKoaC10IF4K6zhT9TBwyJUaO7ZkmKjtDgEihA4TaWopZMESHcOj
   ACW6LgqWnfRhJfGFxArVUvGZmEUTxVae/xH7+0CvXTxkwVgjuyEpyzKM+
   AuYkkUjfY0c0ff6QCACiFO9h7rlh4KVE601KtRyW3PlzCF5M8bxjGK3Do
   CFP0gfE5l61sbpczobtzae6d1cRpjYRpmOzpASUkqU2OO6p+sZ/KvLpAk
   A==;
X-CSE-ConnectionGUID: WQysljrETn67+r9j5ieZzw==
X-CSE-MsgGUID: tc2guGzJRTyoYXLiOICnUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144199"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144199"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:59 -0700
X-CSE-ConnectionGUID: Km7m/hfnQ7++EA4kzIpCSQ==
X-CSE-MsgGUID: yGBqu+ioQ1WIWQANzXeUNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708336"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:58 -0700
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
Subject: [RFC PATCH v2 04/10] arm_mpam: resctrl: Split control and monitoring domain setup into helpers
Date: Mon, 19 Oct 2026 15:07:38 -0700
Message-ID: <20621c28067916be2709fc4437473f1ccad7e334.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
References: <cover.1792443633.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_150800_241620_AE41408B 
X-CRM114-Status: GOOD (  18.69  )
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

mpam_resctrl_alloc_domain() allocates one structure that holds both the
control domain and the monitoring domain of a resource. It sets up
whichever of the two domains the resource supports, with the setup of
both open coded in the function, and undoes the control domain if
setting up the monitoring domain fails.

Apart from the code that manages domains, every user of the structure
accesses only one of its two domains, so the monitoring domain can be
given a structure of its own. Doing so starts with separating its setup
from that of the control domain.

Move the setup of each domain into its own helper in preparation for
giving the monitoring domain its own structure as part of supporting
multiple controls per resource. Keep the allocation and the error
handling in mpam_resctrl_alloc_domain() so that a failure to set up the
monitoring domain still undoes the control domain.

No functional change intended.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_resctrl.c | 116 ++++++++++++++++++++-------------
 1 file changed, 70 insertions(+), 46 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index dc442851fd7e..246560247a28 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1615,13 +1615,77 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 	return NULL;
 }
 
+static int mpam_resctrl_setup_ctrl_domain(unsigned int cpu,
+					  struct rdt_resource *r,
+					  struct mpam_component *comp,
+					  struct mpam_resctrl_dom *dom)
+{
+	struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
+	int err;
+
+	dom->ctrl_comp = comp;
+
+	mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
+	ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
+	err = resctrl_online_ctrl_domain(r, ctrl_d);
+	if (err)
+		return err;
+
+	mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
+
+	return 0;
+}
+
+static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
+					 struct rdt_resource *r,
+					 struct mpam_resctrl_dom *dom)
+{
+	struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
+	struct mpam_component *any_mon_comp = NULL;
+	enum resctrl_event_id eventid;
+	struct mpam_resctrl_mon *mon;
+	int err;
+
+	/*
+	 * Even if the monitor domain is backed by a different
+	 * component, the L3 component IDs need to be used... only
+	 * there may be no ctrl_comp for the L3.
+	 * Search each event's class list for a component with
+	 * overlapping CPUs and set up the dom->mon_comp array.
+	 */
+
+	for_each_mpam_resctrl_mon(mon, eventid) {
+		struct mpam_component *mon_comp;
+
+		if (!mon->class)
+			continue;       // dummy resource
+
+		mon_comp = find_component(mon->class, cpu);
+		dom->mon_comp[eventid] = mon_comp;
+		if (mon_comp)
+			any_mon_comp = mon_comp;
+	}
+	if (!any_mon_comp) {
+		WARN_ON_ONCE(0);
+		return -EFAULT;
+	}
+
+	mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
+	mon_d->hdr.type = RESCTRL_MON_DOMAIN;
+	err = resctrl_online_mon_domain(r, &mon_d->hdr);
+	if (err)
+		return err;
+
+	mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
+
+	return 0;
+}
+
 static void mpam_resctrl_alloc_domain(unsigned int cpu,
 				      struct mpam_resctrl_res *res)
 {
 	int err;
 	struct mpam_resctrl_dom *dom;
-	struct rdt_l3_mon_domain *mon_d;
-	struct rdt_ctrl_domain *ctrl_d;
 	struct mpam_class *class = res->class;
 	struct mpam_component *comp;
 	struct rdt_resource *r = &res->resctrl_res;
@@ -1638,57 +1702,17 @@ static void mpam_resctrl_alloc_domain(unsigned int cpu,
 		return;
 
 	if (r->alloc_capable) {
-		dom->ctrl_comp = comp;
-
-		ctrl_d = &dom->resctrl_ctrl_dom;
-		mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
-		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
-		err = resctrl_online_ctrl_domain(r, ctrl_d);
+		err = mpam_resctrl_setup_ctrl_domain(cpu, r, comp, dom);
 		if (err)
 			goto free_domain;
-
-		mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
 	} else {
 		pr_debug("Skipped control domain online - no controls\n");
 	}
 
 	if (r->mon_capable) {
-		struct mpam_component *any_mon_comp = NULL;
-		struct mpam_resctrl_mon *mon;
-		enum resctrl_event_id eventid;
-
-		/*
-		 * Even if the monitor domain is backed by a different
-		 * component, the L3 component IDs need to be used... only
-		 * there may be no ctrl_comp for the L3.
-		 * Search each event's class list for a component with
-		 * overlapping CPUs and set up the dom->mon_comp array.
-		 */
-
-		for_each_mpam_resctrl_mon(mon, eventid) {
-			struct mpam_component *mon_comp;
-
-			if (!mon->class)
-				continue;       // dummy resource
-
-			mon_comp = find_component(mon->class, cpu);
-			dom->mon_comp[eventid] = mon_comp;
-			if (mon_comp)
-				any_mon_comp = mon_comp;
-		}
-		if (!any_mon_comp) {
-			WARN_ON_ONCE(0);
-			goto offline_ctrl_domain;
-		}
-
-		mon_d = &dom->resctrl_mon_dom;
-		mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
-		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
-		err = resctrl_online_mon_domain(r, &mon_d->hdr);
+		err = mpam_resctrl_setup_mon_domain(cpu, r, dom);
 		if (err)
 			goto offline_ctrl_domain;
-
-		mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
 	} else {
 		pr_debug("Skipped monitor domain online - no monitors\n");
 	}
@@ -1697,8 +1721,8 @@ static void mpam_resctrl_alloc_domain(unsigned int cpu,
 
 offline_ctrl_domain:
 	if (r->alloc_capable) {
-		mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
-		resctrl_offline_ctrl_domain(r, ctrl_d);
+		mpam_resctrl_offline_domain_hdr(cpu, &dom->resctrl_ctrl_dom.hdr);
+		resctrl_offline_ctrl_domain(r, &dom->resctrl_ctrl_dom);
 	}
 free_domain:
 	kfree(dom);
-- 
2.55.0


