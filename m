Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA792C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uSBUaTybn/Rvbj3gWOMyZs+ShoRsPgDoXPikNbFJDFo=; b=Kw5y2XtjknOsIdec7FFPrbhuoL
	FJjprLpSuRQ8YUq3+dFVe3ar2GXXKZI8Rw/kQmG/gmIOU5ENkCxj6h/oPwLH6fw9y+64M1BQJmrza
	QCQ5AvM8ISbnCfy0EUY6sI+cbHlYd5x+QfkhJEXXOy4w81CKM8y8b6COSLfeoz1fPeD1s737FqsTe
	4f8r+jbRK4oc70VIgu4NL/RMT5CBMRsK16dhicxppO7QAbK3v9pe+UbMMiHompTV+HrI5lq5VWv2I
	Uid1ZoD0oj+G008KKThMQhb873SmaWu2Q37S+vkEBwOLlkf5pZuHbVHMt1GFI0b7NFMcJ9WUA0DYp
	zJLZcaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0ju-00000005Jwj-2pWa;
	Tue, 25 Mar 2025 09:38:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0iC-00000005Jdd-3fPN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 09:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=uSBUaTybn/Rvbj3gWOMyZs+ShoRsPgDoXPikNbFJDFo=; b=U1FKO/+vtShWaAR+Sli7qO+zm+
	PUiqTPacg05XG+YrebmLLOT9zOQEfxg1sLHulftJBLy9ge8nj5XN3r6uPcHfjfNPj3dpCC4YQ4LMJ
	rYJpRXfDBneLaPJXCP2C/iiX8vH0j3WFZRo1XVByiZODZBupKuFODhVu7Crb7LC/tVqr33wIeCb0b
	PoL937oX2+wlup0d5EEHRiqBJrDJ/7aYIlBVHDkouucguxehOmmnXbdwpg72bMl4UAP/ySrnu3KuR
	XKTY8uv/9KPF8X2Y+NB6AVMrHkYHgXBu2ptDCO3/W/KFhUQdPSZtTrHbuT9Q1ZoqpU20E0ffTBTvW
	iPmwHNPg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0i8-00000005OMi-3em7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 09:36:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78F42106F;
	Tue, 25 Mar 2025 02:36:43 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D1813F63F;
	Tue, 25 Mar 2025 02:36:33 -0700 (PDT)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	suzuki.poulose@arm.com,
	yang@os.amperecomputing.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	jean-philippe@linaro.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	akpm@linux-foundation.org,
	ardb@kernel.org,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	james.morse@arm.com,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	baohua@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	mshavit@google.com,
	jsnitsel@redhat.com,
	smostafa@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
Subject: [PATCH v5 0/3] Initial BBML2 support for contpte_convert()
Date: Tue, 25 Mar 2025 09:36:22 +0000
Message-ID: <20250325093625.55184-1-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_093641_395309_222C8261 
X-CRM114-Status: GOOD (  15.34  )
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

This patch series adds initial support for eliding Break-Before-Make
requirements on systems that support BBML2 and additionally guarantee
to never raise a conflict abort.

This support elides a TLB invalidation in contpte_convert(). This
leads to a 12% improvement when executing a microbenchmark designed
to force the pathological path where contpte_convert() gets called.
This represents an 80% reduction in the cost of calling
contpte_convert().

This series is based on v6.14-rc5 (7eb172143d55).

Notes
======

Patch 1 implements an allow-list of cpus that support BBML2, but with
the additional constraint of never causing TLB conflict aborts. We
settled on this constraint because we will use the feature for kernel
mappings in the future, for which we cannot handle conflict aborts
safely.

Yang Shi has a series at [1] that aims to use BBML2 to enable splitting
the linear map at runtime. This series partially overlaps with it to add
the cpu feature. We believe this series is fully compatible with Yang's
requirements and could go first.

Due to constraints with the current design of the cpufeature framework
and the fact that our has_bbml2_noabort() check relies on both a MIDR
allowlist and the exposed MMFR2 register value, if an implementation
supports our desired BBML2+NOABORT semantics but fails to declare
support for BBML2 via the id_aa64mmfr2.bbm field, the check will fail.

Not declaring base support for BBML2 when supporting BBML2+NOABORT
should be considered an erratum [2], and a workaround can be applied in
__cpuinfo_store_cpu() to patch in support for BBML2 for the sanitised
register view used by SCOPE_SYSTEM. However, SCOPE_LOCAL_CPU bypasses
this sanitised view and reads the MSRs directly by design, and so an
additional workaround can be applied in __read_sysreg_by_encoding()
for the MMFR2 case.

For situations where support for BBML2+NOABORT is claimed by an
implementor and subsequently built into the kernel, but problems later
arise that require user damage control [3], we introduce a kernel
commandline parameter override for disabling all BBML2 support.

[1]:
  https://lore.kernel.org/linux-arm-kernel/20250304222018.615808-1-yang@os.amperecomputing.com/

[2]:
  https://lore.kernel.org/linux-arm-kernel/3bba7adb-392b-4024-984f-b6f0f0f88629@arm.com/

[3]:
  https://lore.kernel.org/all/0ac0f1f5-e4a0-46ae-8ea0-2eba7e21a7e1@arm.com/

Changelog
=========

v5:
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

Mikołaj Lenczewski (3):
  arm64: Add BBM Level 2 cpu feature
  iommu/arm: Add BBM Level 2 smmu feature
  arm64/mm: Elide tlbi in contpte_convert() under BBML2

 .../admin-guide/kernel-parameters.txt         |  3 +
 arch/arm64/Kconfig                            | 19 +++++
 arch/arm64/include/asm/cpucaps.h              |  2 +
 arch/arm64/include/asm/cpufeature.h           |  5 ++
 arch/arm64/kernel/cpufeature.c                | 71 +++++++++++++++++++
 arch/arm64/kernel/pi/idreg-override.c         |  2 +
 arch/arm64/mm/contpte.c                       |  3 +-
 arch/arm64/tools/cpucaps                      |  1 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  3 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  3 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  4 ++
 11 files changed, 115 insertions(+), 1 deletion(-)

-- 
2.48.1


