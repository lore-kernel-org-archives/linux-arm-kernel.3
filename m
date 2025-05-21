Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84218C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5uHy+p8xiNatJ/qO1mRfpamxzCqJKlhzt7Hc5Lu76pY=; b=IZr84kDsPH986o1p6SNdqPhZwU
	0mwK6C3nuuaxysL82rtpVXMaD3hEJcU+lP3TEqy7GBWXQvti0i+t1ZmmV/yMaYBVoZglp4aaXyVox
	K98EUfBD7OANHyUjb0e0AxxDBMjarkU+qWwoNYpYVgpHq/w48cruW1VTmcBprpy8SahwSUkRyGA1P
	TVKaR2WZt82u6TWXTIVtXmrsgh1jegBKm/6BpZ8sk5id4mrFseD8GGit5PeUerKIyV8lF9So5o5sM
	XGPAOwkjHU3rTI8LuHQeF5+0OyuBrtRhfsC9toJ/CvMvIZEop2gvhSuxyBgHuACEeW91DW80hJ56d
	uvIVpgCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiwb-0000000Fq1Z-1FTg;
	Wed, 21 May 2025 12:53:13 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiuX-0000000Fpam-1bqt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:51:06 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so36028935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 05:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831863; x=1748436663; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5uHy+p8xiNatJ/qO1mRfpamxzCqJKlhzt7Hc5Lu76pY=;
        b=HDeB5vH1rTM418sc0fb/oj05aRKQ+Uf01Xiu6y3WoT6zC11mnsI1HvOa81cSOZSjNM
         KpAEjjYYQOx994QCylh6A6kFpTxJAE9h8ehOu8FKqfhzUsrQXDCJB1qeWw/rzQaI2LBz
         FVYVfxy/A4OGAhYcTXwjcQt1aa+phn0qpIxsbQ5DHEPEvQrzYXYA4CEePPhhLqAqcGby
         BDczmmNEl7f+KrzgqMw8z1FvB3ZJfAEZH/14b9KMQZLicSarY02HxSU7Ckw3+rSZHeGa
         OLEYolhKLpuC97PWQKLqBZSYmRZMGTLoQK63qui5Zk2hQoSirPR8Vcz0Acz3tUZt7+Fb
         QJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831863; x=1748436663;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uHy+p8xiNatJ/qO1mRfpamxzCqJKlhzt7Hc5Lu76pY=;
        b=YniPy3tuWbWJCjynJy6R3oDFeOSuM3RfAMb8beoXHoSq0veRjR0+3xY8mmIPXJCuco
         GKyDCbABin3V0DmniywqhmpZKjAzjAGBBGD3L/TIT0EQvg2/g2CC1yJIn7JQRRU+DlUE
         0ch8EjROxfrY9RalBV2ZQiuX0juaTX9gQwc+ULtWM72sJJ28EARhTdqlPTYyV39yzed4
         yTmWdZKNaOrL0brHErmXV/Og6Hv0/SQww6X/pMkoksKWEci06YXGrA4eG63HGn1KBYkz
         Ae/bUpXL4XZ1qWhkJlTCDT3ThotH1gXBG4ZDTmPLawKlYtVK9U3oTvhYBYwojootIuj6
         T+EA==
X-Forwarded-Encrypted: i=1; AJvYcCWGejeAviksJDDInjgvknqSyw6f4/V90KGZLJgx2dM4b0HQRQui5rA0jL6u1ouSxyc2xDTOlTZg1XWZNWo0HHH7@lists.infradead.org
X-Gm-Message-State: AOJu0YyLZjGH17c5Cyy2UGR39Ut4LBdFDw6ZqAXlut29jZGhdArms1/f
	elpxy63WCb4hntzu8I0LFjtQEH80iCRz6rC/LsuSj/iKFH68xJgeKwImnQptSHz/bL96Tt2U3nz
	JhH1kS0UNiM50EqFay341vw==
X-Google-Smtp-Source: AGHT+IHRjNo/bemvwuTLbGZUJ+I0Cd/WKzDQzqP3NrChiAI6QmaNpGURgsbvUPlh98wyTVdHdymBU2R9bWaHgD8h
X-Received: from wmbay39.prod.google.com ([2002:a05:600c:1e27:b0:43d:1ef1:b314])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a418:b0:445:1984:247d with SMTP id 5b1f17b1804b1-445198427a1mr118512565e9.7.1747831862985;
 Wed, 21 May 2025 05:51:02 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:24 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-1-vdonnefort@google.com>
Subject: [PATCH v6 00/10] Stage-2 huge mappings for pKVM np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055105_421942_BAC5079B 
X-CRM114-Status: GOOD (  12.89  )
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

This series adds support for stage-2 huge mappings (PMD_SIZE) to pKVM
np-guests, that is installing PMD-level mappings in the stage-2,
whenever the stage-1 is backed by either Hugetlbfs or THPs.

The last patch of that series is an optimization for CMOs using a shared
PMD_SIZE fixmap.

Changes since v5 (https://lore.kernel.org/all/20250520085201.3059786-1-vdonnefort@google.com/)

  - Fix fixblock_map usage. It should only be used on PMD_SIZE aligned addresses. (Marc)

Changes since v4 (https://lore.kernel.org/all/20250509131706.2336138-1-vdonnefort@google.com/)

  - Make guest CMO functions working with any input (Marc)
  - Improve for_each_hyp_page() and fold struct hyp_page declaration
    (Marc)
  - in mem_protect.c "PMD_SIZE" replaced with kvm_granule_size(KVM_PGTABLE_LAST_LEVEL - 1)
    (Marc)
  - Remove useless guest pgtable callback force_pte (Marc)
  - Fixblock functions fallsback on fixmap on 64KiB pages systems.
    (Marc)

Changes since v3 (https://lore.kernel.org/all/20250407082706.1239603-1-vdonnefort@google.com/)

  - Rebase on kvmarm/next

Changes since v2 (https://lore.kernel.org/all/20250306110038.3733649-1-vdonnefort@google.com/)

  - Fix PUD_SIZE -> PMD_SIZE enforcement (Quentin)
  - Rework pkvm_host_share_guest() to remove one hyp_page walk (Quentin)
  - Remove one pgtable walk into __check_host_shared_guest() (Quentin)
  - Return EBUSY on host_share_guest_count overflow

Changes since v1 (https://lore.kernel.org/all/20250228102530.1229089-1-vdonnefort@google.com/)

  - WARN_ON() on !PAGE_ALIGNED size for guest CMOs (Quentin)
  - check_range_allowed_memory() before accessing the Vmemmap (Quentin)

Quentin Perret (2):
  KVM: arm64: Convert pkvm_mappings to interval tree
  KVM: arm64: Add a range to pkvm_mappings

Vincent Donnefort (8):
  KVM: arm64: Handle huge mappings for np-guest CMOs
  KVM: arm64: Introduce for_each_hyp_page
  KVM: arm64: Add a range to __pkvm_host_share_guest()
  KVM: arm64: Add a range to __pkvm_host_unshare_guest()
  KVM: arm64: Add a range to __pkvm_host_wrprotect_guest()
  KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
  KVM: arm64: Stage-2 huge mappings for np-guests
  KVM: arm64: np-guest CMOs with PMD_SIZE fixmap

 arch/arm64/include/asm/kvm_pgtable.h          |   7 +-
 arch/arm64/include/asm/kvm_pkvm.h             |   2 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   8 +-
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |  16 +-
 arch/arm64/kvm/hyp/include/nvhe/mm.h          |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  16 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 264 +++++++++++-------
 arch/arm64/kvm/hyp/nvhe/mm.c                  |  97 ++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  15 +-
 arch/arm64/kvm/hyp/pgtable.c                  |   6 -
 arch/arm64/kvm/mmu.c                          |   6 +-
 arch/arm64/kvm/pkvm.c                         | 129 ++++-----
 12 files changed, 365 insertions(+), 205 deletions(-)


base-commit: 52a62c117afb9ec3484a4d2fd6d0c4caff754c5b
-- 
2.49.0.1112.g889b7c5bd8-goog


