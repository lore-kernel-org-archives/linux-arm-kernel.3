Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B4DC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AH9Y+qk/plKTRCQ8rdCbOXUmRPqvAGtJ+mP7kh2bkjA=; b=izHm9P4Hi3OqeCejOXwn+PhK05
	DYGtFK0gruZhsQ+bzXskJfVRMZBbzh7rlGmRMNS7hnDqV1dIw9GylCj/CnW2YoL4hsxoxyQId2Kxc
	J7mSzHKm75RYYHeRp4GkLuYojqI12voAMs8mCrgxNawsb18nnKS86uO5Q5ieR5yn5N5bugtSHCsH0
	3RMtO+VlslBM/E7B0QzAfPqNwDNL88KoeYRIE8iyy2POHcTUjzdsM3L3R/VEOtkLkt+Ah2UzBDS40
	79nUg/S9d9dAY6pYsPkAuPmbQ6vfHL4UlhEppY1IEJhKoLkEYMfDpj3W+OLJRNpuYdG+0RkoDnukX
	58Wv/odA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkA6-0000000FkXY-21Cx;
	Tue, 25 Feb 2025 01:55:06 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmk8Z-0000000FkFS-2vZz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:53:33 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5dece867fe2so5021971a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740448409; x=1741053209; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AH9Y+qk/plKTRCQ8rdCbOXUmRPqvAGtJ+mP7kh2bkjA=;
        b=v3F6CQ7p9rmbduyqGhoMqbZ6/41SMGpvOV+TIhhEWWzxHMVts/eubTkf4Q4ymWwu4m
         UpzwMqbM+QzJWHN8b90dTC/pRhpA1ms6qK59opxl+zchaMIDlq6eY5/7TOt+7rikZWWm
         4rspwDZwSGuVM41BiO4vmMwkFhRqwOCSiphqziEMtwXOmLaiVhZNQPodFn8mFMr1bjj+
         iOhcwrXuy3BifseDO8hDePDO7LJB5Uv39KCZMw3HzGEb3A3JbbkLTF7ylWdTIEP8tmVu
         gLYfeLMxCxjsCgCD1iUZjXxYWKMq7/GnzpsszoBqHc6lqN+6I2rKJ7UfUPJpUtufPBK1
         LzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740448409; x=1741053209;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AH9Y+qk/plKTRCQ8rdCbOXUmRPqvAGtJ+mP7kh2bkjA=;
        b=h+wR9c3GCHf/aCm+sV9ohkctlvuyHp3wrxlRhYoBEHR9ILSrbSU96Y0SOQIIibfgIs
         V0XO50CewK9sIz2IPpgMl9ku08aL9vnp8faJ7UicuauHBUEaZygBABDajmVF0TxomYVP
         Mr7s5v0HEOjTeHVQtAmLqJJRqcQtP/BD1vCp/2zx+m8BXxOBawGv9oRJavHOPoyY5qjw
         tmo10RKKIxU/xRvp6fzqnjL4gCzp3KvCvoNAWSuXMR2DDC0X1kfT9Pcj88nFkM0x/AtJ
         Kq0cqEmDSpHs0rpTyM5/oxbyp0b2lMrKYPR7U06EJZKa+xDzCZq7nsq6zs3GNMzNa39b
         fqng==
X-Gm-Message-State: AOJu0YzFrxeSrtHFRwfWYvmLrS06gNCsmHZtYvfYWXgiGYsbrRePsrgA
	8eUodPfc6wjPbtgiuQygSswyVT2KLWGNkZV2OVUlUwrY9ptcHg845JEk7JvSOZ23MVbZh9KBjO8
	7mdOaoA==
X-Google-Smtp-Source: AGHT+IHJKOHeegcslTQv6gGnIpceJABRkLrMUljBH8OEUmqvgitKR+e8++1jZBdKvqfUQIxfPe64opEc23yp
X-Received: from edbig12.prod.google.com ([2002:a05:6402:458c:b0:5de:bbcb:2c3])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2113:b0:5e0:8ab6:65fa
 with SMTP id 4fb4d7f45d1cf-5e4469daaa1mr1165847a12.19.1740448409709; Mon, 24
 Feb 2025 17:53:29 -0800 (PST)
Date: Tue, 25 Feb 2025 01:53:23 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250225015327.3708420-1-qperret@google.com>
Subject: [PATCH v2 0/4] Selftest for pKVM ownership transitions
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_175331_732850_6D5C3F2C 
X-CRM114-Status: GOOD (  11.61  )
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

Hi all,

This is the v2 of the pKVM selftest originally posted here [1].

Changes since v1:
 - added support for testing NP guest transitions;
 - added .data section in pKVM to allow using non-zero globals (needed
   for previous point);
 - dropped superfluous WARN() from __pkvm_host_share_guest() which is a
   pain for testing;
 - updated assertions for hyp/host transitions according to the
   discussion on v1.

Patches based on v6.14-rc4, tested on Qemu.

[1] https://lore.kernel.org/kvmarm/20241129125800.992468-1-qperret@google.com/

David Brazdil (1):
  KVM: arm64: Add .hyp.data section

Quentin Perret (3):
  KVM: arm64: Don't WARN from __pkvm_host_share_guest()
  KVM: arm64: Selftest for pKVM transitions
  KVM: arm64: Extend pKVM selftest for np-guests

 arch/arm64/include/asm/kvm_pkvm.h             |   6 +
 arch/arm64/include/asm/sections.h             |   1 +
 arch/arm64/kernel/image-vars.h                |   2 +
 arch/arm64/kernel/vmlinux.lds.S               |  18 +-
 arch/arm64/kvm/Kconfig                        |  10 +
 arch/arm64/kvm/arm.c                          |   7 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   6 +
 arch/arm64/kvm/hyp/nvhe/hyp.lds.S             |   2 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 198 +++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  12 ++
 arch/arm64/kvm/pkvm.c                         |   2 +
 11 files changed, 260 insertions(+), 4 deletions(-)

-- 
2.48.1.658.g4767266eb4-goog


