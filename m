Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E64FCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 21:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEmHt3m10eoMgtvjPJXuMeA+sz+b1A4aGz4wGZrx/nk=; b=nsvoydcz6715JFpi66WvlCI4PF
	+sjR+nitDvM7ePTGGe5CXotKR2lpllrXUjygWRPHhV5Uu08Ca/XTzEtbCQ8MvW39P8qas1Rb3ys08
	XQGMlOCReCmC+nLPNNru3q6b+GpBvHZ5PVx6a0DzQLIO48tnssr2+244mANhvgy3LktBbaukOY88U
	mWGKUeegnqDge+bFPfaRg6yzAnYyMcwxA0gBgjWnY0rHI9eUknMo6KrNBZvQAiFP9Kfj0inKayBOC
	LK9E6NllCZ8z8g89NxowHw9vKzl+AkA1XoXWJbExUG1/7SJyW2V9Xzx2IBNXY2tap7eKRl6qzndNR
	acwaGNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xClHS-0000000CZC8-17pT;
	Fri, 02 Oct 2026 21:59:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xClHL-0000000CZ8m-2JeC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 21:58:56 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 245BF20B7168;
	Fri,  2 Oct 2026 14:58:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 245BF20B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790978280;
	bh=hEmHt3m10eoMgtvjPJXuMeA+sz+b1A4aGz4wGZrx/nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XSZ3soDNnbcKur+M3I4DJfeSKfPIoMNqlWld0861H2ry1jKugwmM03BnMSEdEo3WQ
	 mg/C9eHVGtKXVi5fHJMEI50Jz4sKKVTL5gSEa4GEBn/UTKftty9LOUY3ecLL5+mpEW
	 PgaiHfbasrfcMq5v1KPLW+GF/sZ8gwZKUBq1tm7g=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	mhklinux@outlook.com
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
	linux-arch@vger.kernel.org
Subject: [PATCH v5 2/6] firmware: smccc: Detect hypervisor via RSI host call in CCA Realms
Date: Fri,  2 Oct 2026 14:57:21 -0700
Message-ID: <20261002215725.2015959-3-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_145855_618408_F74837A9 
X-CRM114-Status: GOOD (  12.56  )
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

The RSI-specific includes, file-static state and helper are guarded with
CONFIG_ARM64 because <linux/arm-rsi-cmds.h> does not build on 32-bit
ARM.

For non-Realm environments, the existing arm_smccc_1_1_invoke() path
is unchanged.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 drivers/firmware/smccc/smccc.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index afc2e4d..7e77170 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -14,6 +14,12 @@
 
 #include <asm/archrandom.h>
 
+#ifdef CONFIG_ARM64
+#include <linux/arm-rsi-cmds.h>
+#include <linux/cleanup.h>
+#include <linux/spinlock.h>
+#endif
+
 static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
 static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
 
@@ -69,12 +75,45 @@ s32 arm_smccc_get_soc_id_revision(void)
 }
 EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);
 
+#ifdef CONFIG_ARM64
+static struct rsi_host_call uuid_hc;
+static DEFINE_SPINLOCK(uuid_hc_lock);
+
+/*
+ * Helper function to get the hypervisor UUID via an RsiHostCall.
+ */
+static void arm_smccc_realm_get_hypervisor_uuid(struct arm_smccc_res *res)
+{
+	guard(spinlock_irqsave)(&uuid_hc_lock);
+
+	memset(&uuid_hc, 0, sizeof(uuid_hc));
+	uuid_hc.gprs[0] = ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID;
+
+	if (rsi_host_call(__pa_symbol(&uuid_hc)) != RSI_SUCCESS) {
+		res->a0 = SMCCC_RET_NOT_SUPPORTED;
+		return;
+	}
+
+	res->a0 = uuid_hc.gprs[0];
+	res->a1 = uuid_hc.gprs[1];
+	res->a2 = uuid_hc.gprs[2];
+	res->a3 = uuid_hc.gprs[3];
+}
+#endif
+
 bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
 {
 	struct arm_smccc_res res = {};
 	uuid_t uuid;
 
-	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
+#ifdef CONFIG_ARM64
+	if (is_realm_world())
+		arm_smccc_realm_get_hypervisor_uuid(&res);
+	else
+#endif
+		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID,
+				     &res);
+
 	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
 		return false;
 
-- 
2.45.4


