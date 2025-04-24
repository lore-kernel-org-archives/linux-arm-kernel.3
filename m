Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF49CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWj7uDN15UXCYW87dO7IIzOLdNiL+f7UvEUy/qTIHd4=; b=a4lZkLHirqKZSyYeQT3QDd956E
	nEYjzX+yDm37iFNJkgbfliT4vAWH2Oz5cn+tSu/ZXphSAMp++7gyi2r0fdiC/+Gkk3hx3Crjt/fbw
	DCvM+kD3FkDVSoMfhMC+FH38sd30tZy2iDVPlzwOGmQV9KW0J1o+h3DwBjIFjGm+/iGXm3jddJLoU
	kpy8c1K5h7qxD3kRA7Mw3Np7wKdcoRUQcx7Zyl7siWGB0ZQOIrA/h4LdI+g01NtyQ5HXRm01CtE01
	KHlO5kPVLYaI61A/2C/FtuKSh5HIpeN9AV2ZZbP2pVC1mnxq9NKnhB4UyXmenQ5cxtZP7qZYljcQ9
	7nr2NuUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5s-0000000Ee2m-1oDu;
	Thu, 24 Apr 2025 16:06:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLI-0000000EKox-0nTr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:21 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3913958ebf2so866745f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504059; x=1746108859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWj7uDN15UXCYW87dO7IIzOLdNiL+f7UvEUy/qTIHd4=;
        b=rGi1JZD4XCcqsb7Qx4Bs8UaT+ASReONQKYiVCHJ6ocuCxV6jypjKJbsvIZTGaSC1nW
         gaNHEdx1sgmmK+Er4w4SSytpdbaHWkd2NcdVaL5A/mDcCr+MKZiXQYGHex6VNah56Jls
         inpUpDzNIs7nkSoZYoSfcvVHK/UvlxHGMSxl0VEla0q5FgcKpeNTz/XN0tyxNFa1/aay
         JSZFlVe2MMWmp4oM7rSl/dMWG/vzVLMz7kMU3pZDpSPbPccFBU/SiR0WnYt6vN0nAYCS
         hGJspXauSQ0GC8bgcfvr0dlbfO8sq/9TyUewYBeNISstZOMbK4iuVnyCBRyFV7mPJBZv
         i0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504059; x=1746108859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWj7uDN15UXCYW87dO7IIzOLdNiL+f7UvEUy/qTIHd4=;
        b=vq53eSXU8NlYRfgD4jzljxmuI7X+WHvMsedGMoZx0i4dxNytjo0lu7N4OIgSWVRUCZ
         WBzNDtp35gGhxQOlPa/3Y3zJpAxlg17SkzsS3BX9qMlqr/5zcm13OWaDXPff7SGtP096
         K4wojDiBTROOFhOhnoyVMpB+LRlaN+IiXBbEFaltpk0bcSCFhMKjrinRQNnWx7J/QFtf
         chFE+Ol7VtsNpF50vCNGtxuN/IlS201/DtSAstNP4yFxf0KBYCdJdu3Q7GbO1wtGChAD
         62nNYZxca9Fxr0hSslaaPOHIiob+6sIOXbMZgPhj2lfC9sk04/Af7JlaRgHRPb5jmyJw
         OqFg==
X-Forwarded-Encrypted: i=1; AJvYcCXmLuJkd0On9XFhrFdVYJJIZFH3UxTxiXgf1LAQpKvppGRAIOOU3Rqk2Koh4onvNeV4dxwPUAq/gsxnsEW5v8TI@lists.infradead.org
X-Gm-Message-State: AOJu0YwzergAAgkR/nofVAWd8laoeObRcCs9s8Dkhk5kozPTE3IZw7qn
	Cb1OGQeEBHdXWO7SjZSCHpwKl35aexRiLbEYhIYacPlCG1EG3dcFzNIzlLhHZUjMfENB91BkjWQ
	7
X-Gm-Gg: ASbGncveZnH+ggHqTZoXAxr5xpv5ixtaO5NVGnnAhyFTwKWqDhAdma2DcZ4WSsVqrxq
	FHGKd93trfOoyFbKGFpKBYpkOjBqgH5IZN7JjB24aFp0mz2yCgNvbvBnyGOj/aRzrXTqq/2slkO
	tWHwqUrxh7lo8IF0dqPgxa7QKr0p5jXevhR37u5g1GNwrnQ2bI8Djl+DxKoO0taAoPnEy4ny8VL
	0I7zfnrkZiYvlxXGuZV8rzedIfMuH7iHNx5wHi3nrrMfuUIp7wYh759ICY5tSFd9loTb2RedZJe
	GIDylBR07n3DCWwCj1wYh2SiLyDEdvXZmHx+zWqcIn2yJVn5TBUlMhrOGQMyJ0atRO11Z5vnRDR
	p+NypIh7o9+bu0PFbyCaqMv1cctw=
X-Google-Smtp-Source: AGHT+IEZ62CGRLn02mw6Sp1FYoWsMMZ/LoDmb0ZQtBfZ0JQt0jIozyM3jnvRsN2MwUnOvlF4h+jCiw==
X-Received: by 2002:a05:6000:184c:b0:39f:64ff:668d with SMTP id ffacd0b85a97d-3a06cfa5a65mr2546775f8f.40.1745504058677;
        Thu, 24 Apr 2025 07:14:18 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:18 -0700 (PDT)
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
	Alex Elder <elder@linaro.org>
Subject: [RFC PATCH 25/34] gunyah: Add Qualcomm Gunyah platform ops
Date: Thu, 24 Apr 2025 15:13:32 +0100
Message-Id: <20250424141341.841734-26-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071420_276017_025E5708 
X-CRM114-Status: GOOD (  26.65  )
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

Qualcomm platforms have a firmware entity which performs access control
to physical pages. Dynamically started Gunyah virtual machines use the
QCOM_SCM_RM_MANAGED_VMID for access. Linux thus needs to assign access
to the memory used by guest VMs. Gunyah doesn't do this operation for us
since it is the current VM (typically VMID_HLOS) delegating the access
and not Gunyah itself. Use the Gunyah platform ops to achieve this so
that only Qualcomm platforms attempt to make the needed SCM calls.

Reviewed-by: Alex Elder <elder@linaro.org>
Co-developed-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Signed-off-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 drivers/virt/gunyah/Kconfig       |  13 ++
 drivers/virt/gunyah/Makefile      |   1 +
 drivers/virt/gunyah/gunyah_qcom.c | 220 ++++++++++++++++++++++++++++++
 3 files changed, 234 insertions(+)
 create mode 100644 drivers/virt/gunyah/gunyah_qcom.c

diff --git a/drivers/virt/gunyah/Kconfig b/drivers/virt/gunyah/Kconfig
index 23ba523d25dc..fe2823dc48ba 100644
--- a/drivers/virt/gunyah/Kconfig
+++ b/drivers/virt/gunyah/Kconfig
@@ -4,6 +4,7 @@ config GUNYAH
 	tristate "Gunyah Virtualization drivers"
 	depends on ARM64
 	select GUNYAH_PLATFORM_HOOKS
+	imply GUNYAH_QCOM_PLATFORM if ARCH_QCOM
 	help
 	  The Gunyah drivers are the helper interfaces that run in a guest VM
 	  such as basic inter-VM IPC and signaling mechanisms, and higher level
@@ -14,3 +15,15 @@ config GUNYAH
 
 config GUNYAH_PLATFORM_HOOKS
 	tristate
+
+config GUNYAH_QCOM_PLATFORM
+	tristate "Support for Gunyah on Qualcomm platforms"
+	depends on GUNYAH
+	select GUNYAH_PLATFORM_HOOKS
+	select QCOM_SCM
+	help
+	  Enable support for interacting with Gunyah on Qualcomm
+	  platforms. Interaction with Qualcomm firmware requires
+	  extra platform-specific support.
+
+	  Say Y/M here to use Gunyah on Qualcomm platforms.
diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
index 45cabba3110c..349c37e9f0ad 100644
--- a/drivers/virt/gunyah/Makefile
+++ b/drivers/virt/gunyah/Makefile
@@ -4,3 +4,4 @@ gunyah_rsc_mgr-y += rsc_mgr.o rsc_mgr_rpc.o
 
 obj-$(CONFIG_GUNYAH) += gunyah.o gunyah_rsc_mgr.o
 obj-$(CONFIG_GUNYAH_PLATFORM_HOOKS) += gunyah_platform_hooks.o
+obj-$(CONFIG_GUNYAH_QCOM_PLATFORM) += gunyah_qcom.o
diff --git a/drivers/virt/gunyah/gunyah_qcom.c b/drivers/virt/gunyah/gunyah_qcom.c
new file mode 100644
index 000000000000..f2342d51a018
--- /dev/null
+++ b/drivers/virt/gunyah/gunyah_qcom.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/gunyah.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+#define QCOM_SCM_RM_MANAGED_VMID 0x3A
+#define QCOM_SCM_MAX_MANAGED_VMID 0x3F
+
+static int
+qcom_scm_gunyah_rm_pre_mem_share(struct gunyah_rm *rm,
+				 struct gunyah_rm_mem_parcel *mem_parcel)
+{
+	struct qcom_scm_vmperm *new_perms __free(kfree) = NULL;
+	u64 src, src_cpy;
+	int ret = 0, i, n;
+	u16 vmid;
+
+	new_perms = kcalloc(mem_parcel->n_acl_entries, sizeof(*new_perms),
+			    GFP_KERNEL);
+	if (!new_perms)
+		return -ENOMEM;
+
+	for (n = 0; n < mem_parcel->n_acl_entries; n++) {
+		vmid = le16_to_cpu(mem_parcel->acl_entries[n].vmid);
+		if (vmid <= QCOM_SCM_MAX_MANAGED_VMID)
+			new_perms[n].vmid = vmid;
+		else
+			new_perms[n].vmid = QCOM_SCM_RM_MANAGED_VMID;
+		if (mem_parcel->acl_entries[n].perms & GUNYAH_RM_ACL_X)
+			new_perms[n].perm |= QCOM_SCM_PERM_EXEC;
+		if (mem_parcel->acl_entries[n].perms & GUNYAH_RM_ACL_W)
+			new_perms[n].perm |= QCOM_SCM_PERM_WRITE;
+		if (mem_parcel->acl_entries[n].perms & GUNYAH_RM_ACL_R)
+			new_perms[n].perm |= QCOM_SCM_PERM_READ;
+	}
+
+	src = BIT_ULL(QCOM_SCM_VMID_HLOS);
+
+	for (i = 0; i < mem_parcel->n_mem_entries; i++) {
+		src_cpy = src;
+		ret = qcom_scm_assign_mem(
+			le64_to_cpu(mem_parcel->mem_entries[i].phys_addr),
+			le64_to_cpu(mem_parcel->mem_entries[i].size), &src_cpy,
+			new_perms, mem_parcel->n_acl_entries);
+		if (ret)
+			break;
+	}
+
+	/* Did it work ok? */
+	if (!ret)
+		return 0;
+
+	src = 0;
+	for (n = 0; n < mem_parcel->n_acl_entries; n++) {
+		vmid = le16_to_cpu(mem_parcel->acl_entries[n].vmid);
+		if (vmid <= QCOM_SCM_MAX_MANAGED_VMID)
+			src |= BIT_ULL(vmid);
+		else
+			src |= BIT_ULL(QCOM_SCM_RM_MANAGED_VMID);
+	}
+
+	new_perms[0].vmid = QCOM_SCM_VMID_HLOS;
+	new_perms[0].perm = QCOM_SCM_PERM_EXEC | QCOM_SCM_PERM_WRITE |
+			    QCOM_SCM_PERM_READ;
+
+	for (i--; i >= 0; i--) {
+		src_cpy = src;
+		WARN_ON_ONCE(qcom_scm_assign_mem(
+			le64_to_cpu(mem_parcel->mem_entries[i].phys_addr),
+			le64_to_cpu(mem_parcel->mem_entries[i].size), &src_cpy,
+			new_perms, 1));
+	}
+
+	return ret;
+}
+
+static int
+qcom_scm_gunyah_rm_post_mem_reclaim(struct gunyah_rm *rm,
+				    struct gunyah_rm_mem_parcel *mem_parcel)
+{
+	struct qcom_scm_vmperm new_perms;
+	u64 src = 0, src_cpy;
+	int ret = 0, i, n;
+	u16 vmid;
+
+	new_perms.vmid = QCOM_SCM_VMID_HLOS;
+	new_perms.perm = QCOM_SCM_PERM_EXEC | QCOM_SCM_PERM_WRITE |
+			 QCOM_SCM_PERM_READ;
+
+	for (n = 0; n < mem_parcel->n_acl_entries; n++) {
+		vmid = le16_to_cpu(mem_parcel->acl_entries[n].vmid);
+		if (vmid <= QCOM_SCM_MAX_MANAGED_VMID)
+			src |= (1ull << vmid);
+		else
+			src |= (1ull << QCOM_SCM_RM_MANAGED_VMID);
+	}
+
+	for (i = 0; i < mem_parcel->n_mem_entries; i++) {
+		src_cpy = src;
+		ret = qcom_scm_assign_mem(
+			le64_to_cpu(mem_parcel->mem_entries[i].phys_addr),
+			le64_to_cpu(mem_parcel->mem_entries[i].size), &src_cpy,
+			&new_perms, 1);
+		WARN_ON_ONCE(ret);
+	}
+
+	return ret;
+}
+
+static int
+qcom_scm_gunyah_rm_pre_demand_page(struct gunyah_rm *rm, u16 vmid,
+				   enum gunyah_pagetable_access access,
+				   struct folio *folio)
+{
+	struct qcom_scm_vmperm new_perms[2];
+	unsigned int n = 1;
+	u64 src;
+
+	new_perms[0].vmid = QCOM_SCM_RM_MANAGED_VMID;
+	new_perms[0].perm = QCOM_SCM_PERM_EXEC | QCOM_SCM_PERM_WRITE |
+			    QCOM_SCM_PERM_READ;
+	if (access != GUNYAH_PAGETABLE_ACCESS_X &&
+	    access != GUNYAH_PAGETABLE_ACCESS_RX &&
+	    access != GUNYAH_PAGETABLE_ACCESS_RWX) {
+		new_perms[1].vmid = QCOM_SCM_VMID_HLOS;
+		new_perms[1].perm = QCOM_SCM_PERM_EXEC | QCOM_SCM_PERM_WRITE |
+				    QCOM_SCM_PERM_READ;
+		n++;
+	}
+
+	src = BIT_ULL(QCOM_SCM_VMID_HLOS);
+
+	return qcom_scm_assign_mem(__pfn_to_phys(folio_pfn(folio)),
+				   folio_size(folio), &src, new_perms, n);
+}
+
+static int
+qcom_scm_gunyah_rm_release_demand_page(struct gunyah_rm *rm, u16 vmid,
+				       enum gunyah_pagetable_access access,
+				       struct folio *folio)
+{
+	struct qcom_scm_vmperm new_perms;
+	u64 src;
+
+	new_perms.vmid = QCOM_SCM_VMID_HLOS;
+	new_perms.perm = QCOM_SCM_PERM_EXEC | QCOM_SCM_PERM_WRITE |
+			 QCOM_SCM_PERM_READ;
+
+	src = BIT_ULL(QCOM_SCM_RM_MANAGED_VMID);
+
+	if (access != GUNYAH_PAGETABLE_ACCESS_X &&
+	    access != GUNYAH_PAGETABLE_ACCESS_RX &&
+	    access != GUNYAH_PAGETABLE_ACCESS_RWX)
+		src |= BIT_ULL(QCOM_SCM_VMID_HLOS);
+
+	return qcom_scm_assign_mem(__pfn_to_phys(folio_pfn(folio)),
+				   folio_size(folio), &src, &new_perms, 1);
+}
+
+static struct gunyah_rm_platform_ops qcom_scm_gunyah_rm_platform_ops = {
+	.pre_mem_share = qcom_scm_gunyah_rm_pre_mem_share,
+	.post_mem_reclaim = qcom_scm_gunyah_rm_post_mem_reclaim,
+	.pre_demand_page = qcom_scm_gunyah_rm_pre_demand_page,
+	.release_demand_page = qcom_scm_gunyah_rm_release_demand_page,
+};
+
+/* {19bd54bd-0b37-571b-946f-609b54539de6} */
+static const uuid_t QCOM_EXT_UUID = UUID_INIT(0x19bd54bd, 0x0b37, 0x571b, 0x94,
+					      0x6f, 0x60, 0x9b, 0x54, 0x53,
+					      0x9d, 0xe6);
+
+#define GUNYAH_QCOM_EXT_CALL_UUID_ID                              \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, \
+			   ARM_SMCCC_OWNER_VENDOR_HYP, 0x3f01)
+
+static bool gunyah_has_qcom_extensions(void)
+{
+	struct arm_smccc_res res;
+	uuid_t uuid;
+	u32 *up;
+
+	arm_smccc_1_1_smc(GUNYAH_QCOM_EXT_CALL_UUID_ID, &res);
+
+	up = (u32 *)&uuid.b[0];
+	up[0] = lower_32_bits(res.a0);
+	up[1] = lower_32_bits(res.a1);
+	up[2] = lower_32_bits(res.a2);
+	up[3] = lower_32_bits(res.a3);
+
+	return uuid_equal(&uuid, &QCOM_EXT_UUID);
+}
+
+static int __init qcom_gunyah_platform_hooks_register(void)
+{
+	if (!gunyah_has_qcom_extensions())
+		return -ENODEV;
+
+	pr_info("Enabling Gunyah hooks for Qualcomm platforms.\n");
+
+	return gunyah_rm_register_platform_ops(
+		&qcom_scm_gunyah_rm_platform_ops);
+}
+
+static void __exit qcom_gunyah_platform_hooks_unregister(void)
+{
+	gunyah_rm_unregister_platform_ops(&qcom_scm_gunyah_rm_platform_ops);
+}
+
+module_init(qcom_gunyah_platform_hooks_register);
+module_exit(qcom_gunyah_platform_hooks_unregister);
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Platform Hooks for Gunyah");
+MODULE_LICENSE("GPL");
-- 
2.39.5


