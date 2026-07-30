Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C979C55168
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGvQNkP1l3TwbdM+M5kTh96uuQDjEKCciwByUmopZFA=; b=VbZekACn910WsNDf5tWm8ryCKM
	FKbfY0eM7XwVUbZ0pj2qG9Hr9ncWzexgaU/UWM50RoMrUUkZKfzKXNo2/WuESzkeaMRpUW45ZsRHC
	7T0nVr4orsIsSoZ6LvpcEe/66Z28S85YtU/wI3xPj4LTsIR9r301n87tPanA7VSoWqRiEy7Nt6BN1
	WwanbfyuXKHlsD8SxiclYVDIX6pISCgzl+jHz/8KXnezpoKhp7RNDWJPkFkjjR2kGBV7yVq6UmS7q
	RLl+I4Ma+aG+5sjkd+agPT9bDMmqfv4OjBm2PUqXrhcdIB7pCRMdj7FekxmrM0BmHgTu2sSIO1QbF
	XEcxTePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvd-00000009gqu-0bJn;
	Thu, 30 Jul 2026 07:11:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKuu-00000009gPY-17nx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09CB844046;
	Thu, 30 Jul 2026 07:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F9E1F01569;
	Thu, 30 Jul 2026 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395455;
	bh=FGvQNkP1l3TwbdM+M5kTh96uuQDjEKCciwByUmopZFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h7LTurJqv9b0ZPY7NJOaeijHK1lGlK0IAH3hfFk2Io964T313o5F52qcFMUKmdNIH
	 CPpAY5uSOkpjFmV/v5prCdvR5h1rf8xUcwMbEXdRMgoNY3WrJv+yjZmS4V8kkCSeEy
	 /XDh4OBNSj8ap4N4HlTgxkjxorQiy8Lz2ZZIrybHfrWFwT7MLcLF8bQh8jwIyLKL4E
	 3a3YHrGMbbckL/ZtkCbZdvk+sDKgVb324aIfc758Qul5kj22+WPiCBxekMnL7tTwxx
	 l4Xky7EgK73lhD0UjaWdo4vYLVMqg8kioid51tzvSnFx6WTyLSDA3AhEFKXYxlAWgP
	 4Nd3d6CsvVh/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKus-0000000AOpW-12ip;
	Thu, 30 Jul 2026 07:10:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH v4 27/29] KVM: arm64: Expose FEAT_NV3 to guests
Date: Thu, 30 Jul 2026 08:10:20 +0100
Message-ID: <20260730071022.296811-28-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730071022.296811-1-maz@kernel.org>
References: <20260730071022.296811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com, vladimir.murzin@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Further enable FEAT_NV3 by making it visible to NV guests.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index f646894fec9a9..70d605e60cfb3 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1728,7 +1728,7 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		 * You get EITHER
 		 *
 		 * - FEAT_VHE without FEAT_E2H0
-		 * - FEAT_NV limited to FEAT_NV2(p1)
+		 * - FEAT_NV limited to FEAT_NV2(p1)/NV3
 		 * - HCR_EL2.NV1 being RES0
 		 *
 		 * OR
@@ -1741,7 +1741,9 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 			val = 0;
 		} else {
 			val &= ID_AA64MMFR4_EL1_NV_frac;
-			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
+			if (cpus_have_final_cap(ARM64_HAS_NV3))
+				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV3);
+			else if (cpus_have_final_cap(ARM64_HAS_NV2P1))
 				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV2P1);
 			else
 				val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
-- 
2.47.3


