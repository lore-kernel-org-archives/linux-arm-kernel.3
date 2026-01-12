Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A103CCF45A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7y8HGPA/beiPx3YYnOEcyGqPTnamwz/Uw2kX4YcGEk=; b=wo9Hzb9e3PMZyoIBAu76bi4Odz
	wQjcZDTGpFaigHp25fRpcvBNOpUejpZ+xgoiti3mNVBuAzhySdkMqoFj36fF7Whj2x/akVDm+57fc
	p5+SiK8xQ+4cQA/ZfLxFgX9sbtjQx8hlZLVfvMMLVW4uzkwRzNVJGAXjVtkBffyo65tKKvbXtLbdh
	+SSzsda+zBiRZ/5Elhc2iB8Voq4Oa98NTRhcIab/JfBvTpOUw7NlyqQWBq40O70hDEJurqXThDFBo
	TAT3J65MXspUsxFqgebfmW04r8STQS37E5Zp9s74CBRs0qVV5mi10ZHagxmuxyZcCqqxQynqDl70X
	Xe82NO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLHy-00000005lfV-03kD;
	Mon, 12 Jan 2026 17:01:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLHq-00000005lZO-2FgS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:01:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE9961516;
	Mon, 12 Jan 2026 09:00:54 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89EA93F694;
	Mon, 12 Jan 2026 09:00:56 -0800 (PST)
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
	kvmarm@lists.linux.dev
Subject: [PATCH v3 13/47] KVM: arm64: Use kernel-space partid configuration for hypercalls
Date: Mon, 12 Jan 2026 16:58:40 +0000
Message-ID: <20260112165914.4086692-14-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090102_666596_5E8EABFE 
X-CRM114-Status: GOOD (  12.59  )
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

On nVHE systems whether or not MPAM is enabled, EL2 continues to use
partid-0 for hypercalls, even when the host may have configured its kernel
threads to use a different partid. 0 may have been assigned to another
task. Copy the EL1 MPAM register to EL2. This ensures hypercalls use the
same partid as the kernel thread does on the host.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
Use mask
Use read_sysreg_el1 to cope with hvhe
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index a7c689152f68..ad99d8a73a9e 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -635,6 +635,14 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 	unsigned long hcall_min = 0;
 	hcall_t hfn;
 
+	if (system_supports_mpam()) {
+		u64 mask = MPAM1_EL1_PARTID_D | MPAM1_EL1_PARTID_I |
+			MPAM1_EL1_PMG_D | MPAM1_EL1_PMG_I;
+
+		write_sysreg_s(read_sysreg_el1(SYS_MPAM1) & mask, SYS_MPAM2_EL2);
+		isb();
+	}
+
 	/*
 	 * If pKVM has been initialised then reject any calls to the
 	 * early "privileged" hypercalls. Note that we cannot reject
-- 
2.43.0


