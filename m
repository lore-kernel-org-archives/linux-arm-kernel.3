Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06B060A2614
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EpO+HDgM;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OmgMjm2y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmvPvy7wScLRYtqMkY4+Tm3OePeY/cW3tPHkEV2hUgo=; b=EpO+HDgM+U7GHX6UP6Ebmdooo+
	ZZ2slj1uSghYrlNDnMK0IR7z/mMoVjmxlL3Tyl1FbikcIvnalicrTKufWmw3k3F/STIoTadzGJn4i
	pf3AAJjN8Md6fxm2PAxLDn1ZSKtdfNQr785KJSjHaKZRNAddlgmQWM1h/tt5fo6zdcMVP6eKdD/v8
	H2XLoUvK692CSi1XI2yVhicAvRwiHdKCeto+8IRU5jIHhb6Cja/G9TYEkwsHE6qBfUbL81vdbp63s
	B4xXRveORQH4gdCjQTvWxDVGX6LWw8ymSw/wlUdcTth3hwB8vxFPz/u9sqq5BIXBteBUnT6cPkEbb
	Sr0qX+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWk-00000008S5F-3jkf;
	Mon, 19 Oct 2026 22:08:18 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWT-00000008RuD-0wr8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447682; x=1823983682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5RfTFi+N71Ke05IbYs3L+ISDh0WG5qWpJ+Iq5wDoW0g=;
  b=OmgMjm2y1eV/Lm13TFCSUNbPedtQAPJE990I6GT+rrZjcwP6FZpsvQEf
   yDwFTCOTvLTC8HkStaisrcRPDIwl/hqF3bH8thtLBkfOHfdB1f5GLSK6F
   Hezse3efjYoMtXWt0jv9w9YjxZIZQNZ4Z7hCW7/1vayQqAkprdNVdS7Qm
   BioSR3pl4W6ElNdW2+SfBpgdpZy3yE7F7OvI3c++WaNy9aGRE7UBCxE2H
   G34Un5A+z2jMTDS4WAlZbV0+f65PSTOWbAAfgeXzq/kxnzIxCz4oMgFaU
   C0LdHMGLFPERaEIv7W3MGVj6Zr9NFdP5v7IPbLCdePrjGObous/JonXiv
   A==;
X-CSE-ConnectionGUID: h9rQKeZnTQiGeMntsCAbDw==
X-CSE-MsgGUID: w/L6t17DRq2D5JkThX4ibQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144213"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:59 -0700
X-CSE-ConnectionGUID: fTzmgTSwQzStEjjpFfExRA==
X-CSE-MsgGUID: R4UYyVRER3yORRGpqCs4PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708343"
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
Subject: [RFC PATCH v2 06/10] arm_mpam: resctrl: Rename struct mpam_resctrl_dom to mpam_resctrl_ctrl_dom
Date: Mon, 19 Oct 2026 15:07:40 -0700
Message-ID: <fe38eaea025896ace1baa536fa8e73b409f22b9a.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
References: <cover.1792443633.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_150801_277756_CFADD945 
X-CRM114-Status: GOOD (  12.71  )
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

struct mpam_resctrl_dom holds the control domain of a resource, while
its monitoring domain is held by struct mpam_resctrl_mon_dom. Unlike the
name of the monitoring structure, the name struct mpam_resctrl_dom does
not say which kind of domain the structure holds.

Rename it to struct mpam_resctrl_ctrl_dom to match its monitoring
counterpart.

No functional change.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_internal.h |  2 +-
 drivers/resctrl/mpam_resctrl.c  | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1df439ecb055..dc304e4e0dc0 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -432,7 +432,7 @@ struct mpam_msc_ris {
 	struct mpam_garbage	garbage;
 };
 
-struct mpam_resctrl_dom {
+struct mpam_resctrl_ctrl_dom {
 	struct mpam_component		*ctrl_comp;
 	struct rdt_ctrl_domain		resctrl_ctrl_dom;
 };
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index ce5519635c51..022920be1862 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1375,7 +1375,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	struct mpam_config *cfg;
 	struct mpam_props *cprops;
 	struct mpam_resctrl_res *res;
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_ctrl_dom *dom;
 	enum mpam_device_features configured_by;
 
 	lockdep_assert_cpus_held();
@@ -1384,7 +1384,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		return resctrl_get_default_ctrl(r);
 
 	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
-	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
+	dom = container_of(d, struct mpam_resctrl_ctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
 	/*
@@ -1435,7 +1435,7 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	struct mpam_config cfg;
 	struct mpam_props *cprops;
 	struct mpam_resctrl_res *res;
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_ctrl_dom *dom;
 
 	lockdep_assert_cpus_held();
 	lockdep_assert_irqs_enabled();
@@ -1448,7 +1448,7 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	 * resctrl_arch_update_domains() relies on this.
 	 */
 	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
-	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
+	dom = container_of(d, struct mpam_resctrl_ctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
 	if (mpam_resctrl_hide_cdp(r->rid))
@@ -1618,7 +1618,7 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 static int mpam_resctrl_setup_ctrl_domain(unsigned int cpu,
 					  struct rdt_resource *r,
 					  struct mpam_component *comp,
-					  struct mpam_resctrl_dom *dom)
+					  struct mpam_resctrl_ctrl_dom *dom)
 {
 	struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
 	int err;
@@ -1710,10 +1710,10 @@ static struct mpam_resctrl_mon_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu
 	return NULL;
 }
 
-static struct mpam_resctrl_dom *
+static struct mpam_resctrl_ctrl_dom *
 mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 {
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_ctrl_dom *dom;
 	struct rdt_resource *r = &res->resctrl_res;
 
 	lockdep_assert_cpus_held();
@@ -1730,7 +1730,7 @@ static void mpam_resctrl_add_cpu_ctrl_domain(unsigned int cpu,
 					     struct mpam_resctrl_res *res)
 {
 	struct rdt_resource *r = &res->resctrl_res;
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_ctrl_dom *dom;
 	struct mpam_component *comp;
 
 	lockdep_assert_held(&domain_list_lock);
@@ -1780,7 +1780,7 @@ static void mpam_resctrl_remove_cpu_ctrl_domain(unsigned int cpu,
 						struct mpam_resctrl_res *res)
 {
 	struct rdt_resource *r = &res->resctrl_res;
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_ctrl_dom *dom;
 
 	lockdep_assert_held(&domain_list_lock);
 
-- 
2.55.0


