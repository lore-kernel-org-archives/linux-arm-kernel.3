Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7629DED7B96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=muj4NuOpuZ8hBEE3iFtHY9kZtKoXKHThzny53jznPvI=; b=PrI/RFyKdc6I4VPtnXXg6pNgpS
	GEVhGmDoBcAeSeIXfdVpfKmayb/TNAqRVVTDhGgE4KNHFuRgxjrM97R8LoU3d0xIY4uZYZVJv7xZq
	EBOEgyFcqRzEaaj/X4ccZAPVmLbIz77g538+nz8C5idKM3S9QOI1d8hoj9d7A4ScS1VVsQ/jxwCS2
	XDlRjVOjv/Hk4HQdIEDW5dpAuqQyktVAFxb7IHdhqOYccfHEcBz64K+6SxEXKVRxBtgQzzj1CLxQ8
	e9lJtKWD4MNzQZkD/BGnUDNgMbwKipYxLRlV9gJl8UoM70a0eiTrSGJ3/D+5yxB+5o9lDm8Ulc0ZZ
	7LGVe+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCabh-0000000H6JO-2DJO;
	Tue, 14 Apr 2026 10:02:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCabf-0000000H6Ix-1ZR0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:02:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488e097a270so17413135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776160972; x=1776765772; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=muj4NuOpuZ8hBEE3iFtHY9kZtKoXKHThzny53jznPvI=;
        b=FcIz0ouNckBL0EQr+FzKZH+8Dt3wW59j3GnJVJXFeDcT5MuGUOY9UiPjqSppQ3tx90
         FCW2cbqey+CK4Cu3Y8Y/tHYxj9tmDtZzY/2I1E5F+MOw05o/Zvd6WQp5rQIlMVq5swZ7
         49m2r4BopNKLI8Z/SXMwwMBmugENbSa07dnqt/cDjjpc/B2ZvBWaYyaaBGx6MbPwf2tc
         i8U6NTqVqESLQlZ9p3/lNYqrxAVkL9Vv875GVsKYWO+VUyaZbStHcJ5fG9GZlbkLu+5B
         YB1MhMcbZ9M7fJB9R0eCvyJSivhO3xgzaC8rQ6IRQtqCv/nLC3PNKQv+Yg1YJfhDYzMa
         5f7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160972; x=1776765772;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=muj4NuOpuZ8hBEE3iFtHY9kZtKoXKHThzny53jznPvI=;
        b=VrsW+5kKgwK73GjZQ6jNmemVLlQO0IjcD+LlbeFozBTSgRbB3LEzwsC2NdCX2yyDsM
         1xbMXdCH6q8UyDhPZpyAxGMy16ag6PIQcFW8J5YMgreFgUD3CwvIrN4r1Dqi//s/f606
         ze+yvdpBUj9Bq9my0zErpWmRuZPcY2XwpUShy6ELG144SJrLnio6RP+k3YGT4SsBl/qd
         hu7GeAqPBjAnVfedn0nitVvpS4m/agVGhLXt1fBRsN0wLgU5Q5L3JKd72YKOsObEfWGf
         epNvT0sJdISaEGszZKAORoA42N7jCXoXmtQO2gvx0K5yvqIU5601VbaZB7XLMXfiLtgV
         Kwvg==
X-Gm-Message-State: AOJu0YwT2GGa7TXnXnPieZs+rrPuVwJKWeyBfbDRJj2jJTomdiRg6C0n
	IROzu0r60cGYDUPsFNCATeraum9NWhU+pmKmFDnnxv8c0hSuuMcwRP3SYV4qb6ZGsLGjZ+85lMm
	RJLnftfVEKZh09tsyonlm8A==
X-Received: from wmqy6.prod.google.com ([2002:a05:600c:3646:b0:488:7f5c:7693])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:674f:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488d68cb47amr244321275e9.30.1776160971924;
 Tue, 14 Apr 2026 03:02:51 -0700 (PDT)
Date: Tue, 14 Apr 2026 11:02:31 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc0.605.g598a273b03-goog
Message-ID: <20260414100231.1859687-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Re-allow hyp tracing HVCs for [nh]VHE
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_030255_426769_680C4001 
X-CRM114-Status: UNSURE (   6.15  )
X-CRM114-Notice: Please train this message.
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

The introduction of __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM excluded hyp
tracing HVCs from the common [nh]VHE/pKVM list. Re-allow them.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 37414440cee7..11dcdf434971 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -72,6 +72,14 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
 	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
+	__KVM_HOST_SMCCC_FUNC___tracing_load,
+	__KVM_HOST_SMCCC_FUNC___tracing_unload,
+	__KVM_HOST_SMCCC_FUNC___tracing_enable,
+	__KVM_HOST_SMCCC_FUNC___tracing_swap_reader,
+	__KVM_HOST_SMCCC_FUNC___tracing_update_clock,
+	__KVM_HOST_SMCCC_FUNC___tracing_reset,
+	__KVM_HOST_SMCCC_FUNC___tracing_enable_event,
+	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
@@ -100,14 +108,6 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
-	__KVM_HOST_SMCCC_FUNC___tracing_load,
-	__KVM_HOST_SMCCC_FUNC___tracing_unload,
-	__KVM_HOST_SMCCC_FUNC___tracing_enable,
-	__KVM_HOST_SMCCC_FUNC___tracing_swap_reader,
-	__KVM_HOST_SMCCC_FUNC___tracing_update_clock,
-	__KVM_HOST_SMCCC_FUNC___tracing_reset,
-	__KVM_HOST_SMCCC_FUNC___tracing_enable_event,
-	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 73f2e0221e70..8f7582d57ab5 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -709,6 +709,14 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__kvm_tlb_flush_vmid_range),
 	HANDLE_FUNC(__kvm_flush_cpu_context),
 	HANDLE_FUNC(__kvm_timer_set_cntvoff),
+	HANDLE_FUNC(__tracing_load),
+	HANDLE_FUNC(__tracing_unload),
+	HANDLE_FUNC(__tracing_enable),
+	HANDLE_FUNC(__tracing_swap_reader),
+	HANDLE_FUNC(__tracing_update_clock),
+	HANDLE_FUNC(__tracing_reset),
+	HANDLE_FUNC(__tracing_enable_event),
+	HANDLE_FUNC(__tracing_write_event),
 	HANDLE_FUNC(__vgic_v3_save_aprs),
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
 	HANDLE_FUNC(__vgic_v5_save_apr),
@@ -735,14 +743,6 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
-	HANDLE_FUNC(__tracing_load),
-	HANDLE_FUNC(__tracing_unload),
-	HANDLE_FUNC(__tracing_enable),
-	HANDLE_FUNC(__tracing_swap_reader),
-	HANDLE_FUNC(__tracing_update_clock),
-	HANDLE_FUNC(__tracing_reset),
-	HANDLE_FUNC(__tracing_enable_event),
-	HANDLE_FUNC(__tracing_write_event),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)

base-commit: 94b4ae79ebb42a8a6f2124b4d4b033b15a98e4f9
-- 
2.54.0.rc0.605.g598a273b03-goog


