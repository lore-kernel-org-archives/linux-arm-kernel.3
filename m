Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CBCCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBMFQ7Kz/eIxaS7kEIifnt0R6apMy/MPL3L0JhcCRls=; b=qrqczkrpvtcYnBgroxgezQDXw1
	R8P0kpryW6ppcKjQPQU6DP/28TR+ns4l7F/IuM7sPUPslixsqqRwIZMkK2Skbp/ebmXpybBlzl7Zy
	qN5RvRXWu8EQg/TajUYclsY6lC6cdWUnBS/I/xhjKxtW6lcMPzbuGvEC1Vp/UQ3CXVNwL8g54b9ge
	F02FICrue/S7AoCUBAqEzKVsdmpfOGRV9H5ImOICRITEEXWxKcNFCrRHZw5fZSXK0/RpTHORFIAN7
	nR98bT2b0buhl/Vhj+uFTnxRCqu7ZwEucYfdlFqgfBz480EMTpcdTb0Z9KZMGvcUM12mgFKVc9vMX
	gWu/rjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSiq-0000000EdmY-0WR4;
	Mon, 27 Oct 2025 19:17:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSin-0000000EdlE-3ePx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 19:17:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A26CF2574;
	Mon, 27 Oct 2025 12:17:29 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91BAC3F63F;
	Mon, 27 Oct 2025 12:17:35 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	perlarsen@google.com,
	ayrton@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 2/2] KVM: arm64: support optional calls of FF-A v1.2
Date: Mon, 27 Oct 2025 19:17:29 +0000
Message-Id: <20251027191729.1704744-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027191729.1704744-1-yeoreum.yun@arm.com>
References: <20251027191729.1704744-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_121737_942956_541756B3 
X-CRM114-Status: GOOD (  10.86  )
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

To use TPM drvier which uses CRB over FF-A with FFA_DIRECT_REQ2,
support the FF-A v1.2's optinal calls by querying whether
SPMC supports those.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 0ae87ff61758..9ded1c6369b9 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -646,6 +646,22 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 		ffa_to_smccc_res(res, ret);
 }
 
+static bool ffa_1_2_optional_calls_supported(u64 func_id)
+{
+	struct arm_smccc_1_2_regs res;
+
+	if (!smp_load_acquire(&has_version_negotiated) ||
+		(FFA_MINOR_VERSION(FFA_VERSION_1_2) < 2))
+		return false;
+
+	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+		.a0 = FFA_FEATURES,
+		.a1 = func_id,
+	}, &res);
+
+	return res.a0 == FFA_SUCCESS;
+}
+
 /*
  * Is a given FFA function supported, either by forwarding on directly
  * or by handling at EL2?
@@ -678,12 +694,13 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
+		return false;
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
 	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
 	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
-		return false;
+		return ffa_1_2_optional_calls_supported(func_id);
 	}
 
 	return true;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


