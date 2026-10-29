Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6300606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WhXnQNZ2;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dwus6jWM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cRx0GOxhxfhLERhNm3p7CKI4SQfBnK7vX+eZW7yZMiM=; b=WhXnQNZ2Jn9fQe
	4YEq9ZLN+E7prKL7vwUocaNVyNqzRpq0jsJANJltj7B7W4zltWG7EwDcYEQRTouz0GyepPwUJ2vEF
	4Xc6JB60G+HQla6UDPE2oFfa0sTG8ii7R9ThtaRLJ/vHqaOd+Q64JHcJZ49dkr2pmNnoLh9640out
	GXjkVwI6sr6mugpo+n1arVJEernTNgPm3Y85rnv6uci61XO1g68DMkzmg9XCBruQFpgPyzMbgcXZC
	xqPJI5oOcG9sSJ6BmiKPWY1KJiN0PZL4iEeuvz3yc58YnjxsDbGpl6sO1OSeFIOzmSt4X/aQdT+6q
	q4gMUGzn1eiMq0ndAQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUJF-0000000A1Ti-3xnW;
	Thu, 29 Oct 2026 17:53:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUJB-0000000A1S2-1uVC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:53:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F1DA16F2;
	Thu, 29 Oct 2026 10:52:57 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3979A3F59E;
	Thu, 29 Oct 2026 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793296380; bh=OxLxREo/Qf1RsgcWUzTubgxXR6sWtp0XKHSiO9WyI3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dwus6jWMApX65EEGcsQDaTpT6lCDKOIdlPSU7awmK6HFPULc/W5R+4NaN/lbIEVD3
	 1PXRO7g9pYZsnvt3LsgCpbe2IXs/okNPPTVioTaSVsFH3Ii09CMGASmKyuhcNG5sIX
	 f+9116doj55W9phdzlyQ8ZJlKR5D5cNN5UKcx46U=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 2/2] KVM: arm64: Remove stale remark on canonical IPA alignment
Date: Thu, 29 Oct 2026 17:52:38 +0000
Message-ID: <20261029175238.3214788-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029175238.3214788-1-weilin.chang@arm.com>
References: <20261029175238.3214788-1-weilin.chang@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_105301_537119_98A800A4 
X-CRM114-Status: GOOD (  13.39  )
X-Spam-Score: -4.4 (----)
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

Commit 3b8ce2b5132ae ("KVM: arm64: Use a variable for the canonical IPA
in kvm_s2_fault_map()") created a variable to store the canonical IPA,
instead of calculating it when needed. It moved the aligning just before
mark_page_dirty_in_slot() to an earlier place but did not update the
comment.

Remove the stale part of the comment.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/mmu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c7df646af79f..695c6229a216 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2232,11 +2232,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	kvm_fault_unlock(kvm);
 	kfree(mapping);
 
-	/*
-	 * Mark the page dirty only if the fault is handled successfully,
-	 * making sure we adjust the canonical IPA if the mapping size has
-	 * been updated (via a THP upgrade, for example).
-	 */
+	/* Mark the page dirty only if the fault is handled successfully. */
 	if (writable && !ret)
 		mark_page_dirty_in_slot(kvm, s2fd->memslot,
 					gpa_to_gfn(canonical_ipa));
-- 
2.43.0


