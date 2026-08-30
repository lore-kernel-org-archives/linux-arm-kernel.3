Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16340C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 23:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noF3/eViW3koYgLiNyJQ/9dElaUy7ttZb9BVjDl8RJ8=; b=RPrBcs0ZKaluVIrniI8u7vJ42S
	iX8v5nV8h2l5NO1twlSt/21FMALjMLLbSHoTG+52AA1G59swDDXEigRceMW+ikZ7tGjJH4nnKMHXJ
	uy7/8QhSoOHomzxZwhf69M09xYu1n8wY1qN9/x6uLv0w3J4N27iwmC/4oyH/+yhqkDZRj8LcSDRmo
	njriD2fxkzFRJ8KUr7EO35VmjZHvF1lfIknsaamim6uze01oa0D7bof3dIryqN2mnw61PZ21DSUlR
	ImhTol2LX/Z1bSMcAETKRlG3PjPghCJzSMwiKFj06Vi00ARA2p4C4ROliIRTBaXBFHiaJk/QpEdLN
	0ZSmCKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0odi-00000008Cl4-1Mvc;
	Sun, 30 Aug 2026 23:08:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0odg-00000008Ckc-2nf4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 23:08:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C98643EAB;
	Sun, 30 Aug 2026 23:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00A84C2BCF5;
	Sun, 30 Aug 2026 23:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788131316;
	bh=jYdFQnr3uAVSj9mc50d5zTs1vATwWNTAp1myXgkY79g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q1vIXEZmkF3DTjlGRcZVUHu1S1WFcnnQJO0RIJk9ZztwUgVlkw0Qk1kIdsxpHMb99
	 HWzUlx5cxjV6wPDtW2edfage8187gvcvnAk+weXdkas5Vj9/RT7Q35Iinx43eDLesW
	 igYg+mKGTec7FSA0RGTPGB6ATxf/hFZQG8nessEYS3OpaZUKnmyApG9S4iLQEIXHeE
	 GDDjbDcI3CP0hu6IzHR6ely9Wwb0Cv9iCE2oa7FEQpP0URAwKMt0lDegdMZKusGRBY
	 SxB1tXDqWDwUXT3A9/x2lyUx6trDkKmujykfoGKU/9ael49eZjxwgIDF4AP9eBN/qi
	 gNja4XUj/gNFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FABC61DE8;
	Sun, 30 Aug 2026 23:08:35 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Sun, 30 Aug 2026 23:08:14 +0000
Subject: [PATCH v7 2/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host
 handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-host-direct-messages-v7-2-45f6e6db72c2@google.com>
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
In-Reply-To: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Sebastien Ene <sebastianene@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsen <perlarsen@google.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788131315; l=2460;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=rJjD1X1aOzt7FsDkT8i5+1EQ5DBJ0OYaQuGPIhMalLI=;
 b=12JfTKZC/AlyFM8O1hZTlg+a8bQsSTxyTqDgAARC3BvK9OyL0XQ5YQCq0eAlC0nYBtVEM4AA9
 HQrKhzr23/PDnFpQ0G4qN4zlZeQILKjGmMf2F6pwL87eDwCOcQUZrVi
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
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
Reply-To: perlarsen@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sebastian Ene <sebastianene@google.com>

Allow direct messages to be forwarded from the host. The host should
not be sending framework messages so they are filtered out.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 27 +++++++++++++++++++++++++++
 include/linux/arm_ffa.h       |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 9e8bb95e8845..96cf6be969de 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -880,6 +880,29 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
+			      struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u64, endp, ctxt, 1);
+	DECLARE_REG(u64, flags, ctxt, 2);
+
+	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
+
+	if (upper_32_bits(endp) ||
+	    FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != HOST_FFA_ID) {
+		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	/* filter out framework messages and validate SBZ/MBZ bits */
+	if (flags) {
+		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	hyp_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res = {0};
@@ -938,6 +961,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_MSG_SEND_DIRECT_REQ:
+	case FFA_FN64_MSG_SEND_DIRECT_REQ:
+		do_ffa_direct_msg(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index e71d83ee0aef..a3f44e7c08de 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -269,6 +269,8 @@ bool ffa_partition_check_property(struct ffa_device *dev, u32 property)
 	(ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_REQ2_RECV) && \
 	 !dev->mode_32bit)
 
+#define FFA_SRC_ENDPOINT_MASK	GENMASK(31, 16)
+
 /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via registers */
 struct ffa_send_direct_data {
 	unsigned long data0; /* w3/x3 */

-- 
2.55.0.897.gb25b4bd76c-goog



