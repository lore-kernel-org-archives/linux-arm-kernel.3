Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2D0C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qc/z08ExsJyIu88EFEAHOCkeHkLHzt2LylI3NJm6ee4=; b=cpITnVg8zPRkBQFdQOMG5/lKKO
	j9SR40U4QcBEXSnyT2fdk9T6t5cvoa3BxYe8njAP9mUaqVnIcFfr8CiVNV8POxeL+Q9CaGY4L4y8o
	rzYCQWlhOesFQG78UvR5Oog7uuXFxCcfwiFnI1psijfiJnRBSn6OOxmJdlpeGdCJkN3qT0WQg8W2G
	+dTt5PLwGpv/FE8QOd5QAsfAZ9MNRTYvYKdmjYWl0/VCxobmsf5aP20D0ufRoY2deZDTGIIGoHuFh
	6JQZRYgUNvJ0Mmjx13xtYNxLtn/rzGJFl9kcOQVkvSsf0ZWQY1zrnC7rfKuGu2NvnRRMKgb87SSvb
	DdWC/szg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54Eu-0000000HEkC-2bcf;
	Fri, 11 Sep 2026 16:36:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54Ep-0000000HEiC-3zfV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:36:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 184702BCA;
	Fri, 11 Sep 2026 09:36:27 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C94F83F7B4;
	Fri, 11 Sep 2026 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789144590; bh=H44AQj3oR+IQy3azOI/ivx0DJ8iUEA1Ay8aEgAaMp74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pfrvmLHiSYUABsaFb68pCpbuD023bLB6gCZD5YWYKCuD1M3jlOlxGyWLhbzR94u8e
	 anRMEe7HXVJR66B+h1MQOuMDFkaNbC9HXaPVMPlJl9ohbaBgXg9dtX1BCiii3AUwa2
	 QDK0M8jSxKR3P0gkpfku2Y1tYYd84EXsX1pv9xWU=
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
	dave.martin@arm.com,
	Dave Martin <Dave.Martin@arm.com>,
	Ben Horgan <Ben.Horgan@arm.com>
Subject: [PATCH v6 3/3] fs/resctrl: Factor MBA parse-time conversion to be per-arch
Date: Fri, 11 Sep 2026 17:36:13 +0100
Message-ID: <20260911163613.1131447-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911163613.1131447-1-ben.horgan@arm.com>
References: <20260911163613.1131447-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_093632_097162_7034AECF 
X-CRM114-Status: GOOD (  17.60  )
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

The control value parser for the MB resource currently coerces the memory
bandwidth percentage value from userspace to be an exact multiple of the
rdt_resource::resctrl_membw::bw_gran parameter.

On MPAM systems, this results in somewhat worse-than-worst-case rounding, since
the bandwidth granularity advertised to resctrl by the MPAM driver is in general
only an approximation to the actual hardware granularity on these systems, and
the hardware bandwidth allocation control value is not natively a percentage --
necessitating a further conversion in the resctrl_arch_update_domains() path,
regardless of the conversion done at parse time.

For MPAM and x86 use their custom pre-prepared parse-time conversion,
resctrl_arch_preconvert_bw(). This will avoid accumulated error from rounding
the value twice on MPAM systems. For x86 systems there is no functional change.

Clarify the documentation, but avoid overly exact promises.

Clamping to bw_min and bw_max still feels generic: leave it in the core code,
for now.

[ BH: Split out x86 specific changes ]
Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Ben Horgan <Ben.Horgan@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes since v3:
Parameter order swap (Reinette)
Reflow commit message to use 80 characters (Reinette)
Adjust comment line length (Reinette)
Add Reinette's R-b

Changes since v4:
Make Dave the author as he wrote the patch

Changes since v5:
Document that the rounding can be up or down
---
 Documentation/filesystems/resctrl.rst | 17 +++++++++--------
 fs/resctrl/ctrlmondata.c              |  6 +++---
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..dd4f80da419c 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -236,12 +236,11 @@ with respect to allocation:
 		user can request.
 
 "bandwidth_gran":
-		The granularity in which the memory bandwidth
-		percentage is allocated. The allocated
-		b/w percentage is rounded off to the next
-		control step available on the hardware. The
-		available bandwidth control steps are:
-		min_bandwidth + N * bandwidth_gran.
+		The approximate granularity in which the memory bandwidth
+		percentage is allocated. The allocated bandwidth percentage is
+		rounded up or down to the closest control step available on the
+		hardware. The available hardware steps are no larger than this
+		value.
 
 "delay_linear":
 		Indicates if the delay scale is linear or
@@ -881,8 +880,10 @@ The minimum bandwidth percentage value for each cpu model is predefined
 and can be looked up through "info/MB/min_bandwidth". The bandwidth
 granularity that is allocated is also dependent on the cpu model and can
 be looked up at "info/MB/bandwidth_gran". The available bandwidth
-control steps are: min_bw + N * bw_gran. Intermediate values are rounded
-to the next control step available on the hardware.
+control steps are, approximately, min_bw + N * bw_gran.  The steps may
+appear irregular due to rounding to an exact percentage: bw_gran is the
+maximum interval between the percentage values corresponding to any two
+adjacent steps in the hardware.
 
 The bandwidth throttling is a core specific mechanism on some of Intel
 SKUs. Using a high bandwidth and a low bandwidth setting on two threads
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 18ec9f564b5a..cafebdff70dc 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -37,8 +37,8 @@ typedef int (ctrlval_parser_t)(struct rdt_parse_data *data,
 /*
  * Check whether MBA bandwidth percentage value is correct. The value is
  * checked against the minimum and max bandwidth values specified by the
- * hardware. The allocated bandwidth percentage is rounded to the next
- * control step available on the hardware.
+ * hardware. The allocated bandwidth percentage is converted as appropriate
+ * for consumption by the specific hardware driver.
  */
 static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
 {
@@ -71,7 +71,7 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
 		return false;
 	}
 
-	*data = roundup(bw, (unsigned long)r->membw.bw_gran);
+	*data = resctrl_arch_preconvert_bw(r, bw);
 	return true;
 }
 
-- 
2.43.0


