Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64E0D3B9BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 17:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eV0SuU64wv+TKR6GkrolzSpUiBPAP7iHt3unRrWrtM=; b=Y5TpYbD8h0yTWFTAjtv5OwEA88
	SN0JxpSymtXnwJapdP61I/gelLkkPlfaton3tfvPXh+9x3uGaedo8EPmxcRDaTICYDlfvuugd7Vck
	63JdpnBdWOVIyRH/y6dWsJtKg+8TaygTZsavyUVDiP6HLkAFIrPFnmWudDAss5jDxBXGyIUqTi4g4
	uETW5B8Sy2UE3/UmlqJj+AE8PA2HjqOvZBCg1iG1FdcDcDW1YqFlwYs1jhCaDfMnnz398o5VlrYSE
	HmaK8yyeDP9mWRCl7XmAyty0uRY2WQILW1vksTmgGwFN4qng8E5//gBRfnnTUqCujllBd/4sxBer9
	9dtY7Q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTO1M-0000000FhGA-0Xue;
	Wed, 10 Dec 2025 17:30:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTO1J-0000000FhDs-34he
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 17:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE5634414A;
	Wed, 10 Dec 2025 17:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886ABC4CEF1;
	Wed, 10 Dec 2025 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765387832;
	bh=RsP+jKzQ4ppzzi0DdCDKDraJ6gU5DPtIntpZyn+upb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sCy3VTgGwt/xQ5FAGr2m7cteORdx7PJk2HfyylKEPjeYiFqZ9iKmPN9lchTNQSBVt
	 qtsaXGOx3MhWNrkc3/h06/o22vp8CfjAEBEFRGuSOmamKnLfvGnO9/M+qABP/9Ei6h
	 bCTQwmAvTswaDqu4Dxw23ClAGPdF/nDmlA5cVZ9efJkvcxCFxHtVqfQ833GXH87X1u
	 qWKdpaSTt1P6H/0LbX5LSK/1KnsepLehc8XvCJdpnzbTL58wRMxh3oqDNMz5CMEGyO
	 oPc2Cxr9823HbA0T9C1FmwMZ2Yoni0UKwC0c5IPnYBQCjmq5Ud1XF/v9NQAV8JMXEd
	 8nY3CY2zuUCnw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTO1G-0000000BnnB-21e6;
	Wed, 10 Dec 2025 17:30:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: [PATCH v2 1/6] KVM: arm64: Fix EL2 S1 XN handling for hVHE setups
Date: Wed, 10 Dec 2025 17:30:19 +0000
Message-ID: <20251210173024.561160-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210173024.561160-1-maz@kernel.org>
References: <20251210173024.561160-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, alexandru.elisei@arm.com, Sascha.Bischoff@arm.com, qperret@google.com, tabba@google.com, sebastianene@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_093033_795857_9700A9AA 
X-CRM114-Status: GOOD (  10.74  )
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

The current XN implementation is tied to the EL2 translation regime,
and fall flat on its face with the EL2&0 one that is used for hVHE,
as the permission bit for privileged execution is a different one.

Fixes: 6537565fd9b7f ("KVM: arm64: Adjust EL2 stage-1 leaf AP bits when ARM64_KVM_HVHE is set")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_pgtable.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index fc02de43c68dd..be68b89692065 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -87,7 +87,15 @@ typedef u64 kvm_pte_t;
 
 #define KVM_PTE_LEAF_ATTR_HI_SW		GENMASK(58, 55)
 
-#define KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
+#define __KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
+#define __KVM_PTE_LEAF_ATTR_HI_S1_UXN	BIT(54)
+#define __KVM_PTE_LEAF_ATTR_HI_S1_PXN	BIT(53)
+
+#define KVM_PTE_LEAF_ATTR_HI_S1_XN					\
+	({ cpus_have_final_cap(ARM64_KVM_HVHE) ?			\
+			(__KVM_PTE_LEAF_ATTR_HI_S1_UXN |		\
+			 __KVM_PTE_LEAF_ATTR_HI_S1_PXN) :		\
+			__KVM_PTE_LEAF_ATTR_HI_S1_XN; })
 
 #define KVM_PTE_LEAF_ATTR_HI_S2_XN	GENMASK(54, 53)
 
-- 
2.47.3


