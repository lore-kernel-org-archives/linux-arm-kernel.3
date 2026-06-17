Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EB3CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zTinsQw/nEGi1wFzOxFuLPf8UTkNQwbK0dcHdALi4gQ=; b=0x4FNE+mo4V8haz6gB5qFoyugb
	Bc3s5XJ5Sr+gn9Yo5ZD/O5t/ASi9JbNQjPaN9t43cUSMJTHlXNkscVk+kcr7lGPAZQirTT1iwrz55
	16E0XAoZR5zfWDXlkjCWeXT0ObWZkn8o7sLtDGE9nqSl3kJqQLgl62C7Oyk1IJa6iCQMhHyY3uEEI
	Cs43BnVPF9QYQMGoVAnXn/wA4Ia34ljK6MldYRQuKqXX4VlS0kijgd/0199zlMEIE3Z4yf8c26vah
	MBPi7+3Ai12LN5l5nkyWsKVsxN2jQMQnvfGPlC8VTS6TjIKPfBmWw0LSJnFaNbk2gdP+LBa/89z4U
	GW/bmRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmzJ-0000000Gz39-47uF;
	Wed, 17 Jun 2026 09:55:14 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmzH-0000000Gz2l-1HQi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 09:55:12 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-695a081e715so49333a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781690108; x=1782294908; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zTinsQw/nEGi1wFzOxFuLPf8UTkNQwbK0dcHdALi4gQ=;
        b=X+D42N8nkW+EAac23gIpTMHmaVEa3fhz9JDaCgufRb1fhAJKCN72lG8lfgoFJWO1qU
         BKmtuL4G/ADgRSsvmCoosXb9/6W0RdVTgXxEwL+jtq9VwYF/ypvIZ0Ffz3Ahb3rdPnGr
         2dkbhAmc0xyZoDDB+Tv2A470F6dwB8LPgr4qzqmgDcPE0IkEN47koQ1eQJgilI4Io3jE
         STHmHOMSvqKNQRr7CrjyPwsdN0f4i15o0WW+2eChMZ7exPxmAKoeyQjX3FWhOg1fsuGM
         FLPUe7tmvrN+XG4+nGMoMyCzHjPOBkYiDE4kivcoN8wOJ9jkyq2XM9bT5CZwEJZ5MCiU
         vesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690108; x=1782294908;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zTinsQw/nEGi1wFzOxFuLPf8UTkNQwbK0dcHdALi4gQ=;
        b=q/3xOoB9Ewbf86ke0TkkhJv42k8qEPCQrcamYF9o8gYm1/23dEGF1TG10b7cWZQGfm
         o3pqbjLRTuJjO2KJq0mB0/my6/4zpoWU22g5gAq8PnJauFi2x9mGsO7739jZkTI6jazT
         tAalxW30KuRP1zVg52TC5z9jZACAq5W8YzFlaA59skVFmUEFuADCznmgjSFhonpkepSX
         TQfPoIHga7XWGw3MUu+R2z3Az6FnfvLgddtPFqT2pU9Z6ccAHXGbOnxBH6WgaJ/p+Akq
         9j8+mCHqu00QFqqFkL8D0/J3/Uqs0j25TWADOhaKnwkIAkrYU8ltRN3w2VoY85FTEuFO
         lUcw==
X-Gm-Message-State: AOJu0YzO52agw1x8PwYPqWWNufuMqnIGqwoY6pd3jSaJPKlueJf89ZF4
	3ThLzJttPh8uFf6AgZFy9oRC9XwjZ3Zj2bbfEEAn4PBQWEwHYqv1a63LYReZD5F1bQOyQrhyOuN
	eLxDfH++oos+lL9Ocs7d8Jg==
X-Received: from edr4.prod.google.com ([2002:a05:6402:44c4:b0:692:18a5:3cb8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5293:b0:693:ee1:9018 with SMTP id 4fb4d7f45d1cf-695474c4c20mr1392906a12.28.1781690107629;
 Wed, 17 Jun 2026 02:55:07 -0700 (PDT)
Date: Wed, 17 Jun 2026 10:52:38 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617095238.1530121-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Add missing hyp_enter when trapping sysreg
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_025511_351368_FF756C1F 
X-CRM114-Status: UNSURE (   6.90  )
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

Add a missing hypervisor event call for hyp_enter on sysreg trapping,
causing an unbalanced hyp_enter/hyp_exit.

The enum hyp_enter_exit_reason is not ABI, so we can keep the ERET
reasons at the end for clarity.

Fixes: 696dfec22b8e ("KVM: arm64: Add hyp_enter/hyp_exit events to nVHE/pKVM hyp")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index 743c49bd878f..5f6e6789d121 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -12,6 +12,7 @@
 enum hyp_enter_exit_reason {
 	HYP_REASON_SMC,
 	HYP_REASON_HVC,
+	HYP_REASON_SYS,
 	HYP_REASON_PSCI,
 	HYP_REASON_HOST_ABORT,
 	HYP_REASON_GUEST_EXIT,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 06db299c37a8..45a4abb9619d 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -913,6 +913,7 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 		handle_host_mem_abort(host_ctxt);
 		break;
 	case ESR_ELx_EC_SYS64:
+		trace_hyp_enter(host_ctxt, HYP_REASON_SYS);
 		if (handle_host_mte(esr))
 			break;
 		fallthrough;
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index c4b3ee552131..c84434e2349a 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -398,6 +398,7 @@ static const char *__hyp_enter_exit_reason_str(u8 reason)
 	static const char strs[][12] = {
 		"smc",
 		"hvc",
+		"sys",
 		"psci",
 		"host_abort",
 		"guest_exit",

base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
-- 
2.54.0.1136.gdb2ca164c4-goog


