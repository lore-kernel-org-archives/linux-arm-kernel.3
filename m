Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695B606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AKAyUfrO;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FvYgU400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFtwyfxLr5GFgAON1RsdtP16Tz5z4/baZH98ZPkOWQI=; b=AKAyUfrOf8iFkj53LOKmAyenN+
	4PWVJVN8rPHeBXJq5DNYFIf+gw/ZUCfGWDlcJmuHXCMO69oYsAd3UDwJ2aFzFVcaOrIHGbbsGOHgP
	FFRsPIxOQficQRtV0psz9HL+IU6tlF1P4eoL5IO7+kqhIK+rXJpdsNNxhk9yGB1A27UYlJJ8yg+tq
	PoguXeyvLSlCXqA39e1DgBhiWWBq6kSXMHohb6PlydWm7oAgzm+g5prU/rpG6Z67x0AG52oiIG7xo
	xvQiVxmy6TNQDiFO8KhhtkiZuHTB/YV2l28TT2YY0VdOUTTPxLcV87urbwmi8pWYQ0hsFj6Qjs7QF
	sc7KhRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWk-00000008S4t-3K6L;
	Mon, 19 Oct 2026 22:08:18 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWT-00000008Rta-01Ab
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447681; x=1823983681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C/BtAMfkRrWL4wEqht4DC9WNmUti1x/o/QqUF2yKxeY=;
  b=FvYgU400cBpcSIQcML35fdYvBTmGu6u77J3EI4VeSJdM6D1BL1SY/hWS
   iLR7/TNAo7u16HPDp6PP/lAbDEmWfIFGz1VLm/HfM7qiFMp/GkgFILdy5
   f4lR25C9nhYYk6bha31u/ORLHXpABjAUlncl4A5MuBJyZx8R2Jdjp5exl
   y5I2m+rgvRJyL5llMFm6dLiXBARzdEuTYEBEzmjnaElhVtq0wEkY9jegK
   dTYP55a//oB8eQFSbKp23cCZB2tuzRdbOuMcCMqdFSwaA/fO8kB0eBZ5r
   AWwWpG60XB70IW+SsJJNqcwDRhJSeEv7XT6MSIQvk/0ZzhFQz9+haVHik
   Q==;
X-CSE-ConnectionGUID: IUIppubrT4GtmX511dE8Zg==
X-CSE-MsgGUID: ZKpn4dVGSn2C7Hp22sOI4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144206"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144206"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:59 -0700
X-CSE-ConnectionGUID: xy2ikk9ySGG5kvNUp7qfUQ==
X-CSE-MsgGUID: CfjKMWl1RgiYfO2QyNwzLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708339"
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
Subject: [RFC PATCH v2 05/10] arm_mpam: resctrl: Give the monitoring domain its own structure
Date: Mon, 19 Oct 2026 15:07:39 -0700
Message-ID: <2238eab97cc66852d0d0d1a5c6ff191c03ce9e0d.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
References: <cover.1792443633.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_150801_071839_2EF59C2E 
X-CRM114-Status: GOOD (  27.78  )
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

One structure holds both the control domain and the monitoring domain of
a resource. The two domains are allocated together when the first CPU of
the domain comes online and freed together once both have lost their
last CPU. A failure to set up the monitoring domain undoes the control
domain.

Apart from the code that manages domains, nothing uses both domains of
the structure. Keeping them in one structure nevertheless ties each
control domain to a monitoring domain, which does not fit supporting
multiple controls per resource.

Move the monitoring domain and its components into a new structure,
struct mpam_resctrl_mon_dom. Manage control and monitoring domains
separately when CPUs come online and go offline: look up, set up, and
tear down each domain on its own and free it once it has lost its last
CPU.

Do not let a failure to set up one type of domain affect the other. Keep
a control domain that was set up when setting up the monitoring domain
for the same CPU fails, and set up the monitoring domain even when
setting up the control domain fails. This is consistent with domain
setup failures not failing CPU online: only domains that were set up are
exposed through resctrl.

Look for a component of the resource's class that contains the CPU only
when setting up a control domain, since that component backs the
control domain. Setting up a monitoring domain already fails if no
monitoring class has a component for the CPU.

Look up monitoring domains by L3 cache ID on all systems, as was already
done on systems without controls. Monitoring domain IDs are always those
of the L3, so this finds the same domain as looking it up through its
control domain did.

Drop the debug messages about resources without controls or monitors.
They reported which of the two domains in the shared structure was left
unused, which no longer applies now that each domain type has its own
structure.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_internal.h |   5 +-
 drivers/resctrl/mpam_resctrl.c  | 226 ++++++++++++++++----------------
 2 files changed, 117 insertions(+), 114 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 84c7adbb1a40..1df439ecb055 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -434,15 +434,16 @@ struct mpam_msc_ris {
 
 struct mpam_resctrl_dom {
 	struct mpam_component		*ctrl_comp;
+	struct rdt_ctrl_domain		resctrl_ctrl_dom;
+};
 
+struct mpam_resctrl_mon_dom {
 	/*
 	 * There is no single mon_comp because different events may be backed
 	 * by different class/components. mon_comp is indexed by the event
 	 * number.
 	 */
 	struct mpam_component		*mon_comp[QOS_NUM_EVENTS];
-
-	struct rdt_ctrl_domain		resctrl_ctrl_dom;
 	struct rdt_l3_mon_domain	resctrl_mon_dom;
 };
 
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 246560247a28..ce5519635c51 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -510,7 +510,7 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
 			   void *arch_priv, u64 *val, void *arch_mon_ctx)
 {
-	struct mpam_resctrl_dom *l3_dom;
+	struct mpam_resctrl_mon_dom *l3_dom;
 	struct mpam_component *mon_comp;
 	u32 mon_idx = *(u32 *)arch_mon_ctx;
 	enum mpam_device_features mon_type;
@@ -524,7 +524,7 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	if (eventid >= QOS_NUM_EVENTS || !mon->class)
 		return -EINVAL;
 
-	l3_dom = container_of(hdr, struct mpam_resctrl_dom, resctrl_mon_dom.hdr);
+	l3_dom = container_of(hdr, struct mpam_resctrl_mon_dom, resctrl_mon_dom.hdr);
 	mon_comp = l3_dom->mon_comp[eventid];
 
 	if (eventid != QOS_L3_OCCUP_EVENT_ID)
@@ -542,7 +542,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 			   enum resctrl_event_id eventid, u64 *val)
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
-	struct mpam_resctrl_dom *l3_dom;
+	struct mpam_resctrl_mon_dom *l3_dom;
 	struct mpam_component *mon_comp;
 
 	if (!mpam_is_enabled())
@@ -551,7 +551,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
 		return -EINVAL;
 
-	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
+	l3_dom = container_of(d, struct mpam_resctrl_mon_dom, resctrl_mon_dom);
 	mon_comp = l3_dom->mon_comp[eventid];
 
 	return read_mon_cdp_safe(mon, mon_comp, mpam_feat_msmon_mbwu,
@@ -599,7 +599,7 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 			     enum resctrl_event_id eventid)
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
-	struct mpam_resctrl_dom *l3_dom;
+	struct mpam_resctrl_mon_dom *l3_dom;
 	struct mpam_component *mon_comp;
 
 	if (!mpam_is_enabled())
@@ -608,7 +608,7 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
 		return;
 
-	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
+	l3_dom = container_of(d, struct mpam_resctrl_mon_dom, resctrl_mon_dom);
 	mon_comp = l3_dom->mon_comp[eventid];
 
 	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
@@ -1638,7 +1638,7 @@ static int mpam_resctrl_setup_ctrl_domain(unsigned int cpu,
 
 static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
 					 struct rdt_resource *r,
-					 struct mpam_resctrl_dom *dom)
+					 struct mpam_resctrl_mon_dom *dom)
 {
 	struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
 	struct mpam_component *any_mon_comp = NULL;
@@ -1681,53 +1681,6 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
 	return 0;
 }
 
-static void mpam_resctrl_alloc_domain(unsigned int cpu,
-				      struct mpam_resctrl_res *res)
-{
-	int err;
-	struct mpam_resctrl_dom *dom;
-	struct mpam_class *class = res->class;
-	struct mpam_component *comp;
-	struct rdt_resource *r = &res->resctrl_res;
-
-	lockdep_assert_held(&domain_list_lock);
-
-	comp = find_component(class, cpu);
-	/* class has no component for this CPU */
-	if (WARN_ON_ONCE(!comp))
-		return;
-
-	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
-	if (!dom)
-		return;
-
-	if (r->alloc_capable) {
-		err = mpam_resctrl_setup_ctrl_domain(cpu, r, comp, dom);
-		if (err)
-			goto free_domain;
-	} else {
-		pr_debug("Skipped control domain online - no controls\n");
-	}
-
-	if (r->mon_capable) {
-		err = mpam_resctrl_setup_mon_domain(cpu, r, dom);
-		if (err)
-			goto offline_ctrl_domain;
-	} else {
-		pr_debug("Skipped monitor domain online - no monitors\n");
-	}
-
-	return;
-
-offline_ctrl_domain:
-	if (r->alloc_capable) {
-		mpam_resctrl_offline_domain_hdr(cpu, &dom->resctrl_ctrl_dom.hdr);
-		resctrl_offline_ctrl_domain(r, &dom->resctrl_ctrl_dom);
-	}
-free_domain:
-	kfree(dom);
-}
-
 /*
  * We know all the monitors are associated with the L3, even if there are no
  * controls and therefore no control component. Find the cache-id for the CPU
@@ -1735,10 +1688,10 @@ static void mpam_resctrl_alloc_domain(unsigned int cpu,
  * This relies on mpam_resctrl_pick_domain_id() using the L3 cache-id
  * for anything that is not a cache.
  */
-static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
+static struct mpam_resctrl_mon_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
 {
 	int cache_id;
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_mon_dom *dom;
 	struct mpam_resctrl_res *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3];
 
 	lockdep_assert_cpus_held();
@@ -1758,7 +1711,7 @@ static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
 }
 
 static struct mpam_resctrl_dom *
-mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
+mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 {
 	struct mpam_resctrl_dom *dom;
 	struct rdt_resource *r = &res->resctrl_res;
@@ -1770,11 +1723,97 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 			return dom;
 	}
 
-	if (r->rid != RDT_RESOURCE_L3)
-		return NULL;
+	return NULL;
+}
+
+static void mpam_resctrl_add_cpu_ctrl_domain(unsigned int cpu,
+					     struct mpam_resctrl_res *res)
+{
+	struct rdt_resource *r = &res->resctrl_res;
+	struct mpam_resctrl_dom *dom;
+	struct mpam_component *comp;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, res);
+	if (dom) {
+		mpam_resctrl_online_domain_hdr(cpu, &dom->resctrl_ctrl_dom.hdr);
+		return;
+	}
+
+	comp = find_component(res->class, cpu);
+	/* class has no component for this CPU */
+	if (WARN_ON_ONCE(!comp))
+		return;
+
+	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
+	if (!dom)
+		return;
 
-	/* Search the mon domain list too - needed on monitor only platforms. */
-	return mpam_resctrl_get_mon_domain_from_cpu(cpu);
+	if (mpam_resctrl_setup_ctrl_domain(cpu, r, comp, dom))
+		kfree(dom);
+}
+
+static void mpam_resctrl_add_cpu_mon_domain(unsigned int cpu,
+					    struct mpam_resctrl_res *res)
+{
+	struct rdt_resource *r = &res->resctrl_res;
+	struct mpam_resctrl_mon_dom *dom;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	dom = mpam_resctrl_get_mon_domain_from_cpu(cpu);
+	if (dom) {
+		mpam_resctrl_online_domain_hdr(cpu, &dom->resctrl_mon_dom.hdr);
+		return;
+	}
+
+	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
+	if (!dom)
+		return;
+
+	if (mpam_resctrl_setup_mon_domain(cpu, r, dom))
+		kfree(dom);
+}
+
+static void mpam_resctrl_remove_cpu_ctrl_domain(unsigned int cpu,
+						struct mpam_resctrl_res *res)
+{
+	struct rdt_resource *r = &res->resctrl_res;
+	struct mpam_resctrl_dom *dom;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	/* The domain may be missing if its setup failed. */
+	dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, res);
+	if (!dom)
+		return;
+
+	if (!mpam_resctrl_offline_domain_hdr(cpu, &dom->resctrl_ctrl_dom.hdr))
+		return;
+
+	resctrl_offline_ctrl_domain(r, &dom->resctrl_ctrl_dom);
+	kfree(dom);
+}
+
+static void mpam_resctrl_remove_cpu_mon_domain(unsigned int cpu,
+					       struct mpam_resctrl_res *res)
+{
+	struct rdt_resource *r = &res->resctrl_res;
+	struct mpam_resctrl_mon_dom *dom;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	/* The domain may be missing if its setup failed. */
+	dom = mpam_resctrl_get_mon_domain_from_cpu(cpu);
+	if (!dom)
+		return;
+
+	if (!mpam_resctrl_offline_domain_hdr(cpu, &dom->resctrl_mon_dom.hdr))
+		return;
+
+	resctrl_offline_mon_domain(r, &dom->resctrl_mon_dom.hdr);
+	kfree(dom);
 }
 
 void mpam_resctrl_online_cpu(unsigned int cpu)
@@ -1784,33 +1823,21 @@ void mpam_resctrl_online_cpu(unsigned int cpu)
 
 	guard(mutex)(&domain_list_lock);
 	for_each_mpam_resctrl_control(res, rid) {
-		struct mpam_resctrl_dom *dom;
 		struct rdt_resource *r = &res->resctrl_res;
 
 		if (!res->class)
 			continue;	// dummy_resource;
 
-		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
-		if (!dom) {
-			/*
-			 * On failure the CPU is left without a domain for this
-			 * resource, which mpam_resctrl_offline_cpu() tolerates.
-			 * resctrl_online_cpu() still adds the CPU to the default
-			 * group because the CPU is online and runs tasks.
-			 */
-			mpam_resctrl_alloc_domain(cpu, res);
-		} else {
-			if (r->alloc_capable) {
-				struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
-
-				mpam_resctrl_online_domain_hdr(cpu, &ctrl_d->hdr);
-			}
-			if (r->mon_capable) {
-				struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
-
-				mpam_resctrl_online_domain_hdr(cpu, &mon_d->hdr);
-			}
-		}
+		/*
+		 * A domain that fails to be set up leaves the CPU without that
+		 * domain, which mpam_resctrl_offline_cpu() tolerates.
+		 * resctrl_online_cpu() still adds the CPU to the default group
+		 * because the CPU is online and runs tasks.
+		 */
+		if (r->alloc_capable)
+			mpam_resctrl_add_cpu_ctrl_domain(cpu, res);
+		if (r->mon_capable)
+			mpam_resctrl_add_cpu_mon_domain(cpu, res);
 	}
 
 	resctrl_online_cpu(cpu);
@@ -1825,40 +1852,15 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 
 	guard(mutex)(&domain_list_lock);
 	for_each_mpam_resctrl_control(res, rid) {
-		struct mpam_resctrl_dom *dom;
-		struct rdt_l3_mon_domain *mon_d;
-		struct rdt_ctrl_domain *ctrl_d;
-		bool ctrl_dom_empty, mon_dom_empty;
 		struct rdt_resource *r = &res->resctrl_res;
 
 		if (!res->class)
 			continue;	// dummy resource
 
-		/* The domain may be missing if its setup failed. */
-		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
-		if (!dom)
-			continue;
-
-		if (r->alloc_capable) {
-			ctrl_d = &dom->resctrl_ctrl_dom;
-			ctrl_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
-			if (ctrl_dom_empty)
-				resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl_d);
-		} else {
-			ctrl_dom_empty = true;
-		}
-
-		if (r->mon_capable) {
-			mon_d = &dom->resctrl_mon_dom;
-			mon_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
-			if (mon_dom_empty)
-				resctrl_offline_mon_domain(&res->resctrl_res, &mon_d->hdr);
-		} else {
-			mon_dom_empty = true;
-		}
-
-		if (ctrl_dom_empty && mon_dom_empty)
-			kfree(dom);
+		if (r->alloc_capable)
+			mpam_resctrl_remove_cpu_ctrl_domain(cpu, res);
+		if (r->mon_capable)
+			mpam_resctrl_remove_cpu_mon_domain(cpu, res);
 	}
 }
 
-- 
2.55.0


