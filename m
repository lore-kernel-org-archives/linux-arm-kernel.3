Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11A6C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLAVULANsxnP+uts2XWZMnuszVHkoU4OEzdsrZwPKbY=; b=1OvL+gK/SUXSqltaPcY2n2riYZ
	cSNYm1axfowetVJdNVvXA36WgtKrOuEQ7p98bAQSWkN4lPWebP0UZNXYyBq9oA4kUkuqOVf3rcbiY
	Pn5lNaDcDqHascQ5wrWnpNYvS08tPyTSn1FHt2Cee6+/ySQTVt3mKisII/RqTKWl2cm/lD0Cg2ffn
	kg5Ax9mQNeyYskEuDIrpg3QlczPdsK8uBiRMPGTmvUfUxxPeajyqzyYInDBZfxLPniaUT0nbsL2E+
	N/BnmPyeyRv6jsLWmR1rBezrv4MKkPeTiTZUoophWbftAbqsOKhLsTkHGUqLfw7islVHBrDGUQMNB
	8DaL2w1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fie-0000000262M-3hgb;
	Sat, 26 Apr 2025 13:37:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeV-00000001z8X-3NZ8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E4C168481;
	Sat, 26 Apr 2025 12:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E565BC4CEED;
	Sat, 26 Apr 2025 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670543;
	bh=U0IcVwx7DI2PFPXqgbaLx9sOFJAOnAR9kyfbtx5vOZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JBAsu569u8GkwsBFemGInbv3/S5nyd69v6PXGeVeVkak0TBu0A5e7pSxEH89TK2Qd
	 M5OCO1OEftruULGVy7VTh2mGfwt53/9Lf4djvbnqV0061WLNKne57g78z7u3W44HEb
	 q3ROoNmXw8OW6zUt5iTOq7js5cZCwL1sEWYTRoaAw/JfKk+btUk3AjDxCiiKNjoJ7E
	 3vaVTkgWIVxfVbq5Bw6o7CZ1C2v4IVyNGCwg75pLHAwfVU4TYp5LUVxg+wifxWDl+w
	 yd5yVkKiOm6Yda+TZxxplQIPnmfWsW84dozZ8sOscf1x0zuL3Q56orsgmKAIi/lgsu
	 P8AMNrZ70bBzw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeT-0092VH-1M;
	Sat, 26 Apr 2025 13:29:01 +0100
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
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 39/42] KVM: arm64: Add context-switch for FEAT_FGT2 registers
Date: Sat, 26 Apr 2025 13:28:33 +0100
Message-Id: <20250426122836.3341523-40-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
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


