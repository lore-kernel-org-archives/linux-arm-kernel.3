Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4202C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFL6LCOiCuB4AhqO2WO2qSyMds3tZvVGSAG8TlD6fm8=; b=3I4Iihcit3TR4CsWSfppd/8syn
	zzKjoNSK5inOdvNx5Hb3oIzZbNWdZ/TbZBNUbtB14vFwAFAe9MqeMdm+Imeq846xV4P1vI0g+MFLy
	k/kh49wgL7tGdwQisnqtewL0I/vf+WhNmCljFwoHheEc/nL+PZYoZyvra5YHnj+S1Hl7h8i5uooc2
	x2JuqRtsodvxMrxEfYa0p3cMIZpgGOklOWtEOuk+bcIr6M8COgYuax8aLrU6nnA3Hsbn2y6aM9Tzs
	hkM7dY+HBXv1bZ58Vz2e1fkiObhe5yUDXotSswivg7SiOvoYJOjLnnSDv7FrhW9E1RGmCtkloKcNr
	SU6L9UzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Y0-00000000de4-1HIo;
	Thu, 08 May 2025 12:40:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Tt-00000000d3k-1LGm
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 12:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OFL6LCOiCuB4AhqO2WO2qSyMds3tZvVGSAG8TlD6fm8=; b=QC6L597cFlols2r+npdUtzPAs/
	7lxtW/c4v+OMtAz5LfpJkNzo1w4Mj6A4pxW/OhcFBLOk/KX1C9n5F6ew6ECBQU2/7ARegmICPmuKT
	0uy/uOKBntwA2Ou2M0MvV3sXA98F0TeZ7g6qCynmfM+6V4jMjTKeMP5P/swNeIon3tiOnFcMNMInt
	iSwoQiZvAl6JPBRQoWHUBFpAsbMh24mzhJF2pURtjgbfmao71tLzxF3V+aQmXvHfQ6VqrZyjWNUqo
	Bkxv4ddLmd1v9HdsybpmZesNmTnI0w2cdf729IhUK2Z1j7fTbfS13GYJdgzYdRiz4kFSV1b+7LgRS
	352egh6w==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCzfF-0000000G1mf-2tNH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 11:43:47 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so3801845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 04:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746704623; x=1747309423; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OFL6LCOiCuB4AhqO2WO2qSyMds3tZvVGSAG8TlD6fm8=;
        b=nwf8AoPkkCktauf9ofroKCHLGtlufrjRtKLX9Ly9R5vYTPqZ8gWulM1nZgxte1dAa+
         RheHtX5kfoQkQZHWak8iQGbehb52/e9vidvv/LPR/gNAEViz8Pi93um3IkNm6f+Z0qZm
         oiLI9ytfGT1W416PQrYe00T/KxKcKRqgf+ZqnsIG3eMS0ihIWdaIz9dfVn2C5CzNs5nr
         g2Ya0ytwC0gh/bXFRSCoVUfAHpy9l1fg/bTPCE/xDudheWfwBN94Os/XMFTVPC7xo3h2
         US6kGetOq2WbaGZafDsY0NY2zf+vDloKMpsRIuyt+qJb40McQy7+NAVepgsxZaZ3m1EC
         uAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704623; x=1747309423;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFL6LCOiCuB4AhqO2WO2qSyMds3tZvVGSAG8TlD6fm8=;
        b=k2TlG5W8WJsGr5CNa4N8QiI8VpUFDoazBMSaxaQPSY5xXnwYmQufpQWEAZnuJ2WNS8
         XO3ydPdmc1ty3XbxwNWPAxZcHK/RgJ2nBD9DXaPW6+Rz62u8S8lZl6d0Jtxix++aOC9r
         srklHB+0fNYapuiudkXlez7EQgZRkIPdARnqpnwNmP+cNojqlXU1gQ08BvoQnD+sEvT1
         fWC3j3uMA0my6XGgMWQJYSmFwQg1kZVinyhtBVCFPQzLXC8uvBkmZ666f9Rv9oBeb/tD
         R6TcO7gv4pmDSsOEAzEaN6YNtaNsHxI/K1cGRNSzBoFuSBTlJyp/x2vmpvmtH/6eMPtY
         cbAQ==
X-Gm-Message-State: AOJu0YzgXXs65PFiTxaXz/Axop1Ner4bjhyw3LLjogNvCNE9bbYW4G5C
	qI2Htn2hmgDad6bMU095KfY0x5+FFNNcWtbGDaS/JElZNXgZdYzaLu0gbjWWHS597hBq5qaiBtV
	BQsuiiCpQVIDILkFSW+//+j+wbyeJIyD7IDm9jjZS/OY+slvm/xZP1eiZzbtECz9HCHU2C7B7Fv
	3e6oTfzv6k6jLJjnSQHj6AU4oL2SQ+aNIQxEpiAxJK
X-Google-Smtp-Source: AGHT+IHhgjjPcSzSlIvKKbGxCHF4/xh5ayQlKt49bS4/7hxPqwU88888d3Bex6M06x7UUFIZSSVblKdy
X-Received: from wmbem23.prod.google.com ([2002:a05:600c:8217:b0:441:b661:2d94])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3d13:b0:43c:f3e4:d6f6
 with SMTP id 5b1f17b1804b1-441d44e3660mr72820155e9.31.1746704623167; Thu, 08
 May 2025 04:43:43 -0700 (PDT)
Date: Thu,  8 May 2025 13:43:32 +0200
In-Reply-To: <20250508114328.2460610-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250508114328.2460610-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4218; i=ardb@kernel.org;
 h=from:subject; bh=j8k/j5lLwOtOO5g2RunsS1a0UPrHZPgoaoPHRVCj0HU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNmxtNDLXyH4vbP5Hn2N3xteLLlH9mFD+alrm7kKly3W
 eLd4e+rO0pZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEbi9lZGh+6vuo8tplgY66
 2R3/RSr/Fy7eV5byx/cO7yFOxgb98iWMDHdPm57KuGFZE86venruP3lRDoPFOk/SGjfantBpO/x /FxcA
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508114328.2460610-8-ardb+git@google.com>
Subject: [PATCH v2 3/3] arm64/boot: Disallow BSS exports to startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_124345_936990_67B6E656 
X-CRM114-Status: GOOD (  12.77  )
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
use by the startup code of any variables that live after __bss_start in
the linker map.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h  | 62 +++++++++++---------
 arch/arm64/kernel/vmlinux.lds.S |  2 +
 2 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index c3b4c0479d5c..a928e0c0b45a 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -10,6 +10,12 @@
 #error This file should only be included in vmlinux.lds.S
 #endif
 
+#define PI_EXPORT_SYM(sym)		\
+	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
+#define __PI_EXPORT_SYM(sym, pisym, msg)\
+	PROVIDE(pisym = sym);		\
+	ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
+
 PROVIDE(__efistub_primary_entry		= primary_entry);
 
 /*
@@ -36,37 +42,35 @@ PROVIDE(__pi___memcpy			= __pi_memcpy);
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
index 466544c47dca..e4a525a865c1 100644
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
2.49.0.987.g0cc8ee98dc-goog


