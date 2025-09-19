Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85526CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qo/jsgLDkKISW5zIp48cnqAjqbEM5L00IhYTKUc6Zus=; b=hq1ahNtlD8c7hiej/R+bFVeorX
	d0AND3/iYYxzB6g+kNW2yfRrXruj5XqRzM0WTVeye/L0QQeXmWDXyey+M7h8QYirK8yW/toPPzmIU
	4liE6raCL2ieY5Ofxx1l8SKvZ01De/HEAr56v2X53LHB5umFrt1anWrxQl3cf6RChLDBhec82yvTe
	P8VpsLyh7RW9nitJ3X11TPQSL2d6o1UQYLrsIZA2qCl7F25skMBh6Bl0UgmtELoH7PILTx5m1p8+a
	TJf/GGXfrdwoGghUtUX44zLPTSGKeWKGVATHrB2e5QpDuvI5vVJPBR49hE9EQ2m3NeF/GFH3Sb2wM
	QJeUk3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uza9Q-00000002oZh-0tRf;
	Fri, 19 Sep 2025 12:23:44 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uza9F-00000002oV2-3F7W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 12:23:35 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3eff3936180so199874f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 05:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758284612; x=1758889412; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qo/jsgLDkKISW5zIp48cnqAjqbEM5L00IhYTKUc6Zus=;
        b=vjR/iXxq+Ko2JGaXgfhM1s3l1LrY/61DG8LY23qpTBguIezilzIvn7ufuRawirM2MI
         r44+lyPZnDHw2jasE0wSHIHUO0A46L45/4US3+47Vn94fPzfZnI1gmxwYvMHUrcj6Zay
         WURvFaG+e6RNWCkgL1Upe+/P6QsOGsnUWRtXf9nhZDFpNLKG20GfjUojhgjbOijAIdxy
         mHjy8IOMJvOoS+z+TcbZ+SxarU9lXD8mkPGfV5y7lFyMLwp/iKynuGZolgjTuBeCAdQ1
         CKBUPJT0miGT4EGRCwUG8h83fH0hTaarE2Q/KTLXuScQoJ2Q4psQm4pgmub3mH+WQf9M
         H2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758284612; x=1758889412;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qo/jsgLDkKISW5zIp48cnqAjqbEM5L00IhYTKUc6Zus=;
        b=QI+Mapb7sI7zUmzLQSrEJKK6NEzGpc9SGDdYhUxRxbtZAzbiwSWHWYRlCLiD2830k1
         gQlX187BcS+GE6TtqA1s0sTA/4KCkVYdrvAERzu60gsD/Aopw7jSaczRwWVIT495SMPZ
         pj3lVDpOGAZVLeY06B5COaDPWt50e9crqJJbilnQGMg2oLkz6sIZq0RGmQLGlz27OGLX
         QPmTSGvQUzSiDIGXAYTmZm/dISKXJ/ZjBUU+4Vhrz708xu8M5Zy6yTYCIgSIzX6kF3o4
         XboJnSSrAbIcCKUFd3aM04yCfeD1HekjNRbQ0wVhjAMm9lv/zN7GLPq0AGmz6TG9m2/m
         l50g==
X-Gm-Message-State: AOJu0Yz7uj2SOLafaEOO/x7sAxf2Jrh//pSZItUVpd/eLMcQiVsSoitk
	+Fs+KTSz3MQLA8e4QdCL8bTQmSZM3TA/xxEvzREvmo/UAh5Y9DAk1xk1dI2BiOIkk2d6Isj/YA4
	oCiBDPQKrzhirFDso9tm7FwdYrSKTsFIsIk20yQ24LxRYypM6yVjd0rigXixGWQjr3twiOobvQN
	BR3BHAwiGJ9WofMcSGTwSWLILNQvUNfaS6pUCFOdvG6CKlBlfF/ziqxP2sxdiu
X-Google-Smtp-Source: AGHT+IGdt2aMsHWTbWqIY3RHkP6ROCYcuLniubso42syhOjvPfHbKaGtZwHfzgKMLU5xJCioFirjKtfTBlCu
X-Received: from wmbip15.prod.google.com ([2002:a05:600c:a68f:b0:45d:d39b:53ca])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2404:b0:3e7:4697:297a
 with SMTP id ffacd0b85a97d-3ee7e106157mr2318421f8f.24.1758284611916; Fri, 19
 Sep 2025 05:23:31 -0700 (PDT)
Date: Fri, 19 Sep 2025 12:23:21 +0000
In-Reply-To: <20250919122321.946462-1-abarnas@google.com>
Mime-Version: 1.0
References: <20250919122321.946462-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250919122321.946462-3-abarnas@google.com>
Subject: [PATCH 2/2] arch: arm64: Reject modules with internal alternative callbacks
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dylan Hatch <dylanbhatch@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Fanqin Cui <cuifq1@chinatelecom.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_052333_831299_0D8972AE 
X-CRM114-Status: GOOD (  17.09  )
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

During module loading, check if there is a callback function used by the
alternatives specified in the '.altinstruction' ELF section and block
loading the module if such a function is present.

Reported-by: Fanqin Cui <cuifq1@chinatelecom.cn>
Closes: https://lore.kernel.org/all/20250807072700.348514-1-fanqincui@163.c=
om/
Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/arm64/include/asm/alternative.h |  4 ++--
 arch/arm64/kernel/alternative.c      | 15 ++++++++++-----
 arch/arm64/kernel/module.c           |  8 ++++++--
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/alternative.h b/arch/arm64/include/asm/=
alternative.h
index 00d97b8a757f..6eab2517c809 100644
--- a/arch/arm64/include/asm/alternative.h
+++ b/arch/arm64/include/asm/alternative.h
@@ -26,9 +26,9 @@ void __init apply_alternatives_all(void);
 bool alternative_is_applied(u16 cpucap);
=20
 #ifdef CONFIG_MODULES
-void apply_alternatives_module(void *start, size_t length);
+int apply_alternatives_module(void *start, size_t length);
 #else
-static inline void apply_alternatives_module(void *start, size_t length) {=
 }
+static inline int apply_alternatives_module(void *start, size_t length) { =
}
 #endif
=20
 void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternativ=
e.c
index 8ff6610af496..69fae94c843a 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -139,15 +139,18 @@ static noinstr void clean_dcache_range_nopatch(u64 st=
art, u64 end)
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
 	alternative_cb_t alt_cb;
=20
 	for (alt =3D region->begin; alt < region->end; alt++) {
+		if (ALT_HAS_CB(alt) && is_module)
+			return -EPERM;
+
 		int nr_inst;
 		int cap =3D ALT_CAP(alt);
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
index 5d6d228c6156..aeefc50229e3 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -478,8 +478,12 @@ int module_finalize(const Elf_Ehdr *hdr,
 	int ret;
=20
 	s =3D find_section(hdr, sechdrs, ".altinstructions");
-	if (s)
-		apply_alternatives_module((void *)s->sh_addr, s->sh_size);
+	if (s) {
+		ret =3D apply_alternatives_module((void *)s->sh_addr, s->sh_size);
+		if (ret < 0)
+			pr_err("module %s: error occurred when applying alternatives\n", me->na=
me);
+			return ret;
+	}
=20
 	if (scs_is_dynamic()) {
 		s =3D find_section(hdr, sechdrs, ".init.eh_frame");
--=20
2.51.0.534.gc79095c0ca-goog


