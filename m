Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021E1E668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLMmg5WEiXr2CPRS2F8g/mFfQwxOTqUNSyKu3SV6seo=; b=LikXzEe0j1A2/+y+EJlex6TbcA
	v2PNfWhusosyCKjAX60FQb+icnmR7w37eLHJsIT2FGd4tPpMRk3PL2PvvBpqXa2l6gDguLsYCAqGi
	ns6fXybFlYd0TDemzHg1Qht12oNk4jEryw2II1EtSmpavRQoEIKeP+soX3GqeBtFp5rpa//CuhzQW
	dUYs2lxyp3yzvmlb3kMntBJ4HJd6GWS0+mKdFjdCtMdlEZj6b9nvaIVxvJO1GVcwbxdb88LanQ6Kk
	LmfejUtHHHN+Mk1IA4VBQWDwNaKZuqWae+RJ1ynvVuAiZ10BQvCOLMmvuH/Ia5MLAJM6GUXWKSknQ
	E++zaLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBvh-00000005k4A-0CPP;
	Sun, 24 Nov 2024 12:41:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBu1-00000005jbe-216i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:39:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BFE45C499A;
	Sun, 24 Nov 2024 12:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB52C4CED1;
	Sun, 24 Nov 2024 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732451988;
	bh=81Ni8xHtPktgGt2jnb4WQsNexyhc+xoT9qdsR8aq7bg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CF1aBSc42nqUpGBvyqGjqOlECbnvxRnqNdOEuxeuWAO/RDJclDD7+ONwKOx5zksbf
	 6FXQBlY0aY0Y2hDMkkFisWvuhkDvGn0ZCkhn+oMLlQHRqGrEE0jzqn5SiDIJKunqaz
	 FzjuqXOEKMSaZ8YVDNHE95/t3xg2WxWbe9paD2mcdOGSpq87vDr8HFNVPgoY3m8Kob
	 sBH2TUIdAI0RJxg11Vg/AN4R5ybBV0oNWH+d1ZGLH1Un6/7U2awh4vJrTQiarf7WN8
	 2JRDjOcqYlPp9mW+tZ/hFQJpoNIFIII0Wqwk/pMfnYYRhJYlEppIazxiiQ7Xpbmntb
	 X5kujCx4q4//Q==
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
Subject: [PATCH AUTOSEL 6.12 17/19] kselftest/arm64: Corrupt P0 in the irritator when testing SSVE
Date: Sun, 24 Nov 2024 07:38:52 -0500
Message-ID: <20241124123912.3335344-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124123912.3335344-1-sashal@kernel.org>
References: <20241124123912.3335344-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_043949_558706_D96A7D75 
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
index fff60e2a25add..4fcb492aee1fb 100644
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


