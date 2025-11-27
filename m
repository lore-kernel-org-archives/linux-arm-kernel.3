Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA94CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GVwrAr1o2bOF3/BWCpSgvLRZ2BQlyKlslZCDEV//lbY=; b=TiZgbPDDpwl2sF4C2tnagy57lf
	oR3F3TJWP9utq5WmCzLCD91MUbbdHQjzoQ1HvGPRjqbqXSGN6fVHVDVe10ynhWXVltAI0LqzLvR0P
	bKjDZbSPDlwrJHLdPnx1Hz2Z6woRCHhYR4iovv/M6KrKuEsQTW6ax7o75oN2+cfWZ3dHYXqWTDwzr
	q7pB6dX69Z1aDy1xAumpIbv22mDqMK8jXNQ3QWZlaKsC6WbHK3qA8uNVnT6oLWtKQJRhW84W+3TQR
	+umWM8d1zZUSfUQmYqhACq2m9lyztK5BUDHKRvPBVt2SKhKilH+6WKIwRts5A0tZPE5tt2o+Ju6Mn
	7zm9enTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0p-0000000GXf9-2LKQ;
	Thu, 27 Nov 2025 12:22:15 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0n-0000000GXeQ-2TMa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:22:14 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4779ecc3cc8so4459445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764246131; x=1764850931; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GVwrAr1o2bOF3/BWCpSgvLRZ2BQlyKlslZCDEV//lbY=;
        b=cx8mJBZvELHDNK1HhiueSynxxdqIsvEZOX0p7R6Zhbg1qIoevxcVrMwI9/7X9+jWgA
         tdka/z6HGhkovsAy9jA2iawiLg7UE+15PsBgwvzfshGxERNsbd5IciCtnkk3YpzbkL04
         dJB/B8KYTbH1ZLh+8jE6EYjP1nOaE/tZfGNze/zpgxXKhutiz/pJo8voYVZ7eQZGfrN1
         6eMWY9JfK3x+j1k/m7MCUuoO3eV5SWAvy9A+8k/1GC2oWb0EBrgYmusUoJc2bjj3KcqX
         FpNwl0WwvjotDeh1raMB2KCXVpwIw7gMYZvOnKmCFEGHrCJnJKEIEbC319gwgCqhIeLl
         gzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764246131; x=1764850931;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVwrAr1o2bOF3/BWCpSgvLRZ2BQlyKlslZCDEV//lbY=;
        b=hE/qvmTJKY5SIGtXIK22+Ug78PdnKCDblk4pEMRGJcvN+2w0dP6gH+ol9963LEu/gG
         UZs607jbsq+uW4KsxaZbSP//emOz6o1cCJRTipIqwNUBhbjO/LU4ajioQdd6+3Nh9WDL
         R1xnpkBu3pmxHA/ubYdVuMB7W7dXrkcfsPWlu6h779Ha3n6SS56OJZHjLdQ0+UQLoLV5
         rL6qaoBhVYqON+TEFlRideZlwanL1jIVJWHTKe+rGX5cpZsQWsaCoQpyOMmhT8w4sHem
         Gj3iY6/eLBo8TyvmKKutnWP5POM9bHJtZEG4NujLFTD4a4yLz2L9rwFB8b2Gi0taEEFZ
         vyIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhhgV1k2hJnB4/ZmDvJepLuxwFhPPP86O1DcTQgObjxtv/aIFdLtTFxyrxdJ//+gEs2rcwhUDgysc/025mz/Oz@lists.infradead.org
X-Gm-Message-State: AOJu0YyZS4xd5QDIOqm8JDB44g8dLMoR9p4vBLMKVRPOERkDI6sfcCJ8
	ddxvnFCaS4ZAZcD/Y6PA2Kys+zLYbSchM9ILUrLVMufHv6Od76FMzXppYqdQSVhyVMoe5W9muI4
	0JQ==
X-Google-Smtp-Source: AGHT+IGc06Ksqz3q4KmChSDnqiNh6zGUCebNu9RwNyylVq1cMFdJSKjWUp6H3EkpXI5zoXsi+pYNq3SHSQ==
X-Received: from wmlm20.prod.google.com ([2002:a7b:ca54:0:b0:477:9aa2:7d50])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b96:b0:477:5c58:3d42
 with SMTP id 5b1f17b1804b1-47904ad907amr115795665e9.10.1764246131094; Thu, 27
 Nov 2025 04:22:11 -0800 (PST)
Date: Thu, 27 Nov 2025 12:22:05 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Message-ID: <20251127122210.4111702-1-tabba@google.com>
Subject: [PATCH v1 0/5] KVM: arm64: Enforce MTE disablement at EL2
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_042213_674361_03311725 
X-CRM114-Status: GOOD (  13.58  )
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

pKVM never exposes MTE to protected guests (pVM), but we must also
ensure a malicious host cannot use MTE to attack the hypervisor or a
pVM.

If MTE is supported by the hardware (and is enabled at EL3), it remains
available to lower exception levels by default. Disabling it in the host
kernel (e.g., via 'arm64.nomte') only stops the kernel from advertising
the feature; it does not physically disable MTE in the hardware.

In this scenario, a malicious host could still access tags in pages
donated to a guest using MTE instructions (e.g., STG and LDG), bypassing
the kernel's configuration.

To prevent this, explicitly disable MTE at EL2 (by clearing HCR_EL2.ATA)
when the host has MTE disabled. This causes any MTE instruction usage to
generate a Data Abort (trap) to the hypervisor.

Additionally, to faithfully mimic hardware that does not support MTE,
trap accesses to MTE system registers (e.g., GCR_EL1) and inject an
Undefined Instruction exception back to the host.

This logic is applied in all non-VHE modes. For non-protected modes,
this remains beneficial as it prevents unpredictable behavior caused by
accessing allocation tags when the system considers them disabled.

Note that this ties into my other outgoing patch series [1], which also
has some MTE-related fixes, but is not dependent on it.

Based on Linux 6.18-rc7

Cheers,
/fuad

[1] https://lore.kernel.org/all/20251118103807.707500-1-tabba@google.com/

Fuad Tabba (4):
  arm64: Remove dead code resetting HCR_EL2 for pKVM
  arm64: Clear HCR_EL2.ATA when MTE is not supported or disabled
  arm64: Inject UNDEF when accessing MTE sysregs with MTE disabled
  KVM: arm64: Use kvm_has_mte() in pKVM trap initialization

Quentin Perret (1):
  KVM: arm64: Refactor enter_exception64()

 arch/arm64/include/asm/kvm_arm.h     |   2 +-
 arch/arm64/include/asm/kvm_emulate.h |   5 ++
 arch/arm64/kernel/head.S             |   2 +-
 arch/arm64/kvm/arm.c                 |   4 ++
 arch/arm64/kvm/hyp/exception.c       | 100 ++++++++++++++++-----------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   |   5 --
 arch/arm64/kvm/hyp/nvhe/hyp-main.c   |  44 ++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c       |   2 +-
 8 files changed, 114 insertions(+), 50 deletions(-)


base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
-- 
2.52.0.487.g5c8c507ade-goog


