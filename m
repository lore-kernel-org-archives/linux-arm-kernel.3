Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2568EC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 01:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BuDMmX0jHHwSlxRNuzBpxukuM3wSJDBUPrtSODIeAg=; b=Bs4vadsKpX9tN5/vPHTp3GZP1c
	qyKZBPtbLCDMaUfSDoeQOylUdlSW9ZEYwy4T4jJR/sCka5PfdqIDMW72LTAyVgja0yQbT946m5XIk
	hGe7rr/+aOeyZ+LAfbY2UokDmddV1rXz66FwaZKz1we0mCr8VpRwbFpXbN9QYkM7u1ixsaBhOX9hF
	kQCf5JHACjXmXbOXq9aMiKYNZBL+pmBXHtKQLrKwVGNgDVFbP1GMSl2TdYF9Gg1XvWs1PilP4jErh
	IZ9F6ks80myyTP47Pj+v4ENzo03Rc/JBaKHjEu3K35oxFwd7huby7CnvJbjvk75ZzgsX20Dv+wrk+
	tnl9/+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGpX-00000002jma-0qxN;
	Tue, 04 Mar 2025 01:12:19 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGjw-00000002j5R-1WJ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:06:33 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fe86c01f4aso9883142a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 17:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741050391; x=1741655191; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6BuDMmX0jHHwSlxRNuzBpxukuM3wSJDBUPrtSODIeAg=;
        b=TPVSh8MxiSfJsafhoRWlu+2sXtIJs3ZjVRaHKrroQ5kBsVsF0KkU+iuZTn6zX8MYRS
         bHjhwdHYuBnWgFxF1/wBS5QkAs9lcHVkoF7JsGTP2QihaFkY+OKFGIpPjESQb8GRfd/6
         J13sqk3+VP15sWHsYYRutiuxP7R66O3hv/gkbahvDlO6M3NAHs9Sw67QNvw08SFgJZdq
         uSU0fPQGk1WdnoSpJo3DvJxezAKxpTk8wqquZ83E15RNOUsr+o4w2KBzTOvLVouvhih+
         5PtXjKIsHi+enwsaWZF1RQuTkjTtPG85Sq9SRc1V3nhnix8a3nBKVxlEXEw89/pqmK+H
         chcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741050391; x=1741655191;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BuDMmX0jHHwSlxRNuzBpxukuM3wSJDBUPrtSODIeAg=;
        b=cRi5dR+KGoInYH895axXVPG1nDxkClZdxtj/vDq45v1/DkkzOpUCkFqvWTeOE4EBUC
         GoFT4AVX4bnutj9QyApDiypUcrtCKq1KWuRPM9KGL9mA6KFBKTlx24og0pGp1F/IwkoR
         2XXOsuxfV7j6pj9oV3+tLvqrXM1oPMWqSfld+4YpPUt2nUvLtODT6nOS3NBvrNxQTUt6
         wPEKAFqx1aHQmyfKNjcpnA1niuyBPFPbXG/JhO43Ew1cYhSfRz1gyexZh1hvyiPq2e51
         cNCJaFjXQrTujcdMJaVSSFZ/9UZ6Y1t5tAw9Tr3EBXw8IvmnYdL1UsCNh+yEXeR7SXvV
         AtMA==
X-Forwarded-Encrypted: i=1; AJvYcCXjME8GPJMipiYWDc9ZqAPKoCjkv+WpFd3sMO0T9dm+vZdvPsA1C7eGxE8cDZx2iwJBSRHqk8riudhPaLz+H25y@lists.infradead.org
X-Gm-Message-State: AOJu0YxoKtcPmirIFNJpVqkxRKHVuULTpvbK9dv6LbOD56mAC3l3jfT5
	8fprdFkd13H1xm+6kiTYwhknukHcl/rEHvdTDVklZq418xuHZ7h5h+WF7ulGfMiVD4ZSsywWJOq
	+cAgdx2Mzhw==
X-Google-Smtp-Source: AGHT+IEcZse/PxUWK6noSaGV/op7yUGHmHrKSD2SI170M3zfS2vOWknK1IqYRQYIDagchmJojH0eZ7OMjoMWEw==
X-Received: from pgar1.prod.google.com ([2002:a05:6a02:2e81:b0:af2:3c1d:c03c])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6da6:b0:1f3:3538:6f6 with SMTP id adf61e73a8af0-1f33538094amr3507137637.9.1741050390934;
 Mon, 03 Mar 2025 17:06:30 -0800 (PST)
Date: Tue,  4 Mar 2025 01:06:27 +0000
In-Reply-To: <cover.1741049567.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1741049567.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <ba92057b7502ce4c9c9b03b7d637abe5e178134e.1741049567.git.yepeilin@google.com>
Subject: [PATCH bpf-next v6 3/6] arm64: insn: Add load-acquire and
 store-release instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Daniel Borkmann <daniel@iogearbox.net>, 
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
X-CRM114-CacheID: sfid-20250303_170632_396192_EF443AD6 
X-CRM114-Status: GOOD (  11.29  )
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

Acked-by: Xu Kuohai <xukuohai@huawei.com>
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
2.48.1.711.g2feabab25a-goog


