Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECB3E668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCwEVVMjf4vfls3dzhmlGHA6SDCk4LqFaoh5ssoskxI=; b=nZDaYjgdnxtM816HlqwaZl4OmZ
	KFDb83ABGEITIKr7aWg7gXgLPCtu7NNlHtx2z0qIyQDDDyJJ40NTw92qKrLElSk0hoTy2Jjpk6yZ7
	trIDNqlQM8nxc2d3lvq1L+XtudS7kwE0gLn3564aAbyi26OyYW+5VgXwwnfE4mhPT30P4DZLDst8r
	zyJ02Pjb+RDGEd8l8lu4riBpx8esvXRXnDfpwRSV5SfpA5y7/XL0WZZJ+VsK6QS0ey4/0XMBRyQ8O
	9PgJtjTpgiAjFqy4yk+IKAOV6D1bPmz1XR0Vd57uekz0jniUEPUVc9dmJuEDPBjq0b2N3OZ4cHWiU
	YglAVQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC36-00000005mBF-2sUP;
	Sun, 24 Nov 2024 12:49:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBvn-00000005k6j-47Eb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:41:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2AF3CA4020A;
	Sun, 24 Nov 2024 12:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF496C4CECC;
	Sun, 24 Nov 2024 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452098;
	bh=Ddb741SszSH6SeCJvr4j4w0DO0K0H8EoTGj/hXFKhHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eoLdtwmhdnKaFS6UBSCdJTn3sGRtOvaR3mStrLcz7uviqtcbxcf+JMAVWXiR7OnfQ
	 eukLyUjqq38Ho0TC+23VTxf59vDIYpD6ChZ+Kk6K2RT02vuD7G7RC3NYr96Qszrwtl
	 ulgYdhmFLNGyyhYRUdGuDvadnhe1WefHsA+9KdcC8KhLG90Z5XYtWU0+7Rnjrcunsy
	 LpjftbYw0Uz6+20jvNfYbH/poduigZw6OwX/fGDMFsn21NlgZ7ORn/tH8A2r40JAkI
	 fV7LfyNhviQLfbEWvU1m47QEYj3wPZRu3kPLl9FQRcnejNnPlDkV3HMPww1mi5DT7X
	 PmWgSNcMjoDsg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	will@kernel.org,
	shuah@kernel.org,
	mark.rutland@arm.com,
	thiago.bauermann@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 6/7] kselftest/arm64: Corrupt P0 in the irritator when testing SSVE
Date: Sun, 24 Nov 2024 07:41:17 -0500
Message-ID: <20241124124126.3336691-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124126.3336691-1-sashal@kernel.org>
References: <20241124124126.3336691-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_044140_109163_A364EAFE 
X-CRM114-Status: GOOD (  10.27  )
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 3e360ef0c0a1fb6ce9a302e40b8057c41ba8a9d2 ]

When building for streaming SVE the irritator for SVE skips updates of both
P0 and FFR. While FFR is skipped since it might not be present there is no
reason to skip corrupting P0 so switch to an instruction valid in streaming
mode and move the ifdef.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20241107-arm64-fp-stress-irritator-v2-3-c4b9622e36ee@kernel.org
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-test.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 2a18cb4c528c5..b9648daeabbb1 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -304,9 +304,9 @@ function irritator_handler
 	movi	v0.8b, #1
 	movi	v9.16b, #2
 	movi	v31.8b, #3
-#ifndef SSVE
 	// And P0
-	rdffr	p0.b
+	ptrue	p0.d
+#ifndef SSVE
 	// And FFR
 	wrffr	p15.b
 #endif
-- 
2.43.0


