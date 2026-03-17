Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F088EF33805
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 06:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tQPLRdcG2BXep0eW/gY1gtA4+gQ7V3cwSUUxElynWig=; b=0iPXB/9AdJXf+h
	jMBteD1hxujSBtjgb54mvAvGt+TrBTBwtR4LxTnqgochhei94Ls3Wnp0jeP2jQNIknFb3U/nQr7es
	A0Pd4R8o3JNkifUxKicWp3cPZ5k5AWqS4LSRjAPl3M/F6WPdnI7czdE6+diY7h3V/7XyulzZ9JSPw
	+W+9pgJ/1fM/nuU+8OZDQKnKxPx/3Ky6KJHVHyWHkuIZ4kFkYf/+p7i4r9eWrS4akUmYtTPIlrlSy
	c5TKAb/nsSTAq/xGgyOt9z5NMugCMfw5QHBwRVPMrCbLz1ieFmK7UnPLENN1UQt5NY9DbQ2NK+cKd
	Q9jbbIKAiVN2+ojVYgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O8L-00000005WHS-3re8;
	Tue, 17 Mar 2026 06:42:29 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O8J-00000005WFg-1Fn0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 06:42:28 +0000
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 62H6aoNk004343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 17 Mar 2026 15:37:00 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=tQPLRdcG2BXep0eW/gY1gtA4+gQ7V3cwSUUxElynWig=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1773729420; v=1;
        b=T3VWcd1TYTjORfLvRhbKQXTFPIx/BVQzEBmsUG8cr7eJaO/QTqKPJimcC/hR7t5r
         eADzWIjJ95qHfYNzy3ZahUpM77rolDmiRDbPunHJRA0x+69do3sjoB5XRVZpRxw6
         Lr/k1gF2GQWwrcQOzvpr1OvTerXfGawV8A+4dxUoS2keyVT20/s5z/N2SLbdEmXV
         bNW4/Ut2waJ7Isovenp+pTEBBxgrwQT58qm5MPxiorlUdzK8BsRqIE2BmBv3SxtZ
         T/5XcaV+Ltev9xBZtUVuP9F4Wuifs9DjPb7VaDVEJXW+WNV83s441nhDCGUq37qj
         Rjl9IPT2VvPGPenpVNoEAw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: [PATCH v4 0/4] KVM: arm64: PMU: Use multiple host PMUs
Date: Tue, 17 Mar 2026 15:36:48 +0900
Message-Id: <20260317-hybrid-v4-0-bd62bcd48644@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAID2uGkC/3XPQW7DIBAF0KtYrAsaMCY0q9yj6oLAEE+r2Ak4V
 qzIdy/FSrrq8qM/b5gHy5gIM9s3D5ZwpkzjUIJ+a5jv3XBCTqFkpkB1oJTm/XJMFDjI0MWodxi
 CYqV8SRjpXqGPzy0nvN6KN22P7Ogycj+ezzTtm9kIaYUE9tvtKU9jWuofZlnLdV0r35/rZskl1
 0G64CTgDrpDcMtAd1HAaszqb86Cec0pDhyMkQ5966L1h5RPwpMgcePT+L2MwnnxddmM9mmYcmr
 3MtpiaIM2olJgLfxrrOv6Ay7e7ftRAQAA
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
X-CRM114-CacheID: sfid-20260316_234227_568202_52139C28 
X-CRM114-Status: GOOD (  13.25  )
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
 arch/arm64/kvm/pmu-emul.c                          | 190 ++++++++++++++-------
 include/kvm/arm_pmu.h                              |   2 +
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 148 +++++++++++++---
 7 files changed, 290 insertions(+), 83 deletions(-)
---
base-commit: ef87500dc466ef424e4fc344b5063d345e18bf73
change-id: 20250224-hybrid-01d5ff47edd2

Best regards,
--  
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>


