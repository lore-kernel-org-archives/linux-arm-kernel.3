Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8073FD69105
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1TtG2bGm1kTJQrBMkxcresYx07XYbMxLIekhY/ZS7PQ=; b=dUa0T2P/F0t+lTs3F0Xj35h/XW
	lC5LZeQ+63pBf+yfs7iLW9zTiLbv81LyR+WY56RVUJ7GkLXxlBvZNnx+sAWp0OOO1e9Zrv/YHdz0c
	KJItggOmXfkZapsDfZHImbIm2+5OqNNRPZ+qT13hREeM/Vd2WB2ZIUJj90i8TqVDkAhMNFyiHU0uX
	n/QptNhO+96rHJ6HiWPB3VqviOrYFW9xYbbTbybmFqqVLDbzhOETPTSOO+CY+kAvtzndKlSla9ngB
	b52FUPin18bfpjC17bajQHGjrmMHquhmdlsl6qnyOhPKOQTYbUwG1E1kqgpUs3rn0KpjRtA9WMa94
	AAtLGj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdkq-0000000FVSL-2pKL;
	Thu, 28 Nov 2024 12:36:20 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdjr-0000000FVJn-2PS5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434a90fecfeso6153105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797317; x=1733402117; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1TtG2bGm1kTJQrBMkxcresYx07XYbMxLIekhY/ZS7PQ=;
        b=RsW+3ONo/NXKwxW+iIagBA+yrnXOk6vgCDHUdqb0xuiK5quvGOuFUNns0SZoD1bIPW
         CfSD12TfheMCnXn5siy0Ya8cXaKWqaJaG7JiwMk7a3SGBerROmE9Ue17LqPy77h5QReS
         SF9i2emJ5QCITXAj3vlnOJhh16+xDP7kKzot7EpUk1BFrMH40Pi4a78KJTZysAnwVVHk
         VlMOzuJcgw5HzuxuO2si1hx/+oVynywcRGGO3tXJBC44gL4cQT7jOCWXGX8sx5PqlyYv
         CSzgJNx3miRv5A4MTxP+MNaGnp+a5+zIi3BxOyZhSeW7FA5qku4TiDUe2Cj2WoLZUKvx
         5+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797317; x=1733402117;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1TtG2bGm1kTJQrBMkxcresYx07XYbMxLIekhY/ZS7PQ=;
        b=sztlw5wNDMhlOAPTwJeNXMJQNXyeB1WEFzhPafxmNSEY+2On1Y5M7XP+8x1Ml6u6pN
         50h5YgYrcA15A+PSk+D8TZyuWE6fkj/tXNBtDGP/m5cl05Ecb0+lQ5EdjbqZQ67XNXca
         s6Hm0SZSEl6YuPVYF7KOSaRpBS8Htm9i0OBxOTxLFOXLKvT2J/20dqU/Ik+y5Adwrrh8
         PycYEWOJCU/8dNTMqGkUXZQzljUo5CFl8ZFLcr4m5ys1DE0SQMrq5l1TqjRxbtluzRi3
         xagzyvAAmd8GgE+tnx0JFPUMb7gSSj3AAXtMM7ZhUieX6uCpaqCpXTc6RM8bU4/o61J4
         UJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrQmToGrKfJuRdwe4TDmCjst+GGcTHw5eaq8wsqqbGgBylrO0ogGyEAl590UU0+CMb8EdqrTK/rg/+MgvBJlxo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhkvf9N5SFySejvJoFog8b72+Dyq6lTEq3SWit0GA6srJG7mL3
	idi7rn7yxPuEicaDkHXjQ3nPBZJFm+CKVLDfCKDwh1PeuLRNUK9V2Z1DWl9oLNbg7VzSgX1f6w=
	=
X-Google-Smtp-Source: AGHT+IH2IM4W6WAIgVMbLGWBStWlI0DvrysFqeCP5tUZqsjNCDTaw1hNxBdBrk8TZXf/mO/x+4ENDxn6Eg==
X-Received: from wmgg28.prod.google.com ([2002:a05:600d:1c:b0:431:5888:7a68])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:474f:b0:431:54d9:da57
 with SMTP id 5b1f17b1804b1-434a9dfbc15mr70053905e9.30.1732797317110; Thu, 28
 Nov 2024 04:35:17 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-1-tabba@google.com>
Subject: [PATCH v3 00/15] KVM: arm64: Rework guest VM fixed feature handling
 and trapping in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043519_615528_5AFE875E 
X-CRM114-Status: GOOD (  15.93  )
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

Changes from v2 (Marc):
- Added three patches that remove the per-vcpu flags of PtrAuth
and SVE being enabled for guests, in favor of them being per VM
- Tidying up

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
storing feature id register values per vm, as well as how to
handle traps based on these values.

This patch series uses the vm's feature id registers to track the
supported features, a framework similar to nested virt to set the
trap values, and removes the need to store cptr_el2 per vcpu in
favor of setting its value when traps are activated, as VHE mode
does.

The changes should not affect the behavior of non-protected VMs
nor the behavior of VMs outside of protected mode in general.

This series is based on kvmarm/next (60ad25e14ab5), since it
requires the patches from the series that fixes initialization of
trap register values in pKVM [2].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20241122110622.3010118-1-tabba@google.com/
[2] https://lore.kernel.org/all/20241018074833.2563674-1-tabba@google.com/

Fuad Tabba (15):
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
  KVM: arm64: Remove PtrAuth guest vcpu flag
  KVM: arm64: Convert the SVE guest vcpu flag to a vm flag
  KVM: arm64: Renumber remaining vcpu guest configuration flags

 arch/arm64/include/asm/kvm_arm.h              |   2 +-
 arch/arm64/include/asm/kvm_emulate.h          |  23 +-
 arch/arm64/include/asm/kvm_host.h             |  21 +-
 arch/arm64/include/asm/kvm_pkvm.h             |  25 ++
 arch/arm64/kvm/arm.c                          |  30 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h       |   2 +-
 .../arm64/kvm/hyp/include/nvhe/fixed_config.h | 223 ----------
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   5 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 335 +++++----------
 arch/arm64/kvm/hyp/nvhe/setup.c               |   1 -
 arch/arm64/kvm/hyp/nvhe/switch.c              |  56 ++-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 402 ++++++++++--------
 arch/arm64/kvm/hyp/vhe/switch.c               |   2 +-
 arch/arm64/kvm/reset.c                        |   6 +-
 15 files changed, 430 insertions(+), 705 deletions(-)
 delete mode 100644 arch/arm64/kvm/hyp/include/nvhe/fixed_config.h


base-commit: 60ad25e14ab5a4e56c8bf7f7d6846eacb9cd53df
-- 
2.47.0.338.g60cca15819-goog


