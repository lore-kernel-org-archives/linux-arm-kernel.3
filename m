Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1225ECCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W3zZy85oW98LmzlLLVlNLP/kxDk+jUE3Sk+1kWzQBq8=; b=vyf5fiVkqlpCQL3rveL1QfqItT
	8Vr/kfSGrntRd3YP6xy9vXaC5LLVpujkNqkZ8RDx4Tv7dX5T9vjdYn5w0cqRiFAwljC1Ogi+9uVPa
	BTeQ5gJ+v8Fc8jA8ROz+Q6hIPGaJBxdhRsDRmaBvNoCNQLhx2eZTgoXfNUiZ/UczXqi5Qmb15dqUo
	J9O0IwSDM26LgXln3kjE2QX/Adq4aMZbohhQHUjHjOdlY5Y28lkVJCs7PyfTDTojnp32uZ2op4SAX
	AatXpFlqZGJT98Dk9FzDnP1TR4z85qlIQVyG4ZF9VY9Ipe3ZeLUdTv9yPJx023BV0vqPKxwtQMC5G
	q/voNINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLZo-0000000Dn4j-1drU;
	Mon, 27 Oct 2025 11:39:52 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLZj-0000000Dn0Z-0L1E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:39:51 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-470fd92ad57so55197025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761565184; x=1762169984; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W3zZy85oW98LmzlLLVlNLP/kxDk+jUE3Sk+1kWzQBq8=;
        b=cRd520nGGvGBN3WWVXWAUdpmTMJShL0dk47qfnK/PlrxtoMYNgUssLLhwrnRHHFWs/
         shOv8jaGmPt7L7gJaXAtYsfVOl6Cg9Mzry+kA8z8yTiB4LUq6sa5ZlLdDt1jGWhAHc1b
         1GTk1zdZeNk7TWOaj1+16siMdxDuNYzbcBx5FOAQhAohkeyjzKf35ejgEc5hwbdiRbTW
         lx2Ys5HOvMzAHkVaK5Wr2QttHRvW85kYZI0TSOCKCy2pT7QPJTaGmCq8mSFJj1XlTjb0
         y68Pr3FapUpQFafxKhvFGD7SgvDwNJ1in7bVLB8ZUPdEGUkLhGqBfeUuRzHpgJ0brEmQ
         bEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565184; x=1762169984;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3zZy85oW98LmzlLLVlNLP/kxDk+jUE3Sk+1kWzQBq8=;
        b=hTctXJ8zpo+cLL++eLB2mlwkN56WLCAhz8zusXT+TsSAJBKwAOTvD6aNEMzq823KvG
         qhOnFdktPTmkx6ROCeg5jxQjCvwJ7gR1lfgyeM+p7BGK/D+3Ez4bCeHLEDsbXqwbZPV6
         dBMmvkmlhE2Nsl86buMFyokJKvzUlM4fGclEDBuEm9/EsbmSafrQaknpzQDIoEMMCtpF
         wo2tKO5yli+/lOqhewVSjB1Ig7Uug/02c3pTAC/LSuM4rRoDd2nnfXmx4scwZFvS6lyR
         SyOWYwAbBdPPD4p9HGQNbOp3D/n7VbC9Opjn5i/s8USd0P5L8M7vHm+pjsKb6fsX6v9m
         e85w==
X-Forwarded-Encrypted: i=1; AJvYcCVhftGlIc4WcaOaAJHjh7lh898m/WYQ04xfscnJ7NKMXZHcdNaMi0ApEK4SAlPaF0gf3WxWrhBEXUrDA23l3Mzy@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp9kYAegXpft/ppKDVd/olFOlytqpvQtSxdYtFWQX2BtyEE4mL
	2kiFFREhIVl9/3wgSRnQTmXJezwWUZSNP+80nKJYrxXAkjSDD4AwtTURX4NtIdhuHeU3c7pxdzX
	iLw==
X-Google-Smtp-Source: AGHT+IGfIk/DDRBImLoLQrIA8NfRPRuJ6G5SFEtQg8ZEUOxNLLwzjWpF+jFxftbCRBMSKvrx+1GVUBgyOw==
X-Received: from wmwo28.prod.google.com ([2002:a05:600d:439c:b0:471:6089:1622])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3e07:b0:46e:450d:e037
 with SMTP id 5b1f17b1804b1-4711786c560mr290520485e9.5.1761565184474; Mon, 27
 Oct 2025 04:39:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:39:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251027113943.1282568-1-tabba@google.com>
Subject: [PATCH v1 0/4] KVM: arm64: Prevent sysreg helper parameter transposition
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043947_153925_430A83DF 
X-CRM114-Status: GOOD (  12.40  )
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

Some of the KVM/arm64 sysreg helper functions and macros, such as
vcpu_write_sys_reg() and __vcpu_assign_sys_reg(), are prone to parameter
transposition bugs. The 'reg'/'r' (enum vcpu_sysreg) and 'val'/'v' (u64)
can be easily swapped, as the types are not distinct enough to be caught
by the compiler.

There are a few functions and macros that have similar parameters and
behavior, e.g., vcpu_write_sys_reg(), __vcpu_assign_sys_reg(), and
__vcpu_rmw_sys_reg(). However, the ordering of the reg and value
parameters is not consitent across them [*].

Moreover, there is neither a compile time nor a runtime check that
catches these errors. This has caused at least one bug that made it
upsteam: commit 798eb5978700 ("KVM: arm64: Sync protected guest VBAR_EL1
on injecting an undef exception"), and other kernel developers have also
run into similar issues from speaking to them.

This series addresses this in two ways:

* The parameter order of vcpu_write_sys_reg() is changed from (vcpu,
  val, reg) to (vcpu, reg, val), making it consistent with similar
  functions and macros.
* Compile-time checks are added to prevent the 'reg' parameter from
  having a 'u64' type, which directly catches the transposition bug.

No functional change is intended in this series.

Based on Linux 6.18-rc3.

Cheers,
/fuad

[*] Just take look at __vcpu_write_sys_reg() in
  arch/arm64/kvm/hyp/exception.c for example:

static inline void __vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
{
	if (has_vhe())
		vcpu_write_sys_reg(vcpu, val, reg);
	else
		__vcpu_assign_sys_reg(vcpu, reg, val);
}

Fuad Tabba (4):
  KVM: arm64: Switch reg and val parameter ordering in
    vcpu_write_sys_reg()
  KVM: arm64: Add compile-time type check for register in
    __vcpu_assign_sys_reg()
  KVM: arm64: Add compile-time type check to vcpu_write_sys_reg()
  KVM: arm64: Add compile-time type check for register in
    __vcpu_rmw_sys_reg()

 arch/arm64/include/asm/kvm_emulate.h |  2 +-
 arch/arm64/include/asm/kvm_host.h    | 44 ++++++++++++++++------------
 arch/arm64/kvm/at.c                  |  6 ++--
 arch/arm64/kvm/emulate-nested.c      |  4 +--
 arch/arm64/kvm/hyp/exception.c       | 14 ++++-----
 arch/arm64/kvm/hyp/vhe/switch.c      |  2 +-
 arch/arm64/kvm/inject_fault.c        | 16 +++++-----
 arch/arm64/kvm/nested.c              |  4 +--
 arch/arm64/kvm/pmu-emul.c            |  7 +++--
 arch/arm64/kvm/sys_regs.c            | 16 +++++-----
 arch/arm64/kvm/sys_regs.h            |  2 +-
 11 files changed, 63 insertions(+), 54 deletions(-)


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
2.51.1.838.g19442a804e-goog


