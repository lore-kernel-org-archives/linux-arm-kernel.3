Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52199D5CC8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lkeE3D8+J4OcDtDEGiGIXOA7IIy99qfhKrBIJpYyvY=; b=EWtvfPGSxlZZnkM4qx9Wuj/a3D
	o5Ml7HYaQ5lqVuRA9dIpv0XJLQ8ol5KiuBgLJLWOJDlv/kZqwfMnqEr3APJAGFgE6CiM9nYRV+2Lb
	tHtORKxLMa0PNKWqMheciEzcSd5d2JeiY+1f6aE6zr+vpPjp8RrrZSvt1BS/PMLgH0XqEqigXkOhT
	KsCBrdXN3RUCQtfkCPNxJq4ViK2EzVbhmspeCiWqBzpMkJikvPMn2KJzgsxhI7efRX6fS32v3xSz3
	5w1X/rj2Lk8ddycL6DWOu5KFyLvFvU81txLLoh5WCuOuFlE+XsrAjaURqTjITl1yt+hda64VTAmqk
	dl42qXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65wD-0000000HYH4-3t2P;
	Wed, 30 Oct 2024 10:28:29 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65mi-0000000HWYN-1Pl4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:18:41 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e370139342so120135207b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730283519; x=1730888319; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0lkeE3D8+J4OcDtDEGiGIXOA7IIy99qfhKrBIJpYyvY=;
        b=Ri0BmhcNlWN536E2ejooFd7V+uo5xtqs0TZuxHGJwg72oDbIg/IpSmjyFZSJvmghnr
         mw0JScF0clHvRT7m5UXZ9go/hbGk/IBUo8tneIKAjczcoOvI33aAPtnE1YAW5teWupsC
         kvcSRG1CDk0E7VaeWTbO/DPHHMOy+NP1QBC/RVaPJfN7TLdPwolD7Cf5sANuGMVi7lQk
         x8QXW3nQVSHT4LjO3XXAkc4DNOS6Gn8cpY3GWVmSq/aQzt3gen8uce4Dwg0LSbxZcNzQ
         MtkBLxAx/pi7c7+KUK4Caid5XfvbvWcoNP1h5+xROLVfVxbEf+6t0Pe52dlxezf64G2L
         9QMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283519; x=1730888319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0lkeE3D8+J4OcDtDEGiGIXOA7IIy99qfhKrBIJpYyvY=;
        b=nAkoz+QJ+ReDcuGiliitRQvimd2vG6JNheMWH9FDkzLxscXDyvvepbeIWvn3MkC6dx
         YJofTV769XgLrN3Eyj2Z3+gGCRzCIb4RyxR9zsVZMS2QgnOakCSOMQVqnZBYKhK8rGMa
         fUi0cKo5QvhTcy9FqVHmrGorXn9MBKBd4rJRAtC+xXjnzjREXZP4DPDiOlSA/WLHdCV7
         2vo5w72HU5T4uxkaxoMOrxL6E6MmDcOnzCoW6ORnqu53u24KSbzOflha63kLv3wUDhq8
         GxEAkQxBHc1CDVz/aunTKBPIQUIdtOotXgW/bCa5H33STh3r9PGMrfUrlbXTL4C0Csv6
         yxgg==
X-Gm-Message-State: AOJu0YwZ6jzIQlQ5KHfef8h+zLvtx+T1eMgA+JuQ0X+No+7XdK4TYW9N
	rKTlg3NdRxvKAUaU/aQXJ0HE69CytLwYVm3rYkeOSsJl2+Drpt5+4itkvma/kJzN8dBybjIIBnT
	bNZXRDPgu9RSvk4If9ynVb5bmCK8aod9DUVg8y5ATAqwn1XBf21qOoZSVPXWMvzmeGiOpbkouK2
	7yFOqd//O8yNJere6fqmke916J2cAZbhIpd00ozWLR
X-Google-Smtp-Source: AGHT+IGYWIKtsISSLmZozooMwTQpsr6uP8eXuzu1h8K7n8sXmZ2Z4/5RcAprTfRvs8MnaiExmLO2GGiB
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:6383:b0:6e2:ad08:4924 with SMTP id
 00721157ae682-6e9d8aacb2dmr10859077b3.4.1730283518114; Wed, 30 Oct 2024
 03:18:38 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:18:09 +0100
In-Reply-To: <20241030101803.2037606-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20241030101803.2037606-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2720; i=ardb@kernel.org;
 h=from:subject; bh=KrPhtIjOJOdsjzLuM0pYgTBMlukJZDWck1DRFJ4KhOY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV2J/fEK9kaevBx3Dv2e4nzmCa9FlknPUUlkW5NUe/yEu
 OU974iOUhYGMQ4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMBGlXwz/PU99XLJ41767Ozwz
 bmYfFnoUeIDj3XOLCeJnjs6eP+302ccM/xTyTxXuvDnz4OW0kshvCzneJLwXODqh6kHH7x95bku TGpkB
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030101803.2037606-15-ardb+git@google.com>
Subject: [RFC PATCH 5/8] arm64/Kconfig: Drop support for 47-bit virtual addressing
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_031840_408648_335CB98C 
X-CRM114-Status: GOOD (  12.88  )
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

Drop the separate 47-bit virtual address space configuration, which is
identical in practice to 52-bit VA configuration on all 16k pages
capable hardware currently in the field. For future hardware that does
implement support for 52-bit virtual addressing, this mode can be chosen
at boot by passing 'arm64.nolva' on the kernel command line.

This reduces the number of configurations that need to be supported and
validated.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 099b1a825b9f..7df7d24c767d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -380,7 +380,6 @@ config PGTABLE_LEVELS
 	default 2 if ARM64_16K_PAGES && ARM64_VA_BITS_36
 	default 2 if ARM64_64K_PAGES && ARM64_VA_BITS_42
 	default 3 if ARM64_4K_PAGES && ARM64_VA_BITS_39
-	default 3 if ARM64_16K_PAGES && ARM64_VA_BITS_47
 	default 3 if ARM64_64K_PAGES
 	default 4 if ARM64_16K_PAGES
 	default 5 if ARM64_4K_PAGES
@@ -412,12 +411,12 @@ config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
 	default 0xdfff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 && !ARM64_16K_PAGES)) && !KASAN_SW_TAGS
-	default 0xdfffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) && ARM64_16K_PAGES && !KASAN_SW_TAGS
+	default 0xdfffc00000000000 if ARM64_VA_BITS_52 && ARM64_16K_PAGES && !KASAN_SW_TAGS
 	default 0xdffffe0000000000 if ARM64_VA_BITS_42 && !KASAN_SW_TAGS
 	default 0xdfffffc000000000 if ARM64_VA_BITS_39 && !KASAN_SW_TAGS
 	default 0xdffffff800000000 if ARM64_VA_BITS_36 && !KASAN_SW_TAGS
 	default 0xefff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 && !ARM64_16K_PAGES)) && KASAN_SW_TAGS
-	default 0xefffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) && ARM64_16K_PAGES && KASAN_SW_TAGS
+	default 0xefffc00000000000 if ARM64_VA_BITS_52 && ARM64_16K_PAGES && KASAN_SW_TAGS
 	default 0xeffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
 	default 0xefffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
 	default 0xeffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
@@ -1354,10 +1353,6 @@ config ARM64_VA_BITS_42
 	bool "42-bit"
 	depends on PAGE_SIZE_64KB
 
-config ARM64_VA_BITS_47
-	bool "47-bit"
-	depends on PAGE_SIZE_16KB
-
 config ARM64_VA_BITS_48
 	bool "48-bit"
 	depends on PAGE_SIZE_16KB
@@ -1397,7 +1392,6 @@ config ARM64_VA_BITS
 	default 36 if ARM64_VA_BITS_36
 	default 39 if ARM64_VA_BITS_39
 	default 42 if ARM64_VA_BITS_42
-	default 47 if ARM64_VA_BITS_47
 	default 48 if ARM64_VA_BITS_48
 	default 52 if ARM64_VA_BITS_52
 
-- 
2.47.0.163.g1226f6d8fa-goog


