Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70515606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bYWSb4v2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=owvbKBV8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jCYK5v4XQQfPSvL9dOgHNb6hBySDbFEoE4OZWzTPLKA=; b=bYWSb4v2gaCCyZ9q9FNaKw1czP
	MX+zhthlTKTnh1HbgGFtk7nk0tUGhIqCxjJaiIl+GFRII7TXpRmEo7/Fa6Fd6xpSLTWRm/wrLti+X
	ofPzANmcaoTmRxeEqiP0mY6UKcacpGW7zzwWllckW2QlmJ2qRIba8y0z3TQXX6Phq+0iPbFENGDCh
	2r8K8M+u/4hI4iAYHpdELPIN0n1UCJC4vDVvi/+lpPFHqLOOEfiHH5QrjLdEyiKG9vdx2uj37xaJB
	H90dIJEOE6IL49YGbaA8Isej010J8Z5kAUO8eYDqrgCwAxGLTfE8qG55emMwAUjd8U5TufPmKoM6B
	mYrS3tjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkWP-0000000BVil-1vMV;
	Fri, 30 Oct 2026 11:11:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkWO-0000000BVie-2qlG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:11:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70E8740249;
	Fri, 30 Oct 2026 11:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C661F000C1;
	Fri, 30 Oct 2026 11:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358704;
	bh=jCYK5v4XQQfPSvL9dOgHNb6hBySDbFEoE4OZWzTPLKA=;
	h=From:To:Cc:Subject:Date;
	b=owvbKBV8NNXg7Lj9OtB7rK6tEk1LNVkciZy7BwCanHi5LSGeiA6x2gLKueQ8c2i23
	 XhI48ioSIeiVvmL+11wmp2ExvH1DuoXGQ33RfoEH+ePUnSxc9eGIJmTiP8g0vfp2e7
	 g0A2cHxY0dnFa90IRqxP5TtvJdPAt+FRiPvrXkas7yFCfDRSclAQsdj+iWPaCTljwZ
	 7eE1xA58ufSFejivZ+AscUFazYJcy6BHY1bv8R6CXxeHtvzkibhZvfsMgmNezYhEy+
	 pzuPqXw4pFAzVPk1oJeLqyjsFglnFd13MdV3wBpY/C3homtUiRykPmHIj6qHCWG7NA
	 eM3p243lOyTqg==
From: Thorsten Blum <blum@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	virtualization@lists.linux.dev,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: paravirt: Mark steal_acc as __initdata
Date: Fri, 30 Oct 2026 12:10:55 +0100
Message-ID: <20261030111053.114812-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=736; i=blum@kernel.org; h=from:subject; bh=kuEW+4WESnxfN5I5tznjdeP1HfZYuuQX1do2/C1S0eo=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlPqm0VPQqnHZBard7GLrtw8+3q400zE7/MkMoVXCPFF 3bn8unPHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRlTcYGeamXv+0SXefoXNe cF7q355Up/1Kvgsv/5r6WXfZrT+757gy/C8WC7BiXPSuhiOat36OxHEfhfkKk6OvFJy7kea4pPW KFyMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
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

steal_acc is only written by parse_no_stealacc() and read by
pv_time_init(), both of which are __init functions.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/paravirt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index 572efb96b23f..df2e90092f47 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -31,7 +31,7 @@ struct pv_time_stolen_time_region {
 
 static DEFINE_PER_CPU(struct pv_time_stolen_time_region, stolen_time_region);
 
-static bool steal_acc = true;
+static bool steal_acc __initdata = true;
 static int __init parse_no_stealacc(char *arg)
 {
 	steal_acc = false;

