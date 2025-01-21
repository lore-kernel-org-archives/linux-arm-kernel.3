Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15BEC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 04:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W6HslTJVcoTc76NPV/AhEAAiVSfWCRn3Y3i6yxgDWLg=; b=f9B2HIViXL71VvJRVOedPd1ljJ
	iD0+BwrVErck5sWV24D0w5hHDfkLeQ89nQUSTo7sA2LaJUXNuxZp5Abb6EhyhkWliHMbo0qhe1QbV
	W4gsfkLmb8ngSfUPUFacExDjFRzJYIMhHGylihAfvPmQYbeHhHMegmOKIYXyAo1mtJJ7UveY/FZf1
	a/U3f4P09KjgfeAoYI11op4KM7Cye7A6pKH7s4SSrGdo5Fik+NX/VkS+/bLUolDKDfzBr9YDb459f
	R0RUTk8cDUSArEMT+29+1LlcMEc0INY1NbbrtXy8xgdM0YgUk/94OXuTC7EFWXPx0iWCLt6x5ILp4
	f/bO1gAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta65C-00000006skK-31It;
	Tue, 21 Jan 2025 04:41:46 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta63t-00000006sf5-0xLD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 04:40:26 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef80d30df1so9603720a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 20:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737434423; x=1738039223; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W6HslTJVcoTc76NPV/AhEAAiVSfWCRn3Y3i6yxgDWLg=;
        b=rKRKtFXKAiJXHl7hob3ECK30rPjD4g3U7m5wLOO8/uZZJVmm2YJ/tOTyZxZYnyjcsd
         eh+FbLXPMWSghn79t+unXgCZzbHXewfSXC8qx9eLTOOWK0PP2tQMmt3s8eclvGIwo0mG
         k880Tee7zP1+k1DyO0pWsxSp6rSxwjIbOTJk04frbEvhCTjPbcZFqP0ghCt7CooNbax8
         D/FBcbNTwul3F5iH/N8Ul/GTiAiuTUimqfss3y5ilQK/Xr9ofDaaXcG1tFg95US941de
         kJuhE7ogiRDfhgUGhX7xNefuYX7UcLgOFCemfJUhP5GandrCEM+65dmOzKeG5np2Whmn
         61kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737434423; x=1738039223;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6HslTJVcoTc76NPV/AhEAAiVSfWCRn3Y3i6yxgDWLg=;
        b=In3LzYWc5KwhaauB+GUpGN5/i6udxTyQi5lFHlQZscupyf4z0FCQv95YbCXoIsHZO/
         3CFxCYGKQH385+y7xjaqeSi2RdrOyQLm8X0dZrn3m5jtaTNZ7uHu1PgY198EkM8xrCD8
         QGLJp0WpkOhlFO0Jx0ZFzQ4KZY/QoCQ7vuTfVWP5ZeCgMNmm+HY7OWX4pP2EasN9eBsS
         AAXqCCWM1749Jwb3U4E21Db8vV1J8fyh7MP7AnfD35TEiLz50U/IbtSrrctE2cv2KMwa
         5luxbgh6fgWJ3hVZDIlgMlrBIBpd7eWSdeHtRI6HNcYr97nokeH7OPLr6thXzEtpMmST
         zPRA==
X-Gm-Message-State: AOJu0YwGTAy7nGs4QAF5XwiGxYUV4PLOTzXTz7/UEEWoWSrX8gYPTyvI
	PA2VWTDoAvR4D1w+G8/XHId4u6IQ7RSSZot6ITkGBHo0jb2Iism1iw6gioZSKfFc9PCxacnWZ8m
	ClMvuqLn57fyi/Jlv+DBC6g==
X-Google-Smtp-Source: AGHT+IF4p997QdwvM0SsDbErEoy+U/aICq4fFswhgZuSPgNMtUKRK4y7HpGvS1wx8IpyVVRWtWkg/psQwIA3R5wW3Q==
X-Received: from pjoz4.prod.google.com ([2002:a17:90a:9804:b0:2ea:3a1b:f493])
 (user=lokeshvutla job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e06:b0:2ee:d824:b594 with SMTP id 98e67ed59e1d1-2f782d8ccdemr21933409a91.31.1737434423306;
 Mon, 20 Jan 2025 20:40:23 -0800 (PST)
Date: Tue, 21 Jan 2025 04:40:16 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250121044016.2219256-1-lokeshvutla@google.com>
Subject: [PATCH v2] KVM: arm64: Flush hyp bss section after initialization of
 variables in bss
From: Lokesh Vutla <lokeshvutla@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	lokeshvutla@google.com, sachinparekh@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_204025_269272_349DECDB 
X-CRM114-Status: GOOD (  12.41  )
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

To determine CPU features during initialization, the nVHE hypervisor
utilizes sanitized values of the host's CPU features registers. These
values, stored in u64 idaa64*_el1_sys_val variables are updated by the
kvm_hyp_init_symbols() function at EL1. To ensure EL2 visibility with
the MMU off, the data cache needs to be flushed after these updates.
However, individually flushing each variable using
kvm_flush_dcache_to_poc() is inefficient.

These cpu feature variables would be part of the bss section of
the hypervisor. Hence, flush the entire bss section of hypervisor
once the initialization is complete.

Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
Suggested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@google.com>
---
v1: https://lore.kernel.org/kvmarm/20250120151514.1769597-1-lokeshvutla@google.com/
- Applies on top of Linux 6.13 tag.
Changes since v1:
* Updated Commit message based on review
* Updated kvm_flush_dcache_to_poc() to call from kvm_hyp_init_symbols()

 arch/arm64/kvm/arm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a102c3aebdbc..caacb2da8e09 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2410,6 +2410,13 @@ static void kvm_hyp_init_symbols(void)
 	kvm_nvhe_sym(id_aa64smfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64SMFR0_EL1);
 	kvm_nvhe_sym(__icache_flags) = __icache_flags;
 	kvm_nvhe_sym(kvm_arm_vmid_bits) = kvm_arm_vmid_bits;
+
+	/*
+	 * Flush entire BSS since part of its data containing init symbols is read
+	 * while the MMU is off.
+	 */
+	kvm_flush_dcache_to_poc(kvm_ksym_ref(__hyp_bss_start),
+				kvm_ksym_ref(__hyp_bss_end) - kvm_ksym_ref(__hyp_bss_start));
 }
 
 static int __init kvm_hyp_init_protection(u32 hyp_va_bits)
-- 
2.48.0.rc2.279.g1de40edade-goog


