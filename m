Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A19EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 02:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoHUEUhOV0x0mPYHihiLdSKtz41TIEtVbSj3jmRsaOk=; b=zB/SOd2/aarrLHi1vZpsRuxkQr
	/r0pjQRJ9avinAsWNHwrdEbmNqDjOAy9i86qMuHfsj43orG1KqLxWyAqmnaFouk7jr7+g6udmzoZq
	/b7Tp3c1YldG6fH8Erw4x8WZSbNAQJQ4/aZM8VK7Sb7W4O6Bn9S6O+cGotc+w+ULoLmqSWOmsaNt6
	aT1hZb6OYYUW0DqVf3lBaARUYL4eI0Fozw7o4FyYGVOdMvoRAekrbkcGvsN4DHaRcuy6vvEkOipyv
	1vcr/Z2NuIoBsE9FpgHrSSLszidnvIkyJvrEA1bDa00Q/3GxtKyjdb/q/o1mfLo2Uu6jovqUsZL+O
	iATd6iTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVv8-0000000Fuwl-13gZ;
	Sat, 25 Jan 2025 02:29:14 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVm1-0000000FuC6-0PpC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 02:19:50 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2166f9f52fbso80459685ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 18:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737771588; x=1738376388; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LoHUEUhOV0x0mPYHihiLdSKtz41TIEtVbSj3jmRsaOk=;
        b=Em7pLlRC00SpJgYVCPpUkflLHkl7mL5M3OMmKOf4eBS1CQgGxJTuJ6W+QB8RElxchf
         v4CN71Jw4rIyxhdDvyofjX4urxONlXXEw2rUToiHcytYHhnYwdYdEltvLrh55CzpqAyX
         1GxfFP9MlD4HLj7dD3M4L6UVnXO6aAjgy8T0dZJhk+DjypthsK/dBJDiU2rKGiWVtKP9
         ufPJh+DgC2XsAcnSnXcRwrB/uXoNEt4eUudE85GqE0oW5O+DmvZmUFyg9fswH73uzaW8
         QiHDyMBZwJFz0xPQiI2aCBzY8Cg/qM7szPAWSZwxKtB1cU+Nr9XoqnGW7jMvecQrbfW+
         JH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737771588; x=1738376388;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LoHUEUhOV0x0mPYHihiLdSKtz41TIEtVbSj3jmRsaOk=;
        b=GN3azL0574OK2Q5s/Bm7D5rLG6fKFuR7KJIiZZLsLNfAomm1SWdtJnUoPB0WOhzx0A
         iOXWYzssCFNHRClenWlsvU3gMe0dSkOL48ZQjOgvAmVjefXsML5Jetapl/nc7foOg60Y
         z7DXE2f2/p57jh6tP+pDAIWA3UzI1ayUlYnEYqQnNsjBjaU54nGBRpTUNTuE9OLZtd3J
         pSXvuDs5vAfkU5V/J1ZWYonWTux6bJDMVekiJ2Trhcgwb7KEZGrHtA1aMC2/zP4C+MLE
         66Vx+XiVHFPRTOjevFtcyMf+P7orRSMrJ2n7+TmpBhyYij/hy05IHdU/yHlJltbLGPYL
         HNmA==
X-Forwarded-Encrypted: i=1; AJvYcCVeKo4MHN+lIMW0OzaDZuL1fCtsxcHUDdFf+K9/F7QPCqfISLBgG1BoKbeS8oDFjN26OPlsi4yEys7HY0YGClV6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw458LrovV8nbyr1FprY4mnlFNXK+yn6lR/Lpg9pqynH//RFKv7
	8njZwoO+nsK7Jq4HeTM14Q/60Qppsa0KziSYP9ZKJNNhlKOWHIv1GpxpCaRf02UybequfykCXN1
	2Z82ly2/8NQ==
X-Google-Smtp-Source: AGHT+IHGh/EcJQlJc3OUFLXhqDr5SV+ajo77ZpLxRt1CFaw1WVG3Fg0XoLCrcpjLJvkD2sLS2HovJh1AnpwYjQ==
X-Received: from plez12.prod.google.com ([2002:a17:902:cccc:b0:215:dbd8:a6e7])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1381:b0:216:361a:783d with SMTP id d9443c01a7336-21c3562097amr541898135ad.28.1737771587999;
 Fri, 24 Jan 2025 18:19:47 -0800 (PST)
Date: Sat, 25 Jan 2025 02:19:39 +0000
In-Reply-To: <cover.1737763916.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1737763916.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <e2072e24a6773b346f2a71c80b6a28d5b98e6194.1737763916.git.yepeilin@google.com>
Subject: [PATCH bpf-next v1 8/8] bpf, docs: Update instruction-set.rst for
 load-acquire and store-release instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_181949_138232_B0DB7F3D 
X-CRM114-Status: GOOD (  14.66  )
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

Update documentation for the new load-acquire and store-release
instructions.  Rename existing atomic operations as "atomic
read-modify-write (RMW) operations".

Following RFC 9669, section 7.3. "Adding Instructions", create new
conformance groups "atomic32v2" and "atomic64v2", where:

  * atomic32v2: includes all instructions in "atomic32", plus the new
                8-bit, 16-bit and 32-bit atomic load-acquire and
                store-release instructions

  * atomic64v2: includes all instructions in "atomic64" and
                "atomic32v2", plus the new 64-bit atomic load-acquire
                and store-release instructions

Cc: bpf@ietf.org
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 .../bpf/standardization/instruction-set.rst   | 114 +++++++++++++++---
 1 file changed, 98 insertions(+), 16 deletions(-)

diff --git a/Documentation/bpf/standardization/instruction-set.rst b/Documentation/bpf/standardization/instruction-set.rst
index ab820d565052..86917932e9ef 100644
--- a/Documentation/bpf/standardization/instruction-set.rst
+++ b/Documentation/bpf/standardization/instruction-set.rst
@@ -139,8 +139,14 @@ This document defines the following conformance groups:
   specification unless otherwise noted.
 * base64: includes base32, plus instructions explicitly noted
   as being in the base64 conformance group.
-* atomic32: includes 32-bit atomic operation instructions (see `Atomic operations`_).
-* atomic64: includes atomic32, plus 64-bit atomic operation instructions.
+* atomic32: includes 32-bit atomic read-modify-write instructions (see
+  `Atomic operations`_).
+* atomic32v2: includes atomic32, plus 8-bit, 16-bit and 32-bit atomic
+  load-acquire and store-release instructions.
+* atomic64: includes atomic32, plus 64-bit atomic read-modify-write
+  instructions.
+* atomic64v2: unifies atomic32v2 and atomic64, plus 64-bit atomic load-acquire
+  and store-release instructions.
 * divmul32: includes 32-bit division, multiplication, and modulo instructions.
 * divmul64: includes divmul32, plus 64-bit division, multiplication,
   and modulo instructions.
@@ -653,20 +659,31 @@ Atomic operations are operations that operate on memory and can not be
 interrupted or corrupted by other access to the same memory region
 by other BPF programs or means outside of this specification.
 
-All atomic operations supported by BPF are encoded as store operations
-that use the ``ATOMIC`` mode modifier as follows:
+All atomic operations supported by BPF are encoded as ``STX`` instructions
+that use the ``ATOMIC`` mode modifier, with the 'imm' field encoding the
+actual atomic operation.  These operations are categorized based on the second
+lowest nibble (bits 4-7) of the 'imm' field:
 
-* ``{ATOMIC, W, STX}`` for 32-bit operations, which are
+* ``ATOMIC_LOAD`` and ``ATOMIC_STORE`` indicate atomic load and store
+  operations, respectively (see `Atomic load and store operations`_).
+* All other defined values indicate an atomic read-modify-write operation, as
+  described in the following section.
+
+Atomic read-modify-write operations
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The atomic read-modify-write (RMW) operations are encoded as follows:
+
+* ``{ATOMIC, W, STX}`` for 32-bit RMW operations, which are
   part of the "atomic32" conformance group.
-* ``{ATOMIC, DW, STX}`` for 64-bit operations, which are
+* ``{ATOMIC, DW, STX}`` for 64-bit RMW operations, which are
   part of the "atomic64" conformance group.
-* 8-bit and 16-bit wide atomic operations are not supported.
+* 8-bit and 16-bit wide atomic RMW operations are not supported.
 
-The 'imm' field is used to encode the actual atomic operation.
-Simple atomic operation use a subset of the values defined to encode
-arithmetic operations in the 'imm' field to encode the atomic operation:
+Simple atomic RMW operation use a subset of the values defined to encode
+arithmetic operations in the 'imm' field to encode the atomic RMW operation:
 
-.. table:: Simple atomic operations
+.. table:: Simple atomic read-modify-write operations
 
   ========  =====  ===========
   imm       value  description
@@ -686,10 +703,10 @@ arithmetic operations in the 'imm' field to encode the atomic operation:
 
   *(u64 *)(dst + offset) += src
 
-In addition to the simple atomic operations, there also is a modifier and
-two complex atomic operations:
+In addition to the simple atomic RMW operations, there also is a modifier and
+two complex atomic RMW operations:
 
-.. table:: Complex atomic operations
+.. table:: Complex atomic read-modify-write operations
 
   ===========  ================  ===========================
   imm          value             description
@@ -699,8 +716,8 @@ two complex atomic operations:
   CMPXCHG      0xf0 | FETCH      atomic compare and exchange
   ===========  ================  ===========================
 
-The ``FETCH`` modifier is optional for simple atomic operations, and
-always set for the complex atomic operations.  If the ``FETCH`` flag
+The ``FETCH`` modifier is optional for simple atomic RMW operations, and
+always set for the complex atomic RMW operations.  If the ``FETCH`` flag
 is set, then the operation also overwrites ``src`` with the value that
 was in memory before it was modified.
 
@@ -713,6 +730,71 @@ The ``CMPXCHG`` operation atomically compares the value addressed by
 value that was at ``dst + offset`` before the operation is zero-extended
 and loaded back to ``R0``.
 
+Atomic load and store operations
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+To encode an atomic load or store operation, the lowest 8 bits of the 'imm'
+field are divided as follows::
+
+  +-+-+-+-+-+-+-+-+
+  | type  | order |
+  +-+-+-+-+-+-+-+-+
+
+**type**
+  The operation type is one of:
+
+.. table:: Atomic load and store operation types
+
+  ============  =====  ============
+  type          value  description
+  ============  =====  ============
+  ATOMIC_LOAD   0x1    atomic load
+  ATOMIC_STORE  0x2    atomic store
+  ============  =====  ============
+
+**order**
+  The memory order is one of:
+
+.. table:: Memory orders
+
+  =======  =====  =======================
+  order    value  description
+  =======  =====  =======================
+  RELAXED  0x0    relaxed
+  ACQUIRE  0x1    acquire
+  RELEASE  0x2    release
+  ACQ_REL  0x3    acquire and release
+  SEQ_CST  0x4    sequentially consistent
+  =======  =====  =======================
+
+Currently the following combinations of ``type`` and ``order`` are allowed:
+
+.. table:: Atomic load and store operations
+
+  ========= =====  ====================
+  imm       value  description
+  ========= =====  ====================
+  LOAD_ACQ  0x11   atomic load-acquire
+  STORE_REL 0x22   atomic store-release
+  ========= =====  ====================
+
+``{ATOMIC, <size>, STX}`` with 'imm' = LOAD_ACQ means::
+
+  dst = load_acquire((unsigned size *)(src + offset))
+
+``{ATOMIC, <size>, STX}`` with 'imm' = STORE_REL means::
+
+  store_release((unsigned size *)(dst + offset), src)
+
+Where '<size>' is one of: ``B``, ``H``, ``W``, or ``DW``, and 'unsigned size'
+is one of: u8, u16, u32, or u64.
+
+8-bit, 16-bit and 32-bit atomic load-acquire and store-release instructions
+are part of the "atomic32v2" conformance group.
+
+64-bit atomic load-acquire and store-release instructions are part of the
+"atomic64v2" conformance group.
+
 64-bit immediate instructions
 -----------------------------
 
-- 
2.48.1.262.g85cc9f2d1e-goog


