Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AED5C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKp+3xj92TDRIJAyDZ332kt/zQm2CoivlN/6lTqD1dI=; b=IjTXxA8tpgOA8GPTI0OQ5addxu
	c1VTOnLhdrQnQdzefSIbM1FBm96CZeQb80hoU6hdXeGzYtPl0n74/EgKiPCeUun2ekNdmLrVMgSje
	oVgGFdTZ5GgO15MEDd2ctRkFLIiReHDFZqdyCv1miPYXsf0Csx6dZYb5MArKvFGEhc+sUf/OItsrd
	j4ZsofRvMPnCz4JutV2x3fyizpFiVrENsO6mC32UBhXxoCMpYdLiCzU601LUnssoWFJ53i4Gho02g
	3hUTNrXZYhegxx0qQwtzasxcjPJvxV8WLwaYs3cL2pCZg2SnIGbpuLJdgf9knjEk6QytLkqdRnB9o
	ylSshy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcoe-00000002j6P-0Msn;
	Mon, 10 Mar 2025 13:05:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC3-00000002bSR-3ub6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E09C65C631D;
	Mon, 10 Mar 2025 12:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D6BC4CEF5;
	Mon, 10 Mar 2025 12:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609515;
	bh=UE+/Jn0v1kpPCg3Ww5aujoS3ZhYVP55Hgh9LzEWu0kA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dei6BMT1QS/oBTMv64uBPNvvP6j+MFw/RKDT3WBxAg68u8OWNBW26p/MEa5HYXHPQ
	 WF9kd/9hNWajRAo8C7daPgfeQj5iI3sRljITL1Gtx5I7eyBKTieCMxaF5AFQbwpv4w
	 Z+Pc5g7yQfKdW+Yq26YcOlJ7JiJWY9kldy40pNVtPFOeffUMyzN8nGE+Ni2p228XsL
	 uO5/FsID/qrR+MQd+8CAUsZK5yc6TLRVgJxiidjUqNf7xV4wRH5erxhv55bO3cL6KB
	 oVWrhtdI5xpwrMYSLB8P2cVQk+oA8TmHBIVImeYsA62p/eFknmNdNUnJCku8kpDhQv
	 kU3gjmxUqTeAw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcC1-00CAea-C2;
	Mon, 10 Mar 2025 12:25:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 13/23] KVM: arm64: Propagate FGT masks to the nVHE hypervisor
Date: Mon, 10 Mar 2025 12:24:55 +0000
Message-Id: <20250310122505.2857610-14-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052516_054991_512D2BF8 
X-CRM114-Status: GOOD (  12.88  )
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

The nVHE hypervisor needs to have access to its own view of the FGT
masks, which unfortunately results in a bit of data duplication.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 7 +++++++
 arch/arm64/kvm/arm.c              | 8 ++++++++
 arch/arm64/kvm/hyp/nvhe/switch.c  | 7 +++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 657fb8243ea63..78ae52e4f48b0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -583,6 +583,13 @@ extern struct fgt_masks hdfgrtr_masks;
 extern struct fgt_masks hdfgwtr_masks;
 extern struct fgt_masks hafgrtr_masks;
 
+extern struct fgt_masks kvm_nvhe_sym(hfgrtr_masks);
+extern struct fgt_masks kvm_nvhe_sym(hfgwtr_masks);
+extern struct fgt_masks kvm_nvhe_sym(hfgitr_masks);
+extern struct fgt_masks kvm_nvhe_sym(hdfgrtr_masks);
+extern struct fgt_masks kvm_nvhe_sym(hdfgwtr_masks);
+extern struct fgt_masks kvm_nvhe_sym(hafgrtr_masks);
+
 struct kvm_cpu_context {
 	struct user_pt_regs regs;	/* sp = sp_el0 */
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b8e55a441282f..b5ee4669fe7cb 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2414,6 +2414,14 @@ static void kvm_hyp_init_symbols(void)
 	kvm_nvhe_sym(__icache_flags) = __icache_flags;
 	kvm_nvhe_sym(kvm_arm_vmid_bits) = kvm_arm_vmid_bits;
 
+	/* Propagate the FGT state to the the nVHE side */
+	kvm_nvhe_sym(hfgrtr_masks)  = hfgrtr_masks;
+	kvm_nvhe_sym(hfgwtr_masks)  = hfgwtr_masks;
+	kvm_nvhe_sym(hfgitr_masks)  = hfgitr_masks;
+	kvm_nvhe_sym(hdfgrtr_masks) = hdfgrtr_masks;
+	kvm_nvhe_sym(hdfgwtr_masks) = hdfgwtr_masks;
+	kvm_nvhe_sym(hafgrtr_masks) = hafgrtr_masks;
+
 	/*
 	 * Flush entire BSS since part of its data containing init symbols is read
 	 * while the MMU is off.
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7d2ba6ef02618..ae55d6d87e3d2 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -33,6 +33,13 @@ DEFINE_PER_CPU(struct kvm_host_data, kvm_host_data);
 DEFINE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
 DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
 
+struct fgt_masks hfgrtr_masks;
+struct fgt_masks hfgwtr_masks;
+struct fgt_masks hfgitr_masks;
+struct fgt_masks hdfgrtr_masks;
+struct fgt_masks hdfgwtr_masks;
+struct fgt_masks hafgrtr_masks;
+
 extern void kvm_nvhe_prepare_backtrace(unsigned long fp, unsigned long pc);
 
 static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
-- 
2.39.2


