Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC03CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 11:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EooerGosbt9uNoLNk2R3r8CmWtmPXhr2JTyWgkAeP44=; b=mlQN34Lm9M9eXf1Cubqf4BbQWU
	FcX8DMh+zN22taHWxtKtxYiPmAQrSBmazjgE0lzuMyAS7jcKS/+cAJM5sZp12KVGFEraDkVna4G5A
	F4mrBuD2K8ilDt9CXWSGJy/Ib4lArhFqNkJIjBdq9kWj2JhkHiGBCtHd75V7scVY3Hq2uj6xgVr3m
	u4XwSJJa1eiEKJkdu/AxcilM7N6YEMpLllG24ZEnagl+pCm06j1Z+EyIF/EW329Qt/z7eCZL/QRpJ
	olMJN1y3JVC91UiLqS/g4DMxrArv/1DKWO99SPRHJqonVwZh6TG4MrldIZ8eHOhTz+HF+uuPNZYa1
	rY8WMmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2BN-00000004h1c-0n0Q;
	Sat, 17 Oct 2026 11:02:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2BK-00000004h0b-39fH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 11:02:32 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2e87c66e556so8991955ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234949; x=1792839749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EooerGosbt9uNoLNk2R3r8CmWtmPXhr2JTyWgkAeP44=;
        b=eyPN9INruwfMbeQ860L/JWHxU9aABGGNzDVeuvxwwZlYvlT6m/o7wr2xFrB+xAr8AM
         SPiW+ynVKiPaI+L32T3hT3N+lFV6tpM3ImhfkOJPcJIj5S9/oIS8CHB4hkhxmhaSf1Jo
         HJtmzQ1t+OZdtSaS2Q/YLesvNrdaji7PzdtERSanzaIcasSz5LxTnJAYzCEWOv7A+K5D
         0LkFZNPiXDuUqCu+krWaF8I50r2zjyTmvoL4xmZRdFIgLm8NqbvHUJBySXoqUm88bxKe
         36gXriPTZfm2Q1uQUD5xZ2JxrWtX0inpzpcXV1qd7AxbSxN6sP5J0tue3tuDiEhNTWMp
         SKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234949; x=1792839749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EooerGosbt9uNoLNk2R3r8CmWtmPXhr2JTyWgkAeP44=;
        b=TXrmUxN4HrCV7JyLCDxc2ZoPUtZjhyNvmXCCoysvj0TQYZIRWPoKUrelro1ECjXXWN
         MPqdpY3b6uR/IVbagLG65E/6D6/KtLJxtWRpfN/SI0Jk0guYjLRz4j7/7VAshDawKLat
         dWiqIwZbpMDhUKRiKjov75loneiMk4DP7cU05SU/Kg9mx/FlSRaLsZYQh/RC7TnOsKbK
         Xcp9BQuCAEHwR1qiK07AtSW4/CkZoHEPWJ9wsBW52CpXBd5BnNsKWVCBU9wc6YXrXWxl
         n9LowurKn2z8e8uxw8YNVwF7SDTDCnaAS28Hk3AuDsrjmuM5lE4eGzrL/Gyc30rOXqlm
         R63Q==
X-Forwarded-Encrypted: i=1; AKwUvBwomg5WzAF5C7oYNBFlgnT8BAT3enQCPTecfmB3N0+MgWSukp0UgKW49PI5CMo3UvqvlThuVjiIN2dSvtHjcS3H@lists.infradead.org
X-Gm-Message-State: AFq9FYKTwE0u7GLoCzm6FsgWxp+rfU7XSNHqi1IhrGyIh9fiHCu8FEhh
	jprb4bq7bc1EOJKH6qiTk0GwQ+smxLXCyFuEw+16FISvLU4g8MVfX24w
X-Gm-Gg: AYBFou2++gG+pGgz/nMRJuoTuEPNsplBR8qovVfCkb9mLV+CupAQqqmZjgnD0NYcFYs
	WEfBJsoa2TMhBdeAwcWudnivhHS8JvJAApaQJgUrEj0sQxDzSF95PRMnDtFy3OOE6LJ2p71HRcw
	zgHYafQlIHeIkHFYmbeI1J198tOPLF4v3jru5JhjO/S/RpfPQ4vb5kLdvpGPLsO2aL12x3e2+MG
	5kLLmArXcGxogvknfXZF/Bt0MphTUl5gDXail4RBKljnmtjFWlYxqyb71IapL9pPa8ZrTLPIdks
	SSSVqv6KevyTuDjzO+ubUe37o19oRcK/IFuihVxJVB9m45+lFQf/wNBgxOVPU2fLjQU3WzqbSQa
	SQCuA1Qoqf1GzvtFcREs4cwN2BhcQPoO+55hpcyy6hsWURA+PQWP/O5JAPc3NFDfERHSwLAkS7x
	7ZmdnD+6BOmnDxReYm7fnt0s7eN6+1+zsNYHhlTBOnJdg4u2sHNcKUmBl1GRuj/d280OSeYAOJX
	hc8LxGnOUGrR2O61dEHvg==
X-Received: by 2002:a17:903:1a10:b0:2df:a0d4:71de with SMTP id d9443c01a7336-2e9a66ebc71mr15900275ad.0.1792234948529;
        Sat, 17 Oct 2026 04:02:28 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:02:28 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 0/5] KVM: selftests: Reserve memslot 1 for ucall MMIO
Date: Sat, 17 Oct 2026 18:02:08 +0700
Message-ID: <20261017110213.46199-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040230_787250_14BCF461 
X-CRM114-Status: UNSURE (   9.92  )
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

This series addresses the TODO in __vm_create() to reserve memslot 1
for the ucall MMIO region. It introduces a shared base for test
memslots, migrates existing test users, and adds a read-only region to
prevent overlapping allocations.

A regression test verifies overlap rejection and continued ucall
operation.

Testing:
- Intel Core i5-10210U and Rockchip RK3588 (arm64).

These tests are changed but not tested: 
- arm64/sea_to_user.c: not enough memory allocation.
- x86/nested_vmsave_vmload_test.c: requires X86_FEATURE_SVM.
- riscv/sbi_pmu_test.c: riscv hardware unavailability.

The following test failures reproduce on both the unmodified base
<8edffbc1f6272db167037e1a8c49b99e9cd04803> with host kernel 
7.3.0-rc1-gd4b7fb647204 on RK3588 and with this series applied:
- arm64/vgic_its_save.c
- arm64/hypercalls.c

These failures are unchanged by this series.

Tharit Tangkijwanichakul (5):
  KVM: selftests: Introduce a shared base for test memslots
  KVM: selftests: Use the shared memslot base in memslot_perf_test
  KVM: selftests: Use the shared memslot base in memstress
  KVM: selftests: Reserve memslot 1 for the ucall MMIO address
  KVM: selftests: Test protection of the ucall MMIO region

 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../testing/selftests/kvm/arm64/hypercalls.c  |  3 +-
 .../testing/selftests/kvm/arm64/sea_to_user.c |  2 +-
 .../kvm/arm64/stage2_block_transitions.c      |  2 +-
 .../selftests/kvm/arm64/vgic_its_save.c       |  2 +-
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  2 +-
 tools/testing/selftests/kvm/dirty_log_test.c  |  2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  |  2 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  1 +
 .../testing/selftests/kvm/include/memstress.h |  2 +-
 .../selftests/kvm/kvm_page_table_test.c       |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 19 ++++--
 .../testing/selftests/kvm/memslot_perf_test.c | 62 +++++++++++--------
 tools/testing/selftests/kvm/mmu_stress_test.c |  2 +-
 .../selftests/kvm/reserved_slot_test.c        | 61 ++++++++++++++++++
 .../selftests/kvm/riscv/sbi_pmu_test.c        |  3 +-
 tools/testing/selftests/kvm/steal_time.c      |  3 +-
 .../selftests/kvm/x86/nested_dirty_log_test.c |  2 +-
 .../kvm/x86/nested_vmsave_vmload_test.c       |  2 +-
 19 files changed, 128 insertions(+), 47 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/reserved_slot_test.c

-- 
2.53.0


