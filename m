Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438DA606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TSD+0s6Q;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dFXxqx53
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SXcqz2QhrzHyYp3rOCObeKFg7pCh9kEKrbnpLafTEq0=; b=TSD+0s6QEt017W
	ooGpoFMdZV8yvfThTigqThMAQDknqEIrx4zA+OU3E+eBccDSvxjzbM4/r2qaoyo7xeg2IeH5kcnCm
	fFU1h+B8jrpCbirA1JneIIjq94HoIqKyCfoMn4JnwW1gM7gk56CGevFs3lP7yV/wy16/Yxlnn6BCP
	Wb/Jbc7VbrMrMkstrjIYagvxHc3l9NLRbmfus41IPpYQ69mEu5ZaVsvpvN30nzapu4EH7q8EQB7oh
	SWMLANzogJBHKQYAPApDXgr/1fyHynTA5v2IcKjSsOUiu4B6aoXQCMl2IRTokCnWVjrzPzBOyS1el
	R0BsPdMRfoTHmoUnT5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODP2-00000002LHm-0Grv;
	Tue, 03 Nov 2026 12:14:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODOz-00000002LFq-0EDt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:14:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 359C21691;
	Tue,  3 Nov 2026 04:14:04 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64CE63F628;
	Tue,  3 Nov 2026 04:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793708047; bh=8dCmwnfbD2NAVDmi1s4nHs0WFezH469QM7uJnq12/Tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dFXxqx53tGsrybbzKwca8oy4QSb7WmF/lYYIqY7kmv4/k+Aq9464vJEbQCI3YlOVp
	 +s/3lHWaIp6bU7b/sfcTeMqtiUZwLH9VlqLuYKjNeSrY04gWuoEKEeC9BnlWC3JG97
	 qXjFSXg7ms4j2+790bhHm2TJj7RniBrTklR+LDRc=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 3/3] arm64: fpsimd: Simplify sve_setup() format strings
Date: Tue,  3 Nov 2026 12:13:46 +0000
Message-Id: <20261103121346.1858305-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261103121346.1858305-1-mark.rutland@arm.com>
References: <20261103121346.1858305-1-mark.rutland@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_041409_130455_914F6FCD 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

The format strings in sve_setup() acquire the vector name from struct
vl_info, despite the fact that sve_setup() handles SVE exclusively. The
equivalent format strings in sme_setup() hard-code "SME" as part of the
format string.

Simply sve_setup() to use "SVE" directly in its format strings. This
makes the strings easier to search for, and aligns the style of
sve_setup() and sme_setup().

Given the architectural constraints for streaming vector lengths differ
from those for non-streaming vector lengths, it doesn't make sense to
unify sve_setup() and sme_setup() into a single function, but we can at
least make them look as similar as possible.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index ecfa21615f168..acb82df740d4d 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1128,15 +1128,14 @@ void __init sve_setup(void)
 	if (info->max_virtualisable_vl > info->max_vl)
 		info->max_virtualisable_vl = info->max_vl;
 
-	pr_info("%s: maximum available vector length %u bytes per vector\n",
-		info->name, info->max_vl);
-	pr_info("%s: default vector length %u bytes per vector\n",
-		info->name, get_sve_default_vl());
+	pr_info("SVE: maximum available vector length %u bytes per vector\n",
+		info->max_vl);
+	pr_info("SVE: default vector length %u bytes per vector\n",
+		get_sve_default_vl());
 
 	/* KVM decides whether to support mismatched systems. Just warn here: */
 	if (sve_max_virtualisable_vl() < sve_max_vl())
-		pr_warn("%s: unvirtualisable vector lengths present\n",
-			info->name);
+		pr_warn("SVE: unvirtualisable vector lengths present\n");
 }
 
 /*
-- 
2.30.2


