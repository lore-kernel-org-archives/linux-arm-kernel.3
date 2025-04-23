Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872AAC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhQBXuxqfTl+4+r/Vl29bO2AgzTEmbCzLfXeV7ZTDAM=; b=blhb5tnsD6wxAAxUcA9kyf6vU0
	+99QmMCzaKZub/mZ6AALRKjk5+MKmQtuMOVI/yYZV0KECDIR1kgyhfiBYhpXqUHu1cc1Jx0UmLNda
	CjuGl/SPYHp2lemq2ofQzO3LuVi9rYOKOFO3JbB6I69aWfmRZjpHC/2CujTtqM3fpSYUY2rmNJD7x
	5xwg3rc7iZragWfe6uM7bvx2MqnOfHns+x2/YFojDrmuu5Yi5zacbgaQcnr7EjWO5Sp4b+2yIDEuD
	rb6yo8Z10g5ZYnRkNPVFjtqsPY2cgolehpjwiZA5ckl32Vd6HdODL+HYh2fY9oMCGEe4Q416v5jk9
	t6H3J5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e6o-0000000BKXC-24mA;
	Wed, 23 Apr 2025 17:42:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7boj-0000000AvoO-02HZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50645A4BA31;
	Wed, 23 Apr 2025 15:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8ABC4CEEB;
	Wed, 23 Apr 2025 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421316;
	bh=3qbUHNjVeE1aIlxcMRPnT2/3KD3ydEWgG5AMl0skQMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JE3uJb4ovVaj6pOQNm3iEbeTT97Sui7io2Ku9gx4nMblhdKYTZITZ3eLiYwFoppyB
	 OYfMx1yFMQHRvEYMQDiD1DdzUTNbqr7Gqvie1THa/SyDlCLKG3o5uhBaNlzLNDXKX0
	 h6ujdSWBxVNUZk6bo0pjikgyGSyrj3FfjMDZW5/hYOMzkVY/tsO7Eg6ES3SG1ObCT9
	 uWQLpM8tm4FPcIcBoU67RRXmU9SO/8eBIyGtRIn0KwvUxF6YWjBuNH/a4q2X1P5fVL
	 0IYiR61Xq4IZ5ztY5zNycqwuCdFlujJliEhRFuD7OYeT9amgSLbFECHKU+Ecorc1Ch
	 ++kLYDhNfkAEQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u7bog-0082xr-0j;
	Wed, 23 Apr 2025 16:15:14 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH v3 04/17] KVM: arm64: nv: Snapshot S1 ASID tagging information during walk
Date: Wed, 23 Apr 2025 16:14:55 +0100
Message-Id: <20250423151508.2961768-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250423151508.2961768-1-maz@kernel.org>
References: <20250423151508.2961768-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_081517_180375_177FFF23 
X-CRM114-Status: GOOD (  12.58  )
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

We currently completely ignore any sort of ASID tagging during a S1
walk, as AT doesn't care about it.

However, such information is required if we are going to create
anything that looks like a TLB from this walk.

Let's capture it both the nG and ASID information while walking
the page tables.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h |  2 ++
 arch/arm64/kvm/at.c                 | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index c8a779b393c28..4ba3780cb7806 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -274,6 +274,8 @@ struct s1_walk_result {
 			u64	pa;
 			s8	level;
 			u8	APTable;
+			bool	nG;
+			u16	asid;
 			bool	UXNTable;
 			bool	PXNTable;
 			bool	uwxn;
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 71406908d4f44..da5359668b9c9 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -414,6 +414,33 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	wr->pa = desc & GENMASK(47, va_bottom);
 	wr->pa |= va & GENMASK_ULL(va_bottom - 1, 0);
 
+	wr->nG = (wi->regime != TR_EL2) && (desc & PTE_NG);
+	if (wr->nG) {
+		u64 asid_ttbr, tcr;
+
+		switch (wi->regime) {
+		case TR_EL10:
+			tcr = vcpu_read_sys_reg(vcpu, TCR_EL1);
+			asid_ttbr = ((tcr & TCR_A1) ?
+				     vcpu_read_sys_reg(vcpu, TTBR1_EL1) :
+				     vcpu_read_sys_reg(vcpu, TTBR0_EL1));
+			break;
+		case TR_EL20:
+			tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
+			asid_ttbr = ((tcr & TCR_A1) ?
+				     vcpu_read_sys_reg(vcpu, TTBR1_EL2) :
+				     vcpu_read_sys_reg(vcpu, TTBR0_EL2));
+			break;
+		default:
+			BUG();
+		}
+
+		wr->asid = FIELD_GET(TTBR_ASID_MASK, asid_ttbr);
+		if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
+		    !(tcr & TCR_ASID16))
+			wr->asid &= GENMASK(7, 0);
+	}
+
 	return 0;
 
 addrsz:
-- 
2.39.2


