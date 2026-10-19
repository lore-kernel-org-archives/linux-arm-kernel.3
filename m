Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E65606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pH7v8vx0;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l7YdnJ9r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEnfh9dB8CZN9wOKO/BO/QyAEitVOeSygcI3jJ2ugug=; b=pH7v8vx0iRU7c5uzzU2tzej+ao
	WSKJMwjgNjZYrFH/xxdnFRNrIwJsetGngTFCq5BqpfHSYUwsbuZEwgVlS/RMvHrSIXweDlES8uphh
	MkRHcWhtcPyXMkvvrtK+YPS3O81mkYp/DDbeFpb5eNpq/8BMzH+NXtun7IfF6UqZGy6hLCKclmCtI
	MQXKQXeeMf9N1W7Elf/C/PJ7GfsFumeXwzGmu6prItZfnaaKlfCkW5CYnKY3u8QLBQ8eP23yaBBxS
	qJvI8X+MPSGE96xmkPLZtlOURcX3DBDIlvEZTsvgQW2b1sHqKY6ntPZB4wi1qYP+F3bih4Jv5iUpd
	C9dwotDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWl-00000008S6B-0qLE;
	Mon, 19 Oct 2026 22:08:19 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWU-00000008RtY-2nvV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447683; x=1823983683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K158NP7KXwoHv/mYHuzVJWjCNSLVTUMArbIKw0y5PfE=;
  b=l7YdnJ9r6SD06qSPc10xShMKD2MIV5Xp+gaWAbp3DJ2RH9rS5l7dFYk7
   YaaMW9pkd7mLfGzfUMMT6vnVRYF9uX2VeJSfgBFOm2n1znwz4eHGW/6dj
   /RoisAsUsg1zKyp16DuoJJ63UWY/4R9qDBh8U56VNVzGCeq4rPyreuxno
   bVymm/XYmsV07k0o+FK/Ui/TmkgYvpF707h/+uVuA1xIEwPjeFXWEap44
   8q7ZilkaOGJ496xRLNK7YiQp3h74YQlNh4/1Q26p5/YbcgH9bpg0H0mzS
   294LABPU1BghkdI+/NNyz//f5Zk4OaQvBWcnyRc6jof9bteor5b1qzBZz
   g==;
X-CSE-ConnectionGUID: eiM1d5vOR+arXnto7cYsbQ==
X-CSE-MsgGUID: e86iPjxRTn+dme3yIN+Z8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144242"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144242"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:08:00 -0700
X-CSE-ConnectionGUID: fM/1IehZSeqREYasocEd7Q==
X-CSE-MsgGUID: 12qscziNQXSJyRoDpGDg1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708355"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:08:00 -0700
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
Subject: [RFC PATCH v2 10/10] arm_mpam: resctrl: Update the comment on monitoring domain setup
Date: Mon, 19 Oct 2026 15:07:44 -0700
Message-ID: <f6080eca2696f4a06777725854447a563aa29696.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
References: <cover.1792443633.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_150802_757862_2F8A89A3 
X-CRM114-Status: GOOD (  14.47  )
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

The comment in mpam_resctrl_setup_mon_domain() explains that the L3
component IDs need to be used for a monitoring domain because there may
be no control component for the L3. It also describes searching each
event's class for a component with overlapping CPUs.

Neither matches the code. The monitoring domain has its own structure
and is set up independently of the control domain, so whether a control
component exists has no bearing on it. Each event's class must have a
component that contains the CPU, and all components of the domain must
cover the same CPUs, which is stricter than overlapping.

Rewrite the comment to say where the domain's ID comes from and what is
required of the components that back the domain's events.

No functional change.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
Note to maintainers: This comment update is kept as a separate patch to
make it easy to review. It can be folded into "arm_mpam: resctrl: Give
the monitoring domain its own structure" and "arm_mpam: resctrl: Require
monitoring components to cover the same CPUs" if preferred.
---
 drivers/resctrl/mpam_resctrl.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index c3ea61a40bb2..61fbde9c0960 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1647,11 +1647,12 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
 	int err;
 
 	/*
-	 * Even if the monitor domain is backed by a different
-	 * component, the L3 component IDs need to be used... only
-	 * there may be no ctrl_comp for the L3.
-	 * Search each event's class list for a component with
-	 * overlapping CPUs and set up the dom->mon_comp array.
+	 * The monitoring domain takes the L3 cache ID as its ID even when its
+	 * events are backed by components of other classes, see
+	 * mpam_resctrl_pick_domain_id().
+	 * Find the component of each event's class that contains the CPU and
+	 * set up the dom->mon_comp array. All these components must cover the
+	 * same CPUs.
 	 */
 
 	for_each_mpam_resctrl_mon(mon, eventid) {
-- 
2.55.0


