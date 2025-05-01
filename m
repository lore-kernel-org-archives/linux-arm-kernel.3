Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715ACC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 23:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCC7bKa/se6mYg+6T9wGzMiASCuQ0cecrMrt+P8VCow=; b=Yka0OkrCGzJ4PsXyhuS2d0UM/A
	wFdLV0T2fEsANAKk/+t1HToFaDBIpWo1zAxMgBjz+V8kdkJK9t2cB42/JzVR5zQt3/ygm1nsJd5o9
	hQ3nUC2vN7NlJqOGD74FPV0JQN19NDu9LwjJ5UEtoOf/zRB4A6x+1V1ome4fl1dNh9R4VuzDRAhFc
	Mk8MHyxlbMyOsQVzy+nDVHJoHW69i06yXXx6C7UtL8BHMbCd/nF2jtx8Zgjzo2W/KquyLDkrGRH6Z
	pygUnzEtOYLD7NMcL4TVeJQkQITHOIp71288ihoiBuHmJ7ej7LBeD95lKLn7LxglDBPgqm1sMe5pr
	udukDpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAd3O-00000000DKQ-0Cy7;
	Thu, 01 May 2025 23:10:54 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcoP-000000007FH-431x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 22:55:27 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-736b431ee0dso1219907b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 15:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140124; x=1746744924; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCC7bKa/se6mYg+6T9wGzMiASCuQ0cecrMrt+P8VCow=;
        b=N1kbpx8vkwsHGBjhGbOcZz0EukLCv2+tviajXQGhca2w1Q3yl4qhyvIGsohxKZl8uS
         RljXlNAWj+0Uq7coLw2tSyvIqzK7bHQb8OZ9ksTVfSWPqzvzXm1yhx8M1tKhl7eucxfE
         mzV8Iwq0zuQQFsLlwjQ/DwhQTetjDSLtpmSahJ53RIYir/XjNdnbXACpGcze5Y8CiJ1b
         LR2Kn07Saf2KK1Yhj1Ch9H0iDn9m8HCDDc5PpH+8FAooAJ4eM99AgOUIKZVPsdqylVEi
         dmS0IngJDvJz6HDNP7ikjMAlhG7CyalNelU7oYaX7V7kwi+cITYV6OMnDnxwsyATOwNG
         ATaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140124; x=1746744924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCC7bKa/se6mYg+6T9wGzMiASCuQ0cecrMrt+P8VCow=;
        b=eTSjC3wGVvqp7N9gTXSo7kW7JuOFsJ38DdDp8Ge+DX+bfLrVyqIOqQSWIJmBf13N6H
         gAImg93rboko0OPIM9C683YZtEtj7xxcSrmOJkwwbRa9A/ZEzHZ4NWnPifkXZ2M05DXH
         R90jX6F4y2ptPA3D6jjQTk+slO9n72c+rXHEhfbGhPpraFof9PY2kZLgxdBBtEIlQ4s1
         TpdOHdrQjhZ1D7fONKVdgoJtOgzNIPQDP7byGkkqd2mshSRBOAXpcHfOqMlqkHoqKrsZ
         AaWo9654VVPrrjqypWBD7NdZW9udaN7DCGL1DlsmJA+O19+2oe1K3s2//4WrBQ03yM8j
         d7lw==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZvGz+icN/4ICQCdwZS+8WYMDAqud/hyuZ6rNX577IYRa0H0HT8sySejsyUhaJYCly3/GTqUZhdT9CPgIaLFl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk/xcUycwrQ8CLIWYcCKIpxOjwiV15AznupIIt9Ou0nKWB00TD
	84vsz44DHIDhorf3lwO9bFRvHTTp/3YAan/sGGLhe8EvP7TzK+231RyDs14A4/PRfnaf7blv9a6
	yNV7NWvwC2vSASgQ9Mw==
X-Google-Smtp-Source: AGHT+IG+w15ETdCoK+fHMVjjNvznubiYgRmkIOBeTduHj1HNG9YRODcurbY+TyPTJCH95DRqbicgO/a5HkcDFdV/
X-Received: from pgbd25.prod.google.com ([2002:a63:4f19:0:b0:b15:84fa:ff1f])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:d527:b0:1f5:82ae:69d1 with SMTP id adf61e73a8af0-20cded43612mr889605637.20.1746140124601;
 Thu, 01 May 2025 15:55:24 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:15 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-9-changyuanl@google.com>
Subject: [PATCH v7 08/18] kexec: add KHO support to kexec file loads
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_155526_082221_F8C97596 
X-CRM114-Status: GOOD (  24.13  )
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
index 3bf74b4960f84..ef21db6c59d51 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -26,6 +26,7 @@
  * internal APIs.
  */
 #include "../mm/internal.h"
+#include "kexec_internal.h"
 
 #define KHO_FDT_COMPATIBLE "kho-v1"
 #define PROP_PRESERVED_MEMORY_MAP "preserved-memory-map"
@@ -1192,3 +1193,69 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
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
2.49.0.906.g1f30a19c02-goog


