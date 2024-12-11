Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF6CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wmIZwPmlDItBIvSBStS3M9me7k3FbH6ZwGmimj0cflw=; b=EDLnNljII+damkgsmpesWmacq9
	4STAMLaskTOJMUwqeHQPJNztnskWebBL0IX/dds/pgA9tvonIzbtWiGZM/YTCqLFecHjdD0ygHosu
	xmvxIUwXf5VmnSTf51TlNJJ4bDs5viFOAgbKsx46BpESuqMlr7TfP2hUJNl3OWjR1DJMa585yXj+z
	10NA8/t86KfbQJ9lNRzKGiRccilaVDyug7P2Hu//iVs+pcT2JvTOezpv5G+KdFjlhkVmP+6n2EVjz
	sSuqzxrNC51xgFXPGRipd+BbCnP+XenGsLqG91rH2ZxG4sPfqIKJpOg1g8D7odfrnLfY9uCEKd9++
	PjTpBQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKjF-0000000EfjN-11rz;
	Wed, 11 Dec 2024 11:18:05 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKiB-0000000EfYk-2n6b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:17:00 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-728e729562fso1262876b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733915818; x=1734520618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wmIZwPmlDItBIvSBStS3M9me7k3FbH6ZwGmimj0cflw=;
        b=KGpYJ5luWhEkjzTpqAWrmUoFkEQqR22QNG1/b39e1QMTRapnz8zKLt7rFs1t3sQnxs
         z75EiiUfR3+6Ue/kWZWTQsV+WnSabqPkrnrG8LcQz29MGLsjlGgaQtWVNYHK/GJHqIoZ
         jf/qtIbSmtJHxBsa9MVs74pCxZgK2oJ7CarbABc6JUVMaiSHjalxy1+0Hf04kQOwd8BZ
         VUYQJVi5KrWPrrdm09XJ08Xo08JUUUEd14Qk3XeT2l01jJ9pPLJxXbuYRemmX4pevBHc
         1lLY6WIJ063c2j6eU6wMoNCyoXRwIRyb+1XTdLF2uxroVOGsE6v/9Kt4bxbeZNKFNw56
         V1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733915818; x=1734520618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmIZwPmlDItBIvSBStS3M9me7k3FbH6ZwGmimj0cflw=;
        b=UdFnNuE9HxqDj4XtaGQ5Ig5tZjyY44Rug6KlHQfNui6h23RhMkzJVadU3nvS5Mwl2Y
         4km8fWMLHRKVKhkbw7MR6B7lsQnfNvay0NqSW0Kc2KB2VVht0dwTV2fN19cxFbKk+c0C
         oikR+oVsmZ+3xPOy8xzPUymCqSVJNdHAd+d/MOH8uEPFBXDuzCp0ZqYmnobhJoUV644M
         wzZKeE4r5ypYwRMy7WWucurRAjeSO1aJWGcPa8qM/JAcg7KpZJXfF5u5idV3oEMoIeCf
         bLpz2epqlMoKKILO8AAZGBHmMaKlbWeuTiv8H/hCeQopgiqt81VGcL+h+FyKCjeoOgN1
         U6dg==
X-Gm-Message-State: AOJu0YyL5P0g5i653ZMwrO0SOWg0FfzPgrq/9KaVRDxtdBcfGaT9Mzvb
	HeOMzbGiVj3d1RkPltiitSrsZyguyjPo52wlRl7E/KiiQr36rz7L
X-Gm-Gg: ASbGncvGrJ6iJuhKZthxlEvkU7rsABdXn8zP05XeGUenLvxEGAJ/999vOKZZIdz4rZB
	PMyHgctfH4ktTGpm2Kl7wwnUDBb8v4Xsza5UBTOoiLoGuVYxVIHwvj3kIlBsPZ2miakSoyTjLMo
	wzUsUd9kAjZjMcELlk5jWasIPgTzLkYgoLA9C0mtCMUetF5TSUiz3b9Rnvuz0wJWzK5h9nq5XvL
	Usb5VbAPbgr6G03H9ySQdAPTyf23NzlffEnULc1H7ueHrwZJx06vte0/35WuQZ317/a
X-Google-Smtp-Source: AGHT+IHSi/8yxD89dgGKzdJcVyw/Qs3K0iIuRyxvcQq/9US7gLCDwtgVLuR8LLk/UjirsvcXRBj2WA==
X-Received: by 2002:a05:6a21:6d95:b0:1e1:ab51:f531 with SMTP id adf61e73a8af0-1e1c12df4f3mr5561010637.22.1733915817578;
        Wed, 11 Dec 2024 03:16:57 -0800 (PST)
Received: from ownia.localdomain ([2400:e3e0:f5a9:dd52:f8f3:1167:a723:6521])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725ce38be98sm7606482b3a.52.2024.12.11.03.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:16:57 -0800 (PST)
From: Weizhao Ouyang <o451686892@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Weizhao Ouyang <o451686892@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kselftest/arm64: abi: fix SVCR detection
Date: Wed, 11 Dec 2024 19:16:39 +0800
Message-ID: <20241211111639.12344-1-o451686892@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_031659_703258_2781713C 
X-CRM114-Status: GOOD (  10.02  )
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

When using svcr_in to check ZA and Streaming Mode, we should make sure
that the value in x2 is correct, otherwise it may trigger an Illegal
instruction if FEAT_SVE and !FEAT_SME.

Fixes: 43e3f85523e4 ("kselftest/arm64: Add SME support to syscall ABI test")
Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
---
 .../selftests/arm64/abi/syscall-abi-asm.S     | 32 +++++++++----------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/syscall-abi-asm.S b/tools/testing/selftests/arm64/abi/syscall-abi-asm.S
index df3230fdac39..66ab2e0bae5f 100644
--- a/tools/testing/selftests/arm64/abi/syscall-abi-asm.S
+++ b/tools/testing/selftests/arm64/abi/syscall-abi-asm.S
@@ -81,32 +81,31 @@ do_syscall:
 	stp	x27, x28, [sp, #96]
 
 	// Set SVCR if we're doing SME
-	cbz	x1, 1f
+	cbz	x1, load_gpr
 	adrp	x2, svcr_in
 	ldr	x2, [x2, :lo12:svcr_in]
 	msr	S3_3_C4_C2_2, x2
-1:
 
 	// Load ZA and ZT0 if enabled - uses x12 as scratch due to SME LDR
-	tbz	x2, #SVCR_ZA_SHIFT, 1f
+	tbz	x2, #SVCR_ZA_SHIFT, load_gpr
 	mov	w12, #0
 	ldr	x2, =za_in
-2:	_ldr_za 12, 2
+1:	_ldr_za 12, 2
 	add	x2, x2, x1
 	add	x12, x12, #1
 	cmp	x1, x12
-	bne	2b
+	bne	1b
 
 	// ZT0
 	mrs	x2, S3_0_C0_C4_5	// ID_AA64SMFR0_EL1
 	ubfx	x2, x2, #ID_AA64SMFR0_EL1_SMEver_SHIFT, \
 			 #ID_AA64SMFR0_EL1_SMEver_WIDTH
-	cbz	x2, 1f
+	cbz	x2, load_gpr
 	adrp	x2, zt_in
 	add	x2, x2, :lo12:zt_in
 	_ldr_zt 2
-1:
 
+load_gpr:
 	// Load GPRs x8-x28, and save our SP/FP for later comparison
 	ldr	x2, =gpr_in
 	add	x2, x2, #64
@@ -125,9 +124,9 @@ do_syscall:
 	str	x30, [x2], #8		// LR
 
 	// Load FPRs if we're not doing neither SVE nor streaming SVE
-	cbnz	x0, 1f
+	cbnz	x0, check_sve_in
 	ldr	x2, =svcr_in
-	tbnz	x2, #SVCR_SM_SHIFT, 1f
+	tbnz	x2, #SVCR_SM_SHIFT, check_sve_in
 
 	ldr	x2, =fpr_in
 	ldp	q0, q1, [x2]
@@ -148,8 +147,8 @@ do_syscall:
 	ldp	q30, q31, [x2, #16 * 30]
 
 	b	2f
-1:
 
+check_sve_in:
 	// Load the SVE registers if we're doing SVE/SME
 
 	ldr	x2, =z_in
@@ -256,32 +255,31 @@ do_syscall:
 	stp	q30, q31, [x2, #16 * 30]
 
 	// Save SVCR if we're doing SME
-	cbz	x1, 1f
+	cbz	x1, check_sve_out
 	mrs	x2, S3_3_C4_C2_2
 	adrp	x3, svcr_out
 	str	x2, [x3, :lo12:svcr_out]
-1:
 
 	// Save ZA if it's enabled - uses x12 as scratch due to SME STR
-	tbz	x2, #SVCR_ZA_SHIFT, 1f
+	tbz	x2, #SVCR_ZA_SHIFT, check_sve_out
 	mov	w12, #0
 	ldr	x2, =za_out
-2:	_str_za 12, 2
+1:	_str_za 12, 2
 	add	x2, x2, x1
 	add	x12, x12, #1
 	cmp	x1, x12
-	bne	2b
+	bne	1b
 
 	// ZT0
 	mrs	x2, S3_0_C0_C4_5	// ID_AA64SMFR0_EL1
 	ubfx	x2, x2, #ID_AA64SMFR0_EL1_SMEver_SHIFT, \
 			#ID_AA64SMFR0_EL1_SMEver_WIDTH
-	cbz	x2, 1f
+	cbz	x2, check_sve_out
 	adrp	x2, zt_out
 	add	x2, x2, :lo12:zt_out
 	_str_zt 2
-1:
 
+check_sve_out:
 	// Save the SVE state if we have some
 	cbz	x0, 1f
 
-- 
2.45.2


