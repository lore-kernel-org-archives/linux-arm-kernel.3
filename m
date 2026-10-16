Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9EACCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ip37TRDJ2OyKzwfw33Fw3K8TMP9Nx8jljWFGrynEB4s=; b=CEGtpdFIVK92Rk
	zcLTfyvONYMM3D1Ix7q2ENDj3VzRjMuCVqa2kzCv90wx70uFlXrqTxLuTJlkvt0crOxoK/0lAhOvU
	d2Ky/CDQv63KWdhqPg2gl240XaK1ScuhmV/0l22fkHY0+ByAr806W3L2zOfvorJtImUAXaVRkMpCO
	NnQ8M014NWxYmT5H7sPHWN5MNPIpYv8D6B5vlUjQXWP25+JoDlSmpqz9lH+Gwp4qNVR50mRhAJUIY
	0gQZCWXIXbpg21djWv2ZcXwqKxJWdztjGda40poiQJtOjg8tWcb1/RZGmKsDQ0A8pF5wL385uEdeL
	YpkD0LTmWAO4mZgI/pUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHekj-00000002YVi-3jJA;
	Fri, 16 Oct 2026 10:01:29 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHekh-00000002YVH-1urZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792144887; x=1823680887;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Kb1L0Jz22Bdu0wiudnLgsasoZRk2+Y5lFCpZprecvXE=;
  b=CH1PusnE4atndfihT+RJqE/bi3+HuVkXFXctYm+iplowb4zkP8OLG1yV
   yr0w+w2loDh/HAwKq3Y7jbhMlYyDRfk4FvmNGe0fZVtYjtDrVtruCG2eC
   0zx883ult9lY755C06vkg7I9Jy2noGOQewmNaK1UbDEXekauX3AivqbCp
   ilfih9W7ZgD4n0bVczcNDFcZRQoGD6ZWG6dQQNyC1cZoyhcx+ltOkb1q3
   M+yzso8tz/kLVIKl3ntMiJZaHyjca+AQsXklYd5MLdKSp0O08fIZal92p
   iOMHN+eHPNs+IFR6FcJeL2EN2NpTHo9mlgQLLhaA2gh+VARVXslYkjYra
   Q==;
X-CSE-ConnectionGUID: 8M7S2s0vSdGJ5LTxZHAvNQ==
X-CSE-MsgGUID: V7CU1ILnRwGFvdHO4v9DZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="244647907"
X-IronPort-AV: E=Sophos;i="6.27,161,1786978800"; 
   d="scan'208";a="244647907"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 19:01:24 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C8DC4100027F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 10:01:23 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7F56392677F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 10:01:23 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2229010005E9;
	Fri, 16 Oct 2026 10:01:15 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Subject: [PATCH v2 0/4] arm64: Add workarounds for FUJITSU-MONAKA CPU
Date: Fri, 16 Oct 2026 19:00:44 +0900
Message-Id: <20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMz10WoC/4WNQQ6CMBBFr0Jm7ZhpJQRdeQ/CopSpjAZK2kI0h
 LtbuYDL9/P/+xtEDsIRbsUGgVeJ4qcM+lSAHcz0YJQ+M2jSlSLSOPrJvAw6eaPzAZc5psBmxKq
 mmlTP5qod5PUcOHcOc9NmHiQmHz7H0ap+6X/nqpCwNGypI9vxpby75SkpLmfrR2j3ff8Crj7Q1
 sAAAAA=
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>
Cc: Kohei Enju <enju.kohei@fujitsu.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792144875; l=2143;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=Kb1L0Jz22Bdu0wiudnLgsasoZRk2+Y5lFCpZprecvXE=;
 b=yAQ9E8iiX3yBD0SZ7Tof0begEfs+mYDP9Y1rcSqpF+YhaoajTyR1fNFANXIVL3EGum+8JuYHL
 osQZgXOAnddCuDZl4ELCmSlJn8yZa2ucVnECEriaEBDdl5VWjblmA8y
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_030127_916980_E5C5D6CB 
X-CRM114-Status: GOOD (  11.82  )
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

Changes in v2:
 - Address review comments in patch 2-4. See each commits for the details
 - rebased on 7.3-rc7
 - Link to v1: https://lore.kernel.org/r/20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com

This series adds three workarounds for the FUJITSU-MONAKA CPU.
 - Patch 1 ... Add the FUJITSU-MONAKA CPU type definition
 - Patch 2 ... Add a workaround for TLBI operation on 64k page size
 - Patch 3 ... Add a workaround for perf operation
 - Patch 4 ... Add a workaround for GIC operation

Although the three workarounds do not depend on each other functionally,
I have combined them into one series because patch 2-4
use the CPU type definition added by the first patch,
and all the workarounds update silicon-errata.rst.

If preferred, I will resend them as separate patches.

This series is based on v7.3-rc7.

Best Regards,
Tomohiro Misono

Signed-off-by: Tomohiro Misono <misono.tomohiro@fujitsu.com>
---
Kohei Enju (1):
      irqchip/gicv3: Add workaround for FUJITSU-MONAKA erratum E#030003

Tomohiro Misono (3):
      arm64: cputype: Add FUJITSU MONAKA definition
      arm64: tlb: Add tlbi workaround for FUJITSU-MONAKA Erratum E#030001
      perf: arm_pmu: Add workaround for FUJITSU-MONAKA Erratum E#030002

 Documentation/arch/arm64/silicon-errata.rst |  6 ++++
 arch/arm64/Kconfig                          | 36 +++++++++++++++++++++++
 arch/arm64/include/asm/cpucaps.h            |  4 +++
 arch/arm64/include/asm/cputype.h            |  2 ++
 arch/arm64/include/asm/tlbflush.h           | 35 +++++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 20 +++++++++++++
 arch/arm64/kvm/hyp/vhe/tlb.c                | 44 +++++++++++++++++++++++++++++
 arch/arm64/tools/cpucaps                    |  2 ++
 drivers/irqchip/irq-gic-v3.c                | 32 +++++++++++++++++++++
 drivers/perf/arm_pmu.c                      | 13 +++++++++
 10 files changed, 194 insertions(+)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261002-monaka-fix-for-upstream-680801dea92f

Best regards,
-- 
Tomohiro Misono <misono.tomohiro@fujitsu.com>


