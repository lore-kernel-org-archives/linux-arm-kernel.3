Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886260A2615
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NHiIJG7T;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H/YvZVWV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FPJ2/D1pxAq4Poeoujsv1hkt1afRQIoxiL4Q5tPTKs=; b=NHiIJG7Te7Y9AYQT2Uhs9AviHn
	3ygQciUPZNMkHqeS05OzjU5yLoYCDI6VglCI0St4jR+QZeKrdUdWPj+7pfr4qkhkzBiMor0J+GcJ2
	yUk2+neS9PQ6/7CAmIKPCUalQlmUTVQRhaCYI83xo2m9LCEDUOG50LTQw+rZJRuAtEBIUjyMEDEbG
	vs9KEml944Et9VXRObYzhYYyvbVCTUcjj4UF6redkbd8YvC9RKjsNR2P2Lwqpe0iYvrrx1yJ8Wu/Q
	UxNnIPE4RjQl+fTO3y71Zc3g3XNhjza6LphagqxPxMTUHWqFfDl7VpMxdyjY+lH/cPl5lU6/ermmH
	SRz32Asg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWl-00000008S6j-1cxl;
	Mon, 19 Oct 2026 22:08:19 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWU-00000008RuD-2GcO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447683; x=1823983683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KvuwGj3mCzkgntkJ/PO10vy/kUzqNCehZSltuxALbMQ=;
  b=H/YvZVWV17iSyb6zjO+qcbrq+er3PQYvNVDNwnpegiYQXiBfLf/Uh4yE
   vY9+4tKyEkx/bI4mzhXTqQq1a/ey4eSXPf0cE11EmAfGPq131CZem+mIq
   buNlNmmaPDxGkByJsxpYIWnV4doMGPKUBH9O72aGKof+kI36V/zpNf6pS
   DnfruFPJCdWHmRnHJ9RaLhPFJ/iP4MGhPSLbfw7inBV4jah4ssVFb+IyM
   7xlNgrbhKFhG6QU9N9Pfi0skj2AwelhWkIEx4DcbUPSnZ/VNUq1zX7oVu
   ls09KVHtaMllYjqU+hEFNiw9/gC7RpRO7ddmkQNbgSwNPhM17R5RwGLiW
   A==;
X-CSE-ConnectionGUID: AwxpksI2RPCeHVepvlWw/w==
X-CSE-MsgGUID: AgrWJR+XQPK5pbSMvW1Tcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144235"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144235"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:08:00 -0700
X-CSE-ConnectionGUID: 2HgFPwesQ3mnqgPk7B8PGg==
X-CSE-MsgGUID: 0pmN44VhS1WMVZx5J3l3qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708352"
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
Subject: [RFC PATCH v2 09/10] arm_mpam: resctrl: Require monitoring components to cover the same CPUs
Date: Mon, 19 Oct 2026 15:07:43 -0700
Message-ID: <a5509d45ef186a273dfc07fdcaae82998a5a4ce6.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
References: <cover.1792443633.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_150802_623852_9105546F 
X-CRM114-Status: GOOD (  11.77  )
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

A monitoring domain records the component that backs each of its
monitoring events and takes its ID from one of these components. The
domain represents the CPUs of one L3 cache, while each event's counters
are read from the event's own component.

If the components of a monitoring domain covered different CPUs, the
counts of an event would not belong to the CPUs that the domain
represents. This is not expected to happen: every class picked for
monitoring covers all CPUs and has components that correspond to the
L3 caches.

Fail setting up the monitoring domain, with a warning, if the components
backing its events do not all cover the same CPUs. Compare each
component with the one found before it, instead of naming the events,
so that the check applies to any monitoring event.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_resctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 36a924734484..c3ea61a40bb2 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1664,6 +1664,12 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
 		if (WARN_ON_ONCE(!mon_comp))
 			return -EFAULT;
 
+		/* All components of a monitoring domain cover the same CPUs */
+		if (WARN_ON_ONCE(any_mon_comp &&
+				 !cpumask_equal(&any_mon_comp->affinity,
+						&mon_comp->affinity)))
+			return -EFAULT;
+
 		dom->mon_comp[eventid] = mon_comp;
 		any_mon_comp = mon_comp;
 	}
-- 
2.55.0


