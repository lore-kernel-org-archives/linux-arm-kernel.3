Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2DEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCwux+a4Q8sCXgF1emBYGhkcA+99fK1/4YdDu/kkdcA=; b=f0IWzGa2AbNroCws1d8jpx0nY+
	vsqyWXWjsI7IJFdMUFyKkWhcXflbYe1mTsyhvvXX+KMJ0I98najQT96WAFjL0VlRKKEMv4Z4tW2qx
	j4RzklABRl7rSr0HXXrzh3P0/yUHMFF/bzVEFpPnjkF79460SW0ePlqFCQjKM1AIuRngFOTevpprw
	lwfI9S8usOAhcJtkuTpnEq4NDBdn7qA5R9FR2ETYzptThlQi7qipREuh0HX3KKK4LixN8TEdSDVaO
	RbwxEOSCJI3luki3GMhsLxzYLBrPACowGH+xJawdaJu1YiUDw82+aNhKIXTGFuy5HiogLyIQC3Nqd
	jr17zLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DZY-00000007HEj-0n1r;
	Tue, 22 Apr 2025 13:22:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrO-00000006x3u-0enc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 11:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SCwux+a4Q8sCXgF1emBYGhkcA+99fK1/4YdDu/kkdcA=; b=IhxbvlHZdF28kv+5sU1SpGHdtj
	D5ESJCym85PP/k7E7C/lKbPh4+qS6lIYjNvTd38cVe8FRtc5dP2iNvVLAgp/dMG/HzmbqNQgIOKA6
	thxXU13CSXgwYZ9Uv+wDxc5cBb+MCCScGK6zahS53dyyeWqO3xosTeCc73ok2jwz6w/61cB0aEIIc
	6N/+aMLAtY2jRMeifSsXstIQt5JpqMJKHI1iLMaqxW+NmQEf0nMuelEa4735ZtjDHR+rPaGx3BZ4Q
	IpSkI3zKabAkXNyAf6Zo4WDI0DEOkyEXmQ3jDlgESU2VAdOp/Tlbn/Pte/Zockmctyu9vkil0BpwJ
	qMT76eDQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BrK-0000000BCGH-3HV7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:16 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39ee623fe64so4369987f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321532; x=1745926332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCwux+a4Q8sCXgF1emBYGhkcA+99fK1/4YdDu/kkdcA=;
        b=rcQFbR33+/0JBNHxyVfvCnCRSmXcNphvn3orl7DouUcKWLHxUmwnXT+vsMYj+UmMyd
         dOOHTIlauIcBMQxgE4Ulhkqy6jJsvM8wvnJ+aT2Oq3X4Vs9XHBTJApjIoxamXUzCs30n
         1n0y7Af+AZNFBqmY95c/lrOcalWrYNCyQ7nzufgWEO0rAE56tzIHeJLwnf3RtP1UAW37
         LwnfeggaVqLuDfkBluoP4HLCjBiHZcYsG4JLPGo8J8PyLSIgOW6AM9doL5//daR4dEo2
         Pc7coOIklh0LmmuyNhVJJRNn0WYCYnknkbaoY5mjLOb8G0tBqxBqYuDv39iWIKAsZ+U1
         ZyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321532; x=1745926332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCwux+a4Q8sCXgF1emBYGhkcA+99fK1/4YdDu/kkdcA=;
        b=PCn8Wq/rx2uONNg5EWuKbSdzYwV8qNBVtF71Lg5qRQ4Mp1nnCsONrSvWnQimOPIxLi
         J4PPl2qEURjzuGICLlE0W3mUpaZChtA/Mh3udNUqR9o8mUPKAg7VJ0SailquLYksD+4Z
         US0K58WZIqpGWAetkLnyr5q2QHp04UU3Y4+cWFbvpg2uB8gvFVwXY/98XztnSzeLmlKj
         YkAzHu0eO5P5fUk/Eq2LqjrBZIzpTZgw9ZfdN9WYOou+m6MtJRnLYb8g/L7vp+0wbQ8n
         /NLPviIXUZHDw85lAPwotJtWkxlsAC6WSZojr2qpDaMAui1KqQ51I8PluG+yyvh1dD0z
         LHLg==
X-Forwarded-Encrypted: i=1; AJvYcCVR4L7cmQRFamKZ1ueCMPapAI7FpZZ2MdvPlrjMUSU5jDUHDGQoGfWeUr8pkBO2n1+SLTAv5Gv3JSHwGufPtnNP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbu3KTYv/B6p0FcKaP+ksdkgK6Bl0PJSKHwSEUEt3+Ieoz91SD
	xBOg3XK7QfbIMBm1oGx+sYXoJYNp1FkPG2lXGYPA1TZmXe6LCL9UleHEy01CNqk=
X-Gm-Gg: ASbGnctUvLcex9/OCZilSLC/JUhyqRtzo80H0Yp9aVm21mm4V2iVp/DLU+v8R7KJK59
	orDjcG/hF/mtenQqvu3Lz8rXq3oDJ6N4Gf12dJCPlQ4X0ul50cKTcM6BfgsLaYpQW2L9hBgAG0B
	dMAl2INH0pp98po2GUhzAAQ6eiOJ7BYLj1NpqlDBl3polVcv8Bj0WgHHkG5MuYZ1bHkYa0EczvY
	XFJkKE7mB/Ab5CqDMZ3iXJiXsxaolVKhM11V2cHu+tvd3AZUuxDZs0qLM1q/mH1LLjHSVl9nyj6
	VyhqBhfVKHk/los4AqcwmFhN9LgBRQXXxBF0VWZ+qt4XMK7zF7h/17jjn/ykOWY=
X-Google-Smtp-Source: AGHT+IGMfuXrs6yBJwUzUPD9ezVigzRz4yUbqmU88PCa4ZD+NBPSxQaWYDkLyhCxy4qvd1m4zcFnzQ==
X-Received: by 2002:a05:6000:1862:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-39efba3c803mr11877512f8f.14.1745321532510;
        Tue, 22 Apr 2025 04:32:12 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:12 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 02/14] kmemdump: introduce kmemdump
Date: Tue, 22 Apr 2025 14:31:44 +0300
Message-ID: <20250422113156.575971-3-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_123214_952752_EB2BC57A 
X-CRM114-Status: GOOD (  25.18  )
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
for later dumping purpose, depending on the functionality
of the attached backend. The backend would interface any hardware
mechanism that will allow dumping to complete regardless of the
state of the kernel (running, frozen, crashed, or any particular
state).

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/Kconfig          |   2 +
 drivers/Makefile         |   2 +
 drivers/debug/Kconfig    |  16 ++++
 drivers/debug/Makefile   |   3 +
 drivers/debug/kmemdump.c | 185 +++++++++++++++++++++++++++++++++++++++
 include/linux/kmemdump.h |  52 +++++++++++
 6 files changed, 260 insertions(+)
 create mode 100644 drivers/debug/Kconfig
 create mode 100644 drivers/debug/Makefile
 create mode 100644 drivers/debug/kmemdump.c
 create mode 100644 include/linux/kmemdump.h

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7bdad836fc62..ef56588f559e 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -245,4 +245,6 @@ source "drivers/cdx/Kconfig"
 
 source "drivers/dpll/Kconfig"
 
+source "drivers/debug/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index 45d1c3e630f7..cf544a405007 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -195,3 +195,5 @@ obj-$(CONFIG_CDX_BUS)		+= cdx/
 obj-$(CONFIG_DPLL)		+= dpll/
 
 obj-$(CONFIG_S390)		+= s390/
+
+obj-y				+= debug/
diff --git a/drivers/debug/Kconfig b/drivers/debug/Kconfig
new file mode 100644
index 000000000000..22348608d187
--- /dev/null
+++ b/drivers/debug/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+menu "Generic Driver Debug Options"
+
+config DRIVER_KMEMDUMP
+	bool "Allow drivers to register memory for dumping"
+	help
+	  Kmemdump mechanism allows any driver to mark a specific memory area
+	  for later dumping purpose, depending on the functionality
+	  of the attached backend. The backend would interface any hardware
+	  mechanism that will allow dumping to complete regardless of the
+	  state of the kernel (running, frozen, crashed, or any particular
+	  state).
+
+	  Note that modules using this feature must be rebuilt if option
+	  changes.
+endmenu
diff --git a/drivers/debug/Makefile b/drivers/debug/Makefile
new file mode 100644
index 000000000000..cc14dea250e3
--- /dev/null
+++ b/drivers/debug/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_DRIVER_KMEMDUMP) += kmemdump.o
diff --git a/drivers/debug/kmemdump.c b/drivers/debug/kmemdump.c
new file mode 100644
index 000000000000..a685c0863e25
--- /dev/null
+++ b/drivers/debug/kmemdump.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/kmemdump.h>
+#include <linux/idr.h>
+
+#define MAX_ZONES 512
+
+static struct kmemdump_backend *backend;
+static DEFINE_IDR(kmemdump_idr);
+static DEFINE_MUTEX(kmemdump_lock);
+static LIST_HEAD(kmemdump_list);
+
+/**
+ * kmemdump_register() - Register region into kmemdump.
+ * @handle: string of maximum 8 chars that identifies this region
+ * @zone: pointer to the zone of memory
+ * @size: region size
+ *
+ * Return: On success, it returns an allocated unique id that can be used
+ *	at a later point to identify the region. On failure, it returns
+ *	negative error value.
+ */
+int kmemdump_register(char *handle, void *zone, size_t size)
+{
+	struct kmemdump_zone *z = kzalloc(sizeof(*z), GFP_KERNEL);
+	int id;
+
+	if (!z)
+		return -ENOMEM;
+
+	mutex_lock(&kmemdump_lock);
+
+	id = idr_alloc_cyclic(&kmemdump_idr, z, 0, MAX_ZONES, GFP_KERNEL);
+	if (id < 0) {
+		mutex_unlock(&kmemdump_lock);
+		return id;
+	}
+
+	if (!backend)
+		pr_debug("kmemdump backend not available yet, waiting...\n");
+
+	z->zone = zone;
+	z->size = size;
+	z->id = id;
+
+	if (handle)
+		strscpy(z->handle, handle, 8);
+
+	if (backend) {
+		int ret;
+
+		ret = backend->register_region(id, handle, zone, size);
+		if (ret) {
+			mutex_unlock(&kmemdump_lock);
+			return ret;
+		}
+		z->registered = true;
+	}
+
+	mutex_unlock(&kmemdump_lock);
+	return id;
+}
+EXPORT_SYMBOL_GPL(kmemdump_register);
+
+/**
+ * kmemdump_unregister() - Unregister region from kmemdump.
+ * @id: unique id that was returned when this region was successfully
+ *	registered initially.
+ *
+ * Return: None
+ */
+void kmemdump_unregister(int id)
+{
+	struct kmemdump_zone *z;
+
+	mutex_lock(&kmemdump_lock);
+
+	z = idr_find(&kmemdump_idr, id);
+	if (!z)
+		return;
+	if (z->registered && backend)
+		backend->unregister_region(z->id);
+
+	idr_remove(&kmemdump_idr, id);
+	kfree(z);
+
+	mutex_unlock(&kmemdump_lock);
+}
+EXPORT_SYMBOL_GPL(kmemdump_unregister);
+
+static int kmemdump_register_fn(int id, void *p, void *data)
+{
+	struct kmemdump_zone *z = p;
+	int ret;
+
+	if (z->registered)
+		return 0;
+
+	ret = backend->register_region(z->id, z->handle, z->zone, z->size);
+	if (ret)
+		return ret;
+	z->registered = true;
+
+	return 0;
+}
+
+/**
+ * kmemdump_register_backend() - Register a backend into kmemdump.
+ * Only one backend is supported at a time.
+ * @be: Pointer to a driver allocated backend. This backend must have
+ *	two callbacks for registering and deregistering a zone from the
+ *	backend.
+ *
+ * Return: On success, it returns 0, negative error value otherwise.
+ */
+int kmemdump_register_backend(struct kmemdump_backend *be)
+{
+	mutex_lock(&kmemdump_lock);
+
+	if (backend)
+		return -EALREADY;
+
+	if (!be || !be->register_region || !be->unregister_region)
+		return -EINVAL;
+
+	backend = be;
+	pr_info("kmemdump backend %s registered successfully.\n",
+		backend->name);
+
+	/* Try to call the backend for all previously requested zones */
+	idr_for_each(&kmemdump_idr, kmemdump_register_fn, NULL);
+
+	mutex_unlock(&kmemdump_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kmemdump_register_backend);
+
+static int kmemdump_unregister_fn(int id, void *p, void *data)
+{
+	int ret;
+	struct kmemdump_zone *z = p;
+
+	if (!z->registered)
+		return 0;
+
+	ret = backend->unregister_region(z->id);
+	if (ret)
+		return ret;
+	z->registered = false;
+
+	return 0;
+}
+
+/**
+ * kmemdump_register_backend() - Unregister the backend from kmemdump.
+ * Only one backend is supported at a time.
+ * Before deregistering, this will call the backend to unregister all the
+ * previously registered zones.
+ * @be: Pointer to a driver allocated backend. This backend must match
+ *	the initially registered backend.
+ *
+ * Return: None
+ */
+void kmemdump_unregister_backend(struct kmemdump_backend *be)
+{
+	mutex_lock(&kmemdump_lock);
+
+	if (backend != be) {
+		mutex_unlock(&kmemdump_lock);
+		return;
+	}
+
+	/* Try to call the backend for all previously requested zones */
+	idr_for_each(&kmemdump_idr, kmemdump_unregister_fn, NULL);
+
+	backend = NULL;
+	pr_info("kmemdump backend %s removed successfully.\n", be->name);
+
+	mutex_unlock(&kmemdump_lock);
+}
+EXPORT_SYMBOL_GPL(kmemdump_unregister_backend);
diff --git a/include/linux/kmemdump.h b/include/linux/kmemdump.h
new file mode 100644
index 000000000000..b55b15c295ac
--- /dev/null
+++ b/include/linux/kmemdump.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _KMEMDUMP_H
+#define _KMEMDUMP_H
+
+#define KMEMDUMP_ZONE_MAX_HANDLE 8
+/**
+ * struct kmemdump_zone - region mark zone information
+ * @id: unique id for this zone
+ * @zone: pointer to the memory area for this zone
+ * @size: size of the memory area of this zone
+ * @registered: bool indicating whether this zone is registered into the
+ *	backend or not.
+ * @handle: a string representing this region
+ */
+struct kmemdump_zone {
+	int id;
+	void *zone;
+	size_t size;
+	bool registered;
+	char handle[KMEMDUMP_ZONE_MAX_HANDLE];
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
+	int (*register_region)(unsigned int id, char *, void *, size_t);
+	int (*unregister_region)(unsigned int id);
+};
+
+#ifdef CONFIG_DRIVER_KMEMDUMP
+int kmemdump_register(char *handle, void *zone, size_t size);
+void kmemdump_unregister(int id);
+#else
+static inline int kmemdump_register(char *handle, void *area, size_t size)
+{
+	return 0;
+}
+
+static inline void kmemdump_unregister(int id)
+{
+}
+#endif
+
+int kmemdump_register_backend(struct kmemdump_backend *backend);
+void kmemdump_unregister_backend(struct kmemdump_backend *backend);
+#endif
-- 
2.43.0


