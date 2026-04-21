Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BFFF94CB5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5zH7mctwcDOEQHijpP6Dn53P2ryMqn8C5QEWnKsM/M=; b=aENVv27db+lFh0AySa8Rf6cUfW
	o4uSdHtORR05sr7B8kwdPDoaI2A2Wy+Q7/u+AQsiLS/V3nO6+otTg5cHHT0ePlldPz7sr73nTXTPg
	IAIYIrM0PtVV+Nq60r3/ck9QwpVG2e2beSe9mJKNMglX/wmMDAKp/0+4+2sRqVwCEvv7mHH0nOnKf
	NwdR14SWysX+GPYxBXpTzcQgJPNWCXDwH6VKbLnjNWIOo6vc6Q0XEHbYSG4DDo1lAYmxO9VWfSeXV
	GDReHtZNcfbV+47g5wbCHTu0CKk1Uw3plb/7lvJh181W6Ey/fXs2CR9kUXJdqseWSpEN6YpPQnb7o
	lhWAKEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJxC-00000009NTP-0KSF;
	Tue, 21 Apr 2026 22:52:26 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJx9-00000009NRE-3Q16
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:52:24 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so2197348a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776811943; x=1777416743; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P5zH7mctwcDOEQHijpP6Dn53P2ryMqn8C5QEWnKsM/M=;
        b=P1qodz1pw7mxklxblqFAYf62b05FAwlgYt6AqfrxpXt5EE+GwlSRcf9wK1EGWBtH3v
         0UApFi7ESnSD8objS7QZLyYs7bVBiaCwG0x1EM2nd9Zsy/NGBnpCa2HSExTtsnK7H6Kw
         qXF7eRsEHx5X3qAPFIl8BRfKkaU/Uvby+26nEbVkJCbsoHci9hsomAcBMWaLy6Q2Ncpq
         jGvehnU4/AaI/Nvf0LvwvODcgyIT1bD4VXdNfaffDII41Ad2oXDdzYJVS4mEQCZlCyL3
         YaYGffpdw3QDX9dWplPfbc6hDrwP6vPex3hMiJB9I7lYqT+TmOSbO2vrlN3bfXmiF7ao
         DGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811943; x=1777416743;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5zH7mctwcDOEQHijpP6Dn53P2ryMqn8C5QEWnKsM/M=;
        b=S3XzIAL4UrhXvW0IEbAjiUtDDKrftHQ2D7tZsqFAres3UQJNe+wo/yxmBfftmV0b8q
         osZ/sOcmT7tleQkW49BaiAdvCe9KwMmcNrXN0/+VRiIgiZWtpJgJ59atxQK2A/YTJqrd
         7o9p9fTgVHdBHyFkwtz4qip/TJFvteCaqqzJU3xw4V6Z5tydPLpOpei1phcvHDgfMP5m
         r1DfJ9qGMxTVls9nxG9kMB/pnwUL2uQqLxDlBPJ5mNvr3pX2PNZzAHLlBcM9EiRNhdxK
         IO75nzPXiOl+pt7kaDA18/wpqp53d9J4k5FaeuR4RZ3cJQTZbk6mXaPcJ4XvwrNnfndo
         SG1g==
X-Forwarded-Encrypted: i=1; AFNElJ/TGqCUF64VRhp3efxeM6YqB48tnHMzJqlSc+7ZzGAHBl6E1B88b03wZPifcTC07spPXONmSbkjF+xQcVY3C7HB@lists.infradead.org
X-Gm-Message-State: AOJu0YwnLphWK2McqtSviXHVR6RgyqpPk/UMK74O7vaouvezDLUKxSTH
	asxlNPF9UDRdVLsfjDOcdHzQS9BwU6vKp4D2ZhgOjqJ/IDXOSsXXouBIUf+50f1z6xVsHJIHNTq
	E/yYFQ1ppKCvm+0MxffphMFwGGg==
X-Received: from pfbjw25.prod.google.com ([2002:a05:6a00:9299:b0:82f:b709:3747])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a247:b0:82c:1cd0:2f7e with SMTP id d2e1a72fcca58-82f8b553974mr15760811b3a.20.1776811942482;
 Tue, 21 Apr 2026 15:52:22 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:51:57 +0000
In-Reply-To: <20260421225200.1198447-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260421225200.1198447-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421225200.1198447-6-dylanbhatch@google.com>
Subject: [PATCH v4 5/8] sframe: Allow unsorted FDEs
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
X-CRM114-CacheID: sfid-20260421_155223_863249_3461A8CF 
X-CRM114-Status: GOOD (  15.05  )
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
index fb3b6b2d8677..243027244854 100644
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
2.54.0.rc1.555.g9c883467ad-goog


