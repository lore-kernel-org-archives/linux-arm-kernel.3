Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21139C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utJMkJZ9Gl5P1DrxVDG/0o+Zv8qkpo1fMxwwRlX4UR4=; b=Lyx0gHpPlkMn6l40PTwsp724yW
	ko2Vpl2kiZ8Fg0UlP5tesHVepihghMUmLVxpjJzfjxLvB5/+pJrRxa723xdUB/MQokwTwTwS0H/WQ
	8xEJNBLFE9tqrQbXSnioSXMVVTQliPRzejFR/oE6h1tHAHicnhKVmMVqrnj6XMeGj/EQPtFlNYEUU
	oh9klBS66UibesloK+fIPZ6cSONCNrhvfT+qw5lppeEVMTXliuc/sZ0FC7gPbGRSxTsdqTtuQiKRD
	IVKvXipBBabvK/Jph6oy2Bv7oD+AZqU1MCpKwr7B75U8UdgsvNuEfTVeHxFankfMDuvbmRstRxg4e
	tZw4OD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttApM-0000000F8Zk-1oJT;
	Fri, 14 Mar 2025 19:36:16 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAik-0000000F74r-05kk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 19:29:27 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7AC4F203345B;
	Fri, 14 Mar 2025 12:29:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7AC4F203345B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741980564;
	bh=utJMkJZ9Gl5P1DrxVDG/0o+Zv8qkpo1fMxwwRlX4UR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LJHeMn5yTvvBeQxzdXDTwSuQizpptvJ+Kxp/xmBk/lsEbzFRS7ETcGe8ZOP744RJ+
	 XEelsIIyeM2OzNUwiSuNWnVnmcDVt/YIGUPlmgXjMjIUyk3NOYuCbk3rUkXKFozzRg
	 l0j5z1FyepIE2G2v6FP0NcaDSOUzzfOwovKQeIsM=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com,
	ltykernel@gmail.com,
	stanislav.kinsburskiy@gmail.com,
	linux-acpi@vger.kernel.org,
	eahariha@linux.microsoft.com,
	jeff.johnson@oss.qualcomm.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com,
	gregkh@linuxfoundation.org,
	vkuznets@redhat.com,
	prapal@linux.microsoft.com,
	anrayabh@linux.microsoft.com,
	rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net
Subject: [PATCH v6 04/10] hyperv: Introduce hv_recommend_using_aeoi()
Date: Fri, 14 Mar 2025 12:28:50 -0700
Message-Id: <1741980536-3865-5-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122926_102157_3B765B29 
X-CRM114-Status: GOOD (  10.41  )
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

Factor out the check for enabling auto eoi, to be reused in root
partition code.

No functional changes.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Tianyu Lan <tiala@microsoft.com>
---
 drivers/hv/hv.c                | 12 +-----------
 include/asm-generic/mshyperv.h | 13 +++++++++++++
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index a38f84548bc2..308c8f279df8 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -313,17 +313,7 @@ void hv_synic_enable_regs(unsigned int cpu)
 
 	shared_sint.vector = vmbus_interrupt;
 	shared_sint.masked = false;
-
-	/*
-	 * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
-	 * it doesn't provide a recommendation flag and AEOI must be disabled.
-	 */
-#ifdef HV_DEPRECATING_AEOI_RECOMMENDED
-	shared_sint.auto_eoi =
-			!(ms_hyperv.hints & HV_DEPRECATING_AEOI_RECOMMENDED);
-#else
-	shared_sint.auto_eoi = 0;
-#endif
+	shared_sint.auto_eoi = hv_recommend_using_aeoi();
 	hv_set_msr(HV_MSR_SINT0 + VMBUS_MESSAGE_SINT, shared_sint.as_uint64);
 
 	/* Enable the global synic bit */
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index c3697bc0598d..8519b8ec8e9d 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -77,6 +77,19 @@ u64 hv_do_fast_hypercall16(u16 control, u64 input1, u64 input2);
 bool hv_isolation_type_snp(void);
 bool hv_isolation_type_tdx(void);
 
+/*
+ * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
+ * it doesn't provide a recommendation flag and AEOI must be disabled.
+ */
+static inline bool hv_recommend_using_aeoi(void)
+{
+#ifdef HV_DEPRECATING_AEOI_RECOMMENDED
+	return !(ms_hyperv.hints & HV_DEPRECATING_AEOI_RECOMMENDED);
+#else
+	return false;
+#endif
+}
+
 static inline struct hv_proximity_domain_info hv_numa_node_to_pxm_info(int node)
 {
 	struct hv_proximity_domain_info pxm_info = {};
-- 
2.34.1


