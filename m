Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366EF60A2601
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=miWdAHTw;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ydyiVaMJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1YHDYgewgH3kkBgcEGQfKgu9faPwc9O89sxeeR+9zmY=; b=miWdAHTwgTzO+uJQcDAGRNuyZu
	EPV9lyyWhXov1rFNHvCZHOQbLSzFC7WkG72kpKOPAILsiH5s711AXzj66oOxRKnt+B7hLdM3Wunj6
	V9JHX/bZBaRehmiiyCFEHkP4LardPsty5Tm/+8I++vmidijEK8PlDXYVzsg3JpVrWTBZ40uYVLMvA
	5VEVX6d4WL6FvkFVsNX+VQgoQOkYWE9qhCHo3dwIcthETWzcyQHo0AWnMVrz/uUTIzbOmMDPE9Sl0
	WYUEeMmvtD/iUXpuTSIykheQz4wM9+oGY9d+6PosaQhnqJG1sstSklLYKRyvrSKdtcQGl4CqzQEcs
	PPkpVqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPN9-00000009ASk-18u0;
	Thu, 29 Oct 2026 12:36:47 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPN5-00000009APz-37w5;
	Thu, 29 Oct 2026 12:36:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1YHDYgewgH3kkBgcEGQfKgu9faPwc9O89sxeeR+9zmY=;
	b=ydyiVaMJYOA+z7UqhHohtB+XbzYOUQilFJB0lX0WLZJmPWOl6AB/WPJStYvn7F2QHCCO9cwIq
	w0CKbwypH/iBwLa8HteVSrS3hCVj6KN8MRUo2TZvOXth1oc9fc2+iz6pZfh6PGJRpbeKhk7RJTj
	dffJkxfQl38xka821t5i9SI=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHW51fgzcb1J;
	Thu, 29 Oct 2026 20:36:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9D52940538;
	Thu, 29 Oct 2026 20:36:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:38 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 02/19] fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
Date: Thu, 29 Oct 2026 20:35:54 +0800
Message-ID: <20261029123611.1108424-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_053644_169473_06DC5021 
X-CRM114-Status: GOOD (  10.25  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__l3_mon_event_count() reads a single monitor domain. Its only L3-specific
part is the resource id in the domain_header_is_valid() check; the rest
goes through rr->r and the monitor domain, which every monitor resource
uses. Check rr->r->rid instead and rename the helper to
__mon_event_count_one_domain().

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..9dc076f82fa4 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -422,7 +422,7 @@ static void mbm_cntr_free(struct rdt_l3_mon_domain *d, int cntr_id)
 	memset(&d->cntr_cfg[cntr_id], 0, sizeof(*d->cntr_cfg));
 }
 
-static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
+static int __mon_event_count_one_domain(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	int cpu = smp_processor_id();
 	u32 closid = rdtgrp->closid;
@@ -432,7 +432,7 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct mbm_state *m;
 	u64 tval = 0;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3)) {
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid)) {
 		rr->err = -EIO;
 		return -EINVAL;
 	}
@@ -540,7 +540,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	case RDT_RESOURCE_L3:
 		WARN_ON_ONCE(rr->evt->any_cpu);
 		if (rr->hdr)
-			return __l3_mon_event_count(rdtgrp, rr);
+			return __mon_event_count_one_domain(rdtgrp, rr);
 		else
 			return __l3_mon_event_count_sum(rdtgrp, rr);
 	case RDT_RESOURCE_PERF_PKG: {
-- 
2.34.1


