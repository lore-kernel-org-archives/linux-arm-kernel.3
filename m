Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D8BCED27B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=opTLkJ9rWZdOh6NllMm8SZ1k9obnWdX+EkDUkDwUBBE=; b=WuFvyo/LgDSrAHnjw1ZmzFm1Pm
	iKa8KkTDm21IkypkLyPetvgYeyHf/vmO0HFu2ZMv7HhiwaKig3Iqm7KZE7ZzbbHjzMxWXaD5rBjPo
	Jw8+/uWtkgbT0jLxuHsem91DgQ/962tnIFslNHAkrQwPJI1ew9eOfsPdF+19ew1TrHO13QfLUk9mP
	3bkdKEETDIAeqCXLmLWgulXeYuthHIoSWqp/dA9E5qvxBDWzKpvaEN6ztvKoiqDRWpKn26jNtlUdc
	ghNnJ/O8kj0xOPUwvx8WQLqm0Q8ybLFl7CP7/KrAWqXhZoP6RTbGtxEelo/3Lu/e3BR6UCQLm9kuC
	+BW1mqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6D-00000000Fho-3yLQ;
	Tue, 18 Nov 2025 10:38:13 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6A-00000000FgJ-1hY0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:38:12 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b736dc23d6eso351464766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462288; x=1764067088; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=opTLkJ9rWZdOh6NllMm8SZ1k9obnWdX+EkDUkDwUBBE=;
        b=YP/eC3IbM9tr3UNHhNhi+UPjzdxABLzCLTMAaap8f02Vvn3MSH4UnJXswJiyYLFANJ
         QuL9so58ScAdLo4DHRDb9O+uoA6b+fE4n/P5HKkIMHJ28Y+bQ5oam8SI49bPqtQTWX2Z
         m8kgb/csObauC13z766F66oqUjTq6DXMLkfDiUQIv/Ftbr3GD+WWZHg6Qznk13+1WN3G
         oFxcIYxhj+5plzYZ5REqM+xkOv6xD353eVJu2lUBoAeivsCuOoG5aVpDGvzH6DXxXhKt
         mVdp09m9SFbuV61MqI0edF82C9wdGtYAV3l4E2paQkCL2h0PaLIbzBV1/FCnipOgcPfO
         XxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462288; x=1764067088;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opTLkJ9rWZdOh6NllMm8SZ1k9obnWdX+EkDUkDwUBBE=;
        b=PTMqeo6Fzq/OFvHHCB6LCwTOcNYz2T7iQudJkOUluI5uk29bIrJQfl2VIuy/ZiVWVy
         Vjem8yIKX26FCm4gFDiBi/Zw4wvjjj821FKirHl2bbEX5L36ah2oGxF+hOQqLn4fYp6C
         NGCJQwITQpdRJnAHTcvH+ZG2rH4kgT33pO08OqziKuQ7lXfs8p3AkLaAxO1BGctWBn29
         MU4GTN5uPd5po8qPKPXpmvTWz1ivm7pEZQrl6O1x3nyEEuoa5p623gtizLsHT06TSGop
         gGZfrWcjwMfdSjm/dtnqNeftCgvzdfPOTS1gETX4H6iBmji0954oweXamfdZtOjJbnUG
         lURQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyDtnAqvwAtFpAVwys1UkORlhRXS6ivqloxdfjOcvXRFoKWyMa/hac0lW6B7bysYffeIUcpblaXLM/wQqjT5ew@lists.infradead.org
X-Gm-Message-State: AOJu0YzrAsUy5QLiFjT8uTxgQPOY6ZJ6wwtA5VqXg6KVLPZOY9AUUnuy
	f5g/FE/en4Ie0c+duOVzzYHfQPQpAqxBH5kxcFltBCmW2ZOJEFXBuwNDn2lNho5grmgyTsmlNlH
	XMw==
X-Google-Smtp-Source: AGHT+IHa7FWLOGKg8Thm7QDDUPlVzXaAEWqWomimgzOkWsb0FL5ju0E2rB0g4YLHEY/ASv5Z648Auwd6KA==
X-Received: from ejchw14.prod.google.com ([2002:a17:907:a0ce:b0:b72:41e4:751c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:1c9c:b0:b6d:7b77:ff33
 with SMTP id a640c23a62f3a-b736782c351mr1442681866b.19.1763462287893; Tue, 18
 Nov 2025 02:38:07 -0800 (PST)
Date: Tue, 18 Nov 2025 10:37:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118103807.707500-1-tabba@google.com>
Subject: [PATCH v5 0/9] KVM: arm64: Fixes for guest CPU feature trapping and enabling
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023810_452602_0215777B 
X-CRM114-Status: GOOD (  10.05  )
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

Hi,

This series contains several fixes for guest feature trapping and
enabling, as well as a bit of tidying up.

Changes from v3 [1]:
- Add a map of KVM capabilities to IOCTLs (Oliver)
- Based on Linux 6.18-rc6

Cheers,
/fuad

[1] https://lore.kernel.org/all/20251110134525.3768197-1-tabba@google.com/

Fuad Tabba (9):
  KVM: arm64: Fix Trace Buffer trapping for protected VMs
  KVM: arm64: Fix Trace Buffer trap polarity for protected VMs
  KVM: arm64: Fix MTE flag initialization for protected VMs
  KVM: arm64: Introduce helper to calculate fault IPA offset
  KVM: arm64: Include VM type when checking VM capabilities in pKVM
  KVM: arm64: Do not allow KVM_CAP_ARM_MTE for any guest in pKVM
  KVM: arm64: Track KVM IOCTLs and their associated KVM caps
  KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
  KVM: arm64: Prevent host from managing timer offsets for protected VMs

 arch/arm64/include/asm/kvm_arm.h         |  2 ++
 arch/arm64/include/asm/kvm_host.h        | 42 ++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_pkvm.h        | 33 ++++++++++++++++---
 arch/arm64/kvm/arch_timer.c              | 18 +++++++---
 arch/arm64/kvm/arm.c                     |  7 ++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c           | 18 +++++-----
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c |  2 +-
 arch/arm64/kvm/inject_fault.c            |  2 +-
 arch/arm64/kvm/mmu.c                     |  4 +--
 include/uapi/linux/kvm.h                 |  1 +
 10 files changed, 105 insertions(+), 24 deletions(-)


base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
-- 
2.52.0.rc1.455.g30608eb744-goog


