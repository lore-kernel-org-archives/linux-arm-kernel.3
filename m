Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7F7606C599
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QbkmdtZx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrsaiuvC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E0lBKiF20YPh98FAyYpLVlXjt2+77nte76bA2pf9+x8=; b=QbkmdtZx5iV/ve
	j0EN/6hIAqdJVztQo42o7FdIEO0juBkCgqadYSMs6ZBtkPCgrILjPngEon+7YD9wRapr11Fi5/71t
	/r76J6L04hxqHdqAsS0Z1oaIqwz5NR3784izVkPKGP9D6oVy9Nai3eQGqSqRPqpEr4MeFAVEOGRjV
	U7m6j/w/140eFRleoyWfsxQcErS2kK6OM0otx/e5f1h/csQ9fEIKcjPd284nrxqHJBn/Rrphm0p40
	w9b/RzuErv1if0LyqGd4AGOKgHbYGIABmIKa4Jl8aEwNzAuDNUk4jx/b/R5u1za3BLd6O0dZQhLyx
	f1OhRVfWDoa7TkbNOTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOib7-000000072nc-0rSB;
	Wed, 04 Nov 2026 21:32:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOib2-000000072eD-13YK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0959B43BD9;
	Wed,  4 Nov 2026 21:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489EF1F0093A;
	Wed,  4 Nov 2026 21:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827959;
	bh=E0lBKiF20YPh98FAyYpLVlXjt2+77nte76bA2pf9+x8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lrsaiuvCp7U24MyNTfZ/U5wT4csQyivfWysAtjuCsBR3gke3yN0vHlN21WDJV0RVk
	 eOxfl7dQxyJZdjS2hk+kPdOUO4IGktj4HDmZ5MES/7QZxRY3EG8xDTmN8tTOzAONa1
	 QtFinP+aCGrgv+lHpZJlEEQU/gtte4sO6sxq4QPRe618VCuWEgY/x2o5HpeY61eBpG
	 SsOIt8X/55IIdRA2/bZVISG44e1hcALmy0nyj3u0Vl360hD/EzmcG2+P4ub8LGI7Wg
	 XYUz5tz3UzymsIjGGo5DFq6K/O1MXnY+WTKyjkFLLT+/EvdD6NBnjiUhGCFzkC6gA6
	 T3ZFIJBy1cEGw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:31 +0100
Subject: [PATCH 15/16] ARM: configs: u8500: Use the TEO cpuidle governor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-15-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Use the timer events oriented (TEO) cpuidle governor for U8500.
Remove the explicit MENU selection so its higher rating does not keep
it as the default governor when TEO is enabled.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 94b608104b17..d4d9969c261e 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -39,7 +39,7 @@ CONFIG_CMDLINE="console=ttyAMA2,115200n8"
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_CPU_IDLE=y
-CONFIG_CPU_IDLE_GOV_MENU=y
+CONFIG_CPU_IDLE_GOV_TEO=y
 CONFIG_ARM_U8500_CPUIDLE=y
 CONFIG_VFP=y
 CONFIG_NEON=y

-- 
2.56.0


