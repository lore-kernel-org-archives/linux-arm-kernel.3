Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F9B606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0wxXMlNG;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2Ev9q08
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TLGga1XJaEBstF4brRpspjABd42fAO01T3Tfq+b3WRY=; b=0wxXMlNGkF7+HzAy/0W0zgYOma
	FibtlG7CeSUq61J11UQ6UWVOrXPQBd+QrXNcEA09a6DU3p9c1hkxX6VQWaFAX5fRngye3/czP5VJD
	TTFs3IP5VPSxL4wcRleasejBOGlh+VR7krdxpfAA/mKIvra95crAw5XyDDDokNdq0oGLDvIMppJBx
	6sqbuLtKSN5mbJzW07lUrqVL4ct2+BdCTq6Ygwe+eTG6lyx4XW7gQbfSbozRo17Q9OlLaJoy6AF5a
	4DJt/TJbiGDj3I4jH9TsPFpCchUo2Fr0/+58X3NQvGxzMoRz8A0TaWdGFBHfpFldN9BzSVCerzeQI
	iB3v2+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXnd-00000004wYI-2ZBL;
	Wed, 04 Nov 2026 10:00:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXnc-00000004wY8-0HTz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:00:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C56443EB8;
	Wed,  4 Nov 2026 10:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E546D1F00919;
	Wed,  4 Nov 2026 10:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786455;
	bh=TLGga1XJaEBstF4brRpspjABd42fAO01T3Tfq+b3WRY=;
	h=From:To:Cc:Subject:Date;
	b=W2Ev9q08vDAgiRgNTKq5Un4MTwLYES1RVB+l2k5R9G/f+jDIKOGXck7brNysxlGFh
	 2E77lBCeSt3j6p6BmUbOW0XRHAY+0Xh7bKouztiSYawKHtfPHmLcBy5AJ1ZPL0aZKJ
	 mahuY6wwahSnpiqjfRmHYGiR9yDS+USenR929FFlv3aZSPagKN5lnqa/4XssMKAvUS
	 ZKLbgkUggUovr6kXJB4mdVmAcZh1noRKtQ7odm7eJh/PcXZpcYzKvOMaTCZ5Ws5HwD
	 V1mWg1CBFqg8BmXTHdC5IS9pQYK0eGobHf23phDdLXjXYT4AHHEjRcNnpG8BV0q9q6
	 f4aB+hKwAUJZg==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: patching: Use uintptr_t in aarch64_insn_patch_text_nosync()
Date: Wed,  4 Nov 2026 10:59:43 +0100
Message-ID: <20261104095943.97344-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=blum@kernel.org; h=from:subject; bh=ZO7mmyFV27Y400PIzYZNqMgtJo/xFwDj+vG/tyF0qNI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmvmfhLb1xWOha/ZM3zMO2AJ5M/R7vNTZj7nP+qWIVI5 /bdGyWPdpSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBENNYwMnSePBEj9boz8E/T j3N7j9b7zpgdu1nO+8TjlSkG050mX7Nm+KdxumL2+ZItqcEe7lud9wodFXcqvbV5vf3taDO/KT7 bbjACAA==
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

Use uintptr_t for tp instead of casting it multiple times and pass addr
directly to aarch64_insn_write().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/patching.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 09f019c6547a..24333419a8f1 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -178,17 +178,16 @@ noinstr void *aarch64_insn_set(void *dst, u32 insn, size_t len)
 
 int __kprobes aarch64_insn_patch_text_nosync(void *addr, u32 insn)
 {
-	u32 *tp = addr;
+	uintptr_t tp = (uintptr_t)addr;
 	int ret;
 
 	/* A64 instructions must be word aligned */
-	if ((uintptr_t)tp & 0x3)
+	if (tp & 0x3)
 		return -EINVAL;
 
-	ret = aarch64_insn_write(tp, insn);
+	ret = aarch64_insn_write(addr, insn);
 	if (ret == 0)
-		caches_clean_inval_pou((uintptr_t)tp,
-				     (uintptr_t)tp + AARCH64_INSN_SIZE);
+		caches_clean_inval_pou(tp, tp + AARCH64_INSN_SIZE);
 
 	return ret;
 }

