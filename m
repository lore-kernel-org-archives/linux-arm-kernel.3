Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADFAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnFOyyVscJj2zQjUVyQj//yqO74ALl7OUDNbU7iCFM0=; b=B3e/aOewbw8/cdX3Qps12vavIk
	dET3WxpuupvmEh2SNQDvlEQu171fc8eRejGQ6Pp76NyDDVbtnShw9XNBd7H4svNrxPPqKm3zNns4t
	n2LY6opZRIh57vPtr4OIziPLsFREOWfQUb8HExbEgSAkJQ6HmEv/4A98vK2VWPRO2RPyh13h9ocG2
	PAf9zhpE/cSYQtqExJpoulvxoqeBUhvaZTuZ3L95zAVFNT3cSnoFgEM73rd4PbO6SlDgJei25ii0I
	N6jpYRkMU5NMKAUM93BZvXKbpypkGEaQhbe64SvLtuK3OKWBYfmm/RfnT5R6gFso8w7Kw220Ace9p
	XIN3KBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5F-0000000EdBJ-1jGL;
	Thu, 24 Apr 2025 16:05:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKz-0000000EKhT-30S1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso9718075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504040; x=1746108840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnFOyyVscJj2zQjUVyQj//yqO74ALl7OUDNbU7iCFM0=;
        b=aLGBuUcVew2O0H2YdNyUGaBoBpInQtNWiHF0deX8QY78exqohRkksZqbXKf5/xx9ET
         NUUvilaJ/fZgUyTI6uR5j9HU4zRjZM6da5iUaXbLEPehplcSu+LngW8K+bD/+teONnaO
         QBvU1wiBVy4vEXZks78bOiqV8lto1BymX5EqXUt8NfPSoMyPtdw4qYtvxT1urGKpmE0d
         7//RNfmKY7mSntLC8GOCEcYnci+Ttmrm5EzVozr6xDW84f+ylxDCDa71+WhgMXuxoPyu
         S9FObRn4TQUSKtG2eBUIe7EWNdggqG/URaILrWud353KggmjI79EUKRog6FAniBcENyJ
         1kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504040; x=1746108840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnFOyyVscJj2zQjUVyQj//yqO74ALl7OUDNbU7iCFM0=;
        b=ANqIj3QNK4qQX6VUpTj5pdaMupswH8Z50Yv0cfC8ZarR3c2Mw21fMgkiZw9Hmo9asu
         /Y5G+DoF2HJTAKNZLhZNgV41hrNkpqIUt0OYXbAd3/bY+rjogwMBeOsNm2M5Lk+pD71J
         XLeFb0Y7vjvKnpUffehaHzr9HOiWp6f4cDRkY9UgHT0TQm7+y8LtktlXXYB3ZV+au++J
         L8TBmtSyRKpIrTb3+/FzBH/ZZZubUCaPT5aZObY7C14YEKiH3QLTww0U0JmwPzHrr2gR
         tt3yC/ymsmoIvIvbOlHpP/SriZhvAJC7gUjXduOiw7s5hNB794HeKXED6m5g2wB/Yhiy
         S02g==
X-Forwarded-Encrypted: i=1; AJvYcCUsAkryLCJcKrvvuzWEfXVOZQMtc/EN+N7tpn7h63KvhASEkWS8WjGA0L8RAIrFHbWMcWA6p052ASPdTKDkLrxF@lists.infradead.org
X-Gm-Message-State: AOJu0YxzOBCPKLAgEdDXTBvYiGsLuCOUZoawnhq50umOrDNb3IZcD7m4
	6M/J/MSgfwxAVYqa+tBuDsK/J2zO2Vvz3cmcww4tzHTrca1gO/btjLT5ekPdM30=
X-Gm-Gg: ASbGnct6gyJ8KFfC5M+xZ2ikNhb4ULJVJoDSdwiLogCxqtVEzaw9Ai3/IgYlAs/iXx5
	2EAKnj7NOmqWpbk4WRxJcTJFF/tk9iBSWHR8btAjSOVDK091Ua2/cCwibBU20MW/+7kQKVIgwQD
	EyboFjb7zr/0b67DrAzj8Wv0vtCWsIVr0eXckrOx3GynOycyxSI9fKBstMlhay+7dZBg0+nLXCs
	cMlFngFfnq0zOWWOM1a6/Q8kwOdGAKbstt44sx9ls3ZiVjtYg9U5ubSmsB/OHtm5400AedZbkHK
	AvG1JaZoCTOSG1VM87BbXHDh/5208RiqLv7hg6FPoAHmBPMsVgJJGySYe7+7T4MMryJKdtKl5+C
	OLkv5IXQFJ+x/kIDD
X-Google-Smtp-Source: AGHT+IFe20I1qXpRONr6or0FTVbxh/3TZQo8fNSyYvn8TOfhWs9pYDOoLZ+ij1siBFtRALlOMdvrUQ==
X-Received: by 2002:a5d:648c:0:b0:39c:2669:d7f4 with SMTP id ffacd0b85a97d-3a06cfa3406mr2184828f8f.43.1745504039514;
        Thu, 24 Apr 2025 07:13:59 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:59 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Alex Elder <elder@linaro.org>
Subject: [RFC PATCH 11/34] gunyah: Add hypercalls to identify Gunyah
Date: Thu, 24 Apr 2025 15:13:18 +0100
Message-Id: <20250424141341.841734-12-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071401_759971_80F2B221 
X-CRM114-Status: GOOD (  22.15  )
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

From: Elliot Berman <quic_eberman@quicinc.com>

Add hypercalls to identify when Linux is running in a virtual machine
under Gunyah.

There are two calls to help identify Gunyah:

1. gh_hypercall_get_uid() returns a UID when running under a Gunyah
   hypervisor.
2. gh_hypercall_hyp_identify() returns build information and a set of
   feature flags that are supported by Gunyah.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/Kbuild                    |  1 +
 arch/arm64/gunyah/Makefile           |  3 ++
 arch/arm64/gunyah/gunyah_hypercall.c | 62 ++++++++++++++++++++++++++++
 drivers/virt/Kconfig                 |  2 +
 drivers/virt/gunyah/Kconfig          | 12 ++++++
 include/linux/gunyah.h               | 38 +++++++++++++++++
 6 files changed, 118 insertions(+)
 create mode 100644 arch/arm64/gunyah/Makefile
 create mode 100644 arch/arm64/gunyah/gunyah_hypercall.c
 create mode 100644 drivers/virt/gunyah/Kconfig

diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index 5bfbf7d79c99..e4847ba0e3c9 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -3,6 +3,7 @@ obj-y			+= kernel/ mm/ net/
 obj-$(CONFIG_KVM)	+= kvm/
 obj-$(CONFIG_XEN)	+= xen/
 obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
+obj-$(CONFIG_GUNYAH)	+= gunyah/
 obj-$(CONFIG_CRYPTO)	+= crypto/
 
 # for cleaning
diff --git a/arch/arm64/gunyah/Makefile b/arch/arm64/gunyah/Makefile
new file mode 100644
index 000000000000..84f1e38cafb1
--- /dev/null
+++ b/arch/arm64/gunyah/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_GUNYAH) += gunyah_hypercall.o
diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
new file mode 100644
index 000000000000..d44663334f38
--- /dev/null
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/module.h>
+#include <linux/gunyah.h>
+#include <linux/uuid.h>
+
+/* {c1d58fcd-a453-5fdb-9265-ce36673d5f14} */
+static const uuid_t GUNYAH_UUID = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92,
+					    0x65, 0xce, 0x36, 0x67, 0x3d, 0x5f,
+					    0x14);
+
+bool arch_is_gunyah_guest(void)
+{
+	struct arm_smccc_res res;
+	uuid_t uuid;
+	u32 *up;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
+
+	up = (u32 *)&uuid.b[0];
+	up[0] = lower_32_bits(res.a0);
+	up[1] = lower_32_bits(res.a1);
+	up[2] = lower_32_bits(res.a2);
+	up[3] = lower_32_bits(res.a3);
+
+	return uuid_equal(&uuid, &GUNYAH_UUID);
+}
+EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
+
+#define GUNYAH_HYPERCALL(fn)                                      \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64, \
+			   ARM_SMCCC_OWNER_VENDOR_HYP, fn)
+
+/* clang-format off */
+#define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
+/* clang-format on */
+
+/**
+ * gunyah_hypercall_hyp_identify() - Returns build information and feature flags
+ *                               supported by Gunyah.
+ * @hyp_identity: filled by the hypercall with the API info and feature flags.
+ */
+void gunyah_hypercall_hyp_identify(
+	struct gunyah_hypercall_hyp_identify_resp *hyp_identity)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_HYP_IDENTIFY, &res);
+
+	hyp_identity->api_info = res.a0;
+	hyp_identity->flags[0] = res.a1;
+	hyp_identity->flags[1] = res.a2;
+	hyp_identity->flags[2] = res.a3;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_hyp_identify);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index d8c848cf09a6..5a6781405a60 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -49,4 +49,6 @@ source "drivers/virt/acrn/Kconfig"
 
 source "drivers/virt/coco/Kconfig"
 
+source "drivers/virt/gunyah/Kconfig"
+
 endif
diff --git a/drivers/virt/gunyah/Kconfig b/drivers/virt/gunyah/Kconfig
new file mode 100644
index 000000000000..6f4c85db80b5
--- /dev/null
+++ b/drivers/virt/gunyah/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config GUNYAH
+	tristate "Gunyah Virtualization drivers"
+	depends on ARM64
+	help
+	  The Gunyah drivers are the helper interfaces that run in a guest VM
+	  such as basic inter-VM IPC and signaling mechanisms, and higher level
+	  services such as memory/device sharing, IRQ sharing, and so on.
+
+	  Say Y/M here to enable the drivers needed to interact in a Gunyah
+	  virtual environment.
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 1eab631a49b6..33bcbd22d39f 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -6,9 +6,11 @@
 #ifndef _LINUX_GUNYAH_H
 #define _LINUX_GUNYAH_H
 
+#include <linux/bitfield.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/limits.h>
+#include <linux/types.h>
 
 /* Matches resource manager's resource types for VM_GET_HYP_RESOURCES RPC */
 enum gunyah_resource_type {
@@ -103,4 +105,40 @@ static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
 	}
 }
 
+enum gunyah_api_feature {
+	/* clang-format off */
+	GUNYAH_FEATURE_DOORBELL		= 1,
+	GUNYAH_FEATURE_MSGQUEUE		= 2,
+	GUNYAH_FEATURE_VCPU		= 5,
+	GUNYAH_FEATURE_MEMEXTENT	= 6,
+	/* clang-format on */
+};
+
+bool arch_is_gunyah_guest(void);
+
+#define GUNYAH_API_V1 1
+
+/* Other bits reserved for future use and will be zero */
+/* clang-format off */
+#define GUNYAH_API_INFO_API_VERSION_MASK	GENMASK_ULL(13, 0)
+#define GUNYAH_API_INFO_BIG_ENDIAN		BIT_ULL(14)
+#define GUNYAH_API_INFO_IS_64BIT		BIT_ULL(15)
+#define GUNYAH_API_INFO_VARIANT_MASK 		GENMASK_ULL(63, 56)
+/* clang-format on */
+
+struct gunyah_hypercall_hyp_identify_resp {
+	u64 api_info;
+	u64 flags[3];
+};
+
+static inline u16
+gunyah_api_version(const struct gunyah_hypercall_hyp_identify_resp *gunyah_api)
+{
+	return FIELD_GET(GUNYAH_API_INFO_API_VERSION_MASK,
+			 gunyah_api->api_info);
+}
+
+void gunyah_hypercall_hyp_identify(
+	struct gunyah_hypercall_hyp_identify_resp *hyp_identity);
+
 #endif
-- 
2.39.5


