Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380E1C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 02:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ff8OoM3RwJ/YS9q+sO/KvAZcdKn8t6Rkpge4WfBIGvQ=; b=k3cNef1Pp4wkQYs0ck/XHpfU1p
	464OGMoSspeboY/iBg8jp4+0TFHcp/wPyCZXKSejv6LIf1dioFHB506hE+3WM71eNwJG3t1SGYdy8
	QcYCgyOcb5TcVKDrLHnm5R//c1ZVKLICD2BvvJY4u4nS1D5+zZQ5T1RYzFAVe+SztemWnjItEaeMh
	RSNlkSlFSmAxDou5kZDGo6zVPdK37H85ZuJuKC/jvpvQ3ZjGyZ0RPqzOfQy88rATq1clHQ1U6ZTgJ
	EQmxe1Sm3g/Qh0Xngv3Qj6f6g7SHRwKlGU9z1AlYv5U/FHyyo6kK1oYspEPbidB7YPnDSxJZTc/kx
	2YIGV5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVrJ-0000000Fuex-4BlG;
	Sat, 25 Jan 2025 02:25:18 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVlL-0000000Fu30-1KFZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 02:19:08 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-21638389f63so40929045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 18:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737771545; x=1738376345; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ff8OoM3RwJ/YS9q+sO/KvAZcdKn8t6Rkpge4WfBIGvQ=;
        b=bz/eWi16XDFU52dA2k7aX5VDzPrYtgAhdcwrsIYm1z7FxmzA1hC8dZUuhY/hQc/ln9
         kXAzosy0WABEnNuWjnMpEWZImU46n1q4YPWn0myDd0H5bKScITm31vzWswGEqG3AJWhY
         G/gJpa4gZhqEd7JIkgwoCxR8Qlh73TzQJYyFXMsN2QHApSDlpUgcWWhoYAu6UDEvflyY
         AJ50DVVgy4NVCYKGmhjPfrrMBnER7IjoraEHRnZmmnd5nsyZ1a8y0Pj2gfPs4ao7Qhgr
         WndYaJexu/G6A2jl8uEIpPExo1VP0ip1aRafLmRIQyNsn5SK2QQ7xV6+fry0ZWy/u0FD
         eU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737771545; x=1738376345;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ff8OoM3RwJ/YS9q+sO/KvAZcdKn8t6Rkpge4WfBIGvQ=;
        b=Km2jfZCCOTX1O75/VfuOwfsOg3Mjo4z/FfgT2lBJsdtP+9h/isz5GJpkXv7DZEbcCV
         KwX5D9QnC+36jVjVvoh9pIanuRBxHHjumqQtACcOoXRJaesgVUXQvmKNPjbmActP013K
         vDZkCUAT29oiSHIUyItu1/RKqt5LoR7ysocv1NaQ6IzPWEeBeLVN1VOXtJobxU9Dn7Rq
         H29EYezTExZtws7Yd2UUaQOPFTar+cTBwZifvJncAw4cDhXkP6LSigAXDg8JFLGo/iVf
         xto1lvX74DLP3q3DcpAlPL6loUJFXsKnLX2X8fpmuTm/UThzr2ZCNE8Tpq/1Alw9RPAh
         xVUw==
X-Forwarded-Encrypted: i=1; AJvYcCUTA9BolVezW2GgwvpvIPZ90byxtfvV0W3SOzhtRQEJtAA03HOQPvjk5K7VN0q+tlobsScP4B+TCoW+6j9SVd2T@lists.infradead.org
X-Gm-Message-State: AOJu0YwiUQK43tsH1WCqe9tqsmgKqPVII3ecL+mDBmSmtkvCcZBinvSP
	8v/UcxRDTV/my0Y0YRqoNY3rRyjN8h9T6pLLAgz4j9rbvqaMRwLt/wYywjGIIwEczy4zED99SGJ
	CxfnsHDtNIQ==
X-Google-Smtp-Source: AGHT+IF5yitEZ2ynO7/1xRDH6f+mEY3tHHd6tHuHsyfWb71s1fY6pLTuNoYRwXYGNFFpe0KHLpuGhOpUmxzkiQ==
X-Received: from plgn4.prod.google.com ([2002:a17:902:f604:b0:212:4d11:70f5])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce01:b0:211:e812:3948 with SMTP id d9443c01a7336-21c34cc010emr536071555ad.0.1737771545532;
 Fri, 24 Jan 2025 18:19:05 -0800 (PST)
Date: Sat, 25 Jan 2025 02:19:00 +0000
In-Reply-To: <cover.1737763916.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1737763916.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <7544131164e5a3ab1aa192e895c883106d8dd324.1737763916.git.yepeilin@google.com>
Subject: [PATCH bpf-next v1 5/8] arm64: insn: Add load-acquire and
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
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_181907_353736_8FC304C6 
X-CRM114-Status: GOOD (  11.13  )
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
 arch/arm64/lib/insn.c         | 28 ++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

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
index b008a9b46a7f..f8b83f4d9171 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -540,6 +540,34 @@ u32 aarch64_insn_gen_load_store_pair(enum aarch64_insn_register reg1,
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
+		pr_err("%s: unknown load-acquire/store-release encoding %d\n", __func__, type);
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
2.48.1.262.g85cc9f2d1e-goog


