Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0B9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 00:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XBOx2CCx;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=QbZev5HN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZuhsC/k40xEzF9QkutlorSf7RKQMQyfgDBXyPj/af/8=; b=XBOx2CCxkDvudD
	uTI5OszMXGAnPW3CrFS5shZSyfweZLLBq0hAsQa6DiAPn5HTCsTG0MjF8mAKFUvR0VxzAFPePEH4l
	KaT29b5YeXpY1CnhoA0w/Ui3cIqWjg1RHp1ekm/nVqvpmaeI+4TXCnBpm3jxdkS8NN2sr0Fq5KgJU
	mpn6KRpKiKx7lA4V9EQ0JzEwdpwwt2wM2RyLq9KdGASZswQyga3Kou7FXDAbeLH/zJIPRUEW0Q6W3
	GT5l0mfE5zJPZ/DxDhvkIXl9l87cuVtq8DLI15T/C3u92yQ+tBjqGikImQcbM2kx/vS6pXyK2AKaO
	kDul2GTooIqrytXI06jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMwkH-0000000ClhP-2aYj;
	Sat, 31 Oct 2026 00:14:53 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMwk4-0000000CldB-0uVC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 00:14:41 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 94F9920B7169;
	Fri, 30 Oct 2026 17:14:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 94F9920B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793405666;
	bh=ZuhsC/k40xEzF9QkutlorSf7RKQMQyfgDBXyPj/af/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QbZev5HN9VxnKr5TP+oRbN+xtSD+Bog3G8XTFyWvRaLplHmS0cTaiDseJKdjkg8ot
	 q6A2WpJUJtYId4bcSjUDrrbbC6mAmwDYrYCeRwhf2NoIQXqhEU9dV30fiLi8kA0Kiy
	 dOkP2qnv9TUgI2SHsANOQ1rB7dJhtN/oNCO1nNvo=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: decui@microsoft.com,
	haiyangz@microsoft.com,
	mhklinux@outlook.com,
	wei.liu@kernel.org
Cc: arnd@arndb.de,
	catalin.marinas@arm.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	sudeep.holla@kernel.org,
	thuth@redhat.com,
	will@kernel.org
Subject: [PATCH v6 3/6] arm64: hyperv: Add per-CPU RSI host call infrastructure for CCA Realms
Date: Fri, 30 Oct 2026 17:14:09 -0700
Message-ID: <20261031001412.4150488-4-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
References: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_171440_277506_814F7E91 
X-CRM114-Status: GOOD (  14.52  )
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

Arm CCA Realms cannot issue Hyper-V hypercalls via HVC; the guest must
route them through the RSI_HOST_CALL interface, which takes the IPA of a
per-CPU rsi_host_call structure as its argument.

Add hv_hostcall_array as a per-CPU struct array and allocate it during
hyperv_init(). The allocation is gated on is_realm_world() so non-Realm
arm64 Hyper-V guests pay no memory cost.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c      | 27 +++++++++++++++++++++++++--
 arch/arm64/include/asm/mshyperv.h |  4 ++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 82572c5..46ab2da 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -14,12 +14,16 @@
 #include <linux/arm-rsi-cmds.h>
 #include <linux/export.h>
 #include <linux/errno.h>
+#include <linux/slab.h>
 #include <linux/version.h>
 #include <linux/cpuhotplug.h>
 #include <asm/mshyperv.h>
 
 static bool hyperv_initialized;
 
+struct rsi_host_call *hv_hostcall_array;
+EXPORT_SYMBOL_GPL(hv_hostcall_array);
+
 int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 {
 	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
@@ -110,6 +114,20 @@ static int __init hyperv_init(void)
 	if (!hyperv_detect_via_acpi() && !hyperv_detect_via_smccc())
 		return 0;
 
+	/*
+	 * The RSI host-call buffers are only ever used when
+	 * is_realm_world() is true. Skip the allocation on non-Realm
+	 * guests. A single contiguous array of nr_cpu_ids entries is
+	 * allocated; each CPU indexes into it by its processor ID.
+	 */
+	if (is_realm_world()) {
+		hv_hostcall_array = kcalloc(nr_cpu_ids,
+					    sizeof(struct rsi_host_call),
+					    GFP_KERNEL);
+		if (!hv_hostcall_array)
+			return -ENOMEM;
+	}
+
 	/* Setup the guest ID */
 	guest_id = hv_generate_guest_id(LINUX_VERSION_CODE);
 	hv_set_vpreg(HV_REGISTER_GUEST_OS_ID, guest_id);
@@ -131,13 +149,13 @@ static int __init hyperv_init(void)
 
 	ret = hv_common_init();
 	if (ret)
-		return ret;
+		goto free_hostcall_mem;
 
 	ret = cpuhp_setup_state(CPUHP_AP_HYPERV_ONLINE, "arm64/hyperv_init:online",
 				hv_common_cpu_init, hv_common_cpu_die);
 	if (ret < 0) {
 		hv_common_free();
-		return ret;
+		goto free_hostcall_mem;
 	}
 
 	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
@@ -150,6 +168,11 @@ static int __init hyperv_init(void)
 
 	hyperv_initialized = true;
 	return 0;
+
+free_hostcall_mem:
+	kfree(hv_hostcall_array);
+	hv_hostcall_array = NULL;
+	return ret;
 }
 
 early_initcall(hyperv_init);
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index b721d31..aed0aa5 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -61,6 +61,10 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
 				ARM_SMCCC_OWNER_VENDOR_HYP,	\
 				HV_SMCCC_FUNC_NUMBER)
 
+/* Per-CPU-indexed RSI host call structures for CCA Realms */
+struct rsi_host_call;
+extern struct rsi_host_call *hv_hostcall_array;
+
 #include <asm-generic/mshyperv.h>
 
 #endif
-- 
2.45.4


