Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2480C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F7tyr2hRMcjQRJkAv9fgyabupNHWddZFeMwga3dlzT8=; b=NtAcHLQOcBQjGyVymSnp9crpHt
	Oe1uIjty7vEYpgXaQHGLTiv9l7ZnI9Njxqa/k1thg/o7aSWiBJ0yzruor2oSla3nO7EXXCvUnTzT5
	kAaFBA83P9gdNYtUxD8xq/ENPOYIFcB819tchG5rUWsgWmG1H+tlgUUa8a5DpJaK7QzPLjEEUV4lg
	tZ1ooK1/b42q/28HWpG9OrL4gtQhMqp5+DPjtW+UaU6O1reJdQR2RQw0WqT8uyIR3rIRWHuk+j9wn
	ud4RGJuVXCZMjdkfqL4HQfOZCli/0Rqc3QivQ8ENtGWxRCtLVyeBT8jm1UaHFu3Ss8fhy86oqbluW
	NYHiXepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJFeJ-00000007SFn-1XJJ;
	Sun, 25 May 2025 18:00:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJFcE-00000007S6c-1RA1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 17:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEB9143B32;
	Sun, 25 May 2025 17:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD01AC4CEEA;
	Sun, 25 May 2025 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748195907;
	bh=c0DVjSp9QtchPMDhJIS/125dCk8iVBUSWQRTJ1mZiZE=;
	h=From:To:Cc:Subject:Date:From;
	b=UY/+q0VeM/1QeG7MMfxF1aO/l0cMoxy7lUMeQCB1joiVOIOC2DfTQyCXQeE5PjCv6
	 CGoRghZmDgPyZPLNXyfXnWFRQM0J52gX2Sr+A2dbMpQ/pROxOkrSoj8tlJZcWUeL8t
	 s9mpoG9Epu5C5spe2Y0qtAR6yKIZczmbFzJua0Yzta4KmBGhEd/cYn2Coe07HVDBXt
	 a87lvRPAgkdC2zqKk1zQBxxZtI/CzLRQLnCAvLDoqq+JK3G8XFXlWVcW4n3yCMwpTx
	 /btEXqsAx8DPniPh/RlOI3VLaEJasBkdWcENi+2wiOhhYRgvalmLuf86gn87aPX47p
	 F+WNFXu+hbjuw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uJFc9-000QgR-AZ;
	Sun, 25 May 2025 18:58:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: Mask out non-VA bits from TLBI VA* on VNCR invalidation
Date: Sun, 25 May 2025 18:57:59 +0100
Message-Id: <20250525175759.780891-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_105830_419577_ED341CC7 
X-CRM114-Status: GOOD (  11.41  )
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

When handling a TLBI VA* instruction that potentially targets a
VNCR page mapping, we fail to mask out the top bits that contain
the ASID and TTL fields, hence potentially failing the VA check
in the TLB code.

An additional wrinkle is that we fail to sign extend the VA,
again leading to failed VA checks.

Fix both in one go by sign-extending the VA from bit 48, making
it comparable to the way we interpret VNCR_EL2.BADDR.

Fixes: 4ffa72ad8f37e ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 291dbe38eb5cf..4a53e4147fb01 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -918,6 +918,8 @@ static void invalidate_vncr_va(struct kvm *kvm,
 	}
 }
 
+#define tlbi_va_s1_to_va(v)	(u64)sign_extend64((v) << 12, 48)
+
 static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
 				  struct s1e2_tlbi_scope *scope)
 {
@@ -964,7 +966,7 @@ static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
 		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
 		if (!scope->size)
 			scope->size = SZ_1G;
-		scope->va = (val << 12) & ~(scope->size - 1);
+		scope->va = tlbi_va_s1_to_va(val) & ~(scope->size - 1);
 		scope->asid = FIELD_GET(TLBIR_ASID_MASK, val);
 		break;
 	case OP_TLBI_ASIDE1:
@@ -992,7 +994,7 @@ static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
 		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
 		if (!scope->size)
 			scope->size = SZ_1G;
-		scope->va = (val << 12) & ~(scope->size - 1);
+		scope->va = tlbi_va_s1_to_va(val) & ~(scope->size - 1);
 		break;
 	case OP_TLBI_RVAE2:
 	case OP_TLBI_RVAE2IS:
-- 
2.39.2


