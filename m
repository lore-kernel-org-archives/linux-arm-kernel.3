Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0CEC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkZLa2X4XrqPLAsbeivrvq2/n6STf/0Lx6m+57nkDis=; b=NMrqQUw2NFiwssqQd0QCtZMjZB
	Bx4+W3eF1rBN9WqgWr//8t+UKHuCBZ3diXFxVZ2ajDEN+Ktd/dkO+lomgcbwB8MBVlFDxRN2aNEyS
	Kt7VApSCwRAXKnVgGnBPS4mv1Pcm4bxlgMvdqrMFE4EigewhLHQojSOIA/49aEVsNSejb03GDjbZH
	UQAqFkS+UHHR9M3A/Nt9g4rK5n+agdOe09KXHbM59dX0UQ4Ul4Kf+Crg9EQQcQFtpK724cWPXSubf
	FQW538ZluNJIhbC/urqx0L5N1GCBza6IsllV5zp5gTzH6G4e7EkzYhYyEciKF+JbD9c/EaZFSf3aw
	4a4ULLmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvOJ-0000000G7dL-1j0s;
	Thu, 20 Feb 2025 01:30:15 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvFt-0000000G57l-05cI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:21:34 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2f816a85facso1058569a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740014492; x=1740619292; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkZLa2X4XrqPLAsbeivrvq2/n6STf/0Lx6m+57nkDis=;
        b=2Jlswi9dQ7vVhokx0CM3G2jf83FbbtrECR05CJUG786Gf5FYlGlbUifuKzGo+RfKzK
         d9oGahfWLGKMgqTpY6NsdQpeRH9FyWJvaOdUskdJvPF8h/YbbEAnp0WTUII7JuK8fS4p
         obv0B/1FGQ49CwezJvygOGJ24RvvuHXTnng/ck+LLTnG+O+oNFylsYcOtfRLhYZ2kDU6
         fca2MlnrQ4UP9GffTGYA7blYxbcfw1TMKY4OKpJGWwX+XX+5OwKwETWr/lVBa2bWSoy5
         ctiRWDSXLDr7qVGcQg0X/0qpgAs7ZKT5+NWyqJJt/sb/JBlcTDp0zE3Oc9YDRXUOTDWK
         nvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740014492; x=1740619292;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkZLa2X4XrqPLAsbeivrvq2/n6STf/0Lx6m+57nkDis=;
        b=L7u5UlXSjHWg0nlPi+KM1atkNGuujfJs3WG3+t0Wq1lvBCBlBYig2/ITwNWwW/Dkz1
         sHBGiUUmm7VDC5QU0HHrNDbcOTggZeP6358AlGkdJxhnlaLzq+AjMvrxAs9ixqgNRI2v
         NMhcKpUcTbsgcAmcMIdDQ6/X84CksYhBO5kbh9VMAkpvRjKRL3Q/rnwA1Ng7oBHqiDrI
         olyyg4vQS7yWZrigwW3JNFDTZJPQSGkvLNmpD7rBN2GPq0PkAQSl6eOy4ujkO0ZDTe9u
         trlZagsrvaKbkJ+esggQlBrVChKdGdnVWB+KinE/gZb+ZfIxQg++vRdfH/ynFzSOyGNd
         QYYA==
X-Forwarded-Encrypted: i=1; AJvYcCV3AEeZqWmsjwc/FLqVOHBiHFD3yOcPIjr3+NTnpiIXWR3Npoy/9fyIMywoPhC94dyx6/VXgu8dg+4Dj3PDWuFh@lists.infradead.org
X-Gm-Message-State: AOJu0YzjZ1fJH6pUKPkuCWfl6rZBndEKAt+lbrHY121XN5qKVmwC9Sxw
	GP5S9EGF/iT2sE5umKykFksWk8QcJo32tGJEVPog33x19oT7A9cqTrACPm0XcKkENmvxNAYpsHY
	28i9juWSVzw==
X-Google-Smtp-Source: AGHT+IFBxisbnr8xuVdH6zyqBX5cRFTXzSlnuc/uizTOJqWix9sLLV310uViRu8QUCqCKsN5Tzuuv6azaPxpIg==
X-Received: from pjbhl4.prod.google.com ([2002:a17:90b:1344:b0:2fa:a101:755])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d8d:b0:2ee:f076:20fb with SMTP id 98e67ed59e1d1-2fc40f22db2mr35640374a91.17.1740014492129;
 Wed, 19 Feb 2025 17:21:32 -0800 (PST)
Date: Thu, 20 Feb 2025 01:21:28 +0000
In-Reply-To: <cover.1740009184.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1740009184.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <e2eb5c6912f292ed229aa4fb14e42d7f4c2f8571.1740009184.git.yepeilin@google.com>
Subject: [PATCH bpf-next v3 6/9] arm64: insn: Add load-acquire and
 store-release instructions
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
X-CRM114-CacheID: sfid-20250219_172133_072296_1912968C 
X-CRM114-Status: GOOD (  11.35  )
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

Add load-acquire ("load_acq", LDAR{,B,H}) and store-release
("store_rel", STLR{,B,H}) instructions.  Breakdown of encoding:

                                size        L   (Rs)  o0 (Rt2) Rn    Rt
             mask (0x3fdffc00): 00 111111 1 1 0 11111 1  11111 00000 00000
  value, load_acq (0x08dffc00): 00 001000 1 1 0 11111 1  11111 00000 00000
 value, store_rel (0x089ffc00): 00 001000 1 0 0 11111 1  11111 00000 00000

As suggested by Xu [1], include all Should-Be-One (SBO) bits ("Rs" and
"Rt2" fields) in the "mask" and "value" numbers.

It is worth noting that we are adding the "no offset" variant of STLR
instead of the "pre-index" variant, which has a different encoding.

Reference: Arm Architecture Reference Manual (ARM DDI 0487K.a,
           ID032224),

  * C6.2.161 LDAR
  * C6.2.353 STLR

[1] https://lore.kernel.org/bpf/4e6641ce-3f1e-4251-8daf-4dd4b77d08c4@huaweicloud.com/

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/include/asm/insn.h |  8 ++++++++
 arch/arm64/lib/insn.c         | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 2d8316b3abaf..39577f1d079a 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -188,8 +188,10 @@ enum aarch64_insn_ldst_type {
 	AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX,
 	AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX,
 	AARCH64_INSN_LDST_STORE_PAIR_POST_INDEX,
+	AARCH64_INSN_LDST_LOAD_ACQ,
 	AARCH64_INSN_LDST_LOAD_EX,
 	AARCH64_INSN_LDST_LOAD_ACQ_EX,
+	AARCH64_INSN_LDST_STORE_REL,
 	AARCH64_INSN_LDST_STORE_EX,
 	AARCH64_INSN_LDST_STORE_REL_EX,
 	AARCH64_INSN_LDST_SIGNED_LOAD_IMM_OFFSET,
@@ -351,6 +353,8 @@ __AARCH64_INSN_FUNCS(ldr_imm,	0x3FC00000, 0x39400000)
 __AARCH64_INSN_FUNCS(ldr_lit,	0xBF000000, 0x18000000)
 __AARCH64_INSN_FUNCS(ldrsw_lit,	0xFF000000, 0x98000000)
 __AARCH64_INSN_FUNCS(exclusive,	0x3F800000, 0x08000000)
+__AARCH64_INSN_FUNCS(load_acq,  0x3FDFFC00, 0x08DFFC00)
+__AARCH64_INSN_FUNCS(store_rel, 0x3FDFFC00, 0x089FFC00)
 __AARCH64_INSN_FUNCS(load_ex,	0x3FC00000, 0x08400000)
 __AARCH64_INSN_FUNCS(store_ex,	0x3FC00000, 0x08000000)
 __AARCH64_INSN_FUNCS(mops,	0x3B200C00, 0x19000400)
@@ -602,6 +606,10 @@ u32 aarch64_insn_gen_load_store_pair(enum aarch64_insn_register reg1,
 				     int offset,
 				     enum aarch64_insn_variant variant,
 				     enum aarch64_insn_ldst_type type);
+u32 aarch64_insn_gen_load_acq_store_rel(enum aarch64_insn_register reg,
+					enum aarch64_insn_register base,
+					enum aarch64_insn_size_type size,
+					enum aarch64_insn_ldst_type type);
 u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
 				   enum aarch64_insn_register base,
 				   enum aarch64_insn_register state,
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index b008a9b46a7f..9bef696e2230 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -540,6 +540,35 @@ u32 aarch64_insn_gen_load_store_pair(enum aarch64_insn_register reg1,
 					     offset >> shift);
 }
 
+u32 aarch64_insn_gen_load_acq_store_rel(enum aarch64_insn_register reg,
+					enum aarch64_insn_register base,
+					enum aarch64_insn_size_type size,
+					enum aarch64_insn_ldst_type type)
+{
+	u32 insn;
+
+	switch (type) {
+	case AARCH64_INSN_LDST_LOAD_ACQ:
+		insn = aarch64_insn_get_load_acq_value();
+		break;
+	case AARCH64_INSN_LDST_STORE_REL:
+		insn = aarch64_insn_get_store_rel_value();
+		break;
+	default:
+		pr_err("%s: unknown load-acquire/store-release encoding %d\n",
+		       __func__, type);
+		return AARCH64_BREAK_FAULT;
+	}
+
+	insn = aarch64_insn_encode_ldst_size(size, insn);
+
+	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT, insn,
+					    reg);
+
+	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn,
+					    base);
+}
+
 u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
 				   enum aarch64_insn_register base,
 				   enum aarch64_insn_register state,
-- 
2.48.1.601.g30ceb7b040-goog


