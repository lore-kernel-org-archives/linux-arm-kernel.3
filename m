Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D318606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 00:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2mPVEI4s;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=mqg375vX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tUThciFj1hcYiyxnI7ab6umz9s0IGMVjpLBFXnmrmss=; b=2mPVEI4sKbsZz9
	Z646r8EZqJ7nO5CK6xv1LNHVEYM85xtyKcFkFi7fw42I2/CveEOIDnV5pzlwF8TNe3Ho/cgbCcpfH
	88mKUelqGXKLwE4+ZpFRAcwRZMQAPwpJRjVzwpcReAvvIC9OBmSTqiG7iqlQZf4KOc3fDMHYj0WzF
	xikO35fK2vZ4UGC5qa4luiNdhve/Lo1BumaT5pOW0BuUAy4VCndl15/HqAAXnepWv4s02H6hp61FV
	9kVzTG5LVMYZdmiwhyX/YsHTuaLau2GTnU2iIorIqxlnkgQvNGzS2NBk+CqteHDjyhgNvEGmDC6hl
	rLCrwwcdxoqleT+TEWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMwk6-0000000Clee-1gXe;
	Sat, 31 Oct 2026 00:14:42 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMwk3-0000000ClcU-2yoE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 00:14:40 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1CDE520B7168;
	Fri, 30 Oct 2026 17:14:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1CDE520B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793405666;
	bh=tUThciFj1hcYiyxnI7ab6umz9s0IGMVjpLBFXnmrmss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mqg375vX3IJlCOziW+G034ttHD7R5dtkprHPbFY5DETsGWrdOYytSTJVAsaO+ORC5
	 iPcmO84T650JE0Gm+5exMf/aHY4c7WsW1wYkh624gEdtrxL2ELvoW06jKggWMJ8X+q
	 g+6NShY/nKMpBFhCXOVG4ajAC4aHZC7BcGxmth7E=
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
Subject: [PATCH v6 2/6] arm64: hyperv: Detect Hyper-V via RSI host call in CCA Realms
Date: Fri, 30 Oct 2026 17:14:08 -0700
Message-ID: <20261031001412.4150488-3-kameroncarr@linux.microsoft.com>
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
X-CRM114-CacheID: sfid-20261030_171439_777428_251C2EF3 
X-CRM114-Status: GOOD (  12.34  )
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

When booting without ACPI, hyperv_detect_via_smccc() detects Hyper-V by
querying the SMCCC vendor hypervisor UID. In an Arm CCA Realm the SMCCC
call is handled by the RMM rather than by the hypervisor, so the
query never reaches Hyper-V and detection fails.

When running in a Realm, forward ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID
to the host with RSI_HOST_CALL instead, which is how Hyper-V hypercalls
are issued from a Realm.

This is done in the Hyper-V code rather than in the generic
arm_smccc_hypervisor_has_uuid() because the other users expect different
behavior.

hyperv_init() is an early_initcall and runs before the secondary CPUs
are brought up, so a single __initdata host call structure is used
without locking.

ACPI-based detection and non-Realm guests are unaffected.

Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 4fdc26a..82572c5 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -11,6 +11,7 @@
 
 #include <linux/types.h>
 #include <linux/acpi.h>
+#include <linux/arm-rsi-cmds.h>
 #include <linux/export.h>
 #include <linux/errno.h>
 #include <linux/version.h>
@@ -60,6 +61,27 @@ static bool __init hyperv_detect_via_acpi(void)
 
 #endif
 
+/*
+ * In a Realm, the SMCCC call is handled by the RMM rather than by
+ * Hyper-V, so the vendor hypervisor UID query must be forwarded to the
+ * host with RSI_HOST_CALL, in the same way as hypercalls.
+ */
+static bool __init hyperv_realm_has_uuid(const uuid_t *hyperv_uuid)
+{
+	static struct rsi_host_call hc __initdata;
+	uuid_t uuid;
+
+	hc.gprs[0] = ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID;
+
+	if (rsi_host_call(__pa_symbol(&hc)) != RSI_SUCCESS ||
+	    hc.gprs[0] == SMCCC_RET_NOT_SUPPORTED)
+		return false;
+
+	uuid = smccc_res_to_uuid(hc.gprs[0], hc.gprs[1], hc.gprs[2],
+				 hc.gprs[3]);
+	return uuid_equal(&uuid, hyperv_uuid);
+}
+
 static bool __init hyperv_detect_via_smccc(void)
 {
 	uuid_t hyperv_uuid = UUID_INIT(
@@ -67,6 +89,9 @@ static bool __init hyperv_detect_via_smccc(void)
 		0x75, 0x6c, 0xef, 0x8e,
 		0x24, 0x70, 0x59, 0x16);
 
+	if (is_realm_world())
+		return hyperv_realm_has_uuid(&hyperv_uuid);
+
 	return arm_smccc_hypervisor_has_uuid(&hyperv_uuid);
 }
 
-- 
2.45.4


