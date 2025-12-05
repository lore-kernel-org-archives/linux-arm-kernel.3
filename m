Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D059D374A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcsWKTaqO+6hSvS3HHaBr+4LoKe0j+N7ESer8ylohxA=; b=co0WNeS0pZJQvGiRuFUCF/WBnF
	jVbFbV28sf36KU+yL7kmsu6GNH6G8FydzM2oM2xoxgwpeUAjHg0P86An9xLMDWsgERL8DeuqfSVYi
	RA13otrO6My1lrq6YsdveL3mLZquyUVS87waPOLU/FucA23J/L6ctJE5rvZxPaRO4cwOcoK6K9BjH
	upaGPPItUpD15bwrRLgIwbgmImjY7NGN5LniPFJKjxkwNJ55ne6jhXNfRuYpomtgsZ3PuvB8Lqwcb
	cgTbtOPGtQRbZ9IyPINMuUc4WFEwRX3E0v4ODikYV25N+/KxM3oY/Px6vjJQFQLOSy/Th4VYsGG47
	zZnCyCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrP-0000000A6Ms-4Bms;
	Fri, 05 Dec 2025 22:01:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrP-0000000A6LB-2NDA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 22:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VcsWKTaqO+6hSvS3HHaBr+4LoKe0j+N7ESer8ylohxA=; b=dqUL7vXVnwwxOa4w0CbHHG8QC5
	1gt4NKVCzExlVAppuNQaUT1ULJTl31nLX9omvAFEfD/sMd0jFUPgS6HsHFWUtcRgT9DT2v+EbuANK
	hnHE6C1+90Hlx4NWGU2FCfE2VXDiVUJ745UqzeHY60STsj6PMf7EKqdMK61fTxoy8Bf2ALVttg6TC
	6oAYbtICrtuwemD/LdNstGbsSlhvvVZIgMKJe5AhJBvVAzZo3LQYrvdM4shFQKJXh7QZZVb9sRRDq
	KJx8Zr3JXfhbEQWriYaNxil1zxx4aYMiZWpFnt33n/pj2RHpff7gdUfjAtzxE8Jn3MoxSvIG5UHO1
	xTRYZk7Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRcyx-00000006seZ-3zZH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:05:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08FFA1A32;
	Fri,  5 Dec 2025 13:59:33 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D8623F740;
	Fri,  5 Dec 2025 13:59:36 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 03/38] arm64: mpam: Advertise the CPUs MPAM limits to the driver
Date: Fri,  5 Dec 2025 21:58:26 +0000
Message-Id: <20251205215901.17772-4-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210525_158483_A2E75458 
X-CRM114-Status: GOOD (  12.10  )
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

Requestors need to populate the MPAM fields for any traffic they send
on the interconnect. For the CPUs these values are taken from the
corresponding MPAMy_ELx register. Each requestor may have a limit on
the largest PARTID or PMG value that can be used. The MPAM driver has
to determine the system-wide minimum supported PARTID and PMG values.

To do this, the driver needs to be told what each requestor's
limit is.

CPUs are special, but this infrastructure is also needed for the
SMMU and GIC ITS. Call the helper to tell the MPAM driver what the
CPUs can do.

The return value can be ignored by the arch code as it runs well
before the MPAM driver starts probing.

Signed-off-by: James Morse <james.morse@arm.com>
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
2.39.5


