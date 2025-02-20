Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D48C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS6vyNS6k+QCogrM+ZqTPx58CsLeQh5Yn8lInF1h/Hk=; b=vc2NjAho4oWMvM83XNpxKDPsE/
	X0WF2T9mhyDR9QnP+Q0HevHF3BkdA9wji26FDAps2KR7KHzhz0o5IFbm9V6ld/1azP3wdWhb1N+X7
	xqvW7iE5UFHt6f1U0wfHxBh93uw4QVj+Lccl+i0CisW2NMcCWQE4sLKGXG4H4Dw12MNaci8HYllc4
	Q6whJDyxDzraOW6eOUBmXpz4fq1XfUJx3fkevT5lyF+d/0AD/J5yJy4NAG2OMuFAQbQJ/xhCyaY6+
	YuanEWAHc7Ejt/6M9KqX73SRNKoxL5pbM8aINW1ha8f9TE2xxAGY0AnOUWvBBdl1y8IytJ6gsNqnx
	Oky8kqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvUA-0000000G9Jb-0pAD;
	Thu, 20 Feb 2025 01:36:18 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvGJ-0000000G5IS-0MVc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:22:00 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22101351b1dso7139225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740014518; x=1740619318; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GS6vyNS6k+QCogrM+ZqTPx58CsLeQh5Yn8lInF1h/Hk=;
        b=k+uJXNY2ypmVW4pc3/pSaAB1vLZE6XCw1Rr34NxmEGiVHvdarJNk40X+DnSykuQ192
         rBLylu1OmdqN4ngkMX61jdovp9PL7VQONVz/z7cHnwr8hSUQvjmlL/TVJhLOnNrFmhus
         EWPv5lA/Dz3l/qdxLA85GI6PS6T2HN7V+UFaR145PCORwObax3UUMVi61QyQtQF5N+sk
         yysCcG7IMa7pI0nu1YUzfQBSjVrh72gIV6fyNzHwfXhs4jR7f9smk0OUpn0DjnF8WBIQ
         SRyyeNki/2NwYa0aLWnOx76ffq/fL2mmb94WisjBC3aj5ymtnaB/0XT29eCq3B/5sMhp
         t8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740014518; x=1740619318;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GS6vyNS6k+QCogrM+ZqTPx58CsLeQh5Yn8lInF1h/Hk=;
        b=HgQxxQqfyCnUDWd3loXpD+TdSNE7yDMqWHwZq318FALmHd/jFDBYg4v60RoJivsKeB
         jF4c8u+8ZQh1hSuKxQyNNp4IMcEMq4Mr+hSNVghmBXUGm9R0crVSromtiFFBrtYMqu5v
         VH7ivcpTka5OcYNEiDDTTGlwl6THr2mxsGsrjegsKhlmlzZN7Ofn5nasEVc0mpWB+Xn6
         smBMEmbotoXOE50RoYC9vmer2WNKbBtAhjuqfy9q34zoeq0MtbZWa0DxMzMlb/r6vk5y
         mKSqn3n2cO7F1s6zgQpvYaqnvD+b2RhxMO7IzB4VDWxeZIr9VAjNeixduCxUsq04oXuy
         MIDw==
X-Forwarded-Encrypted: i=1; AJvYcCWLJwMP2TEuqvEq3Tnx4FSBqtIQzOwRzMPoPvjcHnMoP5cOdqAhx+QPf5QfdnY++46fkochBWrDKA8poaQHpkPq@lists.infradead.org
X-Gm-Message-State: AOJu0YwwLgSzGhPQvX1VgeO45qOEPex4ZXw45+GWLmuZd+INps/VQBWC
	jFICpqdEL2T1Lmh2oZYT7RoDNBV5FpSed+c4UVeEV0gugBUgNViQduuiQnGBWBlnTtV3BwbHY6z
	62wrf3OaXRA==
X-Google-Smtp-Source: AGHT+IGJ+ltKK6y+HaMblCOKbNV2LzZDguEqlJAUdmJ+I1P4WWwmJBB8qhJ2SRtkJLX7OgW2ONsd+pG1Ym0kVA==
X-Received: from plbkh4.prod.google.com ([2002:a17:903:644:b0:220:e392:340b])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c94d:b0:215:6995:1ef3 with SMTP id d9443c01a7336-2217055ddc0mr83991925ad.3.1740014517696;
 Wed, 19 Feb 2025 17:21:57 -0800 (PST)
Date: Thu, 20 Feb 2025 01:21:51 +0000
In-Reply-To: <cover.1740009184.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1740009184.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <86e925a5f2bd1d5aa22ff604a505be1d2e88784c.1740009184.git.yepeilin@google.com>
Subject: [PATCH bpf-next v3 9/9] bpf, docs: Update instruction-set.rst for
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
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_172159_129100_A4463CD0 
X-CRM114-Status: GOOD (  14.34  )
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
 .../bpf/standardization/instruction-set.rst   | 78 +++++++++++++++----
 1 file changed, 62 insertions(+), 16 deletions(-)

diff --git a/Documentation/bpf/standardization/instruction-set.rst b/Documentation/bpf/standardization/instruction-set.rst
index ab820d565052..6bd62e79c4ed 100644
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
@@ -653,20 +659,29 @@ Atomic operations are operations that operate on memory and can not be
 interrupted or corrupted by other access to the same memory region
 by other BPF programs or means outside of this specification.
 
-All atomic operations supported by BPF are encoded as store operations
-that use the ``ATOMIC`` mode modifier as follows:
+All atomic operations supported by BPF are encoded as ``STX`` instructions
+that use the ``ATOMIC`` mode modifier, with the 'imm' field encoding the
+actual atomic operation.  These operations fall into two categories, as
+described in the following sections:
 
-* ``{ATOMIC, W, STX}`` for 32-bit operations, which are
+* `Atomic read-modify-write operations`_
+* `Atomic load and store operations`_
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
@@ -686,10 +701,10 @@ arithmetic operations in the 'imm' field to encode the atomic operation:
 
   *(u64 *)(dst + offset) += src
 
-In addition to the simple atomic operations, there also is a modifier and
-two complex atomic operations:
+In addition to the simple atomic RMW operations, there also is a modifier and
+two complex atomic RMW operations:
 
-.. table:: Complex atomic operations
+.. table:: Complex atomic read-modify-write operations
 
   ===========  ================  ===========================
   imm          value             description
@@ -699,8 +714,8 @@ two complex atomic operations:
   CMPXCHG      0xf0 | FETCH      atomic compare and exchange
   ===========  ================  ===========================
 
-The ``FETCH`` modifier is optional for simple atomic operations, and
-always set for the complex atomic operations.  If the ``FETCH`` flag
+The ``FETCH`` modifier is optional for simple atomic RMW operations, and
+always set for the complex atomic RMW operations.  If the ``FETCH`` flag
 is set, then the operation also overwrites ``src`` with the value that
 was in memory before it was modified.
 
@@ -713,6 +728,37 @@ The ``CMPXCHG`` operation atomically compares the value addressed by
 value that was at ``dst + offset`` before the operation is zero-extended
 and loaded back to ``R0``.
 
+Atomic load and store operations
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+To encode an atomic load or store operation, the 'imm' field is one of:
+
+.. table:: Atomic load and store operations
+
+  ========= =====  ====================
+  imm       value  description
+  ========= =====  ====================
+  LOAD_ACQ  0x100  atomic load-acquire
+  STORE_REL 0x110  atomic store-release
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
2.48.1.601.g30ceb7b040-goog


