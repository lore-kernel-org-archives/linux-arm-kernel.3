Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E4BF5545B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 05:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MYO+XchwOpRTBTIhxbmQzhbl8T24Bkei/zh10k9CJ4U=; b=brNTNVsFB0buuf
	Xi2JNuuiRExS98tghwuhPw3klv5e2fhJH0wkgglaieaakR6WA0f1dPc2i9F2nvvoszcQiGPY1pDBv
	d4O5StbUGwFG4v0C4HDhgMqgpGh/9l+Y9psDERLwa5OLIWdTI2jy5SzeHXZMgNQg1xytxXDpUygeD
	CJkuhtOHwqa3O4wvHLXI9AWf7fx53F8PlvrlkZ6Yi20WHbCy16/QRi+yjSRuaQ3qCEvTYvyrl6sfX
	AtUhFerqnTfUi5uwN3cOD5++//jG2tRgdpy0tkW0YHAWcdhEYkadfUq90mv2gOEX1nFJXC4OyLufs
	8RcnKvfzsFfLs2esXsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv7Gj-00000003EDN-0zP9;
	Wed, 25 Feb 2026 05:17:05 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv7Gg-00000003ECQ-1sTj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 05:17:03 +0000
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 61P4VKpP082120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 25 Feb 2026 13:31:24 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=MYO+XchwOpRTBTIhxbmQzhbl8T24Bkei/zh10k9CJ4U=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1771993884; v=1;
        b=s3K51MkFc/3//s1kyweOLqGgEpf6nlXdoRUL1yRvznAIaVnT2Ytnh7XjWWRxxM49
         R8i5A/xP7HU9X9/zINgMcMsb7wmCZN0NPfyXqZywQeqCfboTohQXtHtZv2nbhVNM
         Q7E8dEuq/sLiXkZteOvPonOCeOxdhT5gnI2d32wNFWDJ+rYgssiy3X0oGx1pznHH
         wAQ3ClS/ZnxV7/UC9oWIMi9cPoCkJY3VZQmSTdeEJVASaFI3HWu5pIpfAr3RazRK
         8A+mx0t3ontSTAiCiOixdRshouRjSQMLWzZ8NxeBFvp1y4zXI4OGevx47aPfgIEz
         bwvXtHfycRaHiK+Du7vA5A==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: [PATCH v3 0/2] KVM: arm64: PMU: Use multiple host PMUs
Date: Wed, 25 Feb 2026 13:31:14 +0900
Message-Id: <20260225-hybrid-v3-0-46e8fe220880@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABN7nmkC/0WOS47CMBBErxJ5TVtu50NgxT1GLIzdIQ0iBjtYR
 Ch3H4/RzCyr9epVv0WkwBTFvnqLQIkj+ymHelMJO5rpTMAuZ6GVbpXWDYzLKbADha4dhmZLzmm
 R4XuggV9F9HX85ECPZ/bNn6M4mUhg/e3G875KncReohI/7Mhx9mEpPyQscJmrcfc7lxAQGofGG
 VS0Ve3BmWXil8zC4kj6v9er7q+nQYHqOjRkazP09hDiWVqWLJ8w++vipbHychfHdV2/AVPJoR8
 NAQAA
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
X-CRM114-CacheID: sfid-20260224_211702_726581_DDAA3708 
X-CRM114-Status: GOOD (  13.78  )
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
Akihiko Odaki (2):
      KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
      KVM: arm64: selftests: Test PMU_V3_FIXED_COUNTERS_ONLY

 Documentation/virt/kvm/devices/vcpu.rst            |  29 ++++
 arch/arm64/include/asm/kvm_host.h                  |   3 +
 arch/arm64/include/uapi/asm/kvm.h                  |   1 +
 arch/arm64/kvm/arm.c                               |   8 +-
 arch/arm64/kvm/pmu-emul.c                          | 155 ++++++++++++++-------
 include/kvm/arm_pmu.h                              |   1 +
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 148 ++++++++++++++++----
 7 files changed, 268 insertions(+), 77 deletions(-)
---
base-commit: ef87500dc466ef424e4fc344b5063d345e18bf73
change-id: 20250224-hybrid-01d5ff47edd2

Best regards,
--  
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>


