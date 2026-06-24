Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FE9CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiI+bU6UZTaJsSDQgLd3Ye3dChV3WHZ4d0D9qJL7ZbY=; b=zRf7LAOYSgc1QS0GPjRoHdRADh
	MXkQIVGYougzWU4taZn/rCn7GlBvt2DKrNRn7KLcZsj2UORvwLVNIc+iAYcGimsgaFzuM5Tcgr0kQ
	NbJxoHc9+DpPrZoQ6qGjgNz9sZ338QVTIBMCTHOrKP1uTw/i4Ps1/c95nvzcG5ExZlHrp4FK8QcXb
	g8bpfHYVMhmbrPnKB4CUv0HXh3rvOwbWznYCsJ1DXmeB9KbSECnoWmv1QFuPebEFxJF21lcuDk5KL
	4le4gYlKrJeoT/gqamQ5Loavt1NjnoTSPIOjTSkN7xLqQ9I8YBoBbNqx7q4uYJZqqhE500Vs75hiW
	Ra2z+Dgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJs6-00000007Uoe-44N2;
	Wed, 24 Jun 2026 09:26:14 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJrs-00000007Ugc-2I2X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:26:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TiI+bU6UZTaJsSDQgLd3Ye3dChV3WHZ4d0D9qJL7ZbY=;
	b=k8G3N8hb/viyXx/pJP/K0Z/uLHUoSO7z+hUr9oYDC0S2i382rtko3ssbPeRSu7/qAzncvdB7e
	+n488tlNnRUwAPSU7MHIovWByCHNNbIDeFkcpNZK863DLjf0+kJhDiWM2C/ax8tHB/YX7voSoo4
	ab0o0cq44vRMTyROkhrOwws=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4glbsv21fLzmV6k;
	Wed, 24 Jun 2026 17:16:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C76A440565;
	Wed, 24 Jun 2026 17:25:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:54 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>,
	<ryan.roberts@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 03/12] arm64: smp: Tidy up smp_prepare_cpus()
Date: Wed, 24 Jun 2026 17:25:28 +0800
Message-ID: <20260624092537.2916971-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_022601_193990_8BEC2AFE 
X-CRM114-Status: GOOD (  12.76  )
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

From: Will Deacon <will@kernel.org>

smp_prepare_cpus() is always run on the boot CPU (i.e. CPU 0) but goes
to great lengths to support running on a CPU where smp_processor_id()
is non-zero.

Clean up the code a little by hardcoding zero for the boot CPU ID.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..e858d7d64d1f 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -772,16 +772,14 @@ void __init smp_init_cpus(void)
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	const struct cpu_operations *ops;
-	int err;
 	unsigned int cpu;
-	unsigned int this_cpu;
+	int err;
 
 	init_cpu_topology();
 
-	this_cpu = smp_processor_id();
-	store_cpu_topology(this_cpu);
-	numa_store_cpu_info(this_cpu);
-	numa_add_cpu(this_cpu);
+	store_cpu_topology(0);
+	numa_store_cpu_info(0);
+	numa_add_cpu(0);
 
 	/*
 	 * If UP is mandated by "nosmp" (which implies "maxcpus=0"), don't set
@@ -796,8 +794,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	 * secondaries from the bootloader.
 	 */
 	for_each_possible_cpu(cpu) {
-
-		if (cpu == smp_processor_id())
+		if (cpu == 0)
 			continue;
 
 		ops = get_cpu_ops(cpu);
-- 
2.34.1


