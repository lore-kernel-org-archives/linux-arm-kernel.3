Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA94C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 11:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7pRJ8N5ohYmMmQpK3FOw1IcRE7JKZ5K0Zu4pd8yknU=; b=HYpAZTMNBmbRruehwM1+bjG9t+
	PqI+D0VK6jKNs0AI6/fTM5azKz7UJVPytZ8Z0se7Uwgb8+lmU7w+9JNDVxiIgV1sKzmTvTMwV5R7O
	ph5llP0lzqWHZl6DoSdhZwv1bRRdaBZApYusmqG2ZGTS/PZliuuF1cT62+dZmHh6nRwYybb/2cMtJ
	Sn4IgfP6u+/Iua4juL7sZVqpIFKZ5wWwQRKLgnkJ8JwvIrD2Nnt1t2j+bJ9ZiCeOeuEDix0I0dk/y
	NI7J0peU/Cuki+FAMtFneNuTuDoPed3PcEaT+vQe0VAPHs4/lq+BX42kdhq75jTCmhAjHDvNTFLyl
	2O2+Cb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBB4t-00000003oaI-1zDE;
	Sat, 03 May 2025 11:30:43 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBAxK-00000003o04-0FP1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:22:55 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so13331055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746271372; x=1746876172; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7pRJ8N5ohYmMmQpK3FOw1IcRE7JKZ5K0Zu4pd8yknU=;
        b=jyGHxY1xVP4l6OmEmoA6plNHyZdsHxM2px2YhZZlPPCqszU1jmICHL4HYU8jEvs94K
         Q46bTJbWMGR27uBhSQ460XiMNSaDbniYVKiTv/zZBrWRMNGUiKIiq+l/RwPKy7mEQV4E
         9JlicbFf42CLoh7tpEag7CqT/xyKF254uCe1kjgGkJxg4BZ9hf126fU//eLly/5PIIoM
         HgDilBkr2Y693mNjSvVw8mu4n3bYznArHndzOYPEfmDjEAwFqaJPa9mCtGwyiCkVIFPu
         niKazmILilT2ZjsEKgQi0NUpGnVEsY3gRiQhG0Wx9CQSTl0R9KUceiUy6fwYSd5Ld/Mm
         IOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271372; x=1746876172;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7pRJ8N5ohYmMmQpK3FOw1IcRE7JKZ5K0Zu4pd8yknU=;
        b=R4l+8eyQZ3WI8psTbzQrB/ZsirdIDq6pvtK2G7GX1+d6FAuf2wXxfdnMDqz3lWMP+v
         qU1hXFByF/ITRrPVlrPnEIkE16ImCnSfyN4tSWrCWj1wiv2ovBEdN5HEN6bg4oO/9YJe
         4aVKudCA0UdQG7xwLmaO4u94Eq7hQHsHI4yq7UC73qLuToiQzP1hP3JtAL3TiLRauxV2
         OvpNHYYm/GTBvxe98+aCxEPHtyrXkxopMkFZfU+XXZt1mSENo+UrBm7zT8JXbQFR5UJ+
         7vo4KCIsbjxCDU+oV6zShrKPDjztne8svGVWI1U68xrfkMCHNlfVCLBU4fR27xQ0fVzi
         Omhw==
X-Gm-Message-State: AOJu0Yyk+fAd1RRq0TUTyS+4luyjceIGOw+Lo6u/fEYx9MrpGGuVqSIo
	PY9Zboh1oJiLbVfZe7oHYobmT2+WHt+LSw6d+kpKagwTT2K6Lu6mvbmermCNXKWlcHNx461fjt+
	cpkUfPxLBSFTIgKA+FvxoOErl05PJKqpGFCyn//Vf7OsOHRMX7RM5emZHR0E85SRaQz21Ivnbb9
	+Qt/K5oMUhxagEWY73xA0hd7m+N+giQvBr/H8OtXNq
X-Google-Smtp-Source: AGHT+IGboVfEOD8882gZCl/QlgqflxehOhB9nxaCA5MID+YskJ5d9TwwGKK3gZH+A3IjbiJJ2z9JfmFe
X-Received: from wmbhh15.prod.google.com ([2002:a05:600c:530f:b0:43b:c336:7b29])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19c6:b0:43c:e9f7:d6a3
 with SMTP id 5b1f17b1804b1-441bbec2a80mr53186055e9.13.1746271372192; Sat, 03
 May 2025 04:22:52 -0700 (PDT)
Date: Sat,  3 May 2025 13:21:40 +0200
In-Reply-To: <20250503112137.1962910-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250503112137.1962910-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4347; i=ardb@kernel.org;
 h=from:subject; bh=FO55xdVOEfcY87NzOXPLkNoCVvwAS3bVLAgszquzX5g=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUP0j0v0th2fdRYv7OQpeHRav4OzfLFqgYBZ2bwDyi7H3
 QVsK0w6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwES2azEyHNzXzGsqayex1MKt
 RGqis3SjaVvopJir969OPyoirNAYxfCb7U6F0Q9J45j4Oj/GK+8EGE+vXP9gea6jR967Oj6h2hm 8AA==
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250503112137.1962910-7-ardb+git@google.com>
Subject: [PATCH 3/3] arm64/boot: Disallow BSS exports to startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_042254_102114_DFBA000C 
X-CRM114-Status: GOOD (  10.92  )
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

BSS might be uninitialized when entering the startup code, so forbid the
use of any variables that live after __bss_start in the linker map.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h  | 66 +++++++++++---------
 arch/arm64/kernel/vmlinux.lds.S |  2 +
 2 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index a0977f7cd3ec..a70244d1aa2a 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -10,6 +10,12 @@
 #error This file should only be included in vmlinux.lds.S
 #endif
 
+#define PI_EXPORT_SYM(sym)		\
+	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
+#define __PI_EXPORT_SYM(sym, pisym, msg)\
+	PROVIDE(pisym = sym);		\
+	ASSERT(sym < __bss_start, #msg)
+
 PROVIDE(__efistub_primary_entry		= primary_entry);
 
 /*
@@ -36,39 +42,37 @@ PROVIDE(__pi___memcpy			= __pi_memcpy);
 PROVIDE(__pi___memmove			= __pi_memmove);
 PROVIDE(__pi___memset			= __pi_memset);
 
-PROVIDE(__pi_id_aa64isar1_override	= id_aa64isar1_override);
-PROVIDE(__pi_id_aa64isar2_override	= id_aa64isar2_override);
-PROVIDE(__pi_id_aa64mmfr0_override	= id_aa64mmfr0_override);
-PROVIDE(__pi_id_aa64mmfr1_override	= id_aa64mmfr1_override);
-PROVIDE(__pi_id_aa64mmfr2_override	= id_aa64mmfr2_override);
-PROVIDE(__pi_id_aa64pfr0_override	= id_aa64pfr0_override);
-PROVIDE(__pi_id_aa64pfr1_override	= id_aa64pfr1_override);
-PROVIDE(__pi_id_aa64smfr0_override	= id_aa64smfr0_override);
-PROVIDE(__pi_id_aa64zfr0_override	= id_aa64zfr0_override);
-PROVIDE(__pi_arm64_sw_feature_override	= arm64_sw_feature_override);
-PROVIDE(__pi_arm64_use_ng_mappings	= arm64_use_ng_mappings);
+PI_EXPORT_SYM(id_aa64isar1_override);
+PI_EXPORT_SYM(id_aa64isar2_override);
+PI_EXPORT_SYM(id_aa64mmfr0_override);
+PI_EXPORT_SYM(id_aa64mmfr1_override);
+PI_EXPORT_SYM(id_aa64mmfr2_override);
+PI_EXPORT_SYM(id_aa64pfr0_override);
+PI_EXPORT_SYM(id_aa64pfr1_override);
+PI_EXPORT_SYM(id_aa64smfr0_override);
+PI_EXPORT_SYM(id_aa64zfr0_override);
+PI_EXPORT_SYM(arm64_sw_feature_override);
+PI_EXPORT_SYM(arm64_use_ng_mappings);
 #ifdef CONFIG_CAVIUM_ERRATUM_27456
-PROVIDE(__pi_cavium_erratum_27456_cpus	= cavium_erratum_27456_cpus);
-PROVIDE(__pi_is_midr_in_range_list	= is_midr_in_range_list);
+PI_EXPORT_SYM(cavium_erratum_27456_cpus);
+PI_EXPORT_SYM(is_midr_in_range_list);
 #endif
-PROVIDE(__pi__ctype			= _ctype);
-PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
-
-PROVIDE(__pi_init_idmap_pg_dir		= init_idmap_pg_dir);
-PROVIDE(__pi_init_idmap_pg_end		= init_idmap_pg_end);
-PROVIDE(__pi_swapper_pg_dir		= swapper_pg_dir);
-
-PROVIDE(__pi__text			= _text);
-PROVIDE(__pi__stext               	= _stext);
-PROVIDE(__pi__etext               	= _etext);
-PROVIDE(__pi___start_rodata       	= __start_rodata);
-PROVIDE(__pi___inittext_begin     	= __inittext_begin);
-PROVIDE(__pi___inittext_end       	= __inittext_end);
-PROVIDE(__pi___initdata_begin     	= __initdata_begin);
-PROVIDE(__pi___initdata_end       	= __initdata_end);
-PROVIDE(__pi__data                	= _data);
-PROVIDE(__pi___bss_start		= __bss_start);
-PROVIDE(__pi__end			= _end);
+PI_EXPORT_SYM(_ctype);
+PI_EXPORT_SYM(memstart_offset_seed);
+
+PI_EXPORT_SYM(init_idmap_pg_dir);
+PI_EXPORT_SYM(init_idmap_pg_end);
+PI_EXPORT_SYM(swapper_pg_dir);
+
+PI_EXPORT_SYM(_text);
+PI_EXPORT_SYM(_stext);
+PI_EXPORT_SYM(_etext);
+PI_EXPORT_SYM(__start_rodata);
+PI_EXPORT_SYM(__inittext_begin);
+PI_EXPORT_SYM(__inittext_end);
+PI_EXPORT_SYM(__initdata_begin);
+PI_EXPORT_SYM(__initdata_end);
+PI_EXPORT_SYM(_data);
 
 #ifdef CONFIG_KVM
 
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 73fa57f341b0..bd7626b8c7a3 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -319,6 +319,7 @@ SECTIONS
 
 	/* start of zero-init region */
 	BSS_SECTION(SBSS_ALIGN, 0, 0)
+	__pi___bss_start = __bss_start;
 
 	. = ALIGN(PAGE_SIZE);
 	__pi_init_pg_dir = .;
@@ -332,6 +333,7 @@ SECTIONS
 	. = ALIGN(SEGMENT_ALIGN);
 	__pecoff_data_size = ABSOLUTE(. - __initdata_begin);
 	_end = .;
+	__pi__end = .;
 
 	STABS_DEBUG
 	DWARF_DEBUG
-- 
2.49.0.906.g1f30a19c02-goog


