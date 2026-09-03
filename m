Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ADEC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 02:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1Sj3SZIoFO1IrO+MibWwCI7jpIestNZ9bFRqEQ8nhA=; b=yjrPxS3hgSOPZef7pReMNVTKpL
	eRhdfCkD+mZ/+XiDXdGGZ3FUB0NCbz773VGpfh4gnD4spjiAjCY9FlIBZepk3J/ixl00bHqHoxW8p
	dCcyyV2eBoXu4pgRC6X98Oz7n9fW4ZM2W8wklDQsSL4YP2ryzCIBqRjJF6havWT/Ml9HNj3kmfgs4
	CvQC7GXOb+vXgXzd16ehQOQCAMM/RfjkMltiQYpewEs+e9i78Rbf2BVxsjMK/3q1rz1l8a+x8drOl
	d+JuEvWJh6tCVz0L2rAxYDr/R502evxzDFinvnOlGp2P3Eq11Tmbn3wYqmFWo62B/dPz4TENN7URJ
	sWTpO2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xI6-0000000GDBN-1WcP;
	Thu, 03 Sep 2026 02:35:02 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xI2-0000000GD89-3Mpe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 02:35:00 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso618195a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788402898; x=1789007698; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1Sj3SZIoFO1IrO+MibWwCI7jpIestNZ9bFRqEQ8nhA=;
        b=fOR/nqVM8iG00vf9FMZcN+8YCru0WHbcssz8CTMMAxk6PIIxZ00LYmKf+EPjVIHQgy
         cdrp8M3EIEM+30quCgn1m/XQNot0Ow5YaiU3Vkq9UDsaoDAfK5HYaIk6XnywksJ3Xwou
         fcOmqfp1rOiAQVrx0Y49AaG+wSDRpH3enOLsMIsNMbYoJz5kOFsYiW4uUJkK0G0x4p/8
         JEGDdRbL86u7Fcqu2pX1ThXSssyDBThUp3CmNe5eacDw/29NwDEGobchfqswbiYJ2XgW
         czAZ5aJ//AnASs+S4pUJXbmexVxel8uUoTwtiPyNxmN1UPKf2csmRgrxglGIptuMmKe3
         GjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788402898; x=1789007698;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1Sj3SZIoFO1IrO+MibWwCI7jpIestNZ9bFRqEQ8nhA=;
        b=EWacz4uaXfBMZlnP4XQJ7bE8Wr9E6L6e9faqdVP5Z8A2QRRpkKTF4e+ftkrhjB7+t8
         OdEt+CE+zZtGoVCi+SvosaYPR4dqot5WCFEbgO7EoDw1k5g3u7+riUGjd2A5DaptW+YY
         12BOonjUl1LsQfRf/j9R4rU3Sg6p+PhbCzQchp9HuMSD/CmPK6Bh4j+mfLaCpI/QX4aI
         n1IHNke5wvfCd9LLkT4ZMAXCJ4wFebSMvlgsadIXvcroSf+KphogCEJoYgZBtikraXIl
         k7FWYdZ91vMHOfHCC+qzohyHTPXWVaiEF5UD+Qv6LBhQ6nY/D09IFpf/XimtYzb0TlHk
         W7kA==
X-Forwarded-Encrypted: i=1; AKwUvBzX7FVqMaQq8SlZwY02ANQKVw3JhG2Lp6D6CYBzKCiELGMm6L6u1SZVxqVFhc8ieGYkAOABihJsW41BF4bRlTz1@lists.infradead.org
X-Gm-Message-State: AFuF++lZm3NIJATy5z6tgYeMPLaY36T3Hhi0RonZiSB5CHUW7nYSBo9g
	3ySe+3/aJLo/FrRm7vrtDrcSr7QIdNmGqrwn+qjqYBdW8jAswDYGskpUKabQK5L57ZQ8DhOKaqg
	inB/8X+Ytr6Jk8FvQ56Um5A==
X-Received: from dybdb19.prod.google.com ([2002:a05:7300:b093:b0:328:684d:3f7])
 (user=loganodell job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b04:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-39b07f33963mr3591851a91.2.1788402897557;
 Wed, 02 Sep 2026 19:34:57 -0700 (PDT)
Date: Wed,  2 Sep 2026 19:34:51 -0700
In-Reply-To: <20260903023452.721732-1-loganodell@google.com>
Mime-Version: 1.0
References: <20260903023452.721732-1-loganodell@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260903023452.721732-3-loganodell@google.com>
Subject: [RFC PATCH 2/3] luo: Export feature support to vmlinux section
From: Logan Odell <loganodell@google.com>
To: arnd@arndb.de, pasha.tatashin@soleen.com, rppt@kernel.org, 
	pratyush@kernel.org, graf@amazon.com, akpm@linux-foundation.org, 
	pbonzini@redhat.com, maz@kernel.org, oupton@kernel.org, seanjc@google.com, 
	bhelgaas@google.com, alex@shazbot.org, jgg@nvidia.com, kevin.tian@intel.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-pci@vger.kernel.org, iommu@lists.linux.dev, 
	Logan Odell <loganodell@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_193458_993908_8FBA3016 
X-CRM114-Status: GOOD (  19.66  )
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

Create a liveupdate_features section that contains the feature
information for a given liveupdate component. Add the LUO component
first. These can be compared between two kernels to determine live
update compatibility. Features marked as required in the running kernel
will need to have that feature marked as supported in the next kernel to
be eligible for compatibility.

Suggested-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Logan Odell <loganodell@google.com>
---
 include/asm-generic/vmlinux.lds.h | 12 +++++++++++
 include/linux/kho/abi/luo.h       | 34 +++++++++++++++++++++++++++++++
 include/linux/liveupdate.h        | 12 +++++++++++
 kernel/liveupdate/luo_core.c      | 16 +++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 5659f4b5a125..aed4e282a78c 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -359,6 +359,17 @@
 #define THERMAL_TABLE(name)
 #endif
 
+#ifdef CONFIG_LIVEUPDATE
+#define LIVEUPDATE_FEATURES						\
+	. = ALIGN(8);							\
+	.liveupdate_features : AT(ADDR(.liveupdate_features) - LOAD_OFFSET) {	\
+		KEEP(*(.liveupdate_sec_hdr))				\
+		KEEP(*(.liveupdate_features))				\
+	}
+#else
+#define LIVEUPDATE_FEATURES
+#endif
+
 #define KERNEL_DTB()							\
 	STRUCT_ALIGN();							\
 	__dtb_start = .;						\
@@ -554,6 +565,7 @@
 	RO_EXCEPTION_TABLE						\
 	NOTES								\
 	BTF								\
+	LIVEUPDATE_FEATURES						\
 									\
 	. = ALIGN((align));						\
 	__end_rodata = .;
diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 0a7662a0cf9a..5b25e1b48cf5 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -230,4 +230,38 @@ struct luo_flb_ser {
 #define LIVEUPDATE_TEST_FLB_COMPATIBLE(i)	"liveupdate-test-flb-v" #i
 #endif
 
+#define LIVEUPDATE_VER_HDR_MAGIC	0x4c565550 /* 'LVUP' */
+#define LIVEUPDATE_VER_HDR_VER		1
+
+/**
+ * struct liveupdate_ver_hdr - Header of vmlinux section with version lists
+ * @magic:     Magic number ('LVUP').
+ * @version:   Version of the header format.
+ *
+ * This struct is the header for the vmlinux section ".liveupdate_features". The
+ * section contains the list of feature/version entries that the kernel supports.
+ */
+struct liveupdate_ver_hdr {
+	u32 magic;
+	u32 version;
+} __packed;
+
+/**
+ * struct liveupdate_feature_entry - Live update feature/version entry
+ * @name:       Name of the subsystem or feature ("luo" for core).
+ * @feat_bytes: Number of bytes covered by supp, req, and active bitmaps (e.g. 8).
+ * @reserved:   Reserved / padding for alignment.
+ * @supp:       Bitmask of supported features.
+ * @req:        Bitmask of required features.
+ * @active:     Bitmask of active features.
+ */
+struct liveupdate_feature_entry {
+	char name[LIVEUPDATE_HNDL_COMPAT_LENGTH];
+	u32 feat_bytes;
+	u32 reserved;
+	u64 supp;
+	u64 req;
+	u64 active;
+} __packed;
+
 #endif /* _LINUX_KHO_ABI_LUO_H */
diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 6051abc0612c..e058df23fed1 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -229,6 +229,16 @@ struct liveupdate_flb {
 
 #ifdef CONFIG_LIVEUPDATE
 
+#define LIVEUPDATE_FEATURE_ENTRY(_id, _name, _supp, _req, _active)	\
+	static const struct liveupdate_feature_entry __lu_feat_##_id	\
+	__used __section(".liveupdate_features") __aligned(8) = {	\
+		.name       = _name,					\
+		.feat_bytes = sizeof(u64),				\
+		.supp       = (_supp),					\
+		.req        = (_req),					\
+		.active     = (_active),				\
+	}
+
 /* Return true if live update orchestrator is enabled */
 bool liveupdate_enabled(void);
 
@@ -259,6 +269,8 @@ int liveupdate_get_token_outgoing(struct liveupdate_session *s,
 
 #else /* CONFIG_LIVEUPDATE */
 
+#define LIVEUPDATE_FEATURE_ENTRY(_id, _name, _supp, _req, _active)
+
 static inline bool liveupdate_enabled(void)
 {
 	return false;
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 6add1ecc463f..27413f895174 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -64,6 +64,22 @@
 #include "kexec_handover_internal.h"
 #include "luo_internal.h"
 
+/*
+ * This is the header for the ".liveupdate_features" section in vmlinux.
+ * The linker makes sure that this header precedes the entries.
+ */
+static const struct liveupdate_ver_hdr ver_hdr
+	__used __section(".liveupdate_sec_hdr") __aligned(8) = {
+	.magic   = LIVEUPDATE_VER_HDR_MAGIC,
+	.version = LIVEUPDATE_VER_HDR_VER,
+};
+
+/* Core LUO features */
+LIVEUPDATE_FEATURE_ENTRY(luo_core, "luo",
+			 LUO_CORE_FEATURES_SUPP,
+			 LUO_CORE_FEATURES_REQ,
+			 LUO_CORE_FEATURES_ACTIVE);
+
 static struct {
 	bool enabled;
 	struct luo_ser *luo_ser_out;
-- 
2.55.0.979.g7e5102b832-goog


