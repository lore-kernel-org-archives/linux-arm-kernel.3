Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71654CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l6OQWnvlaofLL8k3CM7ZM02e20BESVixuphXWNKf53Y=; b=JtqoQpWZlEOS7PVARTW11XRsnX
	8qWTJ58lKpwNi9b6RuxX4SgKNPQWpQSRPpxxt/qayVJlwM0Gg1SudU1JfCvmlCEEl0WZg2+Lw0J6v
	CghS3VSSPcWzh0QbNIb1POFIs+rQVUCUsWiGNBiOYpSQCqOJavr8iuqrJiHukExk9xTrAA2ZYsybU
	Wp4E2eN60V0xXCK7eG/JBuDTdh91XMrVH9UmjHmlXtiIt8gs0w4ungdIg6YUsp/I2Z1VuKeb/oMEv
	i+nl1f/5WsLuYgEdBInEYXBm3/+PPDoZgoQ7G5pbxo2+Eyp2Fq4Th73MGxIcZ6ZtGeQl6ufOzbJgo
	sxzDa+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCUC-00000008GZh-0uVY;
	Thu, 01 Oct 2026 08:49:52 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCUA-00000008GYP-0OBx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:49:51 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a02085598fso3964685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790844587; x=1791449387; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6OQWnvlaofLL8k3CM7ZM02e20BESVixuphXWNKf53Y=;
        b=fd0mgcYdMsgiVwll/2NWyeSU4Pgv3M4ejylU6p+jxhIcO2lpNzQVoylBG6IY5Ld2Pk
         slyiNN9GQ3Z3IU5wXGnUI8X3cZqhiE99GAJ96v3T/dmPGpvIEHevqlUroA7/zxQqVUGi
         NlNbNXb+Uh9C7/ORZXcYs9njFURGyO5z6kecodV++07WA3jnmPu2tsFfB/1JV117Zu7B
         o5je0Uj3Nb0NFy1O44KwLIVGXvM8MWLEBF0eledwF6i7LTennlcq0gJR0GtM06/G38Uy
         0LN4SD3JFdCWlmytFrDHNU+VP9rj5eOz9uS4QCcV6NtcNV2y6mnCdHwIusdFMt3kq7O+
         TydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844587; x=1791449387;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6OQWnvlaofLL8k3CM7ZM02e20BESVixuphXWNKf53Y=;
        b=wryDt5pB8SZowcnSpQ5N2/2dGPQezFZrW35+CO8O6B70sGyj3i4+U43H7iMydCiddD
         bLWnWe3A883hMafZ7hasqnGR6HIhnlYNO9LDVpyTwVBL+7a30V5HoqBXQJSSRI3jKrs8
         7b6/9mZo/7ZJz6F5fLcw88AnMGO5pIEmEhqZOAyBoucV8/S53LxI1s6Y51ceBDm1hnA1
         pYqZC3x46iz5kMhq9uGqZwIcKgbc2hx2jYWlMw1L5zL2YDTUbgeafD5IybWCK0bmy/wI
         jWOD2vpgfbCOZRJ67xZrGbeRdelmj2q7DqGANG+iJFLEeWrwlUVNHTbWwfEKs5bWAb1A
         zwvg==
X-Forwarded-Encrypted: i=1; AKwUvBwB6UAO7hTSHu31Hda3eYNDt57eGP9H5ezvllmgFAXXgHXAAaqUafIYyjZfQpNjYaa6UVKThf3FZRs/3+fuyciz@lists.infradead.org
X-Gm-Message-State: AFuF++kfAa0a9iE7HCbzQ6bWAjdvrGl7wX+2PjdobmNfymkwZKqs8gXX
	e5ZMnZhrVmxUB1erP66+hvF5ZF4964huM2DwrGUXRSd0x3ay9cWZqMBUjc7n2Q5Hh8Ja90QrGNg
	9NA4icuOMze8ysfLBt/YJ/Q==
X-Received: from wryt17.prod.google.com ([2002:a05:6000:1a51:b0:48b:9d:f0bb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4687:b0:4a0:3a3:33e2 with SMTP id 5b1f17b1804b1-4a01adde08dmr65743185e9.5.1790844586686;
 Thu, 01 Oct 2026 01:49:46 -0700 (PDT)
Date: Thu,  1 Oct 2026 09:49:04 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001084909.2937943-1-vdonnefort@google.com>
Subject: [PATCH v4 0/4] trace_hyp_printk() for pKVM/nVHE hypervisor
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_014950_150423_55E69B79 
X-CRM114-Status: GOOD (  13.65  )
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

v4:
  - Store nr_args in struct hyp_string_fmt instead of using
    ring_buffer_event_length() (Sashiko)

v3 (https://lore.kernel.org/all/20260930153505.2144559-1-vdonnefort@google.com/):
  - Collect Steven's tag
  - Rebase on 7.3-rc3

v2 (https://lore.kernel.org/all/20260708075435.47419-1-vdonnefort@google.com/):
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
 arch/arm64/include/asm/kvm_hyptrace.h         |  9 +++
 arch/arm64/kernel/image-vars.h                |  1 +
 arch/arm64/kernel/vmlinux.lds.S               |  4 ++
 .../define_hypevents.h}                       |  0
 .../kvm/hyp/include/nvhe/define_events.h      |  2 -
 arch/arm64/kvm/hyp/include/nvhe/trace.h       | 66 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/events.c              |  6 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  2 +-
 arch/arm64/kvm/hyp_trace.c                    | 60 ++++++++++++++++-
 include/trace/define_remote_events.h          | 19 +++++-
 12 files changed, 178 insertions(+), 9 deletions(-)
 rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


