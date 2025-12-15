Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BC7D5B841
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkHSL25koHVDTaMmCRcby8S1CrLCFqcfDXkn0dsUTFg=; b=P0hoynUqxcnCVh9uNJ7pexUnue
	ffrAjm7gHesaR2VMHLZk7jSk2TmyWeDSRmxcmh/ZEh9bwgJjjQuAot77nuovEylr76M88/DZQbSSr
	YjA8Vc8kXjhDsAFmcAsLge2RgJst6ufi4eSW+gFPDaYspWZJWicLHEs0Cwwuct7CyRjionXWqqHhN
	2CsWUzsWUlKQ5ECYL1ziyoDoU1DyI6QPCpoMSv5WOf4UVAqpXJKt1EM8B/NczbEwqPe3lYMchY549
	FfQQS9bCvKlAFdp2zKtS97Im9sWsNbaI1EnvF04ZdeFyPBhDgI9XCzEYc8K4xZxfWRy/zWUOyOwc+
	rsCRosQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlb-00000003uxI-00v8;
	Mon, 15 Dec 2025 15:45:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlW-00000003utG-0Rd8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:45:39 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477cf25ceccso39096905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 07:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765813535; x=1766418335; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkHSL25koHVDTaMmCRcby8S1CrLCFqcfDXkn0dsUTFg=;
        b=e7gkh3q+2bvsfsvlxs2Vf2+q/dPRLDe8k43wpG1TMY7WMMHshwyHXx5X+cqomsC32j
         GznF7FXLlXg0PMiJMEaaYszvqJIc8WHMut5un0hqi9YK/7oYRT4IU5voeCsguGsMhG7c
         /mybQhorGcmP7Re5wnJCH4iVaDgqll2EZxUsNWpi6sFuJreY8fvGkSexUEhnjnqHMpbj
         1wr3W/Qx1oztsXyoQVCxuGeEj4OeLhyeRsa0eCQeBVhCCVYFDxIrr3EgqZht60jWZQvJ
         71aLPqFnS9MAYqQNknN0hWkpyYrRvTgGeTPBXHXZyI1gVuU1DNSU+H3Ty4N59bYuaL6v
         s10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813535; x=1766418335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkHSL25koHVDTaMmCRcby8S1CrLCFqcfDXkn0dsUTFg=;
        b=nObC3+z9y9hEzzEn1Wo7YYyu8a2PBSUbiRsB72kayvrwxbMh3RUMdyoFGDsypt93Nm
         ae4uHdWcRHN46Yn7SwMhQNd1OzSL18MjX47Xrnr1RIlUAYDdPmLFv6Woj2NHB7dbMjfz
         Pd/zlYeQ7l0aIWder4QJ5a7bc6zr0V66wMOxsSPtkP2oomTCOLT895YP/o9PJ9hG2QKt
         UOMEbaFfGv90Vc/dCUpBBqyN623urCSECUlIAp/Zts2M1z+V8S0mp1twKTOEwTW32x5r
         IPFHN60qiC/4cjTqkHcDy4pXgPGBc9QI2s+GEwdTfqNK5o5u7ey7g+i6cHfVg+PgFN5s
         VaqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7SJ/BJDfH6FjVCP216sVpkiSRlwCVdPshze2ShsvhSvnpVEBm5UZbThqXm2LMkjMShKrBeAl1AQfXqf3+5KGn@lists.infradead.org
X-Gm-Message-State: AOJu0YyqpvxnQd1NPx1UzlcdaieUaR9tPIMuUkqjVNJeZuDaAelINXZW
	orfozK7E6SY68bFhPXfrL/ZmGWVUseh7hWeU3JGBI8JlYAxlyOW8JzibAD5JtB8g1JH6HawGrLX
	erA==
X-Google-Smtp-Source: AGHT+IHygSESsYK4RUtj/wRDvzA17kzQXBviuMSGq8fm5KlzkeMm8FFn/k6iIvMKHZM+3w1EhOwz9LhhWA==
X-Received: from wma11.prod.google.com ([2002:a05:600c:890b:b0:47a:9505:f0b6])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3e8d:b0:475:e067:f23d
 with SMTP id 5b1f17b1804b1-47a8f90e531mr112398205e9.25.1765813535012; Mon, 15
 Dec 2025 07:45:35 -0800 (PST)
Date: Mon, 15 Dec 2025 15:45:29 +0000
In-Reply-To: <20251215154533.3154405-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215154533.3154405-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215154533.3154405-2-tabba@google.com>
Subject: [PATCH v1 1/5] KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074538_160730_C330098C 
X-CRM114-Status: GOOD (  11.27  )
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

KVM selftests map all guest code and data into the lower virtual address
range (0x0000...) managed by TTBR0_EL1. The upper range (0xFFFF...)
managed by TTBR1_EL1 is unused and uninitialized.

If a guest accesses the upper range, the MMU attempts a translation
table walk using uninitialized registers, leading to unpredictable
behavior.

Set `TCR_EL1.EPD1` to disable translation table walks for TTBR1_EL1,
ensuring that any access to the upper range generates an immediate
Translation Fault. Additionally, set `TCR_EL1.TBI1` (Top Byte Ignore) to
ensure that tagged pointers in the upper range also deterministically
trigger a Translation Fault via EPD1.

Define `TCR_EPD1_MASK`, `TCR_EPD1_SHIFT`, and `TCR_TBI1` in
`processor.h` to support this configuration. These are based on their
definitions in `arch/arm64/include/asm/pgtable-hwdef.h`.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/include/arm64/processor.h | 4 ++++
 tools/testing/selftests/kvm/lib/arm64/processor.c     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index ff928716574d..ac97a1c436fc 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -90,6 +90,9 @@
 #define TCR_TG0_64K		(UL(1) << TCR_TG0_SHIFT)
 #define TCR_TG0_16K		(UL(2) << TCR_TG0_SHIFT)
 
+#define TCR_EPD1_SHIFT		23
+#define TCR_EPD1_MASK		(UL(1) << TCR_EPD1_SHIFT)
+
 #define TCR_IPS_SHIFT		32
 #define TCR_IPS_MASK		(UL(7) << TCR_IPS_SHIFT)
 #define TCR_IPS_52_BITS	(UL(6) << TCR_IPS_SHIFT)
@@ -97,6 +100,7 @@
 #define TCR_IPS_40_BITS	(UL(2) << TCR_IPS_SHIFT)
 #define TCR_IPS_36_BITS	(UL(1) << TCR_IPS_SHIFT)
 
+#define TCR_TBI1		(UL(1) << 38)
 #define TCR_HA			(UL(1) << 39)
 #define TCR_DS			(UL(1) << 59)
 
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index d46e4b13b92c..5b379da8cb90 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -384,6 +384,8 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 
 	tcr_el1 |= TCR_IRGN0_WBWA | TCR_ORGN0_WBWA | TCR_SH0_INNER;
 	tcr_el1 |= TCR_T0SZ(vm->va_bits);
+	tcr_el1 |= TCR_TBI1;
+	tcr_el1 |= TCR_EPD1_MASK;
 	if (use_lpa2_pte_format(vm))
 		tcr_el1 |= TCR_DS;
 
-- 
2.52.0.239.gd5f0c6e74e-goog


