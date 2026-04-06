Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08858F46C71
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/itz4DVMHOse/koMe29mOhSeC8aYBjPMHAwpbzHRlRM=; b=c8aLo2+9dl2g4Qre/IkbRDNEFi
	H32YloGsT6+18i6RLan8u3ayW169Hw4ya3ax9qNXYAgH3khAL8CmhiIcAkMvqS31jl8JZweG2oUb4
	+TXX1gymTzRuiE1zyFlVx5n8eYiDbh+zfZ75aPjSJOW1Onu6s4Pe9oTz34nLuh0HvCg94QWyyT6cM
	nZzNfR4/XwAC5gAn/k/oBifxqqV1LGD/qv5oxgpZfOEBjHrO5K77bC8yAawrkd9JLOBzcxtQAIZxN
	OCVlrTvTOqLG6TIEMn1awa+jbpyB6PfwZcDtfnR8MiDsHdOGCp3+2c8tIys6x/Un9AG3N/V8zARVG
	+pYVdPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1r-00000005PTq-2E5X;
	Mon, 06 Apr 2026 18:50:31 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1p-00000005PRO-1nHH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 18:50:30 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82cd9fa608bso7530915b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 11:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775501428; x=1776106228; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/itz4DVMHOse/koMe29mOhSeC8aYBjPMHAwpbzHRlRM=;
        b=dvNTp9ErDsfEcQvWOTYuwP52yE0M/aH5YrWEG+kGzYO6z4h6BXribjlCnibDH345/Q
         zxB1oPGKhJpuaI+X7WESWyRaCELbM//co5KB79/Y48VdcVWxXSrk7HQs1X7Wesy4uesZ
         nbPhHSLvchotf0isQyaD0l/3THT4MLawwhqUlu8TswhvwlMjO4vxEmvy0npfacfrfhQg
         6WoTa6//dWCXHKBZPPjUB3+fPqnlSdgnCLMqpPSHuMho1a2EQD/WxYTfVKTa9rTherNe
         Hr+gOxBKhHS1KfKM+PRE0n4efK6K6oae6nfZ/EkyPQC4xppl6arNMKOThWhvdk7Lp19c
         3Nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501428; x=1776106228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/itz4DVMHOse/koMe29mOhSeC8aYBjPMHAwpbzHRlRM=;
        b=tCP61LBP6VWhqJx+3GSkL3cE5Q0rWxkFSULt6QcaQNwc1sS+zU224/7Dy//M5hI0xh
         LP48ssPKLIYt/uSrKfg6ahQlr/pihtCdZ7ZZbeXSiFX/HMsce0DP/voOzzHQwpTbpIZp
         8xTcadWc9Qp2omAaimE6EugOxnfPVB+w6JRJL1jzup0cFRqo5sVGG6ENYbS9SyTJWZW9
         iXOXcvDatEzq3QcSmFDRHwZXcvBu/kobERQmidiaDiGtKYkCWCVd2Rov49B3fRjumZ30
         a7VQjdGxPn8wzVNBQ6wamKHLT2giJCF+m3wMjg53U0n3za08VZOHPpCWiQGsbMVtq4pi
         VscA==
X-Forwarded-Encrypted: i=1; AJvYcCXOeYRUjiyJUhYx3/6coc20XOmG58rc75hfYSSLd29L+xle4Gm443K4Hw1n9wnwgGflvMqYVnV4vgL2cAPthseg@lists.infradead.org
X-Gm-Message-State: AOJu0YxqMMlY3dgLBlRibgurmDUTnXIhq7ZCTRnAaISXuHSewMZpWR3u
	mCVP+EXSz4Q/bDVwI47SCbv6VL0L/o4WE+v/+rw3XVTNiZHz9/oFzgacNwQsktWKFShtK9vcoHm
	Z7wqzCGSXXULriiFtI0KXRoeOIA==
X-Received: from pfbbj11.prod.google.com ([2002:a05:6a00:318b:b0:82c:de4c:2172])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4397:b0:823:9c6:1985 with SMTP id d2e1a72fcca58-82d0da8a9bbmr13916077b3a.16.1775501427782;
 Mon, 06 Apr 2026 11:50:27 -0700 (PDT)
Date: Mon,  6 Apr 2026 18:49:57 +0000
In-Reply-To: <20260406185000.1378082-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260406185000.1378082-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260406185000.1378082-6-dylanbhatch@google.com>
Subject: [PATCH v3 5/8] sframe: Allow unsorted FDEs.
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_115029_470579_90046373 
X-CRM114-Status: GOOD (  15.12  )
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

The .sframe in kernel modules is built without SFRAME_F_FDE_SORTED set.
In order to allow sframe PC lookup in modules, add a code path to handle
unsorted FDE tables by doing a simple linear search.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 include/linux/sframe.h |  1 +
 kernel/unwind/sframe.c | 44 +++++++++++++++++++++++++++++++++++++-----
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/linux/sframe.h b/include/linux/sframe.h
index 905775c3fde2..593b60715cd6 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -64,6 +64,7 @@ struct sframe_section {
 	unsigned long		text_start;
 	unsigned long		text_end;
 
+	bool			fdes_sorted;
 	unsigned long		fdes_start;
 	unsigned long		fres_start;
 	unsigned long		fres_end;
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 321d0615aec7..4dd3612f9e7a 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -179,9 +179,34 @@ static __always_inline int __read_fde(struct sframe_section *sec,
 	return -EFAULT;
 }
 
-static __always_inline int __find_fde(struct sframe_section *sec,
-				      unsigned long ip,
-				      struct sframe_fde_internal *fde)
+static __always_inline int __find_fde_unsorted(struct sframe_section *sec,
+					       unsigned long ip,
+					       struct sframe_fde_internal *fde)
+{
+	struct sframe_fde_v3 *cur, *start, *end;
+
+	start = (struct sframe_fde_v3 *)sec->fdes_start;
+	end = start + sec->num_fdes;
+
+	for (cur = start; cur < end; cur++) {
+		s64 func_off;
+		u32 func_size;
+		unsigned long func_addr;
+
+		DATA_GET(sec, func_off, &cur->func_start_off, s64, Efault);
+		DATA_GET(sec, func_size, &cur->func_size, u32, Efault);
+		func_addr = (unsigned long)cur + func_off;
+
+		if (ip >= func_addr && ip < func_addr + func_size)
+			return __read_fde(sec, cur - start, fde);
+	}
+Efault:
+	return -EFAULT;
+}
+
+static __always_inline int __find_fde_sorted(struct sframe_section *sec,
+					     unsigned long ip,
+					     struct sframe_fde_internal *fde)
 {
 	unsigned long func_addr_low = 0, func_addr_high = ULONG_MAX;
 	struct sframe_fde_v3 *first, *low, *high, *found = NULL;
@@ -236,6 +261,15 @@ static __always_inline int __find_fde(struct sframe_section *sec,
 	return -EFAULT;
 }
 
+static __always_inline int __find_fde(struct sframe_section *sec,
+					     unsigned long ip,
+					     struct sframe_fde_internal *fde)
+{
+	if (sec->fdes_sorted)
+		return __find_fde_sorted(sec, ip, fde);
+	return __find_fde_unsorted(sec, ip, fde);
+}
+
 #define ____GET_INC(sec, to, from, type, label)				\
 ({									\
 	type __to;							\
@@ -660,7 +694,7 @@ static int sframe_validate_section(struct sframe_section *sec)
 			return ret;
 
 		ip = fde.func_addr;
-		if (ip <= prev_ip) {
+		if (sec->fdes_sorted && ip <= prev_ip) {
 			dbg_sec("fde %u not sorted\n", i);
 			return -EFAULT;
 		}
@@ -739,7 +773,6 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	if (shdr.preamble.magic != SFRAME_MAGIC ||
 	    shdr.preamble.version != SFRAME_VERSION_3 ||
-	    !(shdr.preamble.flags & SFRAME_F_FDE_SORTED) ||
 	    !(shdr.preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
 	    shdr.auxhdr_len) {
 		dbg_sec("bad/unsupported sframe header\n");
@@ -769,6 +802,7 @@ static int sframe_read_header(struct sframe_section *sec)
 		return -EINVAL;
 	}
 
+	sec->fdes_sorted	= shdr.preamble.flags & SFRAME_F_FDE_SORTED;
 	sec->num_fdes		= num_fdes;
 	sec->fdes_start		= fdes_start;
 	sec->fres_start		= fres_start;
-- 
2.53.0.1213.gd9a14994de-goog


