Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vHBtrx/v;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kP9efIyT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XEGRVEHzcjuh7Ti0KDoH632ww8gEAaSH2npDq52VRq4=; b=vHBtrx/vsK63l4NzbgdIBNUpYL
	Kg71yq2nL0jTBUfQJTIiXLa9kECv8kqO+t5KnLyd11XmOK0M2pCCfyRuZvJiGAWpsMq6FsBr9tPx0
	JjxIq6gwbarHa7af6HZYdF+ekdoxM1CYFkewANeBp1DvK2bP1tcBi3R2OWygkuy34Qrmzew7t/608
	///gmFv9WHQzI7ovhjleMiL9lGJ82JFOx9apFFgZJADVGsxboBzTNbDXNZ6NUz2vt36vfWYWZr3i1
	OndsnQyYwoVdmOVAc5+DOvFsh5QV+IolSRWwsVNdCFkCmkZLYTTqTXLq9MsPf+fwZsbCDGGjpx/a0
	Y/mHpl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcO6-00000005hbG-1l8k;
	Wed, 04 Nov 2026 14:54:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcO4-00000005haW-1Vsd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:54:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E73D843CC2
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 14:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20611F000C1;
	Wed,  4 Nov 2026 14:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793804091;
	bh=XEGRVEHzcjuh7Ti0KDoH632ww8gEAaSH2npDq52VRq4=;
	h=From:To:Cc:Subject:Date;
	b=kP9efIyTh8nYQ6VrAPzuQ3BwS9VeiMK2VfMciwSdgHAduztAsR8ST6APEVzvj6Jun
	 +S/Wb5f8YhiXPnrwF4ib6bWX82PZIGZgunPCxFVvxst/DmoNTXmp4UvJAYnk8mCZ5d
	 j3Uz0O0j7HNZfEfdTDPjuwXSmQJ9bmn64VkXPJU+mcsVqjfMS98UBnaEq8O1kaDSKF
	 RQAEj2tXMQpxFq1MSA9MgUplTBJ4zebpo9Cb4RTm2rbAMSODvOnK4tZOe9SSgCZfvh
	 kbo00+fgyGEVAc7mbTpaJKxkltaT/dyFPLiSYjJBZ08TCvUnWqxSGpN4BWMqckHLlP
	 MwVTuZug07PJg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] ARM: vexpress: fix iounmap missing after of_iomap in SMP prepare
Date: Wed,  4 Nov 2026 14:54:45 +0000
Message-ID: <20261104145446.2767924-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

of_iomap() maps a region of device memory and returns a pointer that
must later be released with iounmap(). Currently return value from
of_iomap() is passed directly to scu_enable() without saving it, making
it impossible to unmap afterwards, causing an I/O memory leak.

Store the mapped base address in a local variable, check it for NULL,
call scu_enable(), then release the mapping with iounmap().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-5bb0baa3-6a9a-49a0-94f1-80f8cd8f6915
Closes: https://sashiko.dev/#/bug/linux-6803acf3-f91e-450a-a738-8803e6ac1f1a
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 arch/arm/mach-versatile/platsmp-vexpress.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-versatile/platsmp-vexpress.c b/arch/arm/mach-versatile/platsmp-vexpress.c
index b810ad50b98c..e3c8ee4c52fb 100644
--- a/arch/arm/mach-versatile/platsmp-vexpress.c
+++ b/arch/arm/mach-versatile/platsmp-vexpress.c
@@ -63,9 +63,15 @@ static void __init vexpress_smp_dt_prepare_cpus(unsigned int max_cpus)
 {
 	struct device_node *scu __free(device_node) =
 		of_find_matching_node(NULL, vexpress_smp_dt_scu_match);
+	void __iomem *scu_base;
 
-	if (scu)
-		scu_enable(of_iomap(scu, 0));
+	if (scu) {
+		scu_base = of_iomap(scu, 0);
+		if (scu_base) {
+			scu_enable(scu_base);
+			iounmap(scu_base);
+		}
+	}
 
 	/*
 	 * Write the address of secondary startup into the
-- 
2.43.0


