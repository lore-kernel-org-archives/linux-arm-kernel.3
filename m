Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DEAC531D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkLSkg/nJCEXNUD75YrahQX5IWtpiTeIIjywsZ8CNls=; b=z11cj2EYeK3b0bZp7O8bmxq9QZ
	fJ9p9MIBr64JquqPrEvqnGvFyH5E7MdesrQB3qFBQyOrrMrJuzB/8YNxTcFtQGN7vFnVLmH5tEuUV
	I+IaSsb/LkgBz04HDFTCpP0wdP7aYiYkxnBU9Qw36soy3hHWnERclXskcomF86qSHkhzIcpFWeWXU
	g0TzxaiiCZnKaeYDJjqCKNnj4eSKwnv/0DSWHbYrcKYw0dnSuq+0VIQ3YvbBei61nAqq5/EdGEpOZ
	KMOjKwQhkPug58k2Ac0aP6rxdTw9uNM5Z/C6+Ekymr5Eg+wRv7XFUqcm33eqHKKbc3JQxatAIFMvS
	8N8Rm3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuHI-0000000EU02-0ljf;
	Thu, 23 Jul 2026 14:20:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuHA-0000000ETwg-39i2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:19:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 764C31595;
	Thu, 23 Jul 2026 07:19:47 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DBDB3F59E;
	Thu, 23 Jul 2026 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784816391; bh=EwrQVot4cmcTM5KcsFRbSmgUmpJMtRHsIr/Kjf+gCrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IA8sgFujhWScnzYq4HUs032KSzT3/hjhpGOUSLQAmTkKZyNLCkpOuc8iiyjvu9izo
	 sHLs2VYxZNjrVscKNyJyMQM97bqaruSkaS4YYkMJrx3R/7nfmOP56y0TUnU7d0CCVo
	 Bfj/CEU0FOGuNrOv9slsxT9rToE7VSQz166kD94s=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com,
	joro@8bytes.org
Cc: jpb@kernel.org,
	jgg@nvidia.com,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] arm64: Add override for MMFR1.HAFDBS
Date: Thu, 23 Jul 2026 15:19:43 +0100
Message-ID: <d7b31cbcd984c1efa61d2fc97111150cc18e21b0.1784814923.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1784814923.git.robin.murphy@arm.com>
References: <cover.1784814923.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_071952_844562_1B478B5B 
X-CRM114-Status: GOOD (  14.53  )
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

In general it might be nice to have the ability to disable hardware
access/dirty bit management for debugging or performance comparison
purposes without having to rebuild the kernel. However once FEAT_HAFT
comes into the picture we also start to have a real functional concern
where the decision to use HAFT based on the boot CPUs can prevent SVA
or late-onlining if SMMUs/CPUs are later found to lack HAFT support.

To that end, add the appropriate MMFR1 override, with an easy "nohaft"
alias for the significant case, partly since the feature/field naming
isn't the most obvious, but also so it could potentially be redirected
if someone wanted to attempt a higher-level means of turning off just
HAFT usage independently from FEAT_HDBSS in future.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: New

OK, turns out this was actually incredibly easy, thanks Marc for
making the framework so idiot-proof!

 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..7f23e5b8dc44 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -565,6 +565,9 @@ Kernel parameters
 	arm64.nogcs	[ARM64] Unconditionally disable Guarded Control Stack
 			support
 
+	arm64.nohaft	[ARM64] Unconditionally disable Hardware managed Access
+			Flag for Table descriptors support
+
 	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
 			Set instructions support
 
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index bc57b290e5e7..0e051fec5afe 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -64,6 +64,7 @@ static const struct ftr_set_desc mmfr1 __prel64_initconst = {
 	.override	= &id_aa64mmfr1_override,
 	.fields		= {
 		FIELD("vh", ID_AA64MMFR1_EL1_VH_SHIFT, mmfr1_vh_filter),
+		FIELD("hafdbs", ID_AA64MMFR1_EL1_HAFDBS_SHIFT, NULL),
 		{}
 	},
 };
@@ -246,6 +247,7 @@ static const struct {
 	{ "arm64.nomte",		"id_aa64pfr1.mte=0" },
 	{ "nokaslr",			"arm64_sw.nokaslr=1" },
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },
+	{ "arm64.nohaft",		"id_aa64mmfr1.hafdbs=2" },
 	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
 	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
 	{ "arm64.nompam",		"id_aa64pfr0.mpam=0 id_aa64pfr1.mpam_frac=0" },
-- 
2.54.0.dirty


