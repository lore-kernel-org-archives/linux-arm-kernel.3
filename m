Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A719C28B26
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PvJOjZ7gASzBfvYGoJZPS5obCWwIrSTS1iwOGHLb12c=; b=dWnYV5dmb2QSoiZ4Exnt+AvjDX
	uQgkOxIsPbZqGnNwro2KFahozlVWjICxU2P4VLx64XbyrhCTuwn2wG+L7SJFtJpMc4tGCQJQ4WBPi
	jUbV8liDPrPyL+L2PDtg2By/GP0HAxHpKDRc1KL8Qq4LcOHAJDgUngFF7GFo1c/KEOzRZcxaiBKoj
	TL3mh4bZKctBBBrOcW91KumsbAmrxTpdvViKHbTbl7qCAfL3icS0vi54UBqEKF63hwOz/VqCQqYIh
	zqIsbpMSKbaFSHS1mIBanwWeFDs+xFjH/1X4uvHm0c+ZgxKXx/4djrSOT/hz36xKcxkgX7hp1nsVH
	dLZo3DQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9xG-0000000Arfg-0sXk;
	Thu, 06 Mar 2025 12:03:58 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8y7-0000000AiVi-1eSF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:00:48 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4394c747c72so1942265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741258845; x=1741863645; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PvJOjZ7gASzBfvYGoJZPS5obCWwIrSTS1iwOGHLb12c=;
        b=1RUiXaQKvSfPMbvCjb+7QmNumaWRcDwHvFsEraMfxnowvnUDQcVlr/gkKNR0EEc30P
         MZj/jdvwzC9RGtUOz6rXfq8MEXlvKIvsG/DjkNYsrEta0epZLpVFHYAxiCxnaVR2sJ54
         Yqv5jWH7vb6Z1EmHzuqea6earXxrChRRZqgTWAjXxdJQ/TeA3LFf/dQ7OX9Ao7XpGs+I
         c+jfWs/+fA5P1xdA+fUilDEOK+ECtPTGBhQ43C+mXvEllBNLdF3YpycbonJZIL5mlYgu
         cXGUQUb+QI7V1cbRYme/Zw2o4RHqWB72XFa3OInIwkGjXAOIThsTXx+vp5AB9C92ymHh
         hGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258845; x=1741863645;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvJOjZ7gASzBfvYGoJZPS5obCWwIrSTS1iwOGHLb12c=;
        b=dcyRDbif5H7xR5fNRFTSHzSM9ogUQYGSOZq/S7IYk8/FKPlCtigZ4mWfst4r37jZ2K
         KdJ6yBLfzAdR8T9H6PLJbgOh7IEHQCcQ9+NXWjK+WqczPlOqepTOsT20vEVgxOCnSCx0
         WWevEn4L4vrGcdHU4k75dXKeJfXrLfUSqcAiTYyiIxnV2++qUMlBlK5IIDDcW3LFTQ2j
         u8bt1Tscn44bWpkpIwubDshZOx0JJdj8WYYq5YwQKWDrniuOOsqsQuyzJvSUcr2G4x4q
         p4E046a4ax3sfzZTwVqukBGcTgJHmxWtLvokJh2wYapSjt0zMzTnK/Dz/3Qe/O9Hk+en
         lrqA==
X-Forwarded-Encrypted: i=1; AJvYcCVhEQeRClD5EjYvStA4MiVzOAuuO2GE8ZcSZ/8/YVnPOvmnLpZkuoqWVwCi7f3FjZ0mvJ4xAZPVFFuFjRa27DvK@lists.infradead.org
X-Gm-Message-State: AOJu0YxctoYc4L/HYUx14Wvn76bjRvT/ECI/IxMknGpCHxjUMuMSsduB
	nrGKiHgtz4Oa1kJgDqPjOUkVHOypqs92NyV4uylcGMlQNeP1jh09JCTo2EAzfi788dv/GuUrmvR
	MIaR3OaE6P+8S9yE8Hw==
X-Google-Smtp-Source: AGHT+IEGIm+qxrHFi7YMwd4v2mWCai/lo65N8Xe9xbdmYtOuCPL/1azW8IfDSK4oVWN0pRfPGkpSLhGS4zv1Dg9I
X-Received: from wmbet7.prod.google.com ([2002:a05:600c:8187:b0:43b:c6a4:89a0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190f:b0:43b:b756:f0a9 with SMTP id 5b1f17b1804b1-43bd295286dmr61943825e9.11.1741258845390;
 Thu, 06 Mar 2025 03:00:45 -0800 (PST)
Date: Thu,  6 Mar 2025 11:00:29 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306110038.3733649-1-vdonnefort@google.com>
Subject: [PATCH v2 0/9] Stage-2 huge mappings for pKVM np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030047_431126_122021F1 
X-CRM114-Status: GOOD (  10.48  )
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

Changes since v1: https://lore.kernel.org/all/20250228102530.1229089-1-vdonnefort@google.com/

  - WARN_ON() on !PAGE_ALIGNED size for guest CMOs (Quentin)
  - check_range_allowed_memory() before accessing the Vmemmap (Quentin)

Quentin Perret (2):
  KVM: arm64: Convert pkvm_mappings to interval tree
  KVM: arm64: Add a range to pkvm_mappings

Vincent Donnefort (7):
  KVM: arm64: Handle huge mappings for np-guest CMOs
  KVM: arm64: Add a range to __pkvm_host_share_guest()
  KVM: arm64: Add a range to __pkvm_host_unshare_guest()
  KVM: arm64: Add a range to __pkvm_host_wrprotect_guest()
  KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
  KVM: arm64: Stage-2 huge mappings for np-guests
  KVM: arm64: np-guest CMOs with PMD_SIZE fixmap

 arch/arm64/include/asm/kvm_pgtable.h          |   7 +-
 arch/arm64/include/asm/kvm_pkvm.h             |   2 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   8 +-
 arch/arm64/kvm/hyp/include/nvhe/mm.h          |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  16 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 236 +++++++++++++-----
 arch/arm64/kvm/hyp/nvhe/mm.c                  |  86 ++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |   2 +-
 arch/arm64/kvm/hyp/pgtable.c                  |   6 -
 arch/arm64/kvm/mmu.c                          |   5 +-
 arch/arm64/kvm/pkvm.c                         | 129 +++++-----
 11 files changed, 342 insertions(+), 159 deletions(-)


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.48.1.711.g2feabab25a-goog


