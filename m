Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3DAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PxL6rMmvaAb+6E9RAHDZ9xlGXg899687R90+P4Nthl4=; b=AtSBo6X19x5waiwxqsy2dPmJ9P
	Z0V6Vmop3kyCLrnT3Zf+UF8e92w+wmCtPMWWrTKBnQmYUsisU5O5bz9OO/ygsApJ4FSIjNB92aHAL
	wFAvdK1k3obxvA2sMGYDKeTRWwH5YtwArZkwMMgZdyiMiQlxwzb30VkgScsyivPz2OU/b69nVVe+6
	S1ETvwdM5pfGBIyPSZ462hTZZ5CJuRAb1crDMCTW1A7FP5UqPtoVNRPSdYX+xY/y1BDzN5OtyV+Hu
	vTXYMQd4KjdYFFWz4FYqWaVpFooeCOqybSke31hEesD88+ADm6YNql/GBAsmnv/Qcd4n1xLatIWKn
	TT+XaIhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNAC-0000000GYed-34o6;
	Wed, 08 Jul 2026 07:57:48 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNAA-0000000GYdN-1pAX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:57:47 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-c15d2ae8d2dso21864166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 00:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783497463; x=1784102263; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxL6rMmvaAb+6E9RAHDZ9xlGXg899687R90+P4Nthl4=;
        b=CgZfyjaE+JqxPvzAwSgzOJ+Yz6uxB3pe8WTU17kDIbc6fT4NHTYvD2rDle7J+jPdBU
         79Scv/orESoayR50UY+zaUjgqj6aSQrTLFdcXpW+X5hSvxEJJfzhAESGyIlldcSjOPNR
         rrlViZenZEaDCLKPCiucOC6OjhLsAJDgELGXxK6P2amFWk/8MWwM5wgQrNWgs1rpzdxt
         TtYgBOFA0MlzLxKPP9J3iuGWp7M1ckBytn5wPM2Vlg+MnGjYaJ+vxlbGvksCJu4kGcFU
         iM4XT477z73VngQDsnJqfUQjNeBf/2p5QcXBAfWLeqFhLl/6k0BAOObibEY2r/bP+AS5
         2/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783497463; x=1784102263;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxL6rMmvaAb+6E9RAHDZ9xlGXg899687R90+P4Nthl4=;
        b=nYiGKnmOVIOANoNtT0NEAGBvT5u7j3v1a5ds+QSc4rT0LEHebgW3xQBG+PNh/SNCI3
         E5pWiO1n8nSAGZ+IBZtUGCNydpYuXXOjXVI6YP0Q9yFSq4no70N4Yi0eWUbrDBo8niMc
         vRGPGJS+Quybi0pa0WSgBSAQzEKAcWZzMviugvv/cph+gmEq61EbTP4j4cP/NYQVIs7T
         jkBR0tTryYpn5qWoe+cYyAvRZy8NQvVY08nB60hnmx3YmwE2mAX7DdbqtR6odBCMd5CU
         3yJK5TPkuAyKGZ5Tx7dU4VewlVxG2+EIdB0YOFoWj4loDD8lQPQKbHBpeCP5fmLCYatv
         dBIQ==
X-Gm-Message-State: AOJu0YwIOFD5h7Yn5XimblFkDGgJ9HvqoeTPGyUDnaxcRVFFmaYAM8rj
	HU4eyK6N1uUMQ0U7d8xvSKmjPkWKF7A+EpWPSZe4ZmvW10ZB22LixJbAm7tcAXAbQujUof938Kx
	6LhYpaH4n+cB+Zz902Lf5hA==
X-Received: from ejie9.prod.google.com ([2002:a17:906:2d49:b0:c12:5e2b:a869])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:1b56:b0:c12:6c2e:ae9 with SMTP id a640c23a62f3a-c15ce014ec3mr43200266b.22.1783497463092;
 Wed, 08 Jul 2026 00:57:43 -0700 (PDT)
Date: Wed,  8 Jul 2026 08:54:31 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708075435.47419-1-vdonnefort@google.com>
Subject: [PATCH v2 0/4] trace_hyp_printk() for pKVM/nVHE hypervisor
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	linux-trace-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_005746_494047_4D5AEEF7 
X-CRM114-Status: GOOD (  13.79  )
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

This series adds a hypervisor event "hyp_printk" which enables
developers to log pretty much anything into the hypervisor tracing
buffer, just like the kernel function trace_printk().

This enables rich logging from the hypervisor, while leaving all the
string parsing burden to the kernel. This has been the main way of
debugging pKVM in Android.

Even though not strictly related to trace_hyp_printk, I have added the
following two patches:

  * KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp

    This one mainly intends to support one of the new features I have
    posted here [1], which allows to enable tracing as early as
    possible. I have added it here to limit cross-posting.

  * KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/

    This one is just a cleanup.

[1] https://lore.kernel.org/all/20260605163825.1762953-1-vdonnefort@google.com/

Changelog:

v2:
  - Collect Fuad's tags
  - Rebase on 7.2-rc2
  - Warn when trace_hyp_printk callsites are exhausted (Fuad)

v1 (https://lore.kernel.org/all/20260612142245.1015744-1-vdonnefort@google.com/)

Vincent Donnefort (4):
  KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
  KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
  tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
  KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp

 arch/arm64/include/asm/kvm_asm.h              |  4 +-
 arch/arm64/include/asm/kvm_hypevents.h        | 14 ++++
 arch/arm64/include/asm/kvm_hyptrace.h         |  8 +++
 arch/arm64/kernel/image-vars.h                |  1 +
 arch/arm64/kernel/vmlinux.lds.S               |  4 ++
 .../define_hypevents.h}                       |  0
 .../kvm/hyp/include/nvhe/define_events.h      |  2 -
 arch/arm64/kvm/hyp/include/nvhe/trace.h       | 65 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/events.c              |  6 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  2 +-
 arch/arm64/kvm/hyp_trace.c                    | 63 +++++++++++++++++-
 include/trace/define_remote_events.h          | 19 +++++-
 12 files changed, 179 insertions(+), 9 deletions(-)
 rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)


base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.55.0.795.g602f6c329a-goog


