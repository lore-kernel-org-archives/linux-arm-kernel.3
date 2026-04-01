Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FD7D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wm1IdxU+STCksWGBkUITwVrqTDoqeENYUSliBBXIr30=; b=uHJszbH2j0Q/JLFmNUUm6wBR9G
	mz9ePYTs0syUCsTo8XERasjzPGT1NZn4NMbECcP6q38zlQeest1u877Y2n9pM3Dq3K96iQPzBNv7k
	FhPm2ydGiab4V7XMifg+VDsby6BWPRQpG6c/QogSNBWptUaTPPUglY8JZ4spxHKRTs3Z+FYGnFakL
	NnlEQ+lpQZ0RxU17Cr8Fkr9tA1ysmEiyMujDlbKsxn7QLo9bfAxaQO0KQtzDTK+Aqb77na/92C5th
	lpfbf5fqIWNXSgC/kynXV+JV0TaDg2yNW8ZDNt2esKJw7k21eGBmDCOuWxlz9J9o3wQHejHzYU1m4
	DSKv9G4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ur2-0000000FE7s-3N3r;
	Wed, 01 Apr 2026 12:39:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ujx-0000000F8Bd-3V4p
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 12:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wm1IdxU+STCksWGBkUITwVrqTDoqeENYUSliBBXIr30=; b=GQ+YpTEf7KlZF63NG4trjxwr8p
	IPaH+TMYLPrBnMV36QtzFIVOa109IOoyy6mZO+HwqIivqQYWWVeUpRXXGP9rH2enOinT5p7BDezZE
	7XJ+21Yds3awKLpVDd5sGEMmYr/119QiIC/lCxREJNUFLWsFq4Ih50K7GHVKytCiId6AWl8+72suN
	s7akhTfd/dzGK7A4uqX3LY8Rpt1qE7DnGNKdkcyxF2X8icPjrilGejxI1xyfh20V6wBxHW+gLueDk
	PkMKcFrXu+yC+u8Yt3SZNq8tYAYq4LPCgzcEZ+k49RP4KPZa8+7eALmqviFc7inhbMpTVwtRd8e/o
	t385LLkQ==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ujv-00000000LZN-00l7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:32:08 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43cff5bc312so2138157f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775046725; x=1775651525; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wm1IdxU+STCksWGBkUITwVrqTDoqeENYUSliBBXIr30=;
        b=N2HkIAieJsxbWzRF8sZaT3depeWugwmEMqs2KclSyw0cxH3AkQQQAQlletHQdPjIhD
         VnbRkJRXVUdvTq3pWipBioquhNxfibXd4VfGGZG1/tsPNIJzG2sktzqHDthpyNJZHaQd
         d95FQ9gHhry8I7s2ACZHErvAx2GsyF13eREvtDzTOn/jq19EIdbEiwXqqHrteSe3frx7
         j9ztcOCv53SnRe8p9Rcmj10cRo2GwpYqQgSl3EYnO6mNsuVRiPTA9D6UMJENgc61/mvK
         I+gXXd/WNEs9y7ksO/kjstZXJwlAbvskNBb+F0xtUP/3/R4dGxirqiThr94ExCbTbS0c
         +i9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775046725; x=1775651525;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wm1IdxU+STCksWGBkUITwVrqTDoqeENYUSliBBXIr30=;
        b=Ca3/PVjffjhw3KltU1tUJhS6N6hcoXTXseFNIXhHhcJt0e7//prO9ccfEtpRKmwaLS
         lPrWTpBwB0V4NMrPzD8jPIKqST+xzFR7dAz/EhTgO53PSQz9L0K/pqNDo/kjsxcH91pS
         Z72CZC5QUzaeQZ1P5GP8W36bsFipDSLySpJ9oXqHmUFXJxGjHrgiFQacXs0YCEoehgVR
         dpQzTdgfj+3lloG8FQk4geBI+0KhAs0NNsaFbveFApaT6vUn2gc7Q3/+5xEhzmSKZweH
         Z2uj3+yHveoZTr9CwCuK5HDsF5BCYVEqXOuFItS2l+4ZmjddOUvcchFPdvrzIvE+xLoz
         oT7g==
X-Forwarded-Encrypted: i=1; AJvYcCVrCeTPwtgfziRmuBR46iPFlpUix6ouI7bUi4PCe8Asw99W3ZfJwmQxpN7NqRBbLLaQRoHczZVW9UhV5IsfehPf@lists.infradead.org
X-Gm-Message-State: AOJu0YyYXpwotRAzAQyFitvCs9QmurTspTbejpqFqpRrciecTypQLb/I
	ONwLP293iJ03Ht74oyIU3J99p2LQQJRF5LOvoyHRGZBQfKchxHP/rF/1q0dQMVhYBzIkXLouknm
	9s04IDZsIEVrIYOe16Fs24frdDIIerw==
X-Received: from wmba9.prod.google.com ([2002:a05:600c:6dc9:b0:487:201c:8d57])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:354a:b0:485:49c5:8eb7 with SMTP id 5b1f17b1804b1-4888359205dmr51064615e9.22.1775046724497;
 Wed, 01 Apr 2026 05:32:04 -0700 (PDT)
Date: Wed,  1 Apr 2026 12:32:01 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1185.g05d4b7b318-goog
Message-ID: <20260401123201.389906-1-sebastianene@google.com>
Subject: [PATCH] KVM: arm64: Pass a 64bit function-id in the SMC handlers
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: joey.gouly@arm.com, korneld@google.com, maz@kernel.org, 
	mrigendra.chaubey@gmail.com, oupton@kernel.org, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_133207_094293_465C0321 
X-CRM114-Status: GOOD (  13.12  )
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

Make the SMC handlers accept a 64bit value for the function-id to keep
it uniform with the rest of the code and prevent a u64 -> u32 -> u64
conversion as it currently happens when we handle PSCI.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/include/asm/kvm_hyp.h      | 2 +-
 arch/arm64/kvm/hyp/include/nvhe/ffa.h | 2 +-
 arch/arm64/kvm/hyp/nvhe/ffa.c         | 2 +-
 arch/arm64/kvm/hyp/nvhe/psci-relay.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 76ce2b94bd97..c9976425a85c 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -119,7 +119,7 @@ void __sve_restore_state(void *sve_pffr, u32 *fpsr, int restore_ffr);
 
 u64 __guest_enter(struct kvm_vcpu *vcpu);
 
-bool kvm_host_psci_handler(struct kvm_cpu_context *host_ctxt, u32 func_id);
+bool kvm_host_psci_handler(struct kvm_cpu_context *host_ctxt, u64 func_id);
 
 #ifdef __KVM_NVHE_HYPERVISOR__
 void __noreturn __hyp_do_panic(struct kvm_cpu_context *host_ctxt, u64 spsr,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/ffa.h b/arch/arm64/kvm/hyp/include/nvhe/ffa.h
index 146e0aebfa1c..21afca11ae0b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/ffa.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/ffa.h
@@ -12,6 +12,6 @@
 #define FFA_MAX_FUNC_NUM 0xFF
 
 int hyp_ffa_init(void *pages);
-bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id);
+bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u64 func_id);
 
 #endif /* __KVM_HYP_FFA_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 94161ea1cd60..87e6d36f120a 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -862,7 +862,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
-bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
+bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u64 func_id)
 {
 	struct arm_smccc_1_2_regs res;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index c3e196fb8b18..79f390057c19 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -278,7 +278,7 @@ static unsigned long psci_1_0_handler(u64 func_id, struct kvm_cpu_context *host_
 	}
 }
 
-bool kvm_host_psci_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
+bool kvm_host_psci_handler(struct kvm_cpu_context *host_ctxt, u64 func_id)
 {
 	unsigned long ret;
 
-- 
2.53.0.1185.g05d4b7b318-goog


