Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0573C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FMd0RVniJ+m8jAOYOTHBlOircNGMlTXTtQ89djKtdo=; b=NFt1t4qVvZ6KskLDfuzkU37FBM
	wJgBug+exqM+xQLw6rWGXrg5MXb0LPr+NK3Lnbvpykzb+z+xyKVr4j8gD/SQg5GSWKmbF61KDB7mi
	J/y4u2PXsdW0DxvSBwAcRShRqZrJ9t9Jt1ekqDXK6Ney1vnwr57G6s5mjoCt91neZiM+b9QDKgEFF
	M+xegjkIJ/waQCQXSfGmkRL+T4NqDg8E6gY3sm3TO0Qhi5IgiJnTKfFNZIKk4PiBD2D35hmakTOf+
	7i3duV6HxNtHPDwBZvFOGO/QWKV8vLgheMdlUzIjZdCZiER+6FaTmYzDX7J/INrVIK5noBD5mvmXN
	Rg7LIG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woK3Z-00000002cdl-0IBC;
	Mon, 27 Jul 2026 12:03:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woK3X-00000002cd3-08MA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:03:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 483641476;
	Mon, 27 Jul 2026 05:03:33 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 736C93F86F;
	Mon, 27 Jul 2026 05:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785153817; bh=EwJdYx0DkFLGAQ/IekPy/OuBYhXLLgmLidlbPoNrYxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jioxe4ZQQ2Z46lc7rSt5XFqxuDmRTAsNx2R1s6JvTpcRq56XiwnJwQzDNd4KhcEWw
	 IQSMYSwtlk4axVxA0H2V5tNgCKHwiuoLNBdU+wUl0v8EHTiSZIo8OOqUH6KRnMNQDu
	 ysEmWcA8jDa3SHHmD1iXZrmuwnp/gUxwGvGJJyWw=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com,
	joro@8bytes.org
Cc: jpb@kernel.org,
	jgg@nvidia.com,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] arm64: Add override for MMFR1.HAFDBS
Date: Mon, 27 Jul 2026 13:03:28 +0100
Message-ID: <d7b31cbcd984c1efa61d2fc97111150cc18e21b0.1785153415.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1785153415.git.robin.murphy@arm.com>
References: <cover.1785153415.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_050339_189354_1421D522 
X-CRM114-Status: GOOD (  13.89  )
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
in future if someone wanted to attempt a higher-level means of turning
off just HAFT usage independently from FEAT_HDBSS.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v3: No change.

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


