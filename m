Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4204C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9FTOmDvM/22aM4A37XAnkAQcgEtKq8WEgWRcxg037A=; b=tT7MB9G8ztZDSOQHHu2E0GfT1V
	RwSjPxpQyQDrS3h40wArn+MU2udLxAIsqbIIbGD3PzWBiLOfGt0BNa1o3+wtcrIA7nVvUewMBpGn4
	iAjbdtc0RoHAohfLbIZA5OTpIGna3JwIpC4pNJQpiUeIZZbcTH4v1endDjXFfeQb9U694Qa+5EuIz
	8za/bT9MfEreYzWIKY9gJAQjUtHRCMkMFu7elZZFTxAr5US7/ARW6qTtaXt1h9p1WMwo42ENln/G1
	LB3H9fG077xqBQAkBZ8/1AmJojV9uBzQOKP/DvxuqT2VDGq1T7cq3dtAAbak+S2wr9EI+wbXmpiZE
	dY5Y7FjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54Eu-0000000HEjY-1j2z;
	Fri, 11 Sep 2026 16:36:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54En-0000000HEgw-3RRE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:36:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D60EE2BC4;
	Fri, 11 Sep 2026 09:36:22 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C270E3F7B4;
	Fri, 11 Sep 2026 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789144586; bh=837kUJ2DyBJdMsn+nQT0dd7XZOMmGqzBv2yaOYUE7uA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b6V1RQ9wo9ljg176S810jYUqivES+ifCOupiE7XDB7I3hVEFWaB1Tgp37UWxrH+fA
	 dNFL/GTEtQsC7sMzpPYWzAoumQsGssDncEqIg9BQmvgqaouC04o18bUEJud2PHau06
	 SNBMKxi4gLf3u5P2ZyY3XoegjNe3x/DI5WG28RuU=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	dave.martin@arm.com
Subject: [PATCH v6 1/3] x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
Date: Fri, 11 Sep 2026 17:36:11 +0100
Message-ID: <20260911163613.1131447-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911163613.1131447-1-ben.horgan@arm.com>
References: <20260911163613.1131447-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_093629_957221_0BCB4040 
X-CRM114-Status: GOOD (  17.17  )
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

From: Dave Martin <dave.martin@arm.com>

On MPAM systems the rounding behaviour of the MBA control would be improved
if the rounding in the fs/resctrl code is removed but this is not the
case for x86. To allow any rounding or conversion of the bandwidth value
provided by the user to be specified by the arch code a new arch hook is
required.

Introduce resctrl_arch_preconvert_bw(), and add its x86 implementation.
This is currently unused in resctrl but when plumbed in it will replace the
call to roundup() in bw_validate().

Signed-off-by: Dave Martin <dave.martin@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes since Dave's v2:
Split from larger patch and add commit message
Update kernel-doc (Reinette)

Changes since v3:
Swap parameter order (Reinette)
Change summary prefix include fs/resctrl (Reinette)
val -> @val
Add Reinette's R-b

Changes since v4:
Set author to Dave as he wrote the patch
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
 include/linux/resctrl.h                   | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index e74f1ed54b86..62044489b052 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -16,9 +16,15 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <linux/cpu.h>
+#include <linux/math.h>
 
 #include "internal.h"
 
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val)
+{
+	return roundup(val, (unsigned long)r->membw.bw_gran);
+}
+
 int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
 {
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index dd09c2ce9a0f..10dfdca7f4bf 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -505,6 +505,25 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
  */
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
 
+/**
+ * resctrl_arch_preconvert_bw() - Prepare bandwidth control value for arch use.
+ * @r:		Resource whose schema was written.
+ * @val:	Bandwidth control value written to the schemata file by userspace.
+ *
+ * Convert the user provided bandwidth control value to an appropriate form for
+ * consumption by the hardware driver for resource @r. Converted value is stored
+ * in rdt_ctrl_domain::staged_config[] for later consumption by
+ * resctrl_arch_update_domains(). Is not called when MBA software controller is
+ * enabled.
+ *
+ * Architectures for which this pre-conversion hook is not useful should supply
+ * an implementation of this function that just returns @val unmodified.
+ *
+ * Return:
+ * The converted value.
+ */
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val);
+
 /*
  * Update the ctrl_val and apply this config right now.
  * Must be called on one of the domain's CPUs.
-- 
2.43.0


