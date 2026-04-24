Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D53FE51E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aH/14ddBCo2kTCzx4ceCZMALAM1Tsur26jX4fxnDfAE=; b=kjV9W0T/G8BdqymmvTe/6OFAgS
	q/wu8pjHBSGML/bV49V+Q5MIkcItRKgYjipSNPmHdAXYjdLTu7aoztO8iTPS5ybuBDxHbRfUVpt2B
	JosdkUZ7tjcW/WYfYGyNfFQJU+KfV2ku9pp6CnI5ksafY+6CwVHrvOInYGUaQ2G7uBjV3wIukJTQ2
	8tFOOLXW13VzWN1ateDm0N341iwI6l/iGyXije1d8mPSlgOYZDXhs7XAQuH4okLzy1X5HxT9EoKET
	hVlWVFzDQ0HJkkn41Lp2Sa4IzvFfHvCMYuuofkbGB8QVC9JGYo94mALlAg+3zV865lauo5qiCKhaW
	8TCfuOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDp-0000000Cszd-3jxi;
	Fri, 24 Apr 2026 08:49:13 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDo-0000000Csz0-0fzP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:49:13 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-488c0fcc6deso46336425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777020550; x=1777625350; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aH/14ddBCo2kTCzx4ceCZMALAM1Tsur26jX4fxnDfAE=;
        b=A3NSmr+xEk5s+lI0LBvC1Ud5l4765Qm+1S2YJWuDpKUR0K6ur55iseczQ+uuIGzV/t
         lit7/Q3b2cROm0qjiS6cjAzwxgBYHxwRfWQPZ94IOWoRIr/iI6WLVgFRcL17qBjxdpJJ
         ezXrENRo/lw7ey/uu+L8hEE7+ZuuBQdM06ookt+UG3ehWIRb1vNwpqrl7rBbxmTNgRPg
         cob72KHM25I7h9JbzPGRFptndwimbPWtRDZi4fs2U7MTo7HhWg31l3BFAfvRDQuru+73
         Dgc9yM4kv+Zngd5Tq3980MEo3fY0CNlKQUx6b6B2NTX7O6PAJP4Cewjhv86nPjkdD5Hi
         tvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020550; x=1777625350;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aH/14ddBCo2kTCzx4ceCZMALAM1Tsur26jX4fxnDfAE=;
        b=epFQAp8v4bWTHJgX2o6O4RtJzmG837YJ51Twr5tFD3h0LsgYFkKo5SWbZaw7gDnFox
         dt5pVUsOi+pPG/sckXwJM0+pNbReqjWoEFEGBvEuzbKTilr75i/1uCTJ5POQgdo0Xi/w
         8/2RzMiUxCe7QP6ekakSq34zjyGxRHcV4N45uvuObKcKPtDuNS90rdIvdWxV17LVjQHh
         pRw9ehdIgvuHKmAZHBSJ9eviRT0iJMGA674wkEHxZqG3pVPFsjuDxBLMhaeX8Dg4cLet
         sRZqtk4kzusvRK3p3zdYo8fHussurNuqWhWC0Q6U8I1zhCKzxiN59b22iTdWMmCsXTeb
         LJ0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9wgL/tBNWbLLjoiFYqN0Njt3awiAz6EBXaitR2vvEkHsMZQPAufympqexvTlsapmx95aOW5iMQNoDcSJ7W/ePW@lists.infradead.org
X-Gm-Message-State: AOJu0YxU/pPe5ZaTb/H2xKWl8yUhKEkGvwHNsvigXExcpIeJb/dG4FaW
	M9fA7nqKn4N9G5nZS2yQ/FWXMCGTDpZNzBBqvX/qNNGrvWQ96xIdB6m5/9qfcTXWaI8jA9UKwUx
	Y3Q==
X-Received: from wrtj10.prod.google.com ([2002:a5d:604a:0:b0:43d:77d4:5f06])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fc6:b0:48a:53ea:1408
 with SMTP id 5b1f17b1804b1-48a53ea15a4mr231487385e9.8.1777020549668; Fri, 24
 Apr 2026 01:49:09 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:49:02 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260424084908.370776-1-tabba@google.com>
Subject: [PATCH 0/6] KVM: arm64: pKVM init and feature detection fixes
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: tabba@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oupton@kernel.org, qperret@google.com, suzuki.poulose@arm.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_014912_261484_287274EA 
X-CRM114-Status: GOOD (  11.08  )
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

Hi folks,

These six patches are standalone correctness fixes I'd like to land
before posting a follow-up to Will's pKVM infrastructure series [1]
that moves vCPU state management to EL2. Sending them separately keeps
the bigger series focused, but they are all valid fixes to have
regardless.

The first patch fixes feature detection for FEAT_Debugv8p9: it was
checking the wrong field in ID_AA64DFR0_EL1, causing KVM to treat
certain EL2 control bits as RES0 on hardware that implements the
feature.

The second patch is a trivial typo fix in comments.

The third patch fixes feature detection for FEAT_SPE_FnE, which was
also checking the wrong field.

The last three fix bugs in the pKVM vCPU and hypervisor initialisation
paths: a latent macro parameter bug, a pin-reference leak with a
publication ordering issue in __pkvm_init_vcpu(), and a call-ordering
hazard in __pkvm_init_finalise() that is benign today but becomes a
crash once fix_host_ownership() is extended to operate on a non-empty
page-table.

[1] https://lore.kernel.org/all/20260105154939.11041-1-will@kernel.org/

Cheers,
/fuad

Fuad Tabba (5):
  KVM: arm64: Fix FEAT_Debugv8p9 to check DebugVer, not PMUVer
  KVM: arm64: Fix typo in feature check comments
  KVM: arm64: Fix FEAT_SPE_FnE to use PMSIDR_EL1.FnE, not PMSVer
  KVM: arm64: Fix kvm_vcpu_initialized() macro parameter
  KVM: arm64: Fix pin leak and publication ordering in
    __pkvm_init_vcpu()

Quentin Perret (1):
  KVM: arm64: Fix initialisation order in __pkvm_init_finalise()

 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/kvm/config.c           | 23 +++++++++++++------
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 38 ++++++++++++++++++++-----------
 arch/arm64/kvm/hyp/nvhe/setup.c   |  8 +++----
 4 files changed, 46 insertions(+), 25 deletions(-)

-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


