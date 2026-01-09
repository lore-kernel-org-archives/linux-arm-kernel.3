Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115E5D277C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 22:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSCFBkUkvhaguCZT5cykObeLp7EhgX7wUz5A02P8cqw=; b=zK9rikMGUBzvDH/QInS29hzcU6
	JIK4BYPWihhty+QSLGkCazT4U5TpBW6EYPraq80qg1T2Q7DHF1rSonnYInM0PuhKp6PDr1Pxfl7kr
	3tbXT7Ekgg1RG6YeWJ3on2+3gabmzBBIo2peG8Zbys6a29/q7AlafL2loaZjiw9qVfTfYFL8pEvz0
	bGqjXcBctTwomaAZICjckvMao7i/fCl8cO4iKowezzac/JXMVrHTDkvIaSQHje2t0hsUGw0GbvXvJ
	5bAeC6gQy85clSdvP3rKq44JoKE+CVwBBCBm7Q4v0t7Cyz7Q7KKZcXw+K4LZd5Kcvy3R8eUhniID5
	dgeCt7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veL41-000000034jf-0ApH;
	Fri, 09 Jan 2026 22:34:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veL3z-000000034jI-3NkH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 22:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98EF76017B;
	Fri,  9 Jan 2026 22:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44B71C19421;
	Fri,  9 Jan 2026 22:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767998073;
	bh=tIvspsneeLwDiomVsTRPwrdHkeMhFvZLlssLRaJyK48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hr5ggYBYoKwuQWxE28Z+24Z/FACu7sWJaF+asG1cvCWnJD7oorLB1Aaoh0QsJP0+8
	 D0QLgp4XXYSpxPzyNc/VTxe0qKZal/TdVMMyj+ugY9VeoMcEhSbJ/oDSHGa7ThflEt
	 t0Dplam8RmmaaEPR2Hp5mQueJ7J8KamGJuu0jU8T0lZ0aSJQVIssjrY8Eh7dd5f0Qn
	 bPzscz0+uNEHLFvpksuxLyGhydughg/SvNJ/1iLAFMRvRUhoxCsDGVb7XKsp5FQoaI
	 E28i1/gZ7G1+Qzk+A7gUevKuK2yQBdk6gPjtAcbAaY4oAcwAAVyvHZHGLy1lyA9l9I
	 lKFgwumGCUf2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350CCD277C1;
	Fri,  9 Jan 2026 22:34:33 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Fri, 09 Jan 2026 22:34:25 +0000
Subject: [PATCH v4 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host
 handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-host-direct-messages-v4-1-95da4221d186@google.com>
References: <20260109-host-direct-messages-v4-0-95da4221d186@google.com>
In-Reply-To: <20260109-host-direct-messages-v4-0-95da4221d186@google.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767998072; l=2212;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=w/i2Ml6dE6jz3JLbRWYLcU7BlfS1xCbyKvHbkV2MRRA=;
 b=xYmKBs65rSUnbTXmKTCxgMWon/4X3RUxdPsG8Cj2usbIGZu9UjyDqahHlTM25wI9lFyU8ezGk
 Fra7TJtjhoHCo/5jmgFb0vOVgISe6ixXpeX4H3s8r+Y3SFWE/Xfx9yn
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
 arch/arm64/kvm/hyp/nvhe/ffa.c | 20 ++++++++++++++++++++
 include/linux/arm_ffa.h       |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index f731cc4c3f280a32acccca0de92b9ac6c8e05602..fc84595007f310004def7d525371fa7c128f244a 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -862,6 +862,22 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
+			      struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, flags, ctxt, 2);
+
+	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
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
@@ -920,6 +936,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
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
index 81e603839c4a51873090b7e22edbe7b33a7e94df..d209d0cdac1eb804be01e4607acac8f76cc99e40 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -130,6 +130,9 @@
 #define FFA_FEAT_RXTX_MIN_SZ_16K	2
 #define FFA_FEAT_RXTX_MIN_SZ_MASK	GENMASK(1, 0)
 
+/* FFA message flags */
+#define FFA_MSG_FLAGS_MSG_TYPE		BIT(31)
+
 /* FFA Bus/Device/Driver related */
 struct ffa_device {
 	u32 id;

-- 
2.52.0.457.g6b5491de43-goog



