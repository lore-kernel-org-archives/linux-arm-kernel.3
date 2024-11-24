Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB1E668AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=do6ZEZ1ZVjVIUeOmz7IRlLSKkAvZ8bDMezzm2euAbQk=; b=dgCDAgC+LVb6/oLV3yTVp9na6S
	quwR78wXZxTg7hXenhkKrpE38dqhrv+K6K+MCeXK7TvNY452oZ9mj8OwqD4GxCMBqK6/edlANDsgq
	HJPbf6gH03GxOVJ5sTyGGfx+66rdLB/gg9q+0/Q1lTwV6xlfCX/iGj7uUNE98GbAq5y8nH9ixkm6i
	pfbDCcXeJhu4BE1Y/m+jPCI172F8FuKXlUeue8pYAuHPj0aCEuSc70eBoB6eZYmwXNYdBN+1nOdPA
	kCccQHKpbPr6DDiG5h2cl/n+HbVpFMeIrMek2mfz5JbRqNyLsgU3VDJ8Q+D4NuOWrJcpQxlyJbtjx
	sn7O49Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBuk-00000005jpD-3I8C;
	Sun, 24 Nov 2024 12:40:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBtg-00000005jWT-3q9S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:39:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A880FA40A0D;
	Sun, 24 Nov 2024 12:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D896C4CED3;
	Sun, 24 Nov 2024 12:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732451967;
	bh=isrIzBVpqEHXAWK+7dtrVVpLZiim/bjAv0AHGXA4NBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IfQQ9yt964FKdiiwgrC/Ff4WMo2r9YrEV5pig1XYQbjRRJljvKjiMf98JfNxghiYZ
	 dKNfSSRgkNRBKNIpXKlaBxdRRw6WwdxiGHkARCCHocEzpAQ2oOtecNCq88xM6DVQ7m
	 B15LDjd5A9Ajy5TkQswJSBegCftsf/CQRWhhjBZ0kchHtTP/X3vHcsRb3Ds9BLrLBB
	 //jee0bfqhtQg0irySoX4u66RBHeWT6VWqPtwUPOBTzNI20X2vfwTGDi1S9TZpWSS1
	 9N4iFR3QYudzSQFUBcYIX9A8RXhFoWO7FWFX4cmqVhwtN2fyA0uuzekXIdIBOrghqJ
	 eo7Tjwtp64Exg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	will@kernel.org,
	shuah@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 05/19] kselftest/arm64: Log fp-stress child startup errors to stdout
Date: Sun, 24 Nov 2024 07:38:40 -0500
Message-ID: <20241124123912.3335344-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124123912.3335344-1-sashal@kernel.org>
References: <20241124123912.3335344-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_043929_091410_2A008C51 
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit dca93d29845dfed60910ba13dbfb6ae6a0e19f6d ]

Currently if we encounter an error between fork() and exec() of a child
process we log the error to stderr. This means that the errors don't get
annotated with the child information which makes diagnostics harder and
means that if we miss the exit signal from the child we can deadlock
waiting for output from the child. Improve robustness and output quality
by logging to stdout instead.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20241023-arm64-fp-stress-exec-fail-v1-1-ee3c62932c15@kernel.org
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index faac24bdefeb9..80f22789504d6 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -79,7 +79,7 @@ static void child_start(struct child_data *child, const char *program)
 		 */
 		ret = dup2(pipefd[1], 1);
 		if (ret == -1) {
-			fprintf(stderr, "dup2() %d\n", errno);
+			printf("dup2() %d\n", errno);
 			exit(EXIT_FAILURE);
 		}
 
@@ -89,7 +89,7 @@ static void child_start(struct child_data *child, const char *program)
 		 */
 		ret = dup2(startup_pipe[0], 3);
 		if (ret == -1) {
-			fprintf(stderr, "dup2() %d\n", errno);
+			printf("dup2() %d\n", errno);
 			exit(EXIT_FAILURE);
 		}
 
@@ -107,16 +107,15 @@ static void child_start(struct child_data *child, const char *program)
 		 */
 		ret = read(3, &i, sizeof(i));
 		if (ret < 0)
-			fprintf(stderr, "read(startp pipe) failed: %s (%d)\n",
-				strerror(errno), errno);
+			printf("read(startp pipe) failed: %s (%d)\n",
+			       strerror(errno), errno);
 		if (ret > 0)
-			fprintf(stderr, "%d bytes of data on startup pipe\n",
-				ret);
+			printf("%d bytes of data on startup pipe\n", ret);
 		close(3);
 
 		ret = execl(program, program, NULL);
-		fprintf(stderr, "execl(%s) failed: %d (%s)\n",
-			program, errno, strerror(errno));
+		printf("execl(%s) failed: %d (%s)\n",
+		       program, errno, strerror(errno));
 
 		exit(EXIT_FAILURE);
 	} else {
-- 
2.43.0


