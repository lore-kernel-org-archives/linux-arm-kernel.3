Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E476C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gC2LT6KR5D/wscBxU2CnA8VDI3UpKcmnY8z5adeCz5M=; b=uGu8F417/+FNwHPF3tklu1O/Mb
	RYHo3QJx18LJtuGLTy2pG8deESNdTjKd9kN9LRCq9zqgxvzxUxqficMfsrteX2K19V/T3UNWbBTOU
	gUUf2FiQ4fyVwbXVBxmhLmVQq4EWaHPUac+taDggUPgoMWU5wgXF/zkDrUnl/GNDUAjHa9nhYbyNp
	N9dDzmZxLJkGlKQdaIstu1MjqoXeoToTOr/MjMLlisxlfs/AWig1dHwU9xxxhlLTArRAK1areAMWY
	MZN+TSltVAEBfYKq9tfnOUwpt4GfTrqZ2IIF8xhM8ueCZChS2l+N12hIfA5JK3abmI1C+hmsjHgt7
	gyzWSihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3XV-0000000DpQ3-1Ite;
	Fri, 27 Jun 2025 07:30:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Gp-0000000DniW-1MO2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Jun 2025 07:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=gC2LT6KR5D/wscBxU2CnA8VDI3UpKcmnY8z5adeCz5M=; b=VoUgukdRpInlZRQIw3TzTypKW6
	w7RUXQvm21EVDQ1N/KGc7pAi9yzrVu3wabFhqqPlsqhaGc3zaEHf8HZXYjnjXCGCr7Jo1pB+96c32
	jhzGszaoX54Q2mcmHD5yrpzikOS+pFyPoIDwQ64XFeaQn595w37yfhrBaGf6z+x6LzJe6VU/Nn4ID
	DMt3Tc5EFfbfddVMmCfC1lIuAR6G9qfYorZUqgdR/+CNG9WCa6/POsgemFcaLt537/f0/qNIpk0Hx
	vbhjIBUdh6AG8UQ3T6285uTTIjCy30/V9lIJClpkkCOchsKM2U0nVbtkIQ6Iqm9cIgEhJ4Sz20W0U
	tW9JuLYw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Gk-00000006GgB-3Zni
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1619746357;
	Fri, 27 Jun 2025 07:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E310FC4CEF4;
	Fri, 27 Jun 2025 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751008380;
	bh=klh+xDRcULbooF8MFi5xLowZY/xbmuqnM1SLK8gC+H0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IfAJPJ8SMCtd/QKuPwxsR3R5mn/1SvpH24+BqWVziK5kvI/Pj7RGNmR9dxxc7qWFS
	 6PFbbuI5I9xyJWEZbz7hh1MFR1Wm7NOr+nswUf8r3VobmXEdh8eIGYerwl53u3PEVg
	 +AcVQasenUj4lJn048F3+adGJHeaI6fz2+J+DwtEwkdtKi+sCpmaaDBoQ2brQ54xQO
	 F4k7ijn+8/uL1+SW/cgH3RNqLIsJPQAEOouIym/cusccU+5VbGMOZFV41UrOTt50gR
	 pIRO4vN5gwzqsri57CETDLfhYlMS3bZpJNz30gJpuXXPOZMpwb3usVAHdUASO8jK5C
	 67TQXt8c8Tagg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CBCC77B7F;
	Fri, 27 Jun 2025 07:13:00 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Fri, 27 Jun 2025 07:12:29 +0000
Subject: [PATCH v6 5/5] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-virtio-msg-ffa-v6-5-8c02fd94edac@google.com>
References: <20250627-virtio-msg-ffa-v6-0-8c02fd94edac@google.com>
In-Reply-To: <20250627-virtio-msg-ffa-v6-0-8c02fd94edac@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, ahomescu@google.com, armellel@google.com, 
 arve@android.com, ayrton@google.com, qperret@google.com, 
 sebastianene@google.com, qwandor@google.com, 
 Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751008380; l=2999;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=Hltr6esYXys/fifuX4LJaE69K+4zBEQKpm9B+c1zcxQ=;
 b=3eyayw173eIS/U1YOT+pKH7Ed66MiRS9vDdxdwYsb5K9W5IEqrqub9hlfkRlkmLBHCm4nZ49W
 oCXO/uYF60hCMYXVCEeNHIw3tJZYAAeamsu38z42BsD5auTmlovJ35E
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_081308_190426_877CE016 
X-CRM114-Status: GOOD (  14.78  )
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

From: Per Larsen <perlarsen@google.com>

FF-A 1.2 adds the DIRECT_REQ2 messaging interface which is similar to
the existing FFA_MSG_SEND_DIRECT_{REQ,RESP} functions except that it
uses the SMC calling convention v1.2 which allows calls to use x4-x17 as
argument and return registers. Add support for FFA_MSG_SEND_DIRECT_REQ2
in the host ffa handler.

Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
 include/linux/arm_ffa.h       |  2 ++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index d543d1f5ddd62fb15f8d39f4ff7d5bb0006da4a1..348c5aa93ab8ade2b26fc86ed2169d801784a892 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Unimplemented interfaces added in FF-A 1.2 */
-	case FFA_MSG_SEND_DIRECT_REQ2:
 	case FFA_MSG_SEND_DIRECT_RESP2:
 	case FFA_CONSOLE_LOG:
 	case FFA_PARTITION_INFO_GET_REGS:
@@ -858,6 +857,22 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_direct_msg2(struct arm_smccc_1_2_regs *regs,
+			       struct kvm_cpu_context *ctxt,
+			       u64 vm_handle)
+{
+	DECLARE_REG(u32, endp, ctxt, 1);
+
+	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
+
+	if (FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != vm_handle) {
+		ffa_to_smccc_error(regs, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	arm_smccc_1_2_smc(args, regs);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -916,11 +931,18 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_MSG_SEND_DIRECT_REQ2:
+		if (hyp_ffa_version >= FFA_VERSION_1_2) {
+			do_ffa_direct_msg2(&res, host_ctxt, HOST_FFA_ID);
+			goto out_handled;
+		}
+		goto out_not_supported;
 	}
 
 	if (ffa_call_supported(func_id))
 		return false; /* Pass through */
 
+out_not_supported:
 	ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
 	ffa_set_retval(host_ctxt, &res);
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index c0dd6183d956043192114a522b7eef465e7078ac..82a35a3b22de426f7e9a8894e76fdf1e933b3d6b 100644
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
2.50.0.727.gbf7dc18ff4-goog



