Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A6DC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1R+g8p9p/0+qgGtEWSsfrtXcyJzKxwZsoiTTrliTdnI=; b=h5GTQZo++9wpjby9L82N7gUa3x
	1gaB1ib3GHt3YKzmEoF3w/7ZS+vMe0IsxnNtEdSb0eg0drd7hRDvZDIJZrgaAxrb7wGYeuiigKru5
	nLZ8aT9HER2ZhtIjn9RdiAIUYhH/8P92912kg5OXzLJhiJoJtkRckMEhU7WHNlH8uivaKDP+5Ofc9
	Kql5nGRhQc7CpVxQ0yuttatxp0+L+WqDccRyyDgPWZtJyYpazQQY0qwF+5JiOZYCPVPdsBJk6t0WB
	3EfO3CbbPC23PVvitBJy+Wpfb3VU1z5IEuCK3ZUGJgXoL2aTeaers248jA1aVg+rBIqagh9e++ciy
	KWTagZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJt1-0000000CI28-4B4K;
	Tue, 20 May 2025 10:07:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIil-0000000C57g-2rC9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 08:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1R+g8p9p/0+qgGtEWSsfrtXcyJzKxwZsoiTTrliTdnI=; b=lWxuf/H1eJ4Sr3OcJhsNZzybKY
	c8KEAwGWni0TETSW375T3PDrZOVep8iXPLJJU8zyjr5nVFTuXHcoAg7EABMCp32oPavpgBKlgNj5B
	9rxlyEQOnrf49oBDqOAr+NBMGysC0Ny2vvUPFNYCp8RO5D1Tn/Gd8Zoirm2YFFHJlnujaJ4KjhlnS
	NxyFlH9tV3GaRo+S4MzxOZFdmhbsuvHlImyMZzKgakwx4LylkpMb+utLw+yC7caokqF2Eq+Dwc6M9
	YdoJajF/RHR7Y4Wk44cT6lrZHWfYk4TpRwiqmz7+5yZc6rEqhu4j0xwd2ERWwUMqG+Fk3PGQPGWiY
	uEqxOHkQ==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHIie-00000000joF-0vis
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:53:10 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a370309e5cso1313610f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731180; x=1748335980; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1R+g8p9p/0+qgGtEWSsfrtXcyJzKxwZsoiTTrliTdnI=;
        b=4oOBq6wuaC6/fwqo3dcN4Wm+ExG0WeKsM1+SIH5cuBEOazknsE9Er88cg+3ZlXlOMH
         ESCrssFUsGYf8iw7cdTJ4+m9GIOz3WgMrF67S2kRdLbgjh6xf6hzXvP2c3Uyla6Wkgu0
         aJy2Rq4Li7gnGGJTKU3z6ufEUrVrqo53hAS6yGjNxyzBfnv0WyCTpTsvmHDOMtf9TfXl
         cR5tBJKdPWJqi2OzYJ+ybcnH37GiP828Z3bUpNQ543BQ46Y94qyAWluMNfdePv3mmhmM
         2AYNto8YbqprQdEoSY/PFz+s31kaTaJ2FqVBvJenj0PBD3lb/nddUJf1ab8qa97lmfkQ
         MNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731180; x=1748335980;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1R+g8p9p/0+qgGtEWSsfrtXcyJzKxwZsoiTTrliTdnI=;
        b=Axh8fFhUEXkcRIVzx6p8iLyPRzweeAiG/icIaddH6ayHG7mHl3SIdpzyUQcgoUTjc5
         7AU+0s0HXRkfhqCaH945rjuvHSJhee1SIldXrizsd2DxwUzd6EeUtfZEzJqR3LU9CELv
         JbcQ+lOvQYtCP8bmZnlHB4aL491GaTH5Zz6OqCHBVEIf2zdFea+3IQ93TZqzaZiBveHg
         GTv2BrSBv8t85d/8XMTyDpg3mY72WjlWcVFwQogCCU3Hh0tLxBjG1EmvCaLB7ofDdeyw
         4zq9adGA+KkDl7flolU/wmuTXIHkMoVN3L7qggyY05/qWY1ihAUIZYELqWFHYHM8F09l
         120g==
X-Forwarded-Encrypted: i=1; AJvYcCXpffRIPgmsA37QfJxGCu7KfcKdwQWvEdndTqpel8bYCgrlkqfN2V7MrvGvCDQD2deSNpVTAO/w0AikcdWt3f5U@lists.infradead.org
X-Gm-Message-State: AOJu0YyneoCX1V7vUCzNhupkA8bw9dy/nx3PAaZ9n+krp6IfkCTDvj2f
	ibpAtiZ+mQxdlq+1aM7Dfx8mcLmpqjnJs8bpq1VOqrdUe0TQXwQqLjNg/vFMxSE6wO/P24ANJVh
	s1Yu+6w2F+e6tMQXFscgAwg==
X-Google-Smtp-Source: AGHT+IFvnJ0x096AewJLW91FfyVpd0hjBTiaPSvB/MeNfz/Q4KVLUUxYR8v5yoCX37oRP3aJR89EPXhq3td9C3jQ
X-Received: from wrbee4.prod.google.com ([2002:a05:6000:2104:b0:3a0:b3cf:8dee])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5986:0:b0:3a3:76da:32b3 with SMTP id ffacd0b85a97d-3a376da331fmr3865387f8f.18.1747731180063;
 Tue, 20 May 2025 01:53:00 -0700 (PDT)
Date: Tue, 20 May 2025 09:51:51 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-1-vdonnefort@google.com>
Subject: [PATCH v5 00/10] Stage-2 huge mappings for pKVM np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095306_939045_74E57DFA 
X-CRM114-Status: GOOD (  12.30  )
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


base-commit: c4e91ea0cc7e6345a4f7b8167e838d728ca86c30
-- 
2.49.0.1143.g0be31eac6b-goog


