Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E67BCDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIwLNRMcbK47n5JRe68/3ADojvTQP3LI5biOeKQVxxY=; b=JAJVwu2O1vdb4tCTDEItT+rZE9
	T3m7natvF6m0VKvIbXigR1Lcs6og7NfTa1ZNjCQL5GKfGtVxI/eo2GQYiImGDAZ/TdU1A0deA1F9U
	cZoPgTI772MOwMFFPf8WcGF8jDOiM0LCkZWUpqZOlX+ekxEl/YZicfX25Q+rdbVtkHQbudnMtA8YR
	b9L97JmQ0Q+R7goH0ZTLyq/+3FwDgFE+AjHVUj/LjLV94NK+LMd/cEp66wyd2M9R5tn9wx0zjv5mw
	fvptrB4vxjzrRir2cmuaVrO/Yr9sk32AJkbWSZNqEsKA5Ce0Bo9Ni2r2JRg6bFnQZTYM8ZnWFdhgs
	mm1MbLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnyz-00000009YWb-1X2w;
	Thu, 25 Jun 2026 17:35:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnyu-00000009YS6-11UA
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Jun 2026 17:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FIwLNRMcbK47n5JRe68/3ADojvTQP3LI5biOeKQVxxY=; b=fOUigI5aFId+4hYuLHPCDcv6/M
	tLswMbYENzhc2hy8Jw+dvgtaVbSjJQAfWA/SzZFqrdB5Qvye7yAQbH3wgBST2z0t46iCYBDCrdohu
	Dv4+H3o8EEJjPgQJWPUoA67szVU5j9MwK0wg4s1RArzpDcvt1X+M2xZtOfGiwazjFfsRObs0Tb6vl
	/1eJJGXtEWu4TF9wgCGs4QRo+l/e7OE2QDdBs9QWb8YK2Yi8pvWr4urBNZFK3RiWevlCu+4SNq5G0
	PhAo8T+BqQra6WIdX4ZX5t6IeSVMeoqf56r9C6CBfjB07caaFX+eZccnUBnlxy7TIzrtPDR7r9E7o
	I15EXlPA==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wcnyp-00000003v6J-2fr2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 17:35:15 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 60D8020B716C;
	Thu, 25 Jun 2026 10:35:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 60D8020B716C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782408902;
	bh=FIwLNRMcbK47n5JRe68/3ADojvTQP3LI5biOeKQVxxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BxeUDTGDEMjk9ZPLPCQD70jO3diGmtduNv+UAXBdlCqBEVfEsnieqMmQdVTmIqSBZ
	 x3dop4ZNmMqmsfhLtR79moORjaD2Ruri7sS9+JW8Ukni+VV/dIhf6WD+x0hCMW7+lf
	 rGFFGeke/rzAbn/aHJjIFr4T+lEg4IeI9ItBGqGk=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	arnd@arndb.de,
	thuth@redhat.com,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com
Subject: [PATCH v2 4/6] Drivers: hv: Mark shared memory as decrypted for CCA Realms
Date: Thu, 25 Jun 2026 10:34:58 -0700
Message-ID: <20260625173500.1995481-5-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260625173500.1995481-1-kameroncarr@linux.microsoft.com>
References: <20260625173500.1995481-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_183511_919569_AFB1CF0D 
X-CRM114-Status: GOOD (  14.11  )
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

In hv_common_cpu_init(), the per-CPU hypercall input/output pages need
to be marked as decrypted (shared) for confidential VM isolation types.
This is already done for SNP and TDX isolation; extend the same handling
to Arm CCA Realm guests so that the host hypervisor can access the
shared hypercall buffers.

We need to round up the memory allocated for the input/output pages to
the nearest PAGE_SIZE, since set_memory_decrypted() requires the size to
be a multiple of PAGE_SIZE. This only has an effect on ARM VMs that are
using PAGE_SIZE larger than 4K.

is_realm_world() is only declared in arch/arm64/include/asm/rsi.h, so
using it directly in the arch-neutral drivers/hv/hv_common.c would
break the x86 build. Introduce a Hyper-V-specific helper following the
established hv_isolation_type_snp() / hv_isolation_type_tdx() pattern.

On architectures other than arm64 the weak default keeps the existing
behaviour.

Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c   |  5 +++++
 drivers/hv/hv_common.c         | 17 +++++++++++++----
 include/asm-generic/mshyperv.h |  1 +
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 7d536d7fb557e..8e8148b723d9c 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -164,3 +164,8 @@ bool hv_is_hyperv_initialized(void)
 	return hyperv_initialized;
 }
 EXPORT_SYMBOL_GPL(hv_is_hyperv_initialized);
+
+bool hv_isolation_type_cca(void)
+{
+	return is_realm_world();
+}
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 6b67ac6167891..17048a0a18729 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -476,6 +476,7 @@ int hv_common_cpu_init(unsigned int cpu)
 	u64 msr_vp_index;
 	gfp_t flags;
 	const int pgcount = hv_output_page_exists() ? 2 : 1;
+	const size_t alloc_size = ALIGN((size_t)pgcount * HV_HYP_PAGE_SIZE, PAGE_SIZE);
 	void *mem;
 	int ret = 0;
 
@@ -489,7 +490,7 @@ int hv_common_cpu_init(unsigned int cpu)
 	 * online and then taken offline
 	 */
 	if (!*inputarg) {
-		mem = kmalloc_array(pgcount, HV_HYP_PAGE_SIZE, flags);
+		mem = kmalloc(alloc_size, flags);
 		if (!mem)
 			return -ENOMEM;
 
@@ -499,14 +500,16 @@ int hv_common_cpu_init(unsigned int cpu)
 		}
 
 		if (!ms_hyperv.paravisor_present &&
-		    (hv_isolation_type_snp() || hv_isolation_type_tdx())) {
-			ret = set_memory_decrypted((unsigned long)mem, pgcount);
+		    (hv_isolation_type_snp() || hv_isolation_type_tdx() ||
+		     hv_isolation_type_cca())) {
+			ret = set_memory_decrypted((unsigned long)kasan_reset_tag(mem),
+				alloc_size >> PAGE_SHIFT);
 			if (ret) {
 				/* It may be unsafe to free 'mem' */
 				return ret;
 			}
 
-			memset(mem, 0x00, pgcount * HV_HYP_PAGE_SIZE);
+			memset(mem, 0x00, alloc_size);
 		}
 
 		/*
@@ -666,6 +669,12 @@ bool __weak hv_isolation_type_tdx(void)
 }
 EXPORT_SYMBOL_GPL(hv_isolation_type_tdx);
 
+bool __weak hv_isolation_type_cca(void)
+{
+	return false;
+}
+EXPORT_SYMBOL_GPL(hv_isolation_type_cca);
+
 void __weak hv_setup_vmbus_handler(void (*handler)(void))
 {
 }
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index bf601d67cecb9..1fa79abce743c 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -79,6 +79,7 @@ u64 hv_do_fast_hypercall16(u16 control, u64 input1, u64 input2);
 
 bool hv_isolation_type_snp(void);
 bool hv_isolation_type_tdx(void);
+bool hv_isolation_type_cca(void);
 
 /*
  * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
-- 
2.45.4


