Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC74DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Wj2ugF4n6C55Ao4My0HNfCwkHT/JgqZetZVtKykJY8=; b=N5ZLQirFKWRJhgvgOgdcjJMAO3
	em2tG9v5Ky55fC6MwZtIpzukNxNTQ+GHmIVRHVjzFXxQq81QwLxlD9+ZswPLCRON/oX+jnp2KBgXi
	r7kIJaSaxDZ8xe9G7xKEYAUApyJlrFE6f6QSckgGFGjFP8JWr8s+e/OvClfywENVPXeo6EK2z7tPS
	bCrqIBITq0EBGawYiE/YY4GczRNDP1XnzY5Qdm3iGXZhldJiVIOefT2T6AIBtbjkpLyU2oWsi31qj
	qwiNjt44MSrH73gzg3bEZxNxi89h1hlbI80RNUQdbO8PkYfFUD54GXzWAWcSPFH5stLOt1O4MF/YZ
	nEFQbK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQk2-00000005gzi-1bC6;
	Wed, 26 Feb 2025 23:23:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQWU-00000005eyM-3dms
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:09:04 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4BCB6210EACE;
	Wed, 26 Feb 2025 15:08:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4BCB6210EACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740611339;
	bh=7Wj2ugF4n6C55Ao4My0HNfCwkHT/JgqZetZVtKykJY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SonOvTLJF8YOsLyEW7qK7PUUJ3wubXvnGbAAuSEFRgTQUR7IROTvFEYILABtpHAql
	 OnEoqYz8ljX4cKww+isHubWwF8phTgv0foQ//1WBQ1iV5Zn02oUsZgZ+1kWSmvyC3T
	 O9Q5aAqGTbtGBNmu1shtzC1f1YMYhhr88QbgOS1s=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
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
	Tianyu.Lan@microsoft.com,
	stanislav.kinsburskiy@gmail.com,
	gregkh@linuxfoundation.org,
	vkuznets@redhat.com,
	prapal@linux.microsoft.com,
	muislam@microsoft.com,
	anrayabh@linux.microsoft.com,
	rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net
Subject: [PATCH v5 07/10] Drivers: hv: Introduce per-cpu event ring tail
Date: Wed, 26 Feb 2025 15:08:01 -0800
Message-Id: <1740611284-27506-8-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_150903_040225_70CE0E5A 
X-CRM114-Status: GOOD (  16.00  )
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

Add a pointer hv_synic_eventring_tail to track the tail pointer for the
SynIC event ring buffer for each SINT.

This will be used by the mshv driver, but must be tracked independently
since the driver module could be removed and re-inserted.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Wei Liu <wei.liu@kernel.org>
---
 drivers/hv/hv_common.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 252fd66ad4db..2763cb6d3678 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -68,6 +68,16 @@ static void hv_kmsg_dump_unregister(void);
 
 static struct ctl_table_header *hv_ctl_table_hdr;
 
+/*
+ * Per-cpu array holding the tail pointer for the SynIC event ring buffer
+ * for each SINT.
+ *
+ * We cannot maintain this in mshv driver because the tail pointer should
+ * persist even if the mshv driver is unloaded.
+ */
+u8 __percpu **hv_synic_eventring_tail;
+EXPORT_SYMBOL_GPL(hv_synic_eventring_tail);
+
 /*
  * Hyper-V specific initialization and shutdown code that is
  * common across all architectures.  Called from architecture
@@ -90,6 +100,9 @@ void __init hv_common_free(void)
 
 	free_percpu(hyperv_pcpu_input_arg);
 	hyperv_pcpu_input_arg = NULL;
+
+	free_percpu(hv_synic_eventring_tail);
+	hv_synic_eventring_tail = NULL;
 }
 
 /*
@@ -372,6 +385,11 @@ int __init hv_common_init(void)
 		BUG_ON(!hyperv_pcpu_output_arg);
 	}
 
+	if (hv_root_partition()) {
+		hv_synic_eventring_tail = alloc_percpu(u8 *);
+		BUG_ON(hv_synic_eventring_tail == NULL);
+	}
+
 	hv_vp_index = kmalloc_array(nr_cpu_ids, sizeof(*hv_vp_index),
 				    GFP_KERNEL);
 	if (!hv_vp_index) {
@@ -460,6 +478,7 @@ void __init ms_hyperv_late_init(void)
 int hv_common_cpu_init(unsigned int cpu)
 {
 	void **inputarg, **outputarg;
+	u8 **synic_eventring_tail;
 	u64 msr_vp_index;
 	gfp_t flags;
 	const int pgcount = hv_output_page_exists() ? 2 : 1;
@@ -472,8 +491,8 @@ int hv_common_cpu_init(unsigned int cpu)
 	inputarg = (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
 
 	/*
-	 * hyperv_pcpu_input_arg and hyperv_pcpu_output_arg memory is already
-	 * allocated if this CPU was previously online and then taken offline
+	 * The per-cpu memory is already allocated if this CPU was previously
+	 * online and then taken offline
 	 */
 	if (!*inputarg) {
 		mem = kmalloc(pgcount * HV_HYP_PAGE_SIZE, flags);
@@ -485,6 +504,17 @@ int hv_common_cpu_init(unsigned int cpu)
 			*outputarg = (char *)mem + HV_HYP_PAGE_SIZE;
 		}
 
+		if (hv_root_partition()) {
+			synic_eventring_tail = (u8 **)this_cpu_ptr(hv_synic_eventring_tail);
+			*synic_eventring_tail = kcalloc(HV_SYNIC_SINT_COUNT,
+							sizeof(u8), flags);
+
+			if (unlikely(!*synic_eventring_tail)) {
+				kfree(mem);
+				return -ENOMEM;
+			}
+		}
+
 		if (!ms_hyperv.paravisor_present &&
 		    (hv_isolation_type_snp() || hv_isolation_type_tdx())) {
 			ret = set_memory_decrypted((unsigned long)mem, pgcount);
-- 
2.34.1


