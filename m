Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC27C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJPeIElnNt/I3/MaK5uh0cldn9yJJ+y5OnW6ddziJAo=; b=swTTG7ajUtChSwhF4AY0GLJGHj
	XL/xR7SNIUvMYxe7+DHv4MpQ9hvPWKkmF3QP3N4XeCIFTaQU4gcJ5f1lG/UrfMqyV+PHobhKG+Z0w
	JuHPK9bJ6Gu53xVtdA/ZEXJcsLxGS/m4Dbk0M5Qqz5CjWMD51Uy/MqPjpkvt8h76yWc2MEnsKGKdj
	ivCMdRJKQjiSYtI/7dduNy+nYinTpWZCv7ciQmnAvrsEQeKCWh4CEmiwJn5pIU6purhT955I7Xt7C
	SFEI5js1LZQ6uLE9QdolFqH4aYHZnQwwH8dxTZv4lSRh66j2TJif0/VGFyUAfA797o5xm0hcCDr9d
	XWex2kbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIvL-00000002tmA-21Lo;
	Fri, 09 May 2025 08:17:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIS9-00000002ntl-2BiK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 May 2025 07:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rJPeIElnNt/I3/MaK5uh0cldn9yJJ+y5OnW6ddziJAo=; b=U9cOaBqKfE1IEB/hzq/nmpK2qp
	oGb3q2NpQOI8VJCvyji5akLdT+VZ0Z6oGaJTrGVXV3wZJw7832RV0161fZ4/PbuFbRujH0AlpYfYW
	T6P+PVBDuPZPjR9QLnm+jRVxdUw6rCXEhhkpxl8X9iJUtbY0cB4X6+YduuinWyT3K0Csd6Hkg3sqh
	gx5wHS48a/tMN3v7Hkma1/VOwevq2SZVthPrQTZde08em0A4zGQ35bCyTjfBXmz388RNI2C9sw0Be
	uJ2xOn/YRUflehxQ0wDyBV+X2oxDWXWe+DxCqKBdaJrGs3/6GG5Tr4/zwD1Q7uE/mRIJhMY6FuQ8x
	jmTVqxJQ==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDIRu-0000000GEew-0JRk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:47:26 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74089884644so1950791b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776827; x=1747381627; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJPeIElnNt/I3/MaK5uh0cldn9yJJ+y5OnW6ddziJAo=;
        b=1e6+Aqj7Ph1tuvzbR4T2bFUVtikcwWfrxR5eaKB//PG1VF80XsucD4qiM54A5ijznK
         cB+ygZAU9r98ZnThrY+/PHInM9LdioRxP8mqA9oNk9SauwjC6b2oqNB6ja59+Obl4Qad
         kWBlU2gBH8ZWgGrTKolQv6AdNV8P0Z9OmobbfMZWPwe9EzP2By41iaJmRSz4FKvtQbv9
         olg2/cXmGdxm5+cOmC9JXXs/MGoVmPnofTYoDpjo4kj2EFolEXFRGe5GPln/1V/RrWZ6
         sSQGS6K4QzrxsZ4j8mGdh8XaBC2bVlf3jXpGHX7DkeJ5iW9mWMuddX1orCbjY2hrwKBj
         qHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776827; x=1747381627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJPeIElnNt/I3/MaK5uh0cldn9yJJ+y5OnW6ddziJAo=;
        b=RBXsyOyaChzBmQghAOGLnU4H4ijw5rLpSX1PFKBNqQIDuBSBQBsTGqScYjt2/VDM62
         LAe5eFfop+AXep1iSlWPCY3ZDI+vMjlZpu6FMA9pjA0tCAb2rlff5XcXzdsC/5NWU7SV
         ubBipd5NhxiD67d6isZPzfEnLiL0GQGmVYpLnGDCo5naaw71n+AihRHpL6OLsAHWuoIN
         q792ZARWEm1BKXkIkxzbmrMfxjX2C4PNlXDXX70n2aKAaEfrMbAIat1VEpHPo/svhhDF
         x1Vb3aw71YFB3MuShyF1oIAuxlbTscNro7GvcT0wfzWr0oY6VA1EtKseBs3Pny49ldTB
         FJsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE1BoJ94AlhlcDU+Pbz/RewiIqj/dj0xg6h0yUcfiATvJCIrbR5+ZMvF4ZdNwpluohP4RNwQjmDRICCr/MJqKR@lists.infradead.org
X-Gm-Message-State: AOJu0YxkoAuVTx5H7TTXXaT4BmQyMWNEEMQoJ259kl29WiaUyh5gU9pP
	/xWyTmk9CmSXJibWQwoZjYywZKsqERAqrpwhwAzDFBPIRgrSG4s7upxCjfX91dmYFD6oOGUYdkP
	UAx/wR5B1C5koCh+z+g==
X-Google-Smtp-Source: AGHT+IEK1/WlmP38MYP4hEes8GqKaqWx3jiFruF23mNJt24+iXk5dMi5uOZdu7gymuTIRK+YGmcQLoBz9uRHRSQG
X-Received: from pga10.prod.google.com ([2002:a05:6a02:4f8a:b0:b20:c9:a993])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:1582:b0:1f5:79c4:5da0 with SMTP id adf61e73a8af0-215abc16c45mr3639959637.31.1746776826867;
 Fri, 09 May 2025 00:47:06 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:25 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-8-changyuanl@google.com>
Subject: [PATCH v8 07/17] kexec: add KHO support to kexec file loads
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_084722_773680_EF7E790D 
X-CRM114-Status: GOOD (  24.35  )
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

From: Alexander Graf <graf@amazon.com>

Kexec has 2 modes: A user space driven mode and a kernel driven mode.
For the kernel driven mode, kernel code determines the physical
addresses of all target buffers that the payload gets copied into.

With KHO, we can only safely copy payloads into the "scratch area".
Teach the kexec file loader about it, so it only allocates for that
area. In addition, enlighten it with support to ask the KHO subsystem
for its respective payloads to copy into target memory. Also teach the
KHO subsystem how to fill the images for file loads.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/kexec.h   |  5 +++
 kernel/kexec_file.c     | 13 ++++++++
 kernel/kexec_handover.c | 67 +++++++++++++++++++++++++++++++++++++++++
 kernel/kexec_internal.h | 16 ++++++++++
 4 files changed, 101 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index c8971861521a5..075255de81543 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -371,6 +371,11 @@ struct kimage {
 	size_t ima_buffer_size;
 #endif
 
+	struct {
+		struct kexec_segment *scratch;
+		phys_addr_t fdt;
+	} kho;
+
 	/* Core ELF header buffer */
 	void *elf_headers;
 	unsigned long elf_headers_sz;
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index fba686487e3b5..77758c5331229 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -253,6 +253,11 @@ kimage_file_prepare_segments(struct kimage *image, int kernel_fd, int initrd_fd,
 	/* IMA needs to pass the measurement list to the next kernel. */
 	ima_add_kexec_buffer(image);
 
+	/* If KHO is active, add its images to the list */
+	ret = kho_fill_kimage(image);
+	if (ret)
+		goto out;
+
 	/* Call image load handler */
 	ldata = kexec_image_load_default(image);
 
@@ -648,6 +653,14 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
 	if (kbuf->mem != KEXEC_BUF_MEM_UNKNOWN)
 		return 0;
 
+	/*
+	 * If KHO is active, only use KHO scratch memory. All other memory
+	 * could potentially be handed over.
+	 */
+	ret = kho_locate_mem_hole(kbuf, locate_mem_hole_callback);
+	if (ret <= 0)
+		return ret;
+
 	if (!IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
 		ret = kexec_walk_resources(kbuf, locate_mem_hole_callback);
 	else
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 9cc818cefd151..69b953551677c 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -26,6 +26,7 @@
  * internal APIs.
  */
 #include "../mm/internal.h"
+#include "kexec_internal.h"
 
 #define KHO_FDT_COMPATIBLE "kho-v1"
 #define PROP_PRESERVED_MEMORY_MAP "preserved-memory-map"
@@ -1197,3 +1198,69 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 	if (err)
 		pr_warn("disabling KHO revival: %d\n", err);
 }
+
+/* Helper functions for kexec_file_load */
+
+int kho_fill_kimage(struct kimage *image)
+{
+	ssize_t scratch_size;
+	int err = 0;
+	struct kexec_buf scratch;
+
+	if (!kho_enable)
+		return 0;
+
+	image->kho.fdt = page_to_phys(kho_out.ser.fdt);
+
+	scratch_size = sizeof(*kho_scratch) * kho_scratch_cnt;
+	scratch = (struct kexec_buf){
+		.image = image,
+		.buffer = kho_scratch,
+		.bufsz = scratch_size,
+		.mem = KEXEC_BUF_MEM_UNKNOWN,
+		.memsz = scratch_size,
+		.buf_align = SZ_64K, /* Makes it easier to map */
+		.buf_max = ULONG_MAX,
+		.top_down = true,
+	};
+	err = kexec_add_buffer(&scratch);
+	if (err)
+		return err;
+	image->kho.scratch = &image->segment[image->nr_segments - 1];
+
+	return 0;
+}
+
+static int kho_walk_scratch(struct kexec_buf *kbuf,
+			    int (*func)(struct resource *, void *))
+{
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < kho_scratch_cnt; i++) {
+		struct resource res = {
+			.start = kho_scratch[i].addr,
+			.end = kho_scratch[i].addr + kho_scratch[i].size - 1,
+		};
+
+		/* Try to fit the kimage into our KHO scratch region */
+		ret = func(&res, kbuf);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+int kho_locate_mem_hole(struct kexec_buf *kbuf,
+			int (*func)(struct resource *, void *))
+{
+	int ret;
+
+	if (!kho_enable || kbuf->image->type == KEXEC_TYPE_CRASH)
+		return 1;
+
+	ret = kho_walk_scratch(kbuf, func);
+
+	return ret == 1 ? 0 : -EADDRNOTAVAIL;
+}
diff --git a/kernel/kexec_internal.h b/kernel/kexec_internal.h
index d35d9792402d1..30a733a55a67b 100644
--- a/kernel/kexec_internal.h
+++ b/kernel/kexec_internal.h
@@ -39,4 +39,20 @@ extern size_t kexec_purgatory_size;
 #else /* CONFIG_KEXEC_FILE */
 static inline void kimage_file_post_load_cleanup(struct kimage *image) { }
 #endif /* CONFIG_KEXEC_FILE */
+
+struct kexec_buf;
+
+#ifdef CONFIG_KEXEC_HANDOVER
+int kho_locate_mem_hole(struct kexec_buf *kbuf,
+			int (*func)(struct resource *, void *));
+int kho_fill_kimage(struct kimage *image);
+#else
+static inline int kho_locate_mem_hole(struct kexec_buf *kbuf,
+				      int (*func)(struct resource *, void *))
+{
+	return 1;
+}
+
+static inline int kho_fill_kimage(struct kimage *image) { return 0; }
+#endif /* CONFIG_KEXEC_HANDOVER */
 #endif /* LINUX_KEXEC_INTERNAL_H */
-- 
2.49.0.1015.ga840276032-goog


