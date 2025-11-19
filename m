Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC3DCEE35E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWG6sKR79WigF0X2cWx20zqNyol2sqAyXF0mmyyo3mg=; b=EtsEt/AuRj01Zsvgm41Doz8ccI
	kbcOH9o1IRVKFSiVdgyJTyQoLgv1KbbJOsHJ4IdKBW+FhYU9hzLxw9tSVPAjKxNEBp53KXZaJIxo5
	9hsyo1wTlIt/l/BNdxZ5rsFzhj1dw+oiBYXWOeXsNvtSgwP8FHCCWmEH7GEKGAzQxSKkCkkcUS+tr
	SikYqMu7GBDpQSNaUy8T13aZeprUGCrLS73HWthLqvbfE3HnpDc2c/rDvHa9A0JmLg6vQbZrqj7Aw
	V/FcKE+3pdyBxRWqPJZO8SRUAb56soh6ndgddPU2MsYTbCYcSn3eeNq+oeZToGbqVMRJBl5aD89K6
	e5BkRhvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXcI-00000001N2t-41OP;
	Wed, 19 Nov 2025 02:08:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXcG-00000001N1s-1eLZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 02:08:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ED1944467;
	Wed, 19 Nov 2025 02:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6310AC19424;
	Wed, 19 Nov 2025 02:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763518093;
	bh=H+kRv/J7t1po25GngUG56ddLxp2HEOwjoVtlZSWF844=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LpAJrk13nPP2SlPaWB6AU7g0NfGgRn1tDlaiP385ouiDdULevDzu2orHT5ohlXkuf
	 4ZzODc9cLLetih33z78f1weW7v/NL7QEDLptLRHPf+yrQZsrczqFS0F/z5ssiecGJR
	 SKpqivlHvFIr0z+r2bhsdpjMSaySgMy5xWJjBSJx8Em6ugj83kvqqfjfY3LSvX3Yld
	 S/BwQamrck1b2hSG9ybWlyWCriG60nH3cvtZ5Q00+Gxf2NaLWYUIHPHBClOqYwPB18
	 VjdHyzCYM+8CmYz41qpfB6f4L9EnMmka5FLtNFlPwRMZ5dunvnvlVf3aslI088tu0U
	 b8rcW6ihefxow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28904CF256A;
	Wed, 19 Nov 2025 02:08:13 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Wed, 19 Nov 2025 02:07:53 +0000
Subject: [PATCH v3 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host
 handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-host-direct-messages-v3-1-c74d04944b26@google.com>
References: <20251119-host-direct-messages-v3-0-c74d04944b26@google.com>
In-Reply-To: <20251119-host-direct-messages-v3-0-c74d04944b26@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763518092; l=2269;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=q3WBYqBe9S24LJHsUs3M7p45BHiGyAz2s8dd2txWDcY=;
 b=ldeAB4/+ahQM8FZv/p6Cw6O/R+OolwSADHkdW5wYWA2I4+XWTN0Dx0AjQbjZjgwIiwdhSjLA2
 FPtfg9zUQyRDLkqqXhpQeQyQ4g5UoUXvQ9lj9nQysps/4e18BHaNe0t
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_180816_505302_6C95C13A 
X-CRM114-Status: GOOD (  13.18  )
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
 arch/arm64/kvm/hyp/nvhe/ffa.c | 22 ++++++++++++++++++++++
 include/linux/arm_ffa.h       |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 58b7d0c477d7fce235fc70d089d175c7879861b5..a38a3ab497e5eac11777109684a33f02d88d09a1 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -862,6 +862,23 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
+			      struct kvm_cpu_context *ctxt,
+			      u64 vm_handle)
+{
+	DECLARE_REG(u32, flags, ctxt, 2);
+
+	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
+
+	/* filter out framework messages */
+	if (FIELD_GET(FFA_MSG_FLAGS_MSG_TYPE, flags)) {
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
@@ -920,6 +937,11 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_MSG_SEND_DIRECT_REQ:
+	case FFA_FN64_MSG_SEND_DIRECT_REQ:
+
+		do_ffa_direct_msg(&res, host_ctxt, HOST_FFA_ID);
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
2.52.0.rc1.455.g30608eb744-goog



