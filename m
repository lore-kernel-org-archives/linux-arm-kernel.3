Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A6FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 06:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DzZ/OwKmmQbXUKB6Ig9nkspgT/x2zvQUcWtNQDAlXJ8=; b=JD2dOK3RFXWQPP
	cQfME5rcCpyWTIg0wjt1nuosg5LVYLnkRgJeCVRtrGCUtTHtNmlT9r0bUCXBymZaKDCW2hIEzCjt4
	uyBYoPebWE2cB0wLAGBJ8ZkAHDwxD4lj69FK+/c92xOw0/7IJkSMSWVIIxDxi4jrvvOOtDyaVIp+Z
	xXLkZxb8uDe1McaLSMebZKeNMU2skopTELNS5eNOYYNPdMk+OJEVxvqiqoGf3uMTkNynF9KVOFAYS
	0itF7X/nhWXbyiSaBN6KO88VjaOY2kFwRYX8Tuf1FVOxNFw7aqSoaQww245TR7WnUXkdNBMOOb9bZ
	3twuBjhwh/cLx1QAeTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tscXd-0000000AHIn-0tXk;
	Thu, 13 Mar 2025 06:59:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscVx-0000000AGxQ-2wpK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:57:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-225a28a511eso10450625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849077; x=1742453877; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DzZ/OwKmmQbXUKB6Ig9nkspgT/x2zvQUcWtNQDAlXJ8=;
        b=1LUheUBGaWQWFfKsT4nlEnA2m6fYDvQhhb302dFNSnerismXDvna5N567qDGtXzv5B
         LB3MXaIDvSzOkvWZsTXh+ASyYcJ6JSFldOzBCkHW/Dw6yiA4YLzPr+Ryz7CbD8EA4t3k
         jmN6Qlnoc1l7ZtZ29291naKJj18n2mCe2Zm2RHS5PSiomcSAV4PxkQKI+OOMaGpv/ggl
         f/IqgYQYbzqbmPeFCkWIGsCRr4a7yrmv2bpplBn/YS1mYnuaRFrSOV/5NvD0eCbcBjVv
         zcDYWq1ImFMV+B0VqaS7jnpkOJfHegLCBTurGBgJl6i+BYf1XTtb3zbLjHlWdCouar1P
         SVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849077; x=1742453877;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzZ/OwKmmQbXUKB6Ig9nkspgT/x2zvQUcWtNQDAlXJ8=;
        b=k2wotydRDp9IPvTgPeULgTYTRXe7o8vd0lgj1YwqktkcdRN4gl4bbyzFX1dFttPxQg
         eQ7chSMA9bR0uCLJHrDNhDq7O+xp7SrsjzoLJZoJZKgaycxz2ACZeeoiE/Iix2VbFXW4
         7ahXXMbEo0XMWaUGYqZ3t2PXfjpCjdgF8VWMAQV72qY388sqfG8n5OwW4+o6ejt4HAfl
         fU9TezsNblj0jj6GAroSc3NBDVoQhe8QgcddeylkC1PfDFFcOUm1JYtlFBvT6c/u4rEz
         r1mjRHer75Snn3nrP6dyWPn9gRTwBnQ8Do/7ffhWtjR+TT9G833B6RS09LNv16KEcnOt
         cVMQ==
X-Gm-Message-State: AOJu0YyhqQRgu5D6DfX7NOoyFT3ztYCoY4XYQUr/GSIrB5+MIZRlP/Tt
	xFG7IZMmjXpW/QUUj1uD2ITlVbmUcCPiF9squdrUs9NFRQxlX1paISnUlqt6dZk=
X-Gm-Gg: ASbGncvre7Vg+VyrZUxIL0VYnUgX4Wzn5PabcxuT9Kka/x97J88Md/2P7evk1GarNQ8
	n/qCAiqMnMo2KCTCh2NR8cJjmwADe5IWy3ORFENM2JO+Z6e5VTY9SM/cITilKg/TR1jVoYG1kRM
	PTQN//Nhor103okQUdMX+2AUBpzRR+/YjzWQky4dBupYz46A5mBJPzBSA9YTN+8CL7Bb7zvPIQI
	QfTbvXqwRujzYMZpAsJFC/Da10LjOjMCnD8+nkvoafQ1je4HzZ7QkEY4FkWVfeW+n+iicUgX3ck
	GTqw48GVBPo90dJyqYiG6YsW1di0xCgJnwHBzYQdqxOuKURj
X-Google-Smtp-Source: AGHT+IFJys5eR6oUmPsgD0nQ7bgGFWSfRnMTkiQzEi9pZgL77FdSzGwIkj2Od2Zq73fxdD3yVQX53g==
X-Received: by 2002:a05:6a00:c95:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-736aab16545mr42898380b3a.24.1741849076765;
        Wed, 12 Mar 2025 23:57:56 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73711694b2csm624169b3a.129.2025.03.12.23.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 23:57:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 0/7] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
Date: Thu, 13 Mar 2025 15:57:41 +0900
Message-Id: <20250313-pmc-v4-0-2c976827118c@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOWB0mcC/2XNyw6DIBAF0F8xrEvDU6Wr/kfTBQ5QWfgINERj/
 Pei7ULT5b2Zc2dB0QZvI7oVCwo2+eiHPgdxKRC0un9Z7E3OiBEmCScMjx3gRhFdl9opIQHlyzF
 Y56d95fHMufXxPYR5H010a88+UUwxaOdUrYjiBu5Gz72frjB0aBtI7IiqL2KY4BI4r6SWjlrxh
 /gB0d8nnhERlIJupAFuTmhd1w9opBY6AQEAAA==
X-Change-ID: 20250302-pmc-b90a86af945c
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_235757_763904_3DC44B29 
X-CRM114-Status: GOOD (  11.17  )
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

Prepare vPMC registers for user-initiated changes after first run. This
is important specifically for debugging Windows on QEMU with GDB; QEMU
tries to write back all visible registers when resuming the VM execution
with GDB, corrupting the PMU state. Windows always uses the PMU so this
can cause adverse effects on that particular OS.

This series also contains patch "KVM: arm64: PMU: Set raw values from
user to PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}", which reverts semantic
changes made for the mentioned registers in the past. It is necessary
to migrate the PMU state properly on Firecracker, QEMU, and crosvm.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v4:
- Reverted changes for functions implementing ioctls in patch
  "KVM: arm64: PMU: Assume PMU presence in pmu-emul.c".
- Removed kvm_pmu_vcpu_reset().
- Reordered function calls in kvm_vcpu_reload_pmu() for better style.
- Link to v3: https://lore.kernel.org/r/20250312-pmc-v3-0-0411cab5dc3d@daynix.com

Changes in v3:
- Added patch "KVM: arm64: PMU: Assume PMU presence in pmu-emul.c".
- Added an explanation of this path series' motivation to each patch.
- Explained why userspace register writes and register reset should be
  covered in patch "KVM: arm64: PMU: Reload when user modifies
  registers".
- Marked patch "KVM: arm64: PMU: Set raw values from user to
  PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}" for stable.
- Reoreded so that patch "KVM: arm64: PMU: Set raw values from user to
  PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}" would come first.
- Added patch "KVM: arm64: PMU: Call kvm_pmu_handle_pmcr() after masking
  PMCNTENSET_EL0".
- Added patch "KVM: arm64: Reload PMCNTENSET_EL0".
- Link to v2: https://lore.kernel.org/r/20250307-pmc-v2-0-6c3375a5f1e4@daynix.com

Changes in v2:
- Changed to utilize KVM_REQ_RELOAD_PMU as suggested by Oliver Upton.
- Added patch "KVM: arm64: PMU: Reload when user modifies registers"
  to cover more registers.
- Added patch "KVM: arm64: PMU: Set raw values from user to
  PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}".
- Link to v1: https://lore.kernel.org/r/20250302-pmc-v1-1-caff989093dc@daynix.com

---
Akihiko Odaki (7):
      KVM: arm64: PMU: Set raw values from user to PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}
      KVM: arm64: PMU: Assume PMU presence in pmu-emul.c
      KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
      KVM: arm64: PMU: Reload when user modifies registers
      KVM: arm64: PMU: Call kvm_pmu_handle_pmcr() after masking PMCNTENSET_EL0
      KVM: arm64: PMU: Reload PMCNTENSET_EL0
      KVM: arm64: PMU: Reload when resetting

 arch/arm64/kvm/arm.c      |  8 ++++---
 arch/arm64/kvm/pmu-emul.c | 60 ++++++++++++++---------------------------------
 arch/arm64/kvm/reset.c    |  3 ---
 arch/arm64/kvm/sys_regs.c | 53 +++++++++++++++++++++++------------------
 include/kvm/arm_pmu.h     |  3 +--
 5 files changed, 53 insertions(+), 74 deletions(-)
---
base-commit: da2f480cb24d39d480b1e235eda0dd2d01f8765b
change-id: 20250302-pmc-b90a86af945c

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


