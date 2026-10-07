Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1696CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEhVH3BFD2TjsLmkDkgiwNlCGTM295XsbmIckPx7jns=; b=H4+IqruI9hw/jM8Bqh24oRLikG
	uaM2gV0kaLnDP//u7cadRXaB06D1x4VhYn1xBooq1VCe4Y8jJ8g0HZT5nQsLb0SeE2c2U2NvytSEj
	T8BQHWF97daCMpJg8BplJON4Wi1YRtNvZxTUoI5RuDn7wI/aJSYw3LLXvQiCf/5bcvLRs7JeXmtze
	HhzZq5S4UGF8iO3zScxpfycIGJk5xTHK/0+N3WCiCE/jyXX630BMPIVuqNzjJtUAvg6+oE1QHXads
	Dx1tsxCoICGe9RPF+irWZcX2yG89S24/k/XoB5xr/KdWRsw/KRUcylDNX9QjNPEwx2Hj+KF23BFsy
	Lc4W1MFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ49-00000002N0B-2dEW;
	Wed, 07 Oct 2026 11:44:09 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ40-00000002MqG-2MGC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:44:02 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2e617b5e9b3so2487985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373439; x=1791978239; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEhVH3BFD2TjsLmkDkgiwNlCGTM295XsbmIckPx7jns=;
        b=qs4MJ2sHCk2gd4irA8Hr6LqWZKq6dY6U4x+bls9rvXVMd+MqfvckMWePE3r3r5s70C
         OBGVODSTSoICUIPJuY3Ug/ZxLww5Qmv8wGhqaXycn0jzUuWkATp3WpZzZoEqUX/s4J9I
         WRTVcfsxPZYgX2u7FMN5Z8Lxt5JXmWiLG/h13fZ4eFCDIT3BIvYfGOyS9F6F5BmGg40R
         FDW4SAMKV5JzZbnJsgJuTAm8QtI0MZ+GFWasatin3jQvP+KJkAHMXQJUyQkDI2ErL258
         ULs66/ysXts/XSWu6xdlUfOFkj4k1QIyBCio9LqgR93f8lJyOYR0oAEyU2LWuAVRaN8y
         /6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373439; x=1791978239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEhVH3BFD2TjsLmkDkgiwNlCGTM295XsbmIckPx7jns=;
        b=hjUwfcKJVPH6Cu3aEkHTeSFOgAHMQC6npeEmOKM2pwhMVLyXmezhuVkbnj6Fj70WtF
         yRn7qvwo6NVW9WAd9oF1UwG6lPLYGWu7G0y4xzEzkt9xvzZXRp3AnuwdqHZ6dlIPPbg6
         l8tZCSf6FsytZq9KUHOYfKzulnogDl2X+OEMMmt6zHdoHFegAUwhJX7Wjs1INS2Sl1Pw
         TriObMpyHwstb+qMSGtc7G0aMaqBUSEqy74u73IOy4NPkueY3me64XZv7vcjoa5MYcrS
         ENQX81/MYJNYzRu1qMiFQvbILEA0AoLfv08OzpeTm9qWC+d+zW6AA9xAk+iUzXbgQjTl
         qYAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW1offXZLVew7HVgkiy9SlNzpz0YfRSBL6Oaqj+jrDnt3C1m8VPTqCcDpQxd6GDLvmbDWkxK3eO3CLLYBBYATJ@lists.infradead.org
X-Gm-Message-State: AFq9FYK42ZgH4puiBHHLH1Ofbzl4BLpxdEy6ILowuxP1IloP07b1bSiv
	xN0SOvh5E/VGto0oPdqc7h8X42YBPT9fGoTAOHs8LI/VweiyTZHTuUpsx9HtMS6wYzjzN2lfN0P
	rK2gLwA/WbfkJeMU8YSVWCmNR2Q==
X-Received: from plbmf6.prod.google.com ([2002:a17:902:fc86:b0:2df:9a43:558b])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ebc6:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2e5ffaa3b53mr18539905ad.2.1791373439065;
 Wed, 07 Oct 2026 04:43:59 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:31 +0000
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-8-dylanbhatch@google.com>
Subject: [PATCH v8 07/11] sframe: Add debug helpers with object name
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
X-CRM114-CacheID: sfid-20261007_044400_624895_7A699972 
X-CRM114-Status: GOOD (  18.02  )
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

Include the object name for kernel .sframe sections, indicated with the
format "(<module-name>)" or "(vmlinux)".

Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 kernel/unwind/sframe.c       | 11 +++++++----
 kernel/unwind/sframe_debug.h | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 kernel/unwind/sframe_debug.h

diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index c95fcb63e7eaf..2e8ff783de7d8 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -17,6 +17,7 @@
 #include <asm/sections.h>
 
 #include "sframe.h"
+#include "sframe_debug.h"
 
 static bool sframe_init __ro_after_init;
 struct sframe_section kernel_sfsec __ro_after_init;
@@ -510,7 +511,7 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	header_end = sec->sframe_start + sizeof(struct sframe_header);
 	if (header_end >= sec->sframe_end) {
-		pr_debug("header struct doesn't fit in section\n");
+		dbg_sec(sec, "header struct doesn't fit in section\n");
 		return -EINVAL;
 	}
 
@@ -520,12 +521,12 @@ static int sframe_read_header(struct sframe_section *sec)
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
 
@@ -537,7 +538,7 @@ static int sframe_read_header(struct sframe_section *sec)
 	fres_end   = fres_start + shdr->fre_len;
 
 	if (fres_start < fdes_end || fres_end > sec->sframe_end || fres_end < sec->sframe_start) {
-		pr_debug("inconsistent fde/fre offsets\n");
+		dbg_sec(sec, "inconsistent fde/fre offsets\n");
 		return -EINVAL;
 	}
 
@@ -564,6 +565,7 @@ void __init init_sframe_table(void)
 	}
 
 	sframe_init = true;
+	dbg_print_header(&kernel_sfsec);
 }
 
 #ifdef CONFIG_MODULES
@@ -624,6 +626,7 @@ void sframe_module_init(struct module *mod, void *addr, unsigned int size)
 
 	/* Ensure SFrame is initialized when sframe_find() happens */
 	smp_store_release(&mod->sframe_init, true);
+	dbg_print_header(sec);
 }
 
 #endif
diff --git a/kernel/unwind/sframe_debug.h b/kernel/unwind/sframe_debug.h
new file mode 100644
index 0000000000000..f0bc2136eaad0
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
+		     : container_of((sec), struct module, sframe_sec)->name)
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
2.56.0.360.g66cac248cb-goog


