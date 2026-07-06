Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B7AC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u9ylCnyhodN1ABO4bi2JZj59coCy9WQ2YLNSBMgoIis=; b=J3FNz7pAxpxn8J
	XoazKNRI5HTiL5fKB8WMWIVg5VITZPd9PBHJtTYoeflWgCIrT2lihpC5T2jQn7qI4igdMOxV89TDB
	uWRyOeN0MXM4+ARr/lTloCv/STNDB38DI+5ycaWAN4wPCEqY4YOGK83Hg0NkB8G5lb1acm4MPFPY9
	GsUc9o7jI0wFBGOT8y0h0HSjzOY6NIPaj7foZPTMizSpcXk3dXAiK01AqZdUdLWlwQyiaA9pV+ATW
	UPR5xpq6um6CMMLG2tC48s2Tj1nsEoHMoxV7F+82bsocZYdsDom2VNaNdTRikhDZBB+fOdxaPc4QQ
	OFQLAT8oy5f0NIWzpdIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggBg-0000000C8cw-3qfk;
	Mon, 06 Jul 2026 10:04:28 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggBW-0000000C8WI-1CyF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:04:19 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 666A3TQ3013128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 6 Jul 2026 19:03:43 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=u9ylCnyhodN1ABO4bi2JZj59coCy9WQ2YLNSBMgoIis=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783332223; v=1;
        b=UQOoy6nvYHKBsdWzumgQytbv3x0zNPPfjDpWb5TNf7lxZyQ1iG4Nas7wg+ig90Sh
         +vYHlj0QeDkuM0mDFC07QrB7o7u4b2zuUv4u0CqgzumbWYai5EsUJHYlV2PWkHqY
         iuiSqnhVeOaNyzIPVLK6lJvyANfay16QHSwiWiVcNjQ6fNIhQu9IGelFE4QxVftE
         k/uPp3XIZoOGwTmmnI8gNBHOiuF6Y2qv5RfFyOUUd6rhVqWAeXhWRt6nUab9iD03
         a44iMO5Vo1JIAdUPCUIrkgDkapkjysMW8i++IPYcOC4cSd8k+S9UizXiQxxZnm4E
         AYHWOdoqEYzm69FbFlS2JA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: [PATCH v8 0/7] KVM: arm64: PMU: Use multiple host PMUs
Date: Mon, 06 Jul 2026 19:03:23 +0900
Message-Id: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Ry27CMBAF0F9BWdeRHxM/WPEfVRe2ZwxuBaFJi
 IgQ/14TRGBTltfyHF+NL1VPXaa+Wq8uVUdj7nN7KMF+rKq484ctsYwlV5LLhksJbDeFLiPjApu
 UwBCirMrlY0cpn2fo8+ueO/o9FW+4H1bB98Riu9/nYb0SRNKgj4EajICUwArjAK1zqE3gCI3h3
 EF1s3a5H9pumjuOYsbmOkq4R51RMMEAhUcvOBnebNBPh3yuy4OzMcrnnOV6mZOMM6618BSVTzZ
 uun5bx1zn+sSG9mdqax/r7+PdUA9Dl1U0i6GKAZpsIim5tfytAU9DCbMYUIyAWoaIYDXAW6N5G
 iDEYjQ3g4MKgC6Bo7eGfjXUYuhikHFoNE8mifDWMK+GXQxTDBmSch7LH4b0r3G9Xv8AO8RVVIE
 CAAA=
X-Change-ID: 20250224-hybrid-01d5ff47edd2
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_030418_560209_67543EC7 
X-CRM114-Status: GOOD (  17.34  )
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

On a heterogeneous arm64 system, KVM's PMU emulation is based on the
features of a single host PMU instance. When a vCPU is migrated to a
pCPU with an incompatible PMU, counters such as PMCCNTR_EL0 stop
incrementing.

Although this behavior is permitted by the architecture, Windows does
not handle it gracefully and may crash with a division-by-zero error.

The current workaround requires VMMs to pin vCPUs to a set of pCPUs
that share a compatible PMU. This is difficult to implement correctly in
QEMU/libvirt, where pinning occurs after vCPU initialization, and it
also restricts the guest to a subset of available pCPUs.

This patch introduces the KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY
attribute. If set, PMUv3 will be emulated without programmable event
counters. KVM will be able to run VCPUs on any physical CPUs with a
compatible hardware PMU.

This allows Windows guests to run reliably on heterogeneous systems
without crashing, even without vCPU pinning, and enables VMMs to
schedule vCPUs across all available pCPUs, making full use of the host
hardware.

A QEMU patch that demonstrates the usage of the new attribute is
available at:
https://lore.kernel.org/qemu-devel/20260706-kvm-v4-1-089cac8c25c3@rsg.ci.i.u-tokyo.ac.jp/
("[PATCH RFC v4] target/arm/kvm: Choose PMU backend")

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
Changes in v8:
- Added patch
  "KVM: arm64: Disallow vPMU when pPMUs do not cover all CPUs".
- Split patch "KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY".
- Documented the FEAT_PMUv3_ICNTR support plan.
- Ensured KVM_ARM_VCPU_PMU_V3_FILTER and
  KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY are mutually exclusive.
- Ensured KVM_ARM_VCPU_PMU_V3_SET_PMU and
  KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY are mutually exclusive.
- Dropped the code to support KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS for
  KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY.
- Added a function to de-duplicate
  "test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, ...)".
- Link to v7: https://lore.kernel.org/r/20260418-hybrid-v7-0-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp

Changes in v7:
- Fixed the vCPU run hang in test_fixed_counters_only().
- Link to v6: https://lore.kernel.org/r/20260413-hybrid-v6-0-e79d760f7f1b@rsg.ci.i.u-tokyo.ac.jp

Changes in v6:
- Removed WARN_ON_ONCE() in kvm_pmu_create_perf_event(). It can be
  triggered in kvm_arch_vcpu_load() before it checks supported_cpus.
- Removed an extra lockdep assertion in kvm_arm_pmu_v3_get_attr().
- Fixed error messages in test_fixed_counters_only().
- Fixed the vCPU run in test_fixed_counters_only().
- Link to v5: https://lore.kernel.org/r/20260411-hybrid-v5-0-b043b4d9f49e@rsg.ci.i.u-tokyo.ac.jp

Changes in v5:
- Rebased.
- Fixed the order to clear KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY in
  kvm_arm_pmu_v3_set_pmu().
- Fixed the setting of KVM_ARM_VCPU_PMU_V3_IRQ in
  test_fixed_counters_only().
- Changed to WARN_ON_ONCE() when kvm_pmu_probe_armpmu() returns NULL in
  kvm_pmu_create_perf_event(), which is no longer supposed to happen.
- Link to v4: https://lore.kernel.org/r/20260317-hybrid-v4-0-bd62bcd48644@rsg.ci.i.u-tokyo.ac.jp

Changes in v4:
- Extracted kvm_pmu_enabled_counter_mask() into a separate patch.
- Added patch "KVM: arm64: PMU: Protect the list of PMUs with RCU".
- Merged KVM_REQ_CREATE_PMU into KVM_REQ_RELOAD_PMU.
- Added a check to avoid unnecessary KVM_REQ_RELOAD_PMU requests.
- Dropped the change to avoid setting kvm_arm_set_default_pmu() when
  KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY is not set.
- Link to v3: https://lore.kernel.org/r/20260225-hybrid-v3-0-46e8fe220880@rsg.ci.i.u-tokyo.ac.jp

Changes in v3:
- Renamed the attribute to KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY.
- Changed to request the creation of perf counters when loading vCPU.
- Link to v2: https://lore.kernel.org/r/20250806-hybrid-v2-0-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp

Changes in v2:
- Added the KVM_ARM_VCPU_PMU_V3_COMPOSITION attribute to opt in the
  feature.
- Added code to handle overflow.
- Link to v1: https://lore.kernel.org/r/20250319-hybrid-v1-1-4d1ada10e705@daynix.com

---
Akihiko Odaki (7):
      KVM: arm64: Disallow vPMU when pPMUs do not cover all CPUs
      KVM: arm64: PMU: Protect the list of PMUs with RCU
      KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
      KVM: arm64: PMU: Pass the target CPU to kvm_pmu_probe_armpmu()
      KVM: arm64: PMU: Implement fixed-counters-only emulation
      KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
      KVM: arm64: selftests: Test PMU_V3_FIXED_COUNTERS_ONLY

 Documentation/virt/kvm/devices/vcpu.rst            |  32 +++-
 arch/arm64/include/asm/kvm_host.h                  |   4 +
 arch/arm64/include/uapi/asm/kvm.h                  |   1 +
 arch/arm64/kvm/arm.c                               |  17 +-
 arch/arm64/kvm/pmu-emul.c                          | 176 +++++++++++++++------
 include/kvm/arm_pmu.h                              |   8 +-
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 152 +++++++++++++++---
 7 files changed, 303 insertions(+), 87 deletions(-)
---
base-commit: 1ee27dacbe5dc4def481794d899d67b0d4570094
change-id: 20250224-hybrid-01d5ff47edd2

Best regards,
--  
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>


