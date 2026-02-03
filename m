Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052BFE8B368
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 21:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2O8Uqm64vMSk1iP2QJWHeNpVukawPcEzvVYS+XHj+A=; b=gWbsPQhi+rbWBWoocE94TEN0q4
	efGXagLpI5zJvvB1BGP+uXIpwwf0WgqaLSKdKx8dxV+SvWGfAzWdjrlBsJSQhc4N4ILf9bwX7WKSN
	eRz3gDDxcNwcQwOUTaY8ivVKWRG6b6TszcoYJv5uYOJ5o9Ub+CbnaT8cdOJFhpVaZGzzp4UwCJz+P
	fClvNAN1Reap3JxPQPU0P9XPlVb1HvFAXeWj+G341LORXbktUVMG0N5JsKp5SN6O4VfzJ1gumKvc3
	nlP0275DiSvzGm7fd81nRmRjM/EG8sWIZATL2IizqzF1n9gWSuf6lw5VlQ0+NKS+oeGL1a+4j0HmU
	6/H/P13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOCR-00000007ORT-2mRJ;
	Tue, 03 Feb 2026 21:44:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOCP-00000007OPL-0fgl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 21:44:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F658339;
	Tue,  3 Feb 2026 13:44:34 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 03D583F778;
	Tue,  3 Feb 2026 13:44:34 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v4 07/41] arm64: mpam: Advertise the CPUs MPAM limits to the driver
Date: Tue,  3 Feb 2026 21:43:08 +0000
Message-ID: <20260203214342.584712-8-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203214342.584712-1-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_134441_244427_514548EA 
X-CRM114-Status: GOOD (  11.98  )
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

From: James Morse <james.morse@arm.com>

Requestors need to populate the MPAM fields for any traffic they send on
the interconnect. For the CPUs these values are taken from the
corresponding MPAMy_ELx register. Each requestor may have a limit on the
largest PARTID or PMG value that can be used. The MPAM driver has to
determine the system-wide minimum supported PARTID and PMG values.

To do this, the driver needs to be told what each requestor's limit is.

CPUs are special, but this infrastructure is also needed for the SMMU and
GIC ITS. Call the helper to tell the MPAM driver what the CPUs can do.

The return value can be ignored by the arch code as it runs well before the
MPAM driver starts probing.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 arch/arm64/kernel/mpam.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kernel/mpam.c b/arch/arm64/kernel/mpam.c
index 9866d2ca0faa..e6feff2324ac 100644
--- a/arch/arm64/kernel/mpam.c
+++ b/arch/arm64/kernel/mpam.c
@@ -3,6 +3,7 @@
 
 #include <asm/mpam.h>
 
+#include <linux/arm_mpam.h>
 #include <linux/jump_label.h>
 #include <linux/percpu.h>
 
@@ -11,3 +12,14 @@ DEFINE_PER_CPU(u64, arm64_mpam_default);
 DEFINE_PER_CPU(u64, arm64_mpam_current);
 
 u64 arm64_mpam_global_default;
+
+static int __init arm64_mpam_register_cpus(void)
+{
+	u64 mpamidr = read_sanitised_ftr_reg(SYS_MPAMIDR_EL1);
+	u16 partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, mpamidr);
+	u8 pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, mpamidr);
+
+	return mpam_register_requestor(partid_max, pmg_max);
+}
+/* Must occur before mpam_msc_driver_init() from subsys_initcall() */
+arch_initcall(arm64_mpam_register_cpus)
-- 
2.43.0


