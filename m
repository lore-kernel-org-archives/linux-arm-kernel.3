Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE403CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ayb9pPHVUiqszckHV2tH4q+CRDbN82GvMT0+j17xZms=; b=xfAaxv2NMI25gab//IYCyTrnXN
	H6ebTS10jI2OVBHPIFD3MU0puxV+zvaWL6dcgCZ+7LZ1HTpDc6TWhle6NWjEwuS+8jodbgu0OfSdi
	vW9XouLMmAJhL2bMBEFQY5RNHvSNWiVUmUrWfxSr+E9Jtg+bO2/4wo+UdcFGUcFaUAp2BzaeVykFu
	XQAwNCRVV9QNspugITiwLvqo1vNYX1vmVfGE1QN1eGBMx1FF4XAk6iqaOE8gsYimB6PhQ0rEzb5MH
	IwJjMQdjpSH3IvzrNllJFPD3u1Yy7HiFGtihkef8dcLjTTk5TK9Uofx16kw94iLijk6uYiXoIfjxM
	VIqh3zow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9yM-0000000H5gI-3vaE;
	Tue, 18 Nov 2025 00:53:30 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9y9-0000000H5WU-1G3W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:53:18 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-bc0d28903c9so275530a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 16:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1763427196; x=1764031996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ayb9pPHVUiqszckHV2tH4q+CRDbN82GvMT0+j17xZms=;
        b=WvS0E3AXigp4rlUFXquuP/LDQ3JeNAeDvWpoPLYdZM/4haX+JYx7R+f5b0s26VoHer
         4Ebfj4SZCIlmRKm+5EcdPbPpldFzRoinzlnLXLLaDYvs8LKomnGyn8dv3A2AZpqxxeVZ
         GyPBrJN3rQmeuNCisELipkjbn7VUJ67LalAqdPfmLw7w1QoKY5kWAkoD9/DjHLT9/Iog
         kGs1kSpL80y59g/pt3AnbPZmW7LvvNEU8D60S5GavigGGZZCz7B5FUYNMQIp5emHs6NI
         Cfw01192A5DkMAGkr8urAQlniydlWCv1Bb6tghOPqSNcio6ohxNKjtuxFGsxxJroVSrB
         2yQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763427196; x=1764031996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ayb9pPHVUiqszckHV2tH4q+CRDbN82GvMT0+j17xZms=;
        b=IaUd9VkhKk9cmbxKDUCc8skK/DjqJZFYSAK5xh8QTbURewvmxjvWdtgXTHsznQzMiV
         6mvIJVws0I1SXNJMBWmL9dlVUH9eFa87q1SQK/kVJm2Vq2SmgJKLovHd6e75ifQ0AJZC
         25r7smICtsfrJ/wxwm7dOmXvQzn042IOl8L+dWZS1S6KDSrLa598POuGgzcyE4qs6Mgu
         +kP3s+UePNNdd8u5KeT7wGf3ecpbGSUFqIKLMKemMJHq5GZbNRS5l9cEjpyqhpf+0fNV
         HHCHZj7Yexu/L7SxpI3xxDK7fJIN3w/6KSgIYQAsx8k20CFc/N9WlgPAKrVUtnlNuoH6
         UY5w==
X-Forwarded-Encrypted: i=1; AJvYcCXOd22IVXT5sSKotXE7X+5ywyG0fjXZGa+RlqvFrZafFsZl72pv8h0r0ZMNN+VnNvSOT3kLxk6qFD6pgSegaXkm@lists.infradead.org
X-Gm-Message-State: AOJu0YwayAtFQ2Dt9Raz9gmGuyvDk8s5YOnUkjWbthv4/BmqiIhlWSTV
	X6q/Y7fLdqvkZH9rdyqQAm0VhdCwAeOrbW2FxTlDjaCrhXvG9doWAxHJ60W7qx6lz+I=
X-Gm-Gg: ASbGncvUWP06X1r8Jy7D6O1LrwLZpWoJPYusHqVRmK1/EatbzKmTnLfDXpHXqDNzuXf
	cFA3eTRihpj60Ayifll9BOiLChVfpSKTTuToFCGjpxuoT5+BR5BQZjlV73WOcq686Akz3k7QTNj
	vRapIf8lAbmUYk0YiALtt5fIE3R/KTx4yWdHjTNAv0TBZ7jZBwGAnJNQdXvhQQK2gT0hZiCXlVa
	3e1Eq5Q+6tzQR9ZRMCSodhXPzNA9kNUmSIW9sa43jAHZh2R0c3WFDj4lALkUvfWwIg9aCrsEhSm
	pvDmwpYays/3F/zwhAYrjx+sKlITRzM3hHvpAKYztuZuUyOvx75a2hiJ/8NKVIzPOZ7fosRDwYm
	Vy7WYVU9Av42AlGqznqgCPyIe8NbTrlWzal/3jcVYcRAzOoFq31whfXtPfCiN12d3vyQAMzl+2h
	QMm3gfUZ7aSg==
X-Google-Smtp-Source: AGHT+IEUGIODZx1Wfz3Wv6oc+vJ9J5EjB/D861mEHl/oVQT6yaLvmVCdz0ng891OAriQViGzaRdEKQ==
X-Received: by 2002:a05:7300:e885:b0:2a4:3592:cf89 with SMTP id 5a478bee46e88-2a6c984eab4mr335227eec.0.1763427196317;
        Mon, 17 Nov 2025 16:53:16 -0800 (PST)
Received: from t14.. ([2001:5a8:47ec:d700:ef59:f68f:7ffe:54f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm67568555eec.1.2025.11.17.16.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:53:15 -0800 (PST)
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
Subject: [RFC PATCH bpf-next 4/7] bpf, x86: Make program update work for trampoline ops
Date: Mon, 17 Nov 2025 16:52:56 -0800
Message-ID: <20251118005305.27058-5-jordan@jrife.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118005305.27058-1-jordan@jrife.io>
References: <20251118005305.27058-1-jordan@jrife.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165317_340088_AB6841E8 
X-CRM114-Status: GOOD (  12.78  )
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
 arch/x86/net/bpf_jit_comp.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 36a0d4db9f68..2b3ea20b39b9 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -2956,15 +2956,13 @@ static void restore_regs(const struct btf_func_model *m, u8 **prog,
 }
 
 static int invoke_bpf_prog(const struct btf_func_model *m, u8 **pprog,
-			   struct bpf_tramp_link *l, int stack_size,
+			   struct bpf_prog *p, u64 cookie, int stack_size,
 			   int run_ctx_off, bool save_ret,
 			   void *image, void *rw_image)
 {
 	u8 *prog = *pprog;
 	u8 *jmp_insn;
 	int ctx_cookie_off = offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
-	struct bpf_prog *p = l->link.prog;
-	u64 cookie = l->cookie;
 
 	/* mov rdi, cookie */
 	emit_mov_imm64(&prog, BPF_REG_1, (long) cookie >> 32, (u32) (long) cookie);
@@ -3079,7 +3077,8 @@ static int invoke_bpf(const struct btf_func_model *m, u8 **pprog,
 	u8 *prog = *pprog;
 
 	for (i = 0; i < tl->nr_links; i++) {
-		if (invoke_bpf_prog(m, &prog, tl->links[i], stack_size,
+		if (invoke_bpf_prog(m, &prog, bpf_tramp_links_prog(tl, i),
+				    tl->links[i]->cookie, stack_size,
 				    run_ctx_off, save_ret, image, rw_image))
 			return -EINVAL;
 	}
@@ -3101,8 +3100,9 @@ static int invoke_bpf_mod_ret(const struct btf_func_model *m, u8 **pprog,
 	emit_mov_imm32(&prog, false, BPF_REG_0, 0);
 	emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_0, -8);
 	for (i = 0; i < tl->nr_links; i++) {
-		if (invoke_bpf_prog(m, &prog, tl->links[i], stack_size, run_ctx_off, true,
-				    image, rw_image))
+		if (invoke_bpf_prog(m, &prog, bpf_tramp_links_prog(tl, i),
+				    tl->links[i]->cookie, stack_size,
+				    run_ctx_off, true, image, rw_image))
 			return -EINVAL;
 
 		/* mod_ret prog stored return value into [rbp - 8]. Emit:
@@ -3486,6 +3486,11 @@ int arch_protect_bpf_trampoline(void *image, unsigned int size)
 	return 0;
 }
 
+bool bpf_trampoline_supports_update_prog(void)
+{
+	return true;
+}
+
 int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image_end,
 				const struct btf_func_model *m, u32 flags,
 				struct bpf_tramp_links *tlinks,
-- 
2.43.0


