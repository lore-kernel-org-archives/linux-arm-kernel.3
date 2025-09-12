Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F7BCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzHigyy7wb6B4Qf5Kb9gVs2tyhtkzh8ngJUDwiJtOEQ=; b=YJ9/Mm4kkA878OE1BBwfvZ0DdA
	omu53DxZN6Fl1OJVWf1rXPu3Ky76TAzX98NE+PL97TK0beW/djtl/clKRP4QOSYyCwyqFXFX+dW4N
	Yc6mYL+uhDMKtrP1CQ1SBCC/iNZk3NVFN4QbAu8M9UKXRfPovY60hfRzPYQP2RlogVjR7o+joDp0D
	guMWy5nKMRSHlKn8NzyZCyjA34z6h1sKoQH6ccAnya2sGiSGK0DYrc3DSYhMGUIqvbSMUKkokELe3
	AURI754oGanZtEmG2n1aZXbVUy3KwyDuFUWwHbvo/lz6dUfOScNHOOcdi56X4BqPG0lyD7OIvbXog
	Yi+KLCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5PS-0000000A7kt-1LBC;
	Fri, 12 Sep 2025 15:09:58 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5PO-0000000A7iU-4AtN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:09:56 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-71d60150590so12848737b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689794; x=1758294594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzHigyy7wb6B4Qf5Kb9gVs2tyhtkzh8ngJUDwiJtOEQ=;
        b=tbdhA2EXIpF9Tn7ftC2R7BLk9sYaowugmRXQvceOixfUiAR1AALq7XKUsP4i2MPShY
         SdXTv3pDOru5AijSEr4vMCVrou9vqqPLfDXXiKpU0k63vyFFEGHK1E8kLuS32LlxBt9e
         q1T1kCYQxrBoFiASXXLLm2YZp2UZbXoCbY3hDdaWxrF9otTVa4a2HfJU10OJz78EosOP
         f/giwBw1W2899MJm7gU4o1/ilhxCyEzlKMmDnq4UQe0MiWuHSyg5uac/hgCNQHP2lTSp
         8M13lGisIMCYKUakPZu0p3uOEgcSWxFwBoEqBdqub/n5OtPDx5x7FZkgJOu2i7AISkXh
         /9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689794; x=1758294594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzHigyy7wb6B4Qf5Kb9gVs2tyhtkzh8ngJUDwiJtOEQ=;
        b=P2OC0V/UuAY4yj9P0bcGmiB1dcto7ixWmStPnKmZ03VktEow3NOIhQNAx195J4d9b/
         Jq4EjT0rOnQnbVD6ctYQIfyMFkaRFys8wZ4NrNL2zsqXg1cDLikDw2cp4hwyiLElYxMO
         00EcVEl+v357MbuVtMNfvX2mlLdpUJy5JMkOEpmp232VQue4LIvWV+aPq3MdavfLZAaF
         wUWAvZ+OHFQ0C9HNW+nhWBAPblFf+N/EFDYHkO+BU7Q/kmXxdGhAy8CyuWGAmW7kwstO
         AQIUJEnS0NOzCmwBqarM83pBwNFAwEUArqUb1a4X4t+uUWUxTOG4IP0TpRjmzeQR6VXh
         YSHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8UrkHN4pS2qHGkAWTUpWCrOabyKOHLvi+EI7CE0IB7KCSM8D9Coc3/g9W5r9gsrtNwEPAu32PkRiuKpoZ59ag@lists.infradead.org
X-Gm-Message-State: AOJu0YzjZNXeeEZuOwhElJygSr+1Kmhr9NVFDWvbptOcmHJ4JBL3mTK1
	70GsZhATLfPQvZDHH5+K2uJKfor2gYKHlCdlVBskPxSk50NS2K9a0iAVPcXpp2VcEDM=
X-Gm-Gg: ASbGnctehPljrUMUZ3NmYTq7FTu72tbGoJgkwae+n7uRCwxzArexSPR2FqCukXCkC+O
	BOAK+dsMPpotEH6Ci8t/kVHCgWFdPQdwMIrthjqDXks7B2V7D8La4f2LlWQ6EBUDPSNiETzdDXb
	jQZPivhF1kGDb3NQYuW/bTPWIH5OWY5nL79M+cuik0oUNtIwz8LN1wBWr4OyWnQV/K/Chab3p1i
	euBiuUyMLeKHSWXwxTRsV+aMkuDqgHW+AvI58/Uqc0+aqoyBnNwRqWIcnKnd47YVNXoXKyuzjT8
	NgFlT0e9cVxN2mqd3uOZVfRhvRfrofTtak6bqTVf8YXuu1cAWmaZeXnQIMoqNY7vD6QB8TPj1CV
	hqpQaNhfMMGWi6s1X8pTGaMww7sRbXSKB+Mtt6QJF/fnY
X-Google-Smtp-Source: AGHT+IE5YJnan3mhmVKTpnc/qVabMAWHQ4V7v9w5sLmYvHsMlgVVw6mvPzm8RfO76m/SQuXkiV/5wA==
X-Received: by 2002:a05:690c:c16:b0:729:f78b:4205 with SMTP id 00721157ae682-730652dc116mr32595427b3.36.1757689793641;
        Fri, 12 Sep 2025 08:09:53 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:09:53 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 01/16] kmemdump: Introduce kmemdump
Date: Fri, 12 Sep 2025 18:08:40 +0300
Message-ID: <20250912150855.2901211-2-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_080955_063891_55379AC3 
X-CRM114-Status: GOOD (  27.34  )
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

Kmemdump mechanism allows any driver to mark a specific memory area
for later dumping/debugging purpose, depending on the functionality
of the attached backend.
The backend would interface any hardware mechanism that will allow
dumping to complete regardless of the state of the kernel
(running, frozen, crashed, or any particular state).

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 MAINTAINERS               |   6 ++
 include/linux/kmemdump.h  |  63 ++++++++++++
 mm/Kconfig.debug          |   2 +
 mm/Makefile               |   1 +
 mm/kmemdump/Kconfig.debug |  14 +++
 mm/kmemdump/Makefile      |   3 +
 mm/kmemdump/kmemdump.c    | 202 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 291 insertions(+)
 create mode 100644 include/linux/kmemdump.h
 create mode 100644 mm/kmemdump/Kconfig.debug
 create mode 100644 mm/kmemdump/Makefile
 create mode 100644 mm/kmemdump/kmemdump.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cf4990a8ff6..1713cccefc91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13810,6 +13810,12 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 F:	drivers/iio/accel/kionix-kx022a*
 
+KMEMDUMP
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+S:	Maintained
+F:	include/linux/kmemdump.h
+F:	mm/kmemdump/kmemdump.c
+
 KMEMLEAK
 M:	Catalin Marinas <catalin.marinas@arm.com>
 S:	Maintained
diff --git a/include/linux/kmemdump.h b/include/linux/kmemdump.h
new file mode 100644
index 000000000000..8e764bb2d8ac
--- /dev/null
+++ b/include/linux/kmemdump.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _KMEMDUMP_H
+#define _KMEMDUMP_H
+
+enum kmemdump_uid {
+	KMEMDUMP_ID_START = 0,
+	KMEMDUMP_ID_USER_START,
+	KMEMDUMP_ID_USER_END,
+	KMEMDUMP_ID_NO_ID,
+};
+
+#ifdef CONFIG_KMEMDUMP
+/**
+ * struct kmemdump_zone - region mark zone information
+ * @id: unique id for this zone
+ * @zone: pointer to the memory area for this zone
+ * @size: size of the memory area of this zone
+ */
+struct kmemdump_zone {
+	enum kmemdump_uid	id;
+	void			*zone;
+	size_t			size;
+};
+
+#define KMEMDUMP_BACKEND_MAX_NAME 128
+/**
+ * struct kmemdump_backend - region mark backend information
+ * @name: the name of the backend
+ * @register_region: callback to register region in the backend
+ * @unregister_region: callback to unregister region in the backend
+ */
+struct kmemdump_backend {
+	char name[KMEMDUMP_BACKEND_MAX_NAME];
+	int (*register_region)(const struct kmemdump_backend *be,
+			       enum kmemdump_uid uid, void *vaddr, size_t size);
+	int (*unregister_region)(const struct kmemdump_backend *be,
+				 enum kmemdump_uid uid);
+};
+
+int kmemdump_register_backend(const struct kmemdump_backend *backend);
+void kmemdump_unregister_backend(const struct kmemdump_backend *backend);
+
+int kmemdump_register_id(enum kmemdump_uid id, void *zone, size_t size);
+
+#define kmemdump_register(...)						\
+	kmemdump_register_id(KMEMDUMP_ID_NO_ID, __VA_ARGS__)		\
+
+void kmemdump_unregister(enum kmemdump_uid id);
+#else
+static inline int kmemdump_register_id(enum kmemdump_uid uid, void *area,
+				       size_t size)
+{
+	return 0;
+}
+
+#define kmemdump_register(...)
+
+static inline void kmemdump_unregister(enum kmemdump_uid id)
+{
+}
+#endif
+
+#endif
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 32b65073d0cc..b6aad5cb09c1 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -309,3 +309,5 @@ config PER_VMA_LOCK_STATS
 	  overhead in the page fault path.
 
 	  If in doubt, say N.
+
+source "mm/kmemdump/Kconfig.debug"
diff --git a/mm/Makefile b/mm/Makefile
index 21abb3353550..ca1691dd8924 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_MMU_NOTIFIER) += mmu_notifier.o
 obj-$(CONFIG_KSM) += ksm.o
 obj-$(CONFIG_PAGE_POISONING) += page_poison.o
 obj-$(CONFIG_KASAN)	+= kasan/
+obj-$(CONFIG_KMEMDUMP)	+= kmemdump/
 obj-$(CONFIG_KFENCE) += kfence/
 obj-$(CONFIG_KMSAN)	+= kmsan/
 obj-$(CONFIG_FAILSLAB) += failslab.o
diff --git a/mm/kmemdump/Kconfig.debug b/mm/kmemdump/Kconfig.debug
new file mode 100644
index 000000000000..5654180141c0
--- /dev/null
+++ b/mm/kmemdump/Kconfig.debug
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config KMEMDUMP
+	bool "KMEMDUMP: Allow the kernel to register memory regions for dumping purpose"
+	help
+	  Kmemdump mechanism allows any driver to mark a specific memory area
+	  for later dumping/debugging purpose, depending on the functionality
+	  of the attached backend.
+	  The backend would interface any hardware mechanism that will allow
+	  dumping to complete regardless of the state of the kernel
+	  (running, frozen, crashed, or any particular state).
+
+	  Note that modules using this feature must be rebuilt if option
+	  changes.
diff --git a/mm/kmemdump/Makefile b/mm/kmemdump/Makefile
new file mode 100644
index 000000000000..f5b917a6ef5e
--- /dev/null
+++ b/mm/kmemdump/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += kmemdump.o
diff --git a/mm/kmemdump/kmemdump.c b/mm/kmemdump/kmemdump.c
new file mode 100644
index 000000000000..c016457620a4
--- /dev/null
+++ b/mm/kmemdump/kmemdump.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/kmemdump.h>
+
+#define MAX_ZONES 201
+
+static int default_register_region(const struct kmemdump_backend *be,
+				   enum kmemdump_uid id, void *area, size_t sz)
+{
+	return 0;
+}
+
+static int default_unregister_region(const struct kmemdump_backend *be,
+				     enum kmemdump_uid id)
+{
+	return 0;
+}
+
+static const struct kmemdump_backend kmemdump_default_backend = {
+	.name = "default",
+	.register_region = default_register_region,
+	.unregister_region = default_unregister_region,
+};
+
+static const struct kmemdump_backend *backend = &kmemdump_default_backend;
+static DEFINE_MUTEX(kmemdump_lock);
+static struct kmemdump_zone kmemdump_zones[MAX_ZONES];
+
+/**
+ * kmemdump_register_id() - Register region into kmemdump with given ID.
+ * @req_id: Requested unique kmemdump_uid that identifies the region
+ *	This can be KMEMDUMP_ID_NO_ID, in which case the function will
+ *	find an unused ID and return it.
+ * @zone: pointer to the zone of memory
+ * @size: region size
+ *
+ * Return: On success, it returns the unique id for the region.
+ *	 On failure, it returns negative error value.
+ */
+int kmemdump_register_id(enum kmemdump_uid req_id, void *zone, size_t size)
+{
+	struct kmemdump_zone *z;
+	enum kmemdump_uid uid = req_id;
+	int ret;
+
+	if (uid < KMEMDUMP_ID_START)
+		return -EINVAL;
+
+	if (uid >= MAX_ZONES)
+		return -ENOSPC;
+
+	mutex_lock(&kmemdump_lock);
+
+	if (uid == KMEMDUMP_ID_NO_ID)
+		while (uid < MAX_ZONES) {
+			if (!kmemdump_zones[uid].id)
+				break;
+			uid++;
+		}
+
+	if (uid == MAX_ZONES) {
+		mutex_unlock(&kmemdump_lock);
+		return -ENOSPC;
+	}
+
+	z = &kmemdump_zones[uid];
+
+	if (z->id) {
+		mutex_unlock(&kmemdump_lock);
+		return -EALREADY;
+	}
+
+	ret = backend->register_region(backend, uid, zone, size);
+	if (ret) {
+		mutex_unlock(&kmemdump_lock);
+		return ret;
+	}
+
+	z->zone = zone;
+	z->size = size;
+	z->id = uid;
+
+	mutex_unlock(&kmemdump_lock);
+
+	return uid;
+}
+EXPORT_SYMBOL_GPL(kmemdump_register_id);
+
+/**
+ * kmemdump_unregister() - Unregister region from kmemdump.
+ * @id: unique id that was returned when this region was successfully
+ *	registered initially.
+ *
+ * Return: None
+ */
+void kmemdump_unregister(enum kmemdump_uid id)
+{
+	struct kmemdump_zone *z = NULL;
+
+	mutex_lock(&kmemdump_lock);
+
+	z = &kmemdump_zones[id];
+	if (!z->id) {
+		mutex_unlock(&kmemdump_lock);
+		return;
+	}
+
+	backend->unregister_region(backend, z->id);
+
+	memset(z, 0, sizeof(*z));
+
+	mutex_unlock(&kmemdump_lock);
+}
+EXPORT_SYMBOL_GPL(kmemdump_unregister);
+
+/**
+ * kmemdump_register_backend() - Register a backend into kmemdump.
+ * @be: Pointer to a driver allocated backend. This backend must have
+ *	two callbacks for registering and deregistering a zone from the
+ *	backend.
+ *
+ * Only one backend is supported at a time.
+ *
+ * Return: On success, it returns 0, negative error value otherwise.
+ */
+int kmemdump_register_backend(const struct kmemdump_backend *be)
+{
+	enum kmemdump_uid uid;
+	int ret;
+
+	if (!be || !be->register_region || !be->unregister_region)
+		return -EINVAL;
+
+	mutex_lock(&kmemdump_lock);
+
+	/* Try to call the old backend for all existing regions */
+	for (uid = KMEMDUMP_ID_START; uid < MAX_ZONES; uid++)
+		if (kmemdump_zones[uid].id)
+			backend->unregister_region(backend,
+						   kmemdump_zones[uid].id);
+
+	backend = be;
+	pr_debug("kmemdump backend %s registered successfully.\n",
+		 backend->name);
+
+	/* Call the new backend for all existing regions */
+	for (uid = KMEMDUMP_ID_START; uid < MAX_ZONES; uid++) {
+		if (!kmemdump_zones[uid].id)
+			continue;
+		ret = backend->register_region(backend,
+					       kmemdump_zones[uid].id,
+					       kmemdump_zones[uid].zone,
+					       kmemdump_zones[uid].size);
+		if (ret)
+			pr_debug("register region failed with %d\n", ret);
+	}
+
+	mutex_unlock(&kmemdump_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kmemdump_register_backend);
+
+/**
+ * kmemdump_unregister_backend() - Unregister the backend from kmemdump.
+ * @be: Pointer to a driver allocated backend. This backend must match
+ *	the initially registered backend.
+ *
+ * Only one backend is supported at a time.
+ * Before deregistering, this will call the backend to unregister all the
+ * previously registered zones.
+ *
+ * Return: None
+ */
+void kmemdump_unregister_backend(const struct kmemdump_backend *be)
+{
+	enum kmemdump_uid uid;
+
+	mutex_lock(&kmemdump_lock);
+
+	if (backend != be) {
+		mutex_unlock(&kmemdump_lock);
+		return;
+	}
+
+	/* Try to call the old backend for all existing regions */
+	for (uid = KMEMDUMP_ID_START; uid < MAX_ZONES; uid++)
+		if (kmemdump_zones[uid].id)
+			backend->unregister_region(backend,
+						   kmemdump_zones[uid].id);
+
+	pr_debug("kmemdump backend %s removed successfully.\n", be->name);
+
+	backend = &kmemdump_default_backend;
+
+	mutex_unlock(&kmemdump_lock);
+}
+EXPORT_SYMBOL_GPL(kmemdump_unregister_backend);
+
-- 
2.43.0


