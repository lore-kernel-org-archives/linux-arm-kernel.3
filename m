Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CED7606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V31tqPzf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbXpPm5C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vq4JuVxoqkxA9F+v+9IV2As8ofAyqqySaullwNNCypg=; b=V31tqPzfIobBsih6DbvrHVvPJD
	zS+Mku3ejbYbqwaBoxGdTklkB9ctH51+X7ef8ZbCqtRh+PgWTsIBfkafxww+8kA9/XcAZnNkQ5VO4
	kxWOaQd31N49QRMWUS7T9jhdEWpyoWj0jf5Lb+eqCmoA/7sxgXQg8aG4PAir76+Fj0qK4FTQLHmdT
	iHeRfsd5ts9SZapM44oyvjR4r5fmX9LtYhRLUPj6goyKQ9+lSXKU+SvhPJZC5HkdxrKToAxnXKmaz
	aHcywlBHoJfFmRpGIX3ZZqxu+ZwwH+6ljMy7DXu0KL2y4MquPlVv7Q7rkf95f0HZaxSCloEwUIrie
	laJWo0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWUO-00000004izm-0mSw;
	Wed, 04 Nov 2026 08:37:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWUN-00000004izd-0aus
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:36:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88A3E4047C;
	Wed,  4 Nov 2026 08:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2D41F000C1;
	Wed,  4 Nov 2026 08:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793781418;
	bh=vq4JuVxoqkxA9F+v+9IV2As8ofAyqqySaullwNNCypg=;
	h=From:To:Cc:Subject:Date;
	b=VbXpPm5CoeAhPzBkkUWRqoUDpVFVq/Hi1wRWElnu/eVCoI3XKjHwFw5IMMqBxZQf8
	 84DXri7Cy3bT7WrjYunlmv7owV4/w6YM0BYrBNJejK+H007sniJVNoZYNZ0/zvsTvJ
	 zpuAKKRwU1CxgLA/XiXJ5Fl1uTzY/q+e2Q2ct9mni3HURCLZA9VIBMOsmdr5vFPvQX
	 aX0Sa7hwoPMHLhsIfnrLGtSZQKeszu2AHY7sKuV86lWEcsNskImdbISn/PeE5JvuHC
	 lqciD4OJ3wtpmL+Yud2q90Gp75Ps4S7FhTVizmJcaSOJJxTC0PDpb24Zxof2MuNT1y
	 Kg20BIwzZ2vww==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: cacheinfo: Simplify init_cache_level()
Date: Wed,  4 Nov 2026 09:36:31 +0100
Message-ID: <20261104083632.65715-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=blum@kernel.org; h=from:subject; bh=UoK9h6KJR/wF0yUKaEQGakSIJkSGzR2FJ4H5aoUaFX4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmv3k0wKJYv75DlbzAs0P74sm/Z75MJTl+VYo8bHVm19 e6HicLVHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRBacZGdZN/PZlVqBvIm/o ximnUjLqF0UvKd5gGbF4p1L6j+23vl1hZFj4+mhBwt/j5g8k+Cb4Lot/O3WNolJArvu1XdU3dz7 UfMYJAA==
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

acpi_get_cache_info() already sets fw_level to 0 on failure, so drop the
redundant check and the manual assignment.

Use unsigned int for fw_level to match the expected type, and remove the
now-unused local ret variable.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/cacheinfo.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
index 309942b06c5b..881131fb4934 100644
--- a/arch/arm64/kernel/cacheinfo.c
+++ b/arch/arm64/kernel/cacheinfo.c
@@ -67,19 +67,15 @@ int early_cache_level(unsigned int cpu)
 
 int init_cache_level(unsigned int cpu)
 {
-	unsigned int level, leaves;
-	int fw_level, ret;
+	unsigned int level, leaves, fw_level;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 
 	detect_cache_level(&level, &leaves);
 
-	if (acpi_disabled) {
+	if (acpi_disabled)
 		fw_level = of_find_last_cache_level(cpu);
-	} else {
-		ret = acpi_get_cache_info(cpu, &fw_level, NULL);
-		if (ret < 0)
-			fw_level = 0;
-	}
+	else
+		acpi_get_cache_info(cpu, &fw_level, NULL);
 
 	if (level < fw_level) {
 		/*

