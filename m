Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F65CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXjuMPLiwcUPBnoVBmjBz90akqs1/NsjpF4nPTQDs60=; b=oE5L4LlY8v1+inrilXJTlO19g+
	C8nNCsm4gm3ZBxhkDIAoT+OrMiiMhoz1w1SBP34Mr57KvglSlY7uSOqrudG4xGG8AdaZhgQRDRHY7
	vgU0o6LWN4TPyW0VLMJu/FyFzwZB1qY4UKZ5HDJoXWF9fbIKPV2E8NF1krRYlXGC3AQVG1MCmCdjF
	dHbiqXnunqsH9Bnol5KT7y6xcBYyjdAKufKRRmZq/HkWfgJxKa68K0cy60+IKxmpFCWW7XGAXmMBC
	FFj7Qmykhy8B6/3WUrefrZGe4Vq/KOGXipn8pHADcFtS2jRH4eNHOTsm4ZfpypTWU5kIvW8s5IfPn
	dU/fbCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0uf-00000006AiX-3os9;
	Tue, 09 Jun 2026 18:10:57 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0uZ-00000006Af6-2hbs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:10:55 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id B8A8B20B716B;
	Tue,  9 Jun 2026 11:10:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B8A8B20B716B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1781028631;
	bh=LXjuMPLiwcUPBnoVBmjBz90akqs1/NsjpF4nPTQDs60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kyhASEOUvE/IbNTFtEIoIwOO4oVBCy7JHK1FGlbHBcMHtE+XMROVJtryqwUVL93nR
	 1rxfA/3AVUM/K9uTWljEEDsMY+W4111e7dDeo8z5HblTwAUcRZTlGomeOvHqewPjGW
	 2nyKhXowSnbFoNzCQg9WwOSel5xgFrgFgxkT0aHM=
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
Subject: [RFC PATCH 2/6] firmware: smccc: Detect hypervisor via RSI host call in CCA Realms
Date: Tue,  9 Jun 2026 11:10:26 -0700
Message-ID: <20260609181030.2378391-3-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com>
References: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_111051_711747_6797D95F 
X-CRM114-Status: GOOD (  12.36  )
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

Modify arm_smccc_hypervisor_has_uuid() to check is_realm_world() and
use rsi_host_call() to query the hypervisor vendor UUID when inside a
Realm. The realm path is factored into a helper,
arm_smccc_realm_get_hypervisor_uuid(), that owns a file-static
rsi_host_call buffer (uuid_hc) serialized by a spinlock.

The RSI-specific includes, file-static state and helper are guarded
with CONFIG_ARM64 because <asm/rsi.h> does not exist on 32-bit ARM.

For non-Realm environments, the existing arm_smccc_1_1_invoke() path
is unchanged.

Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 drivers/firmware/smccc/smccc.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index bdee057db2fd3..6b465e65472b0 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -12,6 +12,12 @@
 #include <linux/platform_device.h>
 #include <asm/archrandom.h>
 
+#ifdef CONFIG_ARM64
+#include <linux/cleanup.h>
+#include <linux/spinlock.h>
+#include <asm/rsi.h>
+#endif
+
 static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
 static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
 
@@ -67,12 +73,45 @@ s32 arm_smccc_get_soc_id_revision(void)
 }
 EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);
 
+#ifdef CONFIG_ARM64
+static struct rsi_host_call uuid_hc;
+static DEFINE_SPINLOCK(uuid_hc_lock);
+
+/*
+ * Helper function to get the hypervisor UUID via an RsiHostCall.
+ */
+static bool arm_smccc_realm_get_hypervisor_uuid(struct arm_smccc_res *res)
+{
+	guard(spinlock_irqsave)(&uuid_hc_lock);
+
+	memset(&uuid_hc, 0, sizeof(uuid_hc));
+	uuid_hc.gprs[0] = ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID;
+
+	if (rsi_host_call(__pa_symbol(&uuid_hc)) != RSI_SUCCESS)
+		return false;
+
+	res->a0 = uuid_hc.gprs[0];
+	res->a1 = uuid_hc.gprs[1];
+	res->a2 = uuid_hc.gprs[2];
+	res->a3 = uuid_hc.gprs[3];
+	return true;
+}
+#endif
+
 bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
 {
 	struct arm_smccc_res res = {};
 	uuid_t uuid;
 
-	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
+#ifdef CONFIG_ARM64
+	if (is_realm_world()) {
+		if (!arm_smccc_realm_get_hypervisor_uuid(&res))
+			return false;
+	} else
+#endif
+		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID,
+				     &res);
+
 	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
 		return false;
 
-- 
2.45.4


