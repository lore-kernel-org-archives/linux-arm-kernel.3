Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCD2C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UO0IV1Fa2w4jRN2VF1J5DC4vESX9Rcd9+LGQ+k/6XZk=; b=w7R0fhTPA3TPxYL3X8EqPR9rCl
	uSIjMiVQ5NJYUD+5hO6u0yHdk6sLo7obuh0SkBDouMbc9hN2Qd7pliYsFg75S2VQs2dHK5VqPvviM
	cLXbd4ZAqBFEBMZnC3oJtGEx2fQjPkCOLkEE5UuSnt+WB9UWVeVrhKW3MfsNLxS3Q3YoDt98rr6Ea
	wShLEVAbmUgp6cDt99azGroKm4ftnW6e8OXEtGXPeBGHVLNeDNiRfAYEEHIt8BfnzUly4mhn8YNeC
	saYNxMGd24rsIY4A+Xg/IiHqyeznVmucUvtETp5CmCz9Dd10hD6mTcjer/DR9qt4ZUQDJ511WqXwe
	AvFvI9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyko-00000004B2f-2nyg;
	Mon, 17 Feb 2025 10:53:34 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyCE-000000045JA-0GBb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:17:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abb7f539c35so336989566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787468; x=1740392268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UO0IV1Fa2w4jRN2VF1J5DC4vESX9Rcd9+LGQ+k/6XZk=;
        b=WjQPYArHukflNQai9917hn12UK+qUExaF/POMrOH+Yswhu+5CSy90WsTcc9RTSX2fi
         gbe0l/CsVpc2tn9CG3UJ+OFAgrVS+W4NKr7SEmMjSC+Mksqr6BHHoYo1CQwLLQmWraPg
         EFvvbmOJ3XO5LKKaOLrrGO9OY/cdv3wMQgGE0v73TpstcSgcnsIZdlAMvPv94/7ypF2M
         oTW0LI/kFKMQXPi/xnDGfAnBmxAHmSnq4bnvu5N7a4qoI2UAD2swrK+BUFv+Oe6pcKf3
         rBpc9WNYGKi51cf35eVYw0Ed8oZPvdAGn5iVJUF4lTvms4LKOu2lq9StcAold0nwqkIo
         aePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787468; x=1740392268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UO0IV1Fa2w4jRN2VF1J5DC4vESX9Rcd9+LGQ+k/6XZk=;
        b=MvqNIT+8fWyHtOPcOhqOTwhm/6HBn67mupzBHi+IYWiSaIkiJ6Da10DsX+A19MD1Tp
         8TUBwaAwmNQ+fWW3R3UEEM2hQQ6DJeo7xJ5YzJyGHfR5AI9BVZ3Kay3fC6Csb1GpRIUY
         ftNlmxwIJ55QscTlNaPLZYBooxclxt3R+cq6TYC03KYfv4JzTOS9zRgQtgF3RVq+emvY
         qV9IOCLw1ix+FT53UavEvhC2BzpFGO28JsfhKuUpFPn4e6lyO+yzx4Y2flzkphwQWrbz
         6RIkbBFTctFODYtTCUaB7+/04YxQSywXViUu0o7xCV5iDCT/h7SZM/qVRkqn2QrHAq0d
         Be1w==
X-Forwarded-Encrypted: i=1; AJvYcCW2INVFVjZMnOSsdBy4iMEfWlv0X9rcphoAejT/DB3amZAj6F6q8Ci5yQbI+hS0jGxm0QDMJHH7h8JaZvqZL8VW@lists.infradead.org
X-Gm-Message-State: AOJu0YyCao0eG2kDKLa8qDaOBAvU+GNazSlGv35Cnb9h5RYRN4K6DPkO
	FMrA4dCvC4PFNAGug6O/LVZ8NrOy0vtoUqlhVNBmfMd/0+NzI9pxjn50zAYyXeM=
X-Gm-Gg: ASbGncv5thz+UEHvQQC7tYqejTGY8G2TYKjOgo0uGCPjf/lNuC8AO9B1WteuyTMAyNF
	3fAO7BaS1D8uYBLeGcXd/ils1BxJMIebe/L0IRs9S6wXxLgA8A2vkZqOJghXkspskBchOkd1Zfe
	Kx+pF4wZ5fHS07YeVqQk8tXu7REER168xn+tGftlXpEJCL3VdpyQWAN4qwcIS7K8Hs/HuEI5cfu
	5g8mRxYiEeSM3xH+zbUvvES4+P6sSPn7j01HdI4kmSGphetK0Wvr7loBqRa012kTs47F5B+hnTZ
	uxUY1IzINhBOwSr6kyNLpvcH
X-Google-Smtp-Source: AGHT+IFeqQRmHtufh/hnET9/WDBmQ08tktpUPlNNW2f16K2ts13CoRF9gAnCjQkfdJKdSGt+WA/5Ug==
X-Received: by 2002:a17:906:3290:b0:ab7:d179:2496 with SMTP id a640c23a62f3a-abb70a791dcmr775286966b.6.1739787468349;
        Mon, 17 Feb 2025 02:17:48 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:48 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 02/10] pstore/smem: add new pstore/smem type of pstore
Date: Mon, 17 Feb 2025 12:16:58 +0200
Message-ID: <20250217101706.2104498-3-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021750_107226_A7811F20 
X-CRM114-Status: GOOD (  21.32  )
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

Add shared memory type of pstore.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 fs/pstore/Kconfig           |  13 ++++
 fs/pstore/Makefile          |   3 +
 fs/pstore/smem.c            | 115 ++++++++++++++++++++++++++++++++++++
 include/linux/pstore_smem.h |   9 +++
 4 files changed, 140 insertions(+)
 create mode 100644 fs/pstore/smem.c
 create mode 100644 include/linux/pstore_smem.h

diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index 3acc38600cd1..84f87edf9b8f 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -81,6 +81,19 @@ config PSTORE_RAM
 
 	  For more information, see Documentation/admin-guide/ramoops.rst.
 
+config PSTORE_SMEM
+	tristate "Log panic/oops to a shared memory buffer"
+	depends on PSTORE
+	select PSTORE_ZONE
+	help
+	  This enables panic and oops messages to be logged to memory
+	  that is shared between different hardware blocks in the system.
+	  This shared memory can be a static ram, a part of dynamic RAM,
+	  a dedicated cache or memory area specific for crash dumps,
+	  or even a memory on an attached device.
+
+	  if unsure, say N.
+
 config PSTORE_ZONE
 	tristate
 	depends on PSTORE
diff --git a/fs/pstore/Makefile b/fs/pstore/Makefile
index c270467aeece..f2a314ca03a0 100644
--- a/fs/pstore/Makefile
+++ b/fs/pstore/Makefile
@@ -18,3 +18,6 @@ obj-$(CONFIG_PSTORE_ZONE)	+= pstore_zone.o
 
 pstore_blk-objs += blk.o
 obj-$(CONFIG_PSTORE_BLK)	+= pstore_blk.o
+
+pstore_smem-objs += smem.o
+obj-$(CONFIG_PSTORE_SMEM)	+= pstore_smem.o
diff --git a/fs/pstore/smem.c b/fs/pstore/smem.c
new file mode 100644
index 000000000000..9eedd7df5446
--- /dev/null
+++ b/fs/pstore/smem.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Implements pstore backend driver for shared memory devices,
+ * using the pstore/zone API.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/blkdev.h>
+#include <linux/string.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pstore_smem.h>
+#include <linux/fs.h>
+#include <linux/file.h>
+#include <linux/init_syscalls.h>
+#include <linux/mount.h>
+
+/*
+ * All globals must only be accessed under the pstore_smem_lock
+ * during the register/unregister functions.
+ */
+static DEFINE_MUTEX(pstore_smem_lock);
+static struct pstore_device_info *pstore_device_info;
+
+static int __register_pstore_device(struct pstore_device_info *dev)
+{
+	int ret;
+
+	lockdep_assert_held(&pstore_smem_lock);
+
+	if (!dev) {
+		pr_err("NULL device info\n");
+		return -EINVAL;
+	}
+	if (!dev->zone.total_size) {
+		pr_err("zero sized device\n");
+		return -EINVAL;
+	}
+	if (!dev->zone.read) {
+		pr_err("no read handler for device\n");
+		return -EINVAL;
+	}
+	if (!dev->zone.write) {
+		pr_err("no write handler for device\n");
+		return -EINVAL;
+	}
+
+	/* someone already registered before */
+	if (pstore_device_info)
+		return -EBUSY;
+
+	/* zero means not limit on which backends to attempt to store. */
+	if (!dev->flags)
+		dev->flags = UINT_MAX;
+
+	/* Initialize required zone ownership details. */
+	dev->zone.name = KBUILD_MODNAME;
+	dev->zone.owner = THIS_MODULE;
+
+	ret = register_pstore_zone(&dev->zone);
+	if (ret == 0)
+		pstore_device_info = dev;
+
+	return ret;
+}
+/**
+ * register_pstore_smem_device() - register smem device to pstore
+ *
+ * @dev: smem device information
+ *
+ * Return:
+ * * 0		- OK
+ * * Others	- some error.
+ */
+int register_pstore_smem_device(struct pstore_device_info *dev)
+{
+	int ret;
+
+	mutex_lock(&pstore_smem_lock);
+	ret = __register_pstore_device(dev);
+	mutex_unlock(&pstore_smem_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(register_pstore_smem_device);
+
+static void __unregister_pstore_device(struct pstore_device_info *dev)
+{
+	lockdep_assert_held(&pstore_smem_lock);
+	if (pstore_device_info && pstore_device_info == dev) {
+		unregister_pstore_zone(&dev->zone);
+		pstore_device_info = NULL;
+	}
+}
+
+/**
+ * unregister_pstore_smem_device() - unregister smem device from pstore
+ *
+ * @dev: smem device information
+ */
+void unregister_pstore_smem_device(struct pstore_device_info *dev)
+{
+	mutex_lock(&pstore_smem_lock);
+	__unregister_pstore_device(dev);
+	mutex_unlock(&pstore_smem_lock);
+}
+EXPORT_SYMBOL_GPL(unregister_pstore_smem_device);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
+MODULE_DESCRIPTION("pstore backend for smem devices");
diff --git a/include/linux/pstore_smem.h b/include/linux/pstore_smem.h
new file mode 100644
index 000000000000..f0ad23e117c4
--- /dev/null
+++ b/include/linux/pstore_smem.h
@@ -0,0 +1,9 @@
+#ifndef PSTORE_SMEM_H
+#define PSTORE_SMEM_H
+
+#include <linux/pstore_zone.h>
+
+int register_pstore_smem_device(struct pstore_device_info *dev);
+void unregister_pstore_smem_device(struct pstore_device_info *dev);
+
+#endif
-- 
2.43.0


