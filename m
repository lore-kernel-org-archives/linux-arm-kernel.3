Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBC5CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 07:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cidHgw/xNGXgeS5+lrmSBrk6DyPCnvca9eh+9hpl+R8=; b=S2xzUvxxGdbANnUPHK06rexTDz
	uuHbXKdbh27HgLEZm43PhKCeKh8pZmW59Wi9x0khHVm3CpnR7tO68tAiPT5opwkpCiZJZvlfbG/L7
	HTNaeZf23y/r0dlKgQ2TiX3mrsICXm7spMvdQEV0pHs8bkvy7fIXdeWBsxT48dqAR31KFMcIw7Hh5
	etO6hRFXS5oZpSYPurstEsE1SJk2nPfpbEK0C1PE1z0nSxyKejrJDhT5TnoC+Aj8teBV9Ta9AIEMa
	rqZh9aL9q6dffRaphdTBpxsUkbWCAwDa5s4jbILJbyF4l4rQ8C+I1biG2k2teFLns6vUSezJDEh39
	iPmFT58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBtV-0000000BMZd-2Z00;
	Tue, 04 Nov 2025 07:55:57 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBtS-0000000BMYU-0Fiv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 07:55:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cidHgw/xNGXgeS5+lrmSBrk6DyPCnvca9eh+9hpl+R8=;
	b=hENdKQ21rju/zb8MhykSFu6NqS1dTitxvcgSSFh+6qRW46PkB6uVMoqpkV0UatHtAVtprwMXc
	M3X0r4upH4dyMSQVCI8u2AM5d/FtlpGDReGiB0SX/XXsy43t+xgaFwhnctwVSvTuMHKSVcliS0c
	dPI2sWcUC0K4VAysceTtyNg=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4d111b5RD9zmV8q;
	Tue,  4 Nov 2025 15:54:11 +0800 (CST)
Received: from kwepemk500012.china.huawei.com (unknown [7.202.194.97])
	by mail.maildlp.com (Postfix) with ESMTPS id 77B75140158;
	Tue,  4 Nov 2025 15:55:46 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500012.china.huawei.com (7.202.194.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Nov 2025 15:55:45 +0800
From: Bowen Yu <yubowen8@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <beata.michalska@arm.com>,
	<ptsm@linux.microsoft.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>
CC: <zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<wanghuiqiang@huawei.com>, <xuwei5@huawei.com>, <zhenglifeng1@huawei.com>,
	<yubowen8@huawei.com>, <zhangpengjie2@huawei.com>
Subject: [PATCH 1/3] arm64: topology: Improve AMU-based frequency calculation
Date: Tue, 4 Nov 2025 15:55:42 +0800
Message-ID: <20251104075544.3243606-2-yubowen8@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251104075544.3243606-1-yubowen8@huawei.com>
References: <20251104075544.3243606-1-yubowen8@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500012.china.huawei.com (7.202.194.97)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_235554_752910_2C1D4CE0 
X-CRM114-Status: GOOD (  13.16  )
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

The current approach of reverse-calculating CPU frequency from capacity
values introduces quantization errors due to intermediate scaling of
arch_scale_freq_capacity, which results in the calculated frequency having
only 1/1024 resolution.

This patch:
1. Directly computes frequency using AMU counters in amu_scale_freq_tick():
freq = (core_cycles_delta * timer_freq) / (const_cycles_delta * 1000)
 - core_cycles_delta: Measured CPU cycles
 - timer_freq: Architectural timer frequency
 - const_cycles_delta: Reference cycles from fixed-frequency timer
2. Returns pre-computed avgfreq in arch_freq_get_on_cpu()

examples:
Before change
[root@localhost ~]# cat /sys/devices/system/cpu/cpufreq/policy*/cpuinfo_avg_freq
2297851
2297851
2295312
2297851
2297851
2295312
2297851
2295312
2297851
2297851
2297851
2295312
2295312
2297851
2297851
2297851
2297851
2300390
2297851
2297851
2297851

After change
[root@localhost ~]# cat /sys/devices/system/cpu/cpufreq/policy*/cpuinfo_avg_freq
2299177
2298117
2299188
2297330
2296530
2298817
2298434
2298986
2298596
2299395
2299560
2298446
2299108
2299294
2298707
2298453
2298632
2299218
2297962

Signed-off-by: Bowen Yu <yubowen8@huawei.com>
---
 arch/arm64/kernel/topology.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 5d07ee85bdae..c0dbc27289ea 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -20,6 +20,7 @@
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
 #include <linux/xarray.h>
+#include <linux/units.h>
 
 #include <asm/cpu.h>
 #include <asm/cputype.h>
@@ -144,6 +145,8 @@ int __init parse_acpi_topology(void)
  */
 static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
 static cpumask_var_t amu_fie_cpus;
+static DEFINE_PER_CPU(unsigned long, core_delta);
+static DEFINE_PER_CPU(unsigned long, const_delta);
 
 struct amu_cntr_sample {
 	u64		arch_const_cycles_prev;
@@ -246,6 +249,7 @@ static void amu_scale_freq_tick(void)
 	 * arch_max_freq_scale and the use of SCHED_CAPACITY_SHIFT.
 	 */
 	scale = core_cnt - prev_core_cnt;
+	this_cpu_write(core_delta, scale);
 	scale *= this_cpu_read(arch_max_freq_scale);
 	scale = div64_u64(scale >> SCHED_CAPACITY_SHIFT,
 			  const_cnt - prev_const_cnt);
@@ -253,6 +257,7 @@ static void amu_scale_freq_tick(void)
 	scale = min_t(unsigned long, scale, SCHED_CAPACITY_SCALE);
 	this_cpu_write(arch_freq_scale, (unsigned long)scale);
 
+	this_cpu_write(const_delta, const_cnt - prev_const_cnt);
 	amu_sample->last_scale_update = jiffies;
 }
 
@@ -288,7 +293,7 @@ int arch_freq_get_on_cpu(int cpu)
 	unsigned int start_cpu = cpu;
 	unsigned long last_update;
 	unsigned int freq = 0;
-	u64 scale;
+	u64 delta_core_kHz;
 
 	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
 		return -EOPNOTSUPP;
@@ -340,14 +345,11 @@ int arch_freq_get_on_cpu(int cpu)
 			break;
 		}
 	}
-	/*
-	 * Reversed computation to the one used to determine
-	 * the arch_freq_scale value
-	 * (see amu_scale_freq_tick for details)
-	 */
-	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
+
+	if (check_mul_overflow(per_cpu(core_delta, cpu), arch_timer_get_cntfrq(), &delta_core_kHz))
+		return -EINVAL;
+
+	freq = div_u64(delta_core_kHz, per_cpu(const_delta, cpu) * HZ_PER_KHZ);
 	return freq;
 }
 
-- 
2.33.0


