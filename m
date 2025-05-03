Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2894CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 11:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SSo2V5DW0c+y3j+ua7cR3q/eHybtkZ4S8xKtKJs3yI=; b=QdVRFp4TM0eTHdqTKaN+0cUfJZ
	tXD4vJvwi8lxR/1WclXRGFhcRYGlq+yWZfPkjs+bh3jjkt863p0mNrS/Xpg0w5XQ/UZn1Qe0iypJn
	+k9u4ED+aMEHQ/qU5kscC8AvFugpHfLd+mT2QOvasfoeXyinh2WAE+nsPk20+kPzMq3yHJV22i0kG
	rp/HS3b8AKo2gkuyyMaVzttN3dyTJ/S641Ks1YZONFZr7MVec0Z+X/E5iNWIG/giGERpcNQpsCBgU
	AumpziSxPtlYQTb5fOm4dkji/KfsRqwhNbv/ynBoLmnpPL2IwoexkpCoSnLwr3E4f21CRe8MZTrEX
	y96u5SLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBB6n-00000003ohK-0Zsh;
	Sat, 03 May 2025 11:32:41 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBAxL-00000003o0R-3W6g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:22:56 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so20798735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746271374; x=1746876174; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3SSo2V5DW0c+y3j+ua7cR3q/eHybtkZ4S8xKtKJs3yI=;
        b=uj5+6yrvQ1BUpzoE0cuaV/6rW41tYd2GvZC+W2CuuBBwJwBgcYvUmcBK/OPXtplbB0
         MMZ1rTxn0NbXuwtwl4bf4z8ivZMNGQCLr6oN3BwkHYQJQiF9gq+SpbnzuPOO/+T7IPba
         AXp9fUcQoOM1ejuZV0mRFKO/QSJVsHdkjgCO17kRR3apbTkLdCjLn9wGSWSCUjTlfgQQ
         X6JOI+S8QBMM8ynNItwUm4i01JvTj6uLo7jPWHP/OZeCj2d2+zJ8UOFWCzGLGoaP+1TH
         Vyzj4C7akL7TdslzxqVYiNLVwEEO/umD/HiGRpHCB6tdJbKxq+2rJpPKo7YXIPIVA+5/
         hFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271374; x=1746876174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3SSo2V5DW0c+y3j+ua7cR3q/eHybtkZ4S8xKtKJs3yI=;
        b=fcw48S3YdtekJVJ1oeXVk8TY2xvwdWeqlb0ocVmANo4Gx29xWnWn5ZWEpcaeVIFBrs
         slilJP6kEtcnYXSqndm54LKzdYlkwYKH6TNYdofF0AJMWQLkUTSbEG5lvmNybEEs4rtb
         62roPMhn5N5zCp+DfDO8g9CG7LFNW2FrdkUgbllfsFkIbouWGKtnchK7V6Ebvukz0IEg
         gVHNolnYcdBBySUId9HC+HgOIFqwOS02ImkuswFot8q2C3TX6H6p7/2CuoH4VzMONyld
         ByLB6Iz3uAm/DkT2W8z3Ny31Q+sp0EkOI3HS3ZljhnFzWr8+6krS++fsPEqtU8bm7MG4
         Mu2A==
X-Gm-Message-State: AOJu0YwvE++7CvoGGxPZhMt6pTtbkJ4C9TI9ta1gWp0ffGp3AzFkQC07
	Tv51i9qVbLKhipT5+CGOnhiDIsYJ+RrvxFfxKD7cM3Qtyt/4PnOyqg+SxFqap4Y5cjcS5EaR2AP
	IsA6hh5vJVLlsBI3XCGcqDoOTOSIpHzvjBK3SApdI2Wnb6UO9x6m1zBQ/y583cQNh0RAhIXruH/
	Yd2cnpAFK0Uj0oc/yD2/ST05fzYIR6J2zt6cwoCxRW
X-Google-Smtp-Source: AGHT+IF6yejisH/hDvE4jSPffTRfG+SXhs5IVajQ7lr9xpPhKHKJMphHm5b0g1Gou8Ej+L5xPw4dcEH3
X-Received: from wmbfo18.prod.google.com ([2002:a05:600c:6912:b0:43d:847a:8ccc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3554:b0:43d:aed:f7de
 with SMTP id 5b1f17b1804b1-441c492371cmr5292875e9.21.1746271374100; Sat, 03
 May 2025 04:22:54 -0700 (PDT)
Date: Sat,  3 May 2025 13:21:41 +0200
In-Reply-To: <20250503112137.1962910-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250503112137.1962910-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200; i=ardb@kernel.org;
 h=from:subject; bh=z7mNfjQpBpv68AAd9mLqKIgg7+5n4LTGUtL+5ULXTPo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUP0jxvfFp07//euOxcgzJRTJtTTV6q79khId+maBWuLb
 R+FtTR3lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIkIrmRkaFycySHGGGp27+gj
 TW+tyNUn+/bn78zdVl2q9itT9IF+AsM/CxEdfuuHR0Olm06Z694+tckiatbUB6zLv70O2DXx8d5 sHgA=
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250503112137.1962910-8-ardb+git@google.com>
Subject: [PATCH 2/3] arm64/boot: Move global CPU override variables out of BSS
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_042255_875167_E185DC0F 
X-CRM114-Status: GOOD (  12.13  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Accessing BSS will no longer be permitted form the startup code in
arch/arm64/kernel/pi, as some of it executes before BSS is cleared.
Clearing BSS earlier would involve managing cache coherency explicitly
in software, which is a hassle we prefer to avoid.

So move some variables that are assigned by the startup code out of BSS
and into .data.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 22 ++++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9c4d6d552b25..4f7a8050ab85 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -758,17 +758,17 @@ static const struct arm64_ftr_bits ftr_raz[] = {
 #define ARM64_FTR_REG(id, table)		\
 	__ARM64_FTR_REG_OVERRIDE(#id, id, table, &no_override)
 
-struct arm64_ftr_override id_aa64mmfr0_override;
-struct arm64_ftr_override id_aa64mmfr1_override;
-struct arm64_ftr_override id_aa64mmfr2_override;
-struct arm64_ftr_override id_aa64pfr0_override;
-struct arm64_ftr_override id_aa64pfr1_override;
-struct arm64_ftr_override id_aa64zfr0_override;
-struct arm64_ftr_override id_aa64smfr0_override;
-struct arm64_ftr_override id_aa64isar1_override;
-struct arm64_ftr_override id_aa64isar2_override;
-
-struct arm64_ftr_override arm64_sw_feature_override;
+struct arm64_ftr_override __section(".data") id_aa64mmfr0_override;
+struct arm64_ftr_override __section(".data") id_aa64mmfr1_override;
+struct arm64_ftr_override __section(".data") id_aa64mmfr2_override;
+struct arm64_ftr_override __section(".data") id_aa64pfr0_override;
+struct arm64_ftr_override __section(".data") id_aa64pfr1_override;
+struct arm64_ftr_override __section(".data") id_aa64zfr0_override;
+struct arm64_ftr_override __section(".data") id_aa64smfr0_override;
+struct arm64_ftr_override __section(".data") id_aa64isar1_override;
+struct arm64_ftr_override __section(".data") id_aa64isar2_override;
+
+struct arm64_ftr_override __section(".data") arm64_sw_feature_override;
 
 static const struct __ftr_reg_entry {
 	u32			sys_id;
-- 
2.49.0.906.g1f30a19c02-goog


