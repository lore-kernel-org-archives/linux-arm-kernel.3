Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82273C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLAVULANsxnP+uts2XWZMnuszVHkoU4OEzdsrZwPKbY=; b=Pg5K6d2Fss6961RAWE98xH/hPj
	kKzziicpuNCnmhtmPnmLOeD5HTUnVuc0RltHTWqCMR3l70vVkWLlwzvl9k7sSSZnuFhEkTpiAWd/8
	eAVTRfTclnVD3bYqMdAEZNCFWKe9g+D8geQKxIbQKpFWxFOAgQfKOkPYy3IFzi/KqHFtHwiuW8+mL
	sVerBTe3xIXoDW906GUzwIZFGgvJEBKLqAmriKh5c3KTYujcvaJHQRg+wV8yOmJjFlVkzDHYbEvjh
	ryaPdNzfATXxE0J6ABsvQriY6RXxMqydEfE/yH+KYO9t9LNxSkrrmJd+KBO93xNRml5bc7DP1wY11
	mjmf7pFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQhB-0000000DXCR-2VoD;
	Tue, 06 May 2025 22:23:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOz-0000000CiJN-30Jn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82752A4D6F7;
	Tue,  6 May 2025 16:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F198C4CEF0;
	Tue,  6 May 2025 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549857;
	bh=U0IcVwx7DI2PFPXqgbaLx9sOFJAOnAR9kyfbtx5vOZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FbfMthXXrG2B98prBj1qwxcDUIP11stPeQB7X6HuPgAslYvm48/NlFGsAa9/K/hNs
	 U79g3YLLMvLvoZj7VJ5NzeRV9o4Oi81FBExmYMX6QWBTv5UxMqUh/3k0Ow91kWu5JK
	 W9x6ncFVb7e6SEq1zAsjjWCPvZEIODEH0QC2S08gqR26/pIbdVWAwiueJJJPRo9Tng
	 GcMPqU664o3zRfwlq0mnLDj/bUHl9xMACX8mC56r0AndPtnQ7bVubUmth3R06FCA7E
	 EWA+vulDqpSeTL2I27z9sahijwW93HxkR8MqA+Q11sv6bPBZPQN8sJZz9QrD7LpcUt
	 qzhLruD87orWQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOx-00CJkN-F7;
	Tue, 06 May 2025 17:44:15 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 40/43] KVM: arm64: Add context-switch for FEAT_FGT2 registers
Date: Tue,  6 May 2025 17:43:45 +0100
Message-Id: <20250506164348.346001-41-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094417_910481_BD79F9D1 
X-CRM114-Status: GOOD (  11.38  )
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

Just like the rest of the FGT registers, perform a switch of the
FGT2 equivalent. This avoids the host configuration leaking into
the guest...

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 0d61ec3e907d4..f131bca36bd3d 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -87,6 +87,21 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		case HAFGRTR_EL2:					\
 			m = &hafgrtr_masks;				\
 			break;						\
+		case HFGRTR2_EL2:					\
+			m = &hfgrtr2_masks;				\
+			break;						\
+		case HFGWTR2_EL2:					\
+			m = &hfgwtr2_masks;				\
+			break;						\
+		case HFGITR2_EL2:					\
+			m = &hfgitr2_masks;				\
+			break;						\
+		case HDFGRTR2_EL2:					\
+			m = &hdfgrtr2_masks;				\
+			break;						\
+		case HDFGWTR2_EL2:					\
+			m = &hdfgwtr2_masks;				\
+			break;						\
 		default:						\
 			BUILD_BUG_ON(1);				\
 		}							\
@@ -120,6 +135,17 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		case HAFGRTR_EL2:					\
 			id = HAFGRTR_GROUP;				\
 			break;						\
+		case HFGRTR2_EL2:					\
+		case HFGWTR2_EL2:					\
+			id = HFGRTR2_GROUP;				\
+			break;						\
+		case HFGITR2_EL2:					\
+			id = HFGITR2_GROUP;				\
+			break;						\
+		case HDFGRTR2_EL2:					\
+		case HDFGWTR2_EL2:					\
+			id = HDFGRTR2_GROUP;				\
+			break;						\
 		default:						\
 			BUILD_BUG_ON(1);				\
 		}							\
@@ -182,6 +208,15 @@ static inline void __activate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 
 	if (cpu_has_amu())
 		update_fgt_traps(hctxt, vcpu, kvm, HAFGRTR_EL2);
+
+	if (!cpus_have_final_cap(ARM64_HAS_FGT2))
+	    return;
+
+	update_fgt_traps(hctxt, vcpu, kvm, HFGRTR2_EL2);
+	update_fgt_traps(hctxt, vcpu, kvm, HFGWTR2_EL2);
+	update_fgt_traps(hctxt, vcpu, kvm, HFGITR2_EL2);
+	update_fgt_traps(hctxt, vcpu, kvm, HDFGRTR2_EL2);
+	update_fgt_traps(hctxt, vcpu, kvm, HDFGWTR2_EL2);
 }
 
 #define __deactivate_fgt(htcxt, vcpu, reg)				\
@@ -205,6 +240,15 @@ static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 
 	if (cpu_has_amu())
 		__deactivate_fgt(hctxt, vcpu, HAFGRTR_EL2);
+
+	if (!cpus_have_final_cap(ARM64_HAS_FGT2))
+	    return;
+
+	__deactivate_fgt(hctxt, vcpu, HFGRTR2_EL2);
+	__deactivate_fgt(hctxt, vcpu, HFGWTR2_EL2);
+	__deactivate_fgt(hctxt, vcpu, HFGITR2_EL2);
+	__deactivate_fgt(hctxt, vcpu, HDFGRTR2_EL2);
+	__deactivate_fgt(hctxt, vcpu, HDFGWTR2_EL2);
 }
 
 static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
-- 
2.39.2


