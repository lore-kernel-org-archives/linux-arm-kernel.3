Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC80FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 02:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ig6glpfwApy1o7Mm7Uu+S1mQRfa0XZ6/LLKszoVVhZ4=; b=fLf1J3QXq++CEtdB6XF2RbTuQo
	IyY+bY3xdgqC3wA0yJsmVVKmgNiqH9kLYItBdnsJoyouLGJvYp3rBrdVM7FsDtZdPXld2V6+ILwMd
	eZ3LLh8ElZENVZWifyoJQqQ8x2IjnumO+VMh8LAEmcD+h7hLi2pI3IKoqWaYvvkrXQv11vqDhQUX7
	CcbCDU6Aua0BH/YB9FLNlP/uEdnFwJPPQYfXlQBGVqccnax3BmUSDpEWIUYuy5iW1qMByOLhPIoK7
	+y77NoJ2ygOqZ7PE/ScX0jhPfL6jdKdJlEGZIdhEs7I+b0bWkyc1YtweLa6NyBoCCL2FxNcY4BFry
	o+52smAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTX3F-0000000BspY-2GOc;
	Fri, 03 Jan 2025 02:04:37 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTX23-0000000BscH-3vBC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 02:03:25 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef79403c5eso24564193a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 18:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735869802; x=1736474602; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ig6glpfwApy1o7Mm7Uu+S1mQRfa0XZ6/LLKszoVVhZ4=;
        b=qUHF3zgZZp4At99cbLw9TmI4HCwyWQYTewKdBoldGA3MEwc/TCSokINCHlkpNb/LFi
         VMtlGkMXMaCYt7fjKJLPNc0J/jkWGrSPNTQVQ94u9vT27F6iXAutpY2jfSuB1lY8cQ9D
         GCP/gatVYpGJ08osHeRjclnFzi4BDVh2GI+8+MqjoCNDlfwXe4UiKblP8d0roIWbkLry
         WNHXzMCvH3INtcTwxcnEYxINHh66/BE/lmj/JYrYf26FSLSszcvDoMkt9t77ip+Z7aqY
         fKeKIPC7nHw15qvn22yfJcERzEXtwDatSwj2SKBp67ewl0pCDheAOqM+s1sxUInToG5y
         vm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735869802; x=1736474602;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ig6glpfwApy1o7Mm7Uu+S1mQRfa0XZ6/LLKszoVVhZ4=;
        b=LzxhUhYNaMs6pYj0uCDkWou6RxDXxgk4mOnML5Njx9s50J36OavzA/HsqhfgaoO2jZ
         lHubnBNAcCakGGPbHEIaypU3hdNTXnxsqZIghzOZKBMmbS+iuxbEdtcRzRbW9YACOCaF
         0XwzujPSd2mYwWBjS7UaQEFzPfvQGV10QemKqLrKUAUG+ONfJFZQr9BNDvmlL2IP5pHT
         PMJ/qW4ec4LhUNjG2kBhrjKTcIrRfuvdYE7eWPnVw2aMIc6pxNXlLhMKdeEZrb5bSIKd
         sLh5PW46lUvHZTk8/hAdBJWC4RctaAfUZFDcnrBuujs+tskEK0sRs5gDka3Y+kHprYuu
         Dggw==
X-Forwarded-Encrypted: i=1; AJvYcCUxb+InZS46BXv90gnJE4X32Qc4du0zriiw0aQM5Xjr21eVnIra6R1zPdc0r0e/CSKo5JxAmmNPNwa0HesuTL6V@lists.infradead.org
X-Gm-Message-State: AOJu0YxIYgxR4YLer2GDbfKEEBIFxrnQGIOeMjAaNDrFmB2XpRydBn/f
	ObzqHuEUeazBs6XtTcCIObyBiF0UL8/5RyN13H4lESdjo0q1jHVOZggEcNlP/vZHeU9u93OdNul
	7K6+wNYWwlA==
X-Google-Smtp-Source: AGHT+IEL5evFIYGE70thXWV9wnfSiMcphGKAQ6COYmizEZzma8el/TiuwM5NuPGwXcKyaiMPRwLa0I52lt/X5Q==
X-Received: from pfbct13.prod.google.com ([2002:a05:6a00:f8d:b0:729:69d:93b6])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1944:b0:71d:f4ef:6b3a with SMTP id d2e1a72fcca58-72abdeb6e80mr69465699b3a.21.1735869802431;
 Thu, 02 Jan 2025 18:03:22 -0800 (PST)
Date: Fri,  3 Jan 2025 02:02:53 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <e8520e5503a489e2dea8526077976ae5a0ab1849.1735868489.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 1/3] bpf, arm64: Simplify if logic in emit_lse_atomic()
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Josh Don <joshdon@google.com>, 
	Barret Rhoden <brho@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_180323_989852_9300FEDB 
X-CRM114-Status: GOOD (  10.04  )
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

Delete that unnecessary outer if clause.  No functional change.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/net/bpf_jit_comp.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 66708b95493a..9040033eb1ea 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -648,16 +648,14 @@ static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 	const s16 off = insn->off;
 	u8 reg = dst;
 
-	if (off || arena) {
-		if (off) {
-			emit_a64_mov_i(1, tmp, off, ctx);
-			emit(A64_ADD(1, tmp, tmp, dst), ctx);
-			reg = tmp;
-		}
-		if (arena) {
-			emit(A64_ADD(1, tmp, reg, arena_vm_base), ctx);
-			reg = tmp;
-		}
+	if (off) {
+		emit_a64_mov_i(1, tmp, off, ctx);
+		emit(A64_ADD(1, tmp, tmp, dst), ctx);
+		reg = tmp;
+	}
+	if (arena) {
+		emit(A64_ADD(1, tmp, reg, arena_vm_base), ctx);
+		reg = tmp;
 	}
 
 	switch (insn->imm) {
-- 
2.47.1.613.gc27f4b7a9f-goog


