Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123BCCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRmr4TJaLT4TSx3gKS19LTLI3SYTE0KLtbCqYCLL0GM=; b=UGz0JgQc1fexYxF4kaIipdz9qP
	ZygNWBccpsReyYJ4SQVLH+M0irZDgOVMK7XN7DxxVYn30jdyv7yQ27K+PztbCjBfDBekv5yA+kooM
	S/oF5Da5srl2jvblO/n1iQEKdnmyybgzbLP7G3VNt9vJL3PGeFPGoegwmnLwmKcAc7wOo+qnEGvrx
	4OzxXx8uhnLfxu3eaRv0gyj9XwsoJ0XVaKJRkMmKT5iA9xCWRXDPMiS/e3iO87AiM8lX8rSR+tIhl
	D+F3kq1UpmJHXpy53Al+svXwW9zGcuc36t9EjUj1HYWp9aNuFId92FYA3pMHuzGPJE1o7jN+G4175
	deHe/fCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9yN-0000000H5gk-1Sof;
	Tue, 18 Nov 2025 00:53:31 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9yA-0000000H5XX-26PQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:53:19 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-bc144564e07so152574a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 16:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1763427198; x=1764031998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRmr4TJaLT4TSx3gKS19LTLI3SYTE0KLtbCqYCLL0GM=;
        b=f8cnVFpD1h8Yy4iHh602VIAaXE/+16aYCKtg2epqzuw8FDqryjej93ORv8vTgJp7r9
         qp+k3DVIFgq/gh9sZpQQ+ErnoXWoZgqvu5bPz5btpbN9edxOo8Uc8fwXMcerT5h4z1zt
         ZeBNiIjtGKba4bAkoIitC9lfiMl9br+c6J9GxODilsap3M359oP1SVkqLhr1L7lPqDo5
         qyavi05vrQOszWWKZEThMkGpl6wadLX4OcubgrwB6X4AryGbrFueSaxcvx2Dpnzwl2di
         rW8LrDuolZ/RPC3o1zZXSoLHszEFmXuaa7dUrmXjd0v7rIQupzzG0MMsMR/0iPYxA9Sc
         sC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763427198; x=1764031998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRmr4TJaLT4TSx3gKS19LTLI3SYTE0KLtbCqYCLL0GM=;
        b=fGIs0eEUcrr9wBClhfkgGYmTx/1RQRg2tdNx/aJqrA3My+8+fQzZUFzF/KSoCO6bMJ
         YjYtgAO9q/RoXx9kOcGL7ACof6mLC62FcPCZW8Wriot/EmBG8ngS5UF/y0Mp9HXYT5+Y
         Jd8QDDLI7eNOVjaQLZP3JcPs3JNiPjWJpe10fM4GoIRzu7dNOWnVOs20T+6ZrkgevpX8
         LG/z5nIUJqetYt7R6em2VqMYrSY+Mg2cVURGJVhg71hSnV/IYyq5nAkoplZVlobAPcBj
         G73hbIkzKn/p+eZ2w2t4mXXrl+QRhYEVT8PjSPCsaXqTL8btTWFoxqvZkD+073dviKqT
         qMXA==
X-Forwarded-Encrypted: i=1; AJvYcCXTNvNrrUejf8De6hyYVp/EhUpXLbxFAXyF+Uo7+KqAYW6HVYWs0pYhSrs/lBgaXk2nw7L2rrOCd/SIOrK9i897@lists.infradead.org
X-Gm-Message-State: AOJu0YxD9ASa1B0mkueStTE5xqde35qsJQfy2b0MJljbRHJMG6uJioKG
	93jvzRZcoGgnpZTngPYOs4CKwqQsejolmIMFjoC3jckignYdXYdUNeSFN/wCQz3aQq8=
X-Gm-Gg: ASbGncta4pAjryH4H4rVBtCMIcJFQ2Zsgb/LqWCW83jrpIej13fK8tcG1xi08G5yKlI
	VLfp+YaMc002xmC5pP/dXt1nR37AE/KwBO2iWwu94jr/DiEhG20vEoQ9k7SUabkVhRu0/vqn5vN
	wJkKxYmVssmVq6VohbaQX7a2KX98+AYBfdXcvTAX0kqfbBtHDrl3aCgecVXXgA1q1pLaRFdc4me
	4lzzE+Rc9VjoCj26DV00a8TUaGrLWgZBuQxnPjrhJb7Z4AQevw/LCJsZ914ekoKbRf7ClzjGkUP
	UKIErAssVNOKx/sZKTXY3krbRNTIL/Kvazr+wWB44XgFMO1vNVyQS+HcqVET/ZioEcya8thLmMo
	dpZ68VyMFbeSPglqo4ng4VPOCIuelpZm3ENoemCUnxmWmiNpmW1ZA4hRNq2vGoqN6YybVqsbJWK
	c=
X-Google-Smtp-Source: AGHT+IEO1zOxdD8wQil2LI5KwSO8MQLnWTrfWuipBo+pWWrpf29yptHnZPtimYMHyz4mxlU81XpbqA==
X-Received: by 2002:a05:693c:408d:b0:2a4:3593:2c07 with SMTP id 5a478bee46e88-2a6c985b102mr366146eec.0.1763427197571;
        Mon, 17 Nov 2025 16:53:17 -0800 (PST)
Received: from t14.. ([2001:5a8:47ec:d700:ef59:f68f:7ffe:54f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm67568555eec.1.2025.11.17.16.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:53:17 -0800 (PST)
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
Subject: [RFC PATCH bpf-next 5/7] bpf, s390: Make program update work for trampoline ops
Date: Mon, 17 Nov 2025 16:52:57 -0800
Message-ID: <20251118005305.27058-6-jordan@jrife.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118005305.27058-1-jordan@jrife.io>
References: <20251118005305.27058-1-jordan@jrife.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165318_572286_A066485B 
X-CRM114-Status: GOOD (  13.97  )
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
 arch/s390/net/bpf_jit_comp.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/s390/net/bpf_jit_comp.c b/arch/s390/net/bpf_jit_comp.c
index cf461d76e9da..bf70302d1009 100644
--- a/arch/s390/net/bpf_jit_comp.c
+++ b/arch/s390/net/bpf_jit_comp.c
@@ -2508,20 +2508,19 @@ static void load_imm64(struct bpf_jit *jit, int dst_reg, u64 val)
 
 static int invoke_bpf_prog(struct bpf_tramp_jit *tjit,
 			   const struct btf_func_model *m,
-			   struct bpf_tramp_link *tlink, bool save_ret)
+			   struct bpf_prog *p, u64 cookie, bool save_ret)
 {
 	struct bpf_jit *jit = &tjit->common;
 	int cookie_off = tjit->run_ctx_off +
 			 offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
-	struct bpf_prog *p = tlink->link.prog;
 	int patch;
 
 	/*
-	 * run_ctx.cookie = tlink->cookie;
+	 * run_ctx.cookie = cookie;
 	 */
 
-	/* %r0 = tlink->cookie */
-	load_imm64(jit, REG_W0, tlink->cookie);
+	/* %r0 = cookie */
+	load_imm64(jit, REG_W0, cookie);
 	/* stg %r0,cookie_off(%r15) */
 	EMIT6_DISP_LH(0xe3000000, 0x0024, REG_W0, REG_0, REG_15, cookie_off);
 
@@ -2768,7 +2767,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	}
 
 	for (i = 0; i < fentry->nr_links; i++)
-		if (invoke_bpf_prog(tjit, m, fentry->links[i],
+		if (invoke_bpf_prog(tjit, m, bpf_tramp_links_prog(fentry, i),
+				    fentry->links[i]->cookie,
 				    flags & BPF_TRAMP_F_RET_FENTRY_RET))
 			return -EINVAL;
 
@@ -2782,7 +2782,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 		       0xf000 | tjit->retval_off);
 
 		for (i = 0; i < fmod_ret->nr_links; i++) {
-			if (invoke_bpf_prog(tjit, m, fmod_ret->links[i], true))
+			if (invoke_bpf_prog(tjit, m,
+					    bpf_tramp_links_prog(fmod_ret, i),
+					    fmod_ret->links[i]->cookie, true))
 				return -EINVAL;
 
 			/*
@@ -2850,7 +2852,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	/* do_fexit: */
 	tjit->do_fexit = jit->prg;
 	for (i = 0; i < fexit->nr_links; i++)
-		if (invoke_bpf_prog(tjit, m, fexit->links[i], false))
+		if (invoke_bpf_prog(tjit, m, bpf_tramp_links_prog(fexit, i),
+				    fexit->links[i]->cookie, false))
 			return -EINVAL;
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
@@ -2946,6 +2949,11 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image,
 	return ret < 0 ? ret : tjit.common.prg;
 }
 
+bool bpf_trampoline_supports_update_prog(void)
+{
+	return true;
+}
+
 bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return true;
-- 
2.43.0


