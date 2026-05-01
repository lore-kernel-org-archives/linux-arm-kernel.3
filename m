Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEB1CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OsvmNiIFOjSLSp4rcDSw+qNHN7ZNglz3VqzWWNlV7vU=; b=yyD8agIRNc+84O3tCtqF6xdOLy
	XlYk69QZKY6R4zh8EOmHZW1ET9HumTxmQB6IQSFrAnZxGSbIpTxrS1KjQW0KfS6mDOjxfaAXpKZeA
	2x9iKcrqJKYO1HVl+8+DIdPfR71UHg0vz2nks3TlfhXfDEvUpriwe18ctTfaiaawgSoS0qsOnqtbq
	KtBU0Y8uxGC6tiGcfRnrDxoa9VVdchlNLnTpy4V1fYds2EEtyHgO7P6tCwbQgawrSKqPziAQxjwc8
	Fv44SH83icZbcWMpMVJTBoc3SFTlCMZtuoIehUt2j3llfFqynq/wCrPae+7JZx4i159ehYlaJ012C
	v8whwMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwR-00000006ekf-4Afl;
	Fri, 01 May 2026 11:21:55 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwP-00000006eiK-04Bi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:21:54 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-449c8f24067so878880f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634511; x=1778239311; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OsvmNiIFOjSLSp4rcDSw+qNHN7ZNglz3VqzWWNlV7vU=;
        b=SqiEZQXre2Hnvv2XrdvkkrIObpYtUezCnvUXDnHI90sm8R7Ej+c2Lxl87bz0of0k+E
         2LR2NrLWNZLZjB0DXJA/Aj1/5VpD1/bp6kJhpt0qtRNQCKIUTm1KjixpmYojORO6ruGq
         bZeOE5fLyKqHmeqj0K+QjptvHfpFoAJFSK37J5pvOZNMPHbaD6/2azC2q9Y/eQHi8K63
         ioxthRtYODIOLObuxocfDcw4lcXCWsEqfTncbhd1zOKuF1KgYqPSyqrck0PPygwvU3bs
         OF3gehblZMIEKB5gkQRdX6czhZh6pWdOr6VQBxRdfG5h9b7CdIf71Go6wTyLIAlgXvVW
         fnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634511; x=1778239311;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsvmNiIFOjSLSp4rcDSw+qNHN7ZNglz3VqzWWNlV7vU=;
        b=rp0pl54SM/VIQBVF4mHOlZsZcxHTKBKzOY4QdtXZMyD8whgzR78QAxLbzMpRPJr0SI
         x3jzH419RaMIirjyuIe03/3oh37G2lYrtyJAAJUyBvh5EnJdFOEc2EUfg3SJZ6O6F8SI
         NtGfdEfmu+nvN0VNaIMjtpHoZcm061LOCQw+KFiuk2shJwFf013y2W4Gf+ylvEhYQUR7
         RUG7v4ShCGN49Scd5Kj5AK3LrMXpGePUUOclnoWVjix1knHuOsRb4h8W4ltO+g7Tuc8r
         Mxonnh/eocIyCkvQLUC+uRF+BTpUyPcBXQsWtBxjszPEF5CeppKcd7vmRxwl37EAEFh9
         vwnA==
X-Forwarded-Encrypted: i=1; AFNElJ8BzoR+biCFYmbELL9oNN4cXb8wJnYHhEXCx/MGADW9+tkbtNDFjvRaU/dVbsFTewO+ehD5ueqsZ/tDR555hpae@lists.infradead.org
X-Gm-Message-State: AOJu0YyTromRSqoxtG6s+fg+pP52oKPTu9BWEEVh9wi6hQw9qu9hAHBT
	ul/3QSpxqQx83sEGckasuKrveAVrUFXgX8lZrs5mzSw/ycjcfWcIBAFWn0a6Y++OZTiudGbBQy8
	Drw==
X-Received: from wrbgg9.prod.google.com ([2002:a05:6000:2f89:b0:449:ba46:e362])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2f8a:b0:441:1cf9:4f06
 with SMTP id ffacd0b85a97d-4493fed64c0mr11269061f8f.31.1777634510466; Fri, 01
 May 2026 04:21:50 -0700 (PDT)
Date: Fri,  1 May 2026 12:21:43 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501112149.2824881-1-tabba@google.com>
Subject: [PATCH v2 0/6] KVM: arm64: EL2 synchronisation and pKVM stage-2 error
 propagation fixes
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042153_082777_B869DA71 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

V2 of the kvm/arm64 audit fixes [1].

Changes since v1:

    Patch 1 (SCTLR_EL2.EIS|EOS): Fixes: tag corrected to 0a35bd285f43
    ("arm64: Convert SCTLR_EL2 to sysreg infrastructure"); the commit
    message now explains that the conversion auto-generated
    SCTLR_EL2_RES1 to UL(0).  Code unchanged.

    Patches 2-3 (NULL vcpu guard, __deactivate_fgt typo): unchanged.

    Patch 4 (new): Seed selftest_vcpu's memcache to mirror
    hyp-main.c's pkvm_refill_memcache() flow; required by the
    pre-check in patches 5-6.

    Patches 5-6 (host->guest share/donate, formerly v1 patches 5-6):
    reworked to pre-check the vcpu memcache against
    kvm_mmu_cache_min_pages() during the existing pre-check pass,
    before any state mutation.  The WARN_ON() around
    kvm_pgtable_stage2_map() then asserts an invariant the pre-check
    pass establishes, rather than swallowing a reachable -ENOMEM.

Dropped since v1:

    - Patch 2 (HCR_EL2 sync): failure path not reachable.
    - Patches 7-8 (guest->host share/unshare): the stage-2 map cannot
      fail at those call sites (the leaf already exists).

Carried `Reviewed-by` tag (thanks!) and added `Assisted-by:` tags.

Note that with `review-prompts` in the `Assisted-by:` tags, I am
referring to subsystem guides that I added to the base prompts [2],
which I plan submit for upstreaming.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260428103008.696141-1-tabba@google.com/
[2] https://github.com/masoncl/review-prompts

Fuad Tabba (6):
  KVM: arm64: Make EL2 exception entry and exit context-synchronization
    events
  KVM: arm64: Guard against NULL vcpu on VHE hyp panic path
  KVM: arm64: Fix __deactivate_fgt macro parameter typo
  KVM: arm64: Seed pkvm_ownership_selftest vcpu memcache
  KVM: arm64: Pre-check vcpu memcache for host->guest share
  KVM: arm64: Pre-check vcpu memcache for host->guest donate

 arch/arm64/include/asm/sysreg.h         |  2 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c          | 16 +++++++++++++++-
 arch/arm64/kvm/hyp/vhe/switch.c         |  3 ++-
 5 files changed, 43 insertions(+), 4 deletions(-)

-- 
2.54.0.545.g6539524ca2-goog


