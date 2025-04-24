Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BBFC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXeykB8FkcDuL2Q2W63/7k8ahxVIXL64cFUzN9R5114=; b=fhmSDoz7St0Xl8S912dSZXTiBG
	2eCQqi38kNGBF447fkloY4RAVtQiuqIT1vnIDjlWGIJOaZJWLohyfggDqShiOedYqIFWxpnfDoMCJ
	qEkI31Y/mpcdR+wbPa2MWnyzI2I1xRU0PZusHnUPfpaMp4n5baHO2301gwU/b4DKbT0/eDzDZIVxx
	yt5hmjaG3+8GpQ7qkPRERkM9WXMGLqJ5hRWSRSikeCngeg8Ck1lj2X3VGdxShvIWIYUnsMC3g4+EY
	GsWi6RmM/NWDveuGcpTq0JvPBJj/ZNoQQyZTMvfreCZUbi9uu4LoSD+Q8b6y7QMeQeJYTQzToNNfA
	fDoC8qzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5o-0000000EdwD-1i1m;
	Thu, 24 Apr 2025 16:06:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLG-0000000EKod-3cvL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39efc1365e4so559607f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504057; x=1746108857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXeykB8FkcDuL2Q2W63/7k8ahxVIXL64cFUzN9R5114=;
        b=GIUks8Eshm67G327M3+rPT1MN1wY7A6iUCrXBtPmddsyN3eg/JS3Ph/NYIHd/yg36e
         89nhk212kDmr6e8aZM1pSoWg0zMpFKqqZBmrL/FAYPaq2QqXK1KmFeTxiBJ9IlhMcvKy
         yUnvxBZLessLrq9cACUIq/A2ztdqZ9W6gFw3/esad6HVo8yOOcvzz+BYuPwJ57cOE/H6
         XdM/oHmTUChVQ0TsM44+nUHb2Jdv3g5+0GpqPF/CY8Qfg9+yRJUm27U6H79Uft5V2pb5
         Q/6BMegIIDBt+PBHRpvfJhONw+ppNvpHjS+KiuI2LRoyG5od2cY5YnTkJRiYAFg7D9Es
         iC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504057; x=1746108857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXeykB8FkcDuL2Q2W63/7k8ahxVIXL64cFUzN9R5114=;
        b=Pu/qnQs0ULWrVHbyOCb0mqhnblfSRZNFMBDZVF5furATPzu+tiFhVEYjc8FWoa0RmP
         sbY1DnQ+FLEUuBHkUL5W8BUGf41NIQrgn+mXWvz7Sz7h2vkey3BmHiTzfBOhVwHxvGqk
         PuXdPDaXVfYRSEjzT+Qo2GiwKw9Iplk7uLRSaKWtTcoBZqSkywrkx6mOkWH3wbjJC4C0
         z6C2gMRkgmuPop6N09Vy1Glm3mznxGYxH2o0WiEgGaYiohEAT+KrDME186vEtAQCEY+m
         j+hD8Zmt1Yr6puKo6qTjH9VeMYHy/1vaz+6Speis7PCN6ks6wFGoPdTObcyuxD6WQT7z
         jZsg==
X-Forwarded-Encrypted: i=1; AJvYcCW3NWM3jQFt7F1e7rT0yCLbLNQohrS22x9ZYTK8aFeZlHED26bf+kClzj5ckDQeYOM/dAUoGs+K2Zo6GMJa8GH9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ECsZ3RmrCm/a1jtjVNZ34kJmJRmwbvREWQtpkg2cvo098Qkk
	wowrYoLeOUNngW0l0sd92KMuOHBut/biLMlLSClUGEVEe2RgEz81yVNLwmYDAlk=
X-Gm-Gg: ASbGnctLfZmV/N1DeLwEBqAj3rgf5lkJyXyt72MnmaJQuX5nlgSeSwZ4YK5+DKgGtZy
	UXTJwghiVDvEbGeoIDXZj4elc4DLXh6tVugF8JMF0MwH9XCSw7mgMi+Zy2xFqLYiMJYsKJCtdC0
	36rHxnaHd9F34V6riTLbxmEI/S+RnPd5qjaBUHVyNiZe+vrXPY+egy3L5od2leIRMJr2YT1etqI
	JCGVUU7ZfvvW3egGJWn0vOoit66M6poxx97xJBzx7Q8Utq+nf1BdcASRO75xovx98sBizZYrXHq
	Q78tH8NygDHrSi8EvrRHzyRRwhiFERLzYFuqGQ0SOCKZqtykA69igXPnoaqsLncRXMPHu7saLs0
	U8UhB0gqPDdXLCp8NWgNRqmalDUQ=
X-Google-Smtp-Source: AGHT+IFg8XOlOSbfkRtBuJWxisCALodsFHPa4IUTZp3Kj17cI2U8pp461yntnlLPPaPA3d0u/jWMRw==
X-Received: by 2002:a05:6000:420f:b0:399:71d4:a9 with SMTP id ffacd0b85a97d-3a06cfb2391mr2162635f8f.52.1745504057229;
        Thu, 24 Apr 2025 07:14:17 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:16 -0700 (PDT)
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
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 24/34] gunyah: Add platform ops on mem_lend/mem_reclaim
Date: Thu, 24 Apr 2025 15:13:31 +0100
Message-Id: <20250424141341.841734-25-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071418_959610_0EAAFE30 
X-CRM114-Status: GOOD (  25.79  )
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

On Qualcomm platforms, there is a firmware entity which controls access
to physical pages. In order to share memory with another VM, this entity
needs to be informed that the guest VM should have access to the memory.

Co-developed-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Signed-off-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c                     |  29 ++++-
 drivers/virt/gunyah/Kconfig                 |   4 +
 drivers/virt/gunyah/Makefile                |   1 +
 drivers/virt/gunyah/gunyah_platform_hooks.c | 117 ++++++++++++++++++++
 drivers/virt/gunyah/rsc_mgr_rpc.c           |  19 +++-
 include/linux/gunyah.h                      |  63 +++++++++--
 include/linux/gunyah_rsc_mgr.h              |  10 ++
 7 files changed, 226 insertions(+), 17 deletions(-)
 create mode 100644 drivers/virt/gunyah/gunyah_platform_hooks.c

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index 5d18d133df50..7216db642174 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -488,7 +488,7 @@ static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
 	size_t size = folio_size(folio);
 	enum gunyah_error gunyah_error;
 	unsigned long tag = 0;
-	int ret;
+	int ret, tmp;
 
 	if (share) {
 		guest_extent = __first_resource(&ghvm->guest_shared_extent_ticket);
@@ -521,6 +521,11 @@ static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
 	else /* !share && !write */
 		access = GUNYAH_PAGETABLE_ACCESS_RX;
 
+	ret = gunyah_rm_platform_pre_demand_page(ghvm->rm, ghvm->vmid, access,
+						 folio);
+	if (ret)
+		return ret;
+
 	gunyah_error = gunyah_hypercall_memextent_donate(donate_flags(share),
 							 host_extent->capid,
 							 guest_extent->capid,
@@ -528,7 +533,8 @@ static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
 	if (gunyah_error != GUNYAH_ERROR_OK) {
 		pr_err("Failed to donate memory for guest address 0x%016llx: %d\n",
 		       gpa, gunyah_error);
-		return gunyah_error_remap(gunyah_error);
+		ret = gunyah_error_remap(gunyah_error);
+		goto platform_release;
 	}
 
 	extent_attrs =
@@ -556,6 +562,14 @@ static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
 	if (gunyah_error != GUNYAH_ERROR_OK)
 		pr_err("Failed to reclaim memory donation for guest address 0x%016llx: %d\n",
 		       gpa, gunyah_error);
+platform_release:
+	tmp = gunyah_rm_platform_reclaim_demand_page(ghvm->rm, ghvm->vmid,
+						     access, folio);
+	if (tmp) {
+		pr_err("Platform failed to reclaim memory for guest address 0x%016llx: %d",
+		       gpa, tmp);
+		return ret;
+	}
 	return ret;
 }
 
@@ -565,6 +579,7 @@ static int gunyah_memory_reclaim_folio(struct gunyah_vm *ghvm,
 	u32 map_flags = BIT(GUNYAH_ADDRSPACE_MAP_FLAG_PARTIAL);
 	struct gunyah_resource *guest_extent, *host_extent, *addrspace;
 	enum gunyah_error gunyah_error;
+	enum gunyah_pagetable_access access;
 	phys_addr_t pa;
 	size_t size;
 	int ret;
@@ -604,6 +619,16 @@ static int gunyah_memory_reclaim_folio(struct gunyah_vm *ghvm,
 		goto err;
 	}
 
+	access = GUNYAH_PAGETABLE_ACCESS_RWX;
+
+	ret = gunyah_rm_platform_reclaim_demand_page(ghvm->rm, ghvm->vmid, access, folio);
+	if (ret) {
+		pr_err_ratelimited(
+			"Platform failed to reclaim memory for guest address 0x%016llx: %d",
+			gfn_to_gpa(gfn), ret);
+		goto err;
+	}
+
 	return 0;
 err:
 	return ret;
diff --git a/drivers/virt/gunyah/Kconfig b/drivers/virt/gunyah/Kconfig
index 6f4c85db80b5..23ba523d25dc 100644
--- a/drivers/virt/gunyah/Kconfig
+++ b/drivers/virt/gunyah/Kconfig
@@ -3,6 +3,7 @@
 config GUNYAH
 	tristate "Gunyah Virtualization drivers"
 	depends on ARM64
+	select GUNYAH_PLATFORM_HOOKS
 	help
 	  The Gunyah drivers are the helper interfaces that run in a guest VM
 	  such as basic inter-VM IPC and signaling mechanisms, and higher level
@@ -10,3 +11,6 @@ config GUNYAH
 
 	  Say Y/M here to enable the drivers needed to interact in a Gunyah
 	  virtual environment.
+
+config GUNYAH_PLATFORM_HOOKS
+	tristate
diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
index b1bdf3e84155..45cabba3110c 100644
--- a/drivers/virt/gunyah/Makefile
+++ b/drivers/virt/gunyah/Makefile
@@ -3,3 +3,4 @@
 gunyah_rsc_mgr-y += rsc_mgr.o rsc_mgr_rpc.o
 
 obj-$(CONFIG_GUNYAH) += gunyah.o gunyah_rsc_mgr.o
+obj-$(CONFIG_GUNYAH_PLATFORM_HOOKS) += gunyah_platform_hooks.o
diff --git a/drivers/virt/gunyah/gunyah_platform_hooks.c b/drivers/virt/gunyah/gunyah_platform_hooks.c
new file mode 100644
index 000000000000..8a1af171e4c9
--- /dev/null
+++ b/drivers/virt/gunyah/gunyah_platform_hooks.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/gunyah.h>
+#include <linux/module.h>
+#include <linux/rwsem.h>
+
+#include <linux/gunyah_rsc_mgr.h>
+
+static const struct gunyah_rm_platform_ops *rm_platform_ops;
+static DECLARE_RWSEM(rm_platform_ops_lock);
+
+int gunyah_rm_platform_pre_mem_share(struct gunyah_rm *rm,
+				     struct gunyah_rm_mem_parcel *mem_parcel)
+{
+	int ret = 0;
+
+	down_read(&rm_platform_ops_lock);
+	if (rm_platform_ops && rm_platform_ops->pre_mem_share)
+		ret = rm_platform_ops->pre_mem_share(rm, mem_parcel);
+	up_read(&rm_platform_ops_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_platform_pre_mem_share);
+
+int gunyah_rm_platform_post_mem_reclaim(struct gunyah_rm *rm,
+					struct gunyah_rm_mem_parcel *mem_parcel)
+{
+	int ret = 0;
+
+	down_read(&rm_platform_ops_lock);
+	if (rm_platform_ops && rm_platform_ops->post_mem_reclaim)
+		ret = rm_platform_ops->post_mem_reclaim(rm, mem_parcel);
+	up_read(&rm_platform_ops_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_platform_post_mem_reclaim);
+
+int gunyah_rm_platform_pre_demand_page(struct gunyah_rm *rm, u16 vmid,
+				       enum gunyah_pagetable_access access,
+				       struct folio *folio)
+{
+	int ret = 0;
+
+	down_read(&rm_platform_ops_lock);
+	if (rm_platform_ops && rm_platform_ops->pre_demand_page)
+		ret = rm_platform_ops->pre_demand_page(rm, vmid, access, folio);
+	up_read(&rm_platform_ops_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_platform_pre_demand_page);
+
+int gunyah_rm_platform_reclaim_demand_page(struct gunyah_rm *rm, u16 vmid,
+					   enum gunyah_pagetable_access access,
+					   struct folio *folio)
+{
+	int ret = 0;
+
+	down_read(&rm_platform_ops_lock);
+	if (rm_platform_ops && rm_platform_ops->pre_demand_page)
+		ret = rm_platform_ops->release_demand_page(rm, vmid, access,
+							   folio);
+	up_read(&rm_platform_ops_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_platform_reclaim_demand_page);
+
+int gunyah_rm_register_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops)
+{
+	int ret = 0;
+
+	down_write(&rm_platform_ops_lock);
+	if (!rm_platform_ops)
+		rm_platform_ops = platform_ops;
+	else
+		ret = -EEXIST;
+	up_write(&rm_platform_ops_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_register_platform_ops);
+
+void gunyah_rm_unregister_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops)
+{
+	down_write(&rm_platform_ops_lock);
+	if (rm_platform_ops == platform_ops)
+		rm_platform_ops = NULL;
+	up_write(&rm_platform_ops_lock);
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_unregister_platform_ops);
+
+static void _devm_gunyah_rm_unregister_platform_ops(void *data)
+{
+	gunyah_rm_unregister_platform_ops(
+		(const struct gunyah_rm_platform_ops *)data);
+}
+
+int devm_gunyah_rm_register_platform_ops(
+	struct device *dev, const struct gunyah_rm_platform_ops *ops)
+{
+	int ret;
+
+	ret = gunyah_rm_register_platform_ops(ops);
+	if (ret)
+		return ret;
+
+	return devm_add_action(dev, _devm_gunyah_rm_unregister_platform_ops,
+			       (void *)ops);
+}
+EXPORT_SYMBOL_GPL(devm_gunyah_rm_register_platform_ops);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Gunyah Platform Hooks");
diff --git a/drivers/virt/gunyah/rsc_mgr_rpc.c b/drivers/virt/gunyah/rsc_mgr_rpc.c
index 0266c2a8d583..ec187d116dd7 100644
--- a/drivers/virt/gunyah/rsc_mgr_rpc.c
+++ b/drivers/virt/gunyah/rsc_mgr_rpc.c
@@ -212,6 +212,12 @@ int gunyah_rm_mem_share(struct gunyah_rm *rm, struct gunyah_rm_mem_parcel *p)
 	if (!msg)
 		return -ENOMEM;
 
+	ret = gunyah_rm_platform_pre_mem_share(rm, p);
+	if (ret) {
+		kfree(msg);
+		return ret;
+	}
+
 	req_header = msg;
 	acl = (void *)req_header + sizeof(*req_header);
 	mem = (void *)acl + acl_size;
@@ -237,8 +243,10 @@ int gunyah_rm_mem_share(struct gunyah_rm *rm, struct gunyah_rm_mem_parcel *p)
 			     &resp_size);
 	kfree(msg);
 
-	if (ret)
+	if (ret) {
+		gunyah_rm_platform_post_mem_reclaim(rm, p);
 		return ret;
+	}
 
 	p->mem_handle = le32_to_cpu(*resp);
 	kfree(resp);
@@ -270,9 +278,14 @@ int gunyah_rm_mem_reclaim(struct gunyah_rm *rm,
 	struct gunyah_rm_mem_release_req req = {
 		.mem_handle = cpu_to_le32(parcel->mem_handle),
 	};
+	int ret;
+
+	 ret = gunyah_rm_call(rm, GUNYAH_RM_RPC_MEM_RECLAIM, &req, sizeof(req),
+			 NULL, NULL);
+	if (ret)
+		return ret;
 
-	 return gunyah_rm_call(rm, GUNYAH_RM_RPC_MEM_RECLAIM, &req, sizeof(req),
-			     NULL, NULL);
+	return gunyah_rm_platform_post_mem_reclaim(rm, parcel);
 }
 ALLOW_ERROR_INJECTION(gunyah_rm_mem_reclaim, ERRNO);
 
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index d1048d0fc246..1d363ab8967a 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -158,6 +158,57 @@ struct gunyah_vcpu {
 	struct gunyah_vm_resource_ticket ticket;
 };
 
+enum gunyah_pagetable_access {
+	/* clang-format off */
+	GUNYAH_PAGETABLE_ACCESS_NONE		= 0,
+	GUNYAH_PAGETABLE_ACCESS_X		= 1,
+	GUNYAH_PAGETABLE_ACCESS_W		= 2,
+	GUNYAH_PAGETABLE_ACCESS_R		= 4,
+	GUNYAH_PAGETABLE_ACCESS_RX		= 5,
+	GUNYAH_PAGETABLE_ACCESS_RW		= 6,
+	GUNYAH_PAGETABLE_ACCESS_RWX		= 7,
+	/* clang-format on */
+};
+
+struct gunyah_rm_platform_ops {
+	int (*pre_mem_share)(struct gunyah_rm *rm,
+			     struct gunyah_rm_mem_parcel *mem_parcel);
+	int (*post_mem_reclaim)(struct gunyah_rm *rm,
+				struct gunyah_rm_mem_parcel *mem_parcel);
+
+	int (*pre_demand_page)(struct gunyah_rm *rm, u16 vmid,
+			       enum gunyah_pagetable_access access,
+			       struct folio *folio);
+	int (*release_demand_page)(struct gunyah_rm *rm, u16 vmid,
+				   enum gunyah_pagetable_access access,
+				   struct folio *folio);
+};
+
+#if IS_ENABLED(CONFIG_GUNYAH_PLATFORM_HOOKS)
+int gunyah_rm_register_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops);
+void gunyah_rm_unregister_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops);
+int devm_gunyah_rm_register_platform_ops(
+	struct device *dev, const struct gunyah_rm_platform_ops *ops);
+#else
+static inline int gunyah_rm_register_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops)
+{
+	return 0;
+}
+static inline void gunyah_rm_unregister_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops)
+{
+}
+static inline int
+devm_gunyah_rm_register_platform_ops(struct device *dev,
+				     const struct gunyah_rm_platform_ops *ops)
+{
+	return 0;
+}
+#endif
+
 /******************************************************************************/
 /* Common arch-independent definitions for Gunyah hypercalls                  */
 #define GUNYAH_CAPID_INVAL U64_MAX
@@ -278,18 +329,6 @@ enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
 
 #define GUNYAH_ADDRSPACE_SELF_CAP 0
 
-enum gunyah_pagetable_access {
-	/* clang-format off */
-	GUNYAH_PAGETABLE_ACCESS_NONE		= 0,
-	GUNYAH_PAGETABLE_ACCESS_X		= 1,
-	GUNYAH_PAGETABLE_ACCESS_W		= 2,
-	GUNYAH_PAGETABLE_ACCESS_R		= 4,
-	GUNYAH_PAGETABLE_ACCESS_RX		= 5,
-	GUNYAH_PAGETABLE_ACCESS_RW		= 6,
-	GUNYAH_PAGETABLE_ACCESS_RWX		= 7,
-	/* clang-format on */
-};
-
 /* clang-format off */
 #define GUNYAH_MEMEXTENT_MAPPING_USER_ACCESS		GENMASK_ULL(2, 0)
 #define GUNYAH_MEMEXTENT_MAPPING_KERNEL_ACCESS		GENMASK_ULL(6, 4)
diff --git a/include/linux/gunyah_rsc_mgr.h b/include/linux/gunyah_rsc_mgr.h
index c42a0cb42ba6..fb3feee73490 100644
--- a/include/linux/gunyah_rsc_mgr.h
+++ b/include/linux/gunyah_rsc_mgr.h
@@ -155,4 +155,14 @@ void gunyah_rm_free_resource(struct gunyah_resource *ghrsc);
 int gunyah_rm_call(struct gunyah_rm *rsc_mgr, u32 message_id,
 		   const void *req_buf, size_t req_buf_size, void **resp_buf,
 		   size_t *resp_buf_size);
+
+int gunyah_rm_platform_pre_mem_share(struct gunyah_rm *rm,
+				     struct gunyah_rm_mem_parcel *mem_parcel);
+int gunyah_rm_platform_post_mem_reclaim(
+	struct gunyah_rm *rm, struct gunyah_rm_mem_parcel *mem_parcel);
+
+int gunyah_rm_platform_pre_demand_page(struct gunyah_rm *rm, u16 vmid,
+				       u32 flags, struct folio *folio);
+int gunyah_rm_platform_reclaim_demand_page(struct gunyah_rm *rm, u16 vmid,
+					   u32 flags, struct folio *folio);
 #endif
-- 
2.39.5


