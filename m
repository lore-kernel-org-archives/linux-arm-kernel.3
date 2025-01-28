Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8405DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9sa2tSDG6Gu88X+cOpnuJ/5PZpNt3U6aVV0R/MYnOjI=; b=WWiqQhL4Q9CKu/hz3KAYeXJwJW
	bAQz2BZjHxP/0QUqzde0h+qZRUZz5RnauuCUKNdK39Gc3Q+7djyW+fRavi/laEH4zfiIWJPQ5zCf6
	aU6UzHl67OZjSYLnKIW2dh0bZJVI5Bw3hGpNnLfw84RgWa0CdQy2vgyVaza/USci/xmP6n9+LMC2m
	eHTShplQTv1C5rRekwruAD7Wsu4iZi3V9cbrZfrkc8Uj8+EX9X4JekOgsNLu+rTDjyQ3I0gB/hn7A
	TUYGZqOcPfP4CqiLAMjLUlsOu0H2aITbKcBElxmm7Rcqgvux2p/E8JfuJekyuKpuqaYyCSdwUnm7y
	YrsTYIrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoKh-00000005Iz0-1fRv;
	Tue, 28 Jan 2025 16:20:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnvi-00000005Dq4-48Hs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:55:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00D6D1007;
	Tue, 28 Jan 2025 07:55:35 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6FF33F694;
	Tue, 28 Jan 2025 07:55:06 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com
Subject: [PATCH 0/4] arm64: mitigate CVE-2024-7881 in the absence of firmware mitigation
Date: Tue, 28 Jan 2025 15:54:24 +0000
Message-Id: <20250128155428.210645-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_075511_073969_BBE59A90 
X-CRM114-Status: GOOD (  10.70  )
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

On some CPUs from Arm Ltd, it is possible for unprivileged code to cause
a hardware prefetcher to form an address using the contents of a memory
location which is accessible by privileged accesses in the active
translation regime, potentially leaking the contents of this memory
location via a side channel. This has been assigned CVE-2024-7881:

  https://developer.arm.com/Arm%20Security%20Center/Arm%20CPU%20Vulnerability%20CVE-2024-7881

Arm's recommended mitigation is that firmware configures an
IMPLEMENTATION DEFINED control bit (CPUACTLR6_EL1[41]) to disable the
affected prefetcher, and updates to Trusted Firmware-A are available to
do this. For systems which have not yet recevied a firmware update, KPTI
can help to mitigate the issue.

These patches enable KPTI for affected parts when the firmware
mitigation is not present. The presence of the mitigation is identified
by the presence of the SMCCC_ARCH_WORKAROUND_4 SMCCC call, which was
deployed with the mitigation. This is documented in the SMCCC 1.6 G BET0
specification:

  https://developer.arm.com/documentation/den0028/gbet0/?lang=en

I have tested this on a few configurations of virtual platforms. I'd
appreciate any feedback, especially on the KVM changes.

Mark.

Mark Rutland (4):
  arm64: cpufeature: rename unmap_kernel_at_el0() -> needs_kpti()
  arm64: cpufeature: factor out cpu_is_meltdown_safe()
  arm64: cpufeature: mitigate CVE-2024-7881
  KVM: arm64: expose SMCCC_ARCH_WORKAROUND_4 to guests

 arch/arm64/include/asm/spectre.h  |  2 +
 arch/arm64/include/uapi/asm/kvm.h |  4 ++
 arch/arm64/kernel/cpufeature.c    | 95 ++++++++++++++++++++++++-------
 arch/arm64/kvm/hypercalls.c       | 21 +++++++
 include/linux/arm-smccc.h         |  5 ++
 5 files changed, 107 insertions(+), 20 deletions(-)

-- 
2.30.2


