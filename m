Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7D0C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=04SbAc//VYkDj1IMLyHG/BmwbhPG6uTcl3uHd/dz/BI=; b=yN4GiFW2dan1TS
	t0BUuWx8deY4WPkb5DsvFBR3nO4gzL4kbZXtDX1HRG4QYqGOTcHU2m+arnCWBz1FSFX8TEd8mIPW7
	tlLKNxcy4zd9Gi98Dc74VdwyEzVKgLmdBUZ9q19mZiFulah+kbz4J4Pd+PqVpvjygm2mPaN7kArrT
	8FocbmWqRk7RZG+PyC9HnBA2K9/kd7Gc+3NklXGVwNj3FDp2jAQj8rLpjd9jeQNkVPZp95Qo2MGM7
	TiXG9ZM/k5hPSG1WKSM0novkxgFMD7ATKA4eAyXPeOcYCUdKsn+bSy4QxH9d5VAXsermR/KksFt5g
	ywykSFy2jmQQsX6jJ9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaLr-0000000Ekzq-0XYE;
	Wed, 06 Aug 2025 09:22:27 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaAm-0000000Ej9c-3IDr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 09:11:02 +0000
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 5769A4Q3005818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 6 Aug 2025 18:10:13 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=04SbAc//VYkDj1IMLyHG/BmwbhPG6uTcl3uHd/dz/BI=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Subject:Date:Message-Id:To;
        s=rs20250326; t=1754471413; v=1;
        b=XEsBx9IL1udj/IyQHko/lhxsGUKJnAMTGyD6LZOzTQNNIBBMmB+owrZBhNRAY3Zt
         DCl7SGKRwTdo0a/DCr88QNE4yZrv4Y4qiMvLI8Ba48/tWugukGW0HkDvgp1brHEY
         WMAGmkFQHI3jbtf3vHTgRpLTMVbCrMhB/NQVPTDKJ0JdM6hwuRB50Memt2+KbBTE
         UbiasCzNdvjQSKAKqJi7qqwybDdmOLx6wgUtcpV/fMk/2TKAaSTBx9s6LfhA+qEi
         L/Ly7LCfvGHHUshrmn+2UFUI4eqTLbNHiWdAiTdysMPTWcuWwPe5gb63gFtw9E9y
         4fxayjyrq+lW7QIi7WGvPA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: [PATCH RFC v2 0/2] KVM: arm64: PMU: Use multiple host PMUs
Date: Wed, 06 Aug 2025 18:09:53 +0900
Message-Id: <20250806-hybrid-v2-0-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEbk2gC/zWOyw6CMBBFf4XM2pK28oisTEz8ALeGRWEGmQWgL
 TYQwr/bVF3eOyfnzgaOLJODKtnAkmfH0xiCPiTQ9mZ8kGAMGbTUudQ6E/3aWEYhFeZdl5WEqCH
 AT0sdL1F0h9v1AvW3tPR6B+n8uzTGkWinYeC5SnyRqiKCPbt5smv8wqtIxsGjOv0HvRJKZKgMG
 iWplPkZzTrykgYb1Pu+fwAs6cmzywAAAA==
X-Change-ID: 20250224-hybrid-01d5ff47edd2
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_021101_056972_8E96025B 
X-CRM114-Status: GOOD (  12.72  )
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

On heterogeneous arm64 systems, KVM's PMU emulation is based on the
features of a single host PMU instance. When a vCPU is migrated to a
pCPU with an incompatible PMU, counters such as PMCCNTR_EL0 stop
incrementing.

Although this behavior is permitted by the architecture, Windows does
not handle it gracefully and may crash with a division-by-zero error.

The current workaround requires VMMs to pin vCPUs to a set of pCPUs
that share a compatible PMU. This is difficult to implement correctly in
QEMU/libvirt, where pinning occurs after vCPU initialization, and it
also restricts the guest to a subset of available pCPUs.

This patch introduces the KVM_ARM_VCPU_PMU_V3_COMPOSITION attribute to
create a "composite" PMU. When set, KVM exposes a PMU that is compatible
with all pCPUs by advertising only a single cycle counter, a feature
common to all PMUs.

This allows Windows guests to run reliably on heterogeneous systems
without crashing, even without vCPU pinning, and enables VMMs to
schedule vCPUs across all available pCPUs, making full use of the host
hardware.

A QEMU patch that demonstrates the usage of the new attribute is
available at:
https://lore.kernel.org/qemu-devel/20250806-kvm-v1-1-d1d50b7058cd@rsg.ci.i.u-tokyo.ac.jp/
("[PATCH RFC] target/arm/kvm: Choose PMU backend")

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
Changes in v2:
- Added the KVM_ARM_VCPU_PMU_V3_COMPOSITION attribute to opt in the
  feature.
- Added code to handle overflow.
- Link to v1: https://lore.kernel.org/r/20250319-hybrid-v1-1-4d1ada10e705@daynix.com

---
Akihiko Odaki (2):
      KVM: arm64: PMU: Introduce KVM_ARM_VCPU_PMU_V3_COMPOSITION
      KVM: arm64: selftests: Test guest PMUv3 composition

 Documentation/virt/kvm/devices/vcpu.rst            |  30 ++
 arch/arm64/include/asm/kvm_host.h                  |   2 +
 arch/arm64/include/uapi/asm/kvm.h                  |   1 +
 arch/arm64/kvm/arm.c                               |   5 +-
 arch/arm64/kvm/pmu-emul.c                          | 495 +++++++++++++--------
 arch/arm64/kvm/sys_regs.c                          |   2 +-
 include/kvm/arm_pmu.h                              |  12 +-
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 148 ++++--
 8 files changed, 461 insertions(+), 234 deletions(-)
---
base-commit: 8ec6d99a41e3d1dbdff2bdb3aa42951681e1e76c
change-id: 20250224-hybrid-01d5ff47edd2

Best regards,
-- 
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>


