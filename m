Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8A1FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEk4CM6KkrmWUN7H1Rd0LwOd0ZnJZhF5RnXyjlQj1vc=; b=0uoTySc78RZjeCct5DFALUkfAm
	FjoKwd1XKxFcrodPziPGnMyzWPjwGFDysYJbrdNKmsQIIqip+VTirFIT3SxwB1N1tg4Y86TTn4txX
	FPvn0HbDgyXC8UFVtHz0Q7jigB3GXg7XfQO3c1kDYNNgABir+fKvfFNNhOTrb1yg0bTj0mpHoCH6n
	eSg/B3fopCrw1XerJ67Z2vHPQSvaucze6nXsX9Lwx7BoTEiCEDjadX4Lixf5D3quO7PvRfzjJ83Qf
	vjwHaAZO6gs0TiTCWXJbr95u3VXi+Ud6Lblk8OZ694oA6zlkJP8f6um78P30U2wQqDIGUQZ9UKGob
	Gszxp31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJM-000000026V9-2V1Q;
	Tue, 28 Apr 2026 18:37:32 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJD-000000026Nu-26qq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:37:24 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-36472c6a7d8so5242209a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777401442; x=1778006242; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HEk4CM6KkrmWUN7H1Rd0LwOd0ZnJZhF5RnXyjlQj1vc=;
        b=geakjIZwzC+YYIidLTgq5JRsYj9/3/3m9WNs5l/zhi3g73DWB+S7oOxhic7cscNRYB
         TqN/Mu9I6p7mypNs877b/cxEbDUPGalL9zJGmY3FWSzuTrkZ5EyFZbGJWZ+5LX/CIBiQ
         6Hl42tfSSPrfErTxyd6yPe6kvlAI2AavAF6I19iZZzveOMPS/H7rOTct9N32JTvVp5VM
         quaBOJ82bqHvdaIJohBaYBlVDQ0lb7pH06rkP9ifFYmHfcsdg/JPqldZXgmatK/fKt7h
         5vCrDzkqZW35xiRfH5O0ZXgYB/GxL3j9E0JlWGJ5OWmihju7mcUWGi2HDLEG3aS7W6nd
         jaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401442; x=1778006242;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEk4CM6KkrmWUN7H1Rd0LwOd0ZnJZhF5RnXyjlQj1vc=;
        b=UYL1Pd6unileeHQI4G6/7dvLLrOcaRVzG+fOSYkwAHWWqjPTy/KojMOuyUrSwPMCi6
         5PafyE8LV7h10a8ZMq5eEhuxVb/jXUmq9pGGDRd5u2Bw18q8BjKawvbm51EjBT0YxJsk
         gPXZ2E5B5iJnh8Z8uoGA08lPvYsf4FMJ4rKpRcW+w3awiXy5iWWBqbPhsHs6wC2dBwwJ
         gecK8V9T6BHe3w1KBqz3opNFkXIC+uqe/IUwis0JnXtB298z5YFMsJ3Y+G9DkJUbFZnb
         kJ5RfgzX3RTxjGuzLndB+VIY7A9oKSWTW4oOnDA4WreraV5zG2oxZQIgVFSyRT9o93T4
         zBsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wJcqLfIeE9mOsh+knHjc22baPQwy7QX2onTY+0vycj9qv5DOT1pO6NKRfsOc51YSzhLti8tW9dWzstL5x/fZn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw58UuKFdbiV2ydBDIzgQjmw/T5+Z2YpwPn7QoTrqy1JGa2NtVP
	+ZXA/6/XqSy+5/AjsfsRzDFH+VjZs8s6Bmmh++XdNqyO/e5UIAqgPx41jf5CJBIJ8eH/OKVnsZ6
	H6+4oH2bgKNjV113wko1t+F3gKg==
X-Received: from plbjl20.prod.google.com ([2002:a17:903:1354:b0:2b0:b22a:e6ef])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2ecd:b0:364:7467:53e5 with SMTP id 98e67ed59e1d1-36491ff60aamr4439314a91.2.1777401441910;
 Tue, 28 Apr 2026 11:37:21 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:36:40 +0000
In-Reply-To: <20260428183643.3796063-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428183643.3796063-6-dylanbhatch@google.com>
Subject: [PATCH v5 5/8] sframe: Allow unsorted FDEs
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113723_564022_7BAD3F24 
X-CRM114-Status: GOOD (  15.21  )
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

Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 include/linux/sframe.h |  1 +
 kernel/unwind/sframe.c | 45 +++++++++++++++++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/include/linux/sframe.h b/include/linux/sframe.h
index 5b7341b61a7c..8ae31ed36226 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -28,6 +28,7 @@ struct sframe_section {
 	unsigned long		fres_start;
 	unsigned long		fres_end;
 	unsigned int		num_fdes;
+	bool			fdes_sorted;
 
 	signed char		ra_off;
 	signed char		fp_off;
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 430bff9533ee..dcf4deb378dc 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -176,9 +176,35 @@ static __always_inline int __read_fde(struct sframe_section *sec,
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
+	return -EINVAL;
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
@@ -233,6 +259,15 @@ static __always_inline int __find_fde(struct sframe_section *sec,
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
@@ -657,7 +692,7 @@ static int sframe_validate_section(struct sframe_section *sec)
 			return ret;
 
 		ip = fde.func_addr;
-		if (ip <= prev_ip) {
+		if (sec->fdes_sorted && ip <= prev_ip) {
 			dbg_sec("fde %u not sorted\n", i);
 			return -EFAULT;
 		}
@@ -736,7 +771,6 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	if (shdr.preamble.magic != SFRAME_MAGIC ||
 	    shdr.preamble.version != SFRAME_VERSION_3 ||
-	    !(shdr.preamble.flags & SFRAME_F_FDE_SORTED) ||
 	    !(shdr.preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
 	    shdr.auxhdr_len) {
 		dbg_sec("bad/unsupported sframe header\n");
@@ -766,6 +800,7 @@ static int sframe_read_header(struct sframe_section *sec)
 		return -EINVAL;
 	}
 
+	sec->fdes_sorted	= shdr.preamble.flags & SFRAME_F_FDE_SORTED;
 	sec->num_fdes		= num_fdes;
 	sec->fdes_start		= fdes_start;
 	sec->fres_start		= fres_start;
-- 
2.54.0.545.g6539524ca2-goog


