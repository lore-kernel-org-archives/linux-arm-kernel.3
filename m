Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC52D5B84D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkHSL25koHVDTaMmCRcby8S1CrLCFqcfDXkn0dsUTFg=; b=x3qL5OdimCxqCIQfJWJErzYCI7
	FWMnz/400demqKy4JayjXySj56de/2PousQ2ZYtg4hhZVeXxXI03bU4izWzfLIJ5oOlMdV2KbRkdU
	GC/QZeSr9oH3U4gR9zayL+LXV8gxz1HxPjAh6+Wg45tWociSscQlNAS87CEQcf6CBky1ovC9YWayz
	bWI9p1+MTBSydiPbgX1Vpo6xNzzH+1P6d+5u7S+Or1Z0EdVbd/Tambn8dy4Q6h95w2+nt6XhkHHQw
	a5jJWaKoCEPRLstHE9F3X0h0ctkGDMvlrhJcN3t1luHwt4MWTS0to+ObgS71s49PcLPwrkUdyH4cY
	bF7D10Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnp-000000041f8-17gW;
	Mon, 15 Dec 2025 16:52:05 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnk-000000041YY-2hoz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 16:52:02 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-647a2c3df89so4739041a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 08:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765817517; x=1766422317; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkHSL25koHVDTaMmCRcby8S1CrLCFqcfDXkn0dsUTFg=;
        b=oKLrQbns/kC7DsDm3lGZfJ4TL5Kyd2FywlQFTIVRFkzEJtFImd5rj29+OIUzUIqIc3
         A8l/4OUvdyz+/ti9d6GmUNoA+fbnzeYlg+s8/63E3JUzYEJ0XXcGOEb8YULHFdzDqHMM
         N3P2HRqIJMKZpI0Q7+FOha/lrMOHTIIx/380fUmhPaaumf0T1tL2/C0HaYckmf8hnxUe
         Xaj/ULC+VmWQkvIJMr1mg1uSnLtwovXZWQi5DacyYEI+XXKek/1si1qCk5ZFv5N7nHl7
         FRWUUcEst4L06OMeVZ60VKarw9lR+vn9zNN78PtVuxDbv/eJJibv+ZvUhJOQU+IwYUjO
         a8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817517; x=1766422317;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkHSL25koHVDTaMmCRcby8S1CrLCFqcfDXkn0dsUTFg=;
        b=tpl8MbmTr1lCWz1Ufi/+pIrIakSORV9w/f6Za1mxLTWB02HPqqfMqQAEyufzDw9PzY
         fUXvKUSXFNitHiiVynR2FQXkr4Jcx8T1DZyINFCi7DtKARKMIqL+S7NHg7YDIXxnCRq6
         FF6X/F4EpuWEP4fKL8otlPwZzZ/YzP+3nSSIsHUFjkdzkQRhjk2oj2oNV+fCw4KhRRVB
         bfNXZOPwAlDrU8GkvESuU5dLqWDZSjcTEmY01MT01TFFcePRh9ZoAIJ+jHmyBkGM3Lmk
         q1yoJQY6wfEAHBxWltYXAhxbmvWPX41SuC0NA/aLz3gR7yXkCppoWNvMYD0a/VGJD6ln
         8rbA==
X-Forwarded-Encrypted: i=1; AJvYcCUII2v/z7BvJqjamilGO7EMTYp985DdLtDCd27+EHix23SYKBcmElmppZOmYvlpq4QMRn3KFGKlHhT3D4RZMB5v@lists.infradead.org
X-Gm-Message-State: AOJu0YwedJjYc8m2AkQ7OITo1ktBEuf5ff/GYv3XGfqvfbRzBY+G2kLL
	qSHoqBRGv4eoxL/LTzUu1jm71pUUUvckGPU0UuwOkOMWHSAF7D949zY+9NFenYsOIMXJxPPPGBG
	kfg==
X-Google-Smtp-Source: AGHT+IFrHxiEYHDjT58c4YVmrMD5eO1DrDlCmV6f5ukjJAbXvW2Vssi5+5Lw36DE9YHOiX+0KsCF3RMJMA==
X-Received: from edbdk5.prod.google.com ([2002:a05:6402:1d85:b0:649:1567:4ee3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:d08:b0:641:8a92:9334
 with SMTP id 4fb4d7f45d1cf-6499b1301b7mr10482727a12.6.1765817517246; Mon, 15
 Dec 2025 08:51:57 -0800 (PST)
Date: Mon, 15 Dec 2025 16:51:51 +0000
In-Reply-To: <20251215165155.3451819-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215165155.3451819-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215165155.3451819-2-tabba@google.com>
Subject: [PATCH v2 1/5] KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_085200_696461_511D1E40 
X-CRM114-Status: GOOD (  11.21  )
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


