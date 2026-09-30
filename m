Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37287CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e9Vds2cdlvlYZjJIgGDWs1EJC1YhBNT7rk3OYBjOaX8=; b=HWVHlJ/DHPQKypBd9gfbhZRYKU
	Fd8UazWiv7PPRR4JtcQwBUI+wav0am9RAQNHq0SlUIl29MuJWnQjncyV4EdoJusnxWn5HXRVNiL/u
	ybIa6bILyHf51EkABe3vFb0i21A4q7D4xo/4QsI31tSD+z1ce5imYnPZopUaT+wEhHCChtqNKqAIY
	HQFfuYBs22SG8oIwuYzxxHumVZhIGCKbefqYs53dbZm/unhfQyZBPhBBEQJctzuhcxBTVFqK+QC16
	9jFWXatDp2pSpuz1TUHypAi7uYomdXxhEleeDdAsamfdwJfzwtHe56PvfFbVYDfbqCtSEj2M5NzkL
	bCB+fnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwLA-00000006XH2-0vrS;
	Wed, 30 Sep 2026 15:35:28 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwL7-00000006XG7-25fE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:35:27 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6acc625325bso1262525a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790782523; x=1791387323; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9Vds2cdlvlYZjJIgGDWs1EJC1YhBNT7rk3OYBjOaX8=;
        b=UZdQDjDlv8FIVR8VkBFtrzb8hkqQnaYxaw0nicr9rcUr+UzailY4kMOEPj9YN+aWDi
         /eWnQKKdJTsIFNXuxckGL1b/p/Gw2Iobdcix0io04Hg0QicWxvUY94nXWh+xyIf52tK5
         AeIJ7kg6nNWJbMCqca1UEZVHE65S7T44ZxT4JuVDc3moXkucwl2dUn7IPRVFSUIIbqcW
         2cB5alMjkCYDXCJaR3cdwNd6vUEgV3zaSk8DbpjRhnlFl0dXAb2/Jv7mWxIMkAtkynhp
         oeNFoqgRMzREtPRgLaHpibICvML61SAtV4rK5dapyxBkvNHXj+V+iy5Y2PqwbtPHEbhd
         GTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782523; x=1791387323;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9Vds2cdlvlYZjJIgGDWs1EJC1YhBNT7rk3OYBjOaX8=;
        b=i2dZAboA+Hakt8UHRdYXG9J8h/HUCkdERmuR4GX+HyHvFHEBIkt+L3ut04+hkcSyiB
         HpPyaaOMlAxhQ7irKnnWQOAYnrjZTH6Jq8YtSx/K5GIcxnBJ/ZHfesgP6uFXkAdZqcLy
         e9b4Ruo+nKg8CnXPu4NPwTbrY8UbMzRmlE8ci9RHCejYsocUePvzVavZNMpoyL/bqT0W
         4EUsCLleCifZlXgaCbh6U9hU5v4ueVsxdgX0cQTa9MUWO1HPtEkh/nEWLJ3K5sUoTnvE
         GRqHp/dI+0QuDZBX7nOokB6cDRFBmPiyekaZolwlgISOb04PRv4Orv4yYQnjyW3lf4yj
         0Y5w==
X-Forwarded-Encrypted: i=1; AKwUvBzlLp9Ry3esq+DD1A9YE4mFuB0IPBxCTNx7oKmRRmpXfSbpIlq1TewqWaPnajQeWHeD2PTms2VU6NFB0p25PwtB@lists.infradead.org
X-Gm-Message-State: AFq9FYL1To/5IrR4+aATLZUlZXsHXyQIyywpKHF284KTuLdgWcjUhFA+
	PAiJuj4fqCA/jRiagkzT6tZDCkKBKOXdLoznsJ/2JlswefqD+oeBu0ssIlONaDQk+1WHXoUE0Ou
	KPdbZiT/K4wTmIiy4AIA8VQ==
X-Received: from edvx9.prod.google.com ([2002:aa7:cd89:0:b0:6ac:c249:42c4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4552:b0:6aa:9fef:641c with SMTP id 4fb4d7f45d1cf-6ae1992adcamr1193267a12.28.1790782522587;
 Wed, 30 Sep 2026 08:35:22 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:35:01 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930153505.2144559-1-vdonnefort@google.com>
Subject: [PATCH v3 0/4] trace_hyp_printk() for pKVM/nVHE hypervisor
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_083525_554151_4BB8E9A1 
X-CRM114-Status: GOOD (  13.60  )
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

v3:
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


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


