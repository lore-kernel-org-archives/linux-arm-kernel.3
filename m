Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22CFEBFD0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t/OFl7loV4g9lkXddWYpGb4ruVEINDsf++awGSrpNe4=; b=XJuujcS49q9njw
	EGwL6JGaiFiXv7CSE82mq3zy0LahsLtR+74m8YhYI69g2Bi/ARx4TSHfa2adrgvkrI1AWBi8pItwH
	AU/lkRnYBzvS4onE5ZaBwMQRl67NIglUUz21K/9GIqvurpQg5I6BHt6fkq02ClTDjOJo3KgvGfm8B
	fkcho4ceUOPPzCRlrHxZU7HKxvWvrtao5SHz8xU1BIBvpXGkkw01iD5aEAgkrssXySWD+ncA2lEo9
	QDfAhoafWJIZM2ej/hwrRDqtDfB6qhGt1qoyJU6eGjetjMhjE3cR5On/hxtrnhcj/R0Th3F2G/RlY
	QARvsQKy1+cNxhJYqTGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCM1-0000000FEM0-1Gn7;
	Mon, 13 Apr 2026 08:09:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCLz-0000000FELU-3ZGM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=t/OFl7loV4g9lkXddWYpGb4ruVEINDsf++awGSrpNe4=; b=Mvh5fyKT6wvvtkdUOopuGeZcSv
	rKBbMmEBa1/rp02kCaW25MHJohSWW6LYeTiggcDS6XYGrPuyWc9o0/5w0m5B67mGxbaOma0L9mAcs
	q3xppn8WLJJQ1y+M8CjH8VuH9rpCNJYJl0eDLW1WE/DeYGvsWM1G9BYFVrAL7cQeRBwuhtOwJ+wxg
	hclqM3fVTtD+mNI+Aaw8gSnBGS09E0ISWu31nune1d0boVGDZReAuSxSUTFzCwTyEIldiWIEZh5Gk
	/zTe7XDtc+AgCoxX5N+WLnyo3nxZOuN5SjEPfcJm2cugCZxBf2+bHsv8vixqd79Nf0uwEs17MTLOq
	0xLkmwHg==;
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCLu-0000000DXhy-3ORc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:09:06 +0000
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 63D87fmj084023
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 13 Apr 2026 17:07:52 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=t/OFl7loV4g9lkXddWYpGb4ruVEINDsf++awGSrpNe4=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1776067673; v=1;
        b=HE0nZmRe8aWwmxv0qBxMy101iYlAALPFGjZuCZhBzczlnLosSD/yxy610b72eS4S
         3XX97o3ZfR99oSwS5MBuwE5Pq3JcpIehHc/LkNms8Nmr7tQpA5LAaV0TbbJnlPww
         Jgyyc6P8oCY9pbM2c2vwzM2HwChyt42WeXfYOA6kx/Jd17kUoad0GTD0TNdKliQu
         TX7aFxOu5wrRJejwmWjZcAT8ynldHxzwWRyxM3Fja4vklV83PhSl9oe2TFy4U1xx
         PokDkQRFQ7CmTaFkRmobrDGr+bEXFJNcdb5dzXapWaRT99GqaS7xqTijNmYvQcfA
         CepSnj8+Suw7uTBAvP8j7w==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: [PATCH v6 0/4] KVM: arm64: PMU: Use multiple host PMUs
Date: Mon, 13 Apr 2026 17:07:34 +0900
Message-Id: <20260413-hybrid-v6-0-e79d760f7f1b@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QTW7CMBAF4Ksgr+vI/7FZcY+qC3s8BrcioU6Ii
 BB3rwkirMryWTPfPPlKBiwZB7LdXEnBKQ+572owHxsCB9/tkeZYMxFMaCaEooc5lBwp41GnpFq
 MUZA6fCqY8mWBPr8eueDvuXrj45EEPyCF/njM43bjvAMLKBmDKK12ALYNillMWguIxrUAwoeW3
 K1DHsa+zEvHiS/YUkdy96wzccqpitxHzxm2TO+in7t8aerBxZjEa88ys+4JyigzhnsE6ZOFXRn
 2DeQmN2c69j9z33hovk8PQz4NU79Cr4ashjJoEwrBrGVvDfUyJG9XQ1UjRCMCRGWNUm8N/TIU5
 6uh7wZTMqjoknL4r3G73f4AL2nB8vkBAAA=
X-Change-ID: 20250224-hybrid-01d5ff47edd2
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
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
X-Mailer: b4 0.15-dev-5ab4c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_090903_920251_D4412D56 
X-CRM114-Status: GOOD (  12.74  )
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
https://lore.kernel.org/qemu-devel/20260225-kvm-v2-1-b8d743db0f73@rsg.ci.i.u-tokyo.ac.jp/
("[PATCH RFC v2] target/arm/kvm: Choose PMU backend")

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
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
Akihiko Odaki (4):
      KVM: arm64: PMU: Add kvm_pmu_enabled_counter_mask()
      KVM: arm64: PMU: Protect the list of PMUs with RCU
      KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
      KVM: arm64: selftests: Test PMU_V3_FIXED_COUNTERS_ONLY

 Documentation/virt/kvm/devices/vcpu.rst            |  29 ++++
 arch/arm64/include/asm/kvm_host.h                  |   2 +
 arch/arm64/include/uapi/asm/kvm.h                  |   1 +
 arch/arm64/kvm/arm.c                               |   1 +
 arch/arm64/kvm/pmu-emul.c                          | 187 ++++++++++++++-------
 include/kvm/arm_pmu.h                              |   2 +
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 147 +++++++++++++---
 7 files changed, 288 insertions(+), 81 deletions(-)
---
base-commit: 9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
change-id: 20250224-hybrid-01d5ff47edd2

Best regards,
--  
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>


