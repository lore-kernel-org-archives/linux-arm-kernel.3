Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA63E8B367
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 21:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgRTzJbyt49PtXZq5rBMVIVKuBy7vUrN7jgAE490sdU=; b=pTE8pZE0gOllBBwDKcB5Pf1Wux
	377ZOTy7u1yKanR4fBTxqfqmkuKfS+UjkbVP904HZk+3L7xtD0+N7Qbjsw5dIWI2NkHF752RCXWb/
	mEbopsmNJgKGa3/nKe8t21VH+rWqF3uxaTckQ8mb65YcqNjI5///8jTBH+tI2CNUZbVCuihjgitFO
	rzoxXBkZif4UXNjSbMN0/DVK6av0OxH7kVb6CBGb8gYHGrTRW4a2l4xFIlLjszjPBYMqIpWkO1Cvg
	coSC+uuBCOMWTBsROZyKQzc2XRSrRX3MUfW/m7+BIvb7mLzUk8parpXJ1FwJu7geQb/s0VX42+Cvz
	oziM8X+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOBu-00000007O5r-3CkV;
	Tue, 03 Feb 2026 21:44:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOBt-00000007O5K-0yEZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 21:44:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 014C1497;
	Tue,  3 Feb 2026 13:43:59 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C00E13F778;
	Tue,  3 Feb 2026 13:43:59 -0800 (PST)
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
Subject: [PATCH v4 01/41] arm64/sysreg: Add MPAMSM_EL1 register
Date: Tue,  3 Feb 2026 21:43:02 +0000
Message-ID: <20260203214342.584712-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203214342.584712-1-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_134409_314591_1649795F 
X-CRM114-Status: UNSURE (   7.04  )
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

The MPAMSM_EL1 register determines the MPAM configuration for an SMCU. Add
the register definition.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 arch/arm64/tools/sysreg | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8921b51866d6..afbb55c9b038 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -5052,6 +5052,14 @@ Field	31:16	PARTID_D
 Field	15:0	PARTID_I
 EndSysreg
 
+Sysreg	MPAMSM_EL1	3	0	10	5	3
+Res0	63:48
+Field	47:40	PMG_D
+Res0	39:32
+Field	31:16	PARTID_D
+Res0	15:0
+EndSysreg
+
 Sysreg	ISR_EL1	3	0	12	1	0
 Res0	63:11
 Field	10	IS
-- 
2.43.0


