Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60901E77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6RWe0aov1XUyPINE327G3Q+w+KMS4G74JxHKr2TJ/zY=; b=2Pt+hUhwMFPnDVwB4HOhEtl93Z
	iohxWvo7scN+QR6ucUAgMDziMGJgzwRnQele5YVjvMGGMu3Jq9RVQuRqIRVhLSOXuWrUQRK5u2G5i
	mrWZine7lTzRtrGe3ag95eBi4wn47yd2QIOdWS5ti4UhcjhUeoZDi+1JLSZMY8oF7IHoEGYyL6IgE
	StN6igLnpeHAS/aqMMq3dS4fqIlRvkhVeqdD4f8TAuTFAgVADVDHEl6OPFvsT7DMJKYW2zZXsscMP
	VVCpIGRDVQbw86DpegvutkJb7DbM8hX6sErmtEsyYxs2Ya/HiAdodjWgwlTBK9VkAAad8sIhN5QQW
	CTBNr5iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7mJ-00000004YU2-2ezZ;
	Tue, 07 Jan 2025 11:29:43 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7l7-00000004YEk-1aMb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:28:30 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3862b364578so7591683f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736249307; x=1736854107; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6RWe0aov1XUyPINE327G3Q+w+KMS4G74JxHKr2TJ/zY=;
        b=jTP38Baaohuz5ysI+ULEZc8SngJ4vAZNV5e2VdhJ45ch9kIkL6NjJE6y0B/MxLMITa
         egFvSB5j38uFJtdNDmSp9S22HjvUB4EWp4CF2s/UigKy8VzCGZwcaqVTy73crDiRv3/2
         hZT9uOctjNmGkxepv6+oQM2TZrRHrRnd5V3x88+9uMlEnEKkyLmSS6ONlwJcBCU3ZWs/
         /Qo335Wo7cPeS/bCB26kqGz/Vvxn48EUHymF3Jr6sqE4lmXbmQpl1vR+7osKJYV9L/LU
         hY50r0PupuQEnG3V6eM4y2jeO4yFC0w51VNjcHoQtFlXmCCPM4fEBTYjfKs55MIM9ilj
         HviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249307; x=1736854107;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6RWe0aov1XUyPINE327G3Q+w+KMS4G74JxHKr2TJ/zY=;
        b=v3jqQ8+KqIDlktcEbz/9MJFsRVOoKd/u/vxuwznMnGUecCp6EJ4ybD1JkLilD4xGOt
         t+pbpMIpg8a3qxJRgitbGIZXUMRUn9DxO49WMZEwTRwcl/Mkyqsc06NUEVjikA2g8rDM
         +u4/OukG3aOcFshsrMfK2FP0ooj5ZXloY7naRNRLyiaJhtsT7AFg0NGWJlPzAgePfDpj
         SN/FnxHu/5HoalBK9ldaeyWEzPWWkdSsNAKktdT0U9bEMuDoKUVIHLhoNH145qO0xbC0
         O+BRTR6pe03Nw1UI0FRBlH2tYH9gGUbKFL98Sgg8N/6smmzqN9V5eN8enXshluE26ho/
         dkqA==
X-Forwarded-Encrypted: i=1; AJvYcCVOaYFQcwnh6v9Wlay13AgCu7S4E6qazkcmJOGQBMRdSPbkkAGIidsS/5TuE15O6TiGJBUhEU1Sbx5ruMgU+4XR@lists.infradead.org
X-Gm-Message-State: AOJu0YwVoorNGCfkvWNRi2f2i/zWQceF7tC9Wti14A+Xxk955KnLaBp7
	Y59f4hiWsAv+MAEJ3WEqY0Iuk6xqjebiKEqql6yUp1itUHWBOfV60z7sa2n7hiyTzg87vyQqpZg
	i9f5BPlzPtgCdROKnbw==
X-Google-Smtp-Source: AGHT+IFaQ4XQ8bYbMRP59ehwt2favLhOBx+hmOWfdOiaSTTQVYQBJvmJGyD9CEXh9o9vauz+1OQ207ChACxpCbDs
X-Received: from wrbeh15.prod.google.com ([2002:a05:6000:410f:b0:386:33bc:1c9b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c1:b0:385:e90a:b7de with SMTP id ffacd0b85a97d-38a7912c97emr2229999f8f.5.1736249307164;
 Tue, 07 Jan 2025 03:28:27 -0800 (PST)
Date: Tue,  7 Jan 2025 11:28:21 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250107112821.416591-1-vdonnefort@google.com>
Subject: [PATCH v2] KVM: arm64: Fix nVHE stacktrace VA bits mask
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, zenghui.yu@linux.dev, 
	kvmarm@lists.linux.dev, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_032829_447193_ED8146C1 
X-CRM114-Status: GOOD (  10.73  )
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

The hypervisor VA space size depends on both the ID map's
(IDMAP_VA_BITS) and the kernel stage-1 (VA_BITS). However, the
hypervisor stacktrace decoding is solely relying on VA_BITS. This is
especially an issue when VA_BITS < IDMAP_VA_BITS (i.e. VA_BITS is
39-bit): the hypervisor may have addresses bigger than the stacktrace is
masking.

Align this mask with hyp_va_bits.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 66d93e320ec8..2ddd98fd2df4 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -139,6 +139,8 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
 
 #define kern_hyp_va(v) 	((typeof(v))(__kern_hyp_va((unsigned long)(v))))
 
+extern u32 __hyp_va_bits;
+
 /*
  * We currently support using a VM-specified IPA size. For backward
  * compatibility, the default IPA size is fixed to 40bits.
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c9d46ad57e52..d36be6d2ac91 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -29,6 +29,8 @@ static unsigned long __ro_after_init hyp_idmap_start;
 static unsigned long __ro_after_init hyp_idmap_end;
 static phys_addr_t __ro_after_init hyp_idmap_vector;
 
+u32 __ro_after_init __hyp_va_bits;
+
 static unsigned long __ro_after_init io_map_base;
 
 static phys_addr_t __stage2_range_addr_end(phys_addr_t addr, phys_addr_t end,
@@ -2056,6 +2058,7 @@ int __init kvm_mmu_init(u32 *hyp_va_bits)
 		goto out_destroy_pgtable;
 
 	io_map_base = hyp_idmap_start;
+	__hyp_va_bits = *hyp_va_bits;
 	return 0;
 
 out_destroy_pgtable:
diff --git a/arch/arm64/kvm/stacktrace.c b/arch/arm64/kvm/stacktrace.c
index 3ace5b75813b..fdedd8a3ed6f 100644
--- a/arch/arm64/kvm/stacktrace.c
+++ b/arch/arm64/kvm/stacktrace.c
@@ -19,6 +19,7 @@
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
 
+#include <asm/kvm_mmu.h>
 #include <asm/stacktrace/nvhe.h>
 
 static struct stack_info stackinfo_get_overflow(void)
@@ -145,7 +146,7 @@ static void unwind(struct unwind_state *state,
  */
 static bool kvm_nvhe_dump_backtrace_entry(void *arg, unsigned long where)
 {
-	unsigned long va_mask = GENMASK_ULL(vabits_actual - 1, 0);
+	unsigned long va_mask = GENMASK_ULL(__hyp_va_bits - 1, 0);
 	unsigned long hyp_offset = (unsigned long)arg;
 
 	/* Mask tags and convert to kern addr */

base-commit: 13563da6ffcf49b8b45772e40b35f96926a7ee1e
-- 
2.47.1.613.gc27f4b7a9f-goog


