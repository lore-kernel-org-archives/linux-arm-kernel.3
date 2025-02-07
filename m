Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE71C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZVryglY4SpsTL4//l81oNX0vaTjg5yUDPJMzMkBO6s=; b=TVnthru94csWSIhAszJFI2BOYV
	X1ewILUpDTttfZpqkM0nWvquTL36URwl3W3haNIx3By7Dvn9c9LGlyq55qsNlsFBCgBBBMh1kLmkf
	W9ScX5XOqDMSFGHVTAfNO2DSPa+LPI4CGGGiT+iQDMzNhVjxmOq4qj0eJ3Gl0nIKt6y1scDFpDN3D
	1s88NKZRSFA/E1OIEJ0iseFBCbExWNa3L+GHzKa1scVclLoPYiarg7HqT/9L5fAYN69lD4fObQwB4
	NNIQyKv24ZDtZdXU5tw5xhtmmPoNLcaM4jEQ+Or3r75uoARbwJGX4Ej0dEHTAvbSHuYAxEdsB/c1u
	bwOzSlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDtJ-000000082in-2OOX;
	Fri, 07 Feb 2025 02:14:49 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDl2-000000081ap-1a3c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:06:17 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f9fdc4dc84so3252273a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738893975; x=1739498775; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tZVryglY4SpsTL4//l81oNX0vaTjg5yUDPJMzMkBO6s=;
        b=ti0FOSkMtDL50JnYCRM4FGrqDfOXbHd7Qg4y+RK4+REO7aP3EIg/7H5B6HSagbjMkN
         HN4lvOk5KtiWafe940o0MPoRrqbrPssYKJKe3TBFufVc7Q2OJa6fER90759XMv+sp9+D
         xu+lFP5iXp8Js396gswJUWH00nOKTfWRT8iO19JSKEd6ZyVDxelZT9iRC5ifrd3oIwgx
         oyvHNdJd7I/6NNWetdA0WX9yL9KgGXYCvp17jqItyvF2XjilDlF7dlZx+Z4ExF0jWhlE
         ae/bsHZrcxY0/i0HVzqW3zXiAupeWoBEpym1Lo6hPjh9tFx0RjRKD9zYMaUoPPv7Oi1B
         EfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893975; x=1739498775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZVryglY4SpsTL4//l81oNX0vaTjg5yUDPJMzMkBO6s=;
        b=E7arc7eHLTttPra5wVHQYYal+CVahZQFMgh3U91VA7ELxTKvBMU/o4500NK1c6MKeq
         hhwWNRDRKZ/V9Wkx5vhXZzF89qUkffDmMFtsmkNLTR8OLmK2aeuyUe0guFurmtS3MWzB
         umxJ8TD64Tgf67EMjI4fhgoQXQ9EmRyEKYd7qzn5/kHSgDFMCXvniiBBgC9/rC1s20BH
         ZcUoPKJZ57ekxA6RN4fGLfQINmpIbieG8A9Qmry4Ae0DqaT1n7dL4D4c/nlveTaRFkNr
         0GUhxeoFWxmDbHGz8i3V22DwZ/C+sXlO86fPYLN30+okC/XLn4gxHhzfOrPB0CAN6dEv
         q+6g==
X-Forwarded-Encrypted: i=1; AJvYcCXvOrGSOnQIqmXC33Bz/1NKMY/FSRetItWbC7j3TAwhezgnsTGAIGT0tk+8qvXy3YZrU764TsoQ0qq8e4BDRjHg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbn0h6I0wNmn147iOrqPwAabX/LbRHnWka539v4kb5GHOdia7L
	17epJXimYZ2EIVkUwKdxMK7DqigmBBu5QrmpEm/pAtAeBiJy/33JW5g14evL2/dqelGWYEd7MBX
	NW8V3rSII4Q==
X-Google-Smtp-Source: AGHT+IGIQlJHYn4lDP+h2wWyOKBebCVWMqyOh64SVoatr4LfPmXKB3GVTfYlGBX4UVXE3HcAasyz3VEj0/8t8w==
X-Received: from pjyf6.prod.google.com ([2002:a17:90a:ec86:b0:2fa:15aa:4d1e])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:184d:b0:2ee:d824:b559 with SMTP id 98e67ed59e1d1-2fa243f058cmr2144082a91.28.1738893974955;
 Thu, 06 Feb 2025 18:06:14 -0800 (PST)
Date: Fri,  7 Feb 2025 02:06:10 +0000
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <8d599a837068e7a526200bbe7c6355ad4c5fc028.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 6/9] arm64: insn: Add load-acquire and
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
X-CRM114-CacheID: sfid-20250206_180616_414313_9C856CB7 
X-CRM114-Status: GOOD (  10.87  )
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
2.48.1.502.g6dc24dfdaf-goog


