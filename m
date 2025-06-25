Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC48FC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PR3WtOEmgGKtIrjLIS2UibKQrHGyGFvNwu1McqQ6db0=; b=iXpXEXkkvsx57n9ih5nT2WDM6A
	TIe+kpT9tvzPV2rHns1z0iUkuf9JldG2RRgCxjhDOKhFQcry88eSN4HElJN/MQACOk4yf3Qlo93lX
	qVuGN9zqkrB6h/0jRdHn3Nz3Mnw5f0WsmHsVoJOxbO53XGD13gy4l8OYlLONthex3AiTwjXheii/T
	EAx4TGfBDjAkHNt3Aeomp1sntj88eg3xay5FBJPaYUBndXiRL3VayVONrTtb6M/wsYUfwPgNuk4T6
	6J3XsH9EvpwbRwlV8xSyxLkqgKV3t8NVPphS+XIiHrhNaetd2QmUcT9Z+b0GIv/vJ4fqLMi9iXjc6
	5LiEPdkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSr9-00000009GBV-2Lcf;
	Wed, 25 Jun 2025 16:20:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOOy-00000008UnS-1ySS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 11:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PR3WtOEmgGKtIrjLIS2UibKQrHGyGFvNwu1McqQ6db0=; b=jVbyZjTejF9T2L6LzmJUe+zL5K
	SbihPfoHHHHFbAOwSpUZ9RBOqs/xPAvFsVRFNmtlcxAeunSwObw7TYbsNo+/A6WZuJzloFq2/3zrF
	ooyfwDCcomB92mMdDrHxZ6N+CJ7OdHIPoHcXAMvdDJg43QvUX6zKfjkME2iVA+cERC71IhIZUF8YL
	IlCqj0pYW4Lg+Eab/Wf53cy8ZSwEasEg6ak0oFqq7N9LNpKvqZaxzpIvR7TSvJqy22DlZPmdq9Uwy
	+DKK0K892IWIV1ZBFkiROwU4LtGJg7eJe4IHP5Z1zJmAGvSOjWl7/oyUbB6pEt3XuezzfAhAO5LYX
	JR1JE+2g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOOv-00000005pez-0kGS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:34:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7239B113E;
	Wed, 25 Jun 2025 04:34:28 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C784B3F58B;
	Wed, 25 Jun 2025 04:34:42 -0700 (PDT)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	yang@os.amperecomputing.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	jean-philippe@linaro.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	james.morse@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	baohua@kernel.org,
	suzuki.poulose@arm.com,
	david@redhat.com,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	jsnitsel@redhat.com,
	mshavit@google.com,
	kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
Subject: [PATCH v8 0/4] Initial BBML2 support for contpte_convert()
Date: Wed, 25 Jun 2025 11:34:31 +0000
Message-ID: <20250625113435.26849-1-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_123449_664210_899F4EE1 
X-CRM114-Status: GOOD (  14.70  )
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

Hi All,

This patch series extends the cpufeature framework to add support for
easily matching against all early cpus, and builds on this to add initial
support for eliding Break-Before-Make requirements on systems that support
BBML2 and additionally guarantee to never raise a conflict abort.

This support conceptually reorders and then elides both a TLB invalidation
and a DSB in contpte_convert(), when BBML2 is supported. This leads to
a 12% improvement when executing a microbenchmark designed to force the
pathological path where contpte_convert() gets called. This represents
an 80% reduction in the cost of calling contpte_convert().

We clarify both the correctness and performance benefits of this elision
with respect to the relevant Arm ARM passages, via substantial comments
in the contpte_convert() source.

This series is based on v6.16-rc3 (86731a2a651e).

Notes
======

Patch 1 extends the cpufeature framework machinery as discussed in [1],
to allows checking for the presence of a feature on all early boot cpus
(and on all late cpus when they are brought online).

Patch 2 implements an allow-list of cpus that support BBML2, but with
the additional constraint of never causing TLB conflict aborts. We
settled on this constraint because we will use the feature for kernel
mappings in the future, for which we cannot handle conflict aborts
safely.

Patch 2 implements a MIDR check but does not implement an
ID_AA64MMFR2_EL1 check, as the BBML2_NOABORT MIDR check is stricter (the
idreg check would allow conflict aborts, the MIDR check does not).

Yang Shi has a series at [2] that aims to use BBML2 to enable splitting
the linear map at runtime. This series partially overlaps with it to add
the cpu feature. We believe this series is fully compatible with Yang's
requirements and could go first.

[1]:
  https://lore.kernel.org/all/aCSHESk1DzShD4vt@arm.com/

[2]:
  https://lore.kernel.org/linux-arm-kernel/20250304222018.615808-1-yang@os.amperecomputing.com/

Changelog
=========

v8:
  - restore missing cpucap description
  - fix misspelled documentation
  - rebase onto v6.16-rc3

v7:
  - https://lore.kernel.org/all/20250617095104.6772-1-miko.lenczewski@arm.com/
  - fix up some minor spelling and formatting nits
  - integrate cpufeature framework patch to each bbml2 detection
  - avoid making feature register check, rely on MIDR check
  - rebase onto v6.16-rc2

v6:
  - https://lore.kernel.org/all/20250428153514.55772-2-miko.lenczewski@arm.com/
  - clarify correctness and performance of elision of __tlb_flush_range()
  - rebase onto v6.15-rc3

v5:
  - https://lore.kernel.org/all/20250325093625.55184-1-miko.lenczewski@arm.com/
  - fixup coding style nits
  - document motivation for kernel commandline parameter

v4:
  - https://lore.kernel.org/all/20250319150533.37440-2-miko.lenczewski@arm.com/
  - rebase onto v6.14-rc5
  - switch from arm64 sw feature override to hw feature override
  - reintroduce has_cpuid_feature() check in addition to MIDR check

v3:
  - https://lore.kernel.org/all/20250313104111.24196-2-miko.lenczewski@arm.com/
  - rebase onto v6.14-rc4
  - add arm64.nobbml2 commandline override
  - squash "delay tlbi" and "elide tlbi" patches

v2:
  - https://lore.kernel.org/all/20250228182403.6269-2-miko.lenczewski@arm.com/
  - fix buggy MIDR check to properly account for all boot+late cpus
  - add smmu bbml2 feature check

v1:
  - https://lore.kernel.org/all/20250219143837.44277-3-miko.lenczewski@arm.com/
  - rebase onto v6.14-rc3
  - remove kvm bugfix patches from series
  - strip out conflict abort handler code
  - switch from blocklist to allowlist of bmml2+noabort implementations
  - remove has_cpuid_feature() in favour of MIDR check

rfc-v1:
  - https://lore.kernel.org/all/20241211154611.40395-1-miko.lenczewski@arm.com/
  - https://lore.kernel.org/all/20241211160218.41404-1-miko.lenczewski@arm.com/

Catalin Marinas (1):
  arm64: cpufeature: Introduce MATCH_ALL_EARLY_CPUS capability type

Mikołaj Lenczewski (3):
  arm64: Add BBM Level 2 cpu feature
  iommu/arm: Add BBM Level 2 smmu feature
  arm64/mm: Elide tlbi in contpte_convert() under BBML2

 arch/arm64/include/asm/cpufeature.h           |  28 ++++
 arch/arm64/kernel/cpufeature.c                |  98 ++++++++++--
 arch/arm64/mm/contpte.c                       | 139 +++++++++++++++++-
 arch/arm64/tools/cpucaps                      |   1 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |   3 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   3 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   2 +
 7 files changed, 262 insertions(+), 12 deletions(-)

-- 
2.49.0


