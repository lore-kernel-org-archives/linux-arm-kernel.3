Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5ACC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/RePMasBxWLOq6wL+myI83nPFWKCp36b5QRiMaqR5Jo=; b=iIREDLMHwb/sw0iyFRO/HhaLak
	zgGlO4bz5COKXP1EY0Sq65di6Hu/i4SX9CYmMzB4CU4P/pL5n5csyxaAJguqcWVoCwJTXf9jPqa4s
	fqKoXnFl2jPhaHZtYcrT3TfFHAjXM8fEd2y4Rl111XQFkKqiuY4Hod+7WyfUHiperao3usLvo9oYa
	/4LPwhIjIP0trPr7dfYllNKXfJcpmbhsaNruXOZhWFwuY9o/IFYM7LwPnhPSU5UF5ply93ggnAjHE
	QvI50f43l+XaHu37NxlCoo7UILxcKwjfdIFxtzszoLzUOP77wicEbqJgNVl+FXeGQiytm6ilTcBJX
	3l2Gih5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpw0p-00000009JLv-18UL;
	Wed, 05 Mar 2025 21:10:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKf-00000009D7A-3SvY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 20:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/RePMasBxWLOq6wL+myI83nPFWKCp36b5QRiMaqR5Jo=; b=aGieGO0IMrTtTOPsuWDIGQBUof
	IckM5dGJYM/VR7LpfHIWnmGXQ1hD4DWnos1bz/MYHx/ejgpudiNyrJmiEctumu8ht2R0gWZsBeh6K
	dfPsOlJpTpYPqCdW6YKKvsSM1b9B9LsB4TwYPXXN36u45AGDJUWS7jHW8eCRuoyc0q/WRjEmE9qy6
	kbSch8vDPKuzJ4ggq/O+2WGYpQhVXM/6qcB6+2mI2CYbommUotp09u4NvxC7BppipA8VQV6QockVH
	sxwuUt9Lgby3Lo/u72zUYLT6gdD6YEWjNRLnP8U0uvYvizYqMIzZnqXAD5WvxJf1WRVUsvXcNe8mH
	ea1tYq9A==;
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKc-00000006AQ4-3OjK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:27:08 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741206413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/RePMasBxWLOq6wL+myI83nPFWKCp36b5QRiMaqR5Jo=;
	b=PbKbEfsqG25jqb/39HbNK2rqZCcaXv8jbOTnrWTOo7yyt1Mew0xNFcRBUL/jiv2vgRu2EP
	ftTcCC0Sscpq52P3sOzgSOnnkwA875AAedBcNW2U9yzSWikcmV7ZMUJEi7xkZ7MC9uOZ9x
	BNNvhiCV1CmzyuhluPPJ1c80CbIZKf8=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v3 00/14] KVM: arm64: FEAT_PMUv3 on Apple hardware
Date: Wed,  5 Mar 2025 12:26:27 -0800
Message-Id: <20250305202641.428114-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_202706_882389_6B9A8B8A 
X-CRM114-Status: UNSURE (   7.44  )
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

Hopefully close to the last spin, this time addressing Marc's comments
on v2.

Full details found in the v1 cover letter.

v1: https://lore.kernel.org/kvmarm/20241217212048.3709204-1-oliver.upton@linux.dev/
v2: https://lore.kernel.org/kvmarm/20250203183111.191519-1-oliver.upton@linux.dev/

v2 -> v3:
 - Reorder and restructure patches to include map_pmuv3_event()
   definition w/ KVM usage.
 - Disallow events that lack a valid PMUv3 -> HW mapping
 - Various minor fixes/typos

Oliver Upton (14):
  drivers/perf: apple_m1: Refactor event select/filter configuration
  drivers/perf: apple_m1: Support host/guest event filtering
  KVM: arm64: Compute PMCEID from arm_pmu's event bitmaps
  KVM: arm64: Always support SW_INCR PMU event
  KVM: arm64: Use a cpucap to determine if system supports FEAT_PMUv3
  KVM: arm64: Drop kvm_arm_pmu_available static key
  KVM: arm64: Use guard() to cleanup usage of arm_pmus_lock
  KVM: arm64: Move PMUVer filtering into KVM code
  KVM: arm64: Compute synthetic sysreg ESR for Apple PMUv3 traps
  KVM: arm64: Advertise PMUv3 if IMPDEF traps are present
  KVM: arm64: Remap PMUv3 events onto hardware
  drivers/perf: apple_m1: Provide helper for mapping PMUv3 events
  KVM: arm64: Provide 1 event counter on IMPDEF hardware
  arm64: Enable IMP DEF PMUv3 traps on Apple M*

 arch/arm64/include/asm/apple_m1_pmu.h   |   1 +
 arch/arm64/include/asm/cpucaps.h        |   2 +
 arch/arm64/include/asm/cpufeature.h     |  28 +----
 arch/arm64/kernel/cpu_errata.c          |  44 ++++++++
 arch/arm64/kernel/cpufeature.c          |  28 +++++
 arch/arm64/kernel/image-vars.h          |   5 -
 arch/arm64/kvm/arm.c                    |   4 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h |   4 +-
 arch/arm64/kvm/hyp/vhe/switch.c         |  22 ++++
 arch/arm64/kvm/pmu-emul.c               | 138 +++++++++++++++++-------
 arch/arm64/kvm/pmu.c                    |  10 +-
 arch/arm64/tools/cpucaps                |   2 +
 drivers/perf/apple_m1_cpu_pmu.c         | 101 +++++++++++++----
 include/kvm/arm_pmu.h                   |  12 +--
 include/linux/perf/arm_pmu.h            |   4 +
 15 files changed, 301 insertions(+), 104 deletions(-)


base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
-- 
2.39.5


