Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61BCC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BuDMmX0jHHwSlxRNuzBpxukuM3wSJDBUPrtSODIeAg=; b=piicQiPNmdpR88dtIJyZJzgp7Q
	1y3GH5YBfFK8dp2n/tzEVZV2tZyg5iSDOB8P4Mn02dnrV+B6zbe2dmKxkvd3XgJhyNLfSuaM97acC
	s6BBZlzxF/wbFRPjHHGroMiY440vBoPtaOzB9Rr9LIWwHP04eOr2sFSSaYn40LDC+Nu468ApRbUpz
	K9MCkr0ygucpZx01G9eeta8/kyi35dFDtLcrCWcHZ/Y5XxCVZ6FvtsB5F5LrCdZEYZTtjyKOqXifr
	m0P+sum+38t2a4JjaWHbvoblYHz1Q96CPlcuiL2Bm0bF/JsxDZoXX/m+OfjEvlODMpEOwwnN1v/oL
	A8shpARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpG0t-00000002dxg-1iil;
	Tue, 04 Mar 2025 00:19:59 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFvK-00000002d48-1Flg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:14:15 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fec1f46678so11008491a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741047253; x=1741652053; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6BuDMmX0jHHwSlxRNuzBpxukuM3wSJDBUPrtSODIeAg=;
        b=ednpOB0aWNqZ2LwT1vMIMR4ijnzBHkaB/TczhIbRBGJK9YE8NGmp7GBf74zJAYrDGM
         1znWfI5pqWoVc8EKqLBJrYDba2V+RJayJbh2pAyk0bvMXUltxWWJBmQWG6+89JbNKRBU
         sVvywBN2HCYl1KkiKqZRxkMQ+jbOThzH9wwZ2OAGKZ7uU2dlsjqF4p3YlrLitjSEYPci
         l51pL9Kt/rvGXlg4kbeZ4BVZvmSnj6ELzOhpSdEmqSR3cLs2mIeDl+jBi5bZwLpy+euc
         MsIN4F2NK7VcvsjviSavbR0DhpjmzZ+7+vUIuBbvpxCQMyn9kDe+oUJj2mheg+/cA/YA
         xS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741047253; x=1741652053;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BuDMmX0jHHwSlxRNuzBpxukuM3wSJDBUPrtSODIeAg=;
        b=bBW7CEDQlHUONDUkd7eYByJ/UrFInkqlsDnlMDIiTUfwQL5NRbFGaULa6Lo20p4UbW
         uv+nVvQytVZVsyTTUa/mHZpWzyP8J5Xj/90TSVVC1sLbuzcbDhLhtaZVI+NKpv2MO5fQ
         WgkSP6UjlqrNqYKbCtw5qu9b0/V/eqBcmhgndLxJAjvQ6WR1nCaplDS1FgDquK5H4P+E
         rvSN/5ufLrTYWavsnDJzm9m0jsJypeUUGCACJPqsnrYsh4j1V5QB6eHbcUQyo81WzXpb
         0gucwGKY6f3hDo4wyJnlW+MbrrZEAgBwo4sGFJetYpcTjbS55hMGkGyxCIzpfdgg3GC7
         anhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIhn0S9vjC3tSFCefXHeGEY/ONEX7D8D8bpc+PxQDF4ZifDdoHuOxacLTkDkZS0PjMsdLOaNf3euVVc+Qqu0ay@lists.infradead.org
X-Gm-Message-State: AOJu0YxG1OU1dcDzMmSYUxuG4TTkqsLX3w9WwE/9FqAgQuV20o44brtT
	16qVMCMcxcMjQEonbUJGbJcSh8E8wW9xlF9UzyhapbSuAuEc1cQs0fS1HA9FA13GeMgUPVAdzay
	DOE41ZoeDow==
X-Google-Smtp-Source: AGHT+IGOpCu3OXD73tEgxK9xxEUC9/5ESWDz1XBGz/lu7j8NatFRmGU1kGrob9P49WI8BfX2x2ISYP6if+iy9w==
X-Received: from pjbsu16.prod.google.com ([2002:a17:90b:5350:b0:2fa:24c5:36e])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3ecc:b0:2ee:8c98:a965 with SMTP id 98e67ed59e1d1-2febabf7cafmr20404417a91.34.1741047253086;
 Mon, 03 Mar 2025 16:14:13 -0800 (PST)
Date: Tue,  4 Mar 2025 00:13:58 +0000
In-Reply-To: <cover.1741046028.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1741046028.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <f2f998afa813534f94a6b36a6224e04df08f9871.1741046028.git.yepeilin@google.com>
Subject: [PATCH bpf-next v5 3/6] arm64: insn: Add load-acquire and
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
X-CRM114-CacheID: sfid-20250303_161414_329476_3106F3DF 
X-CRM114-Status: GOOD (  11.19  )
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


