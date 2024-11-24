Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F1FE668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp6kSFmGF5tmnPSYnwEPHJ/RCt32+krVITCZB6Kx224=; b=WSNs0nksfK//2vSSzc1EqRwDxI
	5Pupy7hz0qnapPJnNtPHgtT1QVMBQy2EjJPc14giFUxa65sXieONPwrirjwSMP86Lwke12wGX9psV
	PjsUmWtPgCE2xhBAPcdk5Vwvv8v1h5HjJuEVYsbxBWxVcZYtyocTHlq4n9z24MTkPw7JG2kJwyv6c
	RkjbOuWo/waJd4haWqu5+TSWEkOphPChfY6WEf6eNNo39mkdwo3ZpiRVfZDWg9qrjh5HeAYoFYHip
	BOYtOaRejOJe1NzRXLBAH3MG0eteGi/ivr8+aTq4fgfyeem+zJurGadVjje9MtrL35+LJKzWxflno
	Ililn16g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC1F-00000005leC-2n5c;
	Sun, 24 Nov 2024 12:47:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBvQ-00000005k0A-0R6E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:41:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC6215C4117;
	Sun, 24 Nov 2024 12:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1921FC4CECC;
	Sun, 24 Nov 2024 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452075;
	bh=yxGeVVGri2wpZ+0iD8qGbO6TdcZZxy4i4MTqaAO6Gx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iDOeUL0MiivdrYj2uX7NvEXEQrHwUBwx2SLg7ZAOy+9Hp2HbnO3XTff3nCyiKY211
	 fYyHk8DQ0JEpcGjlu2dKadmgWAShPn6EXaYE2RDMHg/IRHzc5CQsp6tms9F90vxJ8G
	 ibPJd7OGkx5LCxkpjSThSKe/Asl/jxPyvW0hermE8dAFvl+8ZlrTkGHT0AnYH46AMO
	 GLFgIeiLrhZuurN9v0O0rjdpLz/7eLYXH+FDbL4h762Zhpzj9O9BJgCGHtkV6BR3xB
	 B8QBaS5qrh/dafnWSBFxMDvSgpccOnrc53HJVrGqQe4HiXR9eFUgy3OhwKPnOZijm4
	 GLxhLnwm223Tg==
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
Subject: [PATCH AUTOSEL 6.6 8/9] kselftest/arm64: Corrupt P0 in the irritator when testing SSVE
Date: Sun, 24 Nov 2024 07:40:46 -0500
Message-ID: <20241124124057.3336453-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124057.3336453-1-sashal@kernel.org>
References: <20241124124057.3336453-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_044116_393129_2D40FCDB 
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
index 4328895dfc876..ff60360a97f80 100644
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


