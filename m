Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E4AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 06:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9v33RvXaoWJ82jh7D/4EZnE0YPfbAuonR28qMJEFhKI=; b=FdWZcIYZF1uLW6x8ONd0sEVvb7
	O8TShvxAJXftg5uVxEvuCxCfAvu49zWWjM3EYdVbYnglFcxAETPg3oByNZwjZTVpmjawodOE+q4qR
	LuTn1EX2JmyPpoVj6ese0ZzA2LBRLGkCyvJpY0SJIh8ytgZFa5Z4RlrUvb0qYmlUfmj4yYIucaOis
	vgI6BD6U6zFUj85W3Xlo3BMcJT9XhWRVX/zeekpbBlUC/sl82FemXOZuw3qEJvuf5NM92uzmHuZUm
	PELlReVfXVd0ynJ4OYVakR0oSXYB0NiZ5MS/jyLPXX0DR6KC4bVgS7gL0O4Pks7wyxrcbHwyEDA4b
	Fj3etYdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLGfM-0000000DzdF-2swE;
	Wed, 11 Dec 2024 06:57:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLGcL-0000000Dz7B-1HUL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 06:54:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D04AA1063;
	Tue, 10 Dec 2024 22:55:07 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 33DF53F720;
	Tue, 10 Dec 2024 22:54:36 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] docs: arm64: Document EL3 requirements for FEAT_PMUv3
Date: Wed, 11 Dec 2024 12:24:25 +0530
Message-Id: <20241211065425.1106683-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211065425.1106683-1-anshuman.khandual@arm.com>
References: <20241211065425.1106683-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_225441_383660_C6BA5927 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

This documents EL3 requirements for FEAT_PMUv3. The register field MDCR_EL3
.TPM needs to be cleared for accesses into PMU registers without any trap
being generated into EL3. PMUv3 registers like PMCCFILTR_EL0, PMCCNTR_EL0
PMCNTENCLR_EL0, PMCNTENSET_EL0, PMCR_EL0, PMEVCNTR<n>_EL0, PMEVTYPER<n>_EL0
etc are already being accessed for perf HW PMU implementation.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 Documentation/arch/arm64/booting.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 1b3ac1394e5f..60b16f00d0a8 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -455,6 +455,12 @@ Before jumping into the kernel, the following conditions must be met:
 
    - MDCR_EL3.TDA (bit 9) must be initialized to 0b0
 
+ - For CPUs with FEAT_PMUv3:
+
+ - If EL3 is present:
+
+   - MDCR_EL3.TPM (bit 6) must be initialized to 0b0
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
-- 
2.30.2


