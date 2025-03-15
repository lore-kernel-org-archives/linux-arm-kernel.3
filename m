Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA1EC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KLwVXPbbRkF8uCWikKGIA8xgMN+KuKWxo6BOl1fHSvk=; b=Nu8JF/TzVggslN
	o3AiM6nOAhh/rvPi4vRRHZ8GvPk60+PPNRcv3hEXYWkQZoeOplqNYwo4ADXo6BWu36jRTFgeO7rRd
	43c70NIxEFGp9Hs976xZ7MfJaZfV3aC+1zyFXhSbyTDrnY6MB8iS5wbMfj0AJRO9Fe4ZyGD5IX0WA
	OhFOcASiG66YkS95JSA0FXfUvrhC0Ha3twpPVWKvoznJw2Z0lQhtht6hWsFH9djTBUUXm1yKSxoTg
	dJ4192ToT+vy6nIBsFQtquWFbjE0Ru4wM/H6B40dfu79zXgCG72n9Csja6mzmMjHmGigm53vSnUmx
	srnpReNiEN62LsApqatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNbA-0000000G68t-0vyS;
	Sat, 15 Mar 2025 09:14:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNZS-0000000G5lj-35PW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 09:12:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2235189adaeso49878545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 02:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742029961; x=1742634761; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLwVXPbbRkF8uCWikKGIA8xgMN+KuKWxo6BOl1fHSvk=;
        b=Wolhkcim3gRGDX9w8vDPAUEQuo7WdK6Ok1sDuTUNXIKj5ll1x4mwkCy7zjuf/7r+8T
         8saLKWBOkQW47pc6aYzoNVqRpOXNdD+NNM9AzfY1aYhLXhrxWgUJTL/Y4kNj06E6g/ms
         DC2419Ax/LcrqnTCrqf9NC7gMmlw8jrhFquTlPViBlVoPHFTFS00mjcDBlc11yw9sFL0
         GXe7kmwQ7pMDSBRfIfBWJs4JPGRgSEWYvRHpEByvMLEt5mWZNTz5/Jt/U6Dgi7EDSSDX
         7v/2f4IJEVKOBm/APN5zoO+ag/htww8KxzvYJVYnuO/Gz9M5f7q4OGqp+oy6NAANLam0
         1Atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742029961; x=1742634761;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLwVXPbbRkF8uCWikKGIA8xgMN+KuKWxo6BOl1fHSvk=;
        b=usnyDkhYOKi4uqMmdqxkhuiPtV3q2nYv8pIxosZUbsbwPyYl7OTsla27EwLZvi9evG
         PR6VfjD7d8SekdjlXD/IGDZyrmg3Y9FpYcMXfQGdYlyM4mwwgkvjRgmmfkHRwt0xmLYO
         TnZ6s/lotdmxzS6OLhzzbC+o9LcEuisMxCbgKumEOSoCn9aD1l4iwZEPoy2HVL2q9r2j
         GdhNx5NB25Y6jxjz9pVDjA4vTEeeWz+LIMWnpevka0i9qjp6Nyp8eW0/WkRAL4httwqZ
         WkWZGk6DLIy1CEZktf/wOTh4OvsDTUAtnK7HbOH6SlqjGIWzX5ReKjmpANYWet32z+QT
         HxPw==
X-Gm-Message-State: AOJu0YwTOFRmuS9dk+D01SmCDJhSNn3HTN8G5ryR3CE3iAALyF4JexKU
	anW8TbnO3L9JcBjx4AW2a1OWS/CpSML4CruejRhAYt4WclYMH9ryO4483E6KLLM=
X-Gm-Gg: ASbGncvYvQSgo3/pRx3+1iqeZ1u5UlWkUFOeMQ5g2RdPkYC3ai/hx0Fs+qSLD9VwiGF
	/KrahWgKR0v49L3Eep7OCIt4FBIoL9BCe9MDJhOmi7VNbwjV5OIaHsNcUpZnKU7Ry2ozYHmTg11
	QbHZQO65PVZw8Dbnu4gxMo84fnKH8WPuV/Mf12iBXE81g8RI2RRpWTMxLdiRGI/iUH7SMK04iVP
	qlsMSyj4X9fcquRsgNi2bSXYq3qXlFAQUI5pnDTfXKkxifub4ywRtSNmf/44SvrR8ByL8h0wETx
	GCpLBuiQzRZUdJFcrrgQCXP69+sqnWD6Ympmt184NDSmGe0c
X-Google-Smtp-Source: AGHT+IFQlkAYLQJz9OZLtD7VhX6ghBBoAGJzqQtpfj3z/JvhpgmI8tBgESFhabIFaTXRXazJxYdPNQ==
X-Received: by 2002:a17:903:3c64:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-225e1681376mr66493455ad.2.1742029961548;
        Sat, 15 Mar 2025 02:12:41 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6ba7255sm40793705ad.126.2025.03.15.02.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 02:12:41 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 0/5] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
Date: Sat, 15 Mar 2025 18:12:09 +0900
Message-Id: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGlE1WcC/2XQQW7DIBAF0KtYrEvFMGAgq96j6gKGccPCdmq7V
 qIody+Ju3CU5Qfeh+EqZp4Kz+LQXMXEa5nLONRg3xpBxzh8syy5ZqGVtgqVlqeeZAoq+jZ2wVg
 S9eRp4q6cHy2fXzUfy7yM0+VRusJ99dmvIEFS7LrggwqY6SPHy1DO7zT24l6w6j1yG9JSyZYQn
 Y22AzYvCHcI/m/CipQBoJhsJswvyOwRbshUpCm41msH4J+fd9sGnvjnt/7Wsk0tUpxZ1v2+LIf
 GK7aGvQkAMWgko7JLzIgRDUEyicH47GItu/0Bqtb5MIIBAAA=
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
X-CRM114-CacheID: sfid-20250315_021243_071739_EC74703B 
X-CRM114-Status: GOOD (  10.87  )
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
Changes in v5:
- Rebased.
- Link to v4: https://lore.kernel.org/r/20250313-pmc-v4-0-2c976827118c@daynix.com

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
Akihiko Odaki (5):
      KVM: arm64: PMU: Set raw values from user to PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}
      KVM: arm64: PMU: Assume PMU presence in pmu-emul.c
      KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
      KVM: arm64: PMU: Reload when user modifies registers
      KVM: arm64: PMU: Reload when resetting

 arch/arm64/kvm/arm.c            | 17 ++++++++-----
 arch/arm64/kvm/emulate-nested.c |  6 +++--
 arch/arm64/kvm/pmu-emul.c       | 56 +++++++++++------------------------------
 arch/arm64/kvm/reset.c          |  3 ---
 arch/arm64/kvm/sys_regs.c       | 52 ++++++++++++++++++++++----------------
 include/kvm/arm_pmu.h           |  4 +--
 6 files changed, 62 insertions(+), 76 deletions(-)
---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250302-pmc-b90a86af945c

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


