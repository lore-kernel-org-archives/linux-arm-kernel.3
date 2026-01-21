Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B318C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nJvSFAuR3Pk/7986jCrxf9amO+0VQYQ+3sUulNfFyU4=; b=Ff1CHtKCIQNaJx3JB8bgl0VytD
	xB3DykJskLvUP9pYksbG0vACQmklnB4MXP80AiBncPcgq+FuvrQHRboVeAp3IlJaNoIKASS+a8v51
	BphryadqtsrwjzjGA8eANWySws5TlvA/NSKLSqvDI9D7MbxFAwByImrR2G63k/S90V/5VjDlb5hP8
	CDdWiTDS3H+7JiB5KbxBjkriHaUuCV+7TD0zEwP553De+aTYiIkE2dQmrFiG9nC+aFVzhDYon+ux3
	V4OWyXhQNPksyOEfB9ZG6uyFEvPObMqwMWcPWlmASJ3OZDDCQQwcnmlxPvX0VOzZcp4+rU6qA+cbw
	5gWv1sDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVIW-00000005Gfw-0FpS;
	Wed, 21 Jan 2026 10:18:48 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVIT-00000005G5k-2GFI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 10:18:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768990599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nJvSFAuR3Pk/7986jCrxf9amO+0VQYQ+3sUulNfFyU4=;
	b=lwZxIFjdRpZOja2XmzGbHhHRf+eXBIHyxXHA1bs0AkCJbgGHA99lfd1FGFtkFExDabAK8z
	5lAdIBzM77+Up6idcEwd58Gw3iFyNLOnRkmWJZTjZPsPlBkvOjK73jfVWrY6JMxHuXJyE1
	KK5mklWJU1Gki5ziL+WnZaFiVeKZenU=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	zenghui.yu@linux.dev,
	wanghaibin.wang@huawei.com
Subject: [PATCH] KVM: arm64: nv: Return correct RES0 bits for FGT registers
Date: Wed, 21 Jan 2026 18:16:31 +0800
Message-Id: <20260121101631.41037-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_021845_781244_3E0C5C54 
X-CRM114-Status: UNSURE (   9.76  )
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

We had extended the sysreg masking infrastructure to more general
registers, instead of restricting it to VNCR-backed registers, since
commit a0162020095e ("KVM: arm64: Extend masking facility to arbitrary
registers"). Fix kvm_get_sysreg_res0() to reflect this fact.

Note that we're sure that we only deal with FGT registers in
kvm_get_sysreg_res0(), the

	if (sr < __VNCR_START__)

is actually a never false, which should probably be removed later.

Fixes: 69c19e047dfe ("KVM: arm64: Add TCR2_EL2 to the sysreg arrays")
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 arch/arm64/kvm/emulate-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 834f13fb1fb7..2d04fb56746e 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2428,7 +2428,7 @@ static u64 kvm_get_sysreg_res0(struct kvm *kvm, enum vcpu_sysreg sr)
 
 	masks = kvm->arch.sysreg_masks;
 
-	return masks->mask[sr - __VNCR_START__].res0;
+	return masks->mask[sr - __SANITISED_REG_START__].res0;
 }
 
 static bool check_fgt_bit(struct kvm_vcpu *vcpu, enum vcpu_sysreg sr,
-- 
2.34.1


