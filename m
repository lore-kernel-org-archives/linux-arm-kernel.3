Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32E0CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXYEqMMLjsCWBuK5DCIIDVnRgYfTa0edaZVvdWYeKjo=; b=cwauB3CI5YHLXTIUDnXTMt71Wx
	56f/Kw6TOqR/V8b18fOX+9RHPT4TpS7++l9MO0YjuKXFe9gJBaUKR0jz17fyMUTmyJAXUzauvL75O
	stmQN7H+okf5Dm5jJ+SPeYcVeIYJhJSZX3vSpgkPG9Fazuw+BivOMjfEONPnPGoVwM/MVVD8zCUh7
	+7no2SecqzD2txh1lDzgym5on2vw5Y1HCdPWoiSq1p2pGvWrTs0eirsi/ECcAdLJJnyvctcAVyHPX
	5++KJbQKS3rMcJmZZ4pFoatIzTZKvyhe1RnhVcGhvbrD2v6QpraHh6XQzDGLS6kp+hPX9N0MV0Oqo
	wLi0YRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNd-00000002uJM-1rlp;
	Mon, 29 Sep 2025 16:05:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNA-00000002twz-44Tm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C6AA48BCA;
	Mon, 29 Sep 2025 16:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3266BC4CEF7;
	Mon, 29 Sep 2025 16:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161908;
	bh=kcyjoSnEwVRb40n5xPJ2q3xE6tZqe4Q5DJgl5/ozZd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SMPN5496p3YhiMHtijNPxGOLjOq/BeECzsOMX83uOZSFONif4iAu7xSOjIreNpFsb
	 Ib+BVm/F/K0IOzOFP/nmylecJGK+VOurBan3s6M5NXbOeej6wOuGHkADLCAnko9FFV
	 +Gm/DM7hatdJFNhkkufk4gMxIWl7T/urCKTUbVOuu7yjWRlBXCz0amsseeOzTzgszQ
	 rLa6KcLVMqHVDh3YvJltTy8mKIUEfZ75kOq1IR61tSWe1C/NmfKWvVbYAZ3STVwP8P
	 1MSHsqYTT9lRwH+f95H5Hc6Ck2SLoPcU04JyZ+XOvEtnRqvvb2Oy9Rb0OyNHAvQCHp
	 9ZGkKaWeeBw5g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN8-0000000AHqo-0ziP;
	Mon, 29 Sep 2025 16:05:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 12/13] KVM: arm64: selftests: Add an E2H=0-specific configuration to get_reg_list
Date: Mon, 29 Sep 2025 17:04:56 +0100
Message-ID: <20250929160458.3351788-13-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250929_090509_166330_C8ABE7B2 
X-CRM114-Status: GOOD (  12.03  )
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

Add yet another configuration, this time dealing E2H=0.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 .../selftests/kvm/arm64/get-reg-list.c        | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 0a4cfb368512a..7a238755f0728 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -758,6 +758,10 @@ static __u64 el2_regs[] = {
 	SYS_REG(VSESR_EL2),
 };
 
+static __u64 el2_e2h0_regs[] = {
+	/* Empty */
+};
+
 #define BASE_SUBLIST \
 	{ "base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), }
 #define VREGS_SUBLIST \
@@ -792,6 +796,15 @@ static __u64 el2_regs[] = {
 		.regs		= el2_regs,			\
 		.regs_n		= ARRAY_SIZE(el2_regs),		\
 	}
+#define EL2_E2H0_SUBLIST					\
+	EL2_SUBLIST,						\
+	{							\
+		.name 		= "EL2 E2H0",			\
+		.capability	= KVM_CAP_ARM_EL2_E2H0,		\
+		.feature	= KVM_ARM_VCPU_HAS_EL2_E2H0,	\
+		.regs		= el2_e2h0_regs,		\
+		.regs_n		= ARRAY_SIZE(el2_e2h0_regs),	\
+	}
 
 static struct vcpu_reg_list vregs_config = {
 	.sublists = {
@@ -900,6 +913,65 @@ static struct vcpu_reg_list el2_pauth_pmu_config = {
 	},
 };
 
+static struct vcpu_reg_list el2_e2h0_vregs_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_E2H0_SUBLIST,
+	VREGS_SUBLIST,
+	{0},
+	},
+};
+
+static struct vcpu_reg_list el2_e2h0_vregs_pmu_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_E2H0_SUBLIST,
+	VREGS_SUBLIST,
+	PMU_SUBLIST,
+	{0},
+	},
+};
+
+static struct vcpu_reg_list el2_e2h0_sve_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_E2H0_SUBLIST,
+	SVE_SUBLIST,
+	{0},
+	},
+};
+
+static struct vcpu_reg_list el2_e2h0_sve_pmu_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_E2H0_SUBLIST,
+	SVE_SUBLIST,
+	PMU_SUBLIST,
+	{0},
+	},
+};
+
+static struct vcpu_reg_list el2_e2h0_pauth_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_E2H0_SUBLIST,
+	VREGS_SUBLIST,
+	PAUTH_SUBLIST,
+	{0},
+	},
+};
+
+static struct vcpu_reg_list el2_e2h0_pauth_pmu_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_E2H0_SUBLIST,
+	VREGS_SUBLIST,
+	PAUTH_SUBLIST,
+	PMU_SUBLIST,
+	{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&vregs_config,
 	&vregs_pmu_config,
@@ -914,5 +986,12 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&el2_sve_pmu_config,
 	&el2_pauth_config,
 	&el2_pauth_pmu_config,
+
+	&el2_e2h0_vregs_config,
+	&el2_e2h0_vregs_pmu_config,
+	&el2_e2h0_sve_config,
+	&el2_e2h0_sve_pmu_config,
+	&el2_e2h0_pauth_config,
+	&el2_e2h0_pauth_pmu_config,
 };
 int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
-- 
2.47.3


