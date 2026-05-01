Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B25FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 05:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1pAvU48Dc4lDVPNYbZzsmuQ/LmzckNR9wTwxT/MlDE=; b=duPlRmxNGsZU99TKB4DbY9Ej5m
	4KMdvg+VFo+cM1EbQ5U9f4xbgaDAmfFf9alTp1DtuMlfH9xQytmLJJG/zuPTXFnAjR2rFaO1OTyed
	5h0FxDDQw90IJaVQw3CP43/XxKCV3hCxuYh1HE6Z7SyOu7Jo9pinC/RA92ov29lOdvO3ptlgtqjD3
	bJoYGz8+6vkQ0RSD4IIEQrBQaIGXlUxY3kLFIm9Lo8UjWNqLtOVO1MZ9f64/xclkLwqV2oOt9iEs6
	/zlHRW2VH2i+zgni9oXo8D0Y3PA9dq9mOD617zU7C0cWb6MgUsPrWeVlYC2Y6jRjhPNDpE2sA7kCo
	OROxV/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIgWT-00000006Nm7-19Iz;
	Fri, 01 May 2026 05:34:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIgWR-00000006Nla-32jb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 05:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE14A6057A;
	Fri,  1 May 2026 05:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67598C2BCC6;
	Fri,  1 May 2026 05:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777613682;
	bh=aRn8GJuxqyfjg3v+/hvhpxZjcAkxiTVxbeiVJTql2IE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rJ85hmf6L50HybXisMXQK7XpgSX6irq+jKqgcRDWEteFah7WPA6A3O3RrFM+2BlXx
	 F0gBbwGPdHD09rm9+XgbouslhnbVYoy04bqEZYObgdmxB1zo3kPD/NARAIb2ONbjc3
	 lr7NXAjtNfGvt50yt6sUnj+E++Hs/NHx8nqKzXxtxhpWPOoRHKk+NKxlBbML/Q1FdS
	 OXwjBtLXTUnXHA+zpXTpeDKxJLW3UkVUqqNXfmFqyF+d4BqPq2n0uXcuh/7tBW5BpI
	 PF+H/U6XonZ3187SnnyEp9wHMHlxFjEa/gb2ySQjJIEHLvrkhd1ydMamUW1Ig++HTD
	 UHZ8UitEn+/qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9AEFF885A;
	Fri,  1 May 2026 05:34:42 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Fri, 01 May 2026 05:34:32 +0000
Subject: [PATCH v6 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host
 handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-host-direct-messages-v6-1-3f4af727ed85@google.com>
References: <20260501-host-direct-messages-v6-0-3f4af727ed85@google.com>
In-Reply-To: <20260501-host-direct-messages-v6-0-3f4af727ed85@google.com>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Armelle Laine <armellel@google.com>, 
 Sebastien Ene <sebastianene@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777613681; l=2423;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=WcT4GnYGRai1al3No1p4rWhaOhcYyVBgrnZcY70Vuxw=;
 b=0m4u+K26HoB3/Z/4qCMDxYHu0SFv3ZicVI1ZZvzDrdc4U6qjzmtKHKEX4NRiWkvTVZBS/g88V
 87W2na3RsfHCYCbaHpCtIhSiIGRFqlijuRRMdXJR0zUkjv9ZPuQMM4r
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
 arch/arm64/kvm/hyp/nvhe/ffa.c | 26 ++++++++++++++++++++++++++
 include/linux/arm_ffa.h       |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..3a58e01d255f 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -862,6 +862,28 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
+			      struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+
+	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
+
+	if (FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != HOST_FFA_ID) {
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
+	arm_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -920,6 +942,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
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
index 81e603839c4a..f47d4bd51b2d 100644
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
2.54.0.545.g6539524ca2-goog



