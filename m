Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA9DC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 18:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dRlfhm2GJvO0NKET2nomIv2slIBL0lQ9SwCkEKvtM0=; b=erX/sOHzBADMLvEqmKJacx943H
	Ef85V46cpU7A+uoMUn0rvYLDqCLgqc7/ZeFsZjs6tAqrPTfBFKpiocNGHqbQhkc/RI81yyMS/D1hk
	z1cWArJvIVfSBrbGnzQQEW5U6WtvBnkxW8w6onmBm38ssyZg+rJ1yryWs6iJ8AQW7KSS7dvknE9dM
	fjI6AnIq9bq22f0GMWuunpY0rQVKL7+UTao8Y85MQ7zE62fIQNTnKHIw14tWZ9elCnZroyFfOtTW9
	EHnVY24nm8TOxoiV5nrWzxAzf3KTGWIDEEwAEk6/Bp1Ai4+AWq9UI0DUFJB7q1EK9NIYznt3Ib/7H
	0/uXTRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmxI-00000002xCd-07bM;
	Fri, 17 Jul 2026 18:06:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmxG-00000002xCA-1UKo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 18:06:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EE4F43CFD;
	Fri, 17 Jul 2026 18:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00181F000E9;
	Fri, 17 Jul 2026 18:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784311594;
	bh=9dRlfhm2GJvO0NKET2nomIv2slIBL0lQ9SwCkEKvtM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W4D94t/wneRBeRYLAxxxPKoeAyp9CDNhgy+7bpaY5yTYbVT8ophnINPXzQyM9OHYN
	 uagA6UPpU0Lgd0flDoEB5rlssvKZ3tyRPfFbpPV2sf4zB7a3+52/Uwmoy4G5i14rxU
	 R6qttKEJdgr3zR0OdDRKEWhPzw3UvFgaBhsrJTAssxanyZ8F5+nRj1wmIDiSTDvFfT
	 C9XrJ8Uks6+0EVkTEMzI/n52dg18W/W/0DljfnwfNv/RbZ5MkYOz1a6E2e7S53d5Rv
	 /7mUns0bXxC78eCQaFFkVK6EawRz39RdB16ufoyCKINyYamNITiKhCj3jV2gzhZkpL
	 a4YscX7FQeceg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org
Subject: [PATCH v8 08/23] coco: arm64: s390: powerpc: Mark secure guests with CC_ATTR_GUEST_MEM_ENCRYPT
Date: Fri, 17 Jul 2026 23:34:26 +0530
Message-ID: <20260717180442.110954-9-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717180442.110954-1-aneesh.kumar@kernel.org>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

arm64 Realms, powerpc secure guests and s390 protected virtualization
guests currently report CC_ATTR_MEM_ENCRYPT, but not
CC_ATTR_GUEST_MEM_ENCRYPT.

These environments are all secure guest configurations. Their
force_dma_unencrypted() implementations also treat the same secure guest
state as requiring unencrypted DMA. Report CC_ATTR_GUEST_MEM_ENCRYPT for
the same condition so generic confidential-computing code can distinguish
guest memory encryption from host memory encryption instead of relying only
on CC_ATTR_MEM_ENCRYPT.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/mm/init.c                         | 1 +
 arch/powerpc/platforms/pseries/cc_platform.c | 1 +
 arch/s390/mm/init.c                          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index edcc305ec883..48d69e390158 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -419,6 +419,7 @@ bool cc_platform_has(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_MEM_ENCRYPT:
+	case CC_ATTR_GUEST_MEM_ENCRYPT:
 		return is_realm_world() || is_protected_kvm_guest();
 	default:
 		return false;
diff --git a/arch/powerpc/platforms/pseries/cc_platform.c b/arch/powerpc/platforms/pseries/cc_platform.c
index e8021af83a19..46e110a5a717 100644
--- a/arch/powerpc/platforms/pseries/cc_platform.c
+++ b/arch/powerpc/platforms/pseries/cc_platform.c
@@ -17,6 +17,7 @@ bool cc_platform_has(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_MEM_ENCRYPT:
+	case CC_ATTR_GUEST_MEM_ENCRYPT:
 		return is_secure_guest();
 
 	default:
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index c29326c44af0..6b1c5a4fa9ce 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -148,6 +148,7 @@ bool cc_platform_has(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_MEM_ENCRYPT:
+	case CC_ATTR_GUEST_MEM_ENCRYPT:
 		return is_prot_virt_guest();
 
 	default:
-- 
2.43.0


