Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B1DC982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIMZ/ZUARPPqvZz1xOu4RWFet2sLYJbZYKu9ojsMCnw=; b=XPI8Z+SFvGI+uPbRD421ws4KIW
	y9fBPhREuhiSDlk1/c7GkvMLsAVzeh0zImma+q24TeFpDQZXIt4r9aNX5z4asQIBQ2RbX8XNw64lw
	oUfCArxz91NWXHeywMqEB/wcKNe/yi0Xm6UJbZtc4CeGscnOLW85a7/nPcHx5l9M33TfqmUWSr79H
	wlgW4ae+3ri+8Y68nnmvMOPO5wlvvmC/BtTxzjVZJvCSxoUj4kEArxgX/gEWaJAgQ8j19ejm81/zT
	xbfouiK4xhgGPejiH+iJxtSncW6a16pV32Ik/+8M78clMRDQQc+Dlj72uOZnZ9vTgy0W5PR/DIKsh
	8d+cqC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHt-0000000FeEr-3zHh;
	Fri, 18 Sep 2026 22:42:33 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHe-0000000Fe2G-3GHI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:42:19 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8688139460bso1352722b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771336; x=1790376136; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIMZ/ZUARPPqvZz1xOu4RWFet2sLYJbZYKu9ojsMCnw=;
        b=i51BopaD+QtV0+pO+9pTtAFzUd4iB4DqnMlW0w1Z/FbrV3GbR6WaH9C9g5HE+A/QwV
         o0NwppEWBaiPvhzLAIZmcP9kVanSqeCX8tu0UHROX36gyRRUK3swhFAgaKiwz03/JcFh
         YpCX6Taclvh71Nf7cyZfIFPcoWjYSlmvNAsfc71maIiMHWXR+6QOP169AlG9ZZu3/PwE
         oC+O86umZ2L9MuKapcZBpNPav869jYlFHvk10STmjjtvgrRuHz5lfWuILEIIlGVoWHDn
         PyX6EdT5391trXKIVVnwJKvOmL8hc6CkgB9ZGehAlk3+QE5IIbEpQADzG3pmVFx7CAVU
         QqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771336; x=1790376136;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AIMZ/ZUARPPqvZz1xOu4RWFet2sLYJbZYKu9ojsMCnw=;
        b=AkcAYr04K++XvH5tsis9AvoTfBGizJFK6/M31K+vSun591VD+wJSwMu7s/8/UVs/st
         nNU+AebT3GlEvjcNm3/HqkTAHBxs/hr/H0xvBEk3oj2HdRz6KKbikklpQCqf0O1srfEG
         LQDNWS6Sg7qyqFDVj+579o4B+x80A2d+xymP/Lf9jiiJ3IUxQcif4ZLX0bc1zd5QAbfi
         HCEbtJVaRsObJwGc8FGgxCko/JDafMmRTDn2Mdb1JpmWbKkU4WpdSyTZEYN6UH5hrGbH
         gyETzPqWjpx5YUUfvbijc/GJX9TMP0K6z16ajJToC+vNl2ivgp5QIagpfKUboKDwc0hM
         HXpA==
X-Forwarded-Encrypted: i=1; AKwUvBz0dph7nYp9f/6XIwCeqg/sItkIOZ0f1GfUWqZyQUn/gHMOna1yZBHbjriHoqYIwIrSTrQHpAzBVtYCKi4j/KeP@lists.infradead.org
X-Gm-Message-State: AFuF++nIwqX1Xd2e+ifM/ninPRnpxjHzxjRaEkoiLplos6x1/6oqNCRS
	qi2mYCB/JB9uh0iP6fXbPHJ16xN1MEgl9EYlg6Y4QQFGUxbpQLMnMt0gA8PhUGXHdquOxe+N2BA
	aHJu5HU0g1GTx5TaBOY1CAk3e4Q==
X-Received: from pfbfv3.prod.google.com ([2002:a05:6a00:6183:b0:86a:d8db:2be])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4185:b0:86d:3958:6b13 with SMTP id d2e1a72fcca58-874dd5f0ecfmr7385047b3a.19.1789771335997;
 Fri, 18 Sep 2026 15:42:15 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:53 +0000
In-Reply-To: <20260918224157.1471085-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260918224157.1471085-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-8-dylanbhatch@google.com>
Subject: [PATCH v7 07/11] sframe: Add debug helpers with object name
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_154218_937124_361F3BC1 
X-CRM114-Status: GOOD (  17.90  )
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

Include the object name for kernel .sframe sections, indicated by the
format "(<module-name>)".

Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v6:
 - Compute objname of sec on the fly to avoid allocating/storing an
   extra string in struct sframe_section for the name.
 - Squash dbg_print_header() definition, and add calls from
   init_sframe_table() and sframe_module_init().
---
 kernel/unwind/sframe.c       | 11 +++++++----
 kernel/unwind/sframe_debug.h | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 kernel/unwind/sframe_debug.h

diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index e6542bb678585..c4715befb59b5 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -15,6 +15,7 @@
 #include <asm/sections.h>
 
 #include "sframe.h"
+#include "sframe_debug.h"
 
 static bool sframe_init __ro_after_init;
 struct sframe_section kernel_sfsec __ro_after_init;
@@ -497,7 +498,7 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	header_end = sec->sframe_start + sizeof(struct sframe_header);
 	if (header_end >= sec->sframe_end) {
-		pr_debug("header struct doesn't fit in section\n");
+		dbg_sec(sec, "header struct doesn't fit in section\n");
 		return -EINVAL;
 	}
 
@@ -507,12 +508,12 @@ static int sframe_read_header(struct sframe_section *sec)
 	    shdr->preamble.version != SFRAME_VERSION_3 ||
 	    !(shdr->preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
 	    shdr->auxhdr_len) {
-		pr_debug("bad/unsupported sframe header\n");
+		dbg_sec(sec, "bad/unsupported sframe header\n");
 		return -EINVAL;
 	}
 
 	if (!shdr->num_fdes || !shdr->num_fres) {
-		pr_debug("no fde/fre entries\n");
+		dbg_sec(sec, "no fde/fre entries\n");
 		return -EINVAL;
 	}
 
@@ -524,7 +525,7 @@ static int sframe_read_header(struct sframe_section *sec)
 	fres_end   = fres_start + shdr->fre_len;
 
 	if (fres_start < fdes_end || fres_end > sec->sframe_end) {
-		pr_debug("inconsistent fde/fre offsets\n");
+		dbg_sec(sec, "inconsistent fde/fre offsets\n");
 		return -EINVAL;
 	}
 
@@ -551,6 +552,7 @@ void __init init_sframe_table(void)
 	}
 
 	sframe_init = true;
+	dbg_print_header(&kernel_sfsec);
 }
 
 #ifdef CONFIG_MODULES
@@ -611,6 +613,7 @@ void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size)
 
 	/* Ensure SFrame is initialized when sframe_find() happens */
 	WRITE_ONCE(mod->arch.sframe_init, true);
+	dbg_print_header(sec);
 }
 
 #endif
diff --git a/kernel/unwind/sframe_debug.h b/kernel/unwind/sframe_debug.h
new file mode 100644
index 0000000000000..114a4ff4899ef
--- /dev/null
+++ b/kernel/unwind/sframe_debug.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _SFRAME_DEBUG_H
+#define _SFRAME_DEBUG_H
+
+#include <linux/sframe.h>
+#include "sframe.h"
+
+#ifdef CONFIG_MODULES
+
+#define objname(sec) ((sec) == &kernel_sfsec					\
+		     ? "vmlinux"						\
+		     : container_of((sec), struct module, arch.sframe_sec)->name)
+
+#else
+
+#define objname(...) "vmlinux"
+
+#endif
+
+#define dbg_sec(sec, fmt, ...)						\
+	pr_debug("(%s): " fmt, objname(sec), ##__VA_ARGS__)
+
+static __always_inline void dbg_print_header(struct sframe_section *sec)
+{
+	unsigned long fdes_end;
+
+	fdes_end = sec->fdes_start + (sec->num_fdes * sizeof(struct sframe_fde_v3));
+
+	dbg_sec(sec, "SEC:0x%lx-0x%lx fdes:0x%lx-0x%lx fres:0x%lx-0x%lx ra_off:%d fp_off:%d\n",
+		sec->sframe_start, sec->sframe_end, sec->fdes_start, fdes_end, sec->fres_start,
+		sec->fres_end, sec->ra_off, sec->fp_off);
+}
+
+#endif /* _SFRAME_DEBUG_H */
-- 
2.55.0.1082.g2b9226bbc0-goog


