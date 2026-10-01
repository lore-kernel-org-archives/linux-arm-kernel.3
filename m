Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14463CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1oMKk7tNiSt0MqVbgPZbuQyyqY1Mu98aFs2JsRalZc=; b=S3xmZmFs2ZU99vM0mRxeTUGisp
	NmY9jbDrVYy1TtTR+diRGfSGBIZXE5vg35KWjLMJhNDhNyYrj9D5Qij5kEBqgSW7rrMwxR5voaevX
	eRoAdfRZH9glLtnpCaW8z+3fsyrqXcqJW/oat954o686LWdKWM4iA930oDOxZQbi+0BHrpnbhDtae
	93i1KxgVjPOB62J0FOvWjgrKcMHCUvVjFWsTFAgFoyvhX/rBWmXZ0AlqR2hc/OdVMKj1lnLHN2QBf
	1DaGaoU9ti8iQKS5Cftgj8XQKUCW5WCBQtXQImMTXGP/9XK+SxMVVHHbnVI7kragZjWO9NPpzsyRy
	PJrtliNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEeK-00000008biS-2sNd;
	Thu, 01 Oct 2026 11:08:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEeI-00000008bfx-0zGW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:08:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D2A2497;
	Thu,  1 Oct 2026 04:08:21 -0700 (PDT)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 750E13F959;
	Thu,  1 Oct 2026 04:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790852905; bh=756vPQ/U2HqARpKFmioH59ZHD/jvMRybv2zdUwtJ7QE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MgJCuqrwOr1ieJjj6sTN2msgmjC7iS2oLeK438Q5jropr1Yl5jfrJSAMEPgnTiNkR
	 umFQXQ13adZTBLlsLVPKEJpmqvGA/q0vX8o4oIlZPyMbSKGmZXWph+RVvklWpuOxZk
	 F8cckDf8Ky4ID24zj41VzzzB1wX2wAiAesd7s9sc=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [RFC 12/12] arm64: tlbid: Add documentation
Date: Thu,  1 Oct 2026 12:06:55 +0100
Message-ID: <20261001110655.461473-13-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001110655.461473-1-kristina.martsenko@arm.com>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_040826_369193_CB076DAC 
X-CRM114-Status: GOOD (  12.92  )
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

Add documentation to describe how the kernel manages TLBI domains. The
bitmap approach is based on ideas from Miko Lenczewski.

Also document booting requirements for TLBI domains.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 Documentation/arch/arm64/booting.rst | 10 ++++++++++
 arch/arm64/mm/tlbid.c                | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..6a2c46cc4b22 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -568,6 +568,16 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
 
+  For CPUs with TLBI domains (FEAT_TLBID):
+
+  - If EL3 is present and the kernel is entered at EL2:
+
+    - SCR_EL3.VTLBIDEn (bit 56) must be initialised to 0b1.
+
+  - If EL2 is present and the kernel is entered at EL1:
+
+    - HFGRTR2_EL2.nTLBIDIDR_EL1 (bit 30) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
diff --git a/arch/arm64/mm/tlbid.c b/arch/arm64/mm/tlbid.c
index c748e710e2ee..2b3e41e6ac22 100644
--- a/arch/arm64/mm/tlbid.c
+++ b/arch/arm64/mm/tlbid.c
@@ -19,6 +19,24 @@
 
 #include <asm/mmu.h>
 
+/*
+ * FEAT_TLBID enables a TLB invalidation to target a subset of CPUs instead of
+ * the whole Inner Shareable domain. It can improve performance on systems with
+ * many CPUs.
+ *
+ * A system with FEAT_TLBID contains a number of TLBI domains. Each domain
+ * contains a number of CPUs. Domain 0 is always present and contains all CPUs.
+ *
+ * For each CPU we maintain a bitmap of domains that the CPU belongs to. For
+ * each mm we maintain a bitmap of domains that contain all the CPUs that the
+ * mm has been installed on. When an mm is installed on a new CPU we reduce its
+ * bitmap to only include domains that include the new CPU.
+ *
+ * When issuing a TLBI we use the smallest domain for the mm instead of
+ * broadcasting to all CPUs. The domain bitmap is ordered by size, with the
+ * highest bit corresponding to the smallest domain.
+ */
+
 DEFINE_STATIC_KEY_FALSE(tlbid_enabled);
 
 static u16 *domain_ids;
-- 
2.43.0


