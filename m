Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A14CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwElNbtoU6ryjkvg9ptzkO1BXP1SQnPo2fMtx+HCV1o=; b=ytZ6hvZBCKEdzYTn327uh/AmTl
	mxmTFYY7RKdvMy6/TjD5hZofnK1kLRzCFLxq5tcb7O/CgrHHGfbILL8zB+dIxM0AWPyeqSTRbwFLF
	305ztgekU7mzOYxBaMcIOxed84g/gsCNtII4FR6P3krVWCu/+ddMdXr/fosEXldHLRXaqD03I20Ol
	WWOfwCOd75G0BFik7KdfAUIWDYo5HftLaueuQqZua+PC4R9bKZhmOCVfwvyN+8+BrD/RqSgtInnF9
	2Y6Euthj/eN/yCzpkbniVtTyF+idS0FYLKRkJtqRLFVNGojzSI7pi3ar0nz82HTeuZ/EifwSueq92
	qrUF1jIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gDp-0000000APYN-271o;
	Mon, 22 Sep 2025 13:04:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gDk-0000000APWE-3gNV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Sep 2025 13:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JwElNbtoU6ryjkvg9ptzkO1BXP1SQnPo2fMtx+HCV1o=; b=PnV2Rt/fYBDahBwKN9OGWEU4vb
	W8V4LanJBQQ6kmR3rGQzw5RpnCpBvrpiPQvqkQ9r7fXUqinu/mBvrhKdPSyzMOscKrnwvTp6UmjWA
	EYMsjmFwOa2YsBQnz2IAMQlvb83aZsm0aS1vU8bGOxrX6ejUgKbc/11r43acAD6YXXJUkpRECL9iX
	3YvKoqpHxhoDMUEUm7+Xr9u1fbXd5ZQN9KZa8JWFvI80MNgreQSys7562N9OVAGiTCZ2NbvmaPeFv
	qzPxTEo+DequgZAyV2zNRxBYwm+IwX+u9tMF8SUNsm2LtitrG5vRkbmgAqCDBHBKP/thi2PVb3F2b
	HYON1qvg==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gDh-00000008Hom-2d5l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:04:43 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e1ac7110eso2214925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758546280; x=1759151080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwElNbtoU6ryjkvg9ptzkO1BXP1SQnPo2fMtx+HCV1o=;
        b=kuH/0BwdCmYZ/wOmLVD0TmjhFN6TI3Ce8KRJTQ/9quyM6teGtmi5FX1xQe80TeqAQD
         TkxEj9BugwsDSIsSZqKFiRZe5vAgKRpjeeRAMc5qOfeIAYca1lZsKJPFFGInAJL1MAIo
         JTRy4SIB10ZhPSqHnC+FyzegJItK8tKDkVEbSKUCZszPtBKUdh5pqooll5zHclnkDT9z
         RzK1rhhJNJGB/TN2s4ntXW9ZYII6pvSdW7lwrXRSBI/Ca/yVFFCkQBQF4BykCNxkeQqA
         F7UZzGK+dSwNCuUxbbQWAbcoPwnRBBf9PXaMVvJU943msiXxhYUo3DSjhwf1/lnU8KjT
         RdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758546280; x=1759151080;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JwElNbtoU6ryjkvg9ptzkO1BXP1SQnPo2fMtx+HCV1o=;
        b=wy+PJU+vBF5+/4AdMLfKJPumOADWapZNPlAi8j1rID5VQBCswerboBh7fe0FiLFni5
         2iUnBmYGzMP4c0pziB3ipG8QGnef75CT1a1p1N83zZLvsVBzUIsQh6hsb/fZ9rdGyVsS
         Snp4YAl3H/vW8bVs+MyzLNocz4mK02vr/75bXdbEcp8d3+eUpzNyVQymIhtstrQqst+A
         hUsN1Pz0KY14NvUboJNsKdyQa/p/gu4iTIxJmET4tqYW/dKsjxR3jslg6jtebI5Vco0x
         GCuBGcEGzuhlqkGQgnOH9MdcMkIEfPLJmuUD8tMSRVXDKYV9ClRpn2a7Y+4CDfY2E4Bh
         yeJg==
X-Gm-Message-State: AOJu0YyCbBx5HvguNomU24Xla9mtomnXVLFRNFLAx5ussjG+ViN8rTAX
	+XApcMnKdjVoPGowHztnhLgjqN9mkAJgDQzFTpvLvvUKciglDwjqkXFOxf9klcctqdTYp/xZ5qz
	4nRyVzd9lHgdhVDQ9T6yWN7j8CQ4rgbgA7iYBhHeKP+r4bH4DOHln4tGk3+rDkPCirh69rAvSED
	ZO7yQAoYqYIRVW+pPAooKdIVSTypEtErfJFb0SZhyt2ctDRtPN2Hszz7pc2Ifu
X-Google-Smtp-Source: AGHT+IEDFD3rxKYHYkV6r/KD3nctDYqhuTTynS2EvYjFqxAQWJnCTSezVvcxkZmuveyS5xGnrwZ/qy15N5O/
X-Received: from wmbez5.prod.google.com ([2002:a05:600c:83c5:b0:45f:2d07:91f9])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:630e:b0:46c:9e81:ad0
 with SMTP id 5b1f17b1804b1-46c9e904ffamr39494195e9.0.1758546279719; Mon, 22
 Sep 2025 06:04:39 -0700 (PDT)
Date: Mon, 22 Sep 2025 13:04:27 +0000
In-Reply-To: <20250922130427.2904977-1-abarnas@google.com>
Mime-Version: 1.0
References: <20250922130427.2904977-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250922130427.2904977-3-abarnas@google.com>
Subject: [PATCH v2 2/2] arch: arm64: Reject modules with internal alternative callbacks
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dylan Hatch <dylanbhatch@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Fanqin Cui <cuifq1@chinatelecom.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_140441_799644_1AD2E5E8 
X-CRM114-Status: GOOD (  17.60  )
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

During module loading, check if a callback function used by the
alternatives specified in the '.altinstruction' ELF section (if present)
is located in core kernel .text. If not fail module loading before
callback is called.

Reported-by: Fanqin Cui <cuifq1@chinatelecom.cn>
Closes: https://lore.kernel.org/all/20250807072700.348514-1-fanqincui@163.c=
om/
Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/arm64/include/asm/alternative.h |  7 +++++--
 arch/arm64/kernel/alternative.c      | 19 ++++++++++++-------
 arch/arm64/kernel/module.c           |  9 +++++++--
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/alternative.h b/arch/arm64/include/asm/=
alternative.h
index 00d97b8a757f..51746005239b 100644
--- a/arch/arm64/include/asm/alternative.h
+++ b/arch/arm64/include/asm/alternative.h
@@ -26,9 +26,12 @@ void __init apply_alternatives_all(void);
 bool alternative_is_applied(u16 cpucap);
=20
 #ifdef CONFIG_MODULES
-void apply_alternatives_module(void *start, size_t length);
+int apply_alternatives_module(void *start, size_t length);
 #else
-static inline void apply_alternatives_module(void *start, size_t length) {=
 }
+static inline int apply_alternatives_module(void *start, size_t length)
+{
+	return 0;
+}
 #endif
=20
 void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternativ=
e.c
index 8ff6610af496..11893a0360ad 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -139,9 +139,9 @@ static noinstr void clean_dcache_range_nopatch(u64 star=
t, u64 end)
 	} while (cur +=3D d_size, cur < end);
 }
=20
-static void __apply_alternatives(const struct alt_region *region,
-				 bool is_module,
-				 unsigned long *cpucap_mask)
+static int __apply_alternatives(const struct alt_region *region,
+				bool is_module,
+				unsigned long *cpucap_mask)
 {
 	struct alt_instr *alt;
 	__le32 *origptr, *updptr;
@@ -166,10 +166,13 @@ static void __apply_alternatives(const struct alt_reg=
ion *region,
 		updptr =3D is_module ? origptr : lm_alias(origptr);
 		nr_inst =3D alt->orig_len / AARCH64_INSN_SIZE;
=20
-		if (ALT_HAS_CB(alt))
+		if (ALT_HAS_CB(alt)) {
 			alt_cb  =3D ALT_REPL_PTR(alt);
-		else
+			if (!core_kernel_text((unsigned long)alt_cb))
+				return -ENOEXEC;
+		} else {
 			alt_cb =3D patch_alternative;
+		}
=20
 		alt_cb(alt, origptr, updptr, nr_inst);
=20
@@ -193,6 +196,8 @@ static void __apply_alternatives(const struct alt_regio=
n *region,
 		bitmap_and(applied_alternatives, applied_alternatives,
 			   system_cpucaps, ARM64_NCAPS);
 	}
+
+	return 0;
 }
=20
 static void __init apply_alternatives_vdso(void)
@@ -277,7 +282,7 @@ void __init apply_boot_alternatives(void)
 }
=20
 #ifdef CONFIG_MODULES
-void apply_alternatives_module(void *start, size_t length)
+int apply_alternatives_module(void *start, size_t length)
 {
 	struct alt_region region =3D {
 		.begin	=3D start,
@@ -287,7 +292,7 @@ void apply_alternatives_module(void *start, size_t leng=
th)
=20
 	bitmap_fill(all_capabilities, ARM64_NCAPS);
=20
-	__apply_alternatives(&region, true, &all_capabilities[0]);
+	return __apply_alternatives(&region, true, &all_capabilities[0]);
 }
 #endif
=20
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index d32ab7dd86a8..6e5b488a219e 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -478,8 +478,13 @@ int module_finalize(const Elf_Ehdr *hdr,
 	int ret;
=20
 	s =3D find_section(hdr, sechdrs, ".altinstructions");
-	if (s)
-		apply_alternatives_module((void *)s->sh_addr, s->sh_size);
+	if (s) {
+		ret =3D apply_alternatives_module((void *)s->sh_addr, s->sh_size);
+		if (ret < 0) {
+			pr_err("module %s: error occurred when applying alternatives\n", me->na=
me);
+			return ret;
+		}
+	}
=20
 	if (scs_is_dynamic()) {
 		s =3D find_section(hdr, sechdrs, ".init.eh_frame");
--=20
2.51.0.534.gc79095c0ca-goog


