Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B54C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a7gSbBmwEbrzvNYYQSCJBfxoOPDdFppaV9wKD8t7PFc=; b=aVncBq5X+JhLzmTNZcGLRhFhJb
	x/7zZC0XJ51JhnG+DpZqcfmES5C8bYuLCT09YYyHcBszyCq4d2kR42hzuEWFotbHkRNOK7D5Ko0E1
	PNeG+/xK2FHAoDtWiImGeIf9Ccr3hGWHqQfvshFTrdNkXZf14Js9wEVUbYsXAJj6PKlXMua3uXQzV
	sUGgTDobWCSvsStH3n5gi3yUQcoUi5i7/tKI2fFLD8oyWFD7F3dUscxW+vldgoXGuT98OH+jMg15Y
	QR3xLI9mAefollfS7D3Y6M4rLTPDnlfxOagHHg5zJANvrQtx+mg0RfK45Px+xe7Qt0X3ce4vM2Oqt
	IfFZM6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOfj-00000003wKs-0leX;
	Fri, 09 May 2025 14:25:55 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNbF-00000003iyG-0mir
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:17:14 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a0b7c8b3e2so1385926f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796631; x=1747401431; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a7gSbBmwEbrzvNYYQSCJBfxoOPDdFppaV9wKD8t7PFc=;
        b=EY5SHAt56ozm9eXpVmTXoC/IOhqLzVRMen3BqXQ85h/1s17QgM/qhSJMRND4Bv4cd6
         40+oxh4UFQ/X7zZX/ilnfDbdeLJSXLlFSWcEDzd6K3Q3RGBfGBH9u0kmT5x++VCErxRR
         WLD6jEn52rCTY+UPMRZNEmqr5oL5XGpE6LWHlQNh15NVTFoyCmT2Hw6pBUDmPJuXRxIT
         8ZkCRt8gQuDjDOGndjwe4Frwi5+MPvqbx9Z/g3K+SbXPgbd6buCnR1GsqngpsK+y6WRn
         BScu7GuQRB5weENhu+JDTqtc1NFl3i9dXYklBfW68YYwilqIUrBkH49Rh1McnR76gyet
         kn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796631; x=1747401431;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7gSbBmwEbrzvNYYQSCJBfxoOPDdFppaV9wKD8t7PFc=;
        b=JSriHJb+xT/6yDb6qrXZuzC8SzJBQyXe7ijED5JWfxKDUYtibM/X+pQTBsXwCxa6OD
         oeiEO2Rq/VLZhb7P2hM6cPLkKHMmKnBoNe/eFp5vUfcWNf/UoMj71aXtF9hEvp4YFAzv
         3JgNpr7v8KgcFk1atlOVGuwN8OutiOQ7pFLIGx/+XXdWNLePPz0WuvQyJyNJXfXd5lsY
         +3lyOhEhppbo+MJ/6dx2KeZ+lA7VAZfexZLarAwjxAHB/aMVJbAuz9cbviGJtnj6cmq1
         F89ms5CFnuFHn0U/ByOqOHmUQynix0zWgBoYMEA2mkRKoizwKt8mS1Ku5VJYVd6QUINQ
         hAgg==
X-Forwarded-Encrypted: i=1; AJvYcCWbvd4UP9uRymxtZqgXFbuOZwOq7abXyjrUE+D0mBC19Go4XiokOACoBP0ihkdUCmW6pNEhziDPSn+CpCixn+6z@lists.infradead.org
X-Gm-Message-State: AOJu0YzQCqpivikU2nuMEkuwyWbqUtzGnA9qtX1QNcd4Gisztc4u25kF
	S3guRMu9Pis16xFyXSdojcslK68VpMW8AA9h/JfaFD1qNHh5adUWhynGhtxSBGYjd7tewgAoiD6
	yec799nzbw/QvHdkW+A==
X-Google-Smtp-Source: AGHT+IFi6w9266SPSYPxeLRdeQM8z/1XJhDeBgZ2t8xI6U1+Kw8j1L1qN5yPWtzyq3Jue0kea8Vb5SL0z32sr5OS
X-Received: from wmbfm20.prod.google.com ([2002:a05:600c:c14:b0:43d:8f:dd29])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e3c1:0:b0:3a1:f654:ebec with SMTP id ffacd0b85a97d-3a1f654ec75mr2409729f8f.38.1746796630943;
 Fri, 09 May 2025 06:17:10 -0700 (PDT)
Date: Fri,  9 May 2025 14:16:56 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-1-vdonnefort@google.com>
Subject: [PATCH v4 00/10] Stage-2 huge mappings for pKVM np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061713_222953_5C3FC1E2 
X-CRM114-Status: GOOD (  12.05  )
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
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 276 ++++++++++++------
 arch/arm64/kvm/hyp/nvhe/mm.c                  |  86 +++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  15 +-
 arch/arm64/kvm/hyp/pgtable.c                  |   6 -
 arch/arm64/kvm/mmu.c                          |   5 +-
 arch/arm64/kvm/pkvm.c                         | 129 ++++----
 12 files changed, 375 insertions(+), 195 deletions(-)


base-commit: c4e91ea0cc7e6345a4f7b8167e838d728ca86c30
-- 
2.49.0.1015.ga840276032-goog


