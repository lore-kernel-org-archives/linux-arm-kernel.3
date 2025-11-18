Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FFCCEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJWvEh/HJ2KX3LdjCjzprEHwj4So4ol1ev17Vb/Ad9I=; b=fsk5fn0tqKJvRbp0rAOAkEm9T8
	UnUbyfdQA6jZ2//QVNKqpXwvdnkyeizoKS/E1zNMiynvBVjGZEbfwKUXvW9YLF8zVJeQKyaFuX5ZF
	zwrr84zw1BToN7Tyaem/jpl83FNhjA+dZm8jSfLktdZg6j58KQSY6RMLcxe+FoQRawjKCslgzrRPo
	3nRAEpaemXnI/IU/6niCskNWzwDGS0fmjPObooOu4jv37ft5qLK30x7jBOdqJf24JRaMWjPX+yivF
	m2tQtVoEIfaJm/etC3+8EXxrjvzNILitEuFdKLesf5smEjVqtYyuKLF09L3r+1tqMTOcEokt6BCbf
	5GFQ4bLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9yN-0000000H5hL-3McM;
	Tue, 18 Nov 2025 00:53:31 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9yB-0000000H5Yn-27e8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:53:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-299e43c1adbso2069065ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 16:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1763427199; x=1764031999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJWvEh/HJ2KX3LdjCjzprEHwj4So4ol1ev17Vb/Ad9I=;
        b=vDzNR1C7y/WthsUlvG2INnolFjjU0gDsh88/O5wQDvU3rJqwsDSFPmBfnvJmJ2kIb2
         d1gm+Y75aYgzB3GyscfIygYresZ3pU5bwr9zugSw1H3buwn/Brp0Ses3IgQHPJcFTc7t
         E9Zv+vYh7wz0vQmdgn3wAQjHKWYdldJF/t0TvsEeh23S6/KIGfYsEFfCU7dmhfxx/WUa
         tNi1oCwPFoBl4IQ0XWFET2leyZsgDyCi7otll8OrngJELvF23i19zgettgJrezEMUDtx
         tVUEMsLn6oLtRhSB3yMJh4aU04c0xdeFauElLZfZ/zEEPDHf8WKmE6rJzeCsDTXHTo4e
         aTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763427199; x=1764031999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jJWvEh/HJ2KX3LdjCjzprEHwj4So4ol1ev17Vb/Ad9I=;
        b=NKHFyN0KTkZjHXC5k0kKQFQZgAR6tNtEj8GJyY8FU+TZDR2K0gSMKDjK+3FABpMRK9
         nkuwfKIrI9WMb4duDNCTPqDVWe/GErU7xCxEE+tas70WnDfJf7o6WkXcLeEgnKXo46P9
         /HoxbMwxPWR3OkWLLGVQGK/M85ds2fK58K/tTO2IrTBSjsGlezsjqFHOpn43igEBqhcb
         cInmn5AQqq4E4y6kLXXRmNaTFOud+qCfRT9Pn2Zh853BpXqtYXuPz2OfRUkK9m/4AuOa
         oaoKrL3cYP71FYFUkeUmBoK6YLXw14Ruucp9lyOSu2UoKglX2ajafjef1H1lwYthKtw+
         fumw==
X-Forwarded-Encrypted: i=1; AJvYcCWeCdE+5W748q7l1UUyXfv7iaJqC9m/Fove2sXgNlxV9/eZkTDwTM7I95y0K3mEgxrSwzTHLep5D8t7yBC8rjqN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/xDEta4cToQ9hmXYQOM4+56rbYGQR9ns1FZFmEabR27BcTr+I
	SrdTH057uefkNuql0veWiEF+lvm9oBzYYOPf+euktvxMqVlJCOHbB1rm002ectO/3mQ=
X-Gm-Gg: ASbGncsM3EmUbiQyzOvgL9N2N4tDH1CinRyYpRTi8HGmOU3i7NLoZ+UaFGW4PRbucy2
	ZbK5XCdWsCv4CdpWUAh9IK4ioCxaZ916Z1+kPlKMg3ukMI59Z9qCFRyp4FkA9pBK29aIPZw7i9j
	a0/Yl3ZakNQOLm4nsSKYbAUYrbMgDmwmhnMkJAn45X9iSZSgLKlowLSajIRQpyu7EcAtxD8Kd2q
	KrWKgiJekuVIP5eNT1mmJnTVDtvcgBzueVmBVGsDHCYPxOCd8t2NNao53gRmK/FulNy3TUpmjP2
	kz6KndrpvZFAdGFiFV1H7CJdZYOpJVjauNW29S8sgcIonJX3YAdCq6ehSqEDeAgQnk74rPIPywm
	O7l7UpW8bHMbtxwleoSi2iasf34BjcsuzM/d+y/VDbwdNVZhSmsel7Wsf6Oq2jvmPE25NyqbXbL
	Y=
X-Google-Smtp-Source: AGHT+IG3sPrz8MEZiYwPiZ6/EpY059urBkdovE1wf/NV5guCPZ6qna+8U9eWUGcGq+wUPWME4rwtsA==
X-Received: by 2002:a05:7300:fb05:b0:2a4:3593:5fc8 with SMTP id 5a478bee46e88-2a4abb56fe7mr4474732eec.2.1763427198597;
        Mon, 17 Nov 2025 16:53:18 -0800 (PST)
Received: from t14.. ([2001:5a8:47ec:d700:ef59:f68f:7ffe:54f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm67568555eec.1.2025.11.17.16.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:53:18 -0800 (PST)
From: Jordan Rife <jordan@jrife.io>
To: bpf@vger.kernel.org
Cc: Jordan Rife <jordan@jrife.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>
Subject: [RFC PATCH bpf-next 6/7] bpf, arm64: Make program update work for trampoline ops
Date: Mon, 17 Nov 2025 16:52:58 -0800
Message-ID: <20251118005305.27058-7-jordan@jrife.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118005305.27058-1-jordan@jrife.io>
References: <20251118005305.27058-1-jordan@jrife.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165319_549056_2994836E 
X-CRM114-Status: GOOD (  13.79  )
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

Use update_prog in place of current link prog when link matches
update_link.

Signed-off-by: Jordan Rife <jordan@jrife.io>
---
 arch/arm64/net/bpf_jit_comp.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 0c9a50a1e73e..1725d4cebdf2 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2284,24 +2284,23 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 	return true;
 }
 
-static void invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
+static void invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_prog *p, u64 cookie,
 			    int bargs_off, int retval_off, int run_ctx_off,
 			    bool save_ret)
 {
 	__le32 *branch;
 	u64 enter_prog;
 	u64 exit_prog;
-	struct bpf_prog *p = l->link.prog;
 	int cookie_off = offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
 
 	enter_prog = (u64)bpf_trampoline_enter(p);
 	exit_prog = (u64)bpf_trampoline_exit(p);
 
-	if (l->cookie == 0) {
+	if (cookie == 0) {
 		/* if cookie is zero, one instruction is enough to store it */
 		emit(A64_STR64I(A64_ZR, A64_SP, run_ctx_off + cookie_off), ctx);
 	} else {
-		emit_a64_mov_i64(A64_R(10), l->cookie, ctx);
+		emit_a64_mov_i64(A64_R(10), cookie, ctx);
 		emit(A64_STR64I(A64_R(10), A64_SP, run_ctx_off + cookie_off),
 		     ctx);
 	}
@@ -2362,7 +2361,8 @@ static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
 	 */
 	emit(A64_STR64I(A64_ZR, A64_SP, retval_off), ctx);
 	for (i = 0; i < tl->nr_links; i++) {
-		invoke_bpf_prog(ctx, tl->links[i], bargs_off, retval_off,
+		invoke_bpf_prog(ctx, bpf_tramp_links_prog(tl, i),
+				tl->links[i]->cookie, bargs_off, retval_off,
 				run_ctx_off, true);
 		/* if (*(u64 *)(sp + retval_off) !=  0)
 		 *	goto do_fexit;
@@ -2656,8 +2656,9 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	}
 
 	for (i = 0; i < fentry->nr_links; i++)
-		invoke_bpf_prog(ctx, fentry->links[i], bargs_off,
-				retval_off, run_ctx_off,
+		invoke_bpf_prog(ctx, bpf_tramp_links_prog(fentry, i),
+				fentry->links[i]->cookie, bargs_off, retval_off,
+				run_ctx_off,
 				flags & BPF_TRAMP_F_RET_FENTRY_RET);
 
 	if (fmod_ret->nr_links) {
@@ -2691,7 +2692,8 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	}
 
 	for (i = 0; i < fexit->nr_links; i++)
-		invoke_bpf_prog(ctx, fexit->links[i], bargs_off, retval_off,
+		invoke_bpf_prog(ctx, bpf_tramp_links_prog(fexit, i),
+				fexit->links[i]->cookie, bargs_off, retval_off,
 				run_ctx_off, false);
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
@@ -2829,6 +2831,11 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
 	return ret;
 }
 
+bool bpf_trampoline_supports_update_prog(void)
+{
+	return true;
+}
+
 static bool is_long_jump(void *ip, void *target)
 {
 	long offset;
-- 
2.43.0


