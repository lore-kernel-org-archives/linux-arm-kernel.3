Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74F9C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 21:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDvBLRnKYJqb7wLRycvSsM5KYAbB3Uj/Gas8Bcx9QpY=; b=34x5xfT7LTH7+KvLVZR/f5VuFJ
	dqmTTOD3xc0OweDSBtmRG4awtqkDQYZbawctXLHcs2n66MdnTeUAttT2uUVvKKIJgEPmq2f0+sO8T
	KQvhn6fRJpV2TBYaC4WzEbgO842i1zpwPTULYQAMGStl7jGQo1XiUq0d8gdccRhxY3lrnCx3pRtBr
	pHVZ6OP8uyErPvTiSoLUPu9oFDZxvhxGhhWiDp9LPJgpKWy8rhX2QpL4I/VzmRyflu1VEGKpXIOUi
	L+q+kBNMhpW+jaAp6VdV/l0LC//z+LZvmvdrLHXUiZGSkX/WV/IhwywORS66UjhnmLbIyTStHovRt
	LNaQOc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWpX-00000003KGw-0kpf;
	Mon, 27 Jan 2025 21:39:39 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWjb-00000003JAy-16gX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 21:33:32 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef9da03117so13860132a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738013610; x=1738618410; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nDvBLRnKYJqb7wLRycvSsM5KYAbB3Uj/Gas8Bcx9QpY=;
        b=ZT2mkIzaS3KV6s2koh0qS37MWzzuRKWoZnapKWgKNJ0E1iJzSnWp800HSkvr7mbpij
         8bZW6DiocSLAFO984Jfl6+4EqLVdrql+bv7sCw1cUtpTL6htyeVC3LxtlF+kJF3xo/CS
         SzwRMbjzebz0tqg1Kvw5oMdcCqZjltdnqAHmbrcf3pFFji0lw/Qnyv9q4uq2qVGKPiHC
         M0wvw6qHqgb/LiIg0UhPPs+jX+92V7iXZtTeMRWpySCawGb8ITgwu094jICbt1lfM1M7
         xalKPf9LMhxdKrjzPAbMHzXWmTWme539gsQDjb/JCQN2BjpE7ZRfXtqFb8qDsbObVP1t
         IicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738013610; x=1738618410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDvBLRnKYJqb7wLRycvSsM5KYAbB3Uj/Gas8Bcx9QpY=;
        b=iLJuX5V/AQfUXupf5b/lnwlWs1el47Z49VZVXKd7f1x58tXHmVb2JgKJ62z+kCZ3Rw
         aVeJwGmaNuPtfP7BUDlqLQ4dAGBZtlL8uVlvajC4Z9Vd+yZn7RbRANEwh0CXtE3jNybq
         oKbnXUVRXMV8oi+FvPtCvuEr59D1u+phMY0icBybjp84kC7jaHu8+mRzmSHdK98d9Jn8
         29gt+eGvNrcSm4IBbfD6p4F0qxrePN12GKpzGik590VhruIV6BoJjaChGSgKz6pJ8h2G
         tRPczyK2S3RMVJJTvxxcTCKNoaYT4WAoJmWMUr3QyVH93wfCDfWjSVsYZwxLDsq1fF/G
         0RKg==
X-Forwarded-Encrypted: i=1; AJvYcCVYVBgP+DcRTuxOXpyeJaUa8/9VRnIuw0oSSJtm59cj85JxOZ8W9/sKt0toQF4WsnpDarOLz9wLXRxtJ0+LZiai@lists.infradead.org
X-Gm-Message-State: AOJu0YzmlMCSFx0VISSbpqvxexZzp7zW2vztL8Z04xlvs800d0VXSsgY
	iFCtrVYg038Mqtze8MTZPpL3rxFLFgoq+SHSbB9ejQeqQes9yIQ0xT1LArf7wFPXtVodbszVlQ=
	=
X-Google-Smtp-Source: AGHT+IE7cBiyjRItliwSAg3VmD1SKevW9jTi2EfBECUlXP+PwVTan7NlAVSGrkNopkq3143PUhyvXE76zA==
X-Received: from pfd10.prod.google.com ([2002:a05:6a00:a80a:b0:725:d350:a304])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ad8a:b0:72a:bc54:84f7
 with SMTP id d2e1a72fcca58-72dafa03117mr57971799b3a.12.1738013610397; Mon, 27
 Jan 2025 13:33:30 -0800 (PST)
Date: Mon, 27 Jan 2025 21:33:05 +0000
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
Mime-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127213310.2496133-4-wnliu@google.com>
Subject: [PATCH 3/8] unwind: add sframe v2 header
From: Weinan Liu <wnliu@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Weinan Liu <wnliu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_133331_310937_CB846804 
X-CRM114-Status: GOOD (  28.46  )
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

Add sframe header so that we know how to access the sframe section
generated by compilers.

This is the sframe header file borrowed from the patchset [1]
Josh Poimboeuf according to sframe v2 spec [2].

[1]: https://lore.kernel.org/lkml/42c0a99236af65c09c8182e260af7bcf5aa1e158.1730150953.git.jpoimboe@kernel.org/
[2]: https://sourceware.org/binutils/docs/sframe-spec.html

Signed-off-by: Weinan Liu <wnliu@google.com>
---
 kernel/sframe.h | 215 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)
 create mode 100644 kernel/sframe.h

diff --git a/kernel/sframe.h b/kernel/sframe.h
new file mode 100644
index 000000000000..11b9be7ad82e
--- /dev/null
+++ b/kernel/sframe.h
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2023, Oracle and/or its affiliates.
+ *
+ * This file contains definitions for the SFrame stack tracing format, which is
+ * documented at https://sourceware.org/binutils/docs
+ */
+#ifndef _SFRAME_H
+#define _SFRAME_H
+
+#include <linux/types.h>
+
+#define SFRAME_VERSION_1	1
+#define SFRAME_VERSION_2	2
+#define SFRAME_MAGIC		0xdee2
+
+/* Function Descriptor Entries are sorted on PC. */
+#define SFRAME_F_FDE_SORTED	0x1
+/* Frame-pointer based stack tracing. Defined, but not set. */
+#define SFRAME_F_FRAME_POINTER	0x2
+
+#define SFRAME_CFA_FIXED_FP_INVALID 0
+#define SFRAME_CFA_FIXED_RA_INVALID 0
+
+/* Supported ABIs/Arch. */
+#define SFRAME_ABI_AARCH64_ENDIAN_BIG	    1 /* AARCH64 big endian. */
+#define SFRAME_ABI_AARCH64_ENDIAN_LITTLE    2 /* AARCH64 little endian. */
+#define SFRAME_ABI_AMD64_ENDIAN_LITTLE	    3 /* AMD64 little endian. */
+
+/* SFrame FRE types. */
+#define SFRAME_FRE_TYPE_ADDR1	0
+#define SFRAME_FRE_TYPE_ADDR2	1
+#define SFRAME_FRE_TYPE_ADDR4	2
+
+/*
+ * SFrame Function Descriptor Entry types.
+ *
+ * The SFrame format has two possible representations for functions. The
+ * choice of which type to use is made according to the instruction patterns
+ * in the relevant program stub.
+ */
+
+/* Unwinders perform a (PC >= FRE_START_ADDR) to look up a matching FRE. */
+#define SFRAME_FDE_TYPE_PCINC	0
+/*
+ * Unwinders perform a (PC & FRE_START_ADDR_AS_MASK >= FRE_START_ADDR_AS_MASK)
+ * to look up a matching FRE. Typical usecases are pltN entries, trampolines
+ * etc.
+ */
+#define SFRAME_FDE_TYPE_PCMASK	1
+
+/**
+ * struct sframe_preamble - SFrame Preamble.
+ * @magic: Magic number (SFRAME_MAGIC).
+ * @version: Format version number (SFRAME_VERSION).
+ * @flags: Various flags.
+ */
+struct sframe_preamble {
+	u16 magic;
+	u8  version;
+	u8  flags;
+} __packed;
+
+/**
+ * struct sframe_header - SFrame Header.
+ * @preamble: SFrame preamble.
+ * @abi_arch: Identify the arch (including endianness) and ABI.
+ * @cfa_fixed_fp_offset: Offset for the Frame Pointer (FP) from CFA may be
+ *	  fixed for some ABIs ((e.g, in AMD64 when -fno-omit-frame-pointer is
+ *	  used). When fixed, this field specifies the fixed stack frame offset
+ *	  and the individual FREs do not need to track it. When not fixed, it
+ *	  is set to SFRAME_CFA_FIXED_FP_INVALID, and the individual FREs may
+ *	  provide the applicable stack frame offset, if any.
+ * @cfa_fixed_ra_offset: Offset for the Return Address from CFA is fixed for
+ *	  some ABIs. When fixed, this field specifies the fixed stack frame
+ *	  offset and the individual FREs do not need to track it. When not
+ *	  fixed, it is set to SFRAME_CFA_FIXED_FP_INVALID.
+ * @auxhdr_len: Number of bytes making up the auxiliary header, if any.
+ *	  Some ABI/arch, in the future, may use this space for extending the
+ *	  information in SFrame header. Auxiliary header is contained in bytes
+ *	  sequentially following the sframe_header.
+ * @num_fdes: Number of SFrame FDEs in this SFrame section.
+ * @num_fres: Number of SFrame Frame Row Entries.
+ * @fre_len:  Number of bytes in the SFrame Frame Row Entry section.
+ * @fdes_off: Offset of SFrame Function Descriptor Entry section.
+ * @fres_off: Offset of SFrame Frame Row Entry section.
+ */
+struct sframe_header {
+	struct sframe_preamble preamble;
+	u8  abi_arch;
+	s8  cfa_fixed_fp_offset;
+	s8  cfa_fixed_ra_offset;
+	u8  auxhdr_len;
+	u32 num_fdes;
+	u32 num_fres;
+	u32 fre_len;
+	u32 fdes_off;
+	u32 fres_off;
+} __packed;
+
+#define SFRAME_HDR_SIZE(sframe_hdr)	\
+	((sizeof(struct sframe_header) + (sframe_hdr).auxhdr_len))
+
+/* Two possible keys for executable (instruction) pointers signing. */
+#define SFRAME_AARCH64_PAUTH_KEY_A    0 /* Key A. */
+#define SFRAME_AARCH64_PAUTH_KEY_B    1 /* Key B. */
+
+/**
+ * struct sframe_fde - SFrame Function Descriptor Entry.
+ * @start_addr: Function start address. Encoded as a signed offset,
+ *	  relative to the current FDE.
+ * @size: Size of the function in bytes.
+ * @fres_off: Offset of the first SFrame Frame Row Entry of the function,
+ *	  relative to the beginning of the SFrame Frame Row Entry sub-section.
+ * @fres_num: Number of frame row entries for the function.
+ * @info: Additional information for deciphering the stack trace
+ *	  information for the function. Contains information about SFrame FRE
+ *	  type, SFrame FDE type, PAC authorization A/B key, etc.
+ * @rep_size: Block size for SFRAME_FDE_TYPE_PCMASK
+ * @padding: Unused
+ */
+struct sframe_fde {
+	s32 start_addr;
+	u32 size;
+	u32 fres_off;
+	u32 fres_num;
+	u8  info;
+	u8  rep_size;
+	u16 padding;
+} __packed;
+
+/*
+ * 'func_info' in SFrame FDE contains additional information for deciphering
+ * the stack trace information for the function. In V1, the information is
+ * organized as follows:
+ *   - 4-bits: Identify the FRE type used for the function.
+ *   - 1-bit: Identify the FDE type of the function - mask or inc.
+ *   - 1-bit: PAC authorization A/B key (aarch64).
+ *   - 2-bits: Unused.
+ * ---------------------------------------------------------------------
+ * |  Unused  |  PAC auth A/B key (aarch64) |  FDE type |   FRE type   |
+ * |          |        Unused (amd64)       |           |              |
+ * ---------------------------------------------------------------------
+ * 8          6                             5           4              0
+ */
+
+/* Note: Set PAC auth key to SFRAME_AARCH64_PAUTH_KEY_A by default.  */
+#define SFRAME_FUNC_INFO(fde_type, fre_enc_type) \
+	(((SFRAME_AARCH64_PAUTH_KEY_A & 0x1) << 5) | \
+	 (((fde_type) & 0x1) << 4) | ((fre_enc_type) & 0xf))
+
+#define SFRAME_FUNC_FRE_TYPE(data)	  ((data) & 0xf)
+#define SFRAME_FUNC_FDE_TYPE(data)	  (((data) >> 4) & 0x1)
+#define SFRAME_FUNC_PAUTH_KEY(data)	  (((data) >> 5) & 0x1)
+
+/*
+ * Size of stack frame offsets in an SFrame Frame Row Entry. A single
+ * SFrame FRE has all offsets of the same size. Offset size may vary
+ * across frame row entries.
+ */
+#define SFRAME_FRE_OFFSET_1B	  0
+#define SFRAME_FRE_OFFSET_2B	  1
+#define SFRAME_FRE_OFFSET_4B	  2
+
+/* An SFrame Frame Row Entry can be SP or FP based.  */
+#define SFRAME_BASE_REG_FP	0
+#define SFRAME_BASE_REG_SP	1
+
+/*
+ * The index at which a specific offset is presented in the variable length
+ * bytes of an FRE.
+ */
+#define SFRAME_FRE_CFA_OFFSET_IDX   0
+/*
+ * The RA stack offset, if present, will always be at index 1 in the variable
+ * length bytes of the FRE.
+ */
+#define SFRAME_FRE_RA_OFFSET_IDX    1
+/*
+ * The FP stack offset may appear at offset 1 or 2, depending on the ABI as RA
+ * may or may not be tracked.
+ */
+#define SFRAME_FRE_FP_OFFSET_IDX    2
+
+/*
+ * 'fre_info' in SFrame FRE contains information about:
+ *   - 1 bit: base reg for CFA
+ *   - 4 bits: Number of offsets (N). A value of up to 3 is allowed to track
+ *   all three of CFA, FP and RA (fixed implicit order).
+ *   - 2 bits: information about size of the offsets (S) in bytes.
+ *     Valid values are SFRAME_FRE_OFFSET_1B, SFRAME_FRE_OFFSET_2B,
+ *     SFRAME_FRE_OFFSET_4B
+ *   - 1 bit: Mangled RA state bit (aarch64 only).
+ * ---------------------------------------------------------------
+ * | Mangled-RA (aarch64) |  Size of   |   Number of  | base_reg |
+ * |  Unused (amd64)      |  offsets   |    offsets   |          |
+ * ---------------------------------------------------------------
+ * 8                      7             5             1          0
+ */
+
+/* Note: Set mangled_ra_p to zero by default. */
+#define SFRAME_FRE_INFO(base_reg_id, offset_num, offset_size) \
+	(((0 & 0x1) << 7) | (((offset_size) & 0x3) << 5) | \
+	 (((offset_num) & 0xf) << 1) | ((base_reg_id) & 0x1))
+
+/* Set the mangled_ra_p bit as indicated. */
+#define SFRAME_FRE_INFO_UPDATE_MANGLED_RA_P(mangled_ra_p, fre_info) \
+	((((mangled_ra_p) & 0x1) << 7) | ((fre_info) & 0x7f))
+
+#define SFRAME_FRE_CFA_BASE_REG_ID(data)	  ((data) & 0x1)
+#define SFRAME_FRE_OFFSET_COUNT(data)		  (((data) >> 1) & 0xf)
+#define SFRAME_FRE_OFFSET_SIZE(data)		  (((data) >> 5) & 0x3)
+#define SFRAME_FRE_MANGLED_RA_P(data)		  (((data) >> 7) & 0x1)
+
+#endif /* _SFRAME_H */
-- 
2.48.1.262.g85cc9f2d1e-goog


