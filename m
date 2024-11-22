Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215A6D75E25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W+gFQJsTATeSfAv/m9GGHSpYyzh9z7yQrFoDhSG221w=; b=3JmSTM3p22i9AsEmVb0WHdTlFc
	6sk/F1vqQ/r+IK+uD6P4hGbMkMqldIOib0xefU+5BT7G+jkikf/y8CdVyTgf0jxdBw3td9oXrf5Ic
	JcV9a93EtB6SGT/x/m5rL8boR5aDLHn0cBE4GOupFFwa+m13q2qVF2PgKaITT52KKpNK7yNXz6wWy
	MDFnxDCXg2dB+qdtGR5m9zufusXKac4cF+DDToRh97mNw7Qc4uK3gaXMc15RXEJzT9qbP5JWWvFlJ
	i8ERZum1Tc86TrXRvNtuZUziy09kBE59PvbQTSuzQ7kfEGviR6Js7r4NRG0KrURj7or+qQdQmFFCq
	d47gbLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERVV-00000002JWw-3kYE;
	Fri, 22 Nov 2024 11:07:25 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERUY-00000002JPq-44rB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 11:06:28 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4317391101aso14889175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 03:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732273584; x=1732878384; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W+gFQJsTATeSfAv/m9GGHSpYyzh9z7yQrFoDhSG221w=;
        b=gwqvI0plKi0o5ZWJzez9nnahYIE87EXgfkT0AYZG/B4r9viLn5GbT8KlypRf4mk/6k
         kYF/ycB5Uc6AYZiVSKK7f7A8jvEtFHKOcYYMVvScj9Yokc1KEIW31eAeLafJn82Dbown
         JtYlGcw7zBDRYKhn02o1VIjtrqgnSGNlTtEtHnW6Uz5CybDMkPViQ/sFmcCBapNgbydq
         hki0BdDLW6brlFVmeVPZHcGERAdeOIe/bwRWc47f6dPHy9Wg09XUoWqtRuiZ6UkwcZFE
         LAO4eXDeJ93IHN6vr/meK5xweMvkPq3b0/Cvx9oRD2xdQ/GAfjljS0IsqCHO0xxdepOM
         06nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273584; x=1732878384;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+gFQJsTATeSfAv/m9GGHSpYyzh9z7yQrFoDhSG221w=;
        b=n38paI2rgutFqYAHHjX/wMyvs7XOPG+F5aUxgh4b0qEIazLvCEzNVQWXjKo5RlQINc
         yP1hQMuk20bhBxFUJeRHRnTej34nnLsG11aZptQd5kkEcpT8w6gZ6Fo77joCAxhibrip
         F4sYcQWA/NorogsJS64iH80++7JsX7RmpdqFkz6mkIwhMXQwuXuTbMlPyk6gfuR+WXtZ
         32xlxdiQoNQym2+qFszByKTd/p8Bs6TE9N4qOglodjHkfrjwyl6TNdiBWG+eaWlrwMEN
         DV/dHaL/07XX5V/e9zZnYS/TlCC4K1EFlHPElljG6u+X3ufxA2+8yVVJR4puX4MBfjLw
         goOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU9YP5h/gyGcL1lWlyJfNWPCV4hQTTqg7QPQdUk3fh1Ecy8PqJiZ91+bzHuGYWzJLRhMJ+wEfzRuWWLn4T1ioy@lists.infradead.org
X-Gm-Message-State: AOJu0YyG5944QIMVZ567v3TqYkLJBB2E6cUssk7uFC6+WK1XVlrXIioM
	SUAVTsGjWiV+Wphy7b/vhtozCIR/R9DSla8IlI6b3+DRQw8ytkX5O19wTGBCz6qYoKBaxnSyzg=
	=
X-Google-Smtp-Source: AGHT+IG0t9w7kmbT8JNuZIEiuFugQ6HVGw6Cw0at25JfbkCNdt1E0H7W8wgVmXSbM0PTmKhnBEX/LThHng==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a5d:4082:0:b0:37d:5299:c401 with SMTP id
 ffacd0b85a97d-38260bc7d21mr646f8f.7.1732273584571; Fri, 22 Nov 2024 03:06:24
 -0800 (PST)
Date: Fri, 22 Nov 2024 11:06:10 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241122110622.3010118-1-tabba@google.com>
Subject: [PATCH v2 00/12] KVM: arm64: Rework guest VM fixed feature handling
 and trapping in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_030627_038630_9DD03E57 
X-CRM114-Status: GOOD (  15.04  )
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

Changes from v1 [1]:
- Calculating cptr_el2 is not based on
kvm_get_reset_cptr_el2()(), since that complicates things.
- Added two patches that refactor cptr_el2 related code.
- Dropped unintentionally included patch.

This patch series redoes how fixed features for protected guests
are specified in pKVM, as well as how trapping is handled based
on the features available for the VM. It also fixes a couple of
existing bugs in the process.

For protected VMs, some features should be trapped if the guest
tries to use them because they are not supported (e.g., SME), or
if they are not enabled for the particular VM (e.g., SVE).

Initially, pKVM took the approach of specifying these features
using macros and grouping their handling by feature id register.
This proved to be difficult to maintain and bug prone. Moreover,
since the nested virt work there is a framework in KVM for
storing feature id register values per VM, as well as how to
handle traps based on these values.

This patch series uses the VM's feature id registers to track the
supported features, a framework similar to nested virt to set the
trap values, and removes the need to store cptr_el2 per vcpu in
favor of setting its value when traps are activated, as VHE mode
does.

The changes should not affect the behavior of non-protected VMs
nor the behavior of VMs outside of protected mode in general.

This patch series is based on kvmarm/next (60ad25e14ab5), since
it requires the patches from the series that fixes initialization
of trap register values in pKVM [2].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20241120105254.2842020-1-tabba@google.com/
[2] https://lore.kernel.org/all/20241018074833.2563674-1-tabba@google.com/

Fuad Tabba (12):
  KVM: arm64: Consolidate allowed and restricted VM feature checks
  KVM: arm64: Group setting traps for protected VMs by control register
  KVM: arm64: Move checking protected vcpu features to a separate
    function
  KVM: arm64: Use KVM extension checks for allowed protected VM
    capabilities
  KVM: arm64: Initialize feature id registers for protected VMs
  KVM: arm64: Set protected VM traps based on its view of feature
    registers
  KVM: arm64: Rework specifying restricted features for protected VMs
  KVM: arm64: Remove fixed_config.h header
  KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
  KVM: arm64: Calculate cptr_el2 traps on activating traps
  KVM: arm64: Refactor kvm_reset_cptr_el2()
  KVM: arm64: Fix the value of the CPTR_EL2 RES1 bitmask for nVHE

 arch/arm64/include/asm/kvm_arm.h              |   2 +-
 arch/arm64/include/asm/kvm_emulate.h          |  14 +-
 arch/arm64/include/asm/kvm_host.h             |   1 -
 arch/arm64/include/asm/kvm_pkvm.h             |  25 ++
 arch/arm64/kvm/arm.c                          |  30 +-
 .../arm64/kvm/hyp/include/nvhe/fixed_config.h | 223 ----------
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   5 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 313 +++++--------
 arch/arm64/kvm/hyp/nvhe/setup.c               |   1 -
 arch/arm64/kvm/hyp/nvhe/switch.c              |  52 ++-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 413 ++++++++++--------
 11 files changed, 415 insertions(+), 664 deletions(-)
 delete mode 100644 arch/arm64/kvm/hyp/include/nvhe/fixed_config.h


base-commit: 60ad25e14ab5a4e56c8bf7f7d6846eacb9cd53df
-- 
2.47.0.371.ga323438b13-goog


