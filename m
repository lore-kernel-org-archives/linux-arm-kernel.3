Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8485FCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L5MJGjgiyYXsGkeqYYWhkEAYdplRJ6vM+lP/xwLDgU0=; b=Uhzc81eSgGk3gR
	D8Jdc1azC92EPA+2yUUnwQ3DQcqjydb6P5tFbcN++LCpwpCBJqJUCYa/pYJ5t/bYx37lXuyLFyByu
	IOdEi/DRIv+Dywpeb7xastkELQn+mcmOUhQPUSiCjL1eh4VBkUkBQeF6ZaxaA0dwakwzmuXRVQ5aG
	X8cx/Q1lN4jUguq1q7xpraXXcOO2cgyX2F1P2chSxxQsKAqj+36p2XtB/D1hHRLkEuBp6hdnFR3sR
	RlZZS3R/ukjwm42OGhVSBDgc6rgMysSaDg0jR0hI3lPH6nTCdOJtKnda0czN+5q6bXNUKXtz0CrL3
	ttoS2jkvz/ZG6SzXw7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfcI-00000009XAu-2Q3I;
	Thu, 11 Jun 2026 13:38:42 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfcD-00000009X85-2bAY;
	Thu, 11 Jun 2026 13:38:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=L5MJGjgiyYXsGkeqYYWhkEAYdplRJ6vM+lP/xwLDgU0=;
	b=Q4cb6JW+tb/S8ENElUjH4KZyfImN5RGVPnZfI7NXL/rAmJKrC3Sh97W+MX4BH5/cwOIWm/4Qj
	Zy2AajxJdY4DEt7ohGWoNyl6COw6QY7IpcyV2LYvtH5i74eUVyi2vf7nuTL7sDs/lbY+juMBjyZ
	RH56YBf0rJdEHJgrb8Fchew=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gbk6b0dP8zRhQv;
	Thu, 11 Jun 2026 21:30:31 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AA07B40670;
	Thu, 11 Jun 2026 21:38:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Jun
 2026 21:38:23 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <ruanjinjie@huawei.com>, <david.kaplan@amd.com>,
	<lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>, <maz@kernel.org>,
	<timothy.hayes@arm.com>, <lpieralisi@kernel.org>, <thuth@redhat.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<tabba@google.com>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH RFC 0/3] arm64: Add HOTPLUG_PARALLEL support for secondary CPUs
Date: Thu, 11 Jun 2026 21:38:06 +0800
Message-ID: <20260611133809.3854977-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_063837_813024_254266D5 
X-CRM114-Status: UNSURE (   7.63  )
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

Support for parallel secondary CPU bringup is already utilized by x86,
MIPS, and RISC-V. This patch brings this capability to the arm64
architecture.

Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to avoid primary SMT threads
to boot first constraint.

And Add a 'cpu' parameter to update_cpu_boot_status() to allow updating the
boot status at a per-CPU granularity during parallel bringup.

Rework the global `secondary_data` accessed during early boot into
a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
enabling the early boot code in head.S to resolve each secondary CPU's
logical ID concurrently.

Jinjie Ruan (3):
  cpu/hotplug: Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST
  arm64: smp: Pass CPU ID to update_cpu_boot_status()
  arm64: Add HOTPLUG_PARALLEL support for secondary CPUs

 arch/Kconfig                   |  4 ++++
 arch/arm64/Kconfig             |  1 +
 arch/arm64/include/asm/smp.h   | 14 +++++++++++---
 arch/arm64/kernel/cpufeature.c |  2 +-
 arch/arm64/kernel/head.S       | 23 ++++++++++++++++++++++
 arch/arm64/kernel/smp.c        | 35 ++++++++++++++++++++++++++++++----
 arch/arm64/mm/context.c        |  2 +-
 arch/mips/Kconfig              |  1 +
 arch/riscv/Kconfig             |  1 +
 arch/x86/Kconfig               |  1 +
 kernel/cpu.c                   |  6 +++++-
 11 files changed, 80 insertions(+), 10 deletions(-)

-- 
2.34.1


