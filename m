Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C851CD7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bjiTluSApE4QpRIWQxXVru819UqevJvurrDBEPvS6Xg=; b=z9+hOneTQimQuKG9oiDRsvSy0d
	+MM7uh/ponehavxYoZnLlvaxKezDbzLaAI5+PpiANte0/vqL2BMTjeX2YOF22VEbdFZaG8towsn22
	dhZcfAzp0rY0Dc15iEgYvF0782/ML6V6+Y7r/MjCzLQxysB6fNt01Smm2BI86NrPiABtRgzk5Bmia
	8sDBIMbDa+WTXwP96OtbtWqYNiIbFYYzGwXemHwxDxEO1l0Z8aINri6RnI5Sfvab6om9d93ndSd0D
	l+y9D8Ht/jclj+F3YmS1lRKxdEubefYjnX1uSoiyJiCIdDFHEn716VAukhQKjZo8HgqNeRN/m0OVo
	G4LUQkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8lH-00000006k3e-0pf4;
	Mon, 02 Dec 2024 15:54:59 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8eI-00000006iQG-3Hrj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:48 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43498af7937so36814055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154464; x=1733759264; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bjiTluSApE4QpRIWQxXVru819UqevJvurrDBEPvS6Xg=;
        b=u901KvYTpN4cc+xoC1HKubCbYgI0rXR3KpkiwVsjdaLToVEroMABSnZjr80fA4BIW0
         Okv9TYvncHEqH6LUgtNB1oxb+DPxDnS8Ujr27TWcFD6Twpo87ooxBfhX3jiP2Z++rdr9
         cKsFrQJ7JrbTd/7JADOofTvFn3QnqkDQoONPUfRkXCis41QALpjgbkCrM5nRQlBzrBNt
         mG7HckJxRzeqlYP2gR0eJzVgqgQJ8krwuQJM0QHn/GOy79LZz4r5VVSVD/GNApNN5tdi
         LTfgEx3czkTpH4lLSssx6mO2f2e/ifLR7sXb0xx/M/G+jlVGWpnSMCrnu85l/lm/eblV
         iEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154464; x=1733759264;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bjiTluSApE4QpRIWQxXVru819UqevJvurrDBEPvS6Xg=;
        b=oTZGFTsx0PR6hKSt7c1o0hrrSu634jjadIOWzsEz4C+hygsMsKZqse9qoIpnZIq6Lt
         /ez0UiQTnJOkEyFoxV+sV9ZRS/lL+j+NYaLjrQ3pjmluCEH+ugKwukxz8eOz/ixaiDvZ
         o7ROFUt+PMuCr2ASWCYTAgmPqnUa41MoaUTPYC4ZaZ5MYl3AF4oPmrBQ0INRR0hUAsBO
         ZlUC64JtAJeFJq9twZx2PvsKrHNI//dRuHspOAFH/buUYXQAQUjGZmB3+RT2SDE3s/9c
         xzvZxrW2lrmleWuC2rgzToB40zhJlm6WUb1A9HiMtLyf0x6s1Se/CLs9PE0YWmaE2XM1
         CZLw==
X-Forwarded-Encrypted: i=1; AJvYcCXW2b8TaJEckVFZdCFsLoQ/NzyT9nMtMZ5cLgBKwCzysKub0ibS6+dCEUqpYRuKIIMIAEiIcWljVLHGiG5M0f08@lists.infradead.org
X-Gm-Message-State: AOJu0YwcrIF7RKZD8qR8dzPIDdM2xDXXiRKRbZOSZB4RC3IeAJsf6Jg2
	DhXw0IfkH8/G4NW0vIlWwieq+YRaQvshYYcH30ATWS8xyVVY5Zs9tpEtau5jskaIFG+90rozuw=
	=
X-Google-Smtp-Source: AGHT+IEehAlIwkgDnoP+30Lh36a78sD7bkaGZ0SiWd8FUwJmEufpy7JTsAy5OUDRqnNYsOnPWSsAGjex6g==
X-Received: from wmbf1.prod.google.com ([2002:a05:600c:5941:b0:434:a5c2:2758])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fc9:b0:434:a6af:79f6
 with SMTP id 5b1f17b1804b1-434a9dc7074mr226167815e9.15.1733154464069; Mon, 02
 Dec 2024 07:47:44 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:27 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-1-tabba@google.com>
Subject: [PATCH v4 00/14] KVM: arm64: Rework guest VM fixed feature handling
 and trapping in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074746_854769_6D72CB75 
X-CRM114-Status: GOOD (  15.73  )
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

Changes from v3 (Marc):
- Reduce churn from patch reworking SVE checks
- Fold in vcpu config flag renumbering patch

This patch series redoes how fixed features for protected guests
are specified in pKVM, as well as how trapping is handled based
on the features available for the VM. It also fixes a couple of
existing bugs in the process.

For protected VMs, some features should be trapped if the guest
tries to use them because they are not supported (e.g., SME), or
if they are not enabled for the particular VM (e.g., SVE).

Initially, pKVM took the approach of specifying these features
using macros and grouping their handling by feature id register.
This proved to be difficult to maintainbug prone. Moreover, since
the nested virt work there is a framework in KVM for storing
feature id register values per vm, as well as how to handle traps
based on these values.

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

[1] https://lore.kernel.org/all/20241128123515.1709777-1-tabba@google.com/
[2] https://lore.kernel.org/all/20241018074833.2563674-1-tabba@google.com/

Fuad Tabba (14):
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

 arch/arm64/include/asm/kvm_arm.h              |   2 +-
 arch/arm64/include/asm/kvm_emulate.h          |  29 +-
 arch/arm64/include/asm/kvm_host.h             |  25 +-
 arch/arm64/include/asm/kvm_pkvm.h             |  25 ++
 arch/arm64/kvm/arm.c                          |  30 +-
 .../arm64/kvm/hyp/include/nvhe/fixed_config.h | 223 ----------
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   5 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 335 +++++----------
 arch/arm64/kvm/hyp/nvhe/setup.c               |   1 -
 arch/arm64/kvm/hyp/nvhe/switch.c              |  52 ++-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 402 ++++++++++--------
 arch/arm64/kvm/reset.c                        |   6 +-
 12 files changed, 435 insertions(+), 700 deletions(-)
 delete mode 100644 arch/arm64/kvm/hyp/include/nvhe/fixed_config.h


base-commit: 60ad25e14ab5a4e56c8bf7f7d6846eacb9cd53df
-- 
2.47.0.338.g60cca15819-goog


