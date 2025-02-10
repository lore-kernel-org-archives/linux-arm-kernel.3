Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60767C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY1zi9tbxd8TZ/VK1tv9Qtr6xOl234mlsdyVhppeJsE=; b=OMIf9nqTtf91dGwwWeNzWzk86I
	/BpzUgJSj+e/umZdp4HUq3YUV2MfCZpzS0FHkBG690tqjDHSCv4LetlWcLPgIzjPlWVy396GRw/8G
	OKcBuFlqtgcaD/97RPAXEg6qUwdouNl9Rn51l2EFyy2IWPS6OB70pq0YbpGK3lncaDdwtX1ux3xp0
	WwXy+nvk3KZoVq4rHtdcKzLJY4/yr1i0RLhbI3PhdQEGDo2JLRxP3fh3HtfV3PIJ/Z8tw9EwboSoZ
	o3BtMuIW4H0jjyYohIDNWsbNj2CbE13hKnORtTXQzXS7H/dupmwDDVpyU1evYtQtowTAY+ubwf1Aa
	/U9CobtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYb-000000016jN-3k6y;
	Mon, 10 Feb 2025 19:35:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYjK-00000000yu0-2iZK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FAE2A4200A;
	Mon, 10 Feb 2025 18:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0685C4CEE9;
	Mon, 10 Feb 2025 18:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212921;
	bh=IyvY/24emCJGPMedHKkmlSSiSl5QbFscoFIXQQzs/r8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+Zcta8T/6qX5+RD8RJPrv1BTAVXF2WYQciSYDFAo79speh6oPI9uFf70UKYcReWj
	 xfcGuVA7eodVwr9O/+Exvzoy13YGzIlBjHdZAuGAzK2TcXzjjfeasZ+jr8dJXvh3Jp
	 SphqcD6Zq/VJ4/cQJvVNIobLvjappuBxyGByvZQrHWAzFz5O3V8AvYzfVAqHWYTdyw
	 yO2Os/vof30brTZg1PThKp3XJeEHK1oKtEgDwFV3MqkQNC9ukRq0KABMylPCzHtlSa
	 /0+fHPpA6E9bbB7jMEwYLn9FWMEJxxE7ohNrggrhHN3P3di8Z7QH0ZqrZfAaEl6tnx
	 6uNERHF92XzZQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1thYjH-002g2I-PP;
	Mon, 10 Feb 2025 18:41:59 +0000
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
Subject: [PATCH 11/18] KVM: arm64: Propagate FGT masks to the nVHE hypervisor
Date: Mon, 10 Feb 2025 18:41:42 +0000
Message-Id: <20250210184150.2145093-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250210184150.2145093-1-maz@kernel.org>
References: <20250210184150.2145093-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_104202_869087_D16BD9B6 
X-CRM114-Status: GOOD (  12.64  )
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
index 4e67d4064f409..7220382aeb9dc 100644
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
index 071a7d75be689..0747ab90fc283 100644
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
index 6c846d033d24a..2add6e4c33f1e 100644
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


