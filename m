Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5870AC44536
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCGLDie0xV9RJpzuDsm4ooq0RYqsnGfSauPh4xAqSiU=; b=oMF91OW+Y+6TxJ3HGdg2bzaioY
	Ax3SdScARFDFyJrLYYUTxfbqRp7jdMv0WkNtryg9a+IwM4NuJ2Tqu6hoK87j3Wel9WrBCbS95DHK/
	uHqHGqJiA6TFShkKiGITJbBZnBS/k2iGdSu2kc/YZ4js7JbwJMJhFsBzWpgIsHMdzrJzEHArX/i3W
	O7IC6Jl9Dbz229Vm5oW9ICtUGHJ3IkpeJcypc7fLf+rYFSUP885h2tGNke+lBAw+D+HL/19MEbtA4
	3MAeTW4oIS66L8VVsCFKDIxccQEtd6PXuj9CusR3lsU/rmt06NBw1SmDF9omWJhQie8gTqbJWdD1p
	Y8iqKG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGp6-0000000ALgd-1o0O;
	Tue, 21 Jul 2026 20:12:16 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGot-0000000ALa7-0zmO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:12:05 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1B9F820B716A;
	Tue, 21 Jul 2026 13:11:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1B9F820B716A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784664709;
	bh=pCGLDie0xV9RJpzuDsm4ooq0RYqsnGfSauPh4xAqSiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hnpKnP6Z4zrW2K8tIRM/j8EXiwFFtaqRbEJ5pOheySz+xbkbBIul05cTGVe5go2XA
	 7xdZYAPC9iwhbq3aKXB9sWNeYId3epPSM+bg2ht7daHWf7z3LiYprPFf14finkHt+S
	 iTOr/00eNxCYcZpfmagALucxS6gxwulldG1OPKyQ=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
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
Subject: [PATCH v3 2/6] firmware: smccc: Detect hypervisor via RSI host call in CCA Realms
Date: Tue, 21 Jul 2026 13:11:44 -0700
Message-ID: <20260721201148.1441143-3-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260721201148.1441143-1-kameroncarr@linux.microsoft.com>
References: <20260721201148.1441143-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_131203_609553_AEEEC0FC 
X-CRM114-Status: GOOD (  13.34  )
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
index bdee057db2fd3..a876b7aa2dc99 100644
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


