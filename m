Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB83C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 15:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4TuVoRxbmBAi8V9yz3BH7EQYWTzmh03R9kdlOoAvRf4=; b=D9zyJCGV+1A1R6Yz0opsMyxtpL
	GbYnbsQHLA7au/4dckZKtzjwovkH+fg0ni+CpLAyVD0E8cPqW5YoEY+iV99V9H67Wl/d2Za0PleTk
	wqEIj7nYHrk7w0HiFH/m7eVY8EeVCOrfzYp2NEUEiLE9B3axUmju0D3btyBT/hltdf4oNlSimCwOR
	isQQIWx4oyHMekuDvRm98GxyFk2NLC7GG1M2/G0lk5378a96GeUGx3ZFWe+Uka5xNgqp2w84OYhOH
	4kpaGIdfAuTS/d8TOxcWkB6ucz1lCSi7dd0oBmMND1v0skitqoV9cRos7OuM24GvRBYbAVYMcxXrR
	9ohlG2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtW5-00000005s4I-39ty;
	Mon, 20 Jan 2025 15:16:41 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtUo-00000005rwe-3UL5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 15:15:24 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-21648c8601cso81093375ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 07:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737386121; x=1737990921; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4TuVoRxbmBAi8V9yz3BH7EQYWTzmh03R9kdlOoAvRf4=;
        b=w1L+VWF43RoWtXBaMO5sCG5NAb8wQg23tB/Xl9gxzRHiYLN41bGSSUWX1LVVbMlhMG
         xRq75V53pEbDgqFCFVp05nreTsi/wGEsqQJX0HaSug0d3knupRfGQH4tiW9KDO/Ikg3q
         O/ZszbLmwM5DHCQlLCZEZmcevl0d6b1q9i4e/hvV1pEOmAvt/4pgTWep3rKjyCe1xbSX
         arpjihDsn7714hOdMYvhBlPna/NbtRxjEiTwzKcmseGptb2G2blpny+hVCnEHt67Mw5P
         kXOZO4EK2eo4+x9cVMbdcofVasmX/loSThdEzlWRWXHHOJOzWRGOSTsJ2kG3o3Ni5PNf
         rtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737386121; x=1737990921;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TuVoRxbmBAi8V9yz3BH7EQYWTzmh03R9kdlOoAvRf4=;
        b=sQm9Dxw19SQdXPoA01uK+M8os+8rQTQGUTzb1faIPBjRpLx3elRz+8cIRzuhFSheIr
         Z/bZSTVQ5pIeopcKw5necTuJY9zHZVi4iGKMvtevp5p0IcDThA5OFMtp45sRdlm92n7U
         xwSChDTyG7Mlias4xLo2rXYC9cCqGA9MlW8W5ms3CbMLvasgSfs4czOkTZd+RZc+Q7qM
         PLgQ/1dLbfIRePVOLVrQBxsKsRXa8TZZkXdhl3hfM10k3U1FMNaVPRHmC+kpgNH2QEBD
         GfYwoDsYKOW360I6MGwnYnWMw9PtQ76D9Yo6Q7/OemDgPw3UKYkesQcNfo9MrXK5mPa5
         1h8A==
X-Gm-Message-State: AOJu0Yze93JIxGB6px0wTBtQ+0F2hgWu5c+ED8h6FQ6hwQJ4I6Ols9JS
	6AfqYk+HdZ78wdb/VWAahI/5w7S/YzBOs5SOvvhCw9SnvePGIARBwQUevRqJ7SS03yfDn9kMbb1
	cWoiPC+Q3HBD0DWgelC3xrQ==
X-Google-Smtp-Source: AGHT+IEB6IUiwIoCs5Sc+DChuXGkEKi5mHklCEPpk0MnpLMCkgKj3oeKL3Yaotz5jBykfGlrNQfXbcL42khmPtQ73A==
X-Received: from pgbcm6.prod.google.com ([2002:a05:6a02:a06:b0:801:d783:5f1e])
 (user=lokeshvutla job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d510:b0:212:5786:7bbe with SMTP id d9443c01a7336-21c3550e908mr223507475ad.24.1737386121377;
 Mon, 20 Jan 2025 07:15:21 -0800 (PST)
Date: Mon, 20 Jan 2025 15:15:14 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250120151514.1769597-1-lokeshvutla@google.com>
Subject: [PATCH] KVM: arm64: Flush hyp bss section after initialization of
 variables in bss
From: Lokesh Vutla <lokeshvutla@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	lokeshvutla@google.com, sachinparekh@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_071522_870559_36BC44F8 
X-CRM114-Status: GOOD (  15.26  )
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

To determine CPU features during initialization, the NVHE hypervisor
utilizes sanitized values of the host's CPU features registers. These
values, stored in u64 idaa64*_el1_sys_val variables are updated by the
kvm_hyp_init_symbols() function at EL1. To ensure EL2 visibility, the
data cache needs to be flushed after these updates. However,
individually flushing each variable using kvm_flush_dcache_to_poc() is
inefficient.

These cpu feature variables would be part of the bss section of
the hypervisor. Hence, flush the entire bss section of hypervisor
once the initialization is complete.

Motivation for this change:
* Since the existing variables are not flushed from EL1, the
  id_aa64pfr0_el1_sys_val is seen as 0 from EL2.
* based on this value check_override macro in hypervisor skips
  updating the sve (cpacr_el1) at finalise_el2_state.
* The default value for cpacr_el1 enables the sve traps to EL2.
* With sve enabled, during the context switch from EL0 -> EL1 (which is
  much later in the boot process), the sve registers are saved/restored.
* Since sve traps are enabled, accessing sve registers at EL1 caused a
  trap to EL2.
* However, hypervisor is not ready to handle sve traps at this stage
  causing the below kernel crash during the boot:

[    0.320850][    T1] Run /init as init process
[    0.321392][    T1] kvm [1]: nVHE hyp BUG at: [<ffffffc08112ee8c>] __kvm_nvhe_$x.24+0x254/0x254!
[    0.321522][    T1] kvm [1]: Cannot dump pKVM nVHE stacktrace: !CONFIG_PROTECTED_NVHE_STACKTRACE
[    0.321635][    T1] kvm [1]: Hyp Offset: 0xffffff6e60000000
[    0.321710][    T1] Kernel panic - not syncing: HYP panic:
[    0.321710][    T1] PS:634023c9 PC:000000522112ee8c ESR:00000000f2000800
[    0.321710][    T1] FAR:0000000000000000 CPACR:0000000000310000 PAR:0000000000000800
[    0.321710][    T1] VCPU:0000000000000000
[...]
[    0.322251][    T1] Call trace:
[    0.322292][    T1]  dump_backtrace+0x100/0x180
[    0.322355][    T1]  show_stack+0x20/0x30
[    0.322410][    T1]  dump_stack_lvl+0x40/0x88
[    0.322471][    T1]  dump_stack+0x18/0x24
[    0.322523][    T1]  panic+0x13c/0x364
[    0.322578][    T1]  nvhe_hyp_panic_handler+0x148/0x1cc
[    0.322646][    T1]  do_sve_acc+0xec/0x260
[    0.322706][    T1]  el0_sve_acc+0x34/0x68

Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
Suggested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@google.com>
---
 arch/arm64/kvm/arm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a102c3aebdbc..5d3b2069a2d5 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2661,6 +2661,12 @@ static int __init init_hyp_mode(void)
 		}
 	}
 
+	/*
+	 * Flush entire BSS since part of its data is read while the MMU is off.
+	 */
+	kvm_flush_dcache_to_poc(kvm_ksym_ref(__hyp_bss_start),
+				kvm_ksym_ref(__hyp_bss_end) - kvm_ksym_ref(__hyp_bss_start));
+
 	return 0;
 
 out_err:
-- 
2.48.0.rc2.279.g1de40edade-goog


