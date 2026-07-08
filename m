Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E81EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjFNzLhnBy9z2fIY243KUAIUPBoEI2GCj8EK8caaycI=; b=UnQ/5aHB+8acQ8wTxN2moTl0gc
	CGX5e1wvdK9wnG3xB5R+sLrJOcHWARjLzQA8ZVLnpHumaMZt/DpaoNhtgT++C9gtEMU0xSpt87Rx+
	F0y8jhvCp30eSEhMYLC4hEGRiQ3VBQJ5uZzvSjLdrbmHzWgMvbBPirV37WvmuQlJK6rXklYTrV1+T
	XT+4sRU+NtU6E29n45jEGvTaOAevJTE2QJls9xnw8c8hCMfChBi90ZepnDRBtKAq7G7eIp4povck6
	UOsh5kEmQR93Wl62s51nWHOpoK2om4OMd1v6GWdouY/Cn+CqOPqp4FiE+dZtYVRlpDiMIyBWhtd2b
	HEQ2XFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMVm-0000000GT6q-3TV8;
	Wed, 08 Jul 2026 07:16:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMVl-0000000GT6E-3hQl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C8B743EB9;
	Wed,  8 Jul 2026 07:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D83AAC2BD00;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783494960;
	bh=Inmjc7fy2KHCPtWNbqaEGcDOCoTWrKNk24udNuAiX/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cUXRdBJDI0E/Xw2KvOlJn6fUGNMuJCUeq+AGhCs64w5A2fjSeelXSGeh9vK4qbS8Y
	 5bMuFOFH9IcXkDYjTWvMOvFPUaVSpMQfAFtKTl4dittqQO3tQeCZLWcB2PENb90bpe
	 P6t3+me4dtrkb6DkEZCcZY889nqoYBDOpgwIEdX3heC2jvava5SWZh24siX+kRO2rI
	 22Pv24C18XVq+5ifp7zKeZ5n7NQJn3cO10ibAUpEDOk0T6oht7wzlhKiy9MB1faFU8
	 kE27B0BYcFmAiDUjIiMGVJMSvjgwzxFl9RL2iTukV4g4C9c7DB3rNN6TeEqdsglFe7
	 n6z95XxnP5b6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F06C43458;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Wed, 08 Jul 2026 09:15:41 +0200
Subject: [PATCH RFC 5/6] firmware/psci: Add EFI runtime conduit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-efi-psci-v1-5-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
In-Reply-To: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
 asahi@lists.linux.dev, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4276; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=Inmjc7fy2KHCPtWNbqaEGcDOCoTWrKNk24udNuAiX/Q=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ5bvT23luh6jNRmec1i/zfwgLh37Z3XochFpTrvb7ybPi
 f/qH7Ggo5SFQYyLQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjARbx+G/5UnObc9rFeO2jJR
 LuD0u3VzzCY1Of3eHFblG+C9UbP0wk1Ghna5/cuSDr+zmtEQMcVq4jaHp98DlQXLDh5mrt+22+Y
 TLzsA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Apple Silicon machines run the kernel at the highest available exception
level, leaving no higher level to trap into for PSCI firmware calls. The
firmware implementing PSCI therefore shares that level with the kernel and
is exposed as an EFI runtime service instead of being reached through an
SMC or HVC trap.

Add a new "efi" conduit that routes PSCI calls to the handler extracted
from the custom EFI configuration table.

PSCI_VERSION, MIGRATE_INFO_TYPE and PSCI_FEATURES are queried during early
CPU bring-up before EFI runtime services are available and have to be
answered directly from the firmware-provided table.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/firmware/psci/psci.c | 64 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/arm-smccc.h    |  1 +
 2 files changed, 65 insertions(+)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..af022bf2cb9f 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -10,6 +10,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/cpuidle.h>
 #include <linux/debugfs.h>
+#include <linux/efi.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <linux/of.h>
@@ -24,6 +25,7 @@
 
 #include <asm/cpuidle.h>
 #include <asm/cputype.h>
+#include <asm/efi.h>
 #include <asm/hypervisor.h>
 #include <asm/system_misc.h>
 #include <asm/smp_plat.h>
@@ -131,6 +133,63 @@ __invoke_psci_fn_smc(unsigned long function_id,
 	return res.a0;
 }
 
+#if IS_ENABLED(CONFIG_EFI) && IS_ENABLED(CONFIG_ARM64)
+static bool efi_psci_fn_valid(unsigned long function_id)
+{
+	if (function_id >= PSCI_0_2_FN_BASE &&
+	    function_id <= PSCI_0_2_FN(EFI_PSCI_MAX_FN))
+		return true;
+
+	if (function_id >= PSCI_0_2_FN64_BASE &&
+	    function_id <= PSCI_0_2_FN64(EFI_PSCI_MAX_FN))
+		return true;
+
+	return false;
+}
+
+static unsigned long __invoke_psci_fn_efi(unsigned long function_id,
+					  unsigned long arg0,
+					  unsigned long arg1,
+					  unsigned long arg2)
+{
+	u32 fn;
+
+	/* These are called before EFI runtime services are available */
+	switch (function_id) {
+	case PSCI_0_2_FN_PSCI_VERSION:
+		return efi_psci.version;
+	case PSCI_0_2_FN_MIGRATE_INFO_TYPE:
+		return PSCI_0_2_TOS_MP;
+	case PSCI_1_0_FN_PSCI_FEATURES:
+		if (!efi_psci_fn_valid(arg0))
+			return PSCI_RET_NOT_SUPPORTED;
+		fn = arg0 & 0xff;
+		if (fn >= efi_psci.num_features || fn >= EFI_PSCI_MAX_FN)
+			return PSCI_RET_NOT_SUPPORTED;
+		return efi_psci.features[fn];
+	}
+
+	if (!efi_psci_fn_valid(function_id))
+		return PSCI_RET_NOT_SUPPORTED;
+
+	if (WARN_ON_ONCE(!efi_psci.psci_handler))
+		return PSCI_RET_NOT_SUPPORTED;
+	if (WARN_ON_ONCE(!efi_enabled(EFI_RUNTIME_SERVICES)))
+		return PSCI_RET_NOT_SUPPORTED;
+
+	return arm64_efi_psci_call(function_id, arg0, arg1, arg2);
+}
+#else
+static unsigned long __invoke_psci_fn_efi(unsigned long function_id,
+					  unsigned long arg0,
+					  unsigned long arg1,
+					  unsigned long arg2)
+{
+	WARN(1, "EFI PSCI conduit invoked but kernel has not EFI support");
+	return PSCI_RET_NOT_SUPPORTED;
+}
+#endif
+
 static __always_inline int psci_to_linux_errno(int errno)
 {
 	switch (errno) {
@@ -277,6 +336,9 @@ static void set_conduit(enum arm_smccc_conduit conduit)
 	case SMCCC_CONDUIT_SMC:
 		invoke_psci_fn = __invoke_psci_fn_smc;
 		break;
+	case SMCCC_CONDUIT_EFI:
+		invoke_psci_fn = __invoke_psci_fn_efi;
+		break;
 	default:
 		WARN(1, "Unexpected PSCI conduit %d\n", conduit);
 	}
@@ -299,6 +361,8 @@ static int get_set_conduit_method(const struct device_node *np)
 		set_conduit(SMCCC_CONDUIT_HVC);
 	} else if (!strcmp("smc", method)) {
 		set_conduit(SMCCC_CONDUIT_SMC);
+	} else if (!strcmp("efi", method)) {
+		set_conduit(SMCCC_CONDUIT_EFI);
 	} else {
 		pr_warn("invalid \"method\" property: %s\n", method);
 		return -EINVAL;
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2e..7328e1e222ca 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -322,6 +322,7 @@ enum arm_smccc_conduit {
 	SMCCC_CONDUIT_NONE,
 	SMCCC_CONDUIT_SMC,
 	SMCCC_CONDUIT_HVC,
+	SMCCC_CONDUIT_EFI,
 };
 
 /**

-- 
2.55.0



