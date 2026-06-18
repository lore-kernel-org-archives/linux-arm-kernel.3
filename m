Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F144CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FXuskZWum2eND8Kqapvq5CnQPejvfWzbZgr0VCqB+mM=; b=k3QVn/Gb7ddNeWWQVKHhCfF1F9
	8JVVXpi2T38+qtlAcNZKp0IQd8qyX2jkVyJZhRD2NJU9NrXR13VpnLvw3Y/AEV/OFnt2PuCrcRFV1
	RyNEEZ/10qEPY76gDM9q7epuCGWoYDfKzA1hLjM+8yJBDU1ZbrquLFP1+KHB8Iw2GNzNP3XSBMx/X
	cEXuaQEmBIhOcJ8Mo7BAe9IJGTEVrKVW8SEVIgPAwXP83lNiphV77R89OMSOcAoEvu4EwOsMaa7x8
	mhlD73aHi33hJFeBI7DvvvSd83bIu823zSyq9TWd9vdjylIKroX7EnSUmeIFJQqj8kT+kLLyKIb13
	IE/RQNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa90l-00000000won-16Gr;
	Thu, 18 Jun 2026 09:26:11 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa90h-00000000wmD-2FOX;
	Thu, 18 Jun 2026 09:26:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FXuskZWum2eND8Kqapvq5CnQPejvfWzbZgr0VCqB+mM=;
	b=Ro5n4DsxTcv6kcYs7xwikkAk0E+3gHlYekrLI9Fnl76bnX6pYxu1ksRN3nVu/o8LEnCGulWn4
	NYHbDMn2L8ZXZbDOkC/9bxJ0EO5TjUstPmISyMxyYmOpRKKSfKS2b9EMry/A0gxrQPqInzl7H83
	eyAYjkOIHutvlhnE6ZVBqIA=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4ggw9z4mYZz1cyQF;
	Thu, 18 Jun 2026 17:17:59 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9535440539;
	Thu, 18 Jun 2026 17:25:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jun
 2026 17:25:55 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<jpoimboe@kernel.org>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<ojeda@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<tabba@google.com>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<apatel@ventanamicro.com>, <mhklinux@outlook.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/4] arm64: Add HOTPLUG_PARALLEL support for secondary CPUs
Date: Thu, 18 Jun 2026 17:24:40 +0800
Message-ID: <20260618092444.1316336-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_022608_249356_35F17A95 
X-CRM114-Status: GOOD (  10.36  )
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

Support for parallel secondary CPU bringup is already utilized by x86,
MIPS, and RISC-V. This patch brings this capability to the arm64
architecture.

Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to avoid primary SMT threads
to boot first constraint.

And Add a 'cpu' parameter to update_cpu_boot_status() to allow updating the
boot status at a per-CPU granularity during parallel bringup.

Rework the global `secondary_data` accessed during early boot into
a per-CPU array `cpu_boot_data` to allow secondary CPUs to boot
in parallel.

And reuse `__cpu_logical_map` array in the early boot code in head.S
to resolve each secondary CPU's logical ID concurrently.

Changes in v2:
- Remove RFC.
- Add Tested-by.
- Fix AI review issues in [1].
- Add arch_cpuhp_init_parallel_bringup() to check psci boot.
- Reuse `__cpu_logical_map` instead of a new aray.
- Defer rcutree_report_cpu_starting() until after
  check_local_cpu_capabilities() to prevent a potential control CPU
  deadlock if an early capability check fails.
- Move the assembly in head.S to a macro called `mpidr_to_cpuid`.
- Add `SECONDARY_DATA_SHIFT` for `lsl` to access `cpu_boot_data`.
- Add sizeof(struct secondary_data) power of 2 assert check.
- Expand testing with more data collected from real hardware.

[1] https://sashiko.dev/#/patchset/20260611133809.3854977-1-ruanjinjie%40huawei.com

Jinjie Ruan (4):
  cpu/hotplug: Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST
  arm64: smp: Pass CPU ID to update_cpu_boot_status()
  arm64: smp: Defer RCU reporting until after local CPU capability
    checks
  arm64: Add HOTPLUG_PARALLEL support for secondary CPUs

 arch/Kconfig                    |  4 +++
 arch/arm64/Kconfig              |  1 +
 arch/arm64/include/asm/smp.h    | 17 ++++++++++---
 arch/arm64/kernel/asm-offsets.c |  4 +++
 arch/arm64/kernel/cpufeature.c  | 22 ++++++++--------
 arch/arm64/kernel/head.S        | 36 ++++++++++++++++++++++++++
 arch/arm64/kernel/smp.c         | 45 ++++++++++++++++++++++++++++-----
 arch/arm64/mm/context.c         |  4 +--
 arch/mips/Kconfig               |  1 +
 arch/riscv/Kconfig              |  1 +
 arch/x86/Kconfig                |  1 +
 kernel/cpu.c                    |  6 ++++-
 12 files changed, 119 insertions(+), 23 deletions(-)

-- 
2.34.1


