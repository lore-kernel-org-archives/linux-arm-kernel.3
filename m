Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AF7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LgbAV7Db884sdO2wBFSay1l144nmKC6A4dcsE5Jnxg8=; b=B0xpDMDHD2JHFh51U+jFxOiJig
	BKRURXRFOvJ+Vl+Qs7mAAvyocc9Xc6i0dpxvhd6MnhdUlaApuS9UMd6cwf0cu1VNcDcTtmNVBTnMs
	IxleQpHn95I74A6uX8Eb7xfE33RQY/834sCZ8jb2wmWHwcrKmDuIIq76AOtU8x4ldONyfLZW6jynZ
	C5OLtUIGBPJBGvWfBJyBtLAfDcsaEdr4SSxhcylyDspVoyKQJpSCS54YOjAkc8eYRKuOqgv9ZfqLq
	uaofKZ925GBAdlOh5bZY6Stdr0E/JkWRTgnvFKW1bYZfxHJe2HFKHK+bCmA7Os8LeLumZGfQCvuNq
	SC3XyRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1me-00000002zFx-131Y;
	Wed, 01 Jul 2026 20:43:48 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1mb-00000002zEd-106H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:43:46 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-495b0cf250dso1046486b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782938624; x=1783543424; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LgbAV7Db884sdO2wBFSay1l144nmKC6A4dcsE5Jnxg8=;
        b=BgYx5FCO9y/f39XJtEUvkC1KXtpFYIknDlxGHl87s7v5HaAIS2J8i7Zh1F9KTeSAZ0
         6AMg5Ds87JTlwwqesdwAI2Oyu5eKb7JMK+/6XaHFirMHHv61Xr4PZwQkDv6kLoej5h2C
         2YWzvOEHGYRCqkCK2fFHyi4SMvBTxxXR/XkGfig65n3OPMNBxT7Gi+PA3FuhSc20iyhb
         +W19WUJQRIUwMzdjhJJF4T9zjvlshlqWrIrb+wHhrpylKY96UvdHIFvkECwq0ru8y7Pp
         a+HsKSXe4LR+bsEQOj0FddIP0zp0VBLP4mjs4KJEFjEW2P7kcasMC8j5DKDIm5E/X0TD
         if9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782938624; x=1783543424;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgbAV7Db884sdO2wBFSay1l144nmKC6A4dcsE5Jnxg8=;
        b=aXZlVCHtx32ugzYoLuH9ec1wxZy0dL77IAKdZiXI7dcPUzxYm81f03q2VJrpkVwXSl
         9/vmaqD5mA01AU9+BqLbyhLFG5dkmxk+IH5XWhB1yMlpCxWrJNrv1Ezp2Ue9RitJ0YRh
         cbDF3oom0udIFuAMzOayMmmNiJOG9Rd0AYdnH2x5UXo1SDl7qDxMwhSFPt7AEPLmPN1Q
         /upMEk0A2HJmZgeeOX1Y0ApyT7xxbmRWQOKyQo7116RCJvgHtd00JKTysuoneQAFz/wA
         JUUujXZPhAgo4pn3dynsJpAn/3ttGAk75f2irP6+H2ByZQN1ydQiJ0vV8FDhhF8Z1rM5
         aELQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HKcsRpe2HFJ/x4oEZHmkAoy/ZFSW4soRrcQWFgZbSYYqTYrC+9Umvh2Djh2lIpF3yNPE+QYT5UmtXsPH3iF3m@lists.infradead.org
X-Gm-Message-State: AOJu0YxD3AP8er8GBxYmudsAXrQf4qUTr0LfvdikpJVC7PFUo91sA+/s
	VJzLkX2gZ6UJfopBPsnHjJP/gCK8mWP1fHUZlAJ49r4Ygl26XHG0BdRpN+gwlNUC98mjrjbAa2w
	alfsxbFArA/N5v+vguaym1To3Fg==
X-Received: from jablt3.prod.google.com ([2002:a05:6638:ac03:b0:5e7:3fde:8787])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:10d2:b0:496:b7c:274b with SMTP id 5614622812f47-4960edef744mr2368951b6e.19.1782938623414;
 Wed, 01 Jul 2026 13:43:43 -0700 (PDT)
Date: Wed,  1 Jul 2026 20:43:37 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260701204342.2654385-1-coltonlewis@google.com>
Subject: [PATCH 0/5] Backport ARM64 VHE boot fixes to 6.6.y
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_134345_306769_5B6FBFC9 
X-CRM114-Status: UNSURE (   8.44  )
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

This series backports VHE CPU boot fixes to the 6.6.y stable branch.

These fixes are already present in the 6.12.y stable branch (and
newer), but are missing in 6.6.y. They are required to enable booting
L1 guests with nested virtualization enabled (kvm-arm.mode=nested).

Without these patches, a 6.6.y guest boots with HCR_EL2.E2H
incorrectly configured (because it misses VHE-only detection or early
initialization), causing early boot hangs/trap loops.

Conflict resolutions:
- Patch 4 (KVM: arm64: Initialize HCR_EL2.E2H early) had conflicts in
  arch/arm64/kvm/hyp/nvhe/hyp-init.S due to differences in state
  initialization. Resolved by extracting EL2 state initialization into
  __kvm_init_el2_state.
- Patch 5 (arm64: Revamp HCR_EL2.E2H RES1 detection) had conflicts in
  arch/arm64/include/asm/el2_setup.h. Resolved by using raw msr hcr_el2
  instead of the missing msr_hcr_el2 macro.


Marc Zyngier (4):
  arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
  arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is
    negative
  arm64: Fix early handling of FEAT_E2H0 not being implemented
  arm64: Revamp HCR_EL2.E2H RES1 detection

Mark Rutland (1):
  KVM: arm64: Initialize HCR_EL2.E2H early

 arch/arm64/include/asm/el2_setup.h | 52 ++++++++++++++++++++++++++++++
 arch/arm64/kernel/head.S           | 17 +++-------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 16 +++++++--
 arch/arm64/tools/sysreg            | 37 +++++++++++++++++++++
 4 files changed, 107 insertions(+), 15 deletions(-)


base-commit: d1cfde2d5d15be14123bdd1689162bd27f995a90
--
2.55.0.rc2.803.g1fd1e6609c-goog

