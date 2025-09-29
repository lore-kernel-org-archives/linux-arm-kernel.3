Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975C8CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDaddQJ8JCnLiwW378+toZRQGucK2NSHNkzaSVlTtmA=; b=ZemSwjxXQNuVQc8R5AyKaPIGGC
	vhdOf9h9AajjbOBTagBy+EHR58bxFgdTvHh/TbmQVvXOPBR1AgGddxd/limAWxkRKy3aqCgs9wThF
	hOBpPNdgj+4b5pOvZMAmhOcwoedbTr1rMNhbvoqkFfxthyc+CdFBGuq12s0+hWbTBoZl8f87z/BmK
	5kz5ldBhwURm2jfj87DLj2Fcx0yWUolNO9cIuROSnHgARhf4nQx7Icu9OnDLOJwpnZnDjQmQvVGiz
	hL7TfOcsitpr2aAvbgnGnwRy6tmcihhkSRr+0I7bAqjgxZ9xRK+zrhySwDaxjqp8Fa9UOvjRtWBSs
	tUc1wx6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNf-00000002uMj-35Ca;
	Mon, 29 Sep 2025 16:05:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNB-00000002txT-0yrH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E22F748BD3;
	Mon, 29 Sep 2025 16:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FC3C4CEF4;
	Mon, 29 Sep 2025 16:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161908;
	bh=xf14NnyMKHem7v0GFcButVI1oYqRG6KefQ4B2vRe5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EUORJnsvm3yTBHTq5QrTy8DnN6hmend8BtrBkXa0lDViVCD93T7FN9sQtJd94UPBc
	 J2dOF/dJW/h+ucsurQkK40W+s1PBdhrAq0Qcc9QafX3bQ0EJalIgt3z+PmZs7As9k5
	 GUMp4l5E/+dga/DRTdy8qdoP8og5E1pgj+hXyylfD9jDonvmU9UatFkPxtYVE4p56o
	 HfFUQXqdZhhalTnSTtuAwUY1L6FT2ttkrNjybK4Afdg9Lv567j4mFhWrwFR6uBvbvv
	 5uN96mP/s6tiddu1uYSwu8oprD+b0OZXdvxjZlmCZdYliTbOoAxkT9Iw3zu3tASF9S
	 Vev6M9TENpseg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN8-0000000AHqo-1xoU;
	Mon, 29 Sep 2025 16:05:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 13/13] KVM: arm64: selftest: Fix misleading comment about virtual timer encoding
Date: Mon, 29 Sep 2025 17:04:57 +0100
Message-ID: <20250929160458.3351788-14-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929160458.3351788-1-maz@kernel.org>
References: <20250929160458.3351788-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090509_301092_4F68EC58 
X-CRM114-Status: GOOD (  12.72  )
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

The userspace-visible encoding for CNTV_CVAL_EL0 and CNTVCNT_EL0
have been swapped for as long as usersapce has had access to the
registers. This is documented in arch/arm64/include/uapi/asm/kvm.h.

Despite that, the get_reg_list test has unhelpful comments indicating
the wrong register for the encoding.

Replace this with definitions exposed in the include file, and
a comment explaining again the brokenness.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 .../testing/selftests/kvm/arm64/get-reg-list.c  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 7a238755f0728..c9b84eeaab6b2 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -348,9 +348,20 @@ static __u64 base_regs[] = {
 	KVM_REG_ARM_FW_FEAT_BMAP_REG(1),	/* KVM_REG_ARM_STD_HYP_BMAP */
 	KVM_REG_ARM_FW_FEAT_BMAP_REG(2),	/* KVM_REG_ARM_VENDOR_HYP_BMAP */
 	KVM_REG_ARM_FW_FEAT_BMAP_REG(3),	/* KVM_REG_ARM_VENDOR_HYP_BMAP_2 */
-	ARM64_SYS_REG(3, 3, 14, 3, 1),	/* CNTV_CTL_EL0 */
-	ARM64_SYS_REG(3, 3, 14, 3, 2),	/* CNTV_CVAL_EL0 */
-	ARM64_SYS_REG(3, 3, 14, 0, 2),
+
+	/*
+	 * EL0 Virtual Timer Registers
+	 *
+	 * WARNING:
+	 * KVM_REG_ARM_TIMER_CVAL and KVM_REG_ARM_TIMER_CNT are not defined
+	 * with the appropriate register encodings.  Their values have been
+	 * accidentally swapped.  As this is set API, the definitions here
+	 * must be used, rather than ones derived from the encodings.
+	 */
+	KVM_ARM64_SYS_REG(SYS_CNTV_CTL_EL0),
+	KVM_REG_ARM_TIMER_CVAL,
+	KVM_REG_ARM_TIMER_CNT,
+
 	ARM64_SYS_REG(3, 0, 0, 0, 0),	/* MIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 0, 6),	/* REVIDR_EL1 */
 	ARM64_SYS_REG(3, 1, 0, 0, 1),	/* CLIDR_EL1 */
-- 
2.47.3


