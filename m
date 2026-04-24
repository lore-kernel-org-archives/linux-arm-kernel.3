Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C61FED3CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 13:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdNIwlr6EYICEoRxPpG8gr4dUMgZUbywrW3X2KQCWS4=; b=JV6F3l0wjLCe6C1uXas6KByecn
	YzAnK0Mox7vzg1mHfYquN6pfliN+ceyulu7aC+1Kg0YFwQcrBIwd55eTCEre4lj1liUvstYGJ3aJM
	J2ymVjbGlnzsXIV0HP5bvWmORXexGK6vOWNxujGzCgYxittjQC3eJNAcH8InNzE3bEjKrecUGYmCo
	luiGzRwlC481SSqd9YZpqtvQCHYulRNB30fm4n8Uu2TTJPISb/6Qbzjn8VX8BxhQ9YFMzytS2UTMF
	jQf0KM+PIAVxRPunWuxkZuRLl158O6wDm/fMlNsvfqDRa3hNZOXSqnpQ7rPZ3imTzF7iKOkL0Uy8D
	nFLtxJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGWU-0000000DEXz-38rm;
	Fri, 24 Apr 2026 13:24:46 +0000
Received: from the.earth.li ([2a00:1098:86:4d:c0ff:ee:15:900d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGWR-0000000DEW4-4Bfg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 13:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NdNIwlr6EYICEoRxPpG8gr4dUMgZUbywrW3X2KQCWS4=; b=fVdQo7DLwhvnr8LSwWr0AJgZ9n
	NnI+PRLs1iSPv/FGWFsYSEao3/izs4kRQtMLdis1TKFt50zUAyE5xICfYJCmwGHpsFveq00Dt2TX3
	m+4ESjKmlE39lccShEg1XoCAMafp69xOHODZMqgaIHad4Ch38lGOPwqQ8EMM9bmswkbiH8M+H1Riw
	Cv3u+USuE2tB5zISVKWmGR6r7S/Kh2M3FU7P/XGy5e4d23IYEN9oN9cb6WB1VFYt18/kyLF5d44aw
	EgKFVBNGuc17CJh1a0xMJFcEsngOtw3oscgmmNwsaj5B1462QWjcg810U42GBfLEZ2NFdFnrRlQe6
	wN5EgjpA==;
Received: from noodles by the.earth.li with local (Exim 4.98.2)
	(envelope-from <noodles@earth.li>)
	id 1wGGWQ-0000000556r-0aRd;
	Fri, 24 Apr 2026 14:24:42 +0100
Date: Fri, 24 Apr 2026 14:24:42 +0100
From: Jonathan McDowell <noodles@earth.li>
To: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	jarkko@kernel.org, jgg@ziepe.ca, sudeep.holla@kernel.org,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH v3 4/4] Revert "firmware: arm_ffa: Change initcall level
 of ffa_init() to rootfs_initcall"
Message-ID: <2e7b4dc552b45ddf14cc43bc449cbebb4ade0027.1777036497.git.noodles@meta.com>
References: <cover.1777036497.git.noodles@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777036497.git.noodles@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_062444_044534_C6E9891A 
X-CRM114-Status: GOOD (  12.13  )
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

From: Yeoreum Yun <yeoreum.yun@arm.com>

This reverts commit 0e0546eabcd6c19765a8dbf5b5db3723e7b0ea75, which was
added to address ordering issues with the IMA LSM initialisation where
the TPM would not be fully ready by the time IMA wanted it. This has
been resolved within IMA by retrying setup during late_initcall_sync if
the TPM is not available at first.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Jonathan McDowell <noodles@meta.com>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index f2f94d4d533e..01547c5c0e38 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2106,7 +2106,7 @@ static int __init ffa_init(void)
 	kfree(drv_info);
 	return ret;
 }
-rootfs_initcall(ffa_init);
+module_init(ffa_init);
 
 static void __exit ffa_exit(void)
 {
-- 
2.53.0


